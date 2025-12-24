`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:55:17 09/10/2025
// Design Name:   ALU
// Module Name:   E:/CO/ISE/ISE_Project/ALU/ALU_tb.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

	// Inputs
	reg [3:0] inA;
	reg [3:0] inB;
	reg [1:0] op;

	// Outputs
	wire [3:0] ans;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.inA(inA), 
		.inB(inB), 
		.op(op), 
		.ans(ans)
	);

	initial begin
		// Initialize Inputs
		inA = 4'b0001;
		inB = 4'b0001;
		op = 2'b11;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

