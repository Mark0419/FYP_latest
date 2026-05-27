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

        // Power & Functional Overrides
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

        // === NEW: MISSING LINT TIE-OFFS ===
        .SE            (1'b0),   // DISABLE SCAN MODE (Critical!)
        .MPUDISABLE    (1'b1),   // DISABLE MPU (Critical!)
        .DBGEN         (1'b0),   // Disable Debug Halt
        .AUXFAULT      (0),      // No external faults
        .IFLUSH        (1'b0),   // No pipeline flush
        .EXRESPD       (1'b0),   // No exclusive fails
        .STCALIB       (0),      // Default SysTick Calib
        .FIXMASTERTYPE (1'b0),   // Default Master ID
        .TSVALUEB      (0),      // Default Timestamp
        .TSCLKCHANGE   (1'b0),   // No Timestamp clock change
        // ==================================

        // Debug Isolation
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
        #10000; 
        $finish;
    end

    // ==========================================
    // 8. DIAGNOSTIC PROBE: AHB Phase Analyzer
    // ==========================================
    reg [31:0] icode_addr_reg;
    reg        icode_data_expected;

    always @(posedge HCLK) begin
        if (!HRESETn) begin
            icode_data_expected <= 0;
        end else begin
            if (icode_data_expected) begin
                $display("[%0t ps] ICODE DATA : Received 0x%08X for Addr 0x%08X", $time, ICODE_HRDATA, icode_addr_reg);
            end

            if (ICODE_HTRANS[1]) begin
                $display("[%0t ps] ICODE ADDR : CPU Requests Addr 0x%08X (HTRANS=%b)", $time, ICODE_HADDR, ICODE_HTRANS);
                icode_addr_reg <= ICODE_HADDR;
                icode_data_expected <= 1'b1;
            end else begin
                icode_data_expected <= 1'b0;
            end
        end
    end

    reg [31:0] dcode_addr_reg;
    reg        dcode_is_write;
    reg        dcode_data_expected;

    always @(posedge HCLK) begin
        if (!HRESETn) begin
            dcode_data_expected <= 0;
        end else begin
            if (dcode_data_expected) begin
                if (dcode_is_write)
                    $display("[%0t ps] DCODE DATA : Wrote 0x%08X to Addr 0x%08X", $time, DCODE_HWDATA, dcode_addr_reg);
                else
                    $display("[%0t ps] DCODE DATA : Received 0x%08X for Addr 0x%08X", $time, DCODE_HRDATA, dcode_addr_reg);
            end

            if (DCODE_HTRANS[1]) begin
                $display("[%0t ps] DCODE ADDR : CPU Requests Addr 0x%08X (Write=%b)", $time, DCODE_HADDR, DCODE_HWRITE);
                dcode_addr_reg <= DCODE_HADDR;
                dcode_is_write <= DCODE_HWRITE;
                dcode_data_expected <= 1'b1;
            end else begin
                dcode_data_expected <= 1'b0;
            end
        end
    end

endmodule
