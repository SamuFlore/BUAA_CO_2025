`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:00:15 09/15/2025 
// Design Name: 
// Module Name:    cpu_checker 
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
`define W 2'b00 //Wrong Format
`define R 2'b01 //Register
`define M 2'b10 //Memory
`define S0 5'b00000
`define S1 5'b00001
`define S2 5'b00010
`define S3 5'b00011
`define S4 5'b00100
`define S5 5'b00101
`define R1 5'b00110 //Register's branch
`define R2 5'b00111
`define R3 5'b01000
`define R4 5'b01001
`define R5 5'b01010
`define R6 5'b01011 //Output
`define M1 5'b01100 //Memory's branch
`define M2 5'b01101
`define M3 5'b01110
`define M4 5'b01111
`define M5 5'b10000
`define M6 5'b10001 //Output


module cpu_checker(
	input clk,
	input reset,
	input [7:0] char,
	output [1:0] format_type,
	output reg [4:0] status
    );
	 
	 
	 reg [2:0] demi_cnt;
	 reg [3:0] hex_cnt;
	 
	 initial begin
		status <= `S0;
		demi_cnt <= 3'b0;
		hex_cnt <= 4'b0;
	 end
	
	 always@(posedge clk) begin
		if (reset == 1) begin
			status <= `S0;
			demi_cnt <= 3'b0;
			hex_cnt <= 4'b0;
		end
		else begin
		case (status)
			`S0: begin //invalid
				if (char == "^") begin
					status <= `S1;
				end
				else begin
					status <= `S0;
				end
			end
			
			`S1: begin // ^ time
				if (char >= "0" && char <= "9" && demi_cnt < 3'b100) begin
					demi_cnt <= demi_cnt + 1;
					status <= `S1;
				end
				else if (char == "@" && demi_cnt <= 3'b100 && demi_cnt >= 3'b001) begin//小于等于
					demi_cnt <= 3'b0;
					status <= `S2;
				end
				else begin
					demi_cnt <= 3'b0;
					status <= `S0;
				end
			end
			
			`S2: begin // ^ time @ pc
				if (char == "^") begin
					hex_cnt <= 4'b0;
					status <= `S1;
				end
				else if (((char >= "0" && char <= "9") || (char >= "a" && char <= "f")) && hex_cnt < 4'b1000) begin
					hex_cnt <= hex_cnt + 1;
					status <= `S2;
				end
				else if (char == ":" && hex_cnt == 4'b1000) begin//等于
					hex_cnt <= 4'b0;
					status <= `S3;
				end
				else begin
					hex_cnt <= 4'b0;
					status <= `S0;
				end
			end
			
			`S3: begin // ^ time @ pc : [space]
				if (char == "^") begin
					status <= `S1;
				end
				else if (char == " ") begin
					status <= `S3;
				end
				else if (char == "$") begin //R branch
					status <= `R1;
				end
				else if (char == "*") begin //M branch
					status <= `M1;
				end
				else begin
					status <= `S0;
				end
			end
			
			`R1: begin // ^ time @ pc : [space] $ grf
				if (char == "^") begin
					demi_cnt <= 3'b0;
					status <= `S1;
				end
				else if (char >= "0" && char <= "9" && demi_cnt < 3'b100) begin
					demi_cnt <= demi_cnt + 1;
					status <= `R1;
				end
				else if (char == " " && demi_cnt <= 3'b100 && demi_cnt >= 3'b001) begin
					demi_cnt <= 3'b0;
					status <= `R2;
				end
				else if (char == "<" && demi_cnt <= 3'b100 && demi_cnt >= 3'b001) begin
					demi_cnt <= 3'b0;
					status <= `R3;
				end
				else begin
					demi_cnt <= 3'b0;
					status <= `S0;
				end
			end
			
			`R2: begin // ^ time @ pc : [space] $ grf [space]
				if (char == "^") begin
					status <= `S1;
				end
				else if (char == " ") begin
					status <= `R2;
				end
				else if (char == "<") begin
					status <= `R3;
				end
				else begin
					status <= `S0;
				end
			end
			
			`R3: begin // ^ time @ pc : [space] $ grf [space] < 
				if (char == "^") begin
					status <= `S1;
				end
				else if (char == "=") begin
					status <= `R4;
				end
				else begin
					status <= `S0;
				end
			end
			
			`R4: begin // ^ time @ pc : [space] $ grf [space] <= [space]
				if (char == "^") begin
					hex_cnt <= 4'b0;
					status <= `S1;
				end
				else if (char == " ") begin
					hex_cnt <= 4'b0;
					status <= `R4;
				end
				else if (((char >= "0" && char <= "9") || (char >= "a" && char <= "f")) && hex_cnt < 4'b1000) begin
					hex_cnt <= hex_cnt + 1;
					status <= `R5;
				end
				else begin
					hex_cnt <= 4'b0;
					status <= `S0;
				end
			end
			
			`R5: begin // ^ time @ pc : [space] $ grf [space] <= [space] data
				if (char == "^") begin
					hex_cnt <= 4'b0;
					status <= `S1;
				end
				else if (((char >= "0" && char <= "9") || (char >= "a" && char <= "f")) && hex_cnt < 4'b1000) begin
					hex_cnt <= hex_cnt + 1;
					status <= `R5;
				end
				else if (char == "#" && hex_cnt == 4'b1000) begin//等于
					hex_cnt <= 4'b0;
					status <= `R6;
				end
				else begin
					hex_cnt <= 4'b0;
					status <= `S0;
				end
			end
			
			`R6: begin //output
				if (char == "^") begin
					status <= `S1;
				end
				else begin
					status <= `S0;
				end
			end
			
			`M1: begin // ^ time @ pc : [space] * addr
				if (char == "^") begin
					hex_cnt <= 4'b0;
					status <= `S1;
				end
				else if (((char >= "0" && char <= "9") || (char >= "a" && char <= "f")) && hex_cnt < 4'b1000) begin
					hex_cnt <= hex_cnt + 1;
					status <= `M1;
				end
				else if (hex_cnt == 4'b1000 && char != "<") begin//等于
					hex_cnt <= 4'b0;
					status <= `M2;
				end
				else if (hex_cnt == 4'b1000 && char == "<") begin
					hex_cnt <= 4'b0;
					status <= `M3;
				end
				else begin
					hex_cnt <= 4'b0;
					status <= `S0;
				end
			end
			
			`M2: begin // ^ time @ pc : [space] * addr [space]
				if (char == "^") begin
					status <= `S1;
				end
				else if (char == " ") begin
					status <= `M2;
				end
				else if (char == "<") begin
					status <= `M3;
				end
				else begin
					status <= `S0;
				end
			end
			
			`M3: begin // ^ time @ pc : [space] * addr [space] < 
				if (char == "^") begin
					status <= `S1;
				end
				else if (char == "=") begin
					status <= `M4;
				end
				else begin
					status <= `S0;
				end
			end
			
			`M4: begin // ^ time @ pc : [space] * addr [space] <= [space]
				if (char == "^") begin
					hex_cnt <= 4'b0;
					status <= `S1;
				end
				else if (char == " ") begin
					hex_cnt <= 4'b0;
					status <= `M4;
				end
				else if (((char >= "0" && char <= "9") || (char >= "a" && char <= "f")) && hex_cnt < 4'b1000) begin
					hex_cnt <= hex_cnt + 1;
					status <= `M5;
				end
				else begin
					hex_cnt <= 4'b0;
					status <= `S0;
				end
			end
			
			`M5: begin 
				if (char == "^") begin
					hex_cnt <= 4'b0;
					status <= `S1;
				end
				else if (((char >= "0" && char <= "9") || (char >= "a" && char <= "f")) && hex_cnt < 4'b1000) begin
					hex_cnt <= hex_cnt + 1;
					status <= `M5;
				end
				else if (char == "#" && hex_cnt == 4'b1000) begin//等于
					hex_cnt <= 4'b0;
					status <= `M6;
				end
				else begin
					hex_cnt <= 4'b0;
					status <= `S0;
				end
			end
			
			`M6: begin //output
				if (char == "^") begin
					status <= `S1;
				end
				else begin
					status <= `S0;
				end
			end
		endcase
		end
	 end
	
	assign format_type = (status == `R6) ? `R : (status == `M6) ? `M : `W;

endmodule
