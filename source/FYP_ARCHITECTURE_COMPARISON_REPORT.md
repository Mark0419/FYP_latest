# Flash Controller Architecture Comparison Report

Date: 2026-05-28

## Executive Summary

Three flash-access controller architectures were evaluated under the same SAED 14 nm RVT synthesis and MCMM physical-design setup:

| Architecture | Functional intent | Best use case |
| --- | --- | --- |
| Legacy SPI | Bootloader copies flash payload into SRAM through a 1-bit SPI controller. | Lowest-risk compatibility path when execute-in-place is not required. |
| Pure XIP QSPI | CPU reads directly from flash through a read-only Quad-SPI XIP path. | Smallest, lowest-power architecture for read-dominant systems. |
| Dual-Mode QSPI | QSPI XIP read path plus program/erase capability. | Most complete architecture when firmware update, erase, and direct execution are all required. |

The current reports show that all three architectures have comfortable setup slack at synthesis and physical stages. The main quality issues in the existing run are hold and route DRC. The severe `-10.07 ns` physical hold violation in Legacy SPI is caused by modeling `spi_clk` as a generated internal clock even though it is only a forwarded protocol output. This creates false clock-gating checks on the logic that gates the serial clock. The QSPI designs also had their forwarded `qspi_clk` endpoints reported as unconstrained.

The source has been updated so `spi_clk` and `qspi_clk` are constrained as protocol outputs instead of generated clocks, synthesis is asked to fix HCLK hold paths, and the MCMM physical scripts use a less congested floorplan plus a lighter power mesh and incremental route cleanup. The report numbers below are from the existing reports before rerunning DC/FC with those fixes.

## Fixes Applied

| Area | Change | Expected impact after rerun |
| --- | --- | --- |
| Clock constraints | Removed stale generated-clock use for `SPI_CLK`/`QSPI_CLK`; constrained `spi_clk`/`qspi_clk` with normal HCLK-referenced output delays. | Removes false Legacy SPI clock-gating hold paths and fixes unconstrained forwarded-clock endpoints. |
| Synthesis hold | Added `set_fix_hold [get_clocks HCLK]` after sourcing SDC in all three DC scripts. | Reduces small `-0.06` to `-0.07 ns` min-delay violations seen in synthesis reports. |
| Physical congestion | Reduced MCMM floorplan utilization from 55 percent to 40 percent. | Gives CTS, hold buffers, filler insertion, and detail routing more whitespace. |
| Power mesh | Changed upper-metal mesh from dense `0.4/0.4/3.0 um` straps to lighter `0.08/0.08/8.0 um` straps while keeping M1 rails. | Reduces routing blockage pressure in these tiny controller blocks. |
| Route cleanup | Added guarded incremental `route_detail` and `route_opt` passes after filler and PG reconnection. | Gives FC/ICC2 a final opportunity to repair spacing/via DRC before `check_routes`. |
| RTL lint | Removed synthesizable `=== x/z` masking in QSPI datapaths. | Eliminates DC ELAB-310 simulation/synthesis mismatch warnings. |

## Existing Synthesis Results

| Metric | Legacy SPI | Pure XIP QSPI | Dual-Mode QSPI |
| --- | ---: | ---: | ---: |
| Worst setup slack | 11.11 ns | 11.22 ns | 11.14 ns |
| Worst hold slack | -0.07 ns | -0.07 ns | -0.07 ns |
| Total cell area | 298.545606 | 251.925605 | 353.734806 |
| Combinational area | 132.267600 | 100.566000 | 159.751200 |
| Sequential area | 166.278006 | 151.359605 | 193.983607 |
| Leaf cell count | 571 | 487 | 708 |
| Total dynamic power | 10.6645 uW | 9.9791 uW | 12.6965 uW |
| Leakage power | 89.7540 nW | 78.4268 nW | 109.6823 nW |

### Synthesis Interpretation

