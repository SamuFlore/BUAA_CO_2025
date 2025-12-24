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
	input wire FD_en, //FD_en == 0 : stall
	input wire FD_clear,
	input wire [31:0] F_instr,
	input wire [31:0] F_PC_plus8, // PC+8 to stage W
	input wire [31:0] F_PC,
	output reg [31:0] D_instr,
	output reg [31:0] D_PC_plus8,
	output reg [31:0] D_PC
    );
	 
	 always@(posedge clk) begin
		if (reset || FD_clear) begin
			D_instr <= 32'h0;
			D_PC_plus8 <= 32'h0;
			D_PC <= 32'h0;
		end
		else begin
			if (FD_en) begin
				D_instr <= F_instr;
				D_PC_plus8 <= F_PC_plus8;
				D_PC <= F_PC;
			end
		end
	 end


endmodule
