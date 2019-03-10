set_global_assignment -entity "ClockGenerator" -library "lib_ClockGenerator" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "ClockGenerator" -library "lib_ClockGenerator" -name IP_TOOL_VERSION "17.1"
set_global_assignment -entity "ClockGenerator" -library "lib_ClockGenerator" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_ClockGenerator" -name SPD_FILE [file join $::quartus(sip_path) "../ClockGenerator.spd"]
set_global_assignment -library "lib_ClockGenerator" -name MISC_FILE [file join $::quartus(sip_path) "../../ClockGenerator.qsys"]

set_global_assignment -library "lib_ClockGenerator" -name MISC_FILE [file join $::quartus(sip_path) "ClockGenerator.v"]
set_global_assignment -library "lib_ClockGenerator" -name MISC_FILE [file join $::quartus(sip_path) "submodules/ClockGenerator_sys_sdram_pll_0.v"]
set_global_assignment -library "lib_ClockGenerator" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_up_avalon_reset_from_locked_signal.v"]
set_global_assignment -library "lib_ClockGenerator" -name MISC_FILE [file join $::quartus(sip_path) "submodules/ClockGenerator_sys_sdram_pll_0_sys_pll.vo"]
