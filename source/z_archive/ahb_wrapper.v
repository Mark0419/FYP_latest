`timescale 1ns / 1ps

module ahb_wrapper (
    input        HCLK,
    input        HRESETn,
    
    // AHB-Lite Slave Interface
    input  [31:0] HADDR,
    input        HSEL,
    input        HREADY,
    input  [1:0]  HTRANS,
    input        HWRITE,
    input  [31:0] HWDATA,
    output       HREADYOUT,
    output [1:0]  HRESP,
    output [31:0] HRDATA,

    // QSPI Physical Interface
    output       qspi_cs_n,
    output       qspi_clk,
    inout  [3:0]  qspi_io
);

    // Internal Signals
    reg         core_start;
    wire        core_ready;
    wire [31:0] core_data_out;
    reg  [31:0] latched_addr;
    reg  [31:0] latched_wdata;
    reg         latched_write;
    reg         is_busy;
    wire        valid_transfer;
    
    // Tri-State Signals
    wire [3:0]  io_out, io_in;
    wire        io_oe;

    // Detect valid Transfer
    assign valid_transfer = HSEL && HREADY && (HTRANS == 2'b10); 

    always @(posedge HCLK or negedge HRESETn) begin
        if (!HRESETn) begin
            latched_addr  <= 0;
            latched_wdata <= 0;
            latched_write <= 0;
            core_start    <= 0;
            is_busy       <= 0;
        end else begin
            // 1. Start Transaction
            if (valid_transfer && !is_busy) begin
                core_start    <= 1;
                is_busy       <= 1;
                latched_addr  <= HADDR;
                latched_write <= HWRITE;
                if (HWRITE) latched_wdata <= HWDATA;
                
                $display("AHB: Starting %s to addr=%08h, data=%08h", 
                        HWRITE ? "WRITE" : "READ", HADDR, HWRITE ? HWDATA : 32'h0);
            end else begin
                core_start <= 0;
            end
            
            // 2. End Transaction
            if (is_busy && core_ready && !core_start) begin
                is_busy <= 0;
                $display("AHB: Transaction complete, data_out=%08h", core_data_out);
            end
        end
    end

    assign HREADYOUT = !is_busy; 
    assign HRESP     = 2'b00;      
    assign HRDATA    = core_data_out;

    // --- INSTANTIATION ---
    qspi_fsm u_qspi_core (
        .clk         (HCLK),
        .rst_n       (HRESETn),
        .start       (core_start),
        .addr_in     (latched_addr), 
        .data_in     (latched_wdata),
        .write_op    (latched_write),
        .data_out    (core_data_out),
        .ready       (core_ready),
        .qspi_cs_n   (qspi_cs_n),
        .qspi_clk    (qspi_clk),
        .qspi_io_out (io_out),
        .qspi_io_oe  (io_oe),
        .qspi_io_in  (io_in)
    );

    // Tri-State Buffers
    assign qspi_io[0] = io_oe ? io_out[0] : 1'bz;
    assign qspi_io[1] = io_oe ? io_out[1] : 1'bz;
    assign qspi_io[2] = io_oe ? io_out[2] : 1'bz;
    assign qspi_io[3] = io_oe ? io_out[3] : 1'bz;
    
    assign io_in = qspi_io; 

endmodule
