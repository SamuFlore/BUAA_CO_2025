`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:19:22 11/05/2025 
// Design Name: 
// Module Name:    ALU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`default_nettype none
module ALU(
	input wire [31:0] inputA,
	input wire [31:0] inputB,
	input wire [5:0] ALU_sel,
	input wire [4:0] shamt, // for SLL
	output wire [31:0] outputA,
	output wire zero
    );
	 
	 parameter ADD = 6'b000000,
				  SUB = 6'b000001,
				  ORI = 6'b000010,
				  SW  = 6'b000011,
				  SH  = 6'b000100,
				  SB  = 6'b000101,
				  LW  = 6'b000110,
				  LH  = 6'b000111,
				  LB  = 6'b001000,
				  AND = 6'b001001,
				  OR  = 6'b001010,
				  J   = 6'b001011,
				  JAL = 6'b001100,
				  JALR= 6'b001101,
				  JR  = 6'b001110,
				  BEQ = 6'b001111,
				  BNE = 6'b010000,
				  ADDI= 6'b010001,
				  LUI = 6'b010010,
				  SLL = 6'b010011;
	 
	 wire [31:0] A_add_B;
	 wire [31:0] A_sub_B;
	 wire [31:0] A_or_B;
	 wire [31:0] A_and_B;
	 wire [31:0] B_left16;
	 wire [31:0] B_left_shamt; // for SLL
	 wire [31:0] null;
	 
	 assign A_add_B = inputA + inputB;
	 assign A_sub_B = inputA - inputB;
	 assign A_or_B = inputA | inputB;
	 assign A_and_B = inputA & inputB;
	 assign B_left16 = inputB << 5'd16;
	 assign B_left_shamt = inputB << shamt;
	 assign null = 32'h0;
	 
	 assign outputA = (ALU_sel == ADD) ? A_add_B :
							(ALU_sel == SUB) ? A_sub_B :
							(ALU_sel == ORI) ? A_or_B  :
							(ALU_sel == SW)  ? A_add_B :
							(ALU_sel == SH)  ? A_add_B :
							(ALU_sel == SB)  ? A_add_B :
							(ALU_sel == LW)  ? A_add_B :
							(ALU_sel == LH)  ? A_add_B :
							(ALU_sel == LB)  ? A_add_B :
							(ALU_sel == AND) ? A_and_B :
							(ALU_sel == OR)  ? A_or_B  :
							(ALU_sel == ADDI)? A_add_B :
							(ALU_sel == LUI) ? B_left16:
							(ALU_sel == SLL) ? B_left_shamt : null; //default: 0
							
	assign zero = ((ALU_sel == BEQ) && (inputA == inputB)) ? 1 :
					  ((ALU_sel == BNE) && (inputA != inputB)) ? 1 : 0;
	 

endmodule
