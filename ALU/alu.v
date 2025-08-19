`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 11:30:58
// Design Name: 
// Module Name: alu
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
/*
    Function        |       alu_ctrl
    BITWISE AND                 0000
    BITWISE OR                  0001
    ADD                         0010
    SHIFT LEFT                  0011
    SUB                         0100
    SHIFT RIGHT                 0101
    MULTIPLY                    0110
    BITWISE XOR                 0111
    SET ON LESS THAN            1000
    SHIFT RIGHT ARITHEMETIC     1001
    NOT                         1010
    NOR                         1011

*/

module alu(
    input [31:0]in1,in2,
    input [3:0] alu_ctrl,
    output reg [31:0]res,
    output reg z_flg
    );
    always @ *
    begin
        case(alu_ctrl)
            4'b0000:res= in1 & in2;
            4'b0001:res= in1|in2;
            4'b0010:res= in1+in2;
            4'b0011:res=in1<<in2[4:0];
            4'b0100:res=in1-in2;
            4'b0101:res=in1>>in2[4:0];
            4'b0110:res=in1*in2;
            4'b0111:res=in1^in2;
            4'b1000 : begin
                    if(in1 < in2)
                        res = 1;
                    else
                        res = 0;
                end
            4'b1001:res=in1>>>in2[4:0];
            4'b1010:res=~in1;
            4'b1011:res=~(in1|in2);
            default:res=32'bx;
            endcase
          
          if(res==0)
             z_flg=1;
          else
             z_flg=0;
            
            
    end
endmodule
