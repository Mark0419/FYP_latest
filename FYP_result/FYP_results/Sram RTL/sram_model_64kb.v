// -----------------------------------------------------------------------------
// Module      : sram_model_64kb
// Description : 64KB SRAM Behavioral Model for UVM Simulation
//               Updated with Combinational Read for Zero-Wait-State AHB compliance.
// -----------------------------------------------------------------------------

module sram_model_64kb (
    input  wire        clk,
    input  wire        ce,   
    input  wire        we,   
    input  wire [3:0]  be,   
    input  wire [15:0] addr, 
    input  wire [31:0] din,  
    output wire [31:0] dout
);

`ifdef SYNTHESIS
    // =========================================================
    // REAL SAED14nm SRAM IP (32 blocks of 2KB = 64KB)
    // =========================================================
    wire WEB = ~we; 
    wire OEB = 1'b0; 

    // Arrays to hold the outputs and chip-selects for the 32 macros
    wire [31:0] macro_dout [0:31];
    wire [31:0] macro_csb;

    // Use a generate loop to instantly create 32 real SRAM macros
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : sram_array
            // Chip Select (Active Low): Only activates if CE is high AND the top 5 bits of address match the macro ID
            assign macro_csb[i] = ~(ce && (addr[15:11] == i));

            // Instantiating the real 2KB macro from the .lib
            SRAM1RW512x32 u_real_sram (
                .A(addr[10:2]),   // 9-bit word address for 512 depth
                .CE(clk),        
                .CSB(macro_csb[i]),       
                .WEB(WEB),       
                .OEB(OEB),       
                .I(din),         
                .O(macro_dout[i])         
            );
        end
    endgenerate

    // MUX to select the correct output from the 32 macros
    reg [31:0] dout_comb;
    integer j;
    always @(*) begin
        dout_comb = 32'h0000_0000;
        if (ce && !we) begin
            for (j = 0; j < 32; j = j + 1) begin
                if (addr[15:11] == j) begin
                    dout_comb = macro_dout[j];
                end
            end
        end
    end
    
    assign dout = dout_comb;

`else
    // =========================================================
    // UVM SIMULATION RTL
    // =========================================================
    reg [31:0] mem_array [0:16383];
    wire [13:0] word_addr = addr[15:2];
    reg [31:0] data_out;

    always @(posedge clk) begin
        if (ce && we) begin
            if (be[0]) mem_array[word_addr][7:0]   <= din[7:0];
            if (be[1]) mem_array[word_addr][15:8]  <= din[15:8];
            if (be[2]) mem_array[word_addr][23:16] <= din[23:16];
            if (be[3]) mem_array[word_addr][31:24] <= din[31:24];
        end
    end

    always @(*) begin
        if (ce && !we) begin
            data_out = mem_array[word_addr];
        end else begin
            data_out = 32'h0000_0000;
        end
    end
    
    assign dout = data_out;
`endif

endmodule