-makelib xcelium_lib/xil_defaultlib -sv \
  "E:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "E:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "E:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_2 \
  "../../../../project_LCD.srcs/sources_1/bd/RGB_BRAM/ipshared/37c2/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/RGB_BRAM/ip/RGB_BRAM_blk_mem_gen_0_0/sim/RGB_BRAM_blk_mem_gen_0_0.v" \
  "../../../bd/RGB_BRAM/ip/RGB_BRAM_blk_mem_gen_R_0/sim/RGB_BRAM_blk_mem_gen_R_0.v" \
  "../../../bd/RGB_BRAM/ip/RGB_BRAM_blk_mem_gen_R1_0/sim/RGB_BRAM_blk_mem_gen_R1_0.v" \
  "../../../bd/RGB_BRAM/sim/RGB_BRAM.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

