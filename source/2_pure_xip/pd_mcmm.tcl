#########################################################################
# ICC2 MCMM Physical Design Script: Pure XIP QSPI Controller
# Run from: source/2_pure_xip after run_dc.tcl
# Fair-comparison settings match legacy SPI and dual-mode scripts.
#########################################################################

set DESIGN_NAME "pure_xip_controller"
set TOP_MODULE  "ahb_wrapper"

if {[info exists ::env(SAED14_PATH)]} {
    set SAED_PATH $::env(SAED14_PATH)
} else {
    set SAED_PATH "/data/synopsys/lib/saed14nm"
}

set NETLIST_FILE "outputs/${DESIGN_NAME}_mapped.v"
set SDC_FILE     "outputs/${DESIGN_NAME}.sdc"

set search_path ". $SAED_PATH/lib/stdcell_rvt/db_nldm $SAED_PATH/lib/stdcell_rvt/ndm"
set target_library "saed14rvt_tt0p8v25c.db"
set link_library "* $target_library"

set tech_file        "$SAED_PATH/lib/tech/milkyway/saed14nm_1p9m_mw.tf"
set physical_library "$SAED_PATH/lib/stdcell_rvt/ndm/saed14rvt_frame_timing_ccs.ndm"

set tlup_max "$SAED_PATH/lib/tech/star_rc/max/saed14nm_1p9m_Cmax.tluplus"
set tlup_min "$SAED_PATH/lib/tech/star_rc/min/saed14nm_1p9m_Cmin.tluplus"

close_lib -all
file delete -force ${DESIGN_NAME}_mcmm.nlib
create_lib ${DESIGN_NAME}_mcmm.nlib -technology $tech_file -ref_libs $physical_library

read_verilog $NETLIST_FILE
link_block
current_block $TOP_MODULE

read_parasitic_tech -tlup $tlup_max -name max_tlup
read_parasitic_tech -tlup $tlup_min -name min_tlup

create_mode func_mode
create_corner ss_corner
create_corner ff_corner

set_parasitic_parameters -corner ss_corner -early_spec max_tlup -late_spec max_tlup
set_parasitic_parameters -corner ff_corner -early_spec min_tlup -late_spec min_tlup

create_scenario -name func_ss -mode func_mode -corner ss_corner
create_scenario -name func_ff -mode func_mode -corner ff_corner

current_mode func_mode
read_sdc $SDC_FILE

set_scenario_status func_ss -active true -setup true  -hold false -leakage_power true
set_scenario_status func_ff -active true -setup false -hold true  -leakage_power false

initialize_floorplan -core_utilization 0.70 -shape R -side_ratio {1.0 1.0}
place_pins -ports *

create_net -power VDD
create_net -ground VSS
connect_pg_net -net VDD [get_pins -hierarchical */VDD]
connect_pg_net -net VSS [get_pins -hierarchical */VSS]

remove_pg_strategies -all
remove_pg_patterns -all

create_pg_std_cell_conn_pattern rail_pat -layers {M1}
set_pg_strategy rail_strat -core -pattern {{name: rail_pat} {nets: {VDD VSS}}}

create_pg_mesh_pattern mesh_pat -layers { \
    { {vertical_layer: M6} {width: 0.4} {spacing: 0.4} {pitch: 3.0} } \
    { {horizontal_layer: M7} {width: 0.4} {spacing: 0.4} {pitch: 3.0} } \
}
set_pg_strategy mesh_strat -core -pattern {{name: mesh_pat} {nets: {VDD VSS}}}

compile_pg -strategies rail_strat
compile_pg -strategies mesh_strat
check_pg_connectivity

set_app_options -name route_opt.flow.enable_hold -value true

place_opt
set_clock_tree_options -target_skew 0.1 -target_latency 0.5
clock_opt
route_auto
route_opt

create_stdcell_fillers -lib_cells [get_lib_cells */*FILL*]
connect_pg_net -automatic

file mkdir outputs_mcmm
write_verilog -hierarchy outputs_mcmm/${DESIGN_NAME}_final.v
write_gds outputs_mcmm/${DESIGN_NAME}_final.gds
write_sdc outputs_mcmm/${DESIGN_NAME}_final.sdc

report_qor -scenarios [all_scenarios] > outputs_mcmm/${DESIGN_NAME}_mcmm_qor.rpt
report_timing -scenario func_ss -delay_type max -max_paths 20 > outputs_mcmm/${DESIGN_NAME}_mcmm_setup.rpt
report_timing -scenario func_ff -delay_type min -max_paths 20 > outputs_mcmm/${DESIGN_NAME}_mcmm_hold.rpt
report_clock_qor -scenario func_ff > outputs_mcmm/${DESIGN_NAME}_mcmm_clock.rpt
report_constraint -all_violators -scenarios [all_scenarios] > outputs_mcmm/${DESIGN_NAME}_mcmm_constraints.rpt
check_routes > outputs_mcmm/${DESIGN_NAME}_mcmm_routes.rpt

puts "============================================================"
puts "MCMM PHYSICAL DESIGN COMPLETE: $DESIGN_NAME"
puts "============================================================"

