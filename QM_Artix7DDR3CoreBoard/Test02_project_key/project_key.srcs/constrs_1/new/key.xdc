set_property PACKAGE_PIN N11 [get_ports sys_clk]
set_property PACKAGE_PIN K5 [get_ports key_1]
set_property PACKAGE_PIN E6 [get_ports led_1]
set_property PACKAGE_PIN B7 [get_ports sys_rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports key_1]
set_property IOSTANDARD LVCMOS33 [get_ports led_1]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sys_rst_n]

set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]