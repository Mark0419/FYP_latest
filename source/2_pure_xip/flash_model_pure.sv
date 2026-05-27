`timescale 1ns / 1ps

module flash_model (
    input  logic        cs_n,
    input  logic        clk,
    inout  wire [3:0]   io
);

    logic [7:0] memory [int unsigned]; 
    int unsigned address; 
    
    logic [7:0]  cmd;
    logic [3:0]  io_drive;
    logic        driving;
    logic        xip_active; 

    assign io = driving ? io_drive : 4'bz; 

    initial begin
        driving = 0;
        xip_active = 0; 
        
        $display("FLASH VIP (ROM MODE): Initializing common 16-byte PPA dataset...");

        memory[32'h4000_0000] = 8'h49; memory[32'h4000_0001] = 8'h02;
        memory[32'h4000_0002] = 8'h48; memory[32'h4000_0003] = 8'h01;

        memory[32'h4000_0004] = 8'he7; memory[32'h4000_0005] = 8'hfe;
        memory[32'h4000_0006] = 8'h60; memory[32'h4000_0007] = 8'h01;

        memory[32'h4000_0008] = 8'h20; memory[32'h4000_0009] = 8'h00;
        memory[32'h4000_000a] = 8'h80; memory[32'h4000_000b] = 8'h00;
        
        memory[32'h4000_000c] = 8'haa; memory[32'h4000_000d] = 8'hbb;
        memory[32'h4000_000e] = 8'hcc; memory[32'h4000_000f] = 8'hdd;
    end

    always @(negedge cs_n) begin
        #1; 
        
        // If XIP is locked, pretend the command was 0xEC automatically
        if (xip_active) cmd = 8'hEC; 
        else get_byte_serial(cmd); 
        
        if (cmd == 8'hEC) begin 
            get_address_quad(32, address); 
            perform_read();
        end else begin
            $display("FLASH VIP: ERROR - Unrecognized command %h. This is a Read-Only Model.", cmd);
        end
    end

    task perform_read;
        integer i;
        logic [7:0] mode_bits;
        begin
            // 1. Receive Mode Bits (To check if CPU wants to stay in XIP)
            @(posedge clk); mode_bits[7:4] = io;
            @(posedge clk); mode_bits[3:0] = io;
            
            if (mode_bits == 8'hA5) begin
                if (!xip_active) $display("FLASH VIP: Mode A5 detected -> Entering Continuous Read (XIP).");
                xip_active = 1;
            end else begin
                xip_active = 0;
            end

            // 2. Wait for Dummy Cycles (4 clocks)
            repeat(4) @(posedge clk);
            
            $display("FLASH VIP: Burst Reading data from address %08h", address);
            
            // 3. Drive Data on Negedge (To ensure perfect setup time for FSM)
            for(i=0; i<4; i++) begin
                logic [7:0] val;
                val = memory.exists(address+i) ? memory[address+i] : 8'hFF;
                
                @(negedge clk); 
                driving = 1; 
                io_drive = val[7:4]; 
                
                @(negedge clk); 
                io_drive = val[3:0]; 
            end
            
            @(negedge clk); 
            #1;             
            driving = 0; 
        end
    endtask

    // Helper Tasks
    task get_byte_serial(output logic [7:0] data);
        integer i;
        begin
            data = 0;
            for(i=7; i>=0; i--) begin
                @(posedge clk);
                data[i] = io[0];
            end
        end
    endtask

    task get_address_quad(input int bits, output int unsigned addr);
        integer i;
        begin
            addr = 0;
            for(i=(bits/4)-1; i>=0; i--) begin
                @(posedge clk); 
                addr[i*4 +: 4] = io; 
            end
        end
    endtask

endmodule
