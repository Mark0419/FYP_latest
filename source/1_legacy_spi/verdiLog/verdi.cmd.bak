verdiSetActWin -dock widgetDock_<Decl._Tree>
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/home/user18/Projects/Flash_controller/source/5_legacy_backup/tb_soc_top.fsdb}
verdiSetActWin -win $_nWave2
verdiWindowResize -win $_Verdi_1 "90" "114" "1757" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -win $_nWave2
wvRestoreSignal -win $_nWave2 \
           "/home/user18/Projects/Flash_controller/source/5_legacy_backup/signal.rc" \
           -overWriteAutoAlias on -appendSignals on
verdiDockWidgetMaximize -dock windowDock_nWave_2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_soc_top/u_spi"
wvGetSignalSetScope -win $_nWave2 "/tb_soc_top/u_spi/u_spi_fsm"
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_soc_top/HCLK} \
{/tb_soc_top/SYSRESETn} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_soc_top/HADDRD\[31:0\]} \
{/tb_soc_top/HADDRI\[31:0\]} \
{/tb_soc_top/HRDATAD\[31:0\]} \
{/tb_soc_top/HTRANSI\[1:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/tb_soc_top/HADDRS\[31:0\]} \
{/tb_soc_top/HREADYS} \
{/tb_soc_top/HWDATAS\[31:0\]} \
{/tb_soc_top/HWRITES} \
{/tb_soc_top/HRDATAS\[31:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
{/tb_soc_top/spi_clk} \
{/tb_soc_top/spi_cs_n} \
{/tb_soc_top/spi_miso} \
{/tb_soc_top/spi_mosi} \
{/tb_soc_top/u_spi/u_spi_fsm/cmd\[7:0\]} \
{/tb_soc_top/u_spi/u_spi_fsm/flash_addr\[31:0\]} \
{/tb_soc_top/u_spi/u_spi_fsm/state\[2:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
}
wvSelectSignal -win $_nWave2 {( "G4" 5 6 7 )} 
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G4" 5)}
wvSetPosition -win $_nWave2 {("G4" 6)}
wvSetPosition -win $_nWave2 {("G4" 7)}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_soc_top/HCLK} \
{/tb_soc_top/SYSRESETn} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_soc_top/HADDRD\[31:0\]} \
{/tb_soc_top/HADDRI\[31:0\]} \
{/tb_soc_top/HRDATAD\[31:0\]} \
{/tb_soc_top/HTRANSI\[1:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/tb_soc_top/HADDRS\[31:0\]} \
{/tb_soc_top/HREADYS} \
{/tb_soc_top/HWDATAS\[31:0\]} \
{/tb_soc_top/HWRITES} \
{/tb_soc_top/HRDATAS\[31:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
{/tb_soc_top/spi_clk} \
{/tb_soc_top/spi_cs_n} \
{/tb_soc_top/spi_miso} \
{/tb_soc_top/spi_mosi} \
}
wvAddSignal -win $_nWave2 -group {"G5" \
{/tb_soc_top/u_spi/u_spi_fsm/cmd\[7:0\]} \
{/tb_soc_top/u_spi/u_spi_fsm/flash_addr\[31:0\]} \
{/tb_soc_top/u_spi/u_spi_fsm/state\[2:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G6" \
}
wvSetPosition -win $_nWave2 {("G5" 3)}
wvGetSignalClose -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 6200704.635310 -snap {("G5" 2)}
wvSetCursor -win $_nWave2 910039.604635 -snap {("G5" 1)}
wvSaveSignal -win $_nWave2 \
           "/home/user18/Projects/Flash_controller/source/5_legacy_backup/signal.rc"
debExit
