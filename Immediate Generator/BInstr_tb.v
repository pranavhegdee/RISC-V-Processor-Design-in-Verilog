`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2025 11:32:42
// Design Name: 
// Module Name: BInstr_tb
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


module BInstr_tb();
reg[31:0] instr_word;
wire[6:0] imm_B_MSB;
wire[4:0] rs2;
wire[4:0] rs1;
wire[4:0] imm_B_LSB;
B_Instr B_Decoder(instr_word, imm_B_MSB, rs2, rs1, imm_B_LSB);

initial
    begin

        // B-type instructions
        instr_word = 32'b0000111_10101_01101_111_01101_1100011;
        #20;

        instr_word = 32'b1010101_11100_00110_100_11101_1100011;
        #20;

        instr_word = 32'b1000100_00100_10111_000_11111_1100011;
        #20;
    $finish;

    end
endmodule
