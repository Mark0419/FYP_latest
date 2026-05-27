`timescale 1ns / 1ps

module flash_model (
    input  logic        cs_n,
    input  logic        clk,
    inout  wire [3:0]   io
);

    logic [7:0] memory [logic [31:0]]; 
    logic [7:0]  cmd;
    logic [31:0] address;
    logic [3:0]  io_drive;
    logic        driving;
    logic        write_enabled;

    assign io = driving ? io_drive : 4'bz; 

    initial begin
        driving = 0;
        write_enabled = 0;
        
        // Initialize memory with test pattern
        memory[32'h0F80_0000] = 8'hFF;
        memory[32'h0F80_0001] = 8'h00;
        memory[32'h0F80_0002] = 8'hF0;
        memory[32'h0F80_0003] = 8'h0F;
        
        $display("FLASH: Model initialized");
    end

    always @(negedge cs_n) begin
        if (!cs_n) begin
            #1;
            get_byte_serial(cmd); 
            $display("FLASH: Received command: %02h at time %t", cmd, $time);

            case (cmd)
                8'h06: begin  // Write Enable
                    $display("FLASH: Write Enable executed");
                    write_enabled = 1;
                end
                
                8'hEC: begin  // 4-Byte Quad Read
                    $display("FLASH: 4-Byte Quad Read (0xEC)");
                    get_address_quad(32, address); 
                    perform_read();
                end
                
                8'h34: begin  // Quad Page Program 4-byte
                    if (write_enabled) begin
                        $display("FLASH: Quad Page Program 4-byte - AUTHORIZED");
                        get_address_quad(32, address);
                        perform_write();
                        write_enabled = 0;
                    end else begin
                        $display("FLASH: ERROR - Quad Page Program without Write Enable!");
                    end
                end
                
                8'h21: begin  // Sector Erase 4-byte
                    if (write_enabled) begin
                        $display("FLASH: Sector Erase 4-byte - AUTHORIZED");
                        get_address_quad(32, address);
                        perform_erase();
                        write_enabled = 0;
                    end else begin
                        $display("FLASH: ERROR - Sector Erase without Write Enable!");
                    end
                end
                
                default: $display("FLASH: Unknown Command %02h", cmd);
            endcase
        end
    end

    // Write Operation - Fixed byte order
    task perform_write;
        integer i;
        logic [31:0] write_data;
        begin
            $display("FLASH: Starting write to address %08h", address);
            
            // Receive 4 bytes of data in quad mode
            write_data = 0;
            for(i=0; i<4; i++) begin
                logic [7:0] byte_data;
                get_byte_quad(byte_data);
                write_data = (write_data << 8) | byte_data;  // MSB first
            end
            
            $display("FLASH: Write data received: %08h", write_data);
            
            // Write to memory in correct byte order (big-endian)
            memory[address+0] = write_data[31:24];  // MSB
            memory[address+1] = write_data[23:16];
            memory[address+2] = write_data[15:8];
            memory[address+3] = write_data[7:0];    // LSB
            
            $display("FLASH: Written %02h %02h %02h %02h to addresses %08h-%08h", 
                    write_data[31:24], write_data[23:16], write_data[15:8], write_data[7:0],
                    address, address+3);
        end
    endtask

    // Erase Operation
    task perform_erase;
        integer i;
        logic [31:0] sector_base;
        begin
            sector_base = {address[31:12], 12'h000};  // 4KB sector alignment
            $display("FLASH: Erasing sector at base %08h (requested addr: %08h)", sector_base, address);
            
            // Erase 4KB sector (set all to 0xFF)
            for(i=0; i<4096; i++) begin
                memory[sector_base + i] = 8'hFF;
            end
            
            $display("FLASH: Sector erase completed");
        end
    endtask

    // Read Operation - Fixed byte order
    task perform_read;
        integer i;
        begin
            $display("FLASH: Starting read from address %08h", address);
            
            // Mode bits (2 cycles)
            @(posedge clk); @(posedge clk);
            @(posedge clk); 
            
            // Dummy cycles (4 cycles)
            repeat(4) @(posedge clk);
            @(negedge clk); 

            driving = 1;
            
            // Read 4 bytes in big-endian order (MSB first)
            for(i=0; i<4; i++) begin
                logic [7:0] val;
                if (memory.exists(address+i)) val = memory[address+i];
                else val = 8'hFF; 

                $display("FLASH: Reading %02h from address %08h", val, address+i);
                
                // Drive upper nibble first
                io_drive = val[7:4];
                @(negedge clk); 
                
                // Drive lower nibble second
                io_drive = val[3:0];
                @(negedge clk); 
            end
            driving = 0; 
            $display("FLASH: Read operation completed");
        end
    endtask

    // Get byte in quad mode
    task get_byte_quad(output logic [7:0] data);
        begin
            @(negedge clk);
            data[7:4] = io;
            @(negedge clk);
            data[3:0] = io;
        end
    endtask

    // Get byte in serial mode (for commands)
    task get_byte_serial(output logic [7:0] data);
        integer i;
        begin
            data = 0;
            for(i=7; i>=0; i=i-1) begin
                @(posedge clk);
                data[i] = io[0];
            end
        end
    endtask

    // Get address in quad mode
    task get_address_quad(input int bits, output logic [31:0] addr);
        integer i;
        begin
            addr = 0;
            for(i=(bits/4)-1; i>=0; i=i-1) begin
                @(negedge clk); 
                addr[i*4 +: 4] = io; 
            end
            $display("FLASH: Address received: %08h", addr);
        end
    endtask

endmodule
