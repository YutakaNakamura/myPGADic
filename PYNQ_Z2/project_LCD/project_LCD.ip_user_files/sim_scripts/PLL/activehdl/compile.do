vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../project_LCD.srcs/sources_1/bd/design_PLL/ipshared/85a3" "+incdir+../../../../project_LCD.srcs/sources_1/bd/PLL/ipshared/85a3" \
"E:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"E:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_LCD.srcs/sources_1/bd/design_PLL/ipshared/85a3" "+incdir+../../../../project_LCD.srcs/sources_1/bd/PLL/ipshared/85a3" \
"../../../bd/PLL/ip/PLL_clk_wiz_0_0/PLL_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/PLL/ip/PLL_clk_wiz_0_0/PLL_clk_wiz_0_0.v" \
"../../../bd/PLL/sim/PLL.v" \

vlog -work xil_defaultlib \
"glbl.v"

