
QUARTUS_ROOTDIR ?= ~/altera/13.0sp1/quartus
PROJECT_NAME    = rv32soc

synth: progmem
	$(QUARTUS_ROOTDIR)/bin/quartus_map --read_settings_files=on  --write_settings_files=off $(PROJECT_NAME) -c $(PROJECT_NAME)
	$(QUARTUS_ROOTDIR)/bin/quartus_fit --read_settings_files=off --write_settings_files=off $(PROJECT_NAME) -c $(PROJECT_NAME)
	$(QUARTUS_ROOTDIR)/bin/quartus_asm --read_settings_files=off --write_settings_files=off $(PROJECT_NAME) -c $(PROJECT_NAME)

update_ram: progmem
	cp progmem0.mif `find db -name "rv32soc.ram0_local_ram*.mif"`
	cp progmem1.mif `find db -name "rv32soc.ram1_local_ram*.mif"`
	cp progmem2.mif `find db -name "rv32soc.ram2_local_ram*.mif"`
	cp progmem3.mif `find db -name "rv32soc.ram3_local_ram*.mif"`
	$(QUARTUS_ROOTDIR)/bin/quartus_cdb $(PROJECT_NAME) -c $(PROJECT_NAME) --update_mif
	$(QUARTUS_ROOTDIR)/bin/quartus_asm --read_settings_files=off --write_settings_files=off $(PROJECT_NAME) -c $(PROJECT_NAME)

.PHONY: progmem
progmem:
	cd ../sw && make
	cp ../sw/progmem*.mif .
	cp ../sw/progmem*.hex .


check:
	$(QUARTUS_ROOTDIR)/bin/quartus_pgm -a

pgm:
	$(QUARTUS_ROOTDIR)/bin/quartus_pgm $(PROJECT_NAME).cdf

clean:
	\rm -fr db incremental_db simulation Chain1.cdf progmem*.mif progmem*.hex

