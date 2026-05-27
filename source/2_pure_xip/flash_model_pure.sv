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
        
        $display("FLASH VIP (ROM MODE): Initializing Pre-loaded Test Data...");

        // Pre-load data for 4 target addresses
        memory[32'h4000_0000] = 8'hAA; memory[32'h4000_0001] = 8'hBB;
        memory[32'h4000_0002] = 8'hCC; memory[32'h4000_0003] = 8'hDD;

        memory[32'h4000_1000] = 8'h11; memory[32'h4000_1001] = 8'h22;
        memory[32'h4000_1002] = 8'h33; memory[32'h4000_1003] = 8'h44;

        memory[32'h4000_2000] = 8'h55; memory[32'h4000_2001] = 8'h66;
        memory[32'h4000_2002] = 8'h77; memory[32'h4000_2003] = 8'h88;
        
        memory[32'h4000_3000] = 8'h99; memory[32'h4000_3001] = 8'h00;
        memory[32'h4000_3002] = 8'hFF; memory[32'h4000_3003] = 8'hEE;
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
