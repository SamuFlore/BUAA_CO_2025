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
module StoreType(
	input wire [31:0] src,
	input wire [31:0] data,
	input wire [31:0] addr,
	input wire [1:0] store_type_sel,
	output wire [31:0] output_data
    );
	 
	 wire [1:0] byte_sb;
	 wire byte_sh;
	 wire [7:0] data_sb;
	 wire [15:0] data_sh;
	 wire [31:0] output_sb;
	 wire [31:0] output_sh;
	 
	 assign byte_sb = addr[1:0];
	 assign byte_sh = addr[1];
	 assign data_sb = data[7:0];
	 assign data_sh = data[15:0];
	 
	 assign output_sb = (byte_sb == 2'b00) ? {src[31:8], data_sb} :
							  (byte_sb == 2'b01) ? {src[31:16], data_sb, src[7:0]} :
							  (byte_sb == 2'b10) ? {src[31:24], data_sb, src[15:0]} :
														  {data_sb, src[23:0]};
														  
	 assign output_sh = (byte_sh == 0) ? {src[31:16], data_sh} :
													 {data_sh, src[15:0]};
													 
													 
	 assign output_data = (store_type_sel == 2'b01) ? output_sb :
								 (store_type_sel == 2'b10) ? output_sh :
																	  data;


endmodule
