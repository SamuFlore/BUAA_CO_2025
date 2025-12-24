`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:01:52 09/02/2025
// Design Name:   AndGate
// Module Name:   E:/CO/ISE/ISE_Project/counter/AndGate_tb.v
// Project Name:  counter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: AndGate
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module AndGate_tb;

	// Inputs
	reg clk;
	reg a;
	reg b;

	// Outputs
	wire c;

	// Instantiate the Unit Under Test (UUT)
	AndGate uut (
		.clk(clk), 
		.a(a), 
		.b(b), 
		.c(c)
	);

	initial begin
		// Initialize Inputs
		#0 clk = 0;
			a = 0;
			b = 0;
		#5 a = 1'b1;

		
	end
always #10 clk = ~clk;
      
endmodule

