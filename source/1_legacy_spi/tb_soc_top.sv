
`timescale 1ns / 1ps

module tb_soc_top();

    // =========================================================================
    // 1. Clock and Reset (With CDC Skew)
    // =========================================================================
    logic HCLK_base;
    logic FCLK;
    logic HCLK;
    logic PORESETn;
    logic SYSRESETn;
    time  reset_release_time;
    time  init_done_time;
    time  op_done_time;

    initial begin
        HCLK_base = 0;
        forever #10 HCLK_base = ~HCLK_base; 
    end

    assign FCLK = HCLK_base;
    assign #1ps HCLK = HCLK_base; 

    initial begin
        PORESETn  = 1'b0;
        SYSRESETn = 1'b0;
        
        repeat (20) @(posedge HCLK_base);
        
        @(negedge HCLK_base);
        #5; 
        PORESETn  = 1'b1;
        SYSRESETn = 1'b1;
        
        $display("\n=======================================================");
        $display("[%0t] RESETS LIFTED. CORTEX-M3 AWAKE.", $time);
        $display("=======================================================\n");
        reset_release_time = $time;
    end

    // =========================================================================
    // 2. ARM Cortex-M3 Harvard Bus Signals
    // =========================================================================
    wire [31:0] HADDRI, HRDATAI;
    wire [1:0]  HTRANSI, HRESPI;
    wire [2:0]  HSIZEI, HBURSTI;
    wire [3:0]  HPROTI;
    wire        HREADYI;

    wire [31:0] HADDRD, HWDATAD, HRDATAD;
    wire [1:0]  HTRANSD, HRESPD;
    wire [2:0]  HSIZED, HBURSTD;
    wire [3:0]  HPROTD;
    wire        HWRITED, HREADYD;

    wire [31:0] HADDRS, HWDATAS, HRDATAS;
    wire [1:0]  HTRANSS, HRESPS;
    wire [2:0]  HSIZES, HBURSTS;
    wire [3:0]  HPROTS;
    wire        HWRITES, HREADYS, HMASTLOCKS;

    // =========================================================================
    // 3. The CPU (Fully Hard-Tied for Silicon Verification)
    // =========================================================================
    wire dbg_pwr_req;

    CORTEXM3INTEGRATION u_cpu (
        .ISOLATEn       (1'b1),
        .RETAINn        (1'b1),
        .PORESETn       (PORESETn),
        .SYSRESETn      (SYSRESETn),
        .FCLK           (FCLK),
        .HCLK           (HCLK),
        
        .CDBGPWRUPREQ   (dbg_pwr_req),
        .CDBGPWRUPACK   (dbg_pwr_req),
        
        // --- THE LINTER REVELATIONS: Core Life-Support ---
        .SLEEPHOLDREQn  (1'b1), // CRITICAL: Prevent Core Sleep
        .SE             (1'b0), // CRITICAL: Disable Scan-Chain Mode
        .BIGEND         (1'b0), // CRITICAL: Force Little Endian
        .IFLUSH         (1'b0), // CRITICAL: Prevent constant pipeline flushing
        .RSTBYPASS      (1'b0),
        .AUXFAULT       (1'b0),
        .INTNMI         (1'b0), 
        .INTISR         ('0),   
        .DBGEN          (1'b0),
        .nTRST          (1'b1),
        .SWCLKTCK       (1'b0),
        .SWDITMS        (1'b0),
        .TDI            (1'b0),
        .CGBYPASS       (1'b0),
        .TRACECLKIN     (1'b0),
        .STCLK          (1'b0),
        .STCALIB        ('0),
        .EXRESPD        (1'b0),
        .EXRESPS        (1'b0),
        .WICENREQ       (1'b0),
        .FIXMASTERTYPE  (1'b0),
        .TSVALUEB       ('0),
        .TSCLKCHANGE    (1'b0),
        .MPUDISABLE     (1'b0),
        .TBENCHINPUTS   ('0),
        .EDBGRQ         (1'b0),
        .DBGRESTART     (1'b0),
        .RXEV           (1'b0),
        // -------------------------------------------------

        .HADDRI(HADDRI), .HTRANSI(HTRANSI), .HSIZEI(HSIZEI), .HBURSTI(HBURSTI),
        .HPROTI(HPROTI), .HRDATAI(HRDATAI), .HREADYI(HREADYI), .HRESPI(HRESPI),

        .HADDRD(HADDRD), .HTRANSD(HTRANSD), .HSIZED(HSIZED), .HBURSTD(HBURSTD),
        .HPROTD(HPROTD), .HWRITED(HWRITED), .HWDATAD(HWDATAD), .HRDATAD(HRDATAD),
        .HREADYD(HREADYD), .HRESPD(HRESPD),

        .HADDRS(HADDRS), .HTRANSS(HTRANSS), .HSIZES(HSIZES), .HBURSTS(HBURSTS),
        .HPROTS(HPROTS), .HWRITES(HWRITES), .HWDATAS(HWDATAS), .HRDATAS(HRDATAS),
        .HREADYS(HREADYS), .HRESPS(HRESPS), .HMASTLOCKS(HMASTLOCKS)
    );

    // =========================================================================
    // 4. Native Dual-Port Harvard ROM
    // =========================================================================
    ahb_rom u_rom (
        .HCLK    (HCLK),
        .HRESETn (SYSRESETn),
        .HADDRI  (HADDRI), .HTRANSI (HTRANSI), .HRDATAI (HRDATAI), .HREADYI (HREADYI), .HRESPI  (HRESPI),
        .HADDRD  (HADDRD), .HTRANSD (HTRANSD), .HRDATAD (HRDATAD), .HREADYD (HREADYD), .HRESPD  (HRESPD)
    );

    // =========================================================================
    // 5. PIPELINED SYSTEM BUS MATRIX
    // =========================================================================
    wire HSEL_SRAM = (HADDRS[31:28] == 4'h2);
    wire HSEL_SPI  = (HADDRS[31:28] == 4'h4);
    
    reg sram_dp, spi_dp;
    always @(posedge HCLK or negedge SYSRESETn) begin
        if (!SYSRESETn) begin
            sram_dp <= 0; spi_dp <= 0;
        end else if (HREADYS) begin 
            sram_dp <= HSEL_SRAM && (HTRANSS == 2'b10 || HTRANSS == 2'b11);
            spi_dp  <= HSEL_SPI  && (HTRANSS == 2'b10 || HTRANSS == 2'b11);
        end
    end

    wire [31:0] HRDATA_SRAM, HRDATA_SPI;
    wire        HREADYOUT_SRAM, HREADYOUT_SPI;

    assign HRDATAS = (sram_dp) ? HRDATA_SRAM : (spi_dp) ? HRDATA_SPI : 32'h0;
    assign HREADYS = (sram_dp) ? HREADYOUT_SRAM : (spi_dp) ? HREADYOUT_SPI : 1'b1;
    assign HRESPS  = 2'b00;

    // =========================================================================
    // 6. System Slaves
    // =========================================================================
    sram_top_512kb u_sram (
        .HCLK(HCLK), .HRESETn(SYSRESETn), .HSEL(HSEL_SRAM),
        .HADDR(HADDRS), .HTRANS(HTRANSS), .HWRITE(HWRITES), .HSIZE(HSIZES),
        .HBURST(HBURSTS), .HPROT(HPROTS), .HMASTLOCK(HMASTLOCKS), .HWDATA(HWDATAS),
        .HREADY(HREADYS), .HRDATA(HRDATA_SRAM), .HREADYOUT(HREADYOUT_SRAM), .HRESP()
    );

    wire spi_cs_n, spi_clk, spi_mosi; reg spi_miso;
    ahb_spi_legacy u_spi (
        .HCLK(HCLK), .HRESETn(SYSRESETn), .HSEL(HSEL_SPI),
        .HADDR(HADDRS), .HTRANS(HTRANSS), .HWRITE(HWRITES), .HSIZE(HSIZES),
        .HBURST(HBURSTS), .HPROT(HPROTS), .HMASTER(4'h0), .HMASTLOCK(HMASTLOCKS),
        .HWDATA(HWDATAS), .HREADY(HREADYS), .HRDATA(HRDATA_SPI), .HREADYOUT(HREADYOUT_SPI),
        .HRESP(), .HSPLIT(), .spi_cs_n(spi_cs_n), .spi_clk(spi_clk), .spi_mosi(spi_mosi), .spi_miso(spi_miso)
    );

    // =========================================================================
    // 7. Mock External SPI Flash (Payload)
    // =========================================================================
    reg [31:0] flash_payload [0:3];
    initial begin
        flash_payload[0] = 32'h49024801; 
        flash_payload[1] = 32'hE7FE6001; 
        flash_payload[2] = 32'h20008000; 
        flash_payload[3] = 32'hAABBCCDD; 
    end

    integer spi_edge_cnt = 0;
    integer word_idx = 0;
    always @(negedge spi_clk or posedge spi_cs_n) begin
        if (spi_cs_n) begin
            spi_edge_cnt <= 0; spi_miso <= 1'b0;
        end else begin
            spi_edge_cnt <= spi_edge_cnt + 1;
            if (spi_edge_cnt >= 39 && spi_edge_cnt < 71)
                spi_miso <= flash_payload[word_idx][70 - spi_edge_cnt];
            else
                spi_miso <= 1'b0;
        end
    end
    always @(posedge spi_cs_n) begin
        if (SYSRESETn && word_idx < 3) word_idx = word_idx + 1;
    end

    // =========================================================================
    // 8. Verification Sniffer
    // =========================================================================
    reg        sniff_data_phase;
    reg [31:0] sniff_addr;
    reg        sniff_is_write;

    initial begin
        reset_release_time = 0;
        init_done_time = 0;
        op_done_time = 0;
    end

    function automatic is_bench_addr(input [31:0] addr);
        begin
            is_bench_addr = (addr == 32'h2000_0000 || addr == 32'h2000_0004 ||
                             addr == 32'h2000_0008 || addr == 32'h2000_000c ||
                             addr == 32'h2000_8000);
        end
    endfunction

    function automatic [31:0] expected_data(input [31:0] addr);
        begin
            case (addr)
                32'h2000_0000: expected_data = 32'h4902_4801;
                32'h2000_0004: expected_data = 32'he7fe_6001;
                32'h2000_0008: expected_data = 32'h2000_8000;
                32'h2000_000c: expected_data = 32'haabb_ccdd;
                32'h2000_8000: expected_data = 32'haabb_ccdd;
                default:       expected_data = 32'hxxxx_xxxx;
            endcase
        end
    endfunction

    always @(posedge HCLK_base) begin
        if (SYSRESETn) begin
            
            // X-Ray diagnostic restricted to only the D-Code bus to catch the Vector Fetch!
            if (HTRANSD == 2'b10 || HTRANSD == 2'b11) $display("[%0t] D-CODE FETCH <- Addr: %08h", $time, HADDRD);
            if (HTRANSI == 2'b10 || HTRANSI == 2'b11) $display("[%0t] I-CODE FETCH <- Addr: %08h", $time, HADDRI);

            if (HREADYS) begin
                if (sniff_data_phase) begin
                    if (sniff_is_write) $display("[%0t] SYS WRITE  -> Addr: %08h | Data: %08h", $time, sniff_addr, HWDATAS);
                    else                $display("[%0t] SYS READ   <- Addr: %08h | Data: %08h", $time, sniff_addr, HRDATAS);

                    if (sniff_is_write && is_bench_addr(sniff_addr) &&
                        HWDATAS !== expected_data(sniff_addr)) begin
                        $error("[PPA BENCH] Mismatch at %08h: expected %08h, got %08h",
                               sniff_addr, expected_data(sniff_addr), HWDATAS);
                        $finish;
                    end

                    if (sniff_is_write && sniff_addr == 32'h2000_000c) begin
                        init_done_time = $time;
                    end

                    if (sniff_addr == 32'h20008000 && HWDATAS == 32'hAABBCCDD) begin
                        op_done_time = $time;
                        $display("\n*******************************************************");
                        $display("[%0t] PPA BENCH SUCCESS: LEGACY SPI SHADOWING COMMON DATASET PASSED", $time);
                        $display("Init time       : %0t ps", init_done_time - reset_release_time);
                        $display("Operation time  : %0t ps", op_done_time - init_done_time);
                        $display("Total time      : %0t ps", op_done_time - reset_release_time);
                        $display("The Cortex-M3 successfully woke up from ROM, used the");
                        $display("Legacy SPI Controller to shadow 16 bytes of machine code");
                        $display("from Flash into SRAM, jumped to 0x20000001, and executed");
                        $display("the payload natively from SRAM!");
                        $display("Caught Magic Word 0x%08h at Address 0x%08h", HWDATAS, sniff_addr);
                        $display("*******************************************************\n");
                        #100; $finish;
                    end
                end
                if ((HSEL_SRAM || HSEL_SPI) && (HTRANSS == 2'b10 || HTRANSS == 2'b11)) begin
                    sniff_data_phase <= 1'b1; sniff_addr <= HADDRS; sniff_is_write <= HWRITES;
                end else begin
                    sniff_data_phase <= 1'b0;
                end
            end
        end
    end

    initial begin
        $fsdbDumpfile("tb_soc_top.fsdb");
        $fsdbDumpvars(1, tb_soc_top);
        $fsdbDumpvars(0, tb_soc_top.u_spi);	
        #50000; 
	
        $error("\n[%0t] ERROR: SIMULATION TIMEOUT.", $time);
        $finish;
    end
endmodule
