//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Tue Feb 11 01:43:12 2020
//Host        : DESKTOP-AO3CL7T running 64-bit major release  (build 9200)
//Command     : generate_target RGB_BRAM_wrapper.bd
//Design      : RGB_BRAM_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module RGB_BRAM_wrapper
   (BRAM_PORTA_B_addr,
    BRAM_PORTA_B_clk,
    BRAM_PORTA_B_din,
    BRAM_PORTA_B_dout,
    BRAM_PORTA_B_we,
    BRAM_PORTA_G_addr,
    BRAM_PORTA_G_clk,
    BRAM_PORTA_G_din,
    BRAM_PORTA_G_dout,
    BRAM_PORTA_G_we,
    BRAM_PORTA_R_addr,
    BRAM_PORTA_R_clk,
    BRAM_PORTA_R_din,
    BRAM_PORTA_R_dout,
    BRAM_PORTA_R_we);
  input [16:0]BRAM_PORTA_B_addr;
  input BRAM_PORTA_B_clk;
  input [7:0]BRAM_PORTA_B_din;
  output [7:0]BRAM_PORTA_B_dout;
  input [0:0]BRAM_PORTA_B_we;
  input [16:0]BRAM_PORTA_G_addr;
  input BRAM_PORTA_G_clk;
  input [7:0]BRAM_PORTA_G_din;
  output [7:0]BRAM_PORTA_G_dout;
  input [0:0]BRAM_PORTA_G_we;
  input [16:0]BRAM_PORTA_R_addr;
  input BRAM_PORTA_R_clk;
  input [7:0]BRAM_PORTA_R_din;
  output [7:0]BRAM_PORTA_R_dout;
  input [0:0]BRAM_PORTA_R_we;

  wire [16:0]BRAM_PORTA_B_addr;
  wire BRAM_PORTA_B_clk;
  wire [7:0]BRAM_PORTA_B_din;
  wire [7:0]BRAM_PORTA_B_dout;
  wire [0:0]BRAM_PORTA_B_we;
  wire [16:0]BRAM_PORTA_G_addr;
  wire BRAM_PORTA_G_clk;
  wire [7:0]BRAM_PORTA_G_din;
  wire [7:0]BRAM_PORTA_G_dout;
  wire [0:0]BRAM_PORTA_G_we;
  wire [16:0]BRAM_PORTA_R_addr;
  wire BRAM_PORTA_R_clk;
  wire [7:0]BRAM_PORTA_R_din;
  wire [7:0]BRAM_PORTA_R_dout;
  wire [0:0]BRAM_PORTA_R_we;

  RGB_BRAM RGB_BRAM_i
       (.BRAM_PORTA_B_addr(BRAM_PORTA_B_addr),
        .BRAM_PORTA_B_clk(BRAM_PORTA_B_clk),
        .BRAM_PORTA_B_din(BRAM_PORTA_B_din),
        .BRAM_PORTA_B_dout(BRAM_PORTA_B_dout),
        .BRAM_PORTA_B_we(BRAM_PORTA_B_we),
        .BRAM_PORTA_G_addr(BRAM_PORTA_G_addr),
        .BRAM_PORTA_G_clk(BRAM_PORTA_G_clk),
        .BRAM_PORTA_G_din(BRAM_PORTA_G_din),
        .BRAM_PORTA_G_dout(BRAM_PORTA_G_dout),
        .BRAM_PORTA_G_we(BRAM_PORTA_G_we),
        .BRAM_PORTA_R_addr(BRAM_PORTA_R_addr),
        .BRAM_PORTA_R_clk(BRAM_PORTA_R_clk),
        .BRAM_PORTA_R_din(BRAM_PORTA_R_din),
        .BRAM_PORTA_R_dout(BRAM_PORTA_R_dout),
        .BRAM_PORTA_R_we(BRAM_PORTA_R_we));
endmodule
