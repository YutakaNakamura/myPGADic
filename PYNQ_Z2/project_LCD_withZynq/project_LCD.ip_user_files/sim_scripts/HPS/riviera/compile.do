vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_4
vlib riviera/processing_system7_vip_v1_0_6

vmap xilinx_vip riviera/xilinx_vip
vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_4 riviera/axi_vip_v1_1_4
vmap processing_system7_vip_v1_0_6 riviera/processing_system7_vip_v1_0_6

vlog -work xilinx_vip  -sv2k12 "+incdir+E:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"E:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"E:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"E:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"E:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"E:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"E:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"E:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_if.sv" \
"E:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/clk_vip_if.sv" \
"E:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../project_LCD.srcs/sources_1/bd/HPS/ipshared/ec67/hdl" "+incdir+../../../../project_LCD.srcs/sources_1/bd/HPS/ipshared/70cf/hdl" "+incdir+../../../../project_LCD.srcs/sources_1/bd/HPS/ip/HPS_processing_system7_0_0" "+incdir+E:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"E:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"E:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"E:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../project_LCD.srcs/sources_1/bd/HPS/ipshared/ec67/hdl" "+incdir+../../../../project_LCD.srcs/sources_1/bd/HPS/ipshared/70cf/hdl" "+incdir+../../../../project_LCD.srcs/sources_1/bd/HPS/ip/HPS_processing_system7_0_0" "+incdir+E:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../project_LCD.srcs/sources_1/bd/HPS/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_4  -sv2k12 "+incdir+../../../../project_LCD.srcs/sources_1/bd/HPS/ipshared/ec67/hdl" "+incdir+../../../../project_LCD.srcs/sources_1/bd/HPS/ipshared/70cf/hdl" "+incdir+../../../../project_LCD.srcs/sources_1/bd/HPS/ip/HPS_processing_system7_0_0" "+incdir+E:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../project_LCD.srcs/sources_1/bd/HPS/ipshared/98af/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_6  -sv2k12 "+incdir+../../../../project_LCD.srcs/sources_1/bd/HPS/ipshared/ec67/hdl" "+incdir+../../../../project_LCD.srcs/sources_1/bd/HPS/ipshared/70cf/hdl" "+incdir+../../../../project_LCD.srcs/sources_1/bd/HPS/ip/HPS_processing_system7_0_0" "+incdir+E:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../project_LCD.srcs/sources_1/bd/HPS/ipshared/70cf/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_LCD.srcs/sources_1/bd/HPS/ipshared/ec67/hdl" "+incdir+../../../../project_LCD.srcs/sources_1/bd/HPS/ipshared/70cf/hdl" "+incdir+../../../../project_LCD.srcs/sources_1/bd/HPS/ip/HPS_processing_system7_0_0" "+incdir+E:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/HPS/ip/HPS_processing_system7_0_0/sim/HPS_processing_system7_0_0.v" \
"../../../bd/HPS/sim/HPS.v" \

vlog -work xil_defaultlib \
"glbl.v"

