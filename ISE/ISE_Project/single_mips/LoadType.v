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
module LoadType(
	input wire [31:0] data,
	input wire [31:0] addr,
	input wire [1:0] load_type_sel,
	output wire [31:0] output_data
    );
	 
	 wire [1:0] byte_lb;
	 wire byte_lh;
	 wire [7:0] data_lb;
	 wire [15:0] data_lh;
	 wire [31:0] output_lb;
	 wire [31:0] output_lh;
	 
	 assign byte_lb = addr[1:0];
	 assign byte_lh = addr[1];
	 assign data_lb = (byte_lb == 2'b00) ? data[7:0] :
							(byte_lb == 2'b01) ? data[15:8] :
							(byte_lb == 2'b10) ? data[23:16] :
														data[31:24];
	 
	 assign data_lh = (byte_lh == 0) ? data[15:0] :
												  data[31:16];
												  
	 assign output_lb = {{24{data_lb[7]}}, data_lb};
	 assign output_lh = {{16{data_lh[15]}}, data_lh};
	 
	 assign output_data = (load_type_sel == 2'b01) ? output_lb :
								 (load_type_sel == 2'b10) ? output_lh :
																	 data;


endmodule
