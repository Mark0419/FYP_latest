# ==========================================================================
# INPUT CONSTRAINTS: AHB-LITE QUAD-SPI FLASH CONTROLLER (FIFO UPGRADED)
# ==========================================================================

set sdc_version 2.1
set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA

# --------------------------------------------------------------------------
# 1. CLOCK DEFINITIONS
# --------------------------------------------------------------------------
# Define the main 50 MHz AHB clock
create_clock -name HCLK -period 20.0 -waveform {0 10} [get_ports HCLK]

# --- NEW: Define the gated QSPI clock ---
# Tells DC that qspi_clk is derived from HCLK and acts as a clock for external logic
create_generated_clock -name QSPI_CLK -source [get_ports HCLK] -divide_by 1 [get_ports qspi_clk]

# Model realistic clock tree imperfections (jitter + skew)
set_clock_uncertainty -setup 0.5 [get_clocks HCLK]
set_clock_uncertainty -hold  0.1 [get_clocks HCLK]
set_clock_transition  0.2        [get_clocks HCLK]

set_clock_uncertainty -setup 0.5 [get_clocks QSPI_CLK]
set_clock_uncertainty -hold  0.1 [get_clocks QSPI_CLK]

# --------------------------------------------------------------------------
# 2. FALSE PATHS
# --------------------------------------------------------------------------
# The reset pin is asynchronous, do not optimize it for timing
set_false_path -from [get_ports HRESETn]

# --------------------------------------------------------------------------
# 3. INPUT DELAYS (Setup & Hold)
# --------------------------------------------------------------------------
# AHB Inputs
set_input_delay -max 8.0 -clock HCLK [get_ports {HADDR HSEL HREADY HTRANS HWRITE HWDATA}]
set_input_delay -min 1.0 -clock HCLK [get_ports {HADDR HSEL HREADY HTRANS HWRITE HWDATA}]

# QSPI Inputs (Returning from Flash)
set_input_delay -max 8.0 -clock HCLK [get_ports qspi_data_in]
set_input_delay -min 1.0 -clock HCLK [get_ports qspi_data_in]

# --------------------------------------------------------------------------
# 4. OUTPUT DELAYS (Setup & Hold)
# --------------------------------------------------------------------------
# AHB Outputs (Leaving the wrapper)
set_output_delay -max 8.0 -clock HCLK [get_ports {HREADYOUT HRESP HRDATA}]
set_output_delay -min 1.0 -clock HCLK [get_ports {HREADYOUT HRESP HRDATA}]

# QSPI Outputs (Driving to the pad ring)
# Note: qspi_clk is excluded here because it is a clock port, not a data port.
set_output_delay -max 8.0 -clock HCLK [get_ports {qspi_cs_n qspi_data_out qspi_data_oen}]
set_output_delay -min 1.0 -clock HCLK [get_ports {qspi_cs_n qspi_data_out qspi_data_oen}]

# --------------------------------------------------------------------------
# 5. ENVIRONMENTAL RULES (DRIVE & LOAD)
# --------------------------------------------------------------------------
# Attach a standard 5.0fF physical load to all outputs
set_load 5.0 [all_outputs]

# Prevent DC from building massive, unroutable logic trees
set_max_fanout 32 [current_design]

# Keep signal edges sharp to prevent power leakage
set_max_transition 1.5 [current_design]
