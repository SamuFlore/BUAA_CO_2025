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
`include "CONST.v"

module Controller(
	input wire [5:0] opcode,
	input wire [5:0] funct,
	output wire [1:0] NPC_sel,
	output wire [5:0] instr_type,
	output wire GRF_enable,
	output wire EXT_type,
	output wire ALU_IB_sel,
	output wire ALU_MDU_sel,
	output wire GRF_A3_sel,
	output wire DM_to_GRF_sel,
	output wire PC_plus8_to_GRF_sel,
	output wire reg_31_sel,
	// D:0, E:1, M:2, W:3
	output wire [3:0] t_rs, 
	output wire [3:0] t_rt, 
	output wire [3:0] t,
	output wire start
    );
	 
	 

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
		  _mfhi,
		  _mflo,
		  _mthi,
		  _mtlo,
		  _mult,
		  _multu,
		  _div,
		  _divu,
		  _slt,
		  _sltu,
		  _andi,
		  _madd;
		  
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
	assign _mult = (opcode == 6'b000000 && funct == 6'b011000) ? 1'b1 : 1'b0;
	assign _multu = (opcode == 6'b000000 && funct == 6'b011001) ? 1'b1 : 1'b0;
	assign _div = (opcode == 6'b000000 && funct == 6'b011010) ? 1'b1 : 1'b0;
	assign _divu = (opcode == 6'b000000 && funct == 6'b011011) ? 1'b1 : 1'b0;
	assign _mfhi = (opcode == 6'b000000 && funct == 6'b010000) ? 1'b1 : 1'b0;
	assign _mflo = (opcode == 6'b000000 && funct == 6'b010010) ? 1'b1 : 1'b0;
	assign _mthi = (opcode == 6'b000000 && funct == 6'b010001) ? 1'b1 : 1'b0;
	assign _mtlo = (opcode == 6'b000000 && funct == 6'b010011) ? 1'b1 : 1'b0;
	assign _slt = (opcode == 6'b0 && funct == 6'b101010) ? 1 : 0;
	assign _sltu = (opcode == 6'h0 && funct == 6'b101011) ? 1 : 0;
	assign _andi = (opcode == 6'b001100) ? 1 : 0;
	assign _madd = (opcode ==  6'b011100) ? 1 : 0;
	
	assign NPC_sel = (_j | _jal) 	 ? 2'b01 :
						  (_jalr | _jr) ? 2'b10 : 
						  (_beq | _bne) ? 2'b11 : 
												2'b00;
	
	// 1:Allow Write GRF				  
	assign GRF_enable = (_add | _sub | _ori | _lw | _lh | _lb | _and | _or | _jal | _jalr | _addi | _lui | _sll | _mfhi | _mflo | _slt | _sltu | _andi) ? 1 : 0;
	
	// 1:signed ext  0:zero  ext
	assign EXT_type = (_sw | _sh | _sb | _lw | _lh | _lb | _beq | _bne | _addi) ? 1 : 0;
	
	// 1: imm16   0: rt
	assign ALU_IB_sel = (_ori | _sw | _sh | _sb | _lw | _lh | _lb | _addi | _lui | _andi) ? 1 : 0;

	// 1: MDU as output of stage E    0: ALU as output of stage E
	assign ALU_MDU_sel = (_mflo | _mfhi) ? 1 : 0;
	
	// 1: rd  0: rt
	assign GRF_A3_sel = (_add | _sub | _and | _or | _jalr | _sll | _mfhi | _mflo | _slt | _sltu) ? 1 : 0;

	// 1: Write Data from DM to GRF
	assign DM_to_GRF_sel = (_lw | _lh | _lb) ? 1 : 0;
	
	// 1: Write PC+8 to GRF
	assign PC_plus8_to_GRF_sel = (_jal | _jalr) ? 1 : 0;
	
	// 1: Select $ra as destination
	assign reg_31_sel = (_jal) ? 1 : 0;
	
							 
							 
							 
	assign instr_type = (_add) ? `ADD :
						  (_sub) ? `SUB :
						  (_ori) ? `ORI :
						  (_sw)  ? `SW  :
						  (_sh)  ? `SH  :
						  (_sb)  ? `SB  :
						  (_lw)  ? `LW  :
						  (_lh)  ? `LH  :
						  (_lb)  ? `LB  :
						  (_and) ? `AND :
						  (_or)  ? `OR  :
						  (_j)   ? `J   :
						  (_jal) ? `JAL :
						  (_jalr)? `JALR:
						  (_jr)  ? `JR  :
						  (_beq) ? `BEQ :
						  (_bne) ? `BNE :
						  (_addi)? `ADDI:
						  (_lui) ? `LUI :
						  (_sll) ? `SLL :
						  (_mult) ? `MULT :
						  (_multu) ? `MULTU :
						  (_div) ? `DIV :
						  (_divu) ? `DIVU :
						  (_mfhi) ? `MFHI :
						  (_mflo) ? `MFLO :
						  (_mthi) ? `MTHI :
						  (_mtlo) ? `MTLO :
						  (_slt) ? `SLT :
						  (_sltu) ? `SLTU :
						  (_andi) ? `ANDI :
						  (_madd) ? `MADD :
									  6'b111111; // default: make ALU output 0

	assign t_rs = (_add) ? 4'h1 :
					  (_sub) ? 4'h1 :
					  (_ori) ? 4'h1 :
					  (_sw)  ? 4'h1 : // E: base + sign_ext
					  (_sh)  ? 4'h1 :
					  (_sb)  ? 4'h1 :
					  (_lw)  ? 4'h1 :
					  (_lh)  ? 4'h1 :
					  (_lb)  ? 4'h1 :
					  (_and) ? 4'h1 :
					  (_or)  ? 4'h1 :
					  (_j)   ? 4'hf : // ��ʹ��
					  (_jal) ? 4'hf : // ͬ��
					  (_jalr)? 4'h0 : // D: GPR[rs] to NPC 
					  (_jr)  ? 4'h0 : // ͬ��
					  (_beq) ? 4'h0 : // D: CMP ģ��
					  (_bne) ? 4'h0 : // ͬ��
					  (_addi)? 4'h1 : // ������ E ����Ҫ
					  (_lui) ? 4'hf :
					  (_sll) ? 4'hf :
					  (_mult) ? 4'h1 : // MDU
					  (_multu) ? 4'h1 : // MDU
					  (_div) ? 4'h1 : // MDU
					  (_divu) ? 4'h1 : // MDU
					  (_mfhi) ? 4'hf :
					  (_mflo) ? 4'hf :
					  (_mthi) ? 4'h1 : // MDU
					  (_mtlo) ? 4'h1 : // MDU
					  (_slt) ? 4'h1 : //ALU
					  (_sltu) ? 4'h1 : // ALU
					  (_andi) ? 4'h1 : //ALU
					  (_madd) ? 4'h1: // MDU
								  4'hf;
		
	assign t_rt = (_add) ? 4'h1 :
					  (_sub) ? 4'h1 :
					  (_ori) ? 4'h1 :
					  (_sw)  ? 4'h2 : // M: GPR[rt] to DM
					  (_sh)  ? 4'h2 : // M: StoreType
					  (_sb)  ? 4'h2 : // ͬ��
					  (_lw)  ? 4'hf : // ���ö� GPR[rt]
					  (_lh)  ? 4'hf : // ͬ��
					  (_lb)  ? 4'hf : // ͬ��
					  (_and) ? 4'h1 :
					  (_or)  ? 4'h1 :
					  (_j)   ? 4'hf : // ��ʹ��
					  (_jal) ? 4'hf : // ͬ��
					  (_jalr)? 4'hf : // ͬ��
					  (_jr)  ? 4'hf : // ͬ��
					  (_beq) ? 4'h0 : // D: CMP ģ��
					  (_bne) ? 4'h0 : // ͬ��
					  (_addi)? 4'hf : // ���ö� GPR[rt]
					  (_lui) ? 4'hf : // ͬ��
					  (_sll) ? 4'h1 : // E: ALU
					  (_mult) ? 4'h1 : // MDU
					  (_multu) ? 4'h1 : // MDU
					  (_div) ? 4'h1 : // MDU
					  (_divu) ? 4'h1 : // MDU
					  (_mfhi) ? 4'hf :
					  (_mflo) ? 4'hf :
					  (_mthi) ? 4'hf :
					  (_mtlo) ? 4'hf :
					  (_slt) ? 4'h1 : // ALU
					  (_sltu) ? 4'h1 : // ALU
					  (_andi) ? 4'hf :
					  (_madd) ? 4'h1 : // MDU
								  4'hf;
								  
								  
	assign t  =   (_add) ? 4'h2 : // EMreg ���ת��
					  (_sub) ? 4'h2 : // ͬ��
					  (_ori) ? 4'h2 : // ͬ��
					  (_sw)  ? 4'hf : // ������������
					  (_sh)  ? 4'hf : // ͬ��
					  (_sb)  ? 4'hf : // ͬ��
					  (_lw)  ? 4'h3 : // MWreg ���ת��
					  (_lh)  ? 4'h3 : // ͬ��
					  (_lb)  ? 4'h3 : // ͬ��
					  (_and) ? 4'h2 : // EMreg
					  (_or)  ? 4'h2 : // ͬ��
					  (_j)   ? 4'hf : // ������������
					  (_jal) ? 4'h0 : // FDreg ���ת��
					  (_jalr)? 4'h0 : // ͬ��
					  (_jr)  ? 4'hf : // ������������
					  (_beq) ? 4'hf : // ͬ��
					  (_bne) ? 4'hf : // ͬ��
					  (_addi)? 4'h2 : // EMreg ���ת��
					  (_lui) ? 4'h2 : // ͬ��
					  (_sll) ? 4'h2 : // ͬ��
					  (_mult) ? 4'hf :
					  (_multu) ? 4'hf :
					  (_div) ? 4'hf :
					  (_divu) ? 4'hf :
					  (_mfhi) ? 4'h2 : // after EMreg
					  (_mflo) ? 4'h2 : // after EMreg
					  (_mthi) ? 4'hf :
					  (_mtlo) ? 4'hf :
					  (_slt) ? 4'h2 : // EMreg
					  (_sltu) ? 4'h2 : // EMreg
					  (_andi) ? 4'h2 : // EMreg
					  (_madd) ? 4'h2 : // EM_reg
								  4'hf;
	 
	 
	// 1: start use MDU to calculate    0: do not use MDU to calculate
	assign start = (_mult | _multu | _div | _divu | _madd) ? 1 : 0;

endmodule
