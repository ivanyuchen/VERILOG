# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "AXIS_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HIDDEN_DIM" -parent ${Page_0}
  ipgui::add_param $IPINST -name "INPUT_DIM" -parent ${Page_0}
  ipgui::add_param $IPINST -name "PARALLEL_NEURONS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "PIXEL_BITS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SPIKE_COUNT_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "TIME_STEPS" -parent ${Page_0}


}

proc update_PARAM_VALUE.AXIS_DATA_WIDTH { PARAM_VALUE.AXIS_DATA_WIDTH } {
	# Procedure called to update AXIS_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXIS_DATA_WIDTH { PARAM_VALUE.AXIS_DATA_WIDTH } {
	# Procedure called to validate AXIS_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.HIDDEN_DIM { PARAM_VALUE.HIDDEN_DIM } {
	# Procedure called to update HIDDEN_DIM when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HIDDEN_DIM { PARAM_VALUE.HIDDEN_DIM } {
	# Procedure called to validate HIDDEN_DIM
	return true
}

proc update_PARAM_VALUE.INPUT_DIM { PARAM_VALUE.INPUT_DIM } {
	# Procedure called to update INPUT_DIM when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INPUT_DIM { PARAM_VALUE.INPUT_DIM } {
	# Procedure called to validate INPUT_DIM
	return true
}

proc update_PARAM_VALUE.PARALLEL_NEURONS { PARAM_VALUE.PARALLEL_NEURONS } {
	# Procedure called to update PARALLEL_NEURONS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PARALLEL_NEURONS { PARAM_VALUE.PARALLEL_NEURONS } {
	# Procedure called to validate PARALLEL_NEURONS
	return true
}

proc update_PARAM_VALUE.PIXEL_BITS { PARAM_VALUE.PIXEL_BITS } {
	# Procedure called to update PIXEL_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PIXEL_BITS { PARAM_VALUE.PIXEL_BITS } {
	# Procedure called to validate PIXEL_BITS
	return true
}

proc update_PARAM_VALUE.SPIKE_COUNT_WIDTH { PARAM_VALUE.SPIKE_COUNT_WIDTH } {
	# Procedure called to update SPIKE_COUNT_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SPIKE_COUNT_WIDTH { PARAM_VALUE.SPIKE_COUNT_WIDTH } {
	# Procedure called to validate SPIKE_COUNT_WIDTH
	return true
}

proc update_PARAM_VALUE.TIME_STEPS { PARAM_VALUE.TIME_STEPS } {
	# Procedure called to update TIME_STEPS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TIME_STEPS { PARAM_VALUE.TIME_STEPS } {
	# Procedure called to validate TIME_STEPS
	return true
}


proc update_MODELPARAM_VALUE.HIDDEN_DIM { MODELPARAM_VALUE.HIDDEN_DIM PARAM_VALUE.HIDDEN_DIM } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HIDDEN_DIM}] ${MODELPARAM_VALUE.HIDDEN_DIM}
}

proc update_MODELPARAM_VALUE.INPUT_DIM { MODELPARAM_VALUE.INPUT_DIM PARAM_VALUE.INPUT_DIM } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INPUT_DIM}] ${MODELPARAM_VALUE.INPUT_DIM}
}

proc update_MODELPARAM_VALUE.PIXEL_BITS { MODELPARAM_VALUE.PIXEL_BITS PARAM_VALUE.PIXEL_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PIXEL_BITS}] ${MODELPARAM_VALUE.PIXEL_BITS}
}

proc update_MODELPARAM_VALUE.TIME_STEPS { MODELPARAM_VALUE.TIME_STEPS PARAM_VALUE.TIME_STEPS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TIME_STEPS}] ${MODELPARAM_VALUE.TIME_STEPS}
}

proc update_MODELPARAM_VALUE.PARALLEL_NEURONS { MODELPARAM_VALUE.PARALLEL_NEURONS PARAM_VALUE.PARALLEL_NEURONS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PARALLEL_NEURONS}] ${MODELPARAM_VALUE.PARALLEL_NEURONS}
}

proc update_MODELPARAM_VALUE.AXIS_DATA_WIDTH { MODELPARAM_VALUE.AXIS_DATA_WIDTH PARAM_VALUE.AXIS_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXIS_DATA_WIDTH}] ${MODELPARAM_VALUE.AXIS_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.SPIKE_COUNT_WIDTH { MODELPARAM_VALUE.SPIKE_COUNT_WIDTH PARAM_VALUE.SPIKE_COUNT_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SPIKE_COUNT_WIDTH}] ${MODELPARAM_VALUE.SPIKE_COUNT_WIDTH}
}

