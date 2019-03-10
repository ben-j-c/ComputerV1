set_global_assignment -entity "castInt_half" -library "lib_castInt_half" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "castInt_half" -library "lib_castInt_half" -name IP_TOOL_VERSION "17.1"
set_global_assignment -entity "castInt_half" -library "lib_castInt_half" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_castInt_half" -name SPD_FILE [file join $::quartus(sip_path) "castInt_half.spd"]

set_global_assignment -library "lib_castInt_half" -name MISC_FILE [file join $::quartus(sip_path) "castInt_half_sim/castInt_half.vo"]
