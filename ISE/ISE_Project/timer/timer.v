`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:46:40 09/20/2025 
// Design Name: 
// Module Name:    timer 
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
`define OFF1 3'b000
`define OFF2 3'b001
`define OFF3 3'b010
`define SET1 3'b011
`define SET2 3'b100
`define STR 3'b101


module timer(
	input clk,
	input reset,
	input on,
	input off,
	input ok,
	input mode,
	input [7:0] value,
	output [7:0] out
    );
	 
	reg [2:0] status;
	reg [7:0] n;// initial value
	reg [7:0] cnt;// count
	reg m;// mode
	
	initial begin
		status <= `OFF1;
		cnt <= 8'b0;
		m <= 0;
		n <= 0;
	end
	
	always@(posedge clk or posedge reset) begin
		if (reset == 1) begin
			status <= `OFF1;
			cnt <= 8'b0;
			m <= 0;
			n <= 0;
		end
		else begin
		case (status)
			`OFF1: begin
				if (on == 1) begin
					status <= `OFF2;
				end
				else begin
					status <= `OFF1;
				end
			end
				
				`OFF2: begin
					status <= `OFF3;
				end
					
				`OFF3: begin
					if (off == 1) begin
						cnt <= 8'b0;
						m <= 0;
						n <= 0;
						status <= `OFF1;
					end
					else begin
						status <= `SET1;
					end
				end
					
				`SET1: begin
					if (off == 1) begin
						cnt <= 8'b0;
						m <= 0;
						n <= 0;
						status <= `OFF1;
					end
					else if (ok == 1) begin
						cnt <= value;
						n <= value;
						m <= mode;
						status <= `SET2;
					end
					else begin
						status <= `SET1;
					end
				end
				
				`SET2: begin
					if (off == 1) begin
						cnt <= 8'b0;
						m <= 0;
						n <= 0;
						status <= `OFF1;
					end
					else begin
						status <= `STR;
					end
				end
				
				`STR: begin
					if (off == 1) begin
						cnt <= 8'b0;
						m <= 0;
						n <= 0;
						status <= `OFF1;
					end
					else begin
						if (m == 0) begin
							if (cnt == 0) begin
								status <= `OFF1;
								cnt <= 8'b0;
								m <= 0;
								n <= 0;
							end
							else begin
								cnt <= cnt - 1;
								status <= `STR;
							end
						end
						else begin
							if (cnt == 0) begin
								cnt <= n;
								status <= `STR;
							end
							else begin
								cnt <= cnt - 1;
								status <= `STR;
							end
						end
					end
				end
		endcase
		end
	end
	
	assign out = ( status == `OFF1 ||
						status == `OFF2 ||
						status == `OFF3) ? 8'b11111111 :
						(status == `SET1 ||
						status == `SET2) ? 8'b0 :
						cnt;


endmodule
