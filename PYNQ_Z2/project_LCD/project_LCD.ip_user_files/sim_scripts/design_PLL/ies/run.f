-makelib ies_lib/xil_defaultlib -sv \
  "E:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies_lib/xpm \
  "E:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design_PLL/ip/design_PLL_clk_wiz_0_0/design_PLL_clk_wiz_0_0_clk_wiz.v" \
  "../../../bd/design_PLL/ip/design_PLL_clk_wiz_0_0/design_PLL_clk_wiz_0_0.v" \
  "../../../bd/design_PLL/sim/design_PLL.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

