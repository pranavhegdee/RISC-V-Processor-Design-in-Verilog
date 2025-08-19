`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 13:19:23
// Design Name: 
// Module Name: register_tb
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


module register_tb();
    reg clk,rst;
    reg [4:0]read_addr1;
    reg [4:0]read_addr2;
    reg [4:0]write_addr;
    reg [31:0]write_val;
    reg r,w;
    wire [31:0]read_val1;
    wire [31:0]read_val2;
   register dut(clk,rst,read_addr1,read_addr2,write_addr,write_val,r,w,read_val1,read_val2);
    initial begin
         clk = 1'b0;

      forever begin
        #10 clk = ~clk;
        end
     end
     
    initial begin
        rst=1'b0;
        read_addr1=5'b0;
        read_addr2=5'b0;
        write_addr=5'b0;
        write_val=32'b0;
        r=1'b0;
        w=1'b0;
    rst = 1;
  #20;

  rst = 0; read_addr1 = 5'b00000; read_addr2 = 5'b00000; write_addr = 5'b00100; w = 1'b1; write_val = 32'b010010;
  #20;
  read_addr1 = 5'b00000; read_addr2 = 5'b00000; write_addr = 5'b10100; w = 1'b1; write_val = 32'b10;
  #20;
  read_addr1 = 5'b00100; read_addr2 = 5'b10100; write_addr = 5'b00000; r = 1'b1;w=1'b0; write_val = 32'b0;
  #20;
  $finish;
  end
        
        
endmodule
