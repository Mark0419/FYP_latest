#########################################################################
# FULL MCMM IMPLEMENTATION SCRIPT: flash_controller
# Target Technology: SAED 14nm FinFET
# Project: ARM-Based SoC Flash Controller IP (UTM FYP)
#########################################################################

# =========================================================================
# 1. ENVIRONMENT & LIBRARY SETUP
# =========================================================================
set DESIGN_NAME "flash_controller"
set SAED_PATH   "/data/synopsys/lib/saed14nm"

# Logical and Physical Libraries
set search_path    ". $SAED_PATH/lib/stdcell_rvt/db_nldm $SAED_PATH/lib/stdcell_rvt/ndm"
set target_library "saed14rvt_tt0p8v25c.db"
set link_library    "* $target_library"

# Verified Physical Paths
set tech_file        "$SAED_PATH/lib/tech/milkyway/saed14nm_1p9m_mw.tf"
set physical_library "$SAED_PATH/lib/stdcell_rvt/ndm/saed14rvt_frame_timing_ccs.ndm"

# TLU+ Parasitic Paths
set tlup_max "$SAED_PATH/lib/tech/star_rc/max/saed14nm_1p9m_Cmax.tluplus"
set tlup_min "$SAED_PATH/lib/tech/star_rc/min/saed14nm_1p9m_Cmin.tluplus"

# Clean and Create Workspace
close_lib -all
file delete -force ${DESIGN_NAME}_mcmm.nlib
create_lib ${DESIGN_NAME}_mcmm.nlib -technology $tech_file -ref_libs $physical_library

# =========================================================================
# 2. RTL INGESTION
# =========================================================================
# Ensure your filenames match your SV source files
analyze -format sverilog {sync_fifo_full.sv qspi_core_full.sv ahb_wrapper_full.sv}
elaborate $DESIGN_NAME
set_top_module $DESIGN_NAME
link_block

# =========================================================================
# 3. MCMM PARASITIC BINDING (Surgical Fix for NEX-018)
# =========================================================================
read_parasitic_tech -tlup $tlup_max -name max_tlup
read_parasitic_tech -tlup $tlup_min -name min_tlup

# =========================================================================
# 4. SCENARIO CREATION
# =========================================================================
create_mode func_mode

create_corner ss_corner ;# Slow Silicon (Setup)
create_corner ff_corner ;# Fast Silicon (Hold)

# Explicitly bind Early/Late specs to ensure extraction calculates wire RC
set_parasitic_parameters -corner ss_corner -early_spec max_tlup -late_spec max_tlup
set_parasitic_parameters -corner ff_corner -early_spec min_tlup -late_spec min_tlup

create_scenario -name func_ss -mode func_mode -corner ss_corner
create_scenario -name func_ff -mode func_mode -corner ff_corner

# Apply logical constraints
current_mode func_mode
create_clock -period 20.0 -name HCLK [get_ports HCLK]
read_sdc dc_constraint_fifo.sdc

# Optimization Status
set_scenario_status func_ss -active true -setup true -hold false -leakage_power true
set_scenario_status func_ff -active true -setup false -hold true -leakage_power false

# =========================================================================
# 5. FLOORPLANNING & POWER (Your Original Micro-Mesh)
# =========================================================================
initialize_floorplan -core_utilization 0.7 -shape R -side_ratio {1.0 1.0}
place_pins -ports *

create_net -power VDD
create_net -ground VSS
connect_pg_net -net VDD [get_pins -hierarchical */VDD]
connect_pg_net -net VSS [get_pins -hierarchical */VSS]

remove_pg_strategies -all
remove_pg_patterns -all

# M1 Rails
create_pg_std_cell_conn_pattern rail_pat -layers {M1}
set_pg_strategy rail_strat -core -pattern {{name: rail_pat} {nets: {VDD VSS}}}

# M6/M7 Micro-Mesh
create_pg_mesh_pattern mesh_pat -layers { \
    { {vertical_layer: M6} {width: 0.4} {spacing: 0.4} {pitch: 3.0} } \
    { {horizontal_layer: M7} {width: 0.4} {spacing: 0.4} {pitch: 3.0} } \
}
set_pg_strategy mesh_strat -core -pattern {{name: mesh_pat} {nets: {VDD VSS}}}

compile_pg -strategies rail_strat
compile_pg -strategies mesh_strat
check_pg_connectivity

# =========================================================================
# 6. IMPLEMENTATION ENGINES (Your Original Settings)
# =========================================================================
# Use the global hold-fix app option to ensure FF scenario is optimized
set_app_options -name route_opt.flow.enable_hold -value true

place_opt

# Reverted to your original CTS targets
set_clock_tree_options -target_skew 0.1 -target_latency 0.5
clock_opt

route_auto
route_opt

# =========================================================================
# 7. EXPORT & REPORTING
# =========================================================================
create_stdcell_fillers -lib_cells [get_lib_cells */*FILL*]
connect_pg_net -automatic

# Note: signoff_create_metal_fill may require an ICV license to run successfully
# signoff_create_metal_fill -auto_eco true

file mkdir outputs_mcmm
write_verilog -hierarchy outputs_mcmm/${DESIGN_NAME}_final.v
write_gds outputs_mcmm/${DESIGN_NAME}_final.gds

# Reports for your UTM Presentation/Report
report_qor -scenarios [all_scenarios] > outputs_mcmm/mcmm_qor_summary.rpt
report_timing -scenario func_ss -delay_type max > outputs_mcmm/mcmm_setup.rpt
report_timing -scenario func_ff -delay_type min > outputs_mcmm/mcmm_hold.rpt
report_clock_qor -scenario func_ff > outputs_mcmm/mcmm_clock.rpt
check_routes > outputs_mcmm/mcmm_routes.rpt

puts "===================================================="
puts "  MCMM PHYSICAL DESIGN COMPLETE: $DESIGN_NAME"
puts "===================================================="
