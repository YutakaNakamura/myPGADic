//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Mon Feb 10 22:16:47 2020
//Host        : DESKTOP-AO3CL7T running 64-bit major release  (build 9200)
//Command     : generate_target design_PLL_wrapper.bd
//Design      : design_PLL_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_PLL_wrapper
   (clk_out1_0,
    locked_0,
    reset,
    sys_clock);
  output clk_out1_0;
  output locked_0;
  input reset;
  input sys_clock;

  wire clk_out1_0;
  wire locked_0;
  wire reset;
  wire sys_clock;

  design_PLL design_PLL_i
       (.clk_out1_0(clk_out1_0),
        .locked_0(locked_0),
        .reset(reset),
        .sys_clock(sys_clock));
endmodule
