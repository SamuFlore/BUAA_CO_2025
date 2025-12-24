`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:25:29 11/13/2025 
// Design Name: 
// Module Name:    CMP 
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

///////////////////////// Level D ////////////////////////////////////////////////
`default_nettype none
`include "CONST.v"
module CMP(
	input wire [31:0] inputA,
	input wire [31:0] inputB,
	input wire [5:0] type, // type of instruments
	output wire zero,
	output wire null_signal // signal of nullifying delayed branching
    );
	 
	
	assign zero = ((type == `BEQ) && (inputA == inputB)) ? 1'b1 :
					  ((type == `BNE) && (inputA != inputB)) ? 1'b1 :
																			1'b0;
																			
	assign null_signal = ((type == `BGTZL) && $signed(inputA) <= $signed(32'h0)) ? 1 :
																											 0;

endmodule
