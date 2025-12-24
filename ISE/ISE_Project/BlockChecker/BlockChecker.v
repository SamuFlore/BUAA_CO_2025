`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:57:56 10/19/2025 
// Design Name: 
// Module Name:    BlockChecker 
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
`define Normal 5'b00000
`define Ready 5'b00001
`define B1 5'b00010
`define B2 5'b00011
`define B3 5'b00100
`define B4 5'b00101
`define B5 5'b00110
`define E1 5'b00111
`define E2 5'b01000
`define E3 5'b01001
`define Invalid 5'b01010
`define Invalid2 5'b01011

module BlockChecker(
	input clk,
	input reset, // “Ï≤Ω
	input [7:0] in,
	output result
    );
	 
	 reg [31:0] level;
	 reg [4:0] status;
	 
	 initial begin
		level <= 0;
		status <= `Ready;
	 end
	 
	 always@(posedge clk or posedge reset) begin
		if (reset == 1) begin
			status <= `Ready;
			level <= 0;
		end
		else begin
			case (status)
				`Ready: begin
					if (in == "b" || in == "B") begin
						status <= `B1;
					end
					else if (in == "e" || in == "E") begin
						status <= `E1;
					end
					else if (in == " ") begin
						status <= `Ready;
					end
					else begin
						status <= `Normal;
					end
				end
				`Normal: begin
					if (in == " ") begin
						status <= `Ready;
					end
					else begin
						status <= `Normal;
					end
				end
				// Begin
				`B1: begin
					if (in == "e" || in == "E") begin
						status <= `B2;
					end
					else begin
						status <= `Normal;
					end
				end
				`B2: begin
					if (in == "g" || in == "G") begin
						status <= `B3;
					end
					else begin
						status <= `Normal;
					end
				end
				`B3: begin
					if (in == "i" || in == "I") begin
						status <= `B4;
					end
					else begin
						status <= `Normal;
					end
				end
				`B4: begin
					if (in == "n" || in == "N") begin
						status <= `B5;
						level <= level + 1;
					end
					else begin
						status <= `Normal;
					end
				end
				`B5: begin
					if (in == " ") begin
						status <= `Ready;
					end
					else begin
						level = level - 1;
						status <= `Normal;
					end
				end
				// end
				`E1: begin
					if (in == "n" || in == "N") begin
						status <= `E2;
					end
					else begin
						status <= `Normal;
					end
				end
				`E2: begin
					if (in == "d" || in == "D") begin
						if (level >= 1) begin
							level <= level - 1;
							status <= `E3;
						end
						else begin
							status <= `Invalid; // always output 0
						end
					end
				end
				`E3: begin
					if (in == " ") begin
						status <= `Ready;
					end
					else begin
						level = level + 1;
						status <= `Normal;
					end
				end
				// end without begin
				`Invalid: begin
					if (in != " ") begin //not real end
						status <= `Normal;
					end
					else begin
						status <= `Invalid2; //real invalid
					end
				end
				`Invalid2: begin
					status <= `Invalid2;
				end
			endcase
		end
	 end
	 
	 assign result = (level == 0 && (status != `Invalid && status != `Invalid2)) ? 1 : 0;

endmodule