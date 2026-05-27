module ahb_wrapper (
    input  logic        HCLK,
    input  logic        HRESETn,
    
    // AHB-Lite Slave Interface
    input  logic [31:0] HADDR,
    input  logic        HSEL,
    input  logic        HREADY,
    input  logic [1:0]  HTRANS,
    input  logic        HWRITE,
    input  logic [31:0] HWDATA,
    output logic        HREADYOUT,
    output logic [1:0]  HRESP,
    output logic [31:0] HRDATA,

    // QSPI Physical Interface
    output logic        qspi_cs_n,
    output logic        qspi_clk,
    inout  wire  [3:0]  qspi_io
);

    // Internal Signals
    logic        core_start;
    logic        core_ready;
    logic [31:0] core_data_out;
    logic [31:0] latched_addr;
    
    // --- NEW: Dedicated Busy Flag ---
    logic        is_busy;
    
    // Tri-State Signals
    logic [3:0]  io_out, io_in;
    logic        io_oe;

    // Detect valid Read Request
    assign valid_transfer = HSEL && HREADY && (HTRANS == 2'b10) && !HWRITE; 

    always_ff @(posedge HCLK or negedge HRESETn) begin
        if (!HRESETn) begin
            latched_addr <= 0;
            core_start   <= 0;
            is_busy      <= 0;
        end else begin
            // 1. Start Transaction
            // If a valid request comes and we aren't already busy...
            if (valid_transfer && !is_busy) begin
                core_start   <= 1;       // Pulse start
                is_busy      <= 1;       // Lock the bus immediately
                latched_addr <= HADDR; 
            end else begin
                core_start   <= 0;       // Stop pulsing start
            end
            
            // 2. End Transaction
            // If we are busy, and the FSM returns to "Ready" state...
            // (We check !core_start to ensure we don't complete immediately on the first cycle)
            if (is_busy && core_ready && !core_start) begin
                is_busy <= 0; // Unlock the bus
            end
        end
    end

    // --- ROBUST OUTPUT LOGIC ---
    // The CPU is stalled whenever 'is_busy' is High.
    assign HREADYOUT = !is_busy; 

    assign HRESP     = 2'b00;      
    assign HRDATA    = core_data_out;

    // --- INSTANTIATION ---
    qspi_fsm u_qspi_core (
        .clk         (HCLK),
        .rst_n       (HRESETn),
        .start       (core_start),
        .addr_in     (latched_addr), 
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
