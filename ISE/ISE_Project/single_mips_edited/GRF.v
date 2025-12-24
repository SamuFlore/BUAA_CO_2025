`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:03:44 11/05/2025 
// Design Name: 
// Module Name:    GRF 
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
module GRF(
	input wire clk,
	input wire reset,
	input wire write_enable,
	input wire [31:0] pc,
	input wire [4:0] addr1,
	input wire [4:0] addr2,
	input wire [4:0] write_addr,
	input wire [31:0] write_data,
	output wire [31:0] read_data1,
	output wire [31:0] read_data2
    );

	reg [31:0] GRF [0:31]; // 32 GRFs
	
	integer i;
	
	always@(posedge clk) begin
		if (reset == 1) begin
			for (i = 0; i < 32; i = i + 1) begin
				GRF[i] <= 32'h00000000;
			end
		end
		else begin
			if (write_enable == 1) begin
				$display("@%h: $%d <= %h", pc, write_addr, write_data);
				if (write_addr != 5'b0) begin // if not $0, write
					GRF[write_addr] <= write_data;
				end
			end
		end
	end
	
	assign read_data1 = GRF[addr1];
	assign read_data2 = GRF[addr2];

endmodule
