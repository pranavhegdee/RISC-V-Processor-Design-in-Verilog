`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 16:34:28
// Design Name: 
// Module Name: instrmem_tb
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


module instrmem_tb();
    reg rst;
    reg [31:0]PC;
    wire [31:0]instr_word;
    inst_memory dut(rst,PC,instr_word);
    initial begin
        rst = 1'b1;
        #20;

        rst = 1'b0;
        PC = 32'b1;
        #20;

        rst = 1'b0;
        PC = 32'b10;
        #20;

        rst = 1'b0;
        PC = 32'b11;
        #20;

        rst = 1'b0;
        PC = 32'b100;
        #20;

        rst = 1'b0;
        PC = 32'b101;
        #20;

        rst = 1'b0;
        PC = 32'b110;
        #20;

        $display("Test complete!");
        $finish;
    end

endmodule
