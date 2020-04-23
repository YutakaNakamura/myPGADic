vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/blk_mem_gen_v8_4_2

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap blk_mem_gen_v8_4_2 riviera/blk_mem_gen_v8_4_2

vlog -work xil_defaultlib  -sv2k12 \
"E:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"E:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work blk_mem_gen_v8_4_2  -v2k5 \
"../../../../project_LCD.srcs/sources_1/bd/BRAM_RGB/ipshared/37c2/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/BRAM_RGB/ip/BRAM_RGB_blk_mem_gen_0_0/sim/BRAM_RGB_blk_mem_gen_0_0.v" \
"../../../bd/BRAM_RGB/ip/BRAM_RGB_blk_mem_gen_R_0/sim/BRAM_RGB_blk_mem_gen_R_0.v" \
"../../../bd/BRAM_RGB/ip/BRAM_RGB_blk_mem_gen_R_1/sim/BRAM_RGB_blk_mem_gen_R_1.v" \
"../../../bd/BRAM_RGB/sim/BRAM_RGB.v" \

vlog -work xil_defaultlib \
"glbl.v"

