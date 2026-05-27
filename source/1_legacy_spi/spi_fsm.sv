`timescale 1ns / 1ps

module spi_serializer_fsm (
    input  logic        clk,
    input  logic        rst_n,
    
    input  logic        start,
    input  logic [7:0]  cmd,
    input  logic [31:0] flash_addr,
    input  logic [31:0] tx_data,
    
    output logic        spi_busy,
    output logic [31:0] rx_data,
    
    output logic        spi_cs_n,
    output logic        spi_clk,
    output logic        spi_mosi,
    input  logic        spi_miso
);

    typedef enum logic [2:0] {
        IDLE, CMD_ST, ADDR_ST, DATA_ST, DONE_ST
    } state_t;
    
    state_t state, next_state;
    logic [5:0]  bit_cnt;       
    logic [31:0] shift_tx;      
    logic [31:0] shift_rx;      

    assign rx_data = shift_rx;

    // TX Logic (Triggers on POSEDGE clk)
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state    <= IDLE;
            bit_cnt  <= 6'd0;
            shift_tx <= 32'd0;
            spi_cs_n <= 1'b1;
        end else begin
            state <= next_state;
            spi_cs_n <= (next_state == IDLE || next_state == DONE_ST);

            case (state)
                IDLE: begin
                    if (start) begin
                        shift_tx <= {cmd, 24'd0}; 
                        bit_cnt  <= 6'd7;         
                    end
                end
                CMD_ST: begin
                    if (bit_cnt == 0) begin
                        shift_tx <= flash_addr;
                        bit_cnt  <= 6'd31;
                    end else begin
                        shift_tx <= {shift_tx[30:0], 1'b0}; 
                        bit_cnt  <= bit_cnt - 1;
                    end
                end
                ADDR_ST: begin
                    if (bit_cnt == 0) begin
                        shift_tx <= tx_data;
                        bit_cnt  <= 6'd31;                  
                    end else begin
                        shift_tx <= {shift_tx[30:0], 1'b0};
                        bit_cnt  <= bit_cnt - 1;
                    end
                end
                DATA_ST: begin
                    if (bit_cnt > 0) begin
                        shift_tx <= {shift_tx[30:0], 1'b0};
                        bit_cnt  <= bit_cnt - 1;
                    end
                end
                DONE_ST: begin end
            endcase
        end
    end

    // RX Logic (Triggers on NEGEDGE clk)
    always_ff @(negedge clk or negedge rst_n) begin
        if (!rst_n) begin
            shift_rx <= 32'd0;
        end else begin
            if (state == DATA_ST) begin
                if (bit_cnt == 6'd31) begin
                    shift_rx <= {31'd0, spi_miso};
                end else begin
                    shift_rx <= {shift_rx[30:0], spi_miso};
                end
            end
        end
    end

    // Combinational Next State
    always_comb begin
        next_state = state;
        case (state)
            IDLE:    if (start) next_state = CMD_ST;
            CMD_ST:  if (bit_cnt == 0) next_state = ADDR_ST;
            ADDR_ST: if (bit_cnt == 0) next_state = DATA_ST;
            DATA_ST: if (bit_cnt == 0) next_state = DONE_ST;
            DONE_ST: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    // Output Mapping
    assign spi_mosi = shift_tx[31];
    assign spi_busy = (state != IDLE);
    assign spi_clk  = (state == CMD_ST || state == ADDR_ST || state == DATA_ST) ? ~clk : 1'b0;

endmodule
