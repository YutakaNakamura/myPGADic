## This file is a general .xdc for the QM_Artix7_DDR3
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project


# Clock signal
set_property PACKAGE_PIN N11 [get_ports {SYS_CLK_50M}]
create_clock -add -name sys_clk_pin -period 20.00 -waveform {0 5} [get_ports {SYS_CLK_50M}];
set_property IOSTANDARD LVCMOS33 [get_ports {SYS_CLK_50M}] 

#Switch (InvertingInput)
set_property PACKAGE_PIN K5 [get_ports {SW2}]
set_property IOSTANDARD LVCMOS33 [get_ports {SW2}]

## LED #Inverting
set_property PACKAGE_PIN E6 [get_ports {LED3}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED3}]
set_property SEVERITY {Warning} [get_drc_checks UCIO-1]

##Headers
#U7 Header 32*2
#set_property PACKAGE_PIN [get_ports {IO_U7[1]}]  set_property PACKAGE_PIN [get_ports {IO_U7[2]}] #GND GND
#set_property PACKAGE_PIN [get_ports {IO_U7[3]}]  set_property PACKAGE_PIN [get_ports {IO_U7[4]}] #3V3 3V3
#set_property PACKAGE_PIN [get_ports {IO_U7[5]}]  set_property PACKAGE_PIN [get_ports {IO_U7[6]}] #GND GND
set_property PACKAGE_PIN M12 [get_ports {IO_U7[7]}];  set_property PACKAGE_PIN N13 [get_ports {IO_U7[8]}]
set_property PACKAGE_PIN N14 [get_ports {IO_U7[9]}];  set_property PACKAGE_PIN N16 [get_ports {IO_U7[10]}]
set_property PACKAGE_PIN P15 [get_ports {IO_U7[11]}]; set_property PACKAGE_PIN P16 [get_ports {IO_U7[12]}]
set_property PACKAGE_PIN R15 [get_ports {IO_U7[13]}]; set_property PACKAGE_PIN R16 [get_ports {IO_U7[14]}]
set_property PACKAGE_PIN T14 [get_ports {IO_U7[15]}]; set_property PACKAGE_PIN T15 [get_ports {IO_U7[16]}]
set_property PACKAGE_PIN P13 [get_ports {IO_U7[17]}]; set_property PACKAGE_PIN P14 [get_ports {IO_U7[18]}]
set_property PACKAGE_PIN T13 [get_ports {IO_U7[19]}]; set_property PACKAGE_PIN R13 [get_ports {IO_U7[20]}]
set_property PACKAGE_PIN T12 [get_ports {IO_U7[21]}]; set_property PACKAGE_PIN R12 [get_ports {IO_U7[22]}]
set_property PACKAGE_PIN L13 [get_ports {IO_U7[23]}]; set_property PACKAGE_PIN N12 [get_ports {IO_U7[24]}]
set_property PACKAGE_PIN K12 [get_ports {IO_U7[25]}]; set_property PACKAGE_PIN K13 [get_ports {IO_U7[26]}]
set_property PACKAGE_PIN P10 [get_ports {IO_U7[27]}]; set_property PACKAGE_PIN P11 [get_ports {IO_U7[28]}]
set_property PACKAGE_PIN N9  [get_ports {IO_U7[29]}]; set_property PACKAGE_PIN P9  [get_ports {IO_U7[30]}]
set_property PACKAGE_PIN T10 [get_ports {IO_U7[31]}]; set_property PACKAGE_PIN R11 [get_ports {IO_U7[32]}]
set_property PACKAGE_PIN T9  [get_ports {IO_U7[33]}]; set_property PACKAGE_PIN R10 [get_ports {IO_U7[34]}]
set_property PACKAGE_PIN T8  [get_ports {IO_U7[35]}]; set_property PACKAGE_PIN R8  [get_ports {IO_U7[36]}]
set_property PACKAGE_PIN T7  [get_ports {IO_U7[37]}]; set_property PACKAGE_PIN R7  [get_ports {IO_U7[38]}]
set_property PACKAGE_PIN T5  [get_ports {IO_U7[39]}]; set_property PACKAGE_PIN R6  [get_ports {IO_U7[40]}]
set_property PACKAGE_PIN P6  [get_ports {IO_U7[41]}]; set_property PACKAGE_PIN R5  [get_ports {IO_U7[42]}]
set_property PACKAGE_PIN N6  [get_ports {IO_U7[43]}]; set_property PACKAGE_PIN M6  [get_ports {IO_U7[44]}]
set_property PACKAGE_PIN L5  [get_ports {IO_U7[45]}]; set_property PACKAGE_PIN P5  [get_ports {IO_U7[46]}]
set_property PACKAGE_PIN T4  [get_ports {IO_U7[47]}]; set_property PACKAGE_PIN T3  [get_ports {IO_U7[48]}]
set_property PACKAGE_PIN R3  [get_ports {IO_U7[49]}]; set_property PACKAGE_PIN T2  [get_ports {IO_U7[50]}]
set_property PACKAGE_PIN R2  [get_ports {IO_U7[51]}]; set_property PACKAGE_PIN R1  [get_ports {IO_U7[52]}]
set_property PACKAGE_PIN M5  [get_ports {IO_U7[53]}]; set_property PACKAGE_PIN N4  [get_ports {IO_U7[54]}]
set_property PACKAGE_PIN P4  [get_ports {IO_U7[55]}]; set_property PACKAGE_PIN P3  [get_ports {IO_U7[56]}]
set_property PACKAGE_PIN N1  [get_ports {IO_U7[57]}]; set_property PACKAGE_PIN P1  [get_ports {IO_U7[58]}]
set_property PACKAGE_PIN M2  [get_ports {IO_U7[59]}]; set_property PACKAGE_PIN M1  [get_ports {IO_U7[60]}]
#set_property PACKAGE_PIN [get_ports {IO_U7[61]}] set_property PACKAGE_PIN [get_ports {IO_U7[62]}] #GND GND
#set_property PACKAGE_PIN [get_ports {IO_U7[63]}] set_property PACKAGE_PIN [get_ports {IO_U7[64]}] #VIN VIN

