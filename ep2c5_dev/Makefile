
QUARTUS_ROOTDIR ?= ~/altera/13.0sp1/quartus
PROJECT_NAME    = rv32soc

synth:
	$(QUARTUS_ROOTDIR)/bin/quartus_map --read_settings_files=on  --write_settings_files=off $(PROJECT_NAME) -c $(PROJECT_NAME)
	$(QUARTUS_ROOTDIR)/bin/quartus_fit --read_settings_files=off --write_settings_files=off $(PROJECT_NAME) -c $(PROJECT_NAME)
	$(QUARTUS_ROOTDIR)/bin/quartus_asm --read_settings_files=off --write_settings_files=off $(PROJECT_NAME) -c $(PROJECT_NAME)

check:
	$(QUARTUS_ROOTDIR)/bin/quartus_pgm -a

pgm:
	$(QUARTUS_ROOTDIR)/bin/quartus_pgm $(PROJECT_NAME).cdf

