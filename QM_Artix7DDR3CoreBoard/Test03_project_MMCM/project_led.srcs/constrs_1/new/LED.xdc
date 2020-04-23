set_property PACKAGE_PIN E6 [get_ports led_1]
set_property IOSTANDARD LVCMOS33 [get_ports led_1]
set_property PACKAGE_PIN N11 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
set_property PACKAGE_PIN K5 [get_ports sys_rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports sys_rst_n]

set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]


connect_debug_port u_ila_0/clk [get_nets [list sys_clk_IBUF_BUFG]]
connect_debug_port dbg_hub/clk [get_nets sys_clk_IBUF_BUFG]

create_debug_core u_ila_0_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0_0]
set_property port_width 1 [get_debug_ports u_ila_0_0/clk]
connect_debug_port u_ila_0_0/clk [get_nets [list sys_clk_high]]
set_property port_width 32 [get_debug_ports u_ila_0_0/probe0]
connect_debug_port u_ila_0_0/probe0 [get_nets [list {count[0]} {count[1]} {count[2]} {count[3]} {count[4]} {count[5]} {count[6]} {count[7]} {count[8]} {count[9]} {count[10]} {count[11]} {count[12]} {count[13]} {count[14]} {count[15]} {count[16]} {count[17]} {count[18]} {count[19]} {count[20]} {count[21]} {count[22]} {count[23]} {count[24]} {count[25]} {count[26]} {count[27]} {count[28]} {count[29]} {count[30]} {count[31]}]]
create_debug_port u_ila_0_0 probe
set_property port_width 1 [get_debug_ports u_ila_0_0/probe1]
connect_debug_port u_ila_0_0/probe1 [get_nets [list r_led]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets sys_clk_high]
