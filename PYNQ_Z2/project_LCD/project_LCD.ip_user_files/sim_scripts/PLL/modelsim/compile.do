vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm

vlog -work xil_defaultlib -64 -incr -sv "+incdir+../../../../project_LCD.srcs/sources_1/bd/design_PLL/ipshared/85a3" "+incdir+../../../../project_LCD.srcs/sources_1/bd/PLL/ipshared/85a3" \
"E:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"E:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../project_LCD.srcs/sources_1/bd/design_PLL/ipshared/85a3" "+incdir+../../../../project_LCD.srcs/sources_1/bd/PLL/ipshared/85a3" \
"../../../bd/PLL/ip/PLL_clk_wiz_0_0/PLL_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/PLL/ip/PLL_clk_wiz_0_0/PLL_clk_wiz_0_0.v" \
"../../../bd/PLL/sim/PLL.v" \

vlog -work xil_defaultlib \
"glbl.v"

