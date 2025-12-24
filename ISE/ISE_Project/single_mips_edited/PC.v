`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:21:44 11/05/2025 
// Design Name: 
// Module Name:    PC 
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
module PC(
	input wire clk,
	input wire reset,
	input wire [31:0] NPC,
	output wire [31:0] PC
    );
	
	reg [31:0] reg_PC;
	
	always@(posedge clk) begin
		if (reset == 1) begin
			reg_PC <= 32'h00003000;
		end
		else begin
			reg_PC <= NPC;
		end
	end
	
	assign PC = reg_PC;

endmodule
