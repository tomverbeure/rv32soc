
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

all: progmem.hex progmem.dis progmem.bin

progmem.dis: progmem.elf
	$(OBJDUMP) -s -D $< > $@

progmem.hex: progmem.elf
	$(OBJCOPY) -O binary $< /dev/stdout |  hexdump -v -e '/4 "%08X\n"' > $@

progmem.bin: progmem.elf
	$(OBJCOPY) -O binary $< $@

progmem.elf: progmem.o start.o progmem.lds Makefile
	$(LD) $(LDFLAGS) -o $@ start.o progmem.o > progmem.map

#./output/progmem_syn.hex:
#	icebram -g 32 2048 > $@

clean:
	\rm -fr *.o *.hex *.elf *.dis *.bin
