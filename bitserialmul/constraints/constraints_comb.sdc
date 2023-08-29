if {![info exists ::env(CLOCKPERIOD)] } {
  set clockPeriod 20
} else {
    set clockPeriod [getenv CLOCKPERIOD]
}

create_clock -name clk -period $clockPeriod

set non_clock_inputs [all_inputs]
set_input_delay  0 -clock clk $non_clock_inputs 
set_output_delay 0 -clock clk [all_outputs]
