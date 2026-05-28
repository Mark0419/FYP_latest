# ============================================
# Logic Synthesis Script for SAED 14nm (fc_shell / dc_shell)
# ============================================

# 1. Setup Library Files
# Best practice is to use set_app_var for system variables
set_app_var target_library "/data/synopsys/lib/saed14nm/lib/stdcell_rvt/db_nldm/saed14rvt_tt0p8v25c.db"
set_app_var link_library "* $target_library"

# 2. Analyze and Elaborate SystemVerilog Files
# analyze/elaborate perfectly handles parameters and SystemVerilog constructs
analyze -format sverilog {sync_fifo_full.sv qspi_core_full.sv ahb_wrapper_full.sv}
elaborate ahb_wrapper

# 3. Set Top Level and Link
current_design ahb_wrapper
link

# 4. Create Clocks & Constraints
# Define the clock FIRST so the SDC can apply setup/hold constraints to it
create_clock -period 20.0 -name HCLK [get_ports HCLK]
read_sdc dc_constraint_fifo.sdc

# 5. Compile
# -gate_clock will automatically insert Integrated Clock Gating (ICG) cells for your FIFOs
compile_ultra -gate_clock -no_autoungroup -retime

# 6. Generate Reports
file mkdir reports
report_timing -max_paths 10 > reports/timing_report.txt
report_area -hierarchy > reports/area_report.txt
report_power -analysis_effort medium > reports/power_report.txt

# 7. Save Final Database & Netlists
file mkdir outputs
write_file -format verilog -hierarchy -output outputs/ahb_qspi_final.v
write_sdc outputs/ahb_qspi_final.sdc
write_file -format ddc -hierarchy -output outputs/ahb_qspi_final.ddc

puts "SYNTHESIS COMPLETE"
