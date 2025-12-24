`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:14:14 09/11/2025 
// Design Name: 
// Module Name:    sales 
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
module sales(
	input clk,
	input rst,
	input [31:0] price,
	input [31:0] num,
	output [31:0] avg
    );
	
	reg [31:0] tmp_avg;
	reg [31:0] tmp_num;
	reg [31:0] tmp_price;
	
	initial begin
		tmp_avg <= 0;
		tmp_num <= 0;
		tmp_price <= 0;
	end
	
	always@(posedge clk) begin
	
		if (rst == 1) begin
			tmp_avg <= 0;
			tmp_num <= 0;
			tmp_price <= 0;
		end
		else begin
		tmp_num <= tmp_num + num;
		tmp_price <= tmp_price + num * price;
		tmp_avg <= (tmp_num + num == 0) ? 0 : (tmp_price + num * price) / (tmp_num + num);
		end
		
	end
		
	assign avg = tmp_avg;


endmodule
