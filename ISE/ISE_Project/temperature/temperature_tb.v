`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:19:42 10/20/2025
// Design Name:   temperature
// Module Name:   E:/CO/ISE/ISE_Project/temperature/temperature_tb.v
// Project Name:  temperature
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: temperature
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module temperature_tb;

	// Inputs
	reg [7:0] in;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	temperature uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 8'b11011110;

		// Wait 100 ns for global reset to finish
		
		// Add stimulus here
	end
      
endmodule

