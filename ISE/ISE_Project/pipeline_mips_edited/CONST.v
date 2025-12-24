`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:27:45 11/20/2025 
// Design Name: 
// Module Name:    CONST 
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
`define ADD 6'b000000
`define SUB 6'b000001
`define ORI 6'b000010
`define SW 6'b000011
`define SH 6'b000100
`define SB 6'b000101
`define LW 6'b000110
`define LH 6'b000111
`define LB 6'b001000
`define AND 6'b001001
`define OR 6'b001010
`define J 6'b001011
`define JAL 6'b001100
`define JALR 6'b001101
`define JR 6'b001110
`define BEQ 6'b001111
`define BNE 6'b010000
`define ADDI 6'b010001
`define LUI 6'b010010
`define SLL 6'b010011
`define BGTZL 6'b010100 // ignore this
`define MTHI 6'b010101
`define MFHI 6'b010110
`define MTLO 6'b010111
`define MFLO 6'b011000
`define MULT 6'b011001
`define MULTU 6'b011010
`define DIV 6'b011011
`define DIVU 6'b011100
`define SLT 6'b011101
`define SLTU 6'b011110
`define ANDI 6'b011111
`define MADD 6'b100000