Pure XIP is the smallest and lowest-power synthesized controller. Compared with Legacy SPI, it reduces total cell area by about 15.6 percent and dynamic power by about 6.4 percent. That result is consistent with the architecture: Pure XIP removes the SRAM shadow-copy control behavior and only needs the read/XIP QSPI path.

Dual-Mode QSPI is the largest synthesized block. Compared with Pure XIP, it increases total cell area by about 40.4 percent and dynamic power by about 27.2 percent. The extra cost comes from write/erase sequencing, command selection, XIP lock/drop behavior, and additional control states. The cost is reasonable because Dual-Mode is solving a broader problem than Pure XIP.

Legacy SPI sits between the two in area but is not the best performance architecture. It spends less logic than Dual-Mode, but the software flow requires copying flash content into SRAM before execution. Its interface is simpler and compatible, but the system-level boot path is less direct.

## Existing Physical MCMM Results

| Metric | Legacy SPI | Pure XIP QSPI | Dual-Mode QSPI |
| --- | ---: | ---: | ---: |
| Physical setup slack | 19.43 ns | 9.91 ns | 9.93 ns |
| Physical worst hold slack | -10.07 ns | -0.06 ns | -0.05 ns |
| Physical leaf cells | 1047 | 943 | 1295 |
| Physical netlist cell area | 475.88 | 409.19 | 559.97 |
| Physical area incl. physical-only cells | 529.78 | 449.11 | 637.76 |
| Net length | 6548.10 | 5039.35 | 7301.86 |
| Total route DRCs | 754 | 885 | 1211 |
| Diff-net spacing DRCs | 211 | 293 | 378 |
| Diff-net via-cut spacing DRCs | 5 | 5 | 4 |
| Same-net spacing DRCs | 35 | 34 | 54 |
| Same-net via-cut spacing DRCs | 9 | 5 | 13 |
| Total wire length | 5260 um | 4010 um | 5823 um |
| Routed contacts | 5353 | 4525 | 6391 |

### Physical Interpretation

The physical results preserve the same broad area ranking as synthesis: Pure XIP is smallest, Dual-Mode is largest, and Legacy SPI is in the middle. The physical-only overhead is significant in all cases because clock-tree, buffer, inverter, filler, and routing effects become visible after placement and routing. Pure XIP remains the cleanest physical implementation, with the shortest net length and lowest routed contact count.

Legacy SPI has the largest reported hold problem, but the first hold paths terminate at clock-gating-check endpoints driven by the gated forwarded `spi_clk`. Since `spi_clk` leaves the controller as a flash protocol clock and is not an internal capture domain, those paths are artifacts of the old generated-clock constraint. The applied constraint change should remove this false `-10.07 ns` issue after rerun.

Pure XIP and Dual-Mode only show small physical hold residuals of `-0.06 ns` and `-0.05 ns`. These are normal short-path hold-cleanup targets for final route optimization and should be addressed by the added `set_fix_hold` and final incremental route cleanup.

The DRC count scales with routing complexity and implementation density. Dual-Mode has the highest DRC total because it has the largest cell count, highest routed contact count, and longest net length. The old 55 percent utilization and dense upper-metal mesh were too aggressive for these small blocks, so the updated physical scripts intentionally trade a little block footprint for cleaner routing.

## Functional Comparison

| Dimension | Legacy SPI | Pure XIP QSPI | Dual-Mode QSPI |
| --- | --- | --- | --- |
| Flash bus width | 1-bit SPI | Quad-SPI read path | Quad-SPI read/program/erase path |
| Execution model | Shadow flash payload into SRAM, then execute from SRAM | Direct flash reads through XIP path | Direct XIP reads plus flash update operations |
| Firmware complexity | Highest for boot flow because software must copy payload and jump | Lowest for read-only workload | Moderate; firmware can read, program, erase, and verify |
| Hardware complexity | Moderate | Lowest | Highest |
| Update capability | Not implemented as a complete flash program/erase flow | No | Yes |
| Best measured PPA trait | Compatibility and simple serial interface | Best area/power/net length | Best feature coverage |
| Main drawback | Slow serial shadowing and SRAM dependency | Read-only, no flash modification | Larger area, power, and DRC pressure |

