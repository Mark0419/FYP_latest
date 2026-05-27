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
    logic        write_enabled;
    logic        xip_active; 

    assign io = driving ? io_drive : 4'bz; 

    initial begin
        driving = 0;
        write_enabled = 0; 
        xip_active = 0; 
        
        $display("FLASH VIP: Initializing common 16-byte PPA dataset...");

        memory[32'h4000_0000] = 8'h49; memory[32'h4000_0001] = 8'h02;
        memory[32'h4000_0002] = 8'h48; memory[32'h4000_0003] = 8'h01;

        memory[32'h4000_0004] = 8'he7; memory[32'h4000_0005] = 8'hfe;
        memory[32'h4000_0006] = 8'h60; memory[32'h4000_0007] = 8'h01;

        memory[32'h4000_0008] = 8'h20; memory[32'h4000_0009] = 8'h00;
        memory[32'h4000_000a] = 8'h80; memory[32'h4000_000b] = 8'h00;
        
        memory[32'h4000_000c] = 8'haa; memory[32'h4000_000d] = 8'hbb;
        memory[32'h4000_000e] = 8'hcc; memory[32'h4000_000f] = 8'hdd;
        
        $display("FLASH VIP: Model initialization complete.");
    end

    always @(negedge cs_n) begin
        #1; 
        
        // Break XIP locally in the VIP if a write transaction starts
        if (xip_active && tb_soc_top.u_dut.u_core.write_op == 1) begin
            $display("FLASH VIP: Detected FSM Write Request. Exiting XIP Mode.");
            xip_active = 0;
        end
        
        if (xip_active) cmd = 8'hEC; 
        else get_byte_serial(cmd); 
        
        case (cmd)
            8'h06: begin 
                $display("FLASH: WREN received. Enabling writes.");
                write_enabled = 1; 
            end
            
            8'hEC: begin 
                get_address_quad(32, address); 
                perform_read();
            end
            
            8'h34: begin 
                if (write_enabled) begin
                    get_address_quad(32, address);
                    perform_write();
                    write_enabled = 0; 
                    $display("FLASH: Write success. Flag cleared.");
                end else begin
                    $display("FLASH: ERROR - Quad Page Program rejected! Write Enable is 0.");
                end
            end
            
            8'h21: begin 
                if (write_enabled) begin
                    get_address_quad(32, address);
                    perform_erase();
                    write_enabled = 0;
                    $display("FLASH: Erase success. Flag cleared.");
                end else begin
                    $display("FLASH: ERROR - Sector Erase rejected! Write Enable is 0.");
                end
            end
        endcase
    end

    task perform_write;
        integer i;
        logic [31:0] write_data;
        begin
            write_data = 0;
            for(i=0; i<4; i++) begin
                logic [7:0] byte_data;
                get_byte_quad(byte_data);
                write_data = (write_data << 8) | byte_data; 
            end
            memory[address+0] = write_data[31:24];
            memory[address+1] = write_data[23:16];
            memory[address+2] = write_data[15:8];
            memory[address+3] = write_data[7:0];
            $display("FLASH VIP: Safely stored %08h at %08h", write_data, address);
        end
    endtask

    task perform_read;
        integer i;
        logic [7:0] mode_bits;
        begin
            @(posedge clk); mode_bits[7:4] = io;
            @(posedge clk); mode_bits[3:0] = io;
            
            if (mode_bits == 8'hA5) begin
                if (!xip_active) $display("FLASH: Mode A5 detected -> Entering Continuous Read (XIP).");
                xip_active = 1;
            end else begin
                xip_active = 0;
            end

            repeat(4) @(posedge clk);
            
            $display("FLASH VIP: Reading data from address %08h", address);
            
            for(i=0; i<4; i++) begin
                logic [7:0] val;
                if (memory.exists(address+i)) begin
                    val = memory[address+i];
                end else begin
                    val = 8'hFF;
                end
                
                // Drive data on NEGEDGE to align with FSM posedge sampling perfectly
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

    task perform_erase;
        integer i;
        int unsigned sector_base;
        begin
            // Calculate the 4KB aligned base address of the sector
            sector_base = address & 32'hFFFFF000; 
            $display("FLASH VIP: Erasing 4KB sector at base %08h...", sector_base);
            
            // Overwrite 4096 bytes with 0xFF
            for(i=0; i<4096; i++) begin
                memory[sector_base + i] = 8'hFF;
            end
            $display("FLASH: Erase performed successfully.");
        end
    endtask

    task get_byte_quad(output logic [7:0] data);
        begin
            @(posedge clk); data[7:4] = io;
            @(posedge clk); data[3:0] = io;
        end
    endtask

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
