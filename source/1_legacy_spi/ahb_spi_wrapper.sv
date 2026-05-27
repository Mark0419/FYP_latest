`timescale 1ns / 1ps

module ahb_spi_legacy (
    input  wire        HCLK,
    input  wire        HRESETn,

    // Full AMBA AHB Slave Interface
    input  wire        HSEL,
    input  wire [31:0] HADDR,
    input  wire [1:0]  HTRANS,
    input  wire        HWRITE,
    input  wire [2:0]  HSIZE,
    input  wire [2:0]  HBURST,
    input  wire [3:0]  HPROT,
    input  wire [3:0]  HMASTER,
    input  wire        HMASTLOCK,
    input  wire [31:0] HWDATA,
    input  wire        HREADY,

    output reg  [31:0] HRDATA,
    output wire        HREADYOUT,
    output wire [1:0]  HRESP,
    output wire [15:0] HSPLIT,

    // Physical SPI Pins
    output wire        spi_cs_n,
    output wire        spi_clk,
    output wire        spi_mosi,
    input  wire        spi_miso
);

    localparam TR_NONSEQ = 2'b10;
    localparam TR_SEQ    = 2'b11;

    assign HSPLIT = 16'h0000;
    assign HRESP  = 2'b00; 
    assign HREADYOUT = 1'b1; 

    // AHB Pipeline Registers
    reg [31:0] addr_reg;
    reg        write_en_reg;
    reg        valid_trans_reg;

    wire ahb_valid_access = HSEL && HREADY && (HTRANS == TR_NONSEQ || HTRANS == TR_SEQ);

    always @(posedge HCLK or negedge HRESETn) begin
        if (!HRESETn) begin
            addr_reg        <= 32'h0;
            write_en_reg    <= 1'b0;
            valid_trans_reg <= 1'b0;
        end else if (HREADY) begin
            valid_trans_reg <= ahb_valid_access;
            if (ahb_valid_access) begin
                addr_reg     <= HADDR; 
                write_en_reg <= HWRITE;
            end
        end
    end

    // Memory-Mapped Registers (MMRs)
    reg [31:0] ctrl_reg;       
    reg [7:0]  cmd_reg;        
    reg [31:0] flash_addr_reg; // UPGRADED TO 32-BIT
    reg [31:0] tx_data_reg;    
    
    wire [31:0] rx_data_wire; 
    wire        spi_busy;     

    wire internal_we = valid_trans_reg && write_en_reg;
    wire internal_re = valid_trans_reg && !write_en_reg;

    // Write Logic
    always @(posedge HCLK or negedge HRESETn) begin
        if (!HRESETn) begin
            ctrl_reg       <= 32'h0;
            cmd_reg        <= 8'h0;
            flash_addr_reg <= 32'h0;
            tx_data_reg    <= 32'h0;
        end else begin
            if (ctrl_reg[0]) ctrl_reg[0] <= 1'b0; 

            if (internal_we) begin
                case (addr_reg[7:0])
                    8'h00: ctrl_reg[0]    <= HWDATA[0]; 
                    8'h04: cmd_reg        <= HWDATA[7:0];
                    8'h08: flash_addr_reg <= HWDATA;       // UPGRADED TO 32-BIT
                    8'h0C: tx_data_reg    <= HWDATA;
                endcase
            end
        end
    end

    // Read Logic
    always @(*) begin
        HRDATA = 32'h0;
        if (internal_re) begin
            case (addr_reg[7:0])
                8'h00: HRDATA = {30'h0, spi_busy, ctrl_reg[0]}; 
                8'h04: HRDATA = {24'h0, cmd_reg};
                8'h08: HRDATA = flash_addr_reg;            // UPGRADED TO 32-BIT
                8'h0C: HRDATA = rx_data_wire;
                default: HRDATA = 32'h0;
            endcase
        end
    end

    // The Physical SPI Serializer Engine
    spi_serializer_fsm u_spi_fsm (
        .clk        (HCLK),
        .rst_n      (HRESETn),
        .start      (ctrl_reg[0]),
        .cmd        (cmd_reg),
        .flash_addr (flash_addr_reg),
        .tx_data    (tx_data_reg),
        .spi_busy   (spi_busy),
        .rx_data    (rx_data_wire),
        .spi_cs_n   (spi_cs_n),
        .spi_clk    (spi_clk),
        .spi_mosi   (spi_mosi),
        .spi_miso   (spi_miso)
    );

endmodule
