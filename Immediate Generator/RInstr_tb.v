`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2025 10:31:25
// Design Name: 
// Module Name: RInstr_tb
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


module RInstr_tb();
    reg [31:0] instr_word;
    wire [4:0] rs2;
    wire [4:0] rs1;
    wire [4:0] rd;
    R_Instr dut(instr_word,rs2,rs1,rd);
    initial begin
    #10
    instr_word=32'h0234AB600;
    #20
     instr_word = 32'b0100000_00101_10101_000_00110_0110011;
        #20
        $finish;
        end
endmodule
