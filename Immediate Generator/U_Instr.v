`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2025 11:38:32
// Design Name: 
// Module Name: U_Instr
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


module U_Instr(
    input [31:0] instr_word,
    output reg[19:0] imm_U,
    output reg[4:0] rd
    );
       always@(instr_word)
        begin
            imm_U = instr_word[31:12];
            rd = instr_word[11:7];
        end
endmodule
