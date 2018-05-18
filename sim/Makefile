
LATTICE_CELLS_SIM := $(shell yosys-config --datdir/ice40/cells_sim.v)

IVERILOG_PREFIX  = /opt/iverilog/bin/

RTL = ../rtl
TB = ../tb

VERILOG_CORE    = $(RTL)/top.v $(RTL)/soc.v $(RTL)/picorv32.v $(RTL)/gpio.v $(RTL)/reset_gen.v
VERILOG_XILINX  = $(RTL)/pads_generic.v $(RTL)/pll_generic.v
VERILOG_ALTERA  = $(RTL)/pads_generic.v $(RTL)/pll_generic.v
VERILOG_LATTICE = $(RTL)/pads_lattice.v $(RTL)/pll_generic.v

VERILOG_TB      = $(TB)/tb.v

run_lattice: tb sw
	cd output && ./tb_lattice

sw:
	cd ../sw && $(MAKE)
	cp ../sw/progmem.hex output

waves:
	gtkwave ./output/waves.vcd waves.gtkw

tb: ./output ./output/tb_xilinx ./output/tb_altera ./output/tb_lattice

./output/tb_xilinx: $(VERILOG_CORE) $(VERILOG_XILINX) $(VERILOG_TB)
	$(IVERILOG_PREFIX)/iverilog -Wall -o $@ -I ../rtl $^ -s tb

./output/tb_altera: $(VERILOG_CORE) $(VERILOG_ALTERA) $(VERILOG_TB)
	$(IVERILOG_PREFIX)/iverilog -Wall -o $@ -I ../rtl  $^ -s tb

./output/tb_lattice: $(VERILOG_CORE) $(VERILOG_LATTICE) $(LATTICE_CELLS_SIM) $(VERILOG_TB)
	$(IVERILOG_PREFIX)/iverilog -Wall -o $@ -I ../rtl  $^ -s tb

./output:
	mkdir -p output

clean:
	rm -fr ./output
