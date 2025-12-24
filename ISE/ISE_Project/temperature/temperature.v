`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:59:08 10/06/2025 
// Design Name: 
// Module Name:    temperature 
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

module temperature(
	input [7:0] in,
	output reg [7:0] out
    );
	 
	 
	 integer i;
	 
	 always@(*) begin
		out = 0;
		for (i = 0; i <= 7; i = i + 1) begin
			if (in[i] == 1) begin
				out = out + 1;
			end
		end
	 end
	

endmodule
