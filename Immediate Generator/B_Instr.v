`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2025 11:30:21
// Design Name: 
// Module Name: B_Instr
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


module B_Instr(
    input [31:0] instr_word,
    output reg[6:0] imm_B_MSB,
    output reg[4:0] rs2,
    output reg[4:0] rs1,
    output reg[4:0] imm_B_LSB
    );
    always @(instr_word)

        begin
            imm_B_MSB = instr_word[31:25];
            rs2 = instr_word[24:20];
            rs1 = instr_word[19:15];
            imm_B_LSB = instr_word[11:7];
        end
endmodule
