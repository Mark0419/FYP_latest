wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/home/user18/Projects/Flash_controller/source/soc_full.fsdb}
verdiSetActWin -win $_nWave2
verdiWindowResize -win $_Verdi_1 "230" "71" "1440" "753"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/sync_fifo"
verdiSetActWin -win $_nWave2
wvScrollDown -win $_nWave2 0
wvGetSignalSetScope -win $_nWave2 "/tb_soc_top"
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_soc_top/SYS_HADDR\[31:0\]} \
{/tb_soc_top/SYS_HWDATA\[31:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 )} 
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSelectGroup -win $_nWave2 {G2}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_soc_top/SYS_HADDR\[31:0\]} \
{/tb_soc_top/SYS_HWDATA\[31:0\]} \
{/tb_soc_top/qspi_clk} \
{/tb_soc_top/qspi_cs_n} \
{/tb_soc_top/qspi_data_out\[3:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 3 4 5 )} 
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_soc_top/SYS_HADDR\[31:0\]} \
{/tb_soc_top/SYS_HWDATA\[31:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_soc_top/qspi_clk} \
{/tb_soc_top/qspi_cs_n} \
{/tb_soc_top/qspi_data_out\[3:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvGetSignalClose -win $_nWave2
wvSetCursor -win $_nWave2 277792.869270 -snap {("G1" 1)}
wvZoomAll -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 1189925.759340 -snap {("G1" 1)}
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvExpandBus -win $_nWave2
wvZoom -win $_nWave2 1101779.731993 2910128.645470
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSetPosition -win $_nWave2 {("G2" 3)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSetRadix -win $_nWave2 -format Hex
wvSetCursor -win $_nWave2 1613524.449523 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 1875962.351989 -snap {("G2" 3)}
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvExpandBus -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSetPosition -win $_nWave2 {("G2" 3)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 3)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/sync_fifo"
wvGetSignalSetScope -win $_nWave2 "/tb_soc_top"
wvGetSignalSetScope -win $_nWave2 "/tb_soc_top"
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_soc_top/SYS_HADDR\[31:0\]} \
{/tb_soc_top/SYS_HWDATA\[31:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_soc_top/qspi_clk} \
{/tb_soc_top/qspi_cs_n} \
{/tb_soc_top/qspi_data_out\[3:0\]} \
{/tb_soc_top/qspi_io_bus\[3:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_soc_top/SYS_HADDR\[31:0\]} \
{/tb_soc_top/SYS_HWDATA\[31:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_soc_top/qspi_clk} \
{/tb_soc_top/qspi_cs_n} \
{/tb_soc_top/qspi_data_out\[3:0\]} \
{/tb_soc_top/qspi_io_bus\[3:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvSetPosition -win $_nWave2 {("G2" 4)}
wvGetSignalClose -win $_nWave2
wvZoom -win $_nWave2 1441042.993052 1632342.109577
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 1207920.977453 -snap {("G1" 2)}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvZoom -win $_nWave2 1342833.555111 1398182.304919
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 1031916.817360 2666546.112116
wvZoom -win $_nWave2 1395496.208417 2283753.176001
wvSetCursor -win $_nWave2 1426014.983071
wvSearchNext -win $_nWave2
wvSetCursor -win $_nWave2 1430833.736964 -snap {("G1" 0)}
wvSetCursor -win $_nWave2 1428424.360017 -snap {("G1" 0)}
wvSetCursor -win $_nWave2 1428424.360017 -snap {("G1" 0)}
wvSetCursor -win $_nWave2 1438864.993452 -snap {("G1" 0)}
wvSetCursor -win $_nWave2 1438061.867803 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 1429227.485666 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 1446896.249940 -snap {("G1" 1)}
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 4 )} 
wvExpandBus -win $_nWave2
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvCloseGetStreamsDialog -win $_nWave2
wvAttrOrderConfigDlg -win $_nWave2 -close
wvCloseDetailsViewDlg -win $_nWave2
wvCloseDetailsViewDlg -win $_nWave2 -streamLevel
wvCloseFilterColorizeDlg -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/home/user18/Projects/Flash_controller/source/soc_full.fsdb}
wvRestoreSignal -win $_nWave2 \
           "/home/user18/Projects/Flash_controller/source/signal.rc" \
           -overWriteAutoAlias on -appendSignals on
wvSetCursor -win $_nWave2 448381.555154
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/sync_fifo"
wvGetSignalSetScope -win $_nWave2 "/tb_soc_top"
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_soc_top/SYS_HADDR\[31:0\]} \
{/tb_soc_top/SYS_HRDATA\[31:0\]} \
{/tb_soc_top/SYS_HREADY} \
{/tb_soc_top/SYS_HWDATA\[31:0\]} \
{/tb_soc_top/SYS_HWRITE} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 )} 
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_soc_top/SYS_HADDR\[31:0\]} \
{/tb_soc_top/SYS_HRDATA\[31:0\]} \
{/tb_soc_top/SYS_HREADY} \
{/tb_soc_top/SYS_HWDATA\[31:0\]} \
{/tb_soc_top/SYS_HWRITE} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_soc_top/qspi_clk} \
{/tb_soc_top/qspi_cs_n} \
{/tb_soc_top/qspi_data_in\[3:0\]} \
{/tb_soc_top/qspi_data_oen} \
{/tb_soc_top/qspi_data_out\[3:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "G2" 1 2 3 4 5 )} 
wvSetPosition -win $_nWave2 {("G2" 5)}
wvGetSignalClose -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWavwvSaveSignal -win $_nWave2 \
           "/home/user18/Projects/Flash_controller/source/signal.rc"
