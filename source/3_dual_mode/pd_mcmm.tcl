#########################################################################
# ICC2 MCMM Physical Design Script: Dual-Mode QSPI Controller
# Run from: source/3_dual_mode after run_dc.tcl
# Fair-comparison settings match legacy SPI and pure XIP scripts.
#########################################################################

set DESIGN_NAME "dual_mode_controller"
set TOP_MODULE  "ahb_wrapper"

if {[info exists ::env(SAED14_PATH)]} {
    set SAED_PATH $::env(SAED14_PATH)
} else {
    set SAED_PATH "/data/synopsys/lib/saed14nm"
}

set NETLIST_FILE "outputs/${DESIGN_NAME}_mapped.v"
set DDC_FILE     "outputs/${DESIGN_NAME}.ddc"
set SDC_FILE     "dc_constraints.sdc"

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

if {[file exists $DDC_FILE] && ![catch {read_ddc $DDC_FILE} ddc_msg]} {
    puts "INFO: Imported DC DDC database: $DDC_FILE"
} else {
    if {[info exists ddc_msg]} {
        puts "INFO: DDC import unavailable or failed: $ddc_msg"
    }
    set fp [open $NETLIST_FILE r]
    set netlist_text [read $fp]
    close $fp
    if {[regexp {\*\*SEQGEN\*\*} $netlist_text]} {
        error "Mapped Verilog contains **SEQGEN** unresolved sequential cells. Re-run run_dc.tcl after the RTL/DC script updates before running Fusion Compiler."
    }
    puts "INFO: Falling back to mapped Verilog import: $NETLIST_FILE"
    read_verilog $NETLIST_FILE
}
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

# =========================================================================
# FLOORPLAN & POWER GRID: "Tiny Macro" Strategy with Pin Spreading
# =========================================================================
# 1. 2-micron halo to keep standard cells safely inside the boundary
initialize_floorplan -core_utilization 0.40 -shape R -side_ratio {1.0 1.0} -core_offset {2.0 2.0 2.0 2.0}

# 2. Restrict the router to M1-M5 (Prevents M8/M9/MRDL via DRCs on tiny blocks)
set_ignored_layers -max_routing_layer M5

# 3. High-Density Pin Placement: Spread pins across M2, M3, and M4 on-grid!
set signal_ports [get_ports * -filter "name !~ VDD && name !~ VSS"]
set_block_pin_constraints -allowed_layers {M2 M3 M4}
place_pins -ports $signal_ports

create_net -power VDD
create_net -ground VSS
connect_pg_net -net VDD [get_pins -hierarchical */VDD]
connect_pg_net -net VSS [get_pins -hierarchical */VSS]

remove_pg_strategies -all
remove_pg_patterns -all

# 4. Use M1 rails for power. No upper-metal mesh to eliminate off-grid DRCs.
create_pg_std_cell_conn_pattern rail_pat -layers {M1}
set_pg_strategy rail_strat -core -pattern {{name: rail_pat} {nets: {VDD VSS}}}

compile_pg -strategies rail_strat
check_pg_connectivity
# =========================================================================

place_opt
set_clock_tree_options -target_skew 0.1 -target_latency 0.5
clock_opt
route_auto
route_opt

create_stdcell_fillers -lib_cells [get_lib_cells */*FILL*]
connect_pg_net -automatic

if {[catch {route_detail -incremental true -initial_drc_from_input true} drc_msg]} {
    puts "INFO: Incremental detail-route DRC cleanup is unavailable: $drc_msg"
}
if {[catch {route_opt -incremental true} route_opt_msg]} {
    puts "INFO: Incremental route optimization is unavailable: $route_opt_msg"
}

file mkdir outputs_mcmm
write_verilog -hierarchy all outputs_mcmm/${DESIGN_NAME}_final.v
write_gds outputs_mcmm/${DESIGN_NAME}_final.gds
write_sdc -output outputs_mcmm/${DESIGN_NAME}_final.sdc

report_qor -scenarios [all_scenarios] > outputs_mcmm/${DESIGN_NAME}_mcmm_qor.rpt
report_timing -scenario func_ss -delay_type max -max_paths 20 > outputs_mcmm/${DESIGN_NAME}_mcmm_setup.rpt
report_timing -scenario func_ff -delay_type min -max_paths 20 > outputs_mcmm/${DESIGN_NAME}_mcmm_hold.rpt
report_clock_qor -scenario func_ff > outputs_mcmm/${DESIGN_NAME}_mcmm_clock.rpt
report_constraint -all_violators -scenarios [all_scenarios] > outputs_mcmm/${DESIGN_NAME}_mcmm_constraints.rpt
check_routes > outputs_mcmm/${DESIGN_NAME}_mcmm_routes.rpt

puts "============================================================"
puts "MCMM PHYSICAL DESIGN COMPLETE: $DESIGN_NAME"
puts "============================================================"
