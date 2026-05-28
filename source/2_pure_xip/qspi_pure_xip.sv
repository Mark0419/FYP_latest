`timescale 1ns / 1ps

module qspi_pure_xip (
    input  logic clk, rst_n, start,
    input  logic [31:0] addr_in,
    output logic done, 
    output logic qspi_cs_n, qspi_clk, qspi_io_oe,
    output logic [3:0] qspi_io_out,
    output logic [31:0] rx_data,
    input  logic [3:0] qspi_io_in
);

    // Simplified FSM: All Write/Erase states have been removed
    typedef enum logic [2:0] {IDLE, CMD, ADDR, MODE, DUMMY, DATA, DONE_ST} state_t;
    state_t state, next;
    
    logic [5:0] cnt;
    logic [31:0] sreg, rx_reg;
    logic xip_active;
    
    // Keep synthesizable RTL free of X/Z comparisons; testbench flash models
    // should drive known values for gate-level simulation.
    wire [3:0] clean_io_in;
    assign clean_io_in = qspi_io_in;

    assign rx_data = rx_reg;

    // =========================================================================
    // SEQUENTIAL LOGIC
    // =========================================================================
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE; 
            cnt <= 0; 
            rx_reg <= 0; 
            sreg <= 0; 
            xip_active <= 1'b0;
            qspi_cs_n <= 1'b1;
        end else begin
            state <= next;
            cnt <= (state != next) ? 0 : cnt + 1;
            
            // Chip Select logic is much simpler now
            qspi_cs_n <= (next == IDLE || next == DONE_ST);
            
            case (state)
                IDLE: begin
                    if (start) begin
                        if (xip_active) begin 
                            sreg <= addr_in; // Already in XIP mode, send address directly
                        end else begin 
                            sreg <= 32'hEC000000; // First boot, must send 0xEC command
                        end
                    end
                end
                
                CMD: begin
                    if (cnt == 7) sreg <= addr_in; 
                    else sreg <= {sreg[30:0], 1'b0};
                end
                
                ADDR: begin
                    if (cnt == 7) sreg <= 32'hA5000000; // Always send A5 to maintain XIP lock
                    else sreg <= {sreg[27:0], 4'h0}; 
                end
                
                MODE:  sreg <= {sreg[27:0], 4'h0}; 
                DUMMY: sreg <= {sreg[27:0], 4'h0}; 
                
                DATA: begin
                    rx_reg <= {rx_reg[27:0], clean_io_in}; // Sole purpose: capture data
                    if (cnt == 7) xip_active <= 1'b1;      // Permanently lock XIP after first read
                end
            endcase
        end
    end

    // =========================================================================
    // COMBINATIONAL LOGIC
    // =========================================================================
    always_comb begin
        next = state;
        case (state)
            IDLE:    if (start) next = xip_active ? ADDR : CMD;
            CMD:     if (cnt == 7) next = ADDR;
            ADDR:    if (cnt == 7) next = MODE;
            MODE:    if (cnt == 1) next = DUMMY; 
            DUMMY:   if (cnt == 3) next = DATA;  
            DATA:    if (cnt == 7) next = DONE_ST;
            DONE_ST: next = IDLE;
            default: next = IDLE;
        endcase
    end

    // =========================================================================
    // OUTPUT LOGIC
    // =========================================================================
    assign qspi_clk = (state == CMD || state == ADDR || state == MODE || state == DUMMY || state == DATA) ? ~clk : 1'b0;
    
    assign done = (state == DONE_ST);
    
    // Output Enable is strictly for commands and addresses. Forced off during DATA (read-only).
    assign qspi_io_oe = (state == CMD || state == ADDR || state == MODE);
    
    always_comb begin
        if (!qspi_io_oe) qspi_io_out = 4'b0;
        else if (state == CMD) qspi_io_out = {3'b0, sreg[31]}; // 0xEC uses 1-bit SPI
        else qspi_io_out = sreg[31:28];                        // Address and Mode use 4-bit Quad
    end

endmodule
