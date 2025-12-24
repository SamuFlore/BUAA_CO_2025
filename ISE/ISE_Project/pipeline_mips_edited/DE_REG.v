`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:18:51 11/13/2025 
// Design Name: 
// Module Name:    DE_REG 
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
module DE_REG(
	input wire clk,
	input wire reset,
	input wire DE_en,
	input wire DE_clear, //DE_clear == 1 : generate "nop"
	input wire [31:0] D_instr,
	input wire [31:0] D_RD1,
	input wire [31:0] D_RD2,
	input wire [4:0] D_write_addr, // addr for GRF, write 
	input wire [31:0] D_PC_plus8, // for stage W
	input wire [31:0] D_PC,
	input wire [31:0] D_imm32, // imm16 extend to imm32
	output reg [31:0] E_instr,
	output reg [31:0] E_RD1,
	output reg [31:0] E_RD2,
	output reg [4:0] E_write_addr,
	output reg [31:0] E_PC_plus8,
	output reg [31:0] E_PC,
	output reg [31:0] E_imm32
    );
	 
	 always@(posedge clk) begin
		if (reset || DE_clear) begin
			E_instr <= 32'h0;
			E_RD1 <= 32'h0;
			E_RD2 <= 32'h0;
			E_write_addr <= 5'b0;
			E_PC_plus8 <= 32'h0;
			E_PC <= 32'h0;
			E_imm32 <= 32'h0;
		end
		else begin
			if (DE_en) begin
				E_instr <= D_instr;
				E_RD1 <= D_RD1;
				E_RD2 <= D_RD2;
				E_write_addr <= D_write_addr;
				E_PC_plus8 <= D_PC_plus8;
				E_PC <= D_PC;
				E_imm32 <= D_imm32;
			end
		end
	 end


endmodule
