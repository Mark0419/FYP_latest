# ==========================================================================
# DC SDC: Pure XIP QSPI Controller
# Target comparison point: synthesizable AHB-to-QSPI read/XIP controller IP
# Technology reference: SAED 14nm RVT, same timing budget as other variants
# ==========================================================================

set sdc_version 2.1
set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA

create_clock -name HCLK -period 20.000 -waveform {0.000 10.000} [get_ports HCLK]

create_generated_clock -name QSPI_CLK \
    -source [get_ports HCLK] \
    -divide_by 1 \
    [get_ports qspi_clk]

set_clock_uncertainty -setup 0.500 [get_clocks HCLK]
set_clock_uncertainty -hold  0.100 [get_clocks HCLK]
set_clock_transition  0.200 [get_clocks HCLK]

set_clock_uncertainty -setup 0.500 [get_clocks QSPI_CLK]
set_clock_uncertainty -hold  0.100 [get_clocks QSPI_CLK]

set_false_path -from [get_ports HRESETn]
set_dont_touch_network [get_ports HRESETn]

set AHB_IN_PORTS  [get_ports {HSEL HADDR HTRANS HWRITE HWDATA HREADY}]
set QSPI_IN_PORTS [get_ports {qspi_data_in}]

set_input_delay -max 8.000 -clock HCLK $AHB_IN_PORTS
set_input_delay -min 1.000 -clock HCLK $AHB_IN_PORTS
set_input_delay -max 8.000 -clock HCLK $QSPI_IN_PORTS
set_input_delay -min 1.000 -clock HCLK $QSPI_IN_PORTS

set_input_transition 0.200 [remove_from_collection [all_inputs] [get_ports HCLK]]

set AHB_OUT_PORTS  [get_ports {HRDATA HREADYOUT HRESP}]
set QSPI_OUT_PORTS [get_ports {qspi_cs_n qspi_data_out qspi_data_oen}]

set_output_delay -max 8.000 -clock HCLK $AHB_OUT_PORTS
set_output_delay -min 1.000 -clock HCLK $AHB_OUT_PORTS

# qspi_clk is constrained as a generated clock, not as a data output.
set_output_delay -max 8.000 -clock HCLK $QSPI_OUT_PORTS
set_output_delay -min 1.000 -clock HCLK $QSPI_OUT_PORTS

set_load 5.000 [all_outputs]
set_max_fanout 32 [current_design]
set_max_transition 1.500 [current_design]
set_max_area 0

