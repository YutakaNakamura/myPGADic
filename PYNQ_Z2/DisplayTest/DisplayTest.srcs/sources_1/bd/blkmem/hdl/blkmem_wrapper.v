//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Sun Jan 26 19:46:49 2020
//Host        : DESKTOP-AO3CL7T running 64-bit major release  (build 9200)
//Command     : generate_target blkmem_wrapper.bd
//Design      : blkmem_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module blkmem_wrapper
   (BRAM_PORTA_0_addr,
    BRAM_PORTA_0_clk,
    BRAM_PORTA_0_din,
    BRAM_PORTA_0_we,
    BRAM_PORTB_0_addr,
    BRAM_PORTB_0_clk,
    BRAM_PORTB_0_dout,
    BRAM_PORTB_0_en);
  input [15:0]BRAM_PORTA_0_addr;
  input BRAM_PORTA_0_clk;
  input [11:0]BRAM_PORTA_0_din;
  input [0:0]BRAM_PORTA_0_we;
  input [15:0]BRAM_PORTB_0_addr;
  input BRAM_PORTB_0_clk;
  output [11:0]BRAM_PORTB_0_dout;
  input BRAM_PORTB_0_en;

  wire [15:0]BRAM_PORTA_0_addr;
  wire BRAM_PORTA_0_clk;
  wire [11:0]BRAM_PORTA_0_din;
  wire [0:0]BRAM_PORTA_0_we;
  wire [15:0]BRAM_PORTB_0_addr;
  wire BRAM_PORTB_0_clk;
  wire [11:0]BRAM_PORTB_0_dout;
  wire BRAM_PORTB_0_en;

  blkmem blkmem_i
       (.BRAM_PORTA_0_addr(BRAM_PORTA_0_addr),
        .BRAM_PORTA_0_clk(BRAM_PORTA_0_clk),
        .BRAM_PORTA_0_din(BRAM_PORTA_0_din),
        .BRAM_PORTA_0_we(BRAM_PORTA_0_we),
        .BRAM_PORTB_0_addr(BRAM_PORTB_0_addr),
        .BRAM_PORTB_0_clk(BRAM_PORTB_0_clk),
        .BRAM_PORTB_0_dout(BRAM_PORTB_0_dout),
        .BRAM_PORTB_0_en(BRAM_PORTB_0_en));
endmodule
