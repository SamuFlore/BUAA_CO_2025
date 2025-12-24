`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:38:09 09/15/2025 
// Design Name: 
// Module Name:    code 
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
module code(
	input Clk,
	input Reset,
	input Slt,
	input En,
	output reg [63:0] Output0,
	output reg [63:0] Output1
    );
	 
	 reg [2:0] out1_tmp;
	 
	 initial begin
		Output0 <= 64'b0;
		Output1 <= 64'b0;
		out1_tmp <= 3'b0;
	 end
	 
	 always@(posedge Clk) begin
		if (Reset) begin
			Output0 <= 64'b0;
			Output1 <= 64'b0;
			out1_tmp <= 3'b0;
		end
		else begin
			if (En) begin
				if (Slt == 0) begin//Reg0
					Output0 <= Output0 + 1;
				end
				else if (Slt == 1) begin//Reg1
					out1_tmp <= out1_tmp + 1;
					if (out1_tmp == 3) begin
						Output1 <= Output1 + 1;
						out1_tmp <= 3'b0;
					end
				end
			end
			else begin
				Output0 <= Output0;
				Output1 <= Output1;
				out1_tmp <= out1_tmp;
			end
		end
	 end


endmodule
