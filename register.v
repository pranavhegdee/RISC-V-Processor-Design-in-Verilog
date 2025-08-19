`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 12:52:27
// Design Name: 
// Module Name: register
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


module register(
    input clk,rst,
    input [4:0]read_addr1,
    input [4:0]read_addr2,
    input [4:0]write_addr,
    input [31:0]write_val,
    input r,w,
    output reg [31:0]read_val1,
    output reg [31:0]read_val2
    );
    reg[31:0] mem_reg[31:0];
    integer i;
    always @(posedge clk) begin
         if (rst) begin
            
             for (i = 0; i < 32; i = i + 1)
                 mem_reg[i] <= 32'h0;
    end
end

    always @(posedge clk)
    begin
        if(r) begin
            read_val1<=mem_reg[read_addr1];
            read_val2<=mem_reg[read_addr2];
           end
        
        if(w) begin 
            case(write_addr)
                    5'b00000 : mem_reg[0] = 32'b0;
                    5'b00010 : mem_reg[2] = write_val;
                    5'b00011 : mem_reg[3] = write_val;
                    5'b00100 : mem_reg[4] = write_val;
                    5'b00101 : mem_reg[5] = write_val;
                    5'b00110 : mem_reg[6] = write_val;
                    5'b00111 : mem_reg[7] = write_val;
                    5'b01000 : mem_reg[8] = write_val;
                    5'b01001 : mem_reg[9] = write_val;
                    5'b01010 : mem_reg[10] = write_val;
                    5'b01011 : mem_reg[11] = write_val;
                    5'b00001 : mem_reg[1] = write_val;
                    5'b01100 : mem_reg[12] = write_val;
                    5'b01101 : mem_reg[13] = write_val;
                    5'b01110 : mem_reg[14] = write_val;
                    5'b01111 : mem_reg[15] = write_val;
                    5'b10000 : mem_reg[16] = write_val;
                    5'b10001 : mem_reg[17] = write_val;
                    5'b10010 : mem_reg[18] = write_val;
                    5'b10011 : mem_reg[19] = write_val;
                    5'b10100 : mem_reg[20] = write_val;
                    5'b10101 : mem_reg[21] = write_val;
                    5'b10110 : mem_reg[22] = write_val;
                    5'b10111 : mem_reg[23] = write_val;
                    5'b11000 : mem_reg[24] = write_val;
                    5'b11001 : mem_reg[25] = write_val;
                    5'b11010 : mem_reg[26] = write_val;
                    5'b11011 : mem_reg[27] = write_val;
                    5'b11100 : mem_reg[28] = write_val;
                    5'b11101 : mem_reg[29] = write_val;
                    5'b11110 : mem_reg[30] = write_val;
                    5'b11111 : mem_reg[31] = write_val;
                    endcase
                  end
             end
     
endmodule
