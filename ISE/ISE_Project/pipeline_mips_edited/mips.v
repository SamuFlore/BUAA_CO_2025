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
`include "CONST.v"
module mips (
    input wire clk,
    input wire reset, 
    input wire [31:0] i_inst_rdata,
    input wire [31:0] m_data_rdata,
    output wire [31:0] i_inst_addr,
    output wire [31:0] m_data_addr,
    output wire [31:0] m_data_wdata,
    output wire [3 :0] m_data_byteen,
    output wire [31:0] m_inst_addr,
    output wire w_grf_we,
    output wire [4:0] w_grf_addr,
    output wire [31:0] w_grf_wdata,
    output wire [31:0] w_inst_addr
);

  //////////////////////////////////////////////////////////////////////////////
  // Level F ///////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////

  //// Declare ////

  // PC
  wire [31:0] F_PC;

  // NPC
  wire [31:0] F_NPC;
  wire [31:0] F_PC_plus8;

  // IM
  wire [31:0] F_instr;

  //// Assign ////

  assign F_PC_plus8 = F_PC + 32'h00000008;
  
  assign i_inst_addr = F_PC; // F to IM
  assign F_instr = i_inst_rdata; // IM to FDreg

  // import
  PC PC (
      .clk(clk),
      .reset(reset),
      .PC_en(PC_en),
      .NPC(F_NPC),
      .PC(F_PC)
  );

  NPC NPC (
      .F_PC(F_PC),
      .imm26(D_imm26),
      .GRF(D_exact_RD1),
      .imm16(D_imm16),
      .NPCSel(D_NPC_sel),
      .zero(D_zero),
      .NPC(F_NPC)
  );

  FD_REG FD_Reg (
      .clk(clk),
      .reset(reset),
      .FD_en(FD_en),
      .FD_clear(FD_clr),
      .F_instr(F_instr),
      .F_PC_plus8(F_PC_plus8),
      .F_PC(F_PC),
      .D_instr(D_instr),
      .D_PC_plus8(D_PC_plus8),
      .D_PC(D_PC)
  );


  //////////////////////////////////////////////////////////////////////////////
  // Level D ///////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////

  //// Declare ////

  // D Controller
  wire [1:0] D_NPC_sel;
  wire D_EXT_type;
  wire D_GRF_A3_sel;
  wire D_reg_31_sel;
  wire [5:0] D_instr_type;
  wire [3:0] D_t_rs;
  wire [3:0] D_t_rt;
  wire [3:0] D_t;

  // D Decode
  wire [5:0] D_opcode;
  wire [4:0] D_rs;
  wire [4:0] D_rt;
  wire [4:0] D_rd;
  wire [4:0] D_shamt;
  wire [5:0] D_funct;
  wire [15:0] D_imm16;
  wire [25:0] D_imm26;

  // D GRF, only read!
  wire [4:0] D_A1;
  wire [4:0] D_A2;
  wire [31:0] D_RD1;
  wire [31:0] D_RD2;

  // for level W
  wire [4:0] D_write_addr;

  // D EXT
  wire [31:0] D_imm32;

  // D CMP
  wire D_zero;
  wire D_null_signal;  // nullify delayed branching

  // F to D
  wire [31:0] D_instr;
  wire [31:0] D_PC_plus8;
  wire [31:0] D_PC;

  //// Assign ////

  assign D_opcode = D_instr[31:26];
  assign D_rs = D_instr[25:21];
  assign D_rt = D_instr[20:16];
  assign D_rd = D_instr[15:11];
  assign D_shamt = D_instr[10:6];
  assign D_funct = D_instr[5:0];
  assign D_imm16 = D_instr[15:0];
  assign D_imm26 = D_instr[25:0];

  assign D_A1 = D_rs;
  assign D_A2 = D_rt;
  assign D_write_addr = (D_reg_31_sel == 1) ? 5'b11111 : 
                        (D_GRF_A3_sel == 1) ? D_rd : 
                                              D_rt;


  // import
  Controller DCtrl (
      .opcode(D_opcode),
      .funct(D_funct),
      .NPC_sel(D_NPC_sel),
      .instr_type(D_instr_type),
      .EXT_type(D_EXT_type),
      .GRF_A3_sel(D_GRF_A3_sel),
      .reg_31_sel(D_reg_31_sel),
      .t_rs(D_t_rs),
      .t_rt(D_t_rt),
      .t(D_t)
  );

  GRF GRF (
      .clk(clk),
      .reset(reset),
      .write_enable(W_GRF_enable),
      .pc(W_PC),
      .addr1(D_A1),
      .addr2(D_A2),
      .write_addr(W_A3),
      .write_data(W_write_data),
      .read_data1(D_RD1),
      .read_data2(D_RD2)
  );

  CMP CMP (
      .inputA(D_exact_RD1),
      .inputB(D_exact_RD2),
      .type(D_instr_type),
      .zero(D_zero),
      .null_signal(D_null_signal)
  );

  EXT EXT (
      .imm16(D_imm16),
      .EXT_type(D_EXT_type),
      .imm32(D_imm32)
  );

  DE_REG DE_Reg (
      .clk(clk),
      .reset(reset),
      .DE_en(DE_en),
      .DE_clear(DE_clr),
      .D_instr(D_instr),
      .D_RD1(D_exact_RD1),
      .D_RD2(D_exact_RD2),
      .D_write_addr(D_write_addr),
      .D_PC_plus8(D_PC_plus8),
      .D_PC(D_PC),
      .D_imm32(D_imm32),
      .E_instr(E_instr),
      .E_RD1(E_RD1),
      .E_RD2(E_RD2),
      .E_write_addr(E_write_addr),
      .E_PC_plus8(E_PC_plus8),
      .E_PC(E_PC),
      .E_imm32(E_imm32)
  );


  //////////////////////////////////////////////////////////////////////////////
  // Level E ///////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////

  //// Declare ////

  // E Controller
  wire E_ALU_IB_sel;
  wire E_ALU_MDU_sel;
  wire [5:0] E_instr_type;
  wire [3:0] E_t_rs;
  wire [3:0] E_t_rt;
  wire [3:0] E_t;

  // E Decode
  wire [5:0] E_opcode;
  wire [4:0] E_rs;
  wire [4:0] E_rt;
  wire [4:0] E_rd;
  wire [4:0] E_shamt;
  wire [5:0] E_funct;
  wire [15:0] E_imm16;
  wire [25:0] E_imm26;

  // E ALU
  wire [31:0] E_inputA;
  wire [31:0] E_inputB;
  wire [31:0] E_outputA;

  // E MDU
  wire [31:0] E_outputB;
  wire [31:0] E_exact_outputA;
  wire E_start;
  wire E_busy;

  // D to E
  wire [31:0] E_instr;
  wire [31:0] E_RD1;
  wire [31:0] E_RD2;
  wire [4:0] E_write_addr;  // goto W stage
  wire [31:0] E_PC_plus8;
  wire [31:0] E_PC;
  wire [31:0] E_imm32;

  //// Assign ////

  assign E_opcode = E_instr[31:26];
  assign E_rs = E_instr[25:21];
  assign E_rt = E_instr[20:16];
  assign E_rd = E_instr[15:11];
  assign E_shamt = E_instr[10:6];
  assign E_funct = E_instr[5:0];
  assign E_imm16 = E_instr[15:0];
  assign E_imm26 = E_instr[25:0];

  // use exact value!!!
  assign E_inputA = E_exact_RD1;
  assign E_inputB = (E_ALU_IB_sel == 1) ? E_imm32 : 
                                          E_exact_RD2;

  assign E_exact_outputA = (E_ALU_MDU_sel == 1) ? E_outputB :E_outputA; // MDU or ALU

  // import
  Controller ECtrl (
      .opcode(E_opcode),
      .funct(E_funct),
      .instr_type(E_instr_type),
      .ALU_IB_sel(E_ALU_IB_sel),
      .ALU_MDU_sel(E_ALU_MDU_sel),
      .t_rs(E_t_rs),
      .t_rt(E_t_rt),
      .t(E_t),
      .start(E_start)
  );

  ALU ALU (
      .inputA (E_inputA),
      .inputB (E_inputB),
      .ALU_sel(E_instr_type),
      .shamt  (E_shamt),
      .outputA(E_outputA)
  );

  MDU MDU (
    .clk(clk),
    .reset(reset),
    .inputA(E_inputA),
    .inputB(E_inputB),
    .instr_type(E_instr_type),
    .outputB(E_outputB),
    .start(E_start),
    .busy(E_busy)
  );


  EM_REG EM_Reg (
      .clk(clk),
      .reset(reset),
      .EM_en(EM_en),
      .EM_clear(EM_clr),
      .E_instr(E_instr),
      .E_outputA(E_exact_outputA), // MDU or ALU
      .E_RD2(E_exact_RD2),
      .E_write_addr(E_write_addr),
      .E_PC_plus8(E_PC_plus8),
      .E_PC(E_PC),
      .M_instr(M_instr),
      .M_outputA(M_outputA),
      .M_RD2(M_RD2),
      .M_write_addr(M_write_addr),
      .M_PC_plus8(M_PC_plus8),
      .M_PC(M_PC)
  );

  //////////////////////////////////////////////////////////////////////////////
  // Level M ///////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////

  //// Declare ////

  // M Controller
  wire [1:0] M_store_type;
  wire [1:0] M_load_type;
  wire [5:0] M_instr_type;
  wire [3:0] M_t_rs;
  wire [3:0] M_t_rt;
  wire [3:0] M_t;


  // M Decode
  wire [5:0] M_opcode;
  wire [4:0] M_rs;
  wire [4:0] M_rt;
  wire [4:0] M_rd;
  wire [4:0] M_shamt;
  wire [5:0] M_funct;
  wire [15:0] M_imm16;
  wire [25:0] M_imm26;

  // M DM
  wire [31:0] M_DM_addr;
  wire [31:0] M_DM_write_data;  // origin data to DM
  wire [31:0] M_DM_data;  // data from DM

  // M ST
  wire [31:0] M_ST_output; // processed data to DM
  wire [3:0] M_DM_write_byte;

  // M LT
  wire [31:0] M_LT_output; // processed data from DM

  // E to M
  wire [31:0] M_instr;
  wire [31:0] M_outputA;
  wire [31:0] M_RD2;
  wire [4:0] M_write_addr;  // A3
  wire [31:0] M_PC_plus8;
  wire [31:0] M_PC;

  //// Assign ////

  assign m_data_addr = M_DM_addr;
  assign m_data_wdata = M_ST_output;
  assign m_data_byteen = M_DM_write_byte;
  assign m_inst_addr = M_PC;
  assign M_DM_data = m_data_rdata; 

  assign M_opcode = M_instr[31:26];
  assign M_rs = M_instr[25:21];
  assign M_rt = M_instr[20:16];
  assign M_rd = M_instr[15:11];
  assign M_shamt = M_instr[10:6];
  assign M_funct = M_instr[5:0];
  assign M_imm16 = M_instr[15:0];
  assign M_imm26 = M_instr[25:0];

  assign M_DM_addr = M_outputA;

  // use exact value!!!
  assign M_DM_write_data = M_exact_RD2;

  // import
  Controller MCtrl (
      .opcode(M_opcode),
      .funct(M_funct),
      .instr_type(M_instr_type),
      .t_rs(M_t_rs),
      .t_rt(M_t_rt),
      .t(M_t)
  );

  StoreType ST (
      .data(M_DM_write_data),
      .addr(M_DM_addr),
      .store_instr(M_instr_type),
      .DM_write_byte(M_DM_write_byte),
      .output_data(M_ST_output)
  );

  LoadType LT (
      .data(M_DM_data),
      .addr(M_DM_addr),
      .load_instr(M_instr_type),
      .output_data(M_LT_output)
  );

  MW_REG MWReg (
      .clk(clk),
      .reset(reset),
      .MW_en(MW_en),
      .MW_clear(MW_clr),
      .M_instr(M_instr),
      .M_outputA(M_outputA),
      .M_write_addr(M_write_addr),
      .M_data(M_LT_output),
      .M_PC_plus8(M_PC_plus8),
      .M_PC(M_PC),
      .W_instr(W_instr),
      .W_outputA(W_outputA),
      .W_write_addr(W_write_addr),
      .W_data(W_data),
      .W_PC_plus8(W_PC_plus8),
      .W_PC(W_PC)
  );

  //////////////////////////////////////////////////////////////////////////////
  // Level W ///////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////

  //// Declare ////

  // W Controller
  wire W_GRF_enable;
  wire W_DM_to_GRF_sel;
  wire W_PC_plus8_to_GRF_sel;
  wire [5:0] W_instr_type;
  wire [3:0] W_t_rs;
  wire [3:0] W_t_rt;
  wire [3:0] W_t;

  // W Decode
  wire [5:0] W_opcode;
  wire [4:0] W_rs;
  wire [4:0] W_rt;
  wire [4:0] W_rd;
  wire [4:0] W_shamt;
  wire [5:0] W_funct;
  wire [15:0] W_imm16;
  wire [25:0] W_imm26;

  // W GRF, only write!
  wire [31:0] W_write_data;
  wire [4:0] W_A3;

  // M to W
  wire [31:0] W_instr;
  wire [31:0] W_outputA;
  wire [4:0] W_write_addr;  // W_A3, GRF
  wire [31:0] W_data;  // W_write_data, GRF
  wire [31:0] W_PC_plus8;
  wire [31:0] W_PC;

  //// Assign ////

  assign w_grf_we = W_GRF_enable;
  assign w_grf_wdata = W_write_data;
  assign w_grf_addr = W_A3;
  assign w_inst_addr = W_PC;

  assign W_opcode = W_instr[31:26];
  assign W_rs = W_instr[25:21];
  assign W_rt = W_instr[20:16];
  assign W_rd = W_instr[15:11];
  assign W_shamt = W_instr[10:6];
  assign W_funct = W_instr[5:0];
  assign W_imm16 = W_instr[15:0];
  assign W_imm26 = W_instr[25:0];

  assign W_write_data = (W_PC_plus8_to_GRF_sel == 1) ? W_PC_plus8 :
								  (W_DM_to_GRF_sel == 1) ? W_data :
														  W_outputA;

  assign W_A3 = W_write_addr;

  // import
  Controller WCtrl (
      .opcode(W_opcode),
      .funct(W_funct),
      .instr_type(W_instr_type),
      .GRF_enable(W_GRF_enable),
      .DM_to_GRF_sel(W_DM_to_GRF_sel),
      .PC_plus8_to_GRF_sel(W_PC_plus8_to_GRF_sel),
      .t_rs(W_t_rs),
      .t_rt(W_t_rt),
      .t(W_t)
  );


  //////////////////////////////////////////////////////////////////////////////
  // Forward ///////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////

  //// Declare ////

  // destination
  // exact value of CMP, stage D
  wire [31:0] D_exact_RD1; // GPR[rs]
  wire [31:0] D_exact_RD2; // GPR[rt]
  // exact value of ALU, stage E
  wire [31:0] E_exact_RD1; // GPR[rs]
  wire [31:0] E_exact_RD2; // GPR[rt]
  // exact value of ST, stage M
  wire [31:0] M_exact_RD2;

  // time
  // level D
  wire [3:0] D_rs_tuse;
  wire [3:0] D_rt_tuse;
  wire [3:0] D_tnew;

  // level E
  wire [3:0] E_rs_tuse;
  wire [3:0] E_rt_tuse;
  wire [3:0] E_tnew;

  // level M
  wire [3:0] M_rs_tuse;
  wire [3:0] M_rt_tuse;
  wire [3:0] M_tnew;

  // level W
  wire [3:0] W_rs_tuse;
  wire [3:0] W_rt_tuse;
  wire [3:0] W_tnew;

  // check pc + 8
  wire E_is_PC_plus8;
  wire M_is_PC_plus8;

  // Forward Data Path Signal
  // from PC + 8 of level E
  wire D_RD1_from_E_PC_plus8;
  wire D_RD2_from_E_PC_plus8;
  // from PC + 8 of level M
  wire D_RD1_from_M_PC_plus8;
  wire D_RD2_from_M_PC_plus8;
  wire E_RD1_from_M_PC_plus8;
  wire E_RD2_from_M_PC_plus8;

  // from level M
  wire D_RD1_from_M;
  wire D_RD2_from_M;
  wire E_RD1_from_M;
  wire E_RD2_from_M;

  // from level W
  // GRF internal
  wire D_RD1_from_W;
  wire D_RD2_from_W;
  // other
  wire E_RD1_from_W;
  wire E_RD2_from_W;
  wire M_RD2_from_W;  // for StoreType

  //// Assign ////

  // exact data
  // E > M > W > origin data !!!
  assign D_exact_RD1 = (D_RD1_from_E_PC_plus8 == 1) ? E_PC_plus8 :
								 (D_RD1_from_M_PC_plus8 == 1) ? M_PC_plus8 :
								 (D_RD1_from_M == 1)				? M_outputA  :
								 (D_RD1_from_W == 1)				? W_write_data :
																		  D_RD1;

  assign D_exact_RD2 = (D_RD2_from_E_PC_plus8 == 1) ? E_PC_plus8 :
								 (D_RD2_from_M_PC_plus8 == 1) ? M_PC_plus8 :
								 (D_RD2_from_M == 1)				? M_outputA  :
								 (D_RD2_from_W == 1)				? W_write_data :
																		  D_RD2;

  assign E_exact_RD1 = (E_RD1_from_M_PC_plus8 == 1) ? M_PC_plus8 :
								 (E_RD1_from_M == 1)  			? M_outputA  :
								 (E_RD1_from_W == 1)				? W_write_data :
																		  E_RD1;

  assign E_exact_RD2 = (E_RD2_from_M_PC_plus8 == 1) ? M_PC_plus8 :
								 (E_RD2_from_M == 1)				? M_outputA  :
								 (E_RD2_from_W == 1)				? W_write_data :
																		  E_RD2;

  assign M_exact_RD2 = (M_RD2_from_W == 1) ? W_write_data : M_RD2;

  // time
  //// D:0, E:1, M:2, W:3 ////
  // X_tuse : when must use the value, use code of stages mentioned above
  // X_t : when the value to store to GRF can be forwarded, starting from a stage register

  // D
  assign D_rs_tuse = D_t_rs;
  assign D_rt_tuse = D_t_rt;
  assign D_tnew = D_t;

  // E
  assign E_rs_tuse = (E_t_rs == 4'hf) ? 4'hf :  
      (E_t_rs > 4'h1)  ? E_t_rs - 4'h1 :
      4'h0;

  assign E_rt_tuse = (E_t_rt == 4'hf) ? 4'hf : (E_t_rt > 4'h1) ? E_t_rt - 4'h1 : 4'h0;

  assign E_tnew = (E_t == 4'hf) ? 4'hf : (E_t > 4'h1) ? E_t - 4'h1 : 4'h0;

  // M
  assign M_rs_tuse = (M_t_rs == 4'hf) ? 4'hf : (M_t_rs > 4'h2) ? M_t_rs - 4'h2 : 4'h0;

  assign M_rt_tuse = (M_t_rt == 4'hf) ? 4'hf : (M_t_rt > 4'h2) ? M_t_rt - 4'h2 : 4'h0;

  assign M_tnew = (M_t == 4'hf) ? 4'hf : (M_t > 4'h2) ? M_t - 4'h2 : 4'h0;

  // W
  assign W_rs_tuse = (W_t_rs == 4'hf) ? 4'hf : (W_t_rs > 4'h3) ? W_t_rs - 4'h3 : 4'h0;

  assign W_rt_tuse = (W_t_rt == 4'hf) ? 4'hf : (W_t_rt > 4'h3) ? W_t_rt - 4'h3 : 4'h0;

  assign W_tnew = (W_t == 4'hf) ? 4'hf : (W_t > 4'h3) ? W_t - 4'h3 : 4'h0;

  // PC + 8 						
  assign E_is_PC_plus8 = (E_instr_type == `JAL) ? 1 : (E_instr_type == `JALR) ? 1 : 0;

  assign M_is_PC_plus8 = (M_instr_type == `JAL) ? 1 : (M_instr_type == `JALR) ? 1 : 0;

  // signals
  // 1. PC+8 or not
  // 2. destination cannot be $0
  // 3. starting register cannot be the same with ending register
  // 4. tuse and tnew exist
  // 5. tuse >= tnew
  // from E
  assign D_RD1_from_E_PC_plus8 = (E_is_PC_plus8 && E_write_addr != 5'b0 && D_rs == E_write_addr && D_rs_tuse != 4'hf && E_tnew != 4'hf && D_rs_tuse >= E_tnew) ? 1 : 0;
  assign D_RD2_from_E_PC_plus8 = (E_is_PC_plus8 && E_write_addr != 5'b0 && D_rt == E_write_addr && D_rt_tuse != 4'hf && E_tnew != 4'hf && D_rt_tuse >= E_tnew) ? 1 : 0;

  // from M
  assign D_RD1_from_M_PC_plus8 = (M_is_PC_plus8 && M_write_addr != 5'b0 && D_rs == M_write_addr && D_rs_tuse != 4'hf && M_tnew != 4'hf && D_rs_tuse >= M_tnew) ? 1 : 0;
  assign D_RD2_from_M_PC_plus8 = (M_is_PC_plus8 && M_write_addr != 5'b0 && D_rt == M_write_addr && D_rt_tuse != 4'hf && M_tnew != 4'hf && D_rt_tuse >= M_tnew) ? 1 : 0;
  assign E_RD1_from_M_PC_plus8 = (M_is_PC_plus8 && M_write_addr != 5'b0 && E_rs == M_write_addr && E_rs_tuse != 4'hf && M_tnew != 4'hf && E_rs_tuse >= M_tnew) ? 1 : 0;
  assign E_RD2_from_M_PC_plus8 = (M_is_PC_plus8 && M_write_addr != 5'b0 && E_rt == M_write_addr && E_rt_tuse != 4'hf && M_tnew != 4'hf && E_rt_tuse >= M_tnew) ? 1 : 0;

  assign D_RD1_from_M = (!M_is_PC_plus8 && M_write_addr != 5'b0 && D_rs == M_write_addr && D_rs_tuse != 4'hf && M_tnew != 4'hf && D_rs_tuse >= M_tnew) ? 1 : 0;
  assign D_RD2_from_M = (!M_is_PC_plus8 && M_write_addr != 5'b0 && D_rt == M_write_addr && D_rt_tuse != 4'hf && M_tnew != 4'hf && D_rt_tuse >= M_tnew) ? 1 : 0;
  assign E_RD1_from_M = (!M_is_PC_plus8 && M_write_addr != 5'b0 && E_rs == M_write_addr && E_rs_tuse != 4'hf && M_tnew != 4'hf && E_rs_tuse >= M_tnew) ? 1 : 0;
  assign E_RD2_from_M = (!M_is_PC_plus8 && M_write_addr != 5'b0 && E_rt == M_write_addr && E_rt_tuse != 4'hf && M_tnew != 4'hf && E_rt_tuse >= M_tnew) ? 1 : 0;

  // from W, include the possibility of PC+8
  assign D_RD1_from_W = (W_write_addr != 5'b0 && D_rs == W_write_addr && D_rs_tuse != 4'hf && W_tnew != 4'hf && D_rs_tuse >= W_tnew) ? 1 : 0;
  assign D_RD2_from_W = (W_write_addr != 5'b0 && D_rt == W_write_addr && D_rt_tuse != 4'hf && W_tnew != 4'hf && D_rt_tuse >= W_tnew) ? 1 : 0;
  assign E_RD1_from_W = (W_write_addr != 5'b0 && E_rs == W_write_addr && E_rs_tuse != 4'hf && W_tnew != 4'hf && E_rs_tuse >= W_tnew) ? 1 : 0;
  assign E_RD2_from_W = (W_write_addr != 5'b0 && E_rt == W_write_addr && E_rt_tuse != 4'hf && W_tnew != 4'hf && E_rt_tuse >= W_tnew) ? 1 : 0;
  assign M_RD2_from_W = (W_write_addr != 5'b0 && M_rt == W_write_addr && M_rt_tuse != 4'hf && W_tnew != 4'hf && M_rt_tuse >= W_tnew) ? 1 : 0;


  //////////////////////////////////////////////////////////////////////////////
  // Stall /////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////

  //// Declare ////

  wire PC_en;
  wire FD_en;
  wire DE_en;
  wire EM_en;
  wire MW_en;

  wire PC_clr;
  wire FD_clr;
  wire DE_clr;
  wire EM_clr;
  wire MW_clr;

  wire stall;  // signal for level D

  wire D_is_mult; // if instrument in stage D is MULT etc. and busy in MDU, stall

  //// Assign ////

  assign PC_en = (stall) ? 0 : 1;  // stall: stop changing PC
  assign FD_en = (stall) ? 0 : 1;  // stall: make instrument in stage D keep
  assign DE_en = 1;
  assign EM_en = 1;
  assign MW_en = 1;

  assign PC_clr = 0;
  assign FD_clr = (!stall && D_null_signal) ? 1 : 0; // nullify delayed branching: condition is true, and cannot be stalled
  assign DE_clr = (stall) ? 1 : 0;  // stall: generate a "nop"
  assign EM_clr = 0;
  assign MW_clr = 0;

  assign D_is_mult = (D_instr_type == `MULT ||
                      D_instr_type == `MULTU ||
                      D_instr_type == `DIV ||
                      D_instr_type == `DIVU ||
                      D_instr_type == `MFHI ||
                      D_instr_type == `MFLO ||
                      D_instr_type == `MTHI ||
                      D_instr_type == `MTLO) ? 1 : 0;

  // 2. destination cannot be PC+8
  // 3. starting register cannot be the same with ending register
  // 4. tuse and tnew exist
  // 5. tuse < tnew
  assign stall =      (E_write_addr != 5'b0 && D_rs == E_write_addr && D_rs_tuse != 4'hf && E_tnew != 4'hf && D_rs_tuse < E_tnew) ? 1 :
						 (E_write_addr != 5'b0 && D_rt == E_write_addr && D_rt_tuse != 4'hf && E_tnew != 4'hf && D_rt_tuse < E_tnew) ? 1 :
						 (M_write_addr != 5'b0 && D_rs == M_write_addr && D_rs_tuse != 4'hf && M_tnew != 4'hf && D_rs_tuse < M_tnew) ? 1 :
						 (M_write_addr != 5'b0 && D_rt == M_write_addr && D_rt_tuse != 4'hf && M_tnew != 4'hf && D_rt_tuse < M_tnew) ? 1 :
						 (W_write_addr != 5'b0 && D_rs == W_write_addr && D_rs_tuse != 4'hf && W_tnew != 4'hf && D_rs_tuse < W_tnew) ? 1 :
						 (W_write_addr != 5'b0 && D_rt == W_write_addr && D_rt_tuse != 4'hf && W_tnew != 4'hf && D_rt_tuse < W_tnew) ? 1 :
                         (D_is_mult && (E_start || E_busy)) ? 1 :
																																											0;

endmodule
