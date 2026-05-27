`timescale 1ns / 1ps

module ahb_wrapper (
    // AHB-Lite Interface
    input  logic        HCLK, HRESETn, HSEL, HREADY,
    input  logic [31:0] HADDR, HWDATA,
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
    logic [31:0] a_reg, ahb_wdata_reg, ahb_rdata_reg, fsm_rx;
    logic w_reg;

    assign HRESP = 2'b00;

    always_ff @(posedge HCLK or negedge HRESETn) begin
        if (!HRESETn) begin
            pending <= 0; a_reg <= 0; w_reg <= 0; 
            fsm_done_q <= 0; fsm_start <= 0; 
            ahb_rdata_reg <= 32'h0; ahb_wdata_reg <= 32'h0;
        end else begin
            fsm_done_q <= fsm_done;
            
            // 1. AHB Pipeline Address Latch
            // PIPELINE FIX: If HREADY is 1, the bus is advancing. 
            // If HSEL is also 1, the CPU is starting a NEW back-to-back transaction.
            if (HSEL && HREADY && HTRANS[1]) begin
                pending   <= 1;
                a_reg     <= HADDR;
                w_reg     <= HWRITE;
                fsm_start <= 1; 
            end else if (fsm_done_q) begin
                // Clear pending ONLY if a new transaction isn't starting this cycle
                pending   <= 0;
                fsm_start <= 0;
            end else begin
                fsm_start <= 0;
            end

            // 2. AHB Pipeline Data Latch (Cycle N+1)
            // 'fsm_start' acts as a perfect 1-cycle delay from the Address Phase.
            if (fsm_start && w_reg) begin
                ahb_wdata_reg <= HWDATA;
            end

            // 3. Read Data Return
            if (fsm_done && !w_reg) begin
                ahb_rdata_reg <= fsm_rx;
            end
        end
    end

    // HREADYOUT holds the bus hostage (0) while pending, unless the FSM is done
    assign HREADYOUT = (pending) ? fsm_done_q : 1'b1;
    assign HRDATA    = (!w_reg) ? ahb_rdata_reg : 32'h0;

    // --- FSM Instantiation ---
    qspi_fsm u_core (
        .clk(HCLK), .rst_n(HRESETn), .start(fsm_start), .addr_in(a_reg), .write_op(w_reg),
        .done(fsm_done), .tx_data(ahb_wdata_reg), .tx_empty(1'b0), .tx_pop(),
        .rx_data(fsm_rx),
        .qspi_cs_n(qspi_cs_n), .qspi_clk(qspi_clk),
        .qspi_io_out(qspi_data_out), .qspi_io_oe(qspi_data_oen), .qspi_io_in(qspi_data_in)
    );

endmodule
