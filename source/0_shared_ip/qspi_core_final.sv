`timescale 1ns / 1ps

module qspi_fsm (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        start,
    input  logic [31:0] addr_in,
    input  logic        write_op,
    output logic        ready,
    input  logic [31:0] tx_data,
    input  logic        tx_empty,
    output logic        tx_pop,
    output logic [31:0] rx_data,
    input  logic        rx_full,
    output logic        rx_push,
    output logic        qspi_cs_n,
    output logic        qspi_clk,
    output logic [3:0]  qspi_io_out,
    output logic        qspi_io_oe,
    input  logic [3:0]  qspi_io_in
);

    typedef enum logic [3:0] {
        IDLE, WRITE_ENABLE, WE_CS_HIGH, CMD, ADDR, MODE, DUMMY, DATA, PROGRAM_WAIT
    } state_t;

    state_t current_state, next_state;

    logic [5:0]  bit_cnt;
    logic [31:0] shift_reg;
    logic [7:0]  current_cmd;
    logic        is_write_op;
    logic [15:0] wait_counter;
    logic [31:0] stored_addr;
    logic [31:0] read_data_reg;
    
    // --- XIP UPGRADE: Flag to track Continuous Read Mode ---
    logic        xip_enabled; 

    localparam CMD_QUAD_READ_4B    = 8'hEC;
    localparam CMD_QUAD_WRITE_4B   = 8'h34;
    localparam CMD_WRITE_ENABLE    = 8'h06;
    localparam CMD_SECTOR_ERASE_4B = 8'h21;

    // --- Combinational RX Push ---
    assign rx_push = (current_state == DATA && current_cmd == CMD_QUAD_READ_4B && bit_cnt == 7) && !rx_full;
    assign rx_data = {read_data_reg[27:0], qspi_io_in};

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_state <= IDLE;
            bit_cnt       <= 0;
            shift_reg     <= 0;
            current_cmd   <= 0;
            is_write_op   <= 0;
            wait_counter  <= 0;
            stored_addr   <= 0;
            read_data_reg <= 0;
            tx_pop        <= 0;
            xip_enabled   <= 0; // XIP disabled on reset
        end else begin
            current_state <= next_state;
            tx_pop  <= 0; 

            if (current_state == IDLE && next_state != IDLE) begin
                stored_addr <= addr_in;
                is_write_op <= write_op;
            end

            if (current_state != next_state) begin
                bit_cnt <= 0;
                wait_counter <= 0;
            end else begin
                bit_cnt <= bit_cnt + 1;
                wait_counter <= wait_counter + 1;
            end

            case (current_state)
                IDLE: begin
                    if (start) begin
                        if (write_op) begin
                            shift_reg <= {CMD_WRITE_ENABLE, 24'b0};
                            xip_enabled <= 0; // XIP UPGRADE: Any write breaks XIP mode
                        end else begin
                            current_cmd <= CMD_QUAD_READ_4B;
                            // XIP UPGRADE: Check flag. If 1, jump straight to ADDR payload.
                            if (xip_enabled) begin
                                shift_reg <= addr_in; 
                            end else begin
                                shift_reg <= {CMD_QUAD_READ_4B, 24'b0};
                            end
                        end
                    end
                end

                WRITE_ENABLE: begin
                    shift_reg <= {shift_reg[30:0], 1'b0};
                end

                WE_CS_HIGH: begin
                    if (is_write_op && !tx_empty && tx_data == 32'hFFFFFFFF) begin
                        current_cmd <= CMD_SECTOR_ERASE_4B;
                        shift_reg <= {CMD_SECTOR_ERASE_4B, 24'b0};
                    end else begin
                        current_cmd <= CMD_QUAD_WRITE_4B;
                        shift_reg <= {CMD_QUAD_WRITE_4B, 24'b0};
                    end
                end

                CMD: begin
                    if (bit_cnt == 7) shift_reg <= stored_addr;
                    else shift_reg <= {shift_reg[30:0], 1'b0};
                end

                ADDR: begin
                    if (bit_cnt == 7) begin
                        if (current_cmd == CMD_QUAD_WRITE_4B) begin
                            if (!tx_empty) begin
                                shift_reg <= tx_data; 
                                tx_pop    <= 1; 
                            end
                        end else if (current_cmd == CMD_SECTOR_ERASE_4B) begin
                            if (!tx_empty) tx_pop <= 1; 
                            read_data_reg <= 0;
                        end else begin
                            // XIP UPGRADE: Load 0xA5 Continuous Read Mode Byte
                            shift_reg <= {8'hA5, 24'b0}; 
                            read_data_reg <= 0;
                        end
                    end else begin
                        shift_reg <= {shift_reg[27:0], 4'b0};
                    end
                end

                // ---> ADDED: MODE STATE SHIFT LOGIC <---
                MODE: begin
                    // Shift the 'A5' left by 4 bits so the '5' is output on the second clock cycle
                    shift_reg <= {shift_reg[27:0], 4'b0};
                end

                DATA: begin
                    if (bit_cnt == 7) begin
                        if (current_cmd == CMD_QUAD_READ_4B) begin
                            read_data_reg <= {read_data_reg[27:0], qspi_io_in};
                            // XIP UPGRADE: Read finished successfully, enable XIP bypass
                            xip_enabled <= 1'b1; 
                        end else if (current_cmd == CMD_QUAD_WRITE_4B) begin
                            shift_reg <= {shift_reg[27:0], 4'b0};
                            // XIP UPGRADE: Write operation breaks XIP mode
                            xip_enabled <= 1'b0; 
                        end
                    end else begin
                        if (current_cmd == CMD_QUAD_READ_4B) begin
                             read_data_reg <= {read_data_reg[27:0], qspi_io_in};
                        end else if (current_cmd == CMD_QUAD_WRITE_4B) begin
                             shift_reg <= {shift_reg[27:0], 4'b0};
                        end
                    end
                end
            endcase
        end
    end

    always_comb begin
        next_state = current_state;
        case (current_state)
            IDLE: begin
                if (start) begin
                    if (write_op) next_state = WRITE_ENABLE;
                    // XIP UPGRADE: Bypass CMD state if flag is active
                    else if (xip_enabled) next_state = ADDR; 
                    else next_state = CMD;
                end
            end
            WRITE_ENABLE: begin
                if (bit_cnt == 7) next_state = WE_CS_HIGH;
            end
            WE_CS_HIGH: begin
                if (wait_counter >= 4) next_state = CMD;
            end
            CMD: begin
                if (bit_cnt == 7) next_state = ADDR;
            end
            ADDR: begin
                if (bit_cnt == 7) begin
                    if (current_cmd == CMD_QUAD_READ_4B) next_state = MODE;
                    else if (current_cmd == CMD_QUAD_WRITE_4B) next_state = DATA;
                    else next_state = PROGRAM_WAIT;  
                end
            end
            MODE: begin
                if (bit_cnt == 1) next_state = DUMMY;
            end
            DUMMY: begin
                if (bit_cnt == 3) next_state = DATA;
            end
            DATA: begin
                if (bit_cnt == 7) begin
                    if (current_cmd == CMD_QUAD_WRITE_4B) next_state = PROGRAM_WAIT;
                    else next_state = IDLE;
                end
            end
            PROGRAM_WAIT: begin
                if (wait_counter >= 50) next_state = IDLE;
            end
        endcase
    end

    always_comb begin
        qspi_cs_n   = 1;
        qspi_io_oe  = 0;
        qspi_io_out = 4'b0000;
        ready       = 0;
        qspi_clk    = 0;

        if (current_state != IDLE && current_state != WE_CS_HIGH && current_state != PROGRAM_WAIT) begin
            qspi_clk = clk;
        end

        case (current_state)
            IDLE: begin ready = 1; end
            WRITE_ENABLE, CMD: begin
                qspi_cs_n   = 0;
                qspi_io_oe  = 1;
                qspi_io_out = {3'b000, shift_reg[31]};
            end
            WE_CS_HIGH: begin qspi_cs_n = 1; end
            ADDR, MODE: begin
                qspi_cs_n   = 0;
                qspi_io_oe  = 1;
                qspi_io_out = shift_reg[31:28];
            end
            DUMMY: begin
                qspi_cs_n = 0;
                qspi_io_oe = 0;
            end
            DATA: begin
                qspi_cs_n = 0;
                if (current_cmd == CMD_QUAD_WRITE_4B) begin
                    qspi_io_oe  = 1;
                    qspi_io_out = shift_reg[31:28];
                end else begin
                    qspi_io_oe = 0;
                end
            end
            PROGRAM_WAIT: begin
                qspi_cs_n = 1;
                ready = (wait_counter >= 50);
            end
        endcase
    end
endmodule
