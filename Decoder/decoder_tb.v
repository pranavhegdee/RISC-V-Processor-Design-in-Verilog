`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2025 12:43:26
// Design Name: 
// Module Name: decoder_tb
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


module decoder_tb();
reg[31:0] instr_word;
wire[6:0] imm_B_MSB;
wire[4:0] imm_B_LSB;
wire[11:0] imm;
wire[19:0] imm_J;
wire[6:0] imm_S_MSB;
wire[4:0] imm_S_LSB;
wire[19:0] imm_U;
wire[4:0] rd;
wire[4:0] rs2;
wire[4:0] rs1;

decoder dut(instr_word,imm,imm_B_MSB,imm_B_LSB,imm_J,imm_S_MSB,imm_S_LSB,imm_U,rd,rs2,rs1);
initial begin
        instr_word = 32'b0000111_10101_01101_111_01101_1100111;
        #20;

        // I type instructions
        instr_word = 32'b001000001001_10011_000_00111_0010011;
        #20;

        // J-type instructions
        instr_word = 32'b00001111110101101110_01101_1101111;
        #20;

        // R type instructions testing
        instr_word = 32'b0000000_00100_10101_000_00101_0110011;
        #20;

        // S type instructions testing
        instr_word = 32'b0000111_00000_01101_010_11101_0100011;
        #20;

        // U-type instructions
        instr_word = 32'b00001111010101101011_01101_0110111;
        #20;
        
        $display("Test complete!");
        $finish;

    end
endmodule
