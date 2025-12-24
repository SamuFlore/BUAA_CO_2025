`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:53:34 11/05/2025 
// Design Name: 
// Module Name:    IM 
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
`default_nettype none
module IM(
	input wire [31:0] addr,
	output wire [31:0] instr
    );
	 
	 wire [31:0] instr_index;
	 
	 reg [31:0] ROM [0:4095]; // 4096*32 bit ROM
	 
	 initial begin
		$readmemh("code.txt", ROM, 0, 4095);
	 end
	 
	 assign instr_index = ((addr - 32'h00003000) >> 2);
	 
	 assign instr = ROM[instr_index];

endmodule
