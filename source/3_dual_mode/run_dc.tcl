# ==========================================================================
# Design Compiler synthesis script: Dual-Mode QSPI controller
# Run from: source/3_dual_mode
# ==========================================================================

set DESIGN_NAME "dual_mode_controller"
set TOP_MODULE  "ahb_wrapper"
set RTL_FILES   [list \
    qspi_dual.sv \
    ahb_wrapper_dual.sv \
]

if {[info exists ::env(SAED14_PATH)]} {
    set SAED_PATH $::env(SAED14_PATH)
} else {
    set SAED_PATH "/data/synopsys/lib/saed14nm"
}

set_app_var search_path ". $SAED_PATH/lib/stdcell_rvt/db_nldm"
set_app_var target_library [list "$SAED_PATH/lib/stdcell_rvt/db_nldm/saed14rvt_tt0p8v25c.db"]
set_app_var link_library [concat "*" $target_library]

file mkdir reports
file mkdir outputs

analyze -format sverilog $RTL_FILES
elaborate $TOP_MODULE
current_design $TOP_MODULE
link
uniquify

source dc_constraints.sdc
check_design > reports/${DESIGN_NAME}_check_design.rpt
check_timing > reports/${DESIGN_NAME}_check_timing_precompile.rpt

compile_ultra -gate_clock -no_autoungroup

report_qor > reports/${DESIGN_NAME}_qor.rpt
report_reference -hierarchy > reports/${DESIGN_NAME}_references.rpt
report_timing -delay_type max -max_paths 20 > reports/${DESIGN_NAME}_setup_timing.rpt
report_timing -delay_type min -max_paths 20 > reports/${DESIGN_NAME}_hold_timing.rpt
report_area -hierarchy > reports/${DESIGN_NAME}_area.rpt
report_power -analysis_effort medium > reports/${DESIGN_NAME}_power.rpt
report_constraint -all_violators > reports/${DESIGN_NAME}_constraints.rpt

change_names -rules verilog -hierarchy
set MAPPED_NETLIST "outputs/${DESIGN_NAME}_mapped.v"
write_file -format verilog -hierarchy -output $MAPPED_NETLIST
write_file -format ddc -hierarchy -output outputs/${DESIGN_NAME}.ddc
write_sdc outputs/${DESIGN_NAME}.sdc

set fp [open $MAPPED_NETLIST r]
set netlist_text [read $fp]
close $fp
if {[regexp {\*\*SEQGEN\*\*} $netlist_text]} {
    error "Mapped netlist still contains **SEQGEN**. Re-check RTL edge usage and target_library mapping before running Fusion Compiler."
}

puts "============================================================"
puts "DC SYNTHESIS COMPLETE: $DESIGN_NAME"
puts "Top module: $TOP_MODULE"
puts "============================================================"
