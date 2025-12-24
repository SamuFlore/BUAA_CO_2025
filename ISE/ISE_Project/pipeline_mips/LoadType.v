`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:49:41 11/06/2025 
// Design Name: 
// Module Name:    LoadType 
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
`include "CONST.v"
module LoadType(
	input wire [31:0] data,
	input wire [31:0] addr,
	input wire [5:0] load_instr,
	output wire [31:0] output_data
    );
	 
	wire byte_lh;
	wire [1:0] byte_lb;
	wire [31:0] output_lh;
	wire [31:0] output_lb;

	assign byte_lh = addr[1];
	assign byte_lb = addr[1:0];

	assign output_lh = (load_instr == `LH && byte_lh == 1'b0) ? {{16{data[15]}}, data[15:0]} :
					   (load_instr == `LH && byte_lh == 1'b1) ? {{16{data[31]}}, data[31:16]} :
					   											32'h0;

	assign output_lb = (load_instr == `LB && byte_lb == 2'b00) ? {{24{data[7]}}, data[7:0]} :
					   (load_instr == `LB && byte_lb == 2'b01) ? {{24{data[15]}}, data[15:8]} :
					   (load_instr == `LB && byte_lb == 2'b10) ? {{24{data[23]}}, data[23:16]} :
					   (load_instr == `LB && byte_lb == 2'b11) ? {{24{data[31]}}, data[31:24]} :
					   											 32'h0;

	assign output_data = (load_instr == `LW) ? data :
						 (load_instr == `LH) ? output_lh :
						 (load_instr == `LB) ? output_lb :
						 					   data;  
					   


endmodule
