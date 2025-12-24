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
`include "CONST.v"
module ALU(
	input wire [31:0] inputA,
	input wire [31:0] inputB,
	input wire [5:0] ALU_sel,
	input wire [4:0] shamt, // for SLL
	output wire [31:0] outputA,
	output wire [4:0] ExcCode
    );
	 
	 wire [31:0] A_add_B;
	 wire [31:0] A_sub_B;
	 wire [31:0] A_or_B;
	 wire [31:0] A_and_B;
	 wire [31:0] B_left16;
	 wire [31:0] B_left_shamt; // for SLL
	 wire [31:0] slt_res;
	 wire [31:0] sltu_res;
	 wire [31:0] null;

	 // overflow check //
	 wire [32:0] add_check;
	 assign add_check = {inputA[31], inputA} + {inputB[31], inputB};

	 wire [32:0] sub_check;
	 assign sub_check = {inputA[31], inputA} - {inputB[31], inputB};

	 wire isOverflow;
	 assign isOverflow = ((ALU_sel == `ADD || ALU_sel == `ADDI || 
	 					   ALU_sel == `LW || ALU_sel == `LH || ALU_sel == `LB || 
						   ALU_sel == `SW || ALU_sel == `SH || ALU_sel == `SB) && (add_check[32] != add_check[31])) ? 1 :
						 ((ALU_sel == `SUB) && (sub_check[32] != sub_check[31])) ? 1 : 0;
	 
	 assign A_add_B = inputA + inputB;
	 assign A_sub_B = inputA - inputB;
	 assign A_or_B = inputA | inputB;
	 assign A_and_B = inputA & inputB;
	 assign B_left16 = inputB << 5'd16;
	 assign B_left_shamt = inputB << shamt;
	 assign slt_res = $signed(inputA) < $signed(inputB);
	 assign sltu_res = {1'b0, inputA} < {1'b0, inputB};
	 assign null = 32'h0;
	 
	 assign outputA = (ALU_sel == `ADD) ? A_add_B :
							(ALU_sel == `SUB) ? A_sub_B :
							(ALU_sel == `ORI) ? A_or_B  :
							(ALU_sel == `SW)  ? A_add_B :
							(ALU_sel == `SH)  ? A_add_B :
							(ALU_sel == `SB)  ? A_add_B :
							(ALU_sel == `LW)  ? A_add_B :
							(ALU_sel == `LH)  ? A_add_B :
							(ALU_sel == `LB)  ? A_add_B :
							(ALU_sel == `AND) ? A_and_B :
							(ALU_sel == `OR)  ? A_or_B  :
							(ALU_sel == `ADDI)? A_add_B :
							(ALU_sel == `LUI) ? B_left16:
							(ALU_sel == `SLL) ? B_left_shamt :
							(ALU_sel == `SLT) ? slt_res : 
							(ALU_sel == `SLTU) ? sltu_res :
							(ALU_sel == `ANDI) ? A_and_B :
												null; //default: 0

	assign ExcCode = // address not aligned /////////////////
					 (ALU_sel == `LW && A_add_B[1:0] != 2'b00) ? 5'b00100 :
					 (ALU_sel == `LH && A_add_B[0] != 1'b0) ? 5'b00100 :
					 (ALU_sel == `SW && A_add_B[1:0] != 2'b00) ? 5'b00101 :
					 (ALU_sel == `SH && A_add_B[0] != 1'b0) ? 5'b00101 :

					 // address out of range ////////////////
					 // LW: (DM) 0x00000000 ~ 0x00002fff, (Timer 0) 0x00007f00 ~ 0x00007f0b, (Timer 1) 0x00007f10 ~ 0x00007f1b, (Interrupt Generator) 0x00007f20 ~ 0x00007f23
					 (ALU_sel == `LW && !((A_add_B >= 32'h0 && A_add_B < 32'h00003000) || (A_add_B >= 32'h00007f00 && A_add_B < 32'h00007f0c) || (A_add_B >= 32'h00007f10 && A_add_B < 32'h00007f1c) || (A_add_B >= 32'h00007f20 && A_add_B < 32'h00007f24))) ? 5'b00100 :
					 // LH LB: (DM) 0x00000000 ~ 0x00002fff, (Interrupt Generator) 0x00007f20 ~ 0x00007f23
					 ((ALU_sel == `LH || ALU_sel == `LB) && !((A_add_B >= 32'h0 && A_add_B < 32'h00003000) || (A_add_B >= 32'h00007f20 && A_add_B < 32'h00007f24))) ? 5'b00100 :
					 // LW: (DM) 0x00000000 ~ 0x00002fff, (Timer 0 without Count) 0x00007f00 ~ 0x00007f07, (Timer 1 without Count) 0x00007f10 ~ 0x00007f17, (Interrupt Generator) 0x00007f20 ~ 0x00007f23
					 (ALU_sel == `SW && !((A_add_B >= 32'h0 && A_add_B < 32'h00003000) || (A_add_B >= 32'h00007f00 && A_add_B < 32'h00007f08) || (A_add_B >= 32'h00007f10 && A_add_B < 32'h00007f18) || (A_add_B >= 32'h00007f20 && A_add_B < 32'h00007f24))) ? 5'b00101 :
					 // SH SB: (DM) 0x00000000 ~ 0x00002fff, (Interrupt Generator) 0x00007f20 ~ 0x00007f23
					 ((ALU_sel == `SH || ALU_sel == `SB) && !((A_add_B >= 32'h0 && A_add_B < 32'h00003000) || (A_add_B >= 32'h00007f20 && A_add_B < 32'h00007f24))) ? 5'b00101 :

					 // overflow ////////////////////////////
					 ((ALU_sel == `LW || ALU_sel == `LH || ALU_sel == `LB) && isOverflow) ? 5'b00100 :
					 ((ALU_sel == `SW || ALU_sel == `SH || ALU_sel == `SB) && isOverflow) ? 5'b00101 :
					 ((ALU_sel == `ADD || ALU_sel == `ADDI || ALU_sel == `SUB) && isOverflow) ? 5'b01100 : // arithmetical overflow
					 																			5'b00000;

endmodule
