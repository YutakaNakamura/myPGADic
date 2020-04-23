connect -url tcp:127.0.0.1:3121
source E:/Xilinx/workspace/PYNQ_Z2/project_LCD_withZynq/project_LCD.sdk/HPS_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Xilinx TUL 1234-tulA"} -index 0
loadhw -hw E:/Xilinx/workspace/PYNQ_Z2/project_LCD_withZynq/project_LCD.sdk/HPS_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Xilinx TUL 1234-tulA"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Xilinx TUL 1234-tulA"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Xilinx TUL 1234-tulA"} -index 0
dow E:/Xilinx/workspace/PYNQ_Z2/project_LCD_withZynq/project_LCD.sdk/UART_HelloWorld/Debug/UART_HelloWorld.elf
configparams force-mem-access 0
bpadd -addr &main
