`timescale 1ns / 1ps

module tb_ahb_wrapper();

    // --- AHB-Lite Signals ---
    logic        HCLK;
    logic        HRESETn;
    logic        HSEL;
    logic [31:0] HADDR;
    logic [1:0]  HTRANS;
    logic        HWRITE;
    logic [31:0] HWDATA;
    logic        HREADY;    
    logic [31:0] HRDATA;
    logic        HREADYOUT; 
    logic [1:0]  HRESP;

    // --- QSPI Controller Signals ---
    logic        qspi_cs_n;
    logic        qspi_clk;
    logic [3:0]  qspi_data_out;
    logic        qspi_data_oen;
    logic [3:0]  qspi_data_in;

    initial begin
        HCLK = 0;
        forever #10 HCLK = ~HCLK;
    end

    ahb_wrapper u_dut (
        .HCLK(HCLK), .HRESETn(HRESETn), .HSEL(HSEL), .HADDR(HADDR),
        .HTRANS(HTRANS), .HWRITE(HWRITE), .HWDATA(HWDATA), .HREADY(HREADY),    
        .HRDATA(HRDATA), .HREADYOUT(HREADYOUT), .HRESP(HRESP),
        .qspi_cs_n(qspi_cs_n), .qspi_clk(qspi_clk),
        .qspi_data_out(qspi_data_out), .qspi_data_oen(qspi_data_oen), .qspi_data_in(qspi_data_in)
    );

    // --- Bidirectional Tri-State Bus Logic ---
    wire [3:0] qspi_io_bus;
    assign qspi_io_bus = qspi_data_oen ? qspi_data_out : 4'bz;
    assign qspi_data_in = qspi_io_bus;

    // --- Flash Model Instantiation ---
    flash_model u_flash (
        .cs_n(qspi_cs_n),
        .clk(qspi_clk),
        .io(qspi_io_bus) 
    );

    // --- Cycle-Accurate AHB Master Tasks ---
    task ahb_read(input [31:0] addr);
    begin
        @(posedge HCLK);
        HSEL = 1; HTRANS = 2'b10; 
        HADDR = addr; HWRITE = 0; HREADY = 1;
        
        @(posedge HCLK);
        HSEL = 0; HTRANS = 2'b00; 
        
        while (!HREADYOUT) @(posedge HCLK); 
        $display("[%0d] Read Complete. Data: %08h", $time, HRDATA);
    end
    endtask

    task ahb_write(input [31:0] addr, input [31:0] data);
    begin
        @(posedge HCLK);
        HSEL = 1; HTRANS = 2'b10; 
        HADDR = addr; HWRITE = 1; HREADY = 1;
        
        @(posedge HCLK);
        HWDATA = data; 
        HSEL = 0; HTRANS = 2'b00; 
        
        while (!HREADYOUT) @(posedge HCLK); 
        $display("[%0d] Write Complete.", $time);
    end
    endtask

    // --- Test Sequence ---
    initial begin
        $fsdbDumpfile("ahb_sys.fsdb");
        $fsdbDumpvars(0, tb_ahb_wrapper);
        $fsdbDumpMDA(); 

        HRESETn = 0; HSEL = 0; HTRANS = 0; HWRITE = 0; HADDR = 0; HWDATA = 0; HREADY = 1; 

        #55; HRESETn = 1; #50;

        $display("\n--- STARTING FULL REGRESSION ---");

        $display("\n[TEST 1] Initial Read...");
        ahb_read(32'h0F80_0000);

        $display("\n[TEST 2] Write 0x12345678...");
        ahb_write(32'h0F80_1000, 32'h12345678);

        $display("\n[TEST 3] Read back...");
        ahb_read(32'h0F80_1000);

        $display("\n[TEST 4] Erase...");
        ahb_write(32'h0F80_1000, 32'hFFFFFFFF);

        $display("\n[TEST 5] Verify Erase...");
        ahb_read(32'h0F80_1000);

        $display("\n============================================");
        $display("   STARTING EXECUTE-IN-PLACE (XIP) PHASE    ");
        $display("============================================");

        // [TEST 6] Physically Program the Flash via AHB
        $display("\n[TEST 6] Programming Flash for XIP Tests...");
        ahb_write(32'h0F80_2000, 32'hAABBCCDD);
        ahb_write(32'h0F80_2004, 32'h11223344);

        // [TEST 7] Initial Read (Establishes XIP Mode)
        $display("\n[TEST 7] Initial XIP Boot Read (Sending 0xEC)...");
        ahb_read(32'h0F80_2000); // Physically reads AABBCCDD
        
        u_flash.xip_active = 1'b1; // Tell the VIP to expect the bypass

        // [TEST 8] Consecutive XIP Read (Proves Latency Reduction)
        $display("\n[TEST 8] XIP Burst Read (Command Skipped)...");
        ahb_read(32'h0F80_2004); // Physically reads 11223344 FASTER

        u_flash.xip_active = 1'b0; // Write physically breaks XIP

        // [TEST 9] AHB Write (Breaks XIP Mode)
        $display("\n[TEST 9] AHB Write (Breaks XIP Mode)...");
        ahb_write(32'h0F80_2008, 32'hBEEFBEEF);

        // [TEST 10] Post-Write Read (Proves Command Re-issues)
        $display("\n[TEST 10] Post-Write Read (Sending 0xEC again)...");
        ahb_read(32'h0F80_2008); // Physically reads BEEFBEEF

        #100;
        $display("\n============================================");
        $display("                 TEST FINISHED              ");
        $display("============================================");
        $finish;
    end
endmodule
