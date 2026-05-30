# ==========================================================================
# DC SDC: Legacy SPI Controller
# Target comparison point: synthesizable AHB-to-SPI controller IP only
# Technology reference: SAED 14nm RVT, same timing budget as XIP variants
# ==========================================================================

set sdc_version 2.1
set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA

# --------------------------------------------------------------------------
# 1. Clock definitions
# --------------------------------------------------------------------------
create_clock -name HCLK -period 20.000 -waveform {0.000 10.000} [get_ports HCLK]

# spi_clk is a forwarded protocol output from this block, not an internal
# capture clock. 

set_clock_uncertainty -setup 0.500 [get_clocks HCLK]
set_clock_uncertainty -hold  0.100 [get_clocks HCLK]
set_clock_transition  0.200 [get_clocks HCLK]

# --------------------------------------------------------------------------
# 2. Reset and non-functional timing exceptions
# --------------------------------------------------------------------------
set_false_path -from [get_ports HRESETn]


# --------------------------------------------------------------------------
# 3. Input delays
# --------------------------------------------------------------------------
set AHB_IN_PORTS  [get_ports {HSEL HADDR HTRANS HWRITE HSIZE HBURST HPROT HMASTER HMASTLOCK HWDATA HREADY}]
set SPI_IN_PORTS  [get_ports {spi_miso}]

set_input_delay -max 8.000 -clock HCLK $AHB_IN_PORTS
set_input_delay -min 1.000 -clock HCLK $AHB_IN_PORTS

# External serial flash return path. Keep the same 8 ns / 1 ns budget used by
# the QSPI variants so the comparison is constrained consistently.
set_input_delay -max 8.000 -clock HCLK $SPI_IN_PORTS
set_input_delay -min 1.000 -clock HCLK $SPI_IN_PORTS

set_input_transition 0.200 $AHB_IN_PORTS
set_input_transition 0.200 $SPI_IN_PORTS
set_input_transition 0.200 [get_ports HRESETn]

# --------------------------------------------------------------------------
# 4. Output delays
# --------------------------------------------------------------------------
set AHB_OUT_PORTS [get_ports {HRDATA HREADYOUT HRESP HSPLIT}]
set SPI_OUT_PORTS [get_ports {spi_clk spi_cs_n spi_mosi}]

set_output_delay -max 8.000 -clock HCLK $AHB_OUT_PORTS
set_output_delay -min 1.000 -clock HCLK $AHB_OUT_PORTS

set_output_delay -max 8.000 -clock HCLK $SPI_OUT_PORTS
set_output_delay -min 1.000 -clock HCLK $SPI_OUT_PORTS

# --------------------------------------------------------------------------
# 5. Environmental rules
# --------------------------------------------------------------------------
set_load 5.000 [all_outputs]
set_max_fanout 32 [current_design]
set_max_transition 1.500 [current_design]
set_max_area 0
