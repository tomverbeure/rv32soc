
LATTICE_CELLS_SIM := $(shell yosys-config --datdir/ice40/cells_sim.v)

IVERILOG_PREFIX = /opt/iverilog/bin/
RTL = ../rtl

VERILOG_CORE    = $(RTL)/top.v $(RTL)/soc.v $(RTL)/picorv32.v $(RTL)/gpio.v
VERILOG_XILINX  = $(RTL)/pads_generic.v
VERILOG_ALTERA  = $(RTL)/pads_generic.v
VERILOG_LATTICE = $(RTL)/pads_lattice.v

tb: ./sim ./sim/tb_xilinx ./sim/tb_altera ./sim/tb_lattice

./sim/tb_xilinx: $(VERILOG_CORE) $(VERILOG_XILINX)
	$(IVERILOG_PREFIX)/iverilog -o $@ -I ../rtl  $^

./sim/tb_altera: $(VERILOG_CORE) $(VERILOG_ALTERA)
	$(IVERILOG_PREFIX)/iverilog -o $@ -I ../rtl  $^

./sim/tb_lattice: $(VERILOG_CORE) $(VERILOG_LATTICE) $(LATTICE_CELLS_SIM)
	$(IVERILOG_PREFIX)/iverilog -o $@ -I ../rtl  $^

./sim:
	mkdir -p sim

