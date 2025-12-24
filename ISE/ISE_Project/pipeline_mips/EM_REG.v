`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:33:42 11/13/2025 
// Design Name: 
// Module Name:    EM_REG 
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
module EM_REG(
	input wire clk,
	input wire reset,
	input wire Req, 
	input wire EM_en,
	input wire EM_clear,
	input wire [31:0] E_instr,
	input wire [31:0] E_outputA,
	input wire [31:0] E_RD2,
	input wire [4:0] E_write_addr,
	input wire [31:0] E_PC_plus8,
	input wire [31:0] E_PC,
	input wire [4:0] E_ExcCode,
	input wire E_BD,
	output reg [31:0] M_instr,
	output reg [31:0] M_outputA,
	output reg [31:0] M_RD2,
	output reg [4:0] M_write_addr,
	output reg [31:0] M_PC_plus8,
	output reg [31:0] M_PC,
	output reg [4:0] EM_ExcCode,
	output reg M_BD
    );
	 
	 always@(posedge clk) begin
		if (reset || Req ||EM_clear) begin
			M_instr <= 32'h0;
			M_outputA <= 32'h0;
			M_RD2 <= 32'h0;
			M_write_addr <= 5'b0;
			M_PC_plus8 <= 32'h0;
			M_PC <= (reset) ? 32'h00003000 : (Req) ? 32'h00004180 : E_PC;
			EM_ExcCode <= 5'b0;
			M_BD <= (reset) ? 1'b0 : (Req) ? 1'b0 : E_BD;
		end
		else begin
			if (EM_en) begin
				M_instr <= E_instr;
				M_outputA <= E_outputA;
				M_RD2 <= E_RD2;
				M_write_addr <= E_write_addr;
				M_PC_plus8 <= E_PC_plus8;
				M_PC <= E_PC;
				EM_ExcCode <= E_ExcCode;
				M_BD <= E_BD;
			end
		end
	 end


endmodule
