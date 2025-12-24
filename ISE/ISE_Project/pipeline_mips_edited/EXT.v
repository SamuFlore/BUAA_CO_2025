`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:21:26 11/05/2025 
// Design Name: 
// Module Name:    EXT 
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
module EXT(
	input wire [15:0] imm16,
	input wire EXT_type,
	output wire [31:0] imm32
    );
	
	wire [31:0] zero_ext;
	wire [31:0] signed_ext;
	
	assign zero_ext = {16'b0, imm16};
	assign signed_ext = {{16{imm16[15]}}, imm16};
	
	assign imm32 = (EXT_type == 0) ? zero_ext :
									signed_ext;

endmodule
