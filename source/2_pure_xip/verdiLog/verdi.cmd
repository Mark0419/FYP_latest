verdiSetActWin -dock widgetDock_<Decl._Tree>
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/home/user18/Projects/Flash_controller/source/2_pure_xip/soc_full.fsdb}
verdiSetActWin -win $_nWave2
verdiWindowResize -win $_Verdi_1 "240" "39" "1578" "752"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -win $_nWave2
wvRestoreSignal -win $_nWave2 \
           "/home/user18/Projects/Flash_controller/source/3_dual_mode/signal.rc" \
           -overWriteAutoAlias on -appendSignals on
wvZoomAll -win $_nWave2
verdiWindowResize -win $_Verdi_1 "240" "39" "1578" "897"
wvZoom -win $_nWave2 0.000000 6698979.591837
wvZoom -win $_nWave2 1105103.776204 4169773.011245
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_soc_top/u_dut/u_core"
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_soc_top/HCLK} \
{/tb_soc_top/u_dut/u_core/state\[2:0\]} \
{/tb_soc_top/SYS_HADDR\[31:0\]} \
{/tb_soc_top/SYS_HRDATA\[31:0\]} \
{/tb_soc_top/SYS_HREADY} \
{/tb_soc_top/SYS_HWRITE} \
{/tb_soc_top/SYS_HWDATA\[31:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_soc_top/qspi_clk} \
{/tb_soc_top/qspi_cs_n} \
{/tb_soc_top/qspi_data_in\[3:0\]} \
{/tb_soc_top/u_flash/xip_active} \
{/tb_soc_top/qspi_data_out\[3:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_soc_top/HCLK} \
{/tb_soc_top/u_dut/u_core/state\[2:0\]} \
{/tb_soc_top/SYS_HADDR\[31:0\]} \
{/tb_soc_top/SYS_HRDATA\[31:0\]} \
{/tb_soc_top/SYS_HREADY} \
{/tb_soc_top/SYS_HWRITE} \
{/tb_soc_top/SYS_HWDATA\[31:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_soc_top/qspi_clk} \
{/tb_soc_top/qspi_cs_n} \
{/tb_soc_top/qspi_data_in\[3:0\]} \
{/tb_soc_top/u_flash/xip_active} \
{/tb_soc_top/qspi_data_out\[3:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSetPosition -win $_nWave2 {("G1" 2)}
wvGetSignalClose -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 3)}
wvZoom -win $_nWave2 1215843.925033 1942093.273169
wvSetCursor -win $_nWave2 2631114.713542 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 3347904.511345 -snap {("G1" 2)}
debExit
