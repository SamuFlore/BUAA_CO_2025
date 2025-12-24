`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:24:15 12/04/2025 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input wire clk,                    // 时钟信号
    input wire reset,                  // 同步复位信号
    input wire interrupt,              // 外部中断信号
    output wire [31:0] macroscopic_pc, // 宏观 PC

    output wire [31:0] i_inst_addr,    // IM 读取地址（取指 PC）
    input  wire [31:0] i_inst_rdata,   // IM 读取数据

    output wire [31:0] m_data_addr,    // DM 读写地址
    input  wire [31:0] m_data_rdata,   // DM 读取数据
    output wire [31:0] m_data_wdata,   // DM 待写入数据
    output wire [3 :0] m_data_byteen,  // DM 字节使能信号

    output wire [31:0] m_int_addr,     // 中断发生器待写入地址
    output wire [3 :0] m_int_byteen,   // 中断发生器字节使能信号

    output wire [31:0] m_inst_addr,    // M 级 PC

    output wire w_grf_we,              // GRF 写使能信号
    output wire [4 :0] w_grf_addr,     // GRF 待写入寄存器编号
    output wire [31:0] w_grf_wdata,    // GRF 待写入数据
    output wire [31:0] w_inst_addr     // W 级 PC
);

    // CPU & Bridge //////////////////////////////////
    wire [31:0] CPU_macroscopic_pc;

    wire [31:0] CPU_i_inst_addr;
    wire [31:0] CPU_i_inst_rdata;

    wire [5:0] CPU_HWInt;

    wire [31:0] CPU_m_data_addr;
    wire [31:0] CPU_m_data_rdata;
    wire [31:0] CPU_m_data_wdata;
    wire [3:0] CPU_m_data_byteen;

    

    CPU CPU (
        .clk(clk),
        .reset(reset),

        .i_inst_addr(CPU_i_inst_addr),
        .i_inst_rdata(CPU_i_inst_rdata),

        .m_data_rdata(CPU_m_data_rdata),
        .m_data_addr(CPU_m_data_addr),
        .m_data_wdata(CPU_m_data_wdata),
        .m_data_byteen(CPU_m_data_byteen),

        // MIPS_TB
        .m_inst_addr(m_inst_addr),
        .w_grf_we(w_grf_we),
        .w_grf_addr(w_grf_addr),
        .w_grf_wdata(w_grf_wdata),
        .w_inst_addr(w_inst_addr),

        .macroscopic_pc(CPU_macroscopic_pc),
        .HWInt(CPU_HWInt)
    );

    Bridge BR (
        .CPU_i_inst_addr(CPU_i_inst_addr),
        .CPU_i_inst_rdata(CPU_i_inst_rdata),
        
        .CPU_macroscopic_pc(CPU_macroscopic_pc),
        .CPU_HWInt(CPU_HWInt),
        
        .CPU_m_data_addr(CPU_m_data_addr),
        .CPU_m_data_byteen(CPU_m_data_byteen),
        .CPU_m_data_wdata(CPU_m_data_wdata),
        .CPU_m_data_rdata(CPU_m_data_rdata),

        .MIPS_i_inst_addr(i_inst_addr),
        .MIPS_i_inst_rdata(i_inst_rdata),

        .MIPS_macroscopic_pc(macroscopic_pc),
        .MIPS_interrupt(interrupt),
        .MIPS_m_int_addr(m_int_addr),
        .MIPS_m_int_byteen(m_int_byteen),

        .MIPS_m_data_addr(m_data_addr),
        .MIPS_m_data_byteen(m_data_byteen),
        .MIPS_m_data_wdata(m_data_wdata),
        .MIPS_m_data_rdata(m_data_rdata),

        .T0_addr(T0_addr),
        .T0_WE(T0_WE),
        .T0_Din(T0_Din),
        .T0_Dout(T0_Dout),
        .T0_IRQ(T0_IRQ),

        .T1_addr(T1_addr),
        .T1_WE(T1_WE),
        .T1_Din(T1_Din),
        .T1_Dout(T1_Dout),
        .T1_IRQ(T1_IRQ)
    );

    // Timer 0 & Bridge
    wire [31:2] T0_addr;
    wire T0_WE;
    wire [31:0] T0_Din;
    wire [31:0] T0_Dout;
    wire T0_IRQ;

    TC T0 (
        .clk(clk),
        .reset(reset),
        .Addr(T0_addr),
        .WE(T0_WE),
        .Din(T0_Din),
        .Dout(T0_Dout),// o
        .IRQ(T0_IRQ) // o
    );

    // Timer 1 & Bridge
    wire [31:2] T1_addr;
    wire T1_WE;
    wire [31:0] T1_Din;
    wire [31:0] T1_Dout;
    wire T1_IRQ;

    TC T1 (
        .clk(clk),
        .reset(reset),
        .Addr(T1_addr),
        .WE(T1_WE),
        .Din(T1_Din),
        .Dout(T1_Dout),
        .IRQ(T1_IRQ)
    );

endmodule