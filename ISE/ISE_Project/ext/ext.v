`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:41:55 10/14/2025 
// Design Name: 
// Module Name:    ext 
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
module ext(
	input [15:0] imm,
	input [1:0] EOp,
	output [31:0] ext
    );
	 
	 wire s;
	 assign s = imm[15];
	 
	 assign ext = (EOp == 2'b00) ?
						(s == 1'b0) ? {16'b0, imm} : {16'hffff, imm} :
						(EOp == 2'b01) ? {16'b0, imm} :
						(EOp == 2'b10) ? {imm, 16'b0} :
						(EOp == 2'b11) ? 
						(s == 1'b0) ? {16'b0, imm} << 2: {16'hffff, imm} << 2 : 32'b0;


endmodule
