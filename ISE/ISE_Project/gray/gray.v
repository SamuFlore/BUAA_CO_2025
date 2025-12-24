`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:09:01 10/15/2025 
// Design Name: 
// Module Name:    gray 
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
module gray(
	input Clk,
	input Reset,
	input En,
	output reg [2:0] Output,
	output reg Overflow,
	output reg [2:0] counter
    );
	
	
	
	initial begin
		Output <= 0;
		Overflow <= 0;
		counter <= 0;
	end
	
	always @(posedge Clk) begin
		if (Reset == 1) begin
			Output <= 0;
			Overflow <= 0;
			counter <= 0;
		end
		else begin
			if (En == 1) begin
				if (counter == 3'b111) begin
					Overflow <= 1;
					counter <= 0;
					Output <= 0;
				end
				else begin
					counter = counter + 1;
					Output[2] = counter[2];
					Output[1] = counter[2] ^ counter[1];
					Output[0] = counter[1] ^ counter[0];
				end
			end
		end
	end

endmodule
