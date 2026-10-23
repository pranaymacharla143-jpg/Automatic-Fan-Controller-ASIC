export DESIGN_NAME = fan_controller
export DESIGN_NICKNAME = automatic_fan_controller

export PLATFORM = sky130hd

export VERILOG_FILES = $(FLOW_HOME)/src/automatic_fan_controller/fan_controller.v
export SDC_FILE = $(FLOW_HOME)/src/automatic_fan_controller/constraint.sdc

export CLOCK_PORT = clk
export CLOCK_PERIOD = 10.0

export CORE_UTILIZATION = 30
export CORE_ASPECT_RATIO = 1.0
export CORE_MARGIN = 2

export PLACE_DENSITY = 0.60
export DONT_BUFFER_PORTS = 1