set_property IOSTANDARD LVCMOS33 [get_ports {IO_U7[*]}] 

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {IO_U7[34]}]


#U8 32*2 Pin
#set_property PACKAGE_PIN [get_ports {IO_U8[1]}]  set_property PACKAGE_PIN [get_ports {IO_U8[2]}] #GND GND
#set_property PACKAGE_PIN [get_ports {IO_U8[3]}]  set_property PACKAGE_PIN [get_ports {IO_U8[4]}] #VCCO34_35 VCCO34_35
#set_property PACKAGE_PIN [get_ports {IO_U8[5]}]  set_property PACKAGE_PIN [get_ports {IO_U8[6]}] #GND GND
set_property PACKAGE_PIN B7 [get_ports {IO_U8[7]}];  set_property PACKAGE_PIN A7 [get_ports {IO_U8[8]}]
set_property PACKAGE_PIN B6 [get_ports {IO_U8[9]}];  set_property PACKAGE_PIN B5 [get_ports {IO_U8[10]}]
set_property PACKAGE_PIN E6 [get_ports {IO_U8[11]}]; set_property PACKAGE_PIN K5 [get_ports {IO_U8[12]}]
set_property PACKAGE_PIN J5 [get_ports {IO_U8[13]}]; set_property PACKAGE_PIN J4 [get_ports {IO_U8[14]}]
set_property PACKAGE_PIN G5 [get_ports {IO_U8[15]}]; set_property PACKAGE_PIN G4 [get_ports {IO_U8[16]}]
set_property PACKAGE_PIN C7 [get_ports {IO_U8[17]}]; set_property PACKAGE_PIN C6 [get_ports {IO_U8[18]}]
set_property PACKAGE_PIN D6 [get_ports {IO_U8[19]}]; set_property PACKAGE_PIN D5 [get_ports {IO_U8[20]}]
set_property PACKAGE_PIN A5 [get_ports {IO_U8[21]}]; set_property PACKAGE_PIN A4 [get_ports {IO_U8[22]}]
set_property PACKAGE_PIN B4 [get_ports {IO_U8[23]}]; set_property PACKAGE_PIN A3 [get_ports {IO_U8[24]}]
set_property PACKAGE_PIN D4 [get_ports {IO_U8[25]}]; set_property PACKAGE_PIN C4 [get_ports {IO_U8[26]}]
set_property PACKAGE_PIN C3 [get_ports {IO_U8[27]}]; set_property PACKAGE_PIN C2 [get_ports {IO_U8[28]}]
set_property PACKAGE_PIN B2 [get_ports {IO_U8[29]}]; set_property PACKAGE_PIN A2 [get_ports {IO_U8[30]}]
set_property PACKAGE_PIN C1 [get_ports {IO_U8[31]}]; set_property PACKAGE_PIN B1 [get_ports {IO_U8[32]}]
set_property PACKAGE_PIN E2 [get_ports {IO_U8[33]}]; set_property PACKAGE_PIN D1 [get_ports {IO_U8[34]}]
set_property PACKAGE_PIN E3 [get_ports {IO_U8[35]}]; set_property PACKAGE_PIN D3 [get_ports {IO_U8[36]}]
set_property PACKAGE_PIN F5 [get_ports {IO_U8[37]}]; set_property PACKAGE_PIN E5 [get_ports {IO_U8[38]}]
set_property PACKAGE_PIN F2 [get_ports {IO_U8[39]}]; set_property PACKAGE_PIN E1 [get_ports {IO_U8[40]}]
set_property PACKAGE_PIN F4 [get_ports {IO_U8[41]}]; set_property PACKAGE_PIN F3 [get_ports {IO_U8[42]}]
set_property PACKAGE_PIN G2 [get_ports {IO_U8[43]}]; set_property PACKAGE_PIN G1 [get_ports {IO_U8[44]}]
set_property PACKAGE_PIN H2 [get_ports {IO_U8[45]}]; set_property PACKAGE_PIN H1 [get_ports {IO_U8[46]}]
set_property PACKAGE_PIN K1 [get_ports {IO_U8[47]}]; set_property PACKAGE_PIN J1 [get_ports {IO_U8[48]}]
set_property PACKAGE_PIN L3 [get_ports {IO_U8[49]}]; set_property PACKAGE_PIN L2 [get_ports {IO_U8[50]}]
set_property PACKAGE_PIN H5 [get_ports {IO_U8[51]}]; set_property PACKAGE_PIN H4 [get_ports {IO_U8[52]}]
set_property PACKAGE_PIN J3 [get_ports {IO_U8[53]}]; set_property PACKAGE_PIN H3 [get_ports {IO_U8[54]}]
set_property PACKAGE_PIN K3 [get_ports {IO_U8[55]}]; set_property PACKAGE_PIN K2 [get_ports {IO_U8[56]}]
set_property PACKAGE_PIN L4 [get_ports {IO_U8[57]}]; set_property PACKAGE_PIN M4 [get_ports {IO_U8[58]}]
set_property PACKAGE_PIN N3 [get_ports {IO_U8[59]}]; set_property PACKAGE_PIN N2 [get_ports {IO_U8[60]}]
#set_property PACKAGE_PIN [get_ports {IO_U8[61]}] set_property PACKAGE_PIN [get_ports {IO_U8[62]}] #GND GND
#set_property PACKAGE_PIN [get_ports {IO_U8[63]}] set_property PACKAGE_PIN [get_ports {IO_U8[64]}] #VIN VIN
set_property IOSTANDARD LVCMOS33 [get_ports {IO_U8[*]}] 