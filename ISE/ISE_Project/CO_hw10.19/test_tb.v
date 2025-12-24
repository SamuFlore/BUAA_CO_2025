`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:50:08 10/19/2025
// Design Name:   test
// Module Name:   E:/CO/ISE/ISE_Project/CO_hw10.19/test_tb.v
// Project Name:  CO_hw10.19
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: test
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_tb;

	// Inputs
	reg clk;

	// Outputs
	wire c;

	// Instantiate the Unit Under Test (UUT)
	test uut (
		.clk(clk), 
		.c(c)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
        
		// Add stimulus here

	end
	
	always #5 clk = ~clk;
      
endmodule

