`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:30:06 11/05/2025 
// Design Name: 
// Module Name:    NPC 
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
module NPC(
	input wire [31:0] PC,
	input wire [25:0] imm26,
	input wire [31:0] GRF,
	input wire [15:0] imm16,
	input wire [1:0] NPCSel,
	input wire zero,
	output wire [31:0] NPC,
	output wire [31:0] PCplus4
    );
	 
	 
	 parameter PCPLUS4 = 2'b00;
	 parameter IMM26 = 2'b01;
	 parameter GRFDATA = 2'b10;
	 parameter IMM16 = 2'b11;
	 
	 assign PCplus4 = PC + 32'h00000004;
	 
	 wire [31:0] PC_imm26;
	 wire [31:0] PC_GRFdata;
	 wire [31:0] signed_ext_imm16;
	 wire [31:0] PC_imm16;
	 
	 assign PC_imm26 = {PC[31:28], imm26, 2'b00};
	 assign PC_GRFdata = GRF;
	 assign signed_ext_imm16 = {{14{imm16[15]}}, imm16, 2'b00};
	 assign PC_imm16 = (zero == 1) ? signed_ext_imm16 + PCplus4 :
												PCplus4;
												
	 assign NPC = (NPCSel == PCPLUS4) ? PCplus4 :
					  (NPCSel == IMM26) ? PC_imm26 :
					  (NPCSel == GRFDATA) ? PC_GRFdata :
					  (NPCSel == IMM16) ? PC_imm16 : PCplus4;

endmodule
