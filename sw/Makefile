
TOOLS_PREFIX    = /opt/riscv32i/bin
TARGET          = $(TOOLS_PREFIX)/riscv32-unknown-elf
AS              = $(TARGET)-as
ASFLAGS         = -march=rv32i -mabi=ilp32
LD              = $(TARGET)-gcc
LDFLAGS         = -march=rv32i -mabi=ilp32 -Wl,-Tprogmem.lds,-Map,progmem.map -ffreestanding -nostartfiles
CC              = $(TARGET)-gcc
CFLAGS          = -march=rv32i -mabi=ilp32 -Wall -Wextra -pedantic -DFREQ=$(FREQ_PLL)000000 -O2
OBJCOPY         = $(TARGET)-objcopy
OBJDUMP         = $(TARGET)-objdump

#include boards/$(BOARD).mk

.PHONY: all clean syntax time stat flash

all: progmem.hex progmem.dis progmem.bin progmem0.coe progmem.mif

progmem.dis: progmem.elf
	$(OBJDUMP) -s -D $< > $@

progmem.hex: progmem.bin
	../misc/create_mif.rb -f hex -d 2048 -w 32 $< > $@
	../misc/create_mif.rb -f hex -d 2048 -w 8 -o 0 -i 4 $< > progmem0.hex
	../misc/create_mif.rb -f hex -d 2048 -w 8 -o 1 -i 4 $< > progmem1.hex
	../misc/create_mif.rb -f hex -d 2048 -w 8 -o 2 -i 4 $< > progmem2.hex
	../misc/create_mif.rb -f hex -d 2048 -w 8 -o 3 -i 4 $< > progmem3.hex

progmem0.coe: progmem.bin
	../misc/create_mif.rb -f coe -d 2048 -w 8 -o 0 -i 4 $< > progmem0.coe
	../misc/create_mif.rb -f coe -d 2048 -w 8 -o 1 -i 4 $< > progmem1.coe
	../misc/create_mif.rb -f coe -d 2048 -w 8 -o 2 -i 4 $< > progmem2.coe
	../misc/create_mif.rb -f coe -d 2048 -w 8 -o 3 -i 4 $< > progmem3.coe

progmem.mif: progmem.bin
	../misc/create_mif.rb -f mif -d 2048 -w 32 $< > $@

progmem.bin: progmem.elf
	$(OBJCOPY) -O binary $< $@

progmem.elf: progmem.o start.o progmem.lds Makefile
	$(LD) $(LDFLAGS) -o $@ start.o progmem.o > progmem.map

#./output/progmem_syn.hex:
#	icebram -g 32 2048 > $@

clean:
	\rm -fr *.o *.hex *.elf *.dis *.bin *.coe *.map *.mif
