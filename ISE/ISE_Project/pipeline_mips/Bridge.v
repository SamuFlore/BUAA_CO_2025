`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:08:02 12/04/2025 
// Design Name: 
// Module Name:    Bridge 
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
module Bridge(
    // CPU ////////////////////////////
    input wire [31:0] CPU_i_inst_addr, // CPU -> Bridge -> MIPS -> TB
    output wire [31:0] CPU_i_inst_rdata,
    
    input wire [31:0] CPU_macroscopic_pc,
    output wire [5:0] CPU_HWInt,
    
    input wire [31:0] CPU_m_data_addr,
    input wire [3:0] CPU_m_data_byteen,
    input wire [31:0] CPU_m_data_wdata,
    output wire [31:0] CPU_m_data_rdata, // TB -> MIPS -> Bridge -> CPU

    //  MIPS //////////////////////////
    input wire [31:0] MIPS_i_inst_rdata, // TB -> MIPS -> Bridge -> CPU
    output wire [31:0] MIPS_i_inst_addr,

    output wire [31:0] MIPS_macroscopic_pc, // CPU -> Bridge -> MIPS -> TB
    input wire MIPS_interrupt,
    output wire [31:0] MIPS_m_int_addr,
    output wire [3:0] MIPS_m_int_byteen,

    output wire [31:0] MIPS_m_data_addr,
    output wire [3:0] MIPS_m_data_byteen,
    output wire [31:0] MIPS_m_data_wdata,
    input wire [31:0] MIPS_m_data_rdata,

    // Timer 0 ///////////////////////
    output wire [31:2] T0_addr, // CPU -> Bridge -> MIPS -> Timer 0
    output wire T0_WE,
    output wire [31:0] T0_Din,
    input wire [31:0] T0_Dout,
    input wire T0_IRQ,

    // Timer 1 ///////////////////////
    output wire [31:2] T1_addr,
    output wire T1_WE,
    output wire [31:0] T1_Din,
    input wire [31:0] T1_Dout,
    input wire T1_IRQ
    );

    // address range sel
    // (DM) 0x00000000 ~ 0x00002fff, (Timer 0) 0x00007f00 ~ 0x00007f0b, (Timer 1) 0x00007f10 ~ 0x00007f1b, (Interrupt Generator) 0x00007f20 ~ 0x00007f23
    wire DM;
    wire T0;
    wire T1;
    wire IG;
    assign DM = (CPU_m_data_addr >= 32'h0 && CPU_m_data_addr < 32'h00003000) ? 1 : 0;
    assign T0 = (CPU_m_data_addr >= 32'h00007f00 && CPU_m_data_addr < 32'h00007f0c) ? 1 : 0;
    assign T1 = (CPU_m_data_addr >= 32'h00007f10 && CPU_m_data_addr < 32'h00007f1c) ? 1 : 0;
    assign IG = (CPU_m_data_addr >= 32'h00007f20 && CPU_m_data_addr < 32'h00007f24) ? 1 : 0;

    // HWInt //
    assign CPU_HWInt = {3'b0, MIPS_interrupt, T1_IRQ, T0_IRQ};

    // IM //
    assign MIPS_i_inst_addr = CPU_i_inst_addr;
    assign CPU_i_inst_rdata = MIPS_i_inst_rdata;

    // Macro PC //
    assign MIPS_macroscopic_pc = CPU_macroscopic_pc;

    // interrupt //
    assign MIPS_m_int_addr = CPU_m_data_addr;
    assign MIPS_m_int_byteen = (DM) ? 4'h0 :
                               (T0) ? 4'h0 :
                               (T1) ? 4'h0 :
                               (IG) ? CPU_m_data_byteen :
                                      4'h0;
    assign MIPS_m_data_addr = CPU_m_data_addr;
    assign MIPS_m_data_byteen = (DM) ? CPU_m_data_byteen :
                                (T0) ? 4'h0 :
                                (T1) ? 4'h0 :
                                (IG) ? 4'h0 :
                                       4'h0;
    
    assign MIPS_m_data_wdata = CPU_m_data_wdata;

    
    // Timer 0
    assign T0_addr = CPU_m_data_addr[31:2];
    assign T0_WE = (DM) ? 1'b0 :
                   (T0) ? (&CPU_m_data_byteen) :
                   (T1) ? 1'b0 :
                   (IG) ? 1'b0 :
                          1'b0;
    assign T0_Din = CPU_m_data_wdata;

    // Timer 1
    assign T1_addr = CPU_m_data_addr[31:2];
    assign T1_WE = (DM) ? 1'b0 :
                   (T0) ? 1'b0 :
                   (T1) ? (&CPU_m_data_byteen) :
                   (IG) ? 1'b0 :
                          1'b0;
    assign T1_Din = CPU_m_data_wdata;

    

    assign CPU_m_data_rdata = (DM) ? MIPS_m_data_rdata :
                              (T0) ? T0_Dout :
                              (T1) ? T1_Dout :
                              (IG) ? 32'h0 :
                                     32'h0;

endmodule
