vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/blk_mem_gen_v8_4_2

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm
vmap blk_mem_gen_v8_4_2 modelsim_lib/msim/blk_mem_gen_v8_4_2

vlog -work xil_defaultlib -64 -incr -sv \
"E:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93 \
"E:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work blk_mem_gen_v8_4_2 -64 -incr \
"../../../../project_LCD.srcs/sources_1/bd/BRAM_RGB/ipshared/37c2/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../bd/BRAM_RGB/ip/BRAM_RGB_blk_mem_gen_0_0/sim/BRAM_RGB_blk_mem_gen_0_0.v" \
"../../../bd/BRAM_RGB/ip/BRAM_RGB_blk_mem_gen_R_0/sim/BRAM_RGB_blk_mem_gen_R_0.v" \
"../../../bd/BRAM_RGB/ip/BRAM_RGB_blk_mem_gen_R_1/sim/BRAM_RGB_blk_mem_gen_R_1.v" \
"../../../bd/BRAM_RGB/sim/BRAM_RGB.v" \

vlog -work xil_defaultlib \
"glbl.v"

