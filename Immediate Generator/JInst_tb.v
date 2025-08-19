`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2025 12:15:15
// Design Name: 
// Module Name: JInst_tb
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


module JInst_tb();
reg [31:0] instr_word;
wire[19:0] imm_J;
wire[4:0] rd;

J_Instr J_Decoder(instr_word, imm_J, rd);

initial
    begin
        // J-type instructions

        instr_word = 32'b00001111110101101110_01101_1101111;
        #20;

        instr_word = 32'b01001110010101101111_11111_1101111;
        #20;

        instr_word = 32'b00001111010101101111_00101_1101111;
        #20;

        instr_word = 32'b11001110010101001111_00100_1101111;
        #20;
        $finish;
    end
endmodule
