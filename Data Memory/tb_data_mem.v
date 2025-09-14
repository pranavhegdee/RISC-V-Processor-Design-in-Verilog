`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2025 11:36:21
// Design Name: 
// Module Name: tb_data_mem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_data_mem( );
    reg clk, rst;
    reg mem_read, mem_write;
    reg [31:0] addr;
    reg [31:0] write_data;
    wire [31:0] read_data;

    // Instantiate data memory
    data_mem uut (
        .clk(clk),
        .rst(rst),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .addr(addr),
        .write_data(write_data),
        .read_data(read_data)
    );

    // Clock generation
    always #5 clk = ~clk;  // 100 MHz clock

    initial begin
        $display("==== Data Memory Test ====");
        clk = 0; rst = 1; mem_read = 0; mem_write = 0; addr = 0; write_data = 0;

        // Apply reset
        #10 rst = 0;

        // Write value 32'hDEADBEEF at address 0x04
        #10 addr = 32'h4; write_data = 32'hDEADBEEF; mem_write = 1;
        #10 mem_write = 0;

        // Write value 32'h12345678 at address 0x08
        #10 addr = 32'h8; write_data = 32'h12345678; mem_write = 1;
        #10 mem_write = 0;

        // Read back from address 0x04
        #10 addr = 32'h4; mem_read = 1;
        #10 $display("Read @0x04 = %h (Expected: DEADBEEF)", read_data);

        // Read back from address 0x08
        #10 addr = 32'h8;
        #10 $display("Read @0x08 = %h (Expected: 12345678)", read_data);

        // Try reading from an unwritten location
        #10 addr = 32'hC;
        #10 $display("Read @0x0C = %h (Expected: 00000000)", read_data);

        // Reset again (should clear memory)
        #10 rst = 1;
        #10 rst = 0;

        // Read from 0x04 after reset
        #10 addr = 32'h4;
        #10 $display("Read after reset @0x04 = %h (Expected: 00000000)", read_data);

        $finish;
    end
endmodule
