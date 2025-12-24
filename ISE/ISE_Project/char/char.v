`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:06:59 09/15/2025 
// Design Name: 
// Module Name:    char 
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
`define S0 2'b00//invalid
`define S1 2'b01//letter
`define S2 2'b10//letter + num


module char(
	input [7:0] char,
	input clk,
	output out
    );
	reg [1:0] status;
	
	initial begin
		status <= `S0;
	end
	
	always@(posedge clk) begin
		
	end

endmodule
