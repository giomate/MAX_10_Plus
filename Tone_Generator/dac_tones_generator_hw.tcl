# TCL File Generated by Component Editor 20.1
# Fri Feb 19 20:41:19 CET 2021
# DO NOT MODIFY


# 
# dac_tones_generator "dac_tones_generator" v1.0
# giovanny 2021.02.19.20:41:19
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module dac_tones_generator
# 
set_module_property DESCRIPTION ""
set_module_property NAME dac_tones_generator
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP Salukat
set_module_property AUTHOR giovanny
set_module_property DISPLAY_NAME dac_tones_generator
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL tone_generator_qip
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file tone_generator_qip.v VERILOG PATH tone_generator_qip.v TOP_LEVEL_FILE
add_fileset_file Sine_Wave.v VERILOG PATH ../Sine_Wave/sine_wave/Sine_Wave.v
add_fileset_file enable_sine_wave.v VERILOG PATH ../Sine_Wave/sine_wave/enable_sine_wave.v
add_fileset_file raw_sine_wave.v VERILOG PATH ../Sine_Wave/sine_wave/raw_sine_wave.v
add_fileset_file DAC16.v VERILOG PATH DAC16.v


# 
# parameters
# 


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clk_in clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset_n reset_n Input 1


# 
# connection point spi_data
# 
add_interface spi_data conduit end
set_interface_property spi_data associatedClock clock
set_interface_property spi_data associatedReset ""
set_interface_property spi_data ENABLED true
set_interface_property spi_data EXPORT_OF ""
set_interface_property spi_data PORT_NAME_MAP ""
set_interface_property spi_data CMSIS_SVD_VARIABLES ""
set_interface_property spi_data SVD_ADDRESS_GROUP ""

add_interface_port spi_data DAC_DATA data Output 1
add_interface_port spi_data DAC_SCLK spi_clk Output 1
add_interface_port spi_data DAC_SYNC_n spi_sync Output 1


# 
# connection point switches
# 
add_interface switches conduit end
set_interface_property switches associatedClock clock
set_interface_property switches associatedReset ""
set_interface_property switches ENABLED true
set_interface_property switches EXPORT_OF ""
set_interface_property switches PORT_NAME_MAP ""
set_interface_property switches CMSIS_SVD_VARIABLES ""
set_interface_property switches SVD_ADDRESS_GROUP ""

add_interface_port switches SW switches_in Input 5


# 
# connection point dac_out
# 
add_interface dac_out conduit end
set_interface_property dac_out associatedClock clock
set_interface_property dac_out associatedReset ""
set_interface_property dac_out ENABLED true
set_interface_property dac_out EXPORT_OF ""
set_interface_property dac_out PORT_NAME_MAP ""
set_interface_property dac_out CMSIS_SVD_VARIABLES ""
set_interface_property dac_out SVD_ADDRESS_GROUP ""

add_interface_port dac_out dac_data_out data_dac Output 16
