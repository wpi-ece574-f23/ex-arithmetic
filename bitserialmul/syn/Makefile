all: syn

syn:
	BASENAME=bsmul \
		CLOCKPERIOD=1 \
		TIMINGPATH=/opt/skywater/libraries/sky130_fd_sc_hd/latest/timing \
		TIMINGLIB=sky130_fd_sc_hd__ss_100C_1v60.lib \
		VERILOG='../rtl/ps.sv  ../rtl/serialmuladd.sv  ../rtl/sp.sv  ../rtl/topmul.sv' \
		genus -f genus_script.tcl

clean:
	rm -rf outputs reports genus.log* genus.cmd* *~ fv

