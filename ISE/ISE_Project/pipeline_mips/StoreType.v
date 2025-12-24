`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:17:57 11/06/2025 
// Design Name: 
// Module Name:    StoreType 
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
module StoreType(
	input wire [31:0] data,
	input wire [31:0] addr,
	input wire [5:0] store_instr,
	input wire Req,
	output wire [3:0] DM_write_byte, // for DM to select which byte to write
	output wire [31:0] output_data
    );

	wire [1:0] byte_sb;
	wire byte_sh;

	wire [31:0] output_sh;
	wire [31:0] output_sb;

	wire [3:0] write_byte_sh;
	wire [3:0] write_byte_sb;

	assign byte_sb = addr[1:0];
	assign byte_sh = addr[1];

	assign output_sh = (byte_sh == 1'b0) ? {16'h0, data[15:0]} :
					   (byte_sh == 1'b1) ? {data[15:0], 16'h0} :
					   					   data;

	assign output_sb = (byte_sb == 2'b00) ? {24'h0, data[7:0]} :
					   (byte_sb == 2'b01) ? {16'h0, data[7:0], 8'h0} :
					   (byte_sb == 2'b10) ? {8'h0, data[7:0], 16'h0} :
					   (byte_sb == 2'b11) ? {data[7:0], 24'h0} : 
					   						data;

	assign write_byte_sh = (byte_sh == 1'b0) ? 4'b0011 :
						   (byte_sh == 1'b1) ? 4'b1100 :
						   					   4'b0000;
	
	assign write_byte_sb = (byte_sb == 2'b00) ? 4'b0001 :
						   (byte_sb == 2'b01) ? 4'b0010 :
						   (byte_sb == 2'b10) ? 4'b0100 :
						   (byte_sb == 2'b11) ? 4'b1000 :
						   						4'b0000;
	 
	assign DM_write_byte = (Req) ? 4'b0000 : // if trap, disable DM
						   (store_instr == `SW) ? 4'b1111 :
						   (store_instr == `SH) ? write_byte_sh :
						   (store_instr == `SB) ? write_byte_sb :
						   						  4'b0000;

	assign output_data =   (store_instr == `SW) ? data :
						   (store_instr == `SH) ? output_sh :
						   (store_instr == `SB) ? output_sb :
						   						  data;
	 
endmodule
