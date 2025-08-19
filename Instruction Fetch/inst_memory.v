`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 16:27:59
// Design Name: 
// Module Name: inst_memory
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


module inst_memory(
    input rst,
    input [31:0]PC,
    output reg [31:0]instr_word
    );
    reg[31:0] Memory[9:0];
    
     always @ *
    begin
    instr_word = Memory[PC>>2];
    end
    
    
    always @(*) begin
    if (rst) begin
            Memory[0]=32'h00500093;
            Memory[1] = 32'h00A00113;
            Memory[2] = 32'h002081B3;
            Memory[3] = 32'h40110233;
            Memory[4] = 32'h0020A2B3;
            Memory[5] = 32'h0020B333;
            Memory[6] = 32'h0020C3B3;
            Memory[7] = 32'h00000013;
            Memory[8] = 32'h00000013;
            Memory[9] = 32'h00000013;
           end
        end
    
endmodule
