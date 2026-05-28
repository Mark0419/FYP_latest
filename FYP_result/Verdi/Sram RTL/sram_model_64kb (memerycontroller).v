// -----------------------------------------------------------------------------
// Module      : sram_model_64kb
// Description : 64KB SRAM Behavioral Model for UVM Simulation
//               Updated with Combinational Read for Zero-Wait-State AHB compliance.
// -----------------------------------------------------------------------------

module sram_model_64kb (
    input  wire        clk,
    input  wire        ce,   // Chip Enable (Active High)
    input  wire        we,   // Write Enable (Active High)
    input  wire [3:0]  be,   // Byte Enable (WSTRB)
    input  wire [15:0] addr, // 16-bit Byte Address from Top
    input  wire [31:0] din,  // Data In
    output reg  [31:0] dout  // Data Out
);

// synopsys translate_off

    // 64KB Memory Array: 16384 entries of 32-bit words
    reg [31:0] mem_array [0:16383];

    // Convert byte address to word address
    wire [13:0] word_addr = addr[15:2];

    // ========================================================
    // 1. Synchronous Write Logic (Data saved on Clock Edge)
    // ========================================================
    always @(posedge clk) begin
        if (ce && we) begin
            if (be[0]) mem_array[word_addr][7:0]   <= din[7:0];
            if (be[1]) mem_array[word_addr][15:8]  <= din[15:8];
            if (be[2]) mem_array[word_addr][23:16] <= din[23:16];
            if (be[3]) mem_array[word_addr][31:24] <= din[31:24];
        end
    end

    // ========================================================
    // 2. Combinational Read Logic (Zero Wait State)
    // ========================================================
    // Data is fetched instantly when Chip Enable (CE) is high and WE is low.
    always @(*) begin
        if (ce && !we) begin
            dout = mem_array[word_addr];
        end else begin
            dout = 32'h0000_0000;
        end
    end

// synopsys translate_on
endmodule
