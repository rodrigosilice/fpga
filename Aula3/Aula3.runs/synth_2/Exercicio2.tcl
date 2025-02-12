# 
# Synthesis run script generated by Vivado
# 

  set_param gui.test TreeTableDev
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1
set_property target_language VHDL [current_project]
set_param project.compositeFile.enableAutoGeneration 0
set_property default_lib xil_defaultlib [current_project]
read_vhdl -library xil_defaultlib T:/Rodrigo/fpga/Aula3/Aula3.srcs/sources_1/new/Exercicio2.vhd
read_xdc T:/Rodrigo/fpga/Aula3/Aula3.srcs/constrs_1/imports/Problemas/io_basico.xdc
set_property used_in_implementation false [get_files T:/Rodrigo/fpga/Aula3/Aula3.srcs/constrs_1/imports/Problemas/io_basico.xdc]

set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir T:/Rodrigo/fpga/Aula3/Aula3.cache/wt [current_project]
set_property parent.project_dir T:/Rodrigo/fpga/Aula3 [current_project]
synth_design -top Exercicio2 -part xc7a100tcsg324-1
write_checkpoint Exercicio2.dcp
report_utilization -file Exercicio2_utilization_synth.rpt -pb Exercicio2_utilization_synth.pb
