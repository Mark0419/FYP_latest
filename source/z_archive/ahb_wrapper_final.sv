`timescale 1ns / 1ps

module ahb_wrapper (
    input  logic        HCLK,
    input  logic        HRESETn,
    input  logic [31:0] HADDR,
    input  logic        HSEL,
    input  logic        HREADY,
    input  logic [1:0]  HTRANS,
    input  logic        HWRITE,
    input  logic [31:0] HWDATA,
    output logic        HREADYOUT,
    output logic [1:0]  HRESP,
    output logic [31:0] HRDATA,
    output logic        qspi_cs_n,
    output logic        qspi_clk,
    output logic [3:0]  qspi_data_out,
    output logic        qspi_data_oen,
    input  logic [3:0]  qspi_data_in
);

    logic ahb_req;
    assign ahb_req = HSEL && HREADY && (HTRANS == 2'b10); 

    logic        tx_push, tx_pop;
    logic [31:0] tx_data_out;
    logic        tx_full, tx_empty;

    logic        rx_push, rx_pop;
    logic [31:0] rx_data_in;
    logic        rx_full, rx_empty;

    sync_fifo #(.DATA_WIDTH(32), .DEPTH(8)) u_tx_fifo (
        .clk(HCLK), .rst_n(HRESETn), .push(tx_push), .pop(tx_pop),
        .data_in(HWDATA), .data_out(tx_data_out), .full(tx_full), .empty(tx_empty)
    );

    sync_fifo #(.DATA_WIDTH(32), .DEPTH(8)) u_rx_fifo (
        .clk(HCLK), .rst_n(HRESETn), .push(rx_push), .pop(rx_pop),
        .data_in(rx_data_in), .data_out(HRDATA), .full(rx_full), .empty(rx_empty)
    );

    // --- AHB Pipeline Tracking ---
    logic data_phase;
    logic latched_write;
    logic [31:0] latched_addr;

    always_ff @(posedge HCLK or negedge HRESETn) begin
        if (!HRESETn) begin
            data_phase    <= 0;
            latched_write <= 0;
            latched_addr  <= 0;
        end else if (HREADYOUT) begin // Only latch new data when bus is not stalled
            data_phase    <= ahb_req;
            if (ahb_req) begin
                latched_write <= HWRITE;
                latched_addr  <= HADDR;
            end
        end
    end

    // --- FSM Synchronization ---
    logic fsm_active;
    logic core_start;
    logic core_ready;
    logic fsm_done;

    assign core_start = data_phase && !fsm_active;
    assign fsm_done   = fsm_active && core_ready && !core_start;

    always_ff @(posedge HCLK or negedge HRESETn) begin
        if (!HRESETn) begin
            fsm_active <= 0;
        end else begin
            if (core_start) fsm_active <= 1;
            else if (fsm_done) fsm_active <= 0;
        end
    end

    // --- STRICT STALL LOGIC ---
    assign HREADYOUT = !data_phase || fsm_done;
    assign HRESP     = 2'b00; 

    // --- FIFO Push/Pop Control ---
    assign tx_push = core_start && latched_write;
    assign rx_pop  = ahb_req; 

    // --- QSPI Core Instantiation ---
    qspi_fsm u_qspi_core (
        .clk         (HCLK),
        .rst_n       (HRESETn),
        .start       (core_start),
        .addr_in     (latched_addr), 
        .write_op    (latched_write),
        .ready       (core_ready),
        .tx_data     (tx_data_out),
        .tx_empty    (tx_empty),
        .tx_pop      (tx_pop),
        .rx_data     (rx_data_in),
        .rx_full     (rx_full),
        .rx_push     (rx_push),
        .qspi_cs_n   (qspi_cs_n),
        .qspi_clk    (qspi_clk),
        .qspi_io_out (qspi_data_out),
        .qspi_io_oe  (qspi_data_oen),
        .qspi_io_in  (qspi_data_in)
    );
endmodule
