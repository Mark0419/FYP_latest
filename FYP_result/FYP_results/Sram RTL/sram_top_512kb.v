// src/rtl/sram_top_512kb.v
// -----------------------------------------------------------------------------
// Module      : sram_top_512kb
// Description : Top-level 512KB SRAM IP with 8-Bank Framework
//               Fully compliant AHB-Lite slave interface with all ports routed.
// -----------------------------------------------------------------------------

module sram_top_512kb (
    // AHB-Lite Global Signals
    input  wire        HCLK,
    input  wire        HRESETn,

    // AHB-Lite Slave Interface (All Standard Ports Included)
    input  wire        HSEL,
    input  wire [31:0] HADDR,
    input  wire [1:0]  HTRANS,
    input  wire        HWRITE,
    input  wire [2:0]  HSIZE,
    input  wire [2:0]  HBURST,     
    input  wire [3:0]  HPROT,      
    input  wire        HMASTLOCK, 
    input  wire        HREADY,     
    input  wire [31:0] HWDATA,
    
    output wire [31:0] HRDATA,
    output wire        HREADYOUT,
    output wire        HRESP       
);

    // Internal signals from Wrapper to Banks
    wire [31:0] w_addr;
    wire [31:0] w_wdata;
    wire        w_we;
    wire        w_re;
    wire [3:0]  w_be; 
    wire [31:0] w_rdata; 
    
    // ---------------------------------------------------------
    // 1. Instantiate the AHB-Lite Wrapper (The Controller)
    // ---------------------------------------------------------
    ahb_sram_wrapper u_wrapper (
        .HCLK(HCLK),
        .HRESETn(HRESETn),
        .HSEL(HSEL),
        .HADDR(HADDR),
        .HTRANS(HTRANS),
        .HWRITE(HWRITE),
        .HSIZE(HSIZE),
        .HBURST(HBURST),         
        .HPROT(HPROT),          
        .HMASTLOCK(HMASTLOCK),    
        .HREADY(HREADY),         
        .HWDATA(HWDATA),
        .HRDATA(HRDATA),        
        .HREADYOUT(HREADYOUT),
        .HRESP(HRESP),           
        
        // Output ports to the memory backend
        .mem_addr(w_addr),
        .mem_wdata(w_wdata),
        .mem_we(w_we),
        .mem_re(w_re),
        .mem_be(w_be),
        .mem_rdata(w_rdata)
    );

    // ---------------------------------------------------------
    // 2. Banking Logic: Address Decoding
    // ---------------------------------------------------------
    wire [7:0] bank_sel;
    assign bank_sel[0] = (w_addr[18:16] == 3'b000);
    assign bank_sel[1] = (w_addr[18:16] == 3'b001);
    assign bank_sel[2] = (w_addr[18:16] == 3'b010);
    assign bank_sel[3] = (w_addr[18:16] == 3'b011);
   assign bank_sel[4] = (w_addr[18:16] == 3'b100);
    assign bank_sel[5] = (w_addr[18:16] == 3'b101);
    assign bank_sel[6] = (w_addr[18:16] == 3'b110);
    assign bank_sel[7] = (w_addr[18:16] == 3'b111);

    // ---------------------------------------------------------
    // 3. Explicit Wires for 8 Banks (Safe MUXing)
    // ---------------------------------------------------------
    wire [31:0] rdata_b0, rdata_b1, rdata_b2, rdata_b3;
    wire [31:0] rdata_b4, rdata_b5, rdata_b6, rdata_b7;

    sram_model_64kb bank0 (.clk(HCLK), .ce(bank_sel[0]), .we(w_we & bank_sel[0]), .be(w_be), .addr(w_addr[15:0]), .din(w_wdata), .dout(rdata_b0));
    sram_model_64kb bank1 (.clk(HCLK), .ce(bank_sel[1]), .we(w_we & bank_sel[1]), .be(w_be), .addr(w_addr[15:0]), .din(w_wdata), .dout(rdata_b1));
    sram_model_64kb bank2 (.clk(HCLK), .ce(bank_sel[2]), .we(w_we & bank_sel[2]), .be(w_be), .addr(w_addr[15:0]), .din(w_wdata), .dout(rdata_b2));
    sram_model_64kb bank3 (.clk(HCLK), .ce(bank_sel[3]), .we(w_we & bank_sel[3]), .be(w_be), .addr(w_addr[15:0]), .din(w_wdata), .dout(rdata_b3));
   sram_model_64kb bank4 (.clk(HCLK), .ce(bank_sel[4]), .we(w_we & bank_sel[4]), .be(w_be), .addr(w_addr[15:0]), .din(w_wdata), .dout(rdata_b4));
    sram_model_64kb bank5 (.clk(HCLK), .ce(bank_sel[5]), .we(w_we & bank_sel[5]), .be(w_be), .addr(w_addr[15:0]), .din(w_wdata), .dout(rdata_b5));
    sram_model_64kb bank6 (.clk(HCLK), .ce(bank_sel[6]), .we(w_we & bank_sel[6]), .be(w_be), .addr(w_addr[15:0]), .din(w_wdata), .dout(rdata_b6));
    sram_model_64kb bank7 (.clk(HCLK), .ce(bank_sel[7]), .we(w_we & bank_sel[7]), .be(w_be), .addr(w_addr[15:0]), .din(w_wdata), .dout(rdata_b7));

    // ---------------------------------------------------------
    // 4. Output Mux
    // ---------------------------------------------------------
    assign w_rdata = 
        (bank_sel[0]) ? rdata_b0 :
        (bank_sel[1]) ? rdata_b1 :
        (bank_sel[2]) ? rdata_b2 :
        (bank_sel[3]) ? rdata_b3 :
       (bank_sel[4]) ? rdata_b4 :
        (bank_sel[5]) ? rdata_b5 :
       (bank_sel[6]) ? rdata_b6 :
       (bank_sel[7]) ? rdata_b7 : 
32'h0000_0000;

endmodule