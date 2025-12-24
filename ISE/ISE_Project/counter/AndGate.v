`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:45:55 09/01/2025 
// Design Name: 
// Module Name:    AndGate 
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
module AndGate(
	input clk,
	input a,
	input b,
	output reg c
	);
	
	always @(posedge clk)begin
		c = a & b;
	end

endmodule
