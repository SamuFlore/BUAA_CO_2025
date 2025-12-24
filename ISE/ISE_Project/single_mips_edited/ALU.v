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
				  SLL = 6'b010011,
				  BAO = 6'b010100,
				  TFTC= 6'b010101,
				  LBOEZ = 6'b010110,
				  BNEZALC = 6'b010111,
				  SSZE = 6'b011000,
				  LWRR = 6'b011001;
	 
	 wire [31:0] A_add_B;
	 wire [31:0] A_sub_B;
	 wire [31:0] A_or_B;
	 wire [31:0] A_and_B;
	 wire [31:0] B_left16;
	 wire [31:0] B_left_shamt; // for SLL
	 wire [31:0] null;
	 wire [32:0] temp; // BAO
	 reg [31:0] tc; // TFTC
	 reg [31:0] temp_rs; // LBOEZ
	 reg [31:0] temp_rs2; // SSZE
	 reg [31:0] temp_rt; // SSZE
	 reg flag_rs;
	 reg flag_rt;
	 reg [31:0] temp1; // 0 of rs, SSZE
	 reg [31:0] temp2; // 0 of rt, SSZE
	 
	 wire [15:0] ext_imm;
	 assign ext_imm = $signed(inputA[15:0]);
	 wire [15:0] res;
	 assign res = $signed(ext_imm) % $signed(17);
	 
	 assign A_add_B = inputA + inputB;
	 assign A_sub_B = inputA - inputB;
	 assign A_or_B = inputA | inputB;
	 assign A_and_B = inputA & inputB;
	 assign B_left16 = inputB << 5'd16;
	 assign B_left_shamt = inputB << shamt;
	 assign null = 32'h0;
	 assign temp = {inputA[31], inputA} + {inputB[31], inputB};
	 
	 integer i; // Ñ­»·±äÁ¿
	 always@(*) begin
		temp_rs = inputA;
		if (temp_rs == 32'h0 || temp_rs == 32'h80000000) begin
			tc = 32'h0;
		end
		else begin
			if (temp_rs[31] == 0) begin
				tc = temp_rs;
			end
			else begin
				for (i = 30; i >= 0; i = i - 1) begin
					if (temp_rs[i] == 1'b0) begin
						temp_rs[i] = 1'b1;
					end
					else begin
						temp_rs[i] = 1'b0;
					end
				end
				temp_rs = temp_rs + 1'b1;
				tc = temp_rs;
			end
		end
	 end
	 
	 always@(*) begin
		temp1 = 0;
		temp2 = 0;
		flag_rs = 0;
		flag_rt = 0;
		temp_rs2 = inputA;
		temp_rt = inputB;
		for (i = 0; i < 32 && flag_rs == 0; i = i + 1) begin
			if (temp_rs2[i] == 0) begin
				temp1 = temp1 + 1;
			end
			else begin
				flag_rs = 1;
			end
		end
		
		for (i = 0; i < 32 && flag_rt == 0; i = i + 1) begin
			if (temp_rt[i] == 0) begin
				temp2 = temp2 + 1;
			end
			else begin
				flag_rt = 1;
			end
		end
	 end
	 
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
							(ALU_sel == SLL) ? B_left_shamt : 
							(ALU_sel == TFTC)? tc :
							(ALU_sel == LBOEZ)? A_add_B: // get Mem[paddr]
							(ALU_sel == SSZE && (temp1 == temp2)) ? {31'b0, 1'b1} :
							(ALU_sel == LWRR) ? A_add_B :
													 null; //default: 0
							
	assign zero = ((ALU_sel == BEQ) && (inputA == inputB)) ? 1 :
					  ((ALU_sel == BNE) && (inputA != inputB)) ? 1 :
					  ((ALU_sel == BAO) && (temp[32] != temp[31])) ? 1 :
					  ((ALU_sel == BNEZALC) && (inputA != 32'h0)) ? 1 :
																					 0;
	 

endmodule
