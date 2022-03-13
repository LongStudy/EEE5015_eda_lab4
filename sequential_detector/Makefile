
# random seed generation
SEED = $(shell date +%s)

# variable definition
DUT = ./sequential_detector.v 

TB  = ./sequential_detector_tb.v ./timescale.v

# target : dependency
run: compile simulate

# target:
# command
compile:
	vcs -M +v2k -debug_all $(DUT) $(TB) -l com_$(SEED).log

simulate:
	./simv +plusargs_save +seed=$(SEED) -l sim_$(SEED).log

run_dve:
	dve -vpd vcdplus.vpd &

clean:
	@-rm -rf *.log  csrc simv simv.daidir ucli.key DVEfiles *vpd
