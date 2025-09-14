`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2025 13:23:35
// Design Name: 
// Module Name: Imm_gen
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

module Imm_gen(
    input  [31:0] instr_word,
    output reg [31:0] imm_out
);
    wire [6:0] opcode;
    assign opcode = instr_word[6:0];

    always @(*) begin
        case (opcode)
            // I-type (e.g., LW, ADDI, ORI, JALR)
            7'b0000011, 7'b0010011, 7'b1100111: begin
                imm_out = {{20{instr_word[31]}}, instr_word[31:20]};
            end

            // S-type (e.g., SW, SH, SB)
            7'b0100011: begin
                imm_out = {{20{instr_word[31]}}, instr_word[31:25], instr_word[11:7]};
            end

            // B-type (e.g., BEQ, BNE, BLT, BGE, BLTU, BGEU)
            7'b1100011: begin
                imm_out = {{19{instr_word[31]}}, instr_word[31], instr_word[7],
                           instr_word[30:25], instr_word[11:8], 1'b0};
            end

            // U-type (e.g., LUI, AUIPC)
            7'b0110111, 7'b0010111: begin
                imm_out = {instr_word[31:12], 12'b0};
            end

            // J-type (e.g., JAL)
            7'b1101111: begin
                imm_out = {{11{instr_word[31]}}, instr_word[31], instr_word[19:12],
                           instr_word[20], instr_word[30:21], 1'b0};
            end

            default: begin
                imm_out = 32'b0; // R-type or unsupported
            end
        endcase
    end
endmodule

