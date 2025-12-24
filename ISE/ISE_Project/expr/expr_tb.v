`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:00:44 10/15/2025
// Design Name:   expr
// Module Name:   E:/CO/ISE/ISE_Project/expr/expr_tb.v
// Project Name:  expr
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: expr
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module expr_tb;

	// Inputs
	reg clk;
	reg clr;
	reg [7:0] in;

	// Outputs
	wire out;
	wire [4:0] status;
	// Instantiate the Unit Under Test (UUT)
	expr uut (
		.clk(clk), 
		.clr(clr), 
		.in(in), 
		.out(out),
		.status(status)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		clr = 1;
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		clr = 0;
		in = "1";
		#10 in = "+";
		#10 in = "2";
		#10 in = "*";
		#10 in = "3";
	end
      
	always begin
		#5 clk = ~clk;
	end
endmodule

