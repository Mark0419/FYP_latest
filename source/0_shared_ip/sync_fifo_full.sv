`timescale 1ns / 1ps

module sync_fifo #(parameter DATA_WIDTH = 32, DEPTH = 8) (
    input  logic clk, rst_n, clr,
    input  logic write_en, read_en,
    input  logic [DATA_WIDTH-1:0] write_data,
    output logic [DATA_WIDTH-1:0] read_data,
    output logic full, empty
);
    logic [DATA_WIDTH-1:0] mem [DEPTH-1:0];
    logic [$clog2(DEPTH)-1:0] wptr, rptr;
    logic [$clog2(DEPTH):0] count;

    assign full  = (count == DEPTH);
    assign empty = (count == 0);
    assign read_data = mem[rptr];

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n || clr) begin
            wptr <= 0; rptr <= 0; count <= 0;
        end else begin
            if (write_en && !full) begin
                mem[wptr] <= write_data;
                wptr <= wptr + 1;
            end
            if (read_en && !empty) begin
                rptr <= rptr + 1;
            end
            
            if (write_en && !full && !(read_en && !empty))
                count <= count + 1;
            else if (read_en && !empty && !(write_en && !full))
                count <= count - 1;
        end
    end
endmodule
