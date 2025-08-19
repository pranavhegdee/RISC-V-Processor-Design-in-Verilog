`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2025 10:27:54
// Design Name: 
// Module Name: R_Instr
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


module R_Instr(
    input [31:0] instr_word,
    output reg[4:0] rs2,
    output reg[4:0] rs1,
    output reg[4:0] rd
    );
    always @(instr_word)
    begin
        rs2=instr_word[24:20];
        rs1=instr_word[19:15];
        rd=instr_word[11:7];
        end
endmodule
