`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:36:33 10/19/2025 
// Design Name: 
// Module Name:    test 
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
//ºê¶¨Òå×´Ì¬±àÂë
`define S0 3'b010
`define S1 3'b011
`define S2 3'b111
`define S3 3'b110
`define S4 3'b100
`define S5 3'b000

module test(
	input clk,
	output c
    );

	reg [2:0] status;//×´Ì¬´æ´¢
	
	initial begin
		status <= `S0;
	end
	
	always@(posedge clk) begin
		case (status) //×´Ì¬×ªÒÆºÍ´æ´¢
			`S0: status <= `S1;
			`S1: status <= `S2;
			`S2: status <= `S3;
			`S3: status <= `S4;
			`S4: status <= `S5;
			`S5: status <= `S0;
		endcase
	end
	
	assign c = (status == `S5) ? 1 : 0;

endmodule
