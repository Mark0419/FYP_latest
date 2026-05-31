################################################################################
#
# Design name:  ahb_wrapper
#
# Created by fc write_sdc on Sun May 31 03:34:46 2026
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

# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 10
create_clock -name HCLK -period 20 -waveform {0 10} [get_ports {HCLK}]
set_propagated_clock [get_clocks {HCLK}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 19
set_false_path -from [get_ports {HRESETn}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 49
set_false_path -hold -from [get_cells {u_core/state_reg_2_ u_core/state_reg_3_ \
    u_core/state_reg_1_ u_core/state_reg_0_}]
set_load -pin_load 5 [get_ports {HRDATA[31]}]
set_load -pin_load 5 [get_ports {HRDATA[30]}]
set_load -pin_load 5 [get_ports {HRDATA[29]}]
set_load -pin_load 5 [get_ports {HRDATA[28]}]
set_load -pin_load 5 [get_ports {HRDATA[27]}]
set_load -pin_load 5 [get_ports {HRDATA[26]}]
set_load -pin_load 5 [get_ports {HRDATA[25]}]
set_load -pin_load 5 [get_ports {HRDATA[24]}]
set_load -pin_load 5 [get_ports {HRDATA[23]}]
set_load -pin_load 5 [get_ports {HRDATA[22]}]
set_load -pin_load 5 [get_ports {HRDATA[21]}]
set_load -pin_load 5 [get_ports {HRDATA[20]}]
set_load -pin_load 5 [get_ports {HRDATA[19]}]
set_load -pin_load 5 [get_ports {HRDATA[18]}]
set_load -pin_load 5 [get_ports {HRDATA[17]}]
set_load -pin_load 5 [get_ports {HRDATA[16]}]
set_load -pin_load 5 [get_ports {HRDATA[15]}]
set_load -pin_load 5 [get_ports {HRDATA[14]}]
set_load -pin_load 5 [get_ports {HRDATA[13]}]
set_load -pin_load 5 [get_ports {HRDATA[12]}]
set_load -pin_load 5 [get_ports {HRDATA[11]}]
set_load -pin_load 5 [get_ports {HRDATA[10]}]
set_load -pin_load 5 [get_ports {HRDATA[9]}]
set_load -pin_load 5 [get_ports {HRDATA[8]}]
set_load -pin_load 5 [get_ports {HRDATA[7]}]
set_load -pin_load 5 [get_ports {HRDATA[6]}]
set_load -pin_load 5 [get_ports {HRDATA[5]}]
set_load -pin_load 5 [get_ports {HRDATA[4]}]
set_load -pin_load 5 [get_ports {HRDATA[3]}]
set_load -pin_load 5 [get_ports {HRDATA[2]}]
set_load -pin_load 5 [get_ports {HRDATA[1]}]
set_load -pin_load 5 [get_ports {HRDATA[0]}]
set_load -pin_load 5 [get_ports {HREADYOUT}]
set_load -pin_load 5 [get_ports {HRESP[1]}]
set_load -pin_load 5 [get_ports {HRESP[0]}]
set_load -pin_load 5 [get_ports {qspi_cs_n}]
set_load -pin_load 5 [get_ports {qspi_clk}]
set_load -pin_load 5 [get_ports {qspi_data_oen}]
set_load -pin_load 5 [get_ports {qspi_data_out[3]}]
set_load -pin_load 5 [get_ports {qspi_data_out[2]}]
set_load -pin_load 5 [get_ports {qspi_data_out[1]}]
set_load -pin_load 5 [get_ports {qspi_data_out[0]}]
# Warning: Libcell power domain derates are skipped!

# Set latency for io paths.
# -origin useful_skew
set_clock_latency 0.518131 [get_clocks {HCLK}]
# Set propagated on clock sources to avoid removing latency for IO paths.
set_propagated_clock  [get_ports {HCLK}]
set_clock_uncertainty -setup 0.5 [get_clocks {HCLK}]
set_clock_uncertainty -hold 0.1 [get_clocks {HCLK}]
set_clock_transition 0.2 [get_clocks {HCLK}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 32
set_input_transition 0.2 [get_ports {HRESETn}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HSEL}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HREADY}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[31]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[30]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[29]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[28]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[27]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[26]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[25]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[24]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[23]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[22]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[21]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[20]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[19]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[18]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[17]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[16]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[15]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[14]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[13]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[12]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[11]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[10]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[9]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[8]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[7]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[6]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[5]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[4]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[3]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[2]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HADDR[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[31]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[30]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[29]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[28]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[27]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[26]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[25]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[24]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[23]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[22]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[21]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[20]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[19]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[18]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[17]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[16]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[15]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[14]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[13]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[12]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[11]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[10]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[9]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[8]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[7]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[6]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[5]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[4]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[3]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[2]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWDATA[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HTRANS[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HTRANS[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 30
set_input_transition 0.2 [get_ports {HWRITE}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 31
set_input_transition 0.2 [get_ports {qspi_data_in[3]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 31
set_input_transition 0.2 [get_ports {qspi_data_in[2]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 31
set_input_transition 0.2 [get_ports {qspi_data_in[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 31
set_input_transition 0.2 [get_ports {qspi_data_in[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HSEL}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HSEL}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HREADY}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HREADY}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[31]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[31]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[30]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[30]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[29]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[29]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[28]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[28]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[27]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[27]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[26]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[26]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[25]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[25]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[24]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[24]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[23]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[23]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[22]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[22]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[21]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[21]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[20]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[20]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[19]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[19]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[18]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[18]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[17]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[17]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[16]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[16]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[15]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[15]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[14]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[14]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[13]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[13]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[12]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[12]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[11]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[11]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[10]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[10]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[9]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[9]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[8]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[8]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[7]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[7]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[6]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[6]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[5]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[5]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[4]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[4]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[3]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[3]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[2]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[2]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[1]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[0]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[31]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[31]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[30]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[30]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[29]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[29]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[28]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[28]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[27]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[27]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[26]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[26]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[25]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[25]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[24]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[24]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[23]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[23]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[22]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[22]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[21]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[21]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[20]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[20]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[19]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[19]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[18]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[18]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[17]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[17]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[16]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[16]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[15]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[15]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[14]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[14]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[13]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[13]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[12]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[12]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[11]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[11]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[10]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[10]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[9]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[9]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[8]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[8]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[7]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[7]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[6]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[6]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[5]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[5]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[4]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[4]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[3]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[3]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[2]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[2]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[1]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[0]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HTRANS[1]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HTRANS[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HTRANS[0]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HTRANS[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 24; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 25
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWRITE}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWRITE}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[31]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[31]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[30]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[30]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[29]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[29]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[28]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[28]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[27]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[27]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[26]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[26]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[25]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[25]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[24]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[24]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[23]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[23]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[22]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[22]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[21]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[21]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[20]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[20]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[19]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[19]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[18]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[18]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[17]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[17]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[16]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[16]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[15]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[15]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[14]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[14]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[13]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[13]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[12]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[12]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[11]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[11]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[10]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[10]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[9]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[9]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[8]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[8]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[7]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[7]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[6]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[6]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[5]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[5]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[4]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[4]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[3]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[3]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[2]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[2]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[1]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[0]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HREADYOUT}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HREADYOUT}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRESP[1]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRESP[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 37; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 38
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRESP[0]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRESP[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 40; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 41
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {qspi_cs_n}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {qspi_cs_n}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 40; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 41
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {qspi_clk}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {qspi_clk}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 40; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 41
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {qspi_data_oen}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {qspi_data_oen}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 40; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 41
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports \
    {qspi_data_out[3]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports \
    {qspi_data_out[3]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 40; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 41
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports \
    {qspi_data_out[2]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports \
    {qspi_data_out[2]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 40; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 41
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports \
    {qspi_data_out[1]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports \
    {qspi_data_out[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 40; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 41
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports \
    {qspi_data_out[0]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports \
    {qspi_data_out[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 26; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 27
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {qspi_data_in[3]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {qspi_data_in[3]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 26; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 27
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {qspi_data_in[2]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {qspi_data_in[2]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 26; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 27
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {qspi_data_in[1]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {qspi_data_in[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 26; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/dc_constraints.sdc, \
#   line 27
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {qspi_data_in[0]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {qspi_data_in[0]}]
set_max_transition 1.5 [current_design]
