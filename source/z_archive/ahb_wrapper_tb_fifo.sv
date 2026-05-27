`timescale 1ns / 1ps

module tb_ahb_wrapper;

    reg          HCLK, HRESETn, HSEL, HREADY, HWRITE;
    reg  [31:0]  HADDR, HWDATA;
    reg  [1:0]   HTRANS; 
    wire [31:0]  HRDATA;
    wire         HREADYOUT;
    wire [1:0]   HRESP;
    wire         qspi_cs_n, qspi_clk;
    wire [3:0]   qspi_io;

    // --- Wires for the unidirectional DUT ports ---
    wire [3:0]   dut_qspi_data_out;
    wire         dut_qspi_data_oen;
    wire [3:0]   dut_qspi_data_in;

    // --- DUT Instantiation ---
    ahb_wrapper u_dut (
        .HCLK(HCLK), .HRESETn(HRESETn), .HSEL(HSEL), .HADDR(HADDR),
        .HTRANS(HTRANS), .HWRITE(HWRITE), .HWDATA(HWDATA), .HREADY(HREADY),
        .HRDATA(HRDATA), .HREADYOUT(HREADYOUT), .HRESP(HRESP),
        .qspi_cs_n(qspi_cs_n), .qspi_clk(qspi_clk),
        
        // Connect to the new unidirectional pins
        .qspi_data_out (dut_qspi_data_out),
        .qspi_data_oen (dut_qspi_data_oen),
        .qspi_data_in  (dut_qspi_data_in)
    );

    // --- Testbench Physical Pad Simulation ---
    assign qspi_io = dut_qspi_data_oen ? dut_qspi_data_out : 4'bz;
    assign dut_qspi_data_in = qspi_io;


    // --- FLASH MODEL ---
    flash_model u_flash (
        .cs_n (qspi_cs_n), .clk (qspi_clk), .io (qspi_io)    
    );

    initial begin
        HCLK = 0;
        forever #5 HCLK = ~HCLK; 
    end

    // --- UPDATED FOR VERDI (FSDB DUMPING) ---
    initial begin
        $fsdbDumpfile("dump.fsdb");
        $fsdbDumpvars(0, tb_ahb_wrapper);
    end

    task ahb_read(input [31:0] addr);
        begin
            @(posedge HCLK);
            HSEL <= 1; HREADY <= 1; HTRANS <= 2'b10; HWRITE <= 0; HADDR <= addr;
            
            @(posedge HCLK);
            #1; 
            HTRANS <= 2'b00; HSEL <= 0;     
            
            while (HREADYOUT == 0) begin
                @(posedge HCLK); #1; 
            end
        end
    endtask

    task ahb_write(input [31:0] addr, input [31:0] data);
        begin
            @(posedge HCLK);
            HSEL <= 1; HREADY <= 1; HTRANS <= 2'b10; HWRITE <= 1; 
            HADDR <= addr; HWDATA <= data;
            
            @(posedge HCLK);
            #1; 
            HTRANS <= 2'b00; HSEL <= 0; HWRITE <= 0;     
            
            while (HREADYOUT == 0) begin
                @(posedge HCLK); #1; 
            end
        end
    endtask

    task ahb_erase(input [31:0] addr);
        begin
            // Erase is triggered by writing 0xFFFFFFFF
            ahb_write(addr, 32'hFFFFFFFF);
        end
    endtask

    initial begin
        $display("--- AHB QSPI FLASH CONTROLLER TEST ---");

        HRESETn = 0; HSEL = 0; HADDR = 0; HTRANS = 0; 
        HWRITE = 0; HWDATA = 0; HREADY = 1;
        #50 HRESETn = 1; #50;

        // Test 1: Read
        $display("[TEST 1] Reading from 0x0F80_0000...");
        ahb_read(32'h0F80_0000); 
        $display("Read Data: %h", HRDATA);

        // Test 2: Write
        $display("[TEST 2] Writing 0x12345678 to 0x0F80_1000...");
        ahb_write(32'h0F80_1000, 32'h12345678);
        $display("Write Complete");

        // Test 3: Read back written data
        $display("[TEST 3] Reading back from 0x0F80_1000...");
        ahb_read(32'h0F80_1000);
        $display("Read Data: %h", HRDATA);
        
        if (HRDATA == 32'h12345678) 
            $display("STATUS: [PASS] Write/Read Test Success!");
        else 
            $display("STATUS: [FAIL] Expected 12345678, got %h", HRDATA);

        // Test 4: Erase
        $display("[TEST 4] Erasing sector at 0x0F80_1000...");
        ahb_erase(32'h0F80_1000);
        $display("Erase Complete");

        // Test 5: Read after erase
        $display("[TEST 5] Reading after erase...");
        ahb_read(32'h0F80_1000);
        $display("Read Data: %h", HRDATA);
        
        if (HRDATA == 32'hFFFFFFFF) 
            $display("STATUS: [PASS] Erase Test Success!");
        else 
            $display("STATUS: [FAIL] Expected FFFFFFFF, got %h", HRDATA);

        #100; $finish;
    end
endmodule
