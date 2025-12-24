`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:59:58 11/13/2025 
// Design Name: 
// Module Name:    MW_REG 
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
module MW_REG(
	input wire clk,
	input wire reset,
	input wire MW_en,
	input wire MW_clear,
	input wire [31:0] M_instr,
	input wire [31:0] M_outputA,
	input wire [4:0] M_write_addr,
	input wire [31:0] M_data, // processed data by LT to stage W
	input wire [31:0] M_PC_plus8,
	input wire [31:0] M_PC,
	output reg [31:0] W_instr,
	output reg [31:0] W_outputA,
	output reg [4:0] W_write_addr,
	output reg [31:0] W_data,
	output reg [31:0] W_PC_plus8,
	output reg [31:0] W_PC
    );
	 
	 always@(posedge clk) begin
		if (reset || MW_clear) begin
			W_instr <= 32'h0;
			W_outputA <= 32'h0;
			W_write_addr <= 5'b0;
			W_data <= 32'h0;
			W_PC_plus8 <= 32'h0;
			W_PC <= 32'h0;
		end
		else begin
			if (MW_en) begin
				W_instr <= M_instr;
				W_outputA <= M_outputA;
				W_write_addr <= M_write_addr;
				W_data <= M_data;
				W_PC_plus8 <= M_PC_plus8;
				W_PC <= M_PC;
			end
		end
	 end


endmodule
