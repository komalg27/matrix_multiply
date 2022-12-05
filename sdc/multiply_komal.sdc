###############################################################################
# Created by write_sdc
# Sat Dec  3 09:34:43 2022
###############################################################################
current_design multiply_komal
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name Clock -period 24.0000 [get_ports {Clock}]
set_clock_transition 0.1500 [get_clocks {Clock}]
set_clock_uncertainty 0.2500 Clock
set_propagated_clock [get_clocks {Clock}]
set_input_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {Enable}]
set_input_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {K[0]}]
set_input_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {K[1]}]
set_input_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {K[2]}]
set_input_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {X[0]}]
set_input_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {X[1]}]
set_input_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {X[2]}]
set_input_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {X[3]}]
set_input_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {X[4]}]
set_input_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {X[5]}]
set_input_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {X[6]}]
set_input_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {X[7]}]
set_input_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {Z[0]}]
set_input_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {Z[1]}]
set_input_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {reset}]
set_output_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {Result[0]}]
set_output_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {Result[10]}]
set_output_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {Result[11]}]
set_output_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {Result[12]}]
set_output_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {Result[13]}]
set_output_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {Result[14]}]
set_output_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {Result[15]}]
set_output_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {Result[16]}]
set_output_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {Result[1]}]
set_output_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {Result[2]}]
set_output_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {Result[3]}]
set_output_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {Result[4]}]
set_output_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {Result[5]}]
set_output_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {Result[6]}]
set_output_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {Result[7]}]
set_output_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {Result[8]}]
set_output_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {Result[9]}]
set_output_delay 4.8000 -clock [get_clocks {Clock}] -add_delay [get_ports {done}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0729 [get_ports {done}]
set_load -pin_load 0.0729 [get_ports {Result[16]}]
set_load -pin_load 0.0729 [get_ports {Result[15]}]
set_load -pin_load 0.0729 [get_ports {Result[14]}]
set_load -pin_load 0.0729 [get_ports {Result[13]}]
set_load -pin_load 0.0729 [get_ports {Result[12]}]
set_load -pin_load 0.0729 [get_ports {Result[11]}]
set_load -pin_load 0.0729 [get_ports {Result[10]}]
set_load -pin_load 0.0729 [get_ports {Result[9]}]
set_load -pin_load 0.0729 [get_ports {Result[8]}]
set_load -pin_load 0.0729 [get_ports {Result[7]}]
set_load -pin_load 0.0729 [get_ports {Result[6]}]
set_load -pin_load 0.0729 [get_ports {Result[5]}]
set_load -pin_load 0.0729 [get_ports {Result[4]}]
set_load -pin_load 0.0729 [get_ports {Result[3]}]
set_load -pin_load 0.0729 [get_ports {Result[2]}]
set_load -pin_load 0.0729 [get_ports {Result[1]}]
set_load -pin_load 0.0729 [get_ports {Result[0]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_4 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {Clock}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {Enable}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {reset}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {K[2]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {K[1]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {K[0]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {X[7]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {X[6]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {X[5]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {X[4]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {X[3]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {X[2]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {X[1]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {X[0]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {Z[1]}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin {ZN} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {Z[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_fanout 4.0000 [current_design]
