`timescale 1ns / 1ps

module ahb_rom #(
    parameter ADDR_WIDTH = 12
)(
    input  wire        HCLK,
    input  wire        HRESETn,

    input  wire [31:0] HADDRI,
    input  wire [1:0]  HTRANSI,
    output wire [31:0] HRDATAI,
    output wire        HREADYI,
    output wire [1:0]  HRESPI,

    input  wire [31:0] HADDRD,
    input  wire [1:0]  HTRANSD,
    output wire [31:0] HRDATAD,
    output wire        HREADYD,
    output wire [1:0]  HRESPD
);

    reg [31:0] rom_array [0:1023];

    initial begin
        for (int i = 0; i < 1024; i++) rom_array[i] = 32'h0;
        $readmemh("boot_rom.hex", rom_array);
    end

    assign HRESPI  = 2'b00;
    assign HREADYI = 1'b1;
    assign HRESPD  = 2'b00;
    assign HREADYD = 1'b1;

    // Strict AHB Data Phase Registers
    reg [31:0] i_data, d_data;

    always @(posedge HCLK) begin
        // Only update data if the Address Phase was active (NONSEQ or SEQ)
        if (HTRANSI[1]) i_data <= rom_array[HADDRI[ADDR_WIDTH-1:2]];
        if (HTRANSD[1]) d_data <= rom_array[HADDRD[ADDR_WIDTH-1:2]];
    end

    assign HRDATAI = i_data;
    assign HRDATAD = d_data;

endmodule
