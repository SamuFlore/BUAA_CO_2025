`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:05 12/02/2025 
// Design Name: 
// Module Name:    CP0 
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

module CP0(
    input wire clk,
    input wire reset,
    input wire enable, // write enable
    input wire [4:0] CP0_addr, // write addr
    input wire [31:0] CP0_in, // write data
    input wire [31:0] VPC, // addr of the instrument when trap, "victim"
    input wire BD_in, // is the instrument in the delaying slot or not
    input wire [4:0] ExcCode_in, // internal exception type, if exception happened then trap
    input wire [5:0] HWInt, // external interrupt signal
    input wire EXL_clr, // clear SR_EXL, back to origin
    output wire [31:0] CP0_out, // read data
    output wire [31:0] EPC_out, // for NPC
    output wire Req
    );

    // 5'b01100, No.12
    reg [31:0] SR; // state register, 
    // 5'b01101, No.13
    reg [31:0] Cause; // 
    // 5'b01110, No.14
    reg [31:0] EPC; // Cause_BD = 0: addr of the instrument when trap, Cause_BD = 1: previous addr of the instrument when trap
    // 5'b01111, No.15
    reg [31:0] PRId; // id of my CPU

    assign Req = (!`SR_EXL && ((`SR_IE && (`SR_IM & HWInt)) || ExcCode_in));

    assign EPC_out = EPC;

    always@(posedge clk) begin
        if (reset == 1) begin
            SR <= 32'h0;
            Cause <= 32'h0;
            EPC <= 32'h0;
            PRId <= 32'h10270906;
        end
        else begin
            if (Req == 1) begin
                `SR_EXL <= 1; // trap
                `Cause_BD <= BD_in;
                `Cause_ExcCode <= (!`SR_EXL && `SR_IE && (`SR_IM & HWInt)) ? 5'b00000 : ExcCode_in; // external interrupt: 5'b00000, or internal exception code
                EPC <= (BD_in == 1'b1) ? (VPC - 32'h00000004) : VPC;
            end
            
            if (EXL_clr == 1) begin
                `SR_EXL <= 1'b0; // back to origin
            end
            `Cause_IP <= HWInt; // update every time cycle

            // write register /////////////////////////////////////

            if (enable == 1 && Req == 0) begin
                if (CP0_addr == 5'b01100) begin
                    SR <= CP0_in;
                end
                else if (CP0_addr == 5'b01110) begin
                    EPC <= CP0_in;
                end
            end
        end
    end

    assign CP0_out = (CP0_addr == 5'b01100) ? SR :
                     (CP0_addr == 5'b01101) ? Cause :
                     (CP0_addr == 5'b01110) ? EPC :
                     (CP0_addr == 5'b01111) ? PRId : 
                                              32'h0;


endmodule
