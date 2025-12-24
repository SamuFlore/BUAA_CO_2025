`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:07:36 10/20/2025
// Design Name:   json
// Module Name:   E:/CO/ISE/ISE_Project/json/json_tb.v
// Project Name:  json
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: json
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module json_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] char;

	// Outputs
	wire [7:0] cur_num;
	wire [7:0] max_num;
	wire [9:0] status;
	// Instantiate the Unit Under Test (UUT)
	json uut (
		.clk(clk), 
		.reset(reset), 
		.char(char), 
		.cur_num(cur_num), 
		.max_num(max_num),
		.status(status)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		char = 0;
		#10;
		reset = 0;
		char = "{";
		#10;
		char = "}";
		#10;
		char = "{";
		#10;
		char = 8'h22;
		#10;
		char = "k";
		#10;
		char = 8'h22;
		#10;
		char = ":";
		#10;
		char = 8'h22;
		#10;
		char = "v";
		#10;
		char = 8'h22;
		#10;
		char = "}";
		#10;
		reset = 1; //
		#10;
		reset = 0; //
		char = "{";
		#10;
		char = 8'h22;
		#10;
		char = "k";
		#10;
		char = 8'h22;
		#10;
		char = ":";
		#10;
		char = 8'h22;
		#10;
		char = "v";
		#10;
		char = 8'h22;
		#10;
		char = ",";
		#10;
		char = 8'h22;
		#10;
		char = "k";
		#10;
		char = 8'h22;
		#10;
		char = ":";
		#10;
		char = 8'h22;
		#10;
		char = "v";
		#10;
		char = 8'h22;
		#10;
		char = "}";
		#10;
		char = "{";
		#10;
		char = 8'h22;
		#10;
		char = "k";
		#10;
		char = 8'h22;
		#10;
		char = ":";
		#10;
		char = 8'h22;
		#10;
		char = "v";
		#10;
		char = 8'h22;
		#10;
		char = ",";
		#10;
		char = 8'h22;
		#10;
		char = "k";
		#10;
		char = 8'h22;
		#10;
		char = ":";
		#10;
		char = 8'h22;
		#10;
		char = "v";
		#10;
		char = 8'h22;
		#10;
		char = ",";
		#10;
		char = 8'h22;
		#10;
		char = "k";
		#10;
		char = 8'h22;
		#10;
		char = ":";
		#10;
		char = 8'h22;
		#10;
		char = "v";
		#10;
		char = 8'h22;
		#10;
		char = ",";
		#10;
		char = 8'h22;
		#10;
		char = "k";
		#10;
		char = 8'h22;
		#10;
		char = ":";
		#10;
		char = 8'h22;
		#10;
		char = "v";
		#10;
		char = 8'h22;
		#10;
		char = "}";
		#10;
		char = "{";
		#10;
		char = 8'h22;
		#10;
		char = 8'h22;
		#10;
		char = ":";
		#10;
		char = 8'h22;
		#10;
		char = "v";
		#10;
		char = 8'h22;
		#10;
		char = ",";
		#10;
		char = 8'h22;
		#10;
		char = "k";
		#10;
		char = 8'h22;
		#10;
		char = ":";
		#10;
		char = 8'h22;
		#10;
		char = "v";
		#10;
		char = 8'h22;
		#10;
		char = ",";
		#10;
		char = 8'h22;
		#10;
		char = "k";
		#10;
		char = 8'h22;
		#10;
		char = ":";
		#10;
		char = 8'h22;
		#10;
		char = "v";
		#10;
		char = 8'h22;
		#10;
		char = ",";
		#10;
		char = 8'h22;
		#10;
		char = "k";
		#10;
		char = 8'h22;
		#10;
		char = ":";
		#10;
		char = 8'h22;
		#10;
		char = "v";
		#10;
		char = 8'h22;
		#10;
		char = "}";
		#10;
		char = "{";
		#10
		char = "}";
	end
	
	always #5 clk = ~clk;
      
endmodule

