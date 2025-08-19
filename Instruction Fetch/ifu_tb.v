`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 19:37:22
// Design Name: 
// Module Name: ifu_tb
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


module ifu_tb();
    reg clk,rst;
    wire [31:0]instr_word;
    
    ifu dut(clk,rst,instr_word);
    initial
    begin
        clk = 1'b0;

        forever begin
            #20 clk = ~clk;
        end
    end

initial
    begin
    

        rst = 1'b1;
        #20;

        rst = 1'b0;
        
        $display("Test complete!");
        #200 $finish;

    end
endmodule
