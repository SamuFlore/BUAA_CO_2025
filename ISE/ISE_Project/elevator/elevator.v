`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:07:52 09/11/2025 
// Design Name: 
// Module Name:    elevator 
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
module elevator(
	input [2:0] from,
	input clk,
	input reset,
	output out,
	output reg [2:0] cur_floor,//from 001 to 111
	output reg direction,//0 for up, 1 for down
	output reg [2:0] request//from 001 to 111, 000 for no request
    );
	 
	 
	 
	 initial begin
		cur_floor <= 3'b001;
		direction <= 0;
		request <= 3'b000;
	 end
	 
	 
	 always@(posedge clk) begin
	 
		if (reset == 1) begin
			cur_floor <= 3'b001;
			direction <= 0;
			request <= 3'b000;
		end
		
		else begin
			if (from == 3'b000) begin//no request
				if (direction == 0) begin
					if (cur_floor == 3'b111) begin
						direction <= 1;
						cur_floor <= cur_floor - 1;
					end
					else begin
						cur_floor <= cur_floor + 1;
					end
				end
				else begin
					if (cur_floor == 3'b001) begin
						direction <= 0;
						cur_floor <= cur_floor + 1;
					end
					else begin
						cur_floor <= cur_floor - 1;
					end
				end
				
				if (cur_floor == request) begin
					request <= 3'b000;
					cur_floor <= cur_floor;
					direction <= direction;
				end
				else begin
					request <= request;
				end
			end
			
			else if (from != 3'b000) begin//have request
				request <= from;
				if (cur_floor == from) begin
					request <= 3'b000;
					cur_floor <= cur_floor;
					direction <= direction;
				end
				else if (from > cur_floor) begin
					direction <= 0;
					cur_floor <= cur_floor + 1;
				end
				else begin
					direction <= 1;
					cur_floor <= cur_floor - 1;
				end
			end
		end
	 end
	 
		assign out = (cur_floor == request || cur_floor == from) ? 1 : 0;

endmodule
