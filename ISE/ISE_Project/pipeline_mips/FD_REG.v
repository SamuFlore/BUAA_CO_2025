`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:04:37 11/13/2025 
// Design Name: 
// Module Name:    FD_REG 
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
module FD_REG(
	input wire clk,
	input wire reset,
	input wire Req, // trap signal, clear register
	input wire FD_en, //FD_en == 0 : stall
	input wire FD_clear,
	input wire [31:0] F_instr,
	input wire [31:0] F_PC_plus8, // PC+8 to stage W
	input wire [31:0] F_PC,
	input wire [4:0] F_ExcCode,
	input wire F_BD, // for CP0
	output reg [31:0] D_instr,
	output reg [31:0] D_PC_plus8,
	output reg [31:0] D_PC,
	output reg [4:0] FD_ExcCode, // Excode from F
	output reg D_BD
    );
	 
	 always@(posedge clk) begin
		if (reset || Req || FD_clear) begin // reset > trap > stall
			D_instr <= 32'h0;
			D_PC_plus8 <= 32'h0;
			D_PC <= (reset) ? 32'h00003000 : (Req) ? 32'h00004180 : F_PC; // when clear happened (stall), keep PC
			FD_ExcCode <= 5'b0;
			D_BD <= (reset) ? 1'b0 : (Req) ? 1'b0 : F_BD; // keep BD
		end
		else begin
			if (FD_en) begin
				D_instr <= F_instr;
				D_PC_plus8 <= F_PC_plus8;
				D_PC <= F_PC;
				FD_ExcCode <= F_ExcCode;
				D_BD <= F_BD;
			end
		end
	 end


endmodule
