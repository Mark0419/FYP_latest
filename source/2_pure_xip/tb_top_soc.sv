`timescale 1ns / 1ps

module tb_soc_top();

    // ==========================================
    // 1. System Clock and Reset
    // ==========================================
    logic HCLK;
    logic HRESETn;

    initial begin
        HCLK = 0;
        forever #10 HCLK = ~HCLK; // 50 MHz System Clock
    end

    initial begin
        HRESETn = 0;
        #1000; 
        HRESETn = 1; 
        $display("\n[%0t ps] SYSTEM: HRESETn released. CPU should boot now.", $time);
    end

    // ==========================================
    // 2. Bus Wire Declarations
    // ==========================================
    wire [31:0] ICODE_HADDR;
    wire [1:0]  ICODE_HTRANS;
    wire [31:0] ICODE_HRDATA;

    wire [31:0] DCODE_HADDR;
    wire [1:0]  DCODE_HTRANS;
    wire        DCODE_HWRITE;
    wire [31:0] DCODE_HWDATA;
    wire [31:0] DCODE_HRDATA;

    wire [31:0] SYS_HADDR;
    wire [1:0]  SYS_HTRANS;
    wire        SYS_HWRITE;
    wire [31:0] SYS_HWDATA;
    wire [31:0] SYS_HRDATA;
    wire        SYS_HREADY;
    wire        SYS_HREADYOUT; 
    wire [1:0]  SYS_HRESP;     

    wire        qspi_cs_n;
    wire        qspi_clk;
    wire        qspi_data_oen;
    wire [3:0]  qspi_data_out;
    wire [3:0]  qspi_data_in;
    wire [3:0]  qspi_io_bus;

    assign qspi_io_bus = qspi_data_oen ? qspi_data_out : 4'bz;
    assign qspi_data_in = qspi_io_bus;

    // ==========================================
    // 3. Dual-Ported Boot ROMs
    // ==========================================
    boot_rom u_boot_rom_icode (
        .HCLK        (HCLK),
        .HRESETn     (HRESETn),
        .HADDR       (ICODE_HADDR),
        .HTRANS      (ICODE_HTRANS),
        .HRDATA      (ICODE_HRDATA),
        .HREADYOUT   () 
    );

    boot_rom u_boot_rom_dcode (
        .HCLK        (HCLK),
        .HRESETn     (HRESETn),
        .HADDR       (DCODE_HADDR),
        .HTRANS      (DCODE_HTRANS),
        .HRDATA      (DCODE_HRDATA),
        .HREADYOUT   () 
    );

    // ==========================================
    // 4. The ARM Cortex-M3 Processor
    // ==========================================
    CORTEXM3INTEGRATION u_cpu (
        .FCLK          (HCLK),
        .HCLK          (HCLK),
        .PORESETn      (HRESETn),
        .SYSRESETn     (HRESETn),
        .ISOLATEn      (1'b1),   
        .RETAINn       (1'b1),   
        .SLEEPHOLDREQn (1'b1),   
        .WICENREQ      (1'b0),   
        .CGBYPASS      (1'b0),   
        .RSTBYPASS     (1'b0),   
        .BIGEND        (1'b0),   
        .TRACECLKIN    (HCLK),   
        .STCLK         (HCLK),   
        .CDBGPWRUPACK  (1'b1),   
        .SE            (1'b0),   
        .MPUDISABLE    (1'b1),   
        .DBGEN         (1'b0),   
        .AUXFAULT      (0),      
        .IFLUSH        (1'b0),   
        .EXRESPD       (1'b0),   
        .STCALIB       (0),      
        .FIXMASTERTYPE (1'b0),   
        .TSVALUEB      (0),      
        .TSCLKCHANGE   (1'b0),   
        .nTRST         (1'b0),     
        .SWCLKTCK      (HCLK),   
        .SWDITMS       (1'b0),
        .TDI           (1'b0),
        .EDBGRQ        (1'b0),
        .DBGRESTART    (1'b0),
        .INTISR        (240'b0),
        .INTNMI        (1'b0),
        .RXEV          (1'b0),
        .HADDRI      (ICODE_HADDR),
        .HTRANSI     (ICODE_HTRANS),
        .HRDATAI     (ICODE_HRDATA),
        .HREADYI     (1'b1),  
        .HRESPI      (2'b00), 
        .HADDRD      (DCODE_HADDR),
        .HTRANSD     (DCODE_HTRANS),
        .HWRITED     (DCODE_HWRITE),
        .HWDATAD     (DCODE_HWDATA),
        .HRDATAD     (DCODE_HRDATA),
        .HREADYD     (1'b1),         
        .HRESPD      (2'b00),        
        .HADDRS      (SYS_HADDR),
        .HTRANSS     (SYS_HTRANS),
        .HWRITES     (SYS_HWRITE),
        .HWDATAS     (SYS_HWDATA),
        .HREADYS     (SYS_HREADY),   
        .HRDATAS     (SYS_HRDATA),
        .HRESPS      (2'b00), 
        .EXRESPS     (1'b0)   
    );

    // ==========================================
    // 5. AHB Decoder & Deadlock Prevention
    // ==========================================
    reg sys_active_data_phase;
    always @(posedge HCLK) begin
        if (!HRESETn)
            sys_active_data_phase <= 1'b0;
        else if (SYS_HREADY)
            sys_active_data_phase <= ((SYS_HADDR[31:28] == 4'h4) || (SYS_HADDR[31:28] == 4'h6)) && SYS_HTRANS[1];
    end

    assign SYS_HREADY = sys_active_data_phase ? SYS_HREADYOUT : 1'b1;

    // ==========================================
    // 6. YOUR Flash Controller (The DUT)
    // ==========================================
    ahb_wrapper u_dut (
        .HCLK        (HCLK), 
        .HRESETn     (HRESETn), 
        .HSEL        ((SYS_HADDR[31:28] == 4'h4) || (SYS_HADDR[31:28] == 4'h6)), 
        .HADDR       (SYS_HADDR),
        .HTRANS      (SYS_HTRANS), 
        .HWRITE      (SYS_HWRITE), 
        .HWDATA      (SYS_HWDATA), 
        .HREADY      (SYS_HREADY),    
        .HRDATA      (SYS_HRDATA), 
        .HREADYOUT   (SYS_HREADYOUT),  
        .HRESP       (SYS_HRESP), 
        .qspi_cs_n     (qspi_cs_n), 
        .qspi_clk      (qspi_clk),
        .qspi_data_out (qspi_data_out), 
        .qspi_data_oen (qspi_data_oen), 
        .qspi_data_in  (qspi_data_in)
    );

    flash_model u_flash (
        .cs_n (qspi_cs_n), 
        .clk  (qspi_clk), 
        .io   (qspi_io_bus)
    );

    // ==========================================
    // 7. Simulation Control
    // ==========================================
    initial begin
        $fsdbDumpfile("soc_full.fsdb");
        $fsdbDumpvars(0, tb_soc_top);
        $fsdbDumpMDA(); 
        #100000; 
        $finish;
    end

    // ==========================================
    // 8. THE AHB PIPELINE-AWARE SNIFFER
    // ==========================================
    logic        sniff_write_active;
    logic [31:0] sniff_write_addr;

    always @(posedge HCLK) begin
        if (HRESETn && SYS_HREADY) begin
            
            // 1. Sniff Flash Reads (Reads do not need HWDATA, capture on Address Phase)
            if (SYS_HWRITE == 0 && SYS_HTRANS[1]) begin
                if (SYS_HADDR == 32'h40001000) 
                    $display("[%0t] [SNIFFER] Flash Read Req: 4000_1000", $time);
                if (SYS_HADDR == 32'h40002000) 
                    $display("[%0t] [SNIFFER] Flash Read Req: 4000_2000", $time);
                if (SYS_HADDR == 32'h40003000) 
                    $display("[%0t] [SNIFFER] Flash Read Req: 4000_3000", $time);
            end
            
            // 2. Data Phase Capture (Print the data exactly ONE cycle after the address!)
            if (sniff_write_active) begin
                if (sniff_write_addr == 32'h20008000) 
                    $display("[%0t] [SNIFFER] SUCCESS: SRAM Echo %08h at 2000_8000 (Boot XIP)", $time, SYS_HWDATA);
                if (sniff_write_addr == 32'h20008004) 
                    $display("[%0t] [SNIFFER] SUCCESS: SRAM Echo %08h at 2000_8004 (Continuous 1)", $time, SYS_HWDATA);
                if (sniff_write_addr == 32'h20008008) 
                    $display("[%0t] [SNIFFER] SUCCESS: SRAM Echo %08h at 2000_8008 (Negative Test Fail Echo)", $time, SYS_HWDATA);
                if (sniff_write_addr == 32'h2000800C) 
                    $display("[%0t] [SNIFFER] SUCCESS: SRAM Echo %08h at 2000_800C (Continuous 3)", $time, SYS_HWDATA);
            end

            // 3. Address Phase Capture (Memorize WHERE the CPU wants to write)
            if (SYS_HWRITE == 1 && SYS_HTRANS[1] && (SYS_HADDR[31:28] == 4'h2)) begin
                sniff_write_active <= 1'b1;
                sniff_write_addr   <= SYS_HADDR;
            end else begin
                sniff_write_active <= 1'b0;
            end
            
        end
    end

endmodule
