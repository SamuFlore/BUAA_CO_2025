`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:40:20 10/15/2025 
// Design Name: 
// Module Name:    expr 
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
`define S0 5'b00000
`define S1 5'b00001 // invalid
`define S2 5'b00010
`define S3 5'b00100
`define S4 5'b01000


module expr(
	input clk,
	input clr, // “Ï≤Ω
	input [7:0] in,
	output out
    );
	 
	 reg [4:0] status;
	 
	 initial begin
		status <= `S0;
	 end
	
	always @(posedge clk or posedge clr) begin
		if (clr == 1) begin
			status <= `S0;
		end
		else begin
			case (status)
				`S0: begin
					if (in >= "0" && in <= "9") begin
						status <= `S2;
					end
					else begin
						status <= `S1;
					end
				end
				`S1: begin
					status <= `S1;
				end
				`S2: begin
					if (in == "+" || in == "*") begin
						status <= `S3;
					end
					else begin
						status <= `S1;
					end
				end
				`S3: begin
					if (in >= "0" && in <= "9") begin
						status <= `S4;
					end
					else begin
						status <= `S1;
					end
				end
				`S4: begin
					if (in == "+" || in == "*") begin
						status <= `S3;
					end
					else begin
						status <= `S1;
					end
				end
			endcase
		end
	end
	
	assign out = (status == `S4 || status == `S2) ? 1 : 0;

endmodule
