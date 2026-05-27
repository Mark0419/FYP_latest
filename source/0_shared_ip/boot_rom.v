`timescale 1ns / 1ps

module boot_rom (
    input  wire        HCLK,
    input  wire        HRESETn,
    input  wire [31:0] HADDR,
    input  wire [1:0]  HTRANS,
    output wire [31:0] HRDATA,
    output wire        HREADYOUT
);

    // 4KB Memory Array organized as BYTES
    reg [7:0] memory [0:4095];

    // Always ready for 0-wait-state reads
    assign HREADYOUT = 1'b1;

    initial begin
        // 1. Pre-fill memory with 0s
        integer i;
        for (i=0; i<4096; i=i+1) begin
            memory[i] = 8'h00;
        end
        // 2. Load the firmware
        $readmemh("firmware.hex", memory);
    end

    // ==========================================
    // CRITICAL FIX: The Address Latch
    // ==========================================
    reg [31:0] latched_addr;
    reg        active_data_phase;

    always @(posedge HCLK) begin
        if (!HRESETn) begin
            active_data_phase <= 1'b0;
            latched_addr      <= 32'h0;
        end else begin
            // If the CPU requests a transfer, lock in the address for the next cycle
            if (HTRANS[1]) begin // NONSEQ (10) or SEQ (11)
                active_data_phase <= 1'b1;
                latched_addr      <= HADDR; 
            end else begin
                active_data_phase <= 1'b0;
            end
        end
    end

    // ==========================================
    // The Data Phase
    // ==========================================
    // Force the latched address to be word-aligned
    wire [31:0] read_addr = {latched_addr[31:2], 2'b00};

    // Combinationally drive the bus using ONLY the securely latched address
    assign HRDATA = active_data_phase ? {memory[read_addr+3], 
                                         memory[read_addr+2], 
                                         memory[read_addr+1], 
                                         memory[read_addr]} : 32'h00000000;

endmodule
