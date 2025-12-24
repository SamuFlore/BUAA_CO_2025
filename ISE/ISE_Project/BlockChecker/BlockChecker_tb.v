`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:37:49 10/19/2025
// Design Name:   BlockChecker
// Module Name:   E:/CO/ISE/ISE_Project/BlockChecker/BlockChecker_tb.v
// Project Name:  BlockChecker
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BlockChecker
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module BlockChecker_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] in;

	// Outputs
	wire result;

	// Instantiate the Unit Under Test (UUT)
	BlockChecker uut (
		.clk(clk), 
		.reset(reset), 
		.in(in), 
		.result(result)
	);
	
	reg [1023:0] S = "a beGin EnDcs eNd EEEE End";

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		 while(!S[1023:1016]) S = S << 8;

   for(; S[1023:1016]; S = S << 8) begin
      in = S[1023:1016];
      #10;
   end
	end
	
	always #5 clk = ~clk;
      
endmodule

