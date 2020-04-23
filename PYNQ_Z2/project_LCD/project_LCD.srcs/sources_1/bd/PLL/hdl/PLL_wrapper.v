//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Tue Feb 11 01:36:47 2020
//Host        : DESKTOP-AO3CL7T running 64-bit major release  (build 9200)
//Command     : generate_target PLL_wrapper.bd
//Design      : PLL_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module PLL_wrapper
   (clk_out1_0,
    locked_0,
    reset_rtl,
    sys_clock);
  output clk_out1_0;
  output locked_0;
  input reset_rtl;
  input sys_clock;

  wire clk_out1_0;
  wire locked_0;
  wire reset_rtl;
  wire sys_clock;

  PLL PLL_i
       (.clk_out1_0(clk_out1_0),
        .locked_0(locked_0),
        .reset_rtl(reset_rtl),
        .sys_clock(sys_clock));
endmodule