wvZoom -win $_nWave2 748824.593128 4337703.435805
wvZoom -win $_nWave2 1096030.774111 2134404.399478
wvSetCursor -win $_nWave2 1631178.121723 -snap {("G3" 0)}
wvSetCursor -win $_nWave2 1631178.121723 -snap {("G3" 0)}
wvSetCursor -win $_nWave2 1576724.531965 -snap {("G1" 1)}
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 867540.687161 2684810.126582
wvZoom -win $_nWave2 1243810.760965 2178735.092819
verdiWindowResize -win $_Verdi_1 "217" "186" "1440" "751"
wvSetCursor -win $_nWave2 3349759.740934 -snap {("G3" 0)}
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 831012.658228 3598010.849910
wvZoom -win $_nWave2 1141236.686952 2119443.100105
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvZoom -win $_nWave2 1289825.002873 2084949.383908
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvSetCursor -win $_nWave2 1618586.647942 -snap {("G1" 3)}
verdiSetActWin -win $_nWave2
wvSetCursor -win $_nWave2 1770997.469623 -snap {("G3" 0)}
wvSetCursor -win $_nWave2 1641592.054988 -snap {("G2" 2)}
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -win $_nWave2
wvOpenFile -win $_nWave2 \
           {/home/user18/Projects/Flash_controller/source/3_dual_mode/soc_full.fsdb}
wvSetCursor -win $_nWave2 1641592.054988 -snap {("G3" 0)}
verdiDockWidgetMaximize -dock windowDock_nWave_2
verdiShowWindow -win $_Verdi_1 -switchFS
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 0.000000
wvSetCursor -win $_nWave2 3920299.387414 -snap {("G3" 0)}
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSetPosition -win $_nWave2 {("G2" 3)}
wvExpandBus -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSelectSignal -win $_nWave2 {( "G2" 3 )} 
wvSetPosition -win $_nWave2 {("G2" 3)}
wvCollapseBus -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSetCursor -win $_nWave2 896187.453035 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 1090189.534431 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 2097197.452229
wvSetFileTimeRange -win $_nWave2 -time_unit 1p 0 10000000
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/sync_fifo"
wvGetSignalSetScope -win $_nWave2 "/tb_soc_top"
wvGetSignalClose -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/sync_fifo"
wvGetSignalSetScope -win $_nWave2 "/tb_soc_top"
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvSetActiveFile -win $_nWave2 \
           {/home/user18/Projects/Flash_controller/source/soc_full.fsdb}
wvAddSignal -win $_nWave2 -group {"G1" {/tb_soc_top/SYS_HADDR\[31:0\]} \
{/tb_soc_top/SYS_HRDATA\[31:0\]} \
{/tb_soc_top/SYS_HREADY} \
{/tb_soc_top/SYS_HWDATA\[31:0\]} \
{/tb_soc_top/SYS_HWRITE} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_soc_top/qspi_clk} \
{/tb_soc_top/qspi_cs_n} \
{/tb_soc_top/qspi_data_in\[3:0\]} \
{/tb_soc_top/qspi_data_oen} \
{/tb_soc_top/qspi_data_out\[3:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSetActiveFile -win $_nWave2 \
           {/home/user18/Projects/Flash_controller/source/3_dual_mode/soc_full.fsdb}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvSetActiveFile -win $_nWave2 \
           {/home/user18/Projects/Flash_controller/source/soc_full.fsdb}
wvAddSignal -win $_nWave2 -group {"G1" {/tb_soc_top/SYS_HADDR\[31:0\]} \
{/tb_soc_top/SYS_HRDATA\[31:0\]} \
{/tb_soc_top/SYS_HREADY} \
{/tb_soc_top/SYS_HWDATA\[31:0\]} \
{/tb_soc_top/SYS_HWRITE} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_soc_top/qspi_clk} \
{/tb_soc_top/qspi_cs_n} \
{/tb_soc_top/qspi_data_in\[3:0\]} \
{/tb_soc_top/qspi_data_oen} \
{/tb_soc_top/qspi_data_out\[3:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSetActiveFile -win $_nWave2 \
           {/home/user18/Projects/Flash_controller/source/3_dual_mode/soc_full.fsdb}
wvSelectGroup -win $_nWave2 {G1} {G2} {G3}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
}
wvSetActiveFile -win $_nWave2 \
           {/home/user18/Projects/Flash_controller/source/soc_full.fsdb}
wvAddSignal -win $_nWave2 -group {"G1" {/tb_soc_top/SYS_HADDR\[31:0\]} \
{/tb_soc_top/SYS_HRDATA\[31:0\]} \
{/tb_soc_top/SYS_HREADY} \
{/tb_soc_top/SYS_HWDATA\[31:0\]} \
{/tb_soc_top/SYS_HWRITE} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_soc_top/qspi_clk} \
{/tb_soc_top/qspi_cs_n} \
{/tb_soc_top/qspi_data_in\[3:0\]} \
{/tb_soc_top/qspi_data_oen} \
{/tb_soc_top/qspi_data_out\[3:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSetActiveFile -win $_nWave2 \
           {/home/user18/Projects/Flash_controller/source/3_dual_mode/soc_full.fsdb}
wvSelectGroup -win $_nWave2 {G1} {G2} {G3}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvGetSignalClose -win $_nWave2
wvSetCursor -win $_nWave2 1593157.893606 -snap {("G3" 0)}
wvSetCursor -win $_nWave2 1535675.795415 -snap {("G1" 3)}
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
debExit
