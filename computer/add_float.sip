set_global_assignment -entity "add_float" -library "lib_add_float" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "add_float" -library "lib_add_float" -name IP_TOOL_VERSION "17.1"
set_global_assignment -entity "add_float" -library "lib_add_float" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_add_float" -name SPD_FILE [file join $::quartus(sip_path) "add_float.spd"]

set_global_assignment -library "lib_add_float" -name MISC_FILE [file join $::quartus(sip_path) "add_float_sim/add_float.vo"]
