rtl:
	BASENAME=rtl_2 CLOCKPERIOD=2 TIMINGPATH=/opt/skywater/libraries/sky130_fd_sc_hd/latest/timing TIMINGLIB=sky130_fd_sc_hd__ss_100C_1v60.lib VERILOG=adder8_rtl.v genus -f genus_script.tcl
	BASENAME=rtl_1 CLOCKPERIOD=1 TIMINGPATH=/opt/skywater/libraries/sky130_fd_sc_hd/latest/timing TIMINGLIB=sky130_fd_sc_hd__ss_100C_1v60.lib VERILOG=adder8_rtl.v genus -f genus_script.tcl

clean:
	rm -rf outputs reports genus.log* genus.cmd* *~ fv

