set_global_assignment -entity "conv_fixed16ToHalf" -library "lib_conv_fixed16ToHalf" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "conv_fixed16ToHalf" -library "lib_conv_fixed16ToHalf" -name IP_TOOL_VERSION "17.1"
set_global_assignment -entity "conv_fixed16ToHalf" -library "lib_conv_fixed16ToHalf" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_conv_fixed16ToHalf" -name SPD_FILE [file join $::quartus(sip_path) "conv_fixed16ToHalf.spd"]

set_global_assignment -library "lib_conv_fixed16ToHalf" -name MISC_FILE [file join $::quartus(sip_path) "conv_fixed16ToHalf_sim/conv_fixed16ToHalf.vo"]
