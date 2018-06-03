
XILINX_DIR = /opt/Xilinx/14.7/ISE_DS/
XILINX_BIN = $(XILINX_DIR)/ISE/bin/lin64

ise: progmem.hex
	$(XILINX_BIN)/ise

impact:
	sudo LD_PRELOAD=$(XILINX_DIR)/usb-driver/libusb-driver.so $(XILINX_BIN)/impact

update_ram: progmem.mem
	$(XILINX_BIN)/data2mem -bm progmem.bmm -bt top.bit -bd progmem.mem -o b top.new.bit
	$(XILINX_BIN)/data2mem -bm progmem.bmm -bt top.new.bit -d > top.new.bit.dump
	mv top.bit top.bit.orig
	mv top.new.bit top.bit

dump:
	$(XILINX_BIN)/data2mem -bm progmem.bmm -bt top.bit -d > top.bit.dump

.PHONY: progmem.mem
progmem.mem: 
	cd ../sw/ && make
	cp ../sw/progmem.mem .

.PHONY: progmem.hex
progmem.hex:
	cd ../sw/ && make
	cp ../sw/progmem*.hex .

