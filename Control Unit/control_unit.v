`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input [31:0] instr_word,
    output reg[3:0] alu_ctrl,
    output reg shamt_en,        // control strobe for shift amount for I-type instructions
    output reg[2:0] branch_ctrl, 
    output reg jump_ctrl,       // control strobe to indicate JUMP instruction
    output reg reg_write,
    output reg[2:0] inst_type
    );
    
    always @ *
    begin 
        alu_ctrl=4'b0;
        shamt_en=1'b0;
        branch_ctrl=3'b0;
        jump_ctrl=1'b0;
        reg_write=1'b0;
        inst_type=3'bxxx;
        
        if(instr_word[6:0]==7'b0110011)
        begin
        reg_write=1'b1;
        inst_type=3'b000;

//   ============== R - Type Instruction ===================        
            case(instr_word[14:12])
                3'b000:begin
                    if(instr_word[31:25]== 7'b0000000)
                        alu_ctrl=0010;
                    else if(instr_word[31:25]==7'b0100000)
                        alu_ctrl=0100;
                       end
                        
                3'b001 : alu_ctrl = 4'b0011;    // SLL (Shift Left Logical)
                3'b010 : alu_ctrl = 4'b1000;    // SLT (Set Less Than)
                3'b100 : alu_ctrl = 4'b0111;    //XOR
                3'b101 : begin
                        if(instr_word[31:25] == 7'b0000000)
                            alu_ctrl = 4'b0101;    // SRL (Shift Right Logical)
                        else if(instr_word[31:25] == 7'b0100000)
                            alu_ctrl = 4'b1001;     // SRA (Shift Right Arithemetic)
                    end
                3'b110 : alu_ctrl = 4'b0001;    // OR (Bitwise OR)
                3'b111 : alu_ctrl = 4'b0000;    // AND (Bitwise AND)
               endcase
              end
              
 //   ============== I - Type Instruction ===================
              
           else if(instr_word[6:0]== 7'b0010011)
             begin
             reg_write=1'b0;
             inst_type=3'b011;
             shamt_en = 1'b0;
             alu_ctrl = 4'b0000;
             
                case(instr_word[14:12])
                    3'b000:alu_ctrl=4'b0010;
                    3'b001: begin               // SLLI (shift immediate)
                        alu_ctrl = 4'b0011; 
                        shamt_en = 1'b1;
                        end
                    
                     3'b010 : alu_ctrl = 4'b1000;
                     3'b011 : alu_ctrl = 4'b0111;
                     3'b100 : alu_ctrl = 4'b0001;
                     3'b101 : begin
                            shamt_en = 1'b1;
                            if(instr_word[31:25] == 7'b0000000)
                                assign alu_ctrl = 4'b0101;
                            else if(instr_word[31:25] == 7'b0100000)
                                assign alu_ctrl = 4'b1001;
                        end
                     3'b110 : alu_ctrl = 4'b0001;
                     3'b111 : alu_ctrl = 4'b0010;
                    endcase
                    end
                    
            else if (instr_word[6:0]==7'b0000011) begin
                    reg_write = 1'b1;
                    inst_type = 3'b010; // LOAD
                // For loads, ALU performs address calculation (ADD)
                    alu_ctrl = 4'b0010;
                    shamt_en = 1'b0;
                end
            
  //   ============== U - Type Instruction ===================
  
             else  if (instr_word[6:0]== 7'b0110111) begin
                    reg_write = 1'b1;
                    inst_type = 3'b001; // U-type (LUI)
        // LUI is special: immediate goes to upper bits. ALU control may be pass-through.
                    alu_ctrl = 4'b0011; // example: treat as SLL/upper immediate op (user-defined)
             end 
             
            else if (instr_word[6:0]== 7'b0010111) begin
                    reg_write = 1'b1;
                    inst_type = 3'b001; // U-type (AUIPC)
                    alu_ctrl = 4'b0010; // ADD PC + imm (use ALU add)
             end
             
  //   ============== S - Type Instruction ===================
            
             else if (instr_word[6:0]== 7'b0100011) begin
                    reg_write = 1'b0;
                    inst_type = 3'b100; // STORE
                // ALU calculates address -> ADD
                    alu_ctrl = 4'b0010;
             end
             
        //   ============== B - Type Instruction ===================       
              else if (instr_word[6:0]== 7'b1100011) begin
                reg_write = 1'b0;
                 inst_type = 3'b101; // BRANCH
        // set branch_ctrl based on funct3
        case (instr_word[14:12])
            3'b000: branch_ctrl = 3'b000; // BEQ
            3'b001: branch_ctrl = 3'b001; // BNE
            3'b100: branch_ctrl = 3'b010; // BLT
            3'b101: branch_ctrl = 3'b011; // BGE
            3'b110: branch_ctrl = 3'b100; // BLTU
            3'b111: branch_ctrl = 3'b101; // BGEU
            default: branch_ctrl = 3'b000;
        endcase
        // branch ALU typically does a subtract/compare -> use SUB/COMPARE code
                alu_ctrl = 4'b0100; // SUB/compare
            end

      //   ============== J - Type Instruction ===================  
        
             else if (instr_word[6:0]== 7'b1101111) begin
                reg_write = 1'b1;
                inst_type = 3'b110; // JUMP (J-type)
                jump_ctrl = 1'b1;
        // JAL writes PC+4 to rd; ALU not critical for PC calc (handled elsewhere)
                alu_ctrl = 4'b0000;
            end
      end  
endmodule
