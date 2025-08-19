`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2025 10:23:27
// Design Name: 
// Module Name: decoder
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


module decoder(
    input [31:0]instr_word,
    output reg [11:0]imm,
    output reg[6:0] imm_B_MSB,
    output reg[4:0] imm_B_LSB,
    output reg[19:0] imm_J,
    output reg[6:0] imm_S_MSB,
    output reg[4:0] imm_S_LSB,
    output reg[19:0] imm_U,
    output reg[4:0] rd,
    output reg[4:0] rs2,
    output reg[4:0] rs1
    );
    always @(instr_word)
    begin
            imm_B_MSB = 7'bx;
            imm_B_LSB = 5'bx;
            imm = 12'bx;
            imm_J = 20'bx;
            imm_S_MSB = 7'bx;
            imm_S_LSB = 5'bx;
            imm_U = 20'bx;

            rd = 5'bx;
            rs2 = 5'bx;
            rs1 = 5'bx;
            
            case(instr_word[6:0])
                7'b0110011: begin
                    rs2 = instr_word[24:20];
                    rs1 = instr_word[19:15];
                    rd = instr_word[11:7];
                    end    
                    
                7'b0010011: begin
                    imm= instr_word[31:20];
                    rs1= instr_word[19:15];
                    rd= instr_word[11:7];
                    end
                    
                7'b1100111 : begin 
                    imm_B_MSB = instr_word[31:25];
                    rs2 = instr_word[24:20];
                    rs1 = instr_word[19:15];
                    imm_B_LSB = instr_word[11:7]; 
                    end
                    
                7'b1101111 : begin 
                    imm_J = instr_word[31:12];
                    rd = instr_word[11:7];
                    end
                    
                7'b0100011 : begin  
                    imm_S_MSB = instr_word[31:25];
                    rs2 = instr_word[24:20];
                    rs1 = instr_word[19:15];
                    imm_S_LSB = instr_word[11:7];
                    end
                    
                7'b0110111 : begin 
                    imm_U = instr_word[31:12];
                    rd = instr_word[11:7];
                    end
            endcase
          end                  
                    
endmodule
