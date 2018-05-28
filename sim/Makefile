
LATTICE_CELLS_SIM := $(shell yosys-config --datdir/ice40/cells_sim.v)

IVERILOG_PREFIX = /opt/iverilog/bin/
#IVERILOG	= $(IVERILOG_PREFIX)/iverilog
IVERILOG	= iverilog

#CPU_DEFINES = -D USE_VEXRISCV
CPU_DEFINES = -D USE_PICORV32 -D ENABLE_REGS_DUALPORT=0

RTL = ../rtl
TB = ../tb
ICICLE_RTL =  ../../icicle


VERILOG_CORE    = $(RTL)/top.v $(RTL)/soc.v $(RTL)/gpio.v $(RTL)/reset_gen.v \
			$(RTL)/icicle_wrapper.v \
			$(RTL)/picorv32_wrapper.v $(RTL)/picorv32.v \
			$(RTL)/vexriscv_wrapper.v ../vexriscv/VexRiscv_FullNoMmuNoCacheNoCsrNoDbg.v

VERILOG_XILINX  = $(RTL)/pads_generic.v $(RTL)/pll_generic.v
VERILOG_ALTERA  = $(RTL)/pads_generic.v $(RTL)/pll_generic.v
VERILOG_LATTICE = $(RTL)/pads_lattice.v $(RTL)/pll_generic.v

VERILOG_ICICLE	= \
    $(ICICLE_RTL)/rv32_alu.sv \
    $(ICICLE_RTL)/rv32_branch.sv \
    $(ICICLE_RTL)/rv32_control.sv \
    $(ICICLE_RTL)/rv32_csrs.sv \
    $(ICICLE_RTL)/rv32_decode.sv \
    $(ICICLE_RTL)/rv32_execute.sv \
    $(ICICLE_RTL)/rv32_fetch.sv \
    $(ICICLE_RTL)/rv32_hazard.sv \
    $(ICICLE_RTL)/rv32_imm.sv \
    $(ICICLE_RTL)/rv32_mem.sv \
    $(ICICLE_RTL)/rv32_opcodes.sv \
    $(ICICLE_RTL)/rv32_regs.sv \
    $(ICICLE_RTL)/rv32.sv

VERILOG_TB      = $(TB)/tb.v

run_xilinx: tb sw
	cd output && ./tb_xilinx

sw:
	cd ../sw && $(MAKE)
	cp ../sw/progmem.hex output

waves:
	gtkwave ./output/waves.vcd 

tb: ./output ./output/tb_xilinx # ./output/tb_altera ./output/tb_lattice

./output/tb_xilinx: $(VERILOG_ICICLE) $(VERILOG_CORE) $(VERILOG_XILINX) $(VERILOG_TB)
	$(IVERILOG)  -o $@ -g2012 $(CPU_DEFINES) -I ../rtl -I $(ICICLE_RTL) $^ -s tb

./output/tb_altera: $(VERILOG_ICICLE) $(VERILOG_CORE) $(VERILOG_ALTERA) $(VERILOG_TB)
	$(IVERILOG) -Wall -o $@ -I ../rtl  $ -I $(ICICLE_RTL)^ -s tb

./output/tb_lattice: $(VERILOG_ICICLE) $(VERILOG_CORE) $(VERILOG_LATTICE) $(LATTICE_CELLS_SIM) $(VERILOG_TB)
	$(IVERILOG) -Wall -o $@ -I ../rtl  $ -I $(ICICLE_RTL)^ -s tb

./output:
	mkdir -p output

clean:
	rm -fr ./output
