// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Tue Feb 11 02:25:48 2020
// Host        : DESKTOP-AO3CL7T running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/Xilinx/workspace/PYNQ_Z2/project_LCD/project_LCD.srcs/sources_1/bd/BRAM_RGB/ip/BRAM_RGB_blk_mem_gen_0_0/BRAM_RGB_blk_mem_gen_0_0_stub.v
// Design      : BRAM_RGB_blk_mem_gen_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *)
module BRAM_RGB_blk_mem_gen_0_0(clka, wea, addra, dina, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[16:0],dina[7:0],douta[7:0]" */;
  input clka;
  input [0:0]wea;
  input [16:0]addra;
  input [7:0]dina;
  output [7:0]douta;
endmodule
