`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:25:32 11/05/2025 
// Design Name: 
// Module Name:    DM 
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
module DM(
	input wire clk,
	input wire reset,
	input wire write_enable,
	input wire [31:0] pc,
	input wire [31:0] addr,
	input wire [31:0] write_data,
	output wire [31:0] read_data
    );
	 
	 wire [31:0] RAM_index;
	 wire [31:0] forced_addr;
	 
	 assign RAM_index = (addr >> 2);
	 assign forced_addr = (RAM_index << 2);
	 
	 
	 reg [31:0] RAM [0:3071]; // 3072*32 bit RAM
	 
	 integer i;
	 
	 always@(posedge clk) begin
		if (reset == 1) begin
			for (i = 0; i < 3072; i = i + 1) begin
				RAM[i] = 32'h00000000;
			end
		end
		else begin
			if (write_enable == 1) begin
				$display("@%h: *%h <= %h", pc, forced_addr, write_data);
				RAM[RAM_index] <= write_data;
			end
		end
	 end
	 
	 assign read_data = RAM[RAM_index];


endmodule
