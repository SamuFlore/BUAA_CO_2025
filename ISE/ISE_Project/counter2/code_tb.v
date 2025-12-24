`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:52:14 09/15/2025
// Design Name:   code
// Module Name:   E:/CO/ISE/ISE_Project/counter2/code_tb.v
// Project Name:  counter2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: code
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module code_tb;

	// Inputs
	reg Clk;
	reg Reset;
	reg Slt;
	reg En;

	// Outputs
	wire [63:0] Output0;
	wire [63:0] Output1;

	// Instantiate the Unit Under Test (UUT)
	code uut (
		.Clk(Clk), 
		.Reset(Reset), 
		.Slt(Slt), 
		.En(En), 
		.Output0(Output0), 
		.Output1(Output1)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		Reset = 1;
		Slt = 0;
		En = 0;

		#10;
		Reset <= 0;
		En <= 1;
		Slt <= 1;
        
		// Add stimulus here
		

	end
	
	always #5 Clk = ~Clk;
      
endmodule

