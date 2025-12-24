`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:13:31 10/20/2025 
// Design Name: 
// Module Name:    json 
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
`define S0 10'b0000000001
`define S1 10'b0000000010
`define S2 10'b0000000100
`define S3 10'b0000001000
`define S4 10'b0000010000
`define S5 10'b0000100000
`define S6 10'b0001000000
`define S7 10'b0010000000
`define S8 10'b0100000000
`define S9 10'b1000000000


module json(
    input clk,
    input reset,
    input [7:0] char,
    output reg [7:0] cur_num,
    output reg [7:0] max_num,
	 output reg [9:0] status
    );
	 
	 reg [7:0] tmp_num;
	 reg [7:0] tmp_max;
	 reg isInvalid;
	 
	 initial begin
		status <= `S0;
		cur_num <= 0;
		max_num <= 0;
		tmp_num <= 0;
		tmp_max <= 0;
		isInvalid <= 0;
	 end
	 
	 always@(posedge clk or posedge reset) begin
		if (reset == 1) begin
			status <= `S0;
			cur_num <= 0;
			max_num <= 0;
			tmp_num <= 0;
			tmp_max <= 0;
			isInvalid <= 0;
		end
		else begin
			case (status)
				`S0: begin
					if (char == "{") status <= `S1;
					else status <= `S0;
				end
				`S1: begin
					if (char == 8'h22) status <= `S2;
					else if (char == "}") begin
						isInvalid <= 1;
						cur_num <= 0;
						status <= `S9;
					end
					else status <= `S0;
				end
				`S2: begin
					if (char == 8'h22) begin
						status <= `S4;
						isInvalid <= 1;
					end
					else if ((char >= "a" && char <= "z") || (char >= "A" && char <= "Z") || (char >= "0" && char <= "9")) begin
						status <= `S3;
					end
					else status <= `S0;
				end
				`S3: begin
					if ((char >= "a" && char <= "z") || (char >= "A" && char <= "Z") || (char >= "0" && char <= "9")) begin
						status <= `S3;
					end
					else if (char == 8'h22) status <= `S4;
					else status <= `S0;
				end
				`S4: begin
					if (char == ":") status <= `S5;
					else status <= `S0;
				end
				`S5: begin
					if (char == 8'h22) status <= `S6;
					else status <= `S0;
				end
				`S6: begin
					if (char == 8'h22) begin 
						status <= `S8;
						isInvalid <= 1;
					end
					else if ((char >= "a" && char <= "z") || (char >= "A" && char <= "Z") || (char >= "0" && char <= "9")) begin
						status <= `S7;
					end
					else status <= `S0;
				end
				`S7: begin
					if ((char >= "a" && char <= "z") || (char >= "A" && char <= "Z") || (char >= "0" && char <= "9")) begin
						status <= `S7;
					end
					else if (char == 8'h22) begin 
						if (!isInvalid) tmp_num <= tmp_num + 1;
						else tmp_num <= 0;
						if (!isInvalid && (tmp_num + 1 > tmp_max)) tmp_max <= tmp_num + 1;
						status <= `S8;
					end
				end
				`S8: begin
					if (char == "}") begin 
						cur_num <= tmp_num;
						max_num <= tmp_max;
						status <= `S9;
					end
					else if (char == ",") status <= `S1;
					else status <= `S0;
				end
				`S9: begin
					if (char == " ") status <= `S9;
					else if (char == "{") begin 
						tmp_num <= 0;
						isInvalid <= 0;
						status <= `S1;
					end
					else status <= `S0;
				end
			endcase
		end
	 end
	
endmodule