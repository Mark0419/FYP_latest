# Logic Synthesis and MCMM Physical Design Constraints

These files prepare the three flash-controller architectures for a fair Design
Compiler and ICC2 comparison using the same SAED 14nm setup.

## Architecture directories

Each architecture directory contains:

- `dc_constraints.sdc`: timing/environment constraints for Design Compiler.
- `run_dc.tcl`: synthesis script that reads RTL, applies the SDC, compiles, and
  writes `outputs/<design>_mapped.v`, `<design>.ddc`, and `<design>.sdc`.
- `pd_mcmm.tcl`: ICC2 MCMM physical-design script that imports the DC netlist
  and SDC, creates setup/hold scenarios, floorplans, places, CTS-routes, and
  writes reports under `outputs_mcmm`.

## Fair-comparison assumptions

All three architectures use the same:

- HCLK period: 20 ns, equivalent to 50 MHz.
- HCLK waveform: 50 percent duty cycle.
- Setup clock uncertainty: 0.5 ns.
- Hold clock uncertainty: 0.1 ns.
- Input delay budget: max 8 ns, min 1 ns.
- Output delay budget: max 8 ns, min 1 ns.
- Output load: 5 fF.
- Max fanout: 32.
- Max transition: 1.5 ns.
- Physical floorplan utilization: 70 percent.
- Physical floorplan shape: square, side ratio 1:1.
- Power grid style: M1 rails plus M6/M7 micro-mesh.
- MCMM scenarios: setup scenario with max TLU+ and hold scenario with min TLU+.

Only the protocol-specific pins differ:

- Legacy SPI uses `spi_clk`, `spi_cs_n`, `spi_mosi`, and `spi_miso`.
- Pure XIP and dual-mode use `qspi_clk`, `qspi_cs_n`, `qspi_data_out`,
  `qspi_data_oen`, and `qspi_data_in`.

## Library path

The scripts default to:

```tcl
/data/synopsys/lib/saed14nm
```

If your EDA machine uses another mount point, set this before running DC/ICC2:

```bash
export SAED14_PATH=/path/to/saed14nm
```

## Suggested run order

From each architecture directory:

```bash
dc_shell -f run_dc.tcl
icc2_shell -f pd_mcmm.tcl
```

The constraints target the synthesizable controller IP only, not the Cortex-M3,
testbench, boot ROM, flash model, or behavioral SRAM model. This keeps area,
timing, and power comparisons focused on the flash-access controller logic.

