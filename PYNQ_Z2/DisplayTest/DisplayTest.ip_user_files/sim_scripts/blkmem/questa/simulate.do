onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib blkmem_opt

do {wave.do}

view wave
view structure
view signals

do {blkmem.udo}

run -all

quit -force
