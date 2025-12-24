`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:17:58 09/15/2025 
// Design Name: 
// Module Name:    id_fsm 
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
//////////////////////////////////////////////////////////////////////////////////`define S0 2'b00//invalid
`define S0 2'b00//invalid
`define S1 2'b01//letter
`define S2 2'b10//letter + num


module id_fsm(
	input [7:0] char,
	input clk,
	output out
    );
	reg [1:0] status;
	
	initial begin
		status <= `S0;
	end
	
	always@(posedge clk) begin
		if (status == `S0) begin
			if ((char >= 8'b01000001 && char <= 8'b01011010) || (char >= 8'b01100001 && char <= 8'b01111010)) begin
				status <= `S1;//invalid to letter
			end
			else begin
				status <= `S0;//keep
			end
		end
		else if (status == `S1) begin
			if ((char >= 8'b01000001 && char <= 8'b01011010) || (char >= 8'b01100001 && char <= 8'b01111010)) begin
				status <= `S1;//keep
			end
			else if (char >= 8'b00110000 && char <= 8'b00111001) begin
				status <= `S2;//letter to letter + num
			end
			else begin
				status <= `S0;
			end
		end
		else if (status <= `S2) begin
			if (char >= 8'b00110000 && char <= 8'b00111001) begin
				status <= `S2;//keep
			end
			else if ((char >= 8'b01000001 && char <= 8'b01011010) || (char >= 8'b01100001 && char <= 8'b01111010)) begin
				status <= `S1;//letter + num to letter
			end
			else begin
				status <= `S0;//letter + num to invalid
			end
		end
		else begin
			status <= status;
		end
	end
	
	assign out = (status == `S2) ? 1 : 0;
	
endmodule
