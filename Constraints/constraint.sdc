# Clock definition
create_clock -name clk -period 10.0 [get_ports clk]

# Clock uncertainty
set_clock_uncertainty 0.2 [get_clocks clk]

# Input delays
set_input_delay 1.0 -clock clk [get_ports rst]
set_input_delay 1.0 -clock clk [get_ports enable]
set_input_delay 1.0 -clock clk [get_ports temperature]

# Output delays
set_output_delay 1.0 -clock clk [get_ports pwm_out]
set_output_delay 1.0 -clock clk [get_ports fan_on]
set_output_delay 1.0 -clock clk [get_ports over_temp]

# Basic driving/load assumptions
set_max_fanout 16 [current_design]
