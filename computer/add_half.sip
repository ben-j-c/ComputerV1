set_global_assignment -entity "add_half" -library "lib_add_half" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "add_half" -library "lib_add_half" -name IP_TOOL_VERSION "17.1"
set_global_assignment -entity "add_half" -library "lib_add_half" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_add_half" -name SPD_FILE [file join $::quartus(sip_path) "add_half.spd"]

set_global_assignment -library "lib_add_half" -name MISC_FILE [file join $::quartus(sip_path) "add_half_sim/add_half.vo"]
