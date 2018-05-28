

RTL = ../rtl
VERILOG_CORE    = $(RTL)/top.v $(RTL)/soc.v $(RTL)/gpio.v $(RTL)/reset_gen.v \
					$(RTL)/picorv32.v $(RTL)/picorv32_wrapper.v \
					../vexriscv/VexRiscv_FullNoMmuNoCacheNoCsrNoDbg.v $(RTL)/vexriscv_wrapper.v
VERILOG_LATTICE = $(RTL)/pads_lattice.v $(RTL)/pll_lattice.v 
VERILOG_FILES   = $(VERILOG_CORE) $(VERILOG_LATTICE)

PCF_FILE = blackice-ii.pcf
CELLS_SIM := $(shell yosys-config --datdir/ice40/cells_sim.v)

chip.bin: chip.asc
	icepack $< $@

chip.asc: chip_pnr.asc 
	icebram progmem.hex ../sw/progmem.hex < $< > $@

chip_pnr.asc: chip.blif
	arachne-pnr -r -d 8k -P tq144:4k -p $(PCF_FILE) chip.blif -o chip_pnr.asc

chip.blif: rv32soc.ys rv32soc_all.v progmem.hex $(VERILOG_FILES) 
	yosys -q -l chip.yosys.log $<

rv32soc_all.v: $(VERILOG_FILES) 
	echo $^ | perl -pe 's|(.*?)\s|`include "$$1"\n|g' > $@

progmem.hex: 
	icebram -g 32 2048 > $@

#pll_ice40.v:
#	icepll -i 100 -o 20 -m -n pll_ice40 -f pll_ice40.v

time: chip.bin
	icetime -tmd hx8k chip.asc

.PHONY: upload
upload:
	stty -F /dev/ttyACM0 115200 raw
	cat chip.bin >/dev/ttyACM0

.PHONY: clean
clean:
	$(RM) -f chip.blif chip.asc chip_pnr.asc chip.ex chip.bin waves.vcd tb *.log rv32soc_all.v


flash: 
	dfu-util -d 0483:df11 --alt 0 --dfuse-address 0x0801F000 -D chip.bin

run:
	stty -F /dev/ttyUSB0 115200 raw -echo
	cat /dev/ttyUSB0

tb: src/tb.v $(VERILOG_FILES) $(CELLS_SIM)
	iverilog -o tb src/tb.v $(VERILOG_FILES) $(CELLS_SIM)

sim: tb
	./tb

help:
	@echo "Makefile options:"
	@echo "    chip.bin (default): Create iCE40 bitstream"
	@echo "    upload:             Upload chip.bin as volatible bitstream to FPGA. Run as root."
	@echo "    flash:              Flash chip.bin into STM32 internal flash. STM32 must be in DFU mode. Run as root."
	@echo "    sim:                Simulate the design. Create .vcd file to use with GTKwave."
	@echo "    run:                Check results on USB2 port."
	@echo "    clean:              Clean up directory"

lint:
	verilator_bin --lint-only -I $(CELLS_SIM) $(VERILOG_FILES) --top-module chip
