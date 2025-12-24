`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:19:27 11/05/2025 
// Design Name: 
// Module Name:    mips 
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
module mips(
	input wire clk,
	input wire reset // 同步复位
    );
	 
	 // PC
	 wire [31:0] pc;
	 
	 // NPC
	 wire [31:0] npc;
	 wire [31:0] pc_plus4;
	 
	 // IM
	 wire [31:0] instr;
	 wire [5:0] opcode;
	 wire [4:0] rs;
	 wire [4:0] rt;
	 wire [4:0] rd;
	 wire [4:0] shamt;
	 wire [5:0] funct;
	 wire [15:0] imm16;
	 wire [25:0] imm26;
	 
	 // GRF
	 wire [4:0] A1;
	 wire [4:0] A2;
	 wire [4:0] A3;
	 wire [31:0] write_data_GRF;
	 wire [31:0] read_data1;
	 wire [31:0] read_data2;
	 
	 // EXT
	 wire [31:0] imm32; 
	 
	 // DM
	 wire [31:0] write_data_DM;
	 wire [31:0] addr;
	 wire [31:0] output_data;
	 
	 // ALU
	 wire [31:0] inputA;
	 wire [31:0] inputB;
	 wire [31:0] outputA;
	 wire zero;
	 
	 // Controller
	 wire [1:0] NPC_sel;
	 wire [5:0] ALU_sel;
	 wire GRF_enable;
	 wire EXT_type;
	 wire ALU_IB_sel;
	 wire GRF_A3_sel;
	 wire DM_enable;
	 wire DM_to_GRF_sel;
	 wire PC_plus4_to_GRF_sel;
	 wire reg_31_sel;
	 wire [1:0] store_type;
	 wire [1:0] load_type;
	 
	 // StoreType
	 wire [31:0] output_st;
	 
	 // LoadType
	 wire [31:0] output_lt;
	 
	 // instantiate
	 PC PC (.clk(clk), .reset(reset), .NPC(npc), .PC(pc));
	 
	 NPC NPC (.PC(pc), .imm26(imm26), .GRF(inputA), .imm16(imm16),
			    .NPCSel(NPC_sel), .zero(zero), .NPC(npc), .PCplus4(pc_plus4));
	 
	 IM IM (.addr(pc), .instr(instr));
	 
	 GRF GRF (.clk(clk), .reset(reset), .write_enable(GRF_enable), .pc(pc), .addr1(A1), .addr2(A2), .write_addr(A3), 
				 .write_data(write_data_GRF), .read_data1(read_data1), .read_data2(read_data2));
				 
	 EXT EXT (.imm16(imm16), .EXT_type(EXT_type), .imm32(imm32));
	 
	 DM DM (.clk(clk), .reset(reset), .write_enable(DM_enable), .pc(pc), .addr(addr), .write_data(write_data_DM), .read_data(output_data));
	 
	 ALU ALU (.inputA(inputA), .inputB(inputB), .ALU_sel(ALU_sel), .shamt(shamt), .outputA(outputA), .zero(zero));
	 
	 Controller Ctrl (.opcode(opcode), .funct(funct), 
							.NPC_sel(NPC_sel), .ALU_sel(ALU_sel), .GRF_enable(GRF_enable), .EXT_type(EXT_type), 
							.ALU_IB_sel(ALU_IB_sel), .GRF_A3_sel(GRF_A3_sel), .DM_enable(DM_enable), 
							.DM_to_GRF_sel(DM_to_GRF_sel), .PC_plus4_to_GRF_sel(PC_plus4_to_GRF_sel), 
							.reg_31_sel(reg_31_sel), .store_type(store_type), .load_type(load_type));
		
	 StoreType ST (.src(output_lt), .data(read_data2), .addr(outputA), .store_type_sel(store_type), .output_data(output_st));
	 
	 LoadType LT (.data(output_data), .addr(outputA), .load_type_sel(load_type), .output_data(output_lt));
							
							
							
	 // 连线
	 // NPC
	 assign pc_plus4 = pc + 32'h00000004;
	 
	 // IM
	 assign opcode = instr[31:26];
	 assign rs = instr[25:21];
	 assign rt = instr[20:16];
	 assign rd = instr[15:11];
	 assign shamt = instr[10:6];
	 assign funct = instr[5:0];
	 
	 assign imm16 = instr[15:0];
	 assign imm26 = instr[25:0];
	 
	 // GRF
	 assign A1 = rs;
	 assign A2 = rt;
	 assign A3 = (reg_31_sel == 1) ? 5'b11111 :
					 (GRF_A3_sel == 1) ? rd :
												rt;
												
	 assign write_data_GRF = (PC_plus4_to_GRF_sel == 1) ? pc_plus4 :
								(DM_to_GRF_sel == 1) ? output_lt : // from LoadType
															  outputA; // from ALU
															  
	 // DM
	 assign write_data_DM = output_st; // from StoreType
	 assign addr = outputA; // from ALU
	 
	 // ALU
	 assign inputA = read_data1;
	 assign inputB = (ALU_IB_sel == 1) ? imm32 :
													 read_data2;
	 
	 

endmodule
