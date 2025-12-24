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
	input wire [31:0] addr, // from ALU, Î´Ç¿ÖÆ¶ÔÆë
	input wire [2:0] load_type_sel,
	output wire [31:0] output_data
    );
	 
	 wire [1:0] byte_lb;
	 wire byte_lh;
	 wire [1:0] byte_lboez;
	 wire [1:0] byte_lwrr;
	 wire [7:0] data_lb;
	 wire [15:0] data_lh;
	 wire [7:0] data_lboez;
	 wire [31:0] data_lwrr1;
	 wire [31:0] data_lwrr2;
	 wire [31:0] data_lwrr3;
	 wire [31:0] output_lb;
	 wire [31:0] output_lh;
	 wire [31:0] output_lboez;
	 wire [31:0] output_lwrr;
	 wire [31:0] temp_lboez;
	 
	 
	 assign byte_lb = addr[1:0];
	 assign byte_lh = addr[1];
	 assign byte_lboez = addr[1:0];
	 assign byte_lwrr = addr[1:0];
	 assign data_lb = (byte_lb == 2'b00) ? data[7:0] :
							(byte_lb == 2'b01) ? data[15:8] :
							(byte_lb == 2'b10) ? data[23:16] :
														data[31:24];
	 
	 assign data_lh = (byte_lh == 0) ? data[15:0] :
												  data[31:16];
												  
	 assign data_lboez = {data[7+8*byte_lboez], data[6+8*byte_lboez], data[5+8*byte_lboez], data[4+8*byte_lboez], data[3+8*byte_lboez], data[2+8*byte_lboez], data[1+8*byte_lboez], data[8*byte_lboez]};
	
	 assign temp_lboez = data[7+8*byte_lboez] + data[6+8*byte_lboez] + data[5+8*byte_lboez] + data[4+8*byte_lboez] + data[3+8*byte_lboez] + data[2+8*byte_lboez] + data[1+8*byte_lboez] + data[8*byte_lboez];
	 
	 assign data_lwrr1 = {data[7:0], data[31:8]};
	 assign data_lwrr2 = {data[15:0], data[31:16]};
	 assign data_lwrr3 = {data[23:0], data[31:24]};
	 
	 assign output_lboez = (temp_lboez == 4) ? {{24{data_lboez[7]}}, data_lboez} : 32'h0;
												  
	 assign output_lb = {{24{data_lb[7]}}, data_lb};
	 assign output_lh = {{16{data_lh[15]}}, data_lh};
	 
	 assign output_lwrr = (byte_lwrr == 2'b00) ? data : 
								 (byte_lwrr == 2'b01) ? data_lwrr1 :
								 (byte_lwrr == 2'b10) ? data_lwrr2 :
																data_lwrr3;
								 
	 assign output_data = (load_type_sel == 3'b001) ? output_lb :
								 (load_type_sel == 3'b010) ? output_lh :
								 (load_type_sel == 3'b011) ? output_lboez :
								 (load_type_sel == 3'b100) ? output_lwrr : 
																	 data;


endmodule
