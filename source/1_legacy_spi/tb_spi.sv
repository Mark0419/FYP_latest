`timescale 1ns / 1ps

module tb_spi();

    logic HCLK;
    logic HRESETn;

    initial begin
        HCLK = 0;
        forever #10 HCLK = ~HCLK; 
    end

    initial begin
        HRESETn = 0;
        #100;
        HRESETn = 1;
    end

    logic        HSEL;
    logic [31:0] HADDR;
    logic [1:0]  HTRANS;
    logic        HWRITE;
    logic [2:0]  HSIZE;
    logic [2:0]  HBURST;
    logic [3:0]  HPROT;
    logic [3:0]  HMASTER;
    logic        HMASTLOCK;
    logic [31:0] HWDATA;
    logic        HREADY;
    
    wire  [31:0] HRDATA;
    wire         HREADYOUT;
    wire  [1:0]  HRESP;
    wire  [15:0] HSPLIT;

    wire spi_cs_n, spi_clk, spi_mosi;
    reg  spi_miso;

    ahb_spi_legacy u_dut (
        .HCLK      (HCLK),
        .HRESETn   (HRESETn),
        .HSEL      (HSEL),
        .HADDR     (HADDR),
        .HTRANS    (HTRANS),
        .HWRITE    (HWRITE),
        .HSIZE     (HSIZE),
        .HBURST    (HBURST),
        .HPROT     (HPROT),
        .HMASTER   (HMASTER),
        .HMASTLOCK (HMASTLOCK),
        .HWDATA    (HWDATA),
        .HREADY    (HREADY),
        .HRDATA    (HRDATA),
        .HREADYOUT (HREADYOUT),
        .HRESP     (HRESP),
        .HSPLIT    (HSPLIT),
        .spi_cs_n  (spi_cs_n),
        .spi_clk   (spi_clk),
        .spi_mosi  (spi_mosi),
        .spi_miso  (spi_miso)
    );

    task ahb_write(input [31:0] addr, input [31:0] data);
        begin
            @(posedge HCLK);
            HSEL      = 1'b1;
            HADDR     = addr;
            HTRANS    = 2'b10;
            HWRITE    = 1'b1;
            HSIZE     = 3'b010; 
            HBURST    = 3'b000; 
            HREADY    = 1'b1;
            
            @(posedge HCLK);
            HSEL      = 1'b0;
            HTRANS    = 2'b00; 
            HWDATA    = data;
        end
    endtask

    task ahb_read(input [31:0] addr, output [31:0] data);
        begin
            @(posedge HCLK);
            HSEL      = 1'b1;
            HADDR     = addr;
            HTRANS    = 2'b10;
            HWRITE    = 1'b0;
            HSIZE     = 3'b010;
            HBURST    = 3'b000;
            HREADY    = 1'b1;
            
            @(posedge HCLK);
            HSEL      = 1'b0;
            HTRANS    = 2'b00;
            
            #1; 
            data = HRDATA;
        end
    endtask

    // Mock SPI Flash (32-bit Address Update)
    integer spi_edge_cnt;
    reg [31:0] flash_dummy_data = 32'hDEADBEEF;

    always @(negedge spi_clk or posedge spi_cs_n) begin
        if (spi_cs_n) begin
            spi_edge_cnt <= 0;
            spi_miso <= 1'b0;
        end else begin
            spi_edge_cnt <= spi_edge_cnt + 1;
            
            // CMD = 8 clocks. ADDR = 32 clocks. Total = 40 clocks before data.
            // Using 39 due to the non-blocking assignment delay.
            if (spi_edge_cnt >= 39 && spi_edge_cnt < 71) begin
                spi_miso <= flash_dummy_data[70 - spi_edge_cnt];
            end else begin
                spi_miso <= 1'b0;
            end
        end
    end

    logic [31:0] read_val;

    initial begin
        HSEL = 0; HADDR = 0; HTRANS = 0; HWRITE = 0; HWDATA = 0; HREADY = 1;
        HSIZE = 0; HBURST = 0; HPROT = 0; HMASTER = 0; HMASTLOCK = 0;
        
        $fsdbDumpfile("tb_spi.fsdb");
        $fsdbDumpvars(0, tb_spi);

        @(posedge HRESETn);
        #50;

        $display("\n=======================================================");
        $display("[%0t] STARTING C-CODE BOOTLOADER SIMULATION...", $time);
        
        // Use 0x13: JEDEC Standard 4-Byte Address Read Command
        ahb_write(32'h4000_0004, 32'h0000_0013);
        $display("[%0t] CPU Wrote CMD = 0x13 (4-Byte Read)", $time);

        // Prove 32-bit addressing works by writing a full 32-bit address
        ahb_write(32'h4000_0008, 32'h1234_5678);
        $display("[%0t] CPU Wrote 32-bit ADDR = 0x12345678", $time);

        ahb_write(32'h4000_0000, 32'h0000_0001);
        $display("[%0t] CPU Wrote START = 1. SPI FSM is now running!", $time);

        read_val = 32'h0000_0002;
        while (read_val & 32'h0000_0002) begin
            #100; 
            ahb_read(32'h4000_0000, read_val);
        end
        $display("[%0t] CPU detected Busy = 0. FSM finished!", $time);

        ahb_read(32'h4000_000C, read_val);
        
        if (read_val == 32'hDEADBEEF) begin
            $display("[%0t] SUCCESS! Fetched Data: %08h", $time, read_val);
        end else begin
            $display("[%0t] ERROR! Expected DEADBEEF, got: %08h", $time, read_val);
        end
        $display("=======================================================\n");

        #200;
        $finish;
    end
endmodule
