`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:23:03 10/21/2025
// Design Name:   note_recorder
// Module Name:   E:/CO/ISE/ISE_Project/note_recorder/note_recorder_tb.v
// Project Name:  note_recorder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: note_recorder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module note_recorder_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [2:0] note_in;
	reg [1:0] op;
	reg [6:0] query;

	// Outputs
	wire [2:0] note_out;
	wire [7:0] count;

	// Instantiate the Unit Under Test (UUT)
	note_recorder uut (
		.clk(clk), 
		.reset(reset), 
		.note_in(note_in), 
		.op(op), 
		.query(query), 
		.note_out(note_out), 
		.count(count)
	);

	initial begin
		// Initialize Inputs
		clk = 1;
		reset = 1;
		note_in = 0;
		op = 0;
		query = 0;
		#1;
		reset = 0;
		note_in = 1;
		#2;
		note_in = 2;
		#2;
		note_in = 3;
		#2;
		op = 2'b01;
		query = 127;
		#2;
		op = 2'b11;
		query = 0;
		

	end
      
	always #1 clk = ~clk;
endmodule

