###############################################################################
# Created by write_sdc
###############################################################################
current_design fan_controller
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 10.0000 [get_ports {clk}]
set_clock_uncertainty 0.2000 clk
set_propagated_clock [get_clocks {clk}]
set_input_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {enable}]
set_input_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rst}]
set_input_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {temperature[0]}]
set_input_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {temperature[1]}]
set_input_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {temperature[2]}]
set_input_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {temperature[3]}]
set_input_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {temperature[4]}]
set_input_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {temperature[5]}]
set_input_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {temperature[6]}]
set_input_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {temperature[7]}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {fan_on}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {over_temp}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {pwm_out}]
###############################################################################
# Environment
###############################################################################
###############################################################################
# Design Rules
###############################################################################
set_max_fanout 16.0000 [current_design]
