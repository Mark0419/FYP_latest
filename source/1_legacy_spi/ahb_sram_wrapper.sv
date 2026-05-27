
// -----------------------------------------------------------------------------
// Module      : ahb_sram_wrapper
// Description : Custom AHB-Lite to SRAM Hard Macro Bridge for FYP2.
//               Acts as the main protocol controller. The actual memory
//               arrays are instantiated externally in the Top framework.
// -----------------------------------------------------------------------------

module ahb_sram_wrapper #(
    parameter ADDR_WIDTH = 19, // 17,18,19,20 bits for 128KB, 256KB, 512KB,1MB memory space
    parameter DATA_WIDTH = 32
)(
    // AHB-Lite Global Signals
    input  wire                  HCLK,
    input  wire                  HRESETn,

    // AHB-Lite Slave Interface
    input  wire                  HSEL,
    input  wire [31:0]           HADDR,
    input  wire [1:0]            HTRANS,
    input  wire                  HWRITE,
    input  wire [2:0]            HSIZE,
    input  wire [2:0]            HBURST,
    input  wire [3:0]            HPROT,
    input  wire                  HMASTLOCK,
    input  wire                  HREADY,
    input  wire [DATA_WIDTH-1:0] HWDATA,

    output reg  [DATA_WIDTH-1:0] HRDATA,
    output wire                  HREADYOUT,
    output wire                  HRESP,

    // ========================================================
    // SRAM Backend Interface 
    // ========================================================
    output wire [31:0]           mem_addr,  // Address sent to Top Framework
    output wire [31:0]           mem_wdata, // Write data sent to Top Framework
    output wire                  mem_we,    // Write Enable
    output wire                  mem_re,    // Read Enable
    output wire [3:0]            mem_be,    // Byte Enable (WSTRB)
    input  wire [31:0]           mem_rdata  // Read data returning from Top Framework
);

    // AHB Transfer Types Constants
    localparam TR_IDLE   = 2'b00;
    localparam TR_BUSY   = 2'b01;
    localparam TR_NONSEQ = 2'b10;
    localparam TR_SEQ    = 2'b11;

    // --- 1. Pipeline Registers (Address Phase to Data Phase) ---
    // AHB protocol requires capturing address and control signals 
    // to be used in the subsequent data phase.
    reg [ADDR_WIDTH-1:0] addr_reg;
    reg                  write_en_reg;
    reg [2:0]            size_reg;
    reg                  valid_trans_reg;

    wire ahb_valid_access = HSEL && HREADY && (HTRANS == TR_NONSEQ || HTRANS == TR_SEQ);

    always @(posedge HCLK or negedge HRESETn) begin
        if (!HRESETn) begin
            addr_reg        <= {ADDR_WIDTH{1'b0}};
            write_en_reg    <= 1'b0;
            size_reg        <= 3'b000;
            valid_trans_reg <= 1'b0;
        end else if (HREADY) begin
            valid_trans_reg <= ahb_valid_access;
            if (ahb_valid_access) begin
                addr_reg     <= HADDR[ADDR_WIDTH-1:0]; 
                write_en_reg <= HWRITE;
                size_reg     <= HSIZE;
            end
        end
    end

    // --- 2. Byte Enable Logic and Sub-word Access ---
    // Generates the 4-bit byte enable signal based on HSIZE and lower address bits.
    reg [3:0] byte_en;
    always @(*) begin
        byte_en = 4'b0000;
        if (valid_trans_reg && write_en_reg) begin
            case (size_reg)
                3'b000: begin // 8-bit (Byte Access)
                    case (addr_reg[1:0])
                        2'b00: byte_en = 4'b0001;
                        2'b01: byte_en = 4'b0010;
                        2'b10: byte_en = 4'b0100;
                        2'b11: byte_en = 4'b1000;
                    endcase
                end
                3'b001: begin // 16-bit (Halfword Access)
                    case (addr_reg[1])
                        1'b0: byte_en = 4'b0011;
                        1'b1: byte_en = 4'b1100;
                    endcase
                end
                3'b010: begin // 32-bit (Word Access)
                    byte_en = 4'b1111;
                end
                default: byte_en = 4'b0000;
            endcase
        end
    end

    // Internal Memory Control Signals
    wire internal_we = valid_trans_reg && write_en_reg;
    wire internal_re = valid_trans_reg && !write_en_reg;

    // ========================================================
    // 3. Signal Routing (Sending commands OUT to Top Level)
    // ========================================================
    // Pad the internal address with zeros to match the 32-bit bus requirement
    assign mem_addr  = { {(32-ADDR_WIDTH){1'b0}}, addr_reg }; 
    assign mem_wdata = HWDATA;
    assign mem_we    = internal_we;
    assign mem_re    = internal_re;
    assign mem_be    = byte_en;

    // ========================================================
    // 4. Data Returning (Receiving data IN from Top Level)
    // ========================================================
    // Multiplexes the read data from the external banking framework onto the AHB bus.
    always @(*) begin
        if (internal_re) begin
            HRDATA = mem_rdata; 
        end else begin
            HRDATA = 32'h0000_0000; // Drive zero to prevent X-propagation
        end
    end

    // --- 5. AHB Output Responses ---
    // SRAM is a zero-wait-state device in this architecture.
    assign HREADYOUT = 1'b1; 
    assign HRESP     = 1'b0; // 0 indicates OKAY response

    /*
    =============================================================================
    [FYP PROOF: LEGACY CODE FROM PHASE 1 & 2]
    Note: This behavioral memory array was used during the initial UVM 
    verification phase. It has been successfully verified and is now 
    commented out to support the Phase 3 Multi-Bank Architecture where 
    the actual Hard Macros are instantiated externally.
    =============================================================================
    
    // Word aligned address for the internal dummy array
    wire [ADDR_WIDTH-3:0] word_addr = addr_reg[ADDR_WIDTH-1:2];
    reg [31:0] mem_array [0:255]; 

    always @(posedge HCLK) begin
        if (internal_we) begin
            if (byte_en[0]) mem_array[word_addr][7:0]   <= HWDATA[7:0];
            if (byte_en[1]) mem_array[word_addr][15:8]  <= HWDATA[15:8];
            if (byte_en[2]) mem_array[word_addr][23:16] <= HWDATA[23:16];
            if (byte_en[3]) mem_array[word_addr][31:24] <= HWDATA[31:24];
        end
    end

    always @(*) begin
        if (internal_re) begin
            HRDATA = mem_array[word_addr];
        end else begin
            HRDATA = 32'h0000_0000;
        end
    end
    =============================================================================
    */

endmodule
