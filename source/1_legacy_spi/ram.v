

// =========================================================================
//  MASTER SWITCH
//  Uncomment the line below ONLY to generate the Area Comparison Report.
// =========================================================================
 //`define RUN_REGISTER_TEST  

`ifdef RUN_REGISTER_TEST

    // ---------------------------------------------------------------------
    // MODE 2: REGISTER ARRAY (Synthesis Comparison Only)
    // ---------------------------------------------------------------------
    module ram (
        input wire clock, we,
        input wire [3:0]  addr, // 4 bit
        input wire [3:0] din,  
        output wire [3:0] dout
    );
        reg [3:0] mem [0:15]; 
        reg [3:0] data_out;
        always @(posedge clock) begin
            if (we) mem[addr] <= din;
            data_out <= mem[addr];
        end
        assign dout = data_out;
    endmodule

`else

    // ---------------------------------------------------------------------
    // MODE 1: HARD MACRO (Final Design & Simulation)
    // ---------------------------------------------------------------------
   
 module ram (
    input wire clock,
    input wire we,
    input wire [3:0] addr,
    input wire [3:0] din,
    output wire [3:0] dout
);

`ifdef SYNTHESIS

    // SRAM macro instantiation (replace power pins as needed or tie off)
    wire SD  = 1'b0;
    wire LS  = 1'b0;
    wire DS  = 1'b0;
    wire VDD = 1'b1;
    wire VDDL = 1'b1;
    wire VSS = 1'b0;

    // Map control signals to macro names
    wire CE  = 1'b1;          // Assume chip enabled
    wire WEB = ~we;           // Write enable active low
    wire OEB = 1'b0;          // Output enable always on
    wire CSB = 1'b0;          // Chip select always active

    SRAM1RW16x4 u_sram (
        .A(addr),
        .CE(CE),
        .WEB(WEB),
        .OEB(OEB),
        .CSB(CSB),
        .I(din),
        .O(dout)
    );

`else

    // RTL model for simulation
    reg [3:0] mem [0:15];
    reg [3:0] data_out;

    always @(posedge clock) begin
        if (we)
            mem[addr] <= din;
        data_out <= mem[addr];
    end

    assign dout = data_out;

`endif

endmodule

`endif
