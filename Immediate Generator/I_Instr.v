`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2025 10:42:20
// Design Name: 
// Module Name: I_Instr
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


module I_Instr(
    input [31:0] instr_word,
    output reg[11:0]imm,
    output reg[4:0] rs1,
    output reg[4:0] rd    
    );
    always @(instr_word)
    begin
        imm=instr_word[31:20];
        rs1=instr_word[19:15];
        rd=instr_word[11:7];
    end
endmodule
