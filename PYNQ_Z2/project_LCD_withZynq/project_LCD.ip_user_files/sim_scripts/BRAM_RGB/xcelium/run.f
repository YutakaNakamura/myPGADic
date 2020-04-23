-makelib xcelium_lib/xil_defaultlib -sv \
  "E:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "E:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_2 \
  "../../../../project_LCD.srcs/sources_1/bd/BRAM_RGB/ipshared/37c2/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/BRAM_RGB/ip/BRAM_RGB_blk_mem_gen_0_0/sim/BRAM_RGB_blk_mem_gen_0_0.v" \
  "../../../bd/BRAM_RGB/ip/BRAM_RGB_blk_mem_gen_R_0/sim/BRAM_RGB_blk_mem_gen_R_0.v" \
  "../../../bd/BRAM_RGB/ip/BRAM_RGB_blk_mem_gen_R_1/sim/BRAM_RGB_blk_mem_gen_R_1.v" \
  "../../../bd/BRAM_RGB/sim/BRAM_RGB.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

