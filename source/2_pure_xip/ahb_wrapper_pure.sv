`timescale 1ns / 1ps

module ahb_wrapper (
    // AHB-Lite Interface
    input  logic        HCLK, HRESETn, HSEL, HREADY,
    input  logic [31:0] HADDR, HWDATA, // HWDATA is here for bus standard, but ignored internally
    input  logic [1:0]  HTRANS,
    input  logic        HWRITE,
    output logic [31:0] HRDATA,
    output logic        HREADYOUT,
    output logic [1:0]  HRESP,
  
    // QSPI Interface
    output logic        qspi_cs_n, qspi_clk, qspi_data_oen,
    output logic [3:0]  qspi_data_out,
    input  logic [3:0]  qspi_data_in
);

    logic pending, fsm_done, fsm_done_q, fsm_start;
    logic [31:0] a_reg, ahb_rdata_reg, fsm_rx;

    assign HRESP = 2'b00;

    always_ff @(posedge HCLK or negedge HRESETn) begin
        if (!HRESETn) begin
            pending       <= 0;
            a_reg         <= 0;  
            fsm_done_q    <= 0; 
            fsm_start     <= 0; 
            ahb_rdata_reg <= 32'h0;
        end else begin
            fsm_done_q <= fsm_done;
            fsm_start  <= 0;
            
            // 1. Latch Read Data (End of FSM transaction)
            if (fsm_done) begin
                ahb_rdata_reg <= fsm_rx;
            end

            // 2. Latch Address Phase (Handles Cycle 1 AND Pipelined back-to-back)
            // By removing !pending, we guarantee we latch the next address the exact 
            // cycle HREADY goes high, achieving perfect zero-wait-state pipelining.
            if (HSEL && HREADY && HTRANS[1]) begin
                pending   <= 1;
                a_reg     <= HADDR;
                fsm_start <= 1;
            end else if (fsm_done_q) begin
                // If there is no back-to-back sequential transfer, drop pending
                pending   <= 0;
            end
        end
    end

    // HREADYOUT safely holds the bus using the pending logic
    assign HREADYOUT = (pending) ? fsm_done_q : 1'b1;
    
    // Always drive the read data back
    assign HRDATA    = ahb_rdata_reg;

    // Instantiate the Pure XIP FSM instead of the dual-mode one
    qspi_pure_xip u_core (
        .clk         (HCLK), 
        .rst_n       (HRESETn), 
        .start       (fsm_start), 
        .addr_in     (a_reg), 
        
        // NO write_op, NO tx_data, NO tx_pop
        
        .done        (fsm_done), 
        .rx_data     (fsm_rx),
 
        .qspi_cs_n   (qspi_cs_n), 
        .qspi_clk    (qspi_clk),
        .qspi_io_out (qspi_data_out), 
        .qspi_io_oe  (qspi_data_oen), 
        .qspi_io_in  (qspi_data_in)
    );

endmodule
