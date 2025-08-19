`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 11:48:40
// Design Name: 
// Module Name: alu_tb
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


module alu_tb();
reg [3:0]alu_ctrl;
reg [31:0]in1,in2;
wire [31:0]res;
wire z_flg;
alu dut(in1,in2,alu_ctrl,res,z_flg);
    initial begin
        in1 = 32'b101; in2 = 32'b110; alu_ctrl = 4'b0000;
         #20;

        in1 = 32'b101; in2 = 32'b110; alu_ctrl = 4'b0001;
         #20;

        in1 = 32'b101; in2 = 32'b110; alu_ctrl = 4'b0010;
    #20;

        in1 = 32'b101; in2 = 32'b110; alu_ctrl = 4'b0011;
    #20;

        in1 = 32'b101; in2 = 32'b110; alu_ctrl = 4'b0100;
    #20;

        in1 = 32'b101; in2 = 32'b110; alu_ctrl = 4'b0101;
    #20;

        in1 = 32'b101; in2 = 32'b110; alu_ctrl = 4'b0110;
    #20;

        in1 = 32'b101; in2 = 32'b110; alu_ctrl = 4'b0111;
    #20;

        in1 = 32'b101; in2 = 32'b110; alu_ctrl = 4'b1000;
    #20;

        in1 = 32'b101; in2 = 32'b110; alu_ctrl = 4'b1001;
    #20;
       in1 = 32'b101; in2 = 32'b110; alu_ctrl = 4'b1010;
    #20;
       in1 = 32'b101; in2 = 32'b110; alu_ctrl = 4'b1011;
    #20;

    $display("Test complete!");

    end
endmodule
