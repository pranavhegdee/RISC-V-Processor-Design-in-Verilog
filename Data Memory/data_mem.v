`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2025 11:12:03
// Design Name: 
// Module Name: data_mem
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


module data_mem(
    input clk,
    input rst,
    input mem_read,
    input mem_write,
    input [31:0] addr,
    input [31:0] write_data,
    output reg [31:0] read_data
    );
    reg [31:0] memory [0:255];
      integer i;
     always @(posedge clk) begin
        if (rst) begin
          
            for (i=0; i<256; i=i+1)
                memory[i] <= 32'b0;
        end
        else if (mem_write) begin
            memory[addr >> 2] <= write_data;   // store word
        end
    end
    
    always @(*) begin
        if (mem_read)
            read_data = memory[addr >> 2];    // load word
        else
            read_data = 32'b0;
    end
    
endmodule
