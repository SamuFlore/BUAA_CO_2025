`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:08:35 11/26/2025 
// Design Name: 
// Module Name:    MDU 
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
`include "CONST.v"
module MDU(
    input wire clk,
    input wire reset,
    input wire [31:0] inputA,
    input wire [31:0] inputB,
    input wire [5:0] instr_type,
    input wire start,
    output wire [31:0] outputB, // if mflo or mfhi, use OutputB of MDU instead of OutputA of ALU
    output wire busy
    );

    reg [31:0] HI;
    reg [31:0] LO;
	 wire [64:0] temp_madd;

    reg [3:0] count;
	 
	 assign temp_madd = $signed({HI, LO}) + $signed($signed(inputA) * $signed(inputB));

    always@(posedge clk) begin
        if (reset == 1) begin
            HI <= 32'h0;
            LO <= 32'h0;
            count <= 4'h0;
        end
        else begin
            case (instr_type)
                `MTHI: begin
                    HI <= inputA;
                end
                `MTLO: begin
                    LO <= inputA;
                end
                `MULT: begin
                    {HI, LO} <= $signed(inputA) * $signed(inputB);
                end
                `MULTU: begin
                    {HI, LO} <= inputA * inputB;
                end
                `DIV: begin
                    if (inputB != 32'h0) begin
                        HI <= $signed(inputA) % $signed(inputB);
                        LO <= $signed(inputA) / $signed(inputB);
                    end
                end
                `DIVU: begin
                    if (inputB != 32'h0) begin
                        HI <= inputA % inputB;
                        LO <= inputA / inputB;
                    end
                end 
					 `MADD: begin
							HI <= temp_madd[63:32];
							LO <= temp_madd[31:0];
					 end
            endcase
        end

        if (start == 1) begin
            if (instr_type == `MULT || instr_type == `MULTU || instr_type == `MADD) begin
                count <= 4'h5;
            end
            else if (instr_type == `DIV || instr_type == `DIVU) begin
                count <= 4'ha;
            end
        end

        if (count != 4'h0) begin
            count <= count - 1;
        end
    end

    assign outputB = (instr_type == `MFHI) ? HI :
                     (instr_type == `MFLO) ? LO :
                                             32'h0;
    
    assign busy = (count != 4'h0) ? 1 : 0;
 

endmodule
