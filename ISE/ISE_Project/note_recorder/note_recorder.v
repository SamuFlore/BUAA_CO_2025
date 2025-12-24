`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:09:49 10/21/2025 
// Design Name: 
// Module Name:    note_recorder 
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
module note_recorder(
	input clk,
	input reset,
	input [2:0] note_in,
	input [1:0] op,
	input [6:0] query,
	output reg [2:0] note_out,
	output reg [7:0] count
    );
	 
	 integer i;
	 reg [2:0] notes [0:127];
	 reg [7:0] tmp_cnt;
	 
	 initial begin
		note_out <= 0;
		count <= 0;
		tmp_cnt <= 0;
		for (i = 0; i <= 127; i = i + 1) begin
			notes[i] <= 3'd0;
		end
	 end
	 
	 always@(posedge clk) begin
		if (reset == 1) begin
			note_out <= 0;
			count <= 0;
			tmp_cnt <= 0;
			for (i = 0; i <= 127; i = i + 1) begin
				notes[i] <= 3'd0;
			end
		end
		else begin
			case (op)
				2'b00: begin
					for (i = 0; i <= 126; i = i + 1) begin
						notes[i] <= notes[i + 1];
					end
					notes[127] <= note_in;
					count <= count;
					note_out <= note_out;
				end
				2'b01: begin
					note_out <= notes[query];
					count <= count;
				end
				2'b11: begin
					count <= tmp_cnt;
					note_out <= note_out;
				end
				2'b10: begin
					count <= count;
					note_out <= note_out;
				end
			endcase
		end
	 end
	
	always@(*) begin
		tmp_cnt = 0;
		for (i = 0; i <= 127; i = i + 1) begin
			if (notes[i] == query[2:0]) tmp_cnt = tmp_cnt + 1;
		end
	end

endmodule
