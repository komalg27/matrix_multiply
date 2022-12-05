###############################################################################
# Created by write_sdc
# Sun Dec  4 21:47:54 2022
###############################################################################
current_design matrix_multiply
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name Clock -period 55.0000 
set_clock_uncertainty 0.2500 Clock
set_input_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {clk}]
set_input_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {execute}]
set_input_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {input_val[0]}]
set_input_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {input_val[1]}]
set_input_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {input_val[2]}]
set_input_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {input_val[3]}]
set_input_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {input_val[4]}]
set_input_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {input_val[5]}]
set_input_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {input_val[6]}]
set_input_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {input_val[7]}]
set_input_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {reset}]
set_input_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {sel_in[0]}]
set_input_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {sel_in[1]}]
set_input_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {sel_in[2]}]
set_input_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {sel_out[0]}]
set_input_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {sel_out[1]}]
set_output_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {result[0]}]
set_output_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {result[10]}]
set_output_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {result[11]}]
set_output_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {result[12]}]
set_output_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {result[13]}]
set_output_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {result[14]}]
set_output_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {result[15]}]
set_output_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {result[16]}]
set_output_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {result[1]}]
set_output_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {result[2]}]
set_output_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {result[3]}]
set_output_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {result[4]}]
set_output_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {result[5]}]
set_output_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {result[6]}]
set_output_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {result[7]}]
set_output_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {result[8]}]
set_output_delay 11.0000 -clock [get_clocks {Clock}] -add_delay [get_ports {result[9]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0729 [get_ports {result[16]}]
set_load -pin_load 0.0729 [get_ports {result[15]}]
set_load -pin_load 0.0729 [get_ports {result[14]}]
set_load -pin_load 0.0729 [get_ports {result[13]}]
set_load -pin_load 0.0729 [get_ports {result[12]}]
set_load -pin_load 0.0729 [get_ports {result[11]}]
set_load -pin_load 0.0729 [get_ports {result[10]}]
set_load -pin_load 0.0729 [get_ports {result[9]}]
set_load -pin_load 0.0729 [get_ports {result[8]}]
set_load -pin_load 0.0729 [get_ports {result[7]}]
set_load -pin_load 0.0729 [get_ports {result[6]}]
set_load -pin_load 0.0729 [get_ports {result[5]}]
set_load -pin_load 0.0729 [get_ports {result[4]}]
set_load -pin_load 0.0729 [get_ports {result[3]}]
set_load -pin_load 0.0729 [get_ports {result[2]}]
set_load -pin_load 0.0729 [get_ports {result[1]}]
set_load -pin_load 0.0729 [get_ports {result[0]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {execute}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {reset}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {input_val[7]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {input_val[6]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {input_val[5]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {input_val[4]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {input_val[3]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {input_val[2]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {input_val[1]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {input_val[0]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {sel_in[2]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {sel_in[1]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {sel_in[0]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {sel_out[1]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {sel_out[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_fanout 4.0000 [current_design]
