`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2025 10:54:52
// Design Name: 
// Module Name: SInstr_tb
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


module SInstr_tb( );
reg[31:0] instr_word;
wire[6:0] imm_S_MSB;
wire[4:0] rs2;
wire[4:0] rs1;
wire[4:0] imm_S_LSB;

S_Instr S_Decoder(instr_word, imm_S_MSB, rs2, rs1, imm_S_LSB);

initial
    begin
      

        // S type instructions testing
        instr_word = 32'b0000111_00000_01101_010_11101_0100011;
        #20;

        instr_word = 32'b0100101_10101_01100_010_01111_0100011;
        #20;

        instr_word = 32'b1000100_01011_00111_010_00001_0100011;
        #20;
        $finish;
    end

endmodule
