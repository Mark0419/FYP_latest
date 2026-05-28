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

    typedef enum logic [3:0] {IDLE, WREN, WREN_CS, CMD, ADDR, MODE, DUMMY, DATA, PROG, DONE_ST} state_t;
    state_t state, next;
    
    logic [5:0] cnt;
    logic [31:0] sreg, rx_reg;
    logic [7:0] cmd_latched;
    logic xip_active;
    
    // Keep synthesizable RTL free of X/Z comparisons; testbench flash models
    // should drive known values for gate-level simulation.
    wire [3:0] clean_io_in;
    assign clean_io_in = qspi_io_in;

    assign rx_data = rx_reg;
    assign tx_pop  = (state == PROG && cnt == 0) ? 1'b1 : 1'b0;

    // --- Sequential Logic ---
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE; 
            cnt <= 0; 
            rx_reg <= 0; 
            sreg <= 0; 
            cmd_latched <= 0;
            xip_active <= 1'b0;
            qspi_cs_n <= 1'b1;
        end else begin
            state <= next;
            cnt <= (state != next) ? 0 : cnt + 1;
            
            // Glitch-Free Registered Chip Select
            qspi_cs_n <= (next == IDLE || next == WREN_CS || next == PROG || next == DONE_ST);
            
            case (state)
                IDLE: begin
                    if (start) begin
                        if (write_op) begin 
                            sreg <= 32'h06000000; 
                            cmd_latched <= 8'h06; 
                            xip_active <= 1'b0; // CPU forces Write: Drop XIP lock
                        end else if (xip_active) begin 
                            sreg <= addr_in;
                            cmd_latched <= 8'hEC; // Read while XIP locked
                        end else begin 
                            sreg <= 32'hEC000000;
                            cmd_latched <= 8'hEC; // Read normally
                        end
                    end
                end
                
                WREN: sreg <= {sreg[30:0], 1'b0};
                
                WREN_CS: begin
                    if (cnt == 4) begin
                        if (tx_data == 32'hFFFFFFFF) begin
                             cmd_latched <= 8'h21; 
                             sreg <= 32'h21000000; 
                        end else begin
                             cmd_latched <= 8'h34; 
                             sreg <= 32'h34000000; 
                        end
                    end
                end
                
                CMD: begin
                    if (cnt == 7) sreg <= addr_in; 
                    else sreg <= {sreg[30:0], 1'b0};
                end
                
                ADDR: begin
                    if (cnt == 7) sreg <= (cmd_latched == 8'hEC) ? 32'hA5000000 : tx_data;
                    else sreg <= {sreg[27:0], 4'h0}; 
                end
                
                MODE:  sreg <= {sreg[27:0], 4'h0}; 
                DUMMY: sreg <= {sreg[27:0], 4'h0}; 
                
                DATA: begin
                    if (cmd_latched == 8'hEC) begin
                        rx_reg <= {rx_reg[27:0], clean_io_in};
                        if (cnt == 7) xip_active <= 1'b1; // Lock XIP mode
                    end else begin
                        sreg <= {sreg[27:0], 4'h0};
                    end
                end
            endcase
        end
    end

    // --- Next State Logic ---
    always_comb begin
        next = state;
        case (state)
            IDLE: begin
                if (start) begin
                    next = (write_op) ? WREN : (xip_active ? ADDR : CMD);
                end
            end
            
            WREN:    if (cnt == 7) next = WREN_CS;
            WREN_CS: if (cnt == 10) next = CMD; 
            CMD:     if (cnt == 7) next = ADDR;
            
            ADDR:    begin
                         if (cnt == 7) begin
                             if (cmd_latched == 8'hEC) next = MODE;
                             else if (cmd_latched == 8'h21) next = PROG; // ERASE skips DATA
                             else next = DATA; // WRITE goes to DATA
                         end
                     end
                     
            MODE:    if (cnt == 1) next = DUMMY; 
            DUMMY:   if (cnt == 3) next = DATA;  
            
            DATA:    begin
                         if (cnt == 7) next = (cmd_latched == 8'hEC) ? DONE_ST : PROG;
                     end
                     
            PROG:    if (cnt == 3) next = DONE_ST; 
            DONE_ST: next = IDLE;
            default: next = IDLE;
        endcase
    end

    // --- Output Logic ---
    assign qspi_clk = (state == WREN || state == CMD || state == ADDR || state == MODE || state == DUMMY || state == DATA) ? ~clk : 1'b0;
    
    assign done = (state == DONE_ST);
    
    assign qspi_io_oe = (state == WREN || state == CMD || state == ADDR || state == MODE || (state == DATA && cmd_latched != 8'hEC));
    
    always_comb begin
        if (!qspi_io_oe) qspi_io_out = 4'b0;
        else if (state == WREN || state == CMD) qspi_io_out = {3'b0, sreg[31]};
        else qspi_io_out = sreg[31:28];
    end

endmodule
