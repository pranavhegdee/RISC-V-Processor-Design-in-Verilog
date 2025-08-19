`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 19:33:10
// Design Name: 
// Module Name: ifu
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
`include "inst_memory.v"

module ifu(
    input clk,rst,
    output [31:0]instr_word
    );
    reg [31:0] PC = 32'b0;
     inst_memory instruction_memory(rst,PC,instr_word);   
      always@(posedge clk, posedge rst)
        begin
            if(rst == 1'b1)
                PC <= 32'b0;            // Reset PC to 0
            else if(rst == 1'b0)
                PC <= PC + 4;           // Set PC to PC+4 to point to next instruction
        end
endmodule
