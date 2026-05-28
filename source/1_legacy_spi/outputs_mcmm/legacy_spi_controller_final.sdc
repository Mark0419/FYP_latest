################################################################################
#
# Design name:  ahb_spi_legacy
#
# Created by fc write_sdc on Thu May 28 18:10:16 2026
#
################################################################################

set sdc_version 2.1
set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA

################################################################################
#
# Units
# time_unit               : 1e-09
# resistance_unit         : 1000000
# capacitive_load_unit    : 1e-15
# voltage_unit            : 1
# current_unit            : 1e-06
# power_unit              : 1e-12
################################################################################


# Mode: func_mode
# Corner: ff_corner
# Scenario: func_ff

# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/dc_constraints.sdc, \
#   line 13
create_clock -name HCLK -period 20 -waveform {0 10} [get_ports {HCLK}]
set_propagated_clock [get_clocks {HCLK}]
# Warning: Libcell power domain derates are skipped!

# Set latency for io paths.
# -origin user
set_clock_latency 0.502968 [get_clocks {HCLK}]
# Set propagated on clock sources to avoid removing latency for IO paths.
set_propagated_clock  [get_ports {HCLK}]
