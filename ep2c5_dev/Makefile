
QUARTUS_ROOTDIR ?= ~/altera/13.0sp1/quartus
PROJECT_NAME    = rv32soc

synth: progmem.mif
	$(QUARTUS_ROOTDIR)/bin/quartus_map --read_settings_files=on  --write_settings_files=off $(PROJECT_NAME) -c $(PROJECT_NAME)
	$(QUARTUS_ROOTDIR)/bin/quartus_fit --read_settings_files=off --write_settings_files=off $(PROJECT_NAME) -c $(PROJECT_NAME)
	$(QUARTUS_ROOTDIR)/bin/quartus_asm --read_settings_files=off --write_settings_files=off $(PROJECT_NAME) -c $(PROJECT_NAME)

update_ram: progmem.mif
	cp progmem.mif `find db -name "*picosoc_mem*.mif"`
	$(QUARTUS_ROOTDIR)/bin/quartus_cdb $(PROJECT_NAME) -c $(PROJECT_NAME) --update_mif
	$(QUARTUS_ROOTDIR)/bin/quartus_asm --read_settings_files=off --write_settings_files=off $(PROJECT_NAME) -c $(PROJECT_NAME)

.PHONY: progmem.mif
progmem.mif:
	cd ../sw && make
	../misc/create_mif.rb -d 2048 -w 32 ../sw/progmem.bin > progmem.mif

check:
	$(QUARTUS_ROOTDIR)/bin/quartus_pgm -a

pgm:
	$(QUARTUS_ROOTDIR)/bin/quartus_pgm $(PROJECT_NAME).cdf

clean:
	\rm -fr db incremental_db simulation Chain1.cdf progmem.mif

