`timescale 1ns / 1ps

module tb_soc_top();

    // ==========================================
    // 1. System Clock and Reset
    // ==========================================
    logic HCLK_base;
    logic HCLK;
    logic HRESETn;

    initial begin
        HCLK_base = 0;
        forever #10 HCLK_base = ~HCLK_base; // 50 MHz System Clock
    end

    assign #1ps HCLK = HCLK_base;

    initial begin
        HRESETn = 0;
        repeat (20) @(posedge HCLK_base);
        @(negedge HCLK_base);
        #5;
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
        $error("[DUAL MODE TB] TIMEOUT before read/write/erase workload completed.");
        $finish;
    end

    // ==========================================
    // 8. Dual-Mode Read / Program / Erase Monitor
    // ==========================================
    logic        flash_read_active;
    logic [31:0] flash_read_addr;
    logic        flash_write_active;
    logic [31:0] flash_write_addr;
    logic        done_write_active;
    logic [31:0] phase;
    time         reset_release_time;
    time         boot_read_done_time;
    time         program_issue_time;
    time         program_read_done_time;
    time         erase_issue_time;
    time         erase_read_done_time;
    time         final_read_done_time;

    localparam [31:0] PH_BOOT_READ       = 32'd0;
    localparam [31:0] PH_PROGRAM_WRITE   = 32'd1;
    localparam [31:0] PH_PROGRAM_READ    = 32'd2;
    localparam [31:0] PH_ERASE_WRITE     = 32'd3;
    localparam [31:0] PH_ERASE_READ      = 32'd4;
    localparam [31:0] PH_FINAL_READ      = 32'd5;
    localparam [31:0] PH_DONE_MARKER     = 32'd6;

    function automatic is_payload_addr(input logic [31:0] addr);
        begin
            is_payload_addr = (addr == 32'h4000_0000 ||
                               addr == 32'h4000_000c ||
                               addr == 32'h4000_1000);
        end
    endfunction

    function automatic [31:0] expected_flash_data(input logic [31:0] addr, input logic [31:0] cur_phase);
        begin
            case (cur_phase)
                PH_BOOT_READ:    expected_flash_data = 32'h4902_4801;
                PH_PROGRAM_READ: expected_flash_data = 32'h1234_5678;
                PH_ERASE_READ:   expected_flash_data = 32'hffff_ffff;
                PH_FINAL_READ:   expected_flash_data = 32'haabb_ccdd;
                default:         expected_flash_data = 32'hxxxx_xxxx;
            endcase
        end
    endfunction

    initial begin
        flash_read_active = 1'b0;
        flash_read_addr = 32'h0;
        flash_write_active = 1'b0;
        flash_write_addr = 32'h0;
        done_write_active = 1'b0;
        phase = PH_BOOT_READ;
        reset_release_time = 0;
        boot_read_done_time = 0;
        program_issue_time = 0;
        program_read_done_time = 0;
        erase_issue_time = 0;
        erase_read_done_time = 0;
        final_read_done_time = 0;
        wait (HRESETn === 1'b1);
        reset_release_time = $time;
    end

    always @(posedge HCLK) begin
        if (HRESETn && SYS_HREADY) begin
            if (flash_read_active) begin
                if (SYS_HRDATA !== expected_flash_data(flash_read_addr, phase)) begin
                    $error("[DUAL MODE TB] Read mismatch at %08h in phase %0d: expected %08h, got %08h",
                           flash_read_addr, phase, expected_flash_data(flash_read_addr, phase), SYS_HRDATA);
                    $finish;
                end

                $display("[%0t] [DUAL MODE TB] Read OK phase %0d: %08h -> %08h",
                         $time, phase, flash_read_addr, SYS_HRDATA);

                case (phase)
                    PH_BOOT_READ: begin
                        boot_read_done_time = $time;
                        phase = PH_PROGRAM_WRITE;
                    end
                    PH_PROGRAM_READ: begin
                        program_read_done_time = $time;
                        phase = PH_ERASE_WRITE;
                    end
                    PH_ERASE_READ: begin
                        erase_read_done_time = $time;
                        phase = PH_FINAL_READ;
                    end
                    PH_FINAL_READ: begin
                        final_read_done_time = $time;
                        phase = PH_DONE_MARKER;
                    end
                endcase
            end

            if (flash_write_active) begin
                case (phase)
                    PH_PROGRAM_WRITE: begin
                        if (flash_write_addr !== 32'h4000_1000 || SYS_HWDATA !== 32'h1234_5678) begin
                            $error("[DUAL MODE TB] Program request mismatch: addr %08h data %08h",
                                   flash_write_addr, SYS_HWDATA);
                            $finish;
                        end
                        program_issue_time = $time;
                        phase = PH_PROGRAM_READ;
                        $display("[%0t] [DUAL MODE TB] Program request observed: %08h -> %08h",
                                 $time, SYS_HWDATA, flash_write_addr);
                    end
                    PH_ERASE_WRITE: begin
                        if (flash_write_addr !== 32'h4000_1000 || SYS_HWDATA !== 32'hffff_ffff) begin
                            $error("[DUAL MODE TB] Erase request mismatch: addr %08h data %08h",
                                   flash_write_addr, SYS_HWDATA);
                            $finish;
                        end
                        erase_issue_time = $time;
                        phase = PH_ERASE_READ;
                        $display("[%0t] [DUAL MODE TB] Erase request observed: %08h -> %08h",
                                 $time, SYS_HWDATA, flash_write_addr);
                    end
                    default: begin
                        $error("[DUAL MODE TB] Unexpected flash write in phase %0d: addr %08h data %08h",
                               phase, flash_write_addr, SYS_HWDATA);
                        $finish;
                    end
                endcase
            end

            if (done_write_active) begin
                if (SYS_HWDATA !== 32'haabb_ccdd) begin
                    $error("[DUAL MODE TB] Completion marker mismatch: expected aabbccdd, got %08h", SYS_HWDATA);
                    $finish;
                end

                $display("\n*******************************************************");
                $display("[%0t] DUAL MODE SUCCESS: READ + PROGRAM + ERASE VERIFIED", $time);
                $display("Initial XIP read latency : %0t ps", boot_read_done_time - reset_release_time);
                $display("Program transaction time : %0t ps", program_read_done_time - program_issue_time);
                $display("Erase transaction time   : %0t ps", erase_read_done_time - erase_issue_time);
                $display("Final XIP read latency   : %0t ps", final_read_done_time - erase_read_done_time);
                $display("Total benchmark time     : %0t ps", $time - reset_release_time);
                $display("*******************************************************\n");
                #100; $finish;
            end

            flash_read_active <= (!SYS_HWRITE && SYS_HTRANS[1] && is_payload_addr(SYS_HADDR));
            flash_read_addr   <= SYS_HADDR;
            flash_write_active <= (SYS_HWRITE && SYS_HTRANS[1] && SYS_HADDR == 32'h4000_1000);
            flash_write_addr   <= SYS_HADDR;
            done_write_active <= (SYS_HWRITE && SYS_HTRANS[1] && SYS_HADDR == 32'h2000_8000);
        end
    end

endmodule
