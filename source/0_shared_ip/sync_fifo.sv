`timescale 1ns / 1ps

module sync_fifo #(
    parameter DATA_WIDTH = 32,
    parameter DEPTH = 8
)(
    input  logic                  clk,
    input  logic                  rst_n,
    input  logic                  push,
    input  logic                  pop,
    input  logic [DATA_WIDTH-1:0] data_in,
    output logic [DATA_WIDTH-1:0] data_out,
    output logic                  full,
    output logic                  empty
);
    localparam ADDR_WIDTH = $clog2(DEPTH);
    
    logic [DATA_WIDTH-1:0] mem [0:DEPTH-1];
    logic [ADDR_WIDTH-1:0] wptr, rptr;
    logic [ADDR_WIDTH:0]   count; 

    assign full  = (count == DEPTH);
    assign empty = (count == 0);
    
    // --- FWFT: Combinational Read ---
    assign data_out = mem[rptr];

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wptr <= 0;
            rptr <= 0;
            count <= 0;
        end else begin
            if (push && !full) begin
                mem[wptr] <= data_in;
                wptr <= wptr + 1;
            end
            if (pop && !empty) begin
                rptr <= rptr + 1;
            end
            
            if (push && !full && (!pop || empty)) 
                count <= count + 1;
            else if (pop && !empty && (!push || full)) 
                count <= count - 1;
        end
    end
endmodule
