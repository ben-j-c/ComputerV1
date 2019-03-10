set_global_assignment -entity "div_half" -library "lib_div_half" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "div_half" -library "lib_div_half" -name IP_TOOL_VERSION "17.1"
set_global_assignment -entity "div_half" -library "lib_div_half" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_div_half" -name SPD_FILE [file join $::quartus(sip_path) "div_half.spd"]

set_global_assignment -library "lib_div_half" -name MISC_FILE [file join $::quartus(sip_path) "div_half_sim/div_half_memoryC0_uid146_invTables_lutmem.hex"]
set_global_assignment -library "lib_div_half" -name MISC_FILE [file join $::quartus(sip_path) "div_half_sim/div_half_memoryC1_uid149_invTables_lutmem.hex"]
set_global_assignment -library "lib_div_half" -name MISC_FILE [file join $::quartus(sip_path) "div_half_sim/div_half.vo"]
