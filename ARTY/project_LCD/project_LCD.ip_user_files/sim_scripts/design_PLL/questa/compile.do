vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm

vlog -work xil_defaultlib -64 -sv "+incdir+../../../../project_LCD.srcs/sources_1/bd/design_PLL/ipshared/85a3" \
"E:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93 \
"E:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../project_LCD.srcs/sources_1/bd/design_PLL/ipshared/85a3" \
"../../../bd/design_PLL/ip/design_PLL_clk_wiz_0_0/design_PLL_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/design_PLL/ip/design_PLL_clk_wiz_0_0/design_PLL_clk_wiz_0_0.v" \
"../../../bd/design_PLL/sim/design_PLL.v" \

vlog -work xil_defaultlib \
"glbl.v"

