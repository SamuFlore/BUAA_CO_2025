`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:11:57 11/05/2025 
// Design Name: 
// Module Name:    Controller 
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
module Controller(
	input wire [5:0] opcode,
	input wire [5:0] funct,
	input wire [4:0] rt,
	input wire [4:0] shamt,
	input wire zero,
	output wire [1:0] NPC_sel,
	output wire [5:0] ALU_sel,
	output wire GRF_enable,
	output wire EXT_type,
	output wire ALU_IB_sel,
	output wire GRF_A3_sel,
	output wire DM_enable,
	output wire DM_to_GRF_sel,
	output wire PC_plus4_to_GRF_sel,
	output wire reg_31_sel,
	output wire [1:0] store_type,
	output wire [2:0] load_type
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
				  

	wire _add,
		  _sub,
		  _ori,
		  _sw,
		  _sh,
		  _sb,
		  _lw,
		  _lh,
		  _lb,
		  _and,
		  _or,
		  _j,
		  _jal,
		  _jalr,
		  _jr,
		  _beq,
		  _bne,
		  _addi,
		  _lui,
		  _sll,
		  _bao,
		  _tftc,
		  _lboez,
		  _bnezalc,
		  _ssze,
		  _lwrr;
		  
	assign _add = (opcode == 6'h0 && funct == 6'h20) ? 1 : 0;
	assign _sub = (opcode == 6'h0 && funct == 6'h22) ? 1 : 0;
	assign _ori = (opcode == 6'h0d) ? 1 : 0;
	assign _sw  = (opcode == 6'h2b) ? 1 : 0;
	assign _sh  = (opcode == 6'h29) ? 1 : 0;
	assign _sb  = (opcode == 6'h28) ? 1 : 0;
	assign _lw  = (opcode == 6'h23) ? 1 : 0;
	assign _lh  = (opcode == 6'h21) ? 1 : 0;
	assign _lb  = (opcode == 6'h20) ? 1 : 0;
	assign _and = (opcode == 6'h0 && funct == 6'h24) ? 1 : 0;
	assign _or  = (opcode == 6'h0 && funct == 6'h25) ? 1 : 0;
	assign _j   = (opcode == 6'h02) ? 1 : 0;
	assign _jal = (opcode == 6'h03) ? 1 : 0;
	assign _jalr= (opcode == 6'h0 && funct == 6'h09) ? 1 : 0;
	assign _jr  = (opcode == 6'h0 && funct == 6'h08) ? 1 : 0;
	assign _beq = (opcode == 6'h04) ? 1 : 0;
	assign _bne = (opcode == 6'h05) ? 1 : 0;
	assign _addi= (opcode == 6'h08) ? 1 : 0;
	assign _lui = (opcode == 6'h0f) ? 1 : 0;
	assign _sll = (opcode == 6'h0 && funct == 6'h0) ? 1 : 0;
	assign _bao = (opcode == 6'b101101) ? 1 : 0;
	assign _tftc= (opcode == 6'h0 && funct == 6'b011101) ? 1 : 0;
	assign _lboez = (opcode == 6'b111110) ? 1 : 0;
	assign _bnezalc = (opcode == 6'b000001 && rt == 5'b10011) ? 1 : 0;
	assign _ssze = (opcode == 6'h0 && funct == 6'b001111 && shamt == 5'b00000) ? 1 : 0;
	assign _lwrr = (opcode == 6'b110100) ? 1 : 0;
	
	// 0:PC+4  1:imm26  2:Reg  3:imm16
	assign NPC_sel = (_j | _jal) 	 ? 2'b01 :
						  (_jalr | _jr) ? 2'b10 : 
						  (_beq | _bne | _bao | _bnezalc) ? 2'b11 : 
												2'b00;
	
	assign ALU_sel = (_add) ? ADD :
						  (_sub) ? SUB :
						  (_ori) ? ORI :
						  (_sw)  ? SW  :
						  (_sh)  ? SH  :
						  (_sb)  ? SB  :
						  (_lw)  ? LW  :
						  (_lh)  ? LH  :
						  (_lb)  ? LB  :
						  (_and) ? AND :
						  (_or)  ? OR  :
						  (_j)   ? J   :
						  (_jal) ? JAL :
						  (_jalr)? JALR:
						  (_jr)  ? JR  :
						  (_beq) ? BEQ :
						  (_bne) ? BNE :
						  (_addi)? ADDI:
						  (_lui) ? LUI :
						  (_sll) ? SLL :
						  (_bao) ? BAO :
						  (_tftc)? TFTC:
						  (_lboez)? LBOEZ:
						  (_bnezalc) ? BNEZALC :
						  (_ssze) ? SSZE :
						  (_lwrr) ? LWRR :
									  6'b111111; // default: make ALU output 0
									  
	// 1:Allow Write GRF								  
	assign GRF_enable = (_add | _sub | _ori | _lw | _lh | _lb | _and | _or | _jal | _jalr | _addi | _lui | _sll | _tftc | _lboez | (_bnezalc & zero) | _ssze | _lwrr) ? 1 : 0;
	
	// 1:signed ext  0:zero  ext
	assign EXT_type = (_sw | _sh | _sb | _lw | _lh | _lb | _beq | _bne | _addi | _bao | _lboez | _bnezalc | _lwrr) ? 1 : 0;
	
	// 1: imm16   0: rt
	assign ALU_IB_sel = (_ori | _sw | _sh | _sb | _lw | _lh | _lb | _addi | _lui | _lboez | _lwrr) ? 1 : 0;
	
	// 1: rd  0: rt
	assign GRF_A3_sel = (_add | _sub | _and | _or | _jalr | _sll | _tftc | _ssze) ? 1 : 0;
	
	// 1: allow write DM
	assign DM_enable = (_sw | _sh | _sb) ? 1 : 0;
	
	// 1: Write Data from DM to GRF
	assign DM_to_GRF_sel = (_lw | _lh | _lb | _lboez | _lwrr) ? 1 : 0;
	
	// 1: Write PC+4 to GRF
	assign PC_plus4_to_GRF_sel = (_jal | _jalr | (_bnezalc & zero)) ? 1 : 0;
	
	// 1: Select $ra as destination
	assign reg_31_sel = (_jal | (_bnezalc & zero)) ? 1 : 0;
	
	// 0: origin  1: sb  2: sh
	assign store_type = (_sb) ? 2'b01 :
							  (_sh) ? 2'b10 : 2'b00;
	
	// 0: origin  1: lb  2: lh  3: lboez
	assign load_type = (_lb) ? 3'b001 :
							 (_lh) ? 3'b010 :
							 (_lboez) ? 3'b011 :
							 (_lwrr) ? 3'b100 :
										3'b000;
	 
	 


endmodule
