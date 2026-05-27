`timescale 1ns / 1ps

module tb_xip;

  // --- Clock and Reset ---
  logic HCLK;
  logic HRESETn;
  
  // --- AHB Bus Signals ---
  logic [31:0] HADDR;
  logic        HSEL;
  wire         HREADY;     // ---> CHANGED TO WIRE FOR LOOPBACK <---
  logic [1:0]  HTRANS;
  logic        HWRITE;
  logic [31:0] HWDATA;
  logic        HREADYOUT;
  logic [1:0]  HRESP;
  logic [31:0] HRDATA;
  
  // --- QSPI Physical Pins ---
  logic        qspi_clk;
  logic        qspi_cs_n;
  logic [3:0]  qspi_data_out;
  logic        qspi_data_oen;
  logic [3:0]  qspi_data_in;
  
  wire  [3:0]  qspi_io; 

  assign qspi_io = qspi_data_oen ? qspi_data_out : 4'bZ;
  assign qspi_data_in = qspi_io;

  // ---> ADDED: Tie the wrapper's ready output back to its ready input <---
  assign HREADY = HREADYOUT; 

  // ---------------------------------------------------------
  // 1. Controller Instantiation
  // ---------------------------------------------------------
  ahb_wrapper u_dut (
    .HCLK(HCLK),
    .HRESETn(HRESETn),
    .HADDR(HADDR),
    .HSEL(HSEL),
    .HREADY(HREADY),
    .HTRANS(HTRANS),
    .HWRITE(HWRITE),
    .HWDATA(HWDATA),
    .HREADYOUT(HREADYOUT),
    .HRESP(HRESP),
    .HRDATA(HRDATA),
    .qspi_cs_n(qspi_cs_n),
    .qspi_clk(qspi_clk),
    .qspi_data_out(qspi_data_out),
    .qspi_data_oen(qspi_data_oen),
    .qspi_data_in(qspi_data_in)
  );

  // ---------------------------------------------------------
  // 1.5 External Flash Memory Model
  // ---------------------------------------------------------
  flash_model u_flash (
    .clk   (qspi_clk),   
    .cs_n  (qspi_cs_n),  
    .io    (qspi_io)     
  );

  // ---------------------------------------------------------
  // 2. AHB Read Task (---> SYNCHRONOUS FIX <---)
  // ---------------------------------------------------------
  task automatic ahb_read(input logic [31:0] target_addr);
    begin
      // Address Phase
      @(posedge HCLK);
      HADDR  <= target_addr;
      HWRITE <= 1'b0;      
      HTRANS <= 2'b10;     
      
      // Data Phase
      @(posedge HCLK);
      HTRANS <= 2'b00;     // Return bus to IDLE
      
      // Synchronous wait: Check HREADYOUT only ON the clock ticks
      forever begin
        @(posedge HCLK);
        if (HREADYOUT == 1'b1) break;
      end
      
      $display("[%0t] Read Complete! Address: %h, Data on HRDATA: %h", $time, target_addr, HRDATA);
    end
  endtask

  // ---------------------------------------------------------
  // 3. The Main XIP Sequence
  // ---------------------------------------------------------
  initial begin
    $fsdbDumpfile("xip_test.fsdb"); // Names the output file
    $fsdbDumpvars(0, tb_xip);       // Dumps everything in this module and below
    $fsdbDumpMDA();                 // Dumps memory arrays (so you can see your flash model!)
    HCLK = 0;
    HRESETn = 0;
    HADDR = 0;
    HWDATA = 0;
    HWRITE = 0;
    HTRANS = 0;
    
    HSEL = 1'b1;       
    // (Note: HREADY is now driven by the assign statement above)
    
    // --- PRELOAD FLASH USING YOUR EXACT ARRAY NAME ---
    // Primer Read Data
    u_flash.memory[32'h0F80_1000] = 8'hAA; 
    u_flash.memory[32'h0F80_1001] = 8'hBB;
    u_flash.memory[32'h0F80_1002] = 8'hCC;
    u_flash.memory[32'h0F80_1003] = 8'hDD;

    // XIP Read Data
    u_flash.memory[32'h0F80_1004] = 8'h11; 
    u_flash.memory[32'h0F80_1005] = 8'h22;
    u_flash.memory[32'h0F80_1006] = 8'h33;
    u_flash.memory[32'h0F80_1007] = 8'h44;
    
    #100 HRESETn = 1; 
    
    $display("============================================");
    $display("   STARTING EXECUTE-IN-PLACE (XIP) TEST     ");
    $display("============================================");

    $display("-> Initiating Read 1 (Primer Read - Should send CMD 0xEC)");
    ahb_read(32'h0F80_1000); 
    
    repeat(5) @(posedge HCLK); 
    
    // ---> ADDED: Tell the flash model to act like it received 0xA5 <---
    u_flash.xip_active = 1'b1;

    $display("-> Initiating Read 2 (XIP Read - Should bypass CMD state)");
    ahb_read(32'h0F80_1004); 

    $display("============================================");
    $display("                 TEST FINISHED              ");
    $display("============================================");
    $finish;
  end

  always #5 HCLK = ~HCLK;

endmodule
