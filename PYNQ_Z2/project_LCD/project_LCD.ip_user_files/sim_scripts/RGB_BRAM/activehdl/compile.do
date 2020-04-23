vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/blk_mem_gen_v8_4_2

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap blk_mem_gen_v8_4_2 activehdl/blk_mem_gen_v8_4_2

vlog -work xil_defaultlib  -sv2k12 \
"E:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"E:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"E:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work blk_mem_gen_v8_4_2  -v2k5 \
"../../../../project_LCD.srcs/sources_1/bd/RGB_BRAM/ipshared/37c2/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/RGB_BRAM/ip/RGB_BRAM_blk_mem_gen_0_0/sim/RGB_BRAM_blk_mem_gen_0_0.v" \
"../../../bd/RGB_BRAM/ip/RGB_BRAM_blk_mem_gen_R_0/sim/RGB_BRAM_blk_mem_gen_R_0.v" \
"../../../bd/RGB_BRAM/ip/RGB_BRAM_blk_mem_gen_R1_0/sim/RGB_BRAM_blk_mem_gen_R1_0.v" \
"../../../bd/RGB_BRAM/sim/RGB_BRAM.v" \

vlog -work xil_defaultlib \
"glbl.v"

