//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Tue Feb 11 00:26:30 2020
//Host        : DESKTOP-AO3CL7T running 64-bit major release  (build 9200)
//Command     : generate_target RGB_BRAM.bd
//Design      : RGB_BRAM
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "RGB_BRAM,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=RGB_BRAM,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "RGB_BRAM.hwdef" *) 
module RGB_BRAM
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
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA_B ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME BRAM_PORTA_B, MASTER_TYPE OTHER, MEM_ECC NONE, MEM_SIZE 8192, MEM_WIDTH 32, READ_LATENCY 1" *) input [16:0]BRAM_PORTA_B_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA_B CLK" *) input BRAM_PORTA_B_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA_B DIN" *) input [7:0]BRAM_PORTA_B_din;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA_B DOUT" *) output [7:0]BRAM_PORTA_B_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA_B WE" *) input [0:0]BRAM_PORTA_B_we;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA_G ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME BRAM_PORTA_G, MASTER_TYPE OTHER, MEM_ECC NONE, MEM_SIZE 8192, MEM_WIDTH 32, READ_LATENCY 1" *) input [16:0]BRAM_PORTA_G_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA_G CLK" *) input BRAM_PORTA_G_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA_G DIN" *) input [7:0]BRAM_PORTA_G_din;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA_G DOUT" *) output [7:0]BRAM_PORTA_G_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA_G WE" *) input [0:0]BRAM_PORTA_G_we;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA_R ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME BRAM_PORTA_R, MASTER_TYPE OTHER, MEM_ECC NONE, MEM_SIZE 8192, MEM_WIDTH 32, READ_LATENCY 1" *) input [16:0]BRAM_PORTA_R_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA_R CLK" *) input BRAM_PORTA_R_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA_R DIN" *) input [7:0]BRAM_PORTA_R_din;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA_R DOUT" *) output [7:0]BRAM_PORTA_R_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA_R WE" *) input [0:0]BRAM_PORTA_R_we;

  wire [16:0]BRAM_PORTA_0_1_ADDR;
  wire BRAM_PORTA_0_1_CLK;
  wire [7:0]BRAM_PORTA_0_1_DIN;
  wire [7:0]BRAM_PORTA_0_1_DOUT;
  wire [0:0]BRAM_PORTA_0_1_WE;
  wire [16:0]BRAM_PORTA_1_1_ADDR;
  wire BRAM_PORTA_1_1_CLK;
  wire [7:0]BRAM_PORTA_1_1_DIN;
  wire [7:0]BRAM_PORTA_1_1_DOUT;
  wire [0:0]BRAM_PORTA_1_1_WE;
  wire [16:0]BRAM_PORTA_2_1_ADDR;
  wire BRAM_PORTA_2_1_CLK;
  wire [7:0]BRAM_PORTA_2_1_DIN;
  wire [7:0]BRAM_PORTA_2_1_DOUT;
  wire [0:0]BRAM_PORTA_2_1_WE;

  assign BRAM_PORTA_0_1_ADDR = BRAM_PORTA_R_addr[16:0];
  assign BRAM_PORTA_0_1_CLK = BRAM_PORTA_R_clk;
  assign BRAM_PORTA_0_1_DIN = BRAM_PORTA_R_din[7:0];
  assign BRAM_PORTA_0_1_WE = BRAM_PORTA_R_we[0];
  assign BRAM_PORTA_1_1_ADDR = BRAM_PORTA_G_addr[16:0];
  assign BRAM_PORTA_1_1_CLK = BRAM_PORTA_G_clk;
  assign BRAM_PORTA_1_1_DIN = BRAM_PORTA_G_din[7:0];
  assign BRAM_PORTA_1_1_WE = BRAM_PORTA_G_we[0];
  assign BRAM_PORTA_2_1_ADDR = BRAM_PORTA_B_addr[16:0];
  assign BRAM_PORTA_2_1_CLK = BRAM_PORTA_B_clk;
  assign BRAM_PORTA_2_1_DIN = BRAM_PORTA_B_din[7:0];
  assign BRAM_PORTA_2_1_WE = BRAM_PORTA_B_we[0];
  assign BRAM_PORTA_B_dout[7:0] = BRAM_PORTA_2_1_DOUT;
  assign BRAM_PORTA_G_dout[7:0] = BRAM_PORTA_1_1_DOUT;
  assign BRAM_PORTA_R_dout[7:0] = BRAM_PORTA_0_1_DOUT;
  RGB_BRAM_blk_mem_gen_R1_0 blk_mem_gen_B
       (.addra(BRAM_PORTA_2_1_ADDR),
        .clka(BRAM_PORTA_2_1_CLK),
        .dina(BRAM_PORTA_2_1_DIN),
        .douta(BRAM_PORTA_2_1_DOUT),
        .wea(BRAM_PORTA_2_1_WE));
  RGB_BRAM_blk_mem_gen_R_0 blk_mem_gen_G
       (.addra(BRAM_PORTA_1_1_ADDR),
        .clka(BRAM_PORTA_1_1_CLK),
        .dina(BRAM_PORTA_1_1_DIN),
        .douta(BRAM_PORTA_1_1_DOUT),
        .wea(BRAM_PORTA_1_1_WE));
  RGB_BRAM_blk_mem_gen_0_0 blk_mem_gen_R
       (.addra(BRAM_PORTA_0_1_ADDR),
        .clka(BRAM_PORTA_0_1_CLK),
        .dina(BRAM_PORTA_0_1_DIN),
        .douta(BRAM_PORTA_0_1_DOUT),
        .wea(BRAM_PORTA_0_1_WE));
endmodule
