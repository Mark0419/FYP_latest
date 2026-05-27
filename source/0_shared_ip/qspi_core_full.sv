`timescale 1ns / 1ps

module qspi_fsm (
    input  logic clk, rst_n, start, write_op,
    input  logic [31:0] addr_in, tx_data,
    input  logic tx_empty,
    output logic done, tx_pop,
    output logic qspi_cs_n, qspi_clk, qspi_io_oe,
    output logic [3:0] qspi_io_out,
    output logic [31:0] rx_data,
    input  logic [3:0] qspi_io_in
);

    typedef enum logic [3:0] {IDLE, WREN, WREN_GAP, CMD, ADDR, MODE_DUMMY, DATA, RECOVERY, DONE_ST} state_t;
    state_t state, next;
    logic [5:0] cnt; 
    logic [31:0] sreg, rx_reg;
    
    // The XIP State Tracker
    logic xip_active; 

    assign rx_data = rx_reg;
    assign tx_pop = 1'b0; 

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE; cnt <= 0; rx_reg <= 0; sreg <= 0; xip_active <= 1'b0;
        end else begin
            state <= next;
            cnt <= (state != next) ? 0 : cnt + 1;
            
            case (state)
                IDLE: if (start) begin
                    if (write_op) begin
                        sreg <= {8'h06, 24'h0}; // Load WREN
                        xip_active <= 1'b0;     // Writes ALWAYS break XIP mode
                    end else if (xip_active) begin
                        sreg <= addr_in;        // XIP Bypass: Load ADDR directly
                    end else begin
                        sreg <= {8'hEC, 24'h0}; // Standard Read: Load CMD
                    end
                end
                
                WREN: sreg <= {sreg[30:0], 1'b0}; // Shift 1 bit
                WREN_GAP: if (cnt == 1) sreg <= {8'h34, 24'h0}; // Load Quad Page Program
                
                CMD:  begin
                    if (cnt == 7) sreg <= addr_in; 
                    else sreg <= {sreg[30:0], 1'b0}; // Shift 1 bit
                end
                
                ADDR: begin
                    // If write, load tx_data. If read, load Mode bits (0xA5 keeps XIP active)
                    if (cnt == 7) sreg <= write_op ? tx_data : {8'hA5, 24'h0}; 
                    else sreg <= {sreg[27:0], 4'h0}; // Shift 4 bits
                end
                
                MODE_DUMMY: begin
                    sreg <= {sreg[27:0], 4'h0}; // Shift 4 bits (Drive mode, then 0s for dummy)
                end
                
                DATA: begin
                    if (!write_op) begin
                        rx_reg <= {rx_reg[27:0], qspi_io_in};
                        if (cnt == 7) xip_active <= 1'b1; // Lock into XIP after successful read
                    end else begin
                        sreg <= {sreg[27:0], 4'h0};
                    end
                end
                RECOVERY, DONE_ST: sreg <= 32'b0; 
            endcase
        end
    end

    // --- Dynamic Next-State Routing ---
    always_comb begin
        next = state;
        case (state)
            IDLE: begin
                if (start) begin
                    if (write_op) next = WREN;
                    else if (xip_active) next = ADDR; // THE XIP BYPASS
                    else next = CMD;
                end
            end
            WREN:       if (cnt == 7) next = WREN_GAP; 
            WREN_GAP:   if (cnt == 3) next = CMD; 
            
            CMD:        if (cnt == 7) next = ADDR; 
            ADDR:       if (cnt == 7) next = write_op ? DATA : MODE_DUMMY; 
            
            MODE_DUMMY: if (cnt == 5) next = DATA; // 2 clocks Mode + 4 clocks Dummy
            
            DATA:       if (cnt == 7) next = RECOVERY; 
            RECOVERY:   if (cnt == 3) next = DONE_ST; 
            DONE_ST:    next = IDLE;
            default:    next = IDLE;
        endcase
    end

    // --- Timing & Pin Logic ---
    logic clk_en;
    assign clk_en = (state == WREN || state == CMD || state == ADDR || state == MODE_DUMMY || state == DATA);
    assign qspi_clk = clk_en ? ~clk : 1'b0;

    assign qspi_cs_n   = (state == IDLE || state == WREN_GAP || state == RECOVERY || state == DONE_ST);
    assign done        = (state == DONE_ST);
    
    assign qspi_io_oe  = (state == WREN || state == CMD || state == ADDR || (state == MODE_DUMMY && cnt < 2) || (state == DATA && write_op));

    always_comb begin
        if (!qspi_io_oe) begin
            qspi_io_out = 4'b0;
        end else if (state == WREN || state == CMD) begin
            qspi_io_out = {3'b0, sreg[31]}; // 1-bit SPI
        end else begin
            qspi_io_out = sreg[31:28];      // 4-bit QSPI
        end
    end

endmodule
