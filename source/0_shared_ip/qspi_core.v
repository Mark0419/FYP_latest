module qspi_fsm (
    input        clk,
    input        rst_n,

    input        start,
    input  [31:0] addr_in,
    input  [31:0] data_in,
    input        write_op,
    output [31:0] data_out,
    output       ready,

    output       qspi_cs_n,
    output       qspi_clk,
    output [3:0]  qspi_io_out,
    output       qspi_io_oe,
    input  [3:0]  qspi_io_in
);

    // State definitions
    parameter IDLE = 4'd0;
    parameter WRITE_ENABLE = 4'd1;
    parameter WE_CS_HIGH = 4'd2;
    parameter CMD = 4'd3;
    parameter ADDR = 4'd4;
    parameter MODE = 4'd5;
    parameter DUMMY = 4'd6;
    parameter DATA = 4'd7;
    parameter PROGRAM_WAIT = 4'd8;

    reg  [3:0] current_state, next_state;
    reg  [5:0] bit_cnt;
    reg  [31:0] shift_reg;
    reg  [7:0] current_cmd;
    reg        is_write_op;
    reg        is_erase_op;
    reg  [15:0] wait_counter;
    reg  [31:0] stored_addr;
    reg  [31:0] stored_data;
    reg  [31:0] read_data_reg;
    reg  [31:0] final_read_data;
    
    // Output registers for combinational logic
    reg        qspi_cs_n_r;
    reg        qspi_io_oe_r;
    reg  [3:0] qspi_io_out_r;
    reg        ready_r;
    reg        qspi_clk_r;

    // Flash Commands
    localparam CMD_QUAD_READ_4B    = 8'hEC;
    localparam CMD_QUAD_WRITE_4B   = 8'h34;
    localparam CMD_WRITE_ENABLE    = 8'h06;
    localparam CMD_SECTOR_ERASE_4B = 8'h21;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_state <= IDLE;
            bit_cnt       <= 0;
            shift_reg     <= 0;
            current_cmd   <= 0;
            is_write_op   <= 0;
            is_erase_op   <= 0;
            wait_counter  <= 0;
            stored_addr   <= 0;
            stored_data   <= 0;
            read_data_reg <= 0;
            final_read_data <= 0;
        end else begin
            current_state <= next_state;

            if (current_state == IDLE && next_state != IDLE) begin
                stored_addr <= addr_in;
                stored_data <= data_in;
                is_write_op <= write_op;
                is_erase_op <= write_op && (data_in == 32'hFFFFFFFF);
                $display("FSM: Stored addr=%08h, data=%08h, write_op=%b", addr_in, data_in, write_op);
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
                        end else begin
                            current_cmd <= CMD_QUAD_READ_4B;
                            shift_reg <= {CMD_QUAD_READ_4B, 24'b0};
                        end
                    end
                end

                WRITE_ENABLE: begin
                    shift_reg <= {shift_reg[30:0], 1'b0};
                end

                WE_CS_HIGH: begin
                    if (is_erase_op) begin
                        current_cmd <= CMD_SECTOR_ERASE_4B;
                        shift_reg <= {CMD_SECTOR_ERASE_4B, 24'b0};
                    end else begin
                        current_cmd <= CMD_QUAD_WRITE_4B;
                        shift_reg <= {CMD_QUAD_WRITE_4B, 24'b0};
                    end
                end

                CMD: begin
                    if (bit_cnt == 7) begin
                        shift_reg <= stored_addr;
                        $display("FSM: Loading address %08h into shift_reg", stored_addr);
                    end else begin
                        shift_reg <= {shift_reg[30:0], 1'b0};
                    end
                end

                ADDR: begin
                    if (bit_cnt == 7) begin
                        if (current_cmd == CMD_QUAD_WRITE_4B) begin
                            shift_reg <= stored_data;
                        end else begin
                            read_data_reg <= 0;
                        end
                    end else begin
                        shift_reg <= {shift_reg[27:0], 4'b0};
                    end
                end

                DATA: begin
                    if (current_cmd == CMD_QUAD_READ_4B) begin
                        read_data_reg <= {read_data_reg[27:0], qspi_io_in};
                        
                        if (bit_cnt == 7) begin
                            final_read_data <= {read_data_reg[27:0], qspi_io_in};
                        end
                    end else if (current_cmd == CMD_QUAD_WRITE_4B) begin
                        shift_reg <= {shift_reg[27:0], 4'b0};
                    end
                end
            endcase
        end
    end

    always @(*) begin
        next_state = current_state;

        case (current_state)
            IDLE: begin
                if (start) begin
                    if (write_op) next_state = WRITE_ENABLE;
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

    always @(*) begin
        qspi_cs_n_r   = 1;
        qspi_io_oe_r  = 0;
        qspi_io_out_r = 4'b0000;
        ready_r       = 0;
        qspi_clk_r    = 0;

        if (current_state != IDLE && current_state != WE_CS_HIGH && current_state != PROGRAM_WAIT) begin
            qspi_clk_r = clk;
        end

        case (current_state)
            IDLE: begin
                ready_r = 1;
            end
            
            WRITE_ENABLE: begin
                qspi_cs_n_r   = 0;
                qspi_io_oe_r  = 1;
                qspi_io_out_r = {3'b000, shift_reg[31]};
            end

            WE_CS_HIGH: begin
                qspi_cs_n_r = 1;
            end
            
            CMD: begin
                qspi_cs_n_r   = 0;
                qspi_io_oe_r  = 1;
                qspi_io_out_r = {3'b000, shift_reg[31]};
            end
            
            ADDR, MODE: begin
                qspi_cs_n_r   = 0;
                qspi_io_oe_r  = 1;
                qspi_io_out_r = shift_reg[31:28];
            end
            
            DUMMY: begin
                qspi_cs_n_r = 0;
                qspi_io_oe_r = 0;
            end
            
            DATA: begin
                qspi_cs_n_r = 0;
                if (current_cmd == CMD_QUAD_WRITE_4B) begin
                    qspi_io_oe_r  = 1;
                    qspi_io_out_r = shift_reg[31:28];
                end else begin
                    qspi_io_oe_r = 0;
                end
            end
            
            PROGRAM_WAIT: begin
                qspi_cs_n_r = 1;
                ready_r = (wait_counter >= 50);
            end
        endcase
    end

    // Assign internal registers to output ports
    assign qspi_cs_n = qspi_cs_n_r;
    assign qspi_io_oe = qspi_io_oe_r;
    assign qspi_io_out = qspi_io_out_r;
    assign ready = ready_r;
    assign qspi_clk = qspi_clk_r;
    assign data_out = final_read_data;

endmodule