## Architecture-by-Architecture Notes

### Legacy SPI

Legacy SPI is a compatibility-oriented architecture. It implements an AHB-accessible SPI controller, and the bootloader performs a four-word flash-to-SRAM shadow copy before jumping to SRAM execution. This means the controller can be simple, but execution depends on SRAM availability and boot-time copy latency.

Its synthesis area is higher than Pure XIP even though the bus is only 1-bit, because it includes memory-mapped control/status registers, command/address/data staging, and software-visible polling behavior. In physical design, the old forwarded-clock constraint makes the hold report look much worse than the actual datapath quality. After the constraint fix, the architecture should be judged mainly on its area, power, and system boot penalty rather than the false `spi_clk` hold path.

### Pure XIP QSPI

Pure XIP is the strongest architecture for a read-only benchmark. It has the lowest synthesized cell area, lowest dynamic power, lowest leakage power, lowest physical area, shortest net length, and lowest routed-contact count. Its direct read path removes the software shadow-copy step, so it is more suitable when code or constants can be fetched directly from external flash.

The limitation is functionality. Pure XIP intentionally removes write and erase states, so it is not suitable for firmware update or nonvolatile data modification without an additional controller. It is the best PPA choice only if the product requirement is execute/read-only flash access.

### Dual-Mode QSPI

Dual-Mode QSPI is the most complete architecture. It retains XIP read behavior but adds write-enable, program, erase, XIP lock/drop handling, and verification-oriented firmware support. The cost is visible in every PPA dimension: largest synthesized area, highest power, highest physical area, longest net length, and highest DRC count.

Despite that cost, Dual-Mode is the most practical full-system controller because it supports both runtime execution/read access and flash modification. If the final FYP conclusion values feature completeness and update capability, Dual-Mode is the most capable design. If the conclusion is strictly PPA for read-only operation, Pure XIP is the better choice.

## Recommendation

For a read-only PPA comparison, Pure XIP QSPI is the best architecture. It gives the smallest and lowest-power controller while avoiding the boot shadow-copy overhead of Legacy SPI.

For a realistic product controller, Dual-Mode QSPI is the recommended architecture despite its overhead. It is the only design that supports XIP-style reads and program/erase behavior in one block.

Legacy SPI is useful as a baseline because it is simple and familiar, but it is not competitive for direct execution or update-capable flash systems. Its main value in the project is showing how much system complexity and boot latency are removed by XIP.

## Required Rerun Flow

Run the following on the Linux EDA machine with Synopsys tools and `SAED14_PATH` configured:

```bash
cd /path/to/FYP_source/source/1_legacy_spi
dc_shell -f run_dc.tcl
icc2_shell -f pd_mcmm.tcl

cd /path/to/FYP_source/source/2_pure_xip
dc_shell -f run_dc.tcl
icc2_shell -f pd_mcmm.tcl

cd /path/to/FYP_source/source/3_dual_mode
dc_shell -f run_dc.tcl
icc2_shell -f pd_mcmm.tcl
```

After rerun, check:

| Report | Expected improvement |
| --- | --- |
| `reports/*_check_timing_precompile.rpt` | No unconstrained `spi_clk`/`qspi_clk` endpoints. |
| `reports/*_hold_timing.rpt` | Reduced or eliminated small HCLK hold violations. |
| `outputs_mcmm/*_mcmm_hold.rpt` | Legacy SPI should no longer show the false `-10.07 ns` clock-gating hold paths. |
| `outputs_mcmm/*_mcmm_routes.rpt` | DRC count should reduce due to lower utilization, lighter mesh, and incremental cleanup. |
| `dc_*.log` | QSPI ELAB-310 X/Z comparison warnings should disappear. |

