verdiSetActWin -dock widgetDock_<Message>
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/home/user18/Projects/Flash_controller/source/3_dual_mode/soc_full.fsdb}
verdiSetActWin -win $_nWave2
verdiWindowResize -win $_Verdi_1 "250" "124" "1272" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -win $_nWave2
wvRestoreSignal -win $_nWave2 \
           "/home/user18/Projects/Flash_controller/source/3_dual_mode/signal.rc" \
           -overWriteAutoAlias on -appendSignals on
verdiDockWidgetMaximize -dock windowDock_nWave_2
verdiShowWindow -win $_Verdi_1 -switchFS
wvSetCursor -win $_nWave2 3207484.073611 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 3846377.562570 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 3865261.113968 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 3965232.856662 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 3929131.949578 -snap {("G1" 6)}
wvSetCursor -win $_nWave2 3965232.856662 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 5449998.368527 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 5587922.346873 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 6149800.567386 -snap {("G1" 2)}
wvZoom -win $_nWave2 1344253.903250 2018137.502151
wvSetCursor -win $_nWave2 1367127.236894 -snap {("G1" 2)}
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 1311615.415626 2082270.810714
wvZoom -win $_nWave2 1342803.819344 2081264.733175
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 1358228.590389
wvSetCursor -win $_nWave2 1360638.710865
wvSetCursor -win $_nWave2 2229053.320760 -snap {("G1" 3)}
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 2125707.354751 3244003.255592
wvSetCursor -win $_nWave2 3212177.079823 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 3967099.808707 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 3957610.352629 -snap {("G1" 1)}
wvSetCursor -win $_nWave2 4786112.864023 -snap {("G1" 4)}
wvZoom -win $_nWave2 4697787.926685 5617535.208055
wvZoom -win $_nWave2 4697787.926685 5482454.830570
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 4305454.474742 5585916.132517
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3931011.378995 5535767.503622
wvSetCursor -win $_nWave2 3964531.089170 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 3943581.270311 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 4787858.970343 -snap {("G1" 4)}
wvZoom -win $_nWave2 4773194.097141 5493867.865903
wvSetCursor -win $_nWave2 5585974.865852 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 6084895.622477 -snap {("G3" 0)}
wvSetCursor -win $_nWave2 6167029.852259 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 6141627.513151 -snap {("G1" 3)}
wvSetCursor -win $_nWave2 6138334.617341 -snap {("G1" 1)}
verdiShowWindow -win $_Verdi_1 -switchFS
verdiWindowResize -win $_Verdi_1 "250" "124" "1272" "700"
wvOpenFile -win $_nWave2 \
           {/home/user18/Projects/Flash_controller/source/2_pure_xip/soc_full.fsdb}
wvSetCursor -win $_nWave2 6111594.768350 -snap {("G1" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvCloseGetStreamsDialog -win $_nWave2
wvAttrOrderConfigDlg -win $_nWave2 -close
wvCloseDetailsViewDlg -win $_nWave2
wvCloseDetailsViewDlg -win $_nWave2 -streamLevel
wvCloseFilterColorizeDlg -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 0.000000 6626696.832579
wvCloseGetStreamsDialog -win $_nWave2
wvAttrOrderConfigDlg -win $_nWave2 -close
wvCloseDetailsViewDlg -win $_nWave2
wvCloseDetailsViewDlg -win $_nWave2 -streamLevel
wvCloseFilterColorizeDlg -win $_nWave2
wvGetSignalClose -win $_nWave2
wvCloseWindow -win $_nWave2
verdiSetActWin -win $_OneSearch
wvCreateWindow
verdiSetActWin -win $_nWave3
wvCloseFile -win $_nWave3
wvDisplayGridCount -win $_nWave3 -off
wvCloseGetStreamsDialog -win $_nWave3
wvAttrOrderConfigDlg -win $_nWave3 -close
wvCloseDetailsViewDlg -win $_nWave3
wvCloseDetailsViewDlg -win $_nWave3 -streamLevel
wvCloseFilterColorizeDlg -win $_nWave3
wvGetSignalClose -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 0)}
wvOpenFile -win $_nWave3 \
           {/home/user18/Projects/Flash_controller/source/2_pure_xip/soc_full.fsdb}
wvGetSignalOpen -win $_nWave3
wvGetSignalSetScope -win $_nWave3 "/sync_fifo"
wvGetSignalSetScope -win $_nWave3 "/tb_soc_top"
wvSetPosition -win $_nWave3 {("G1" 6)}
wvSetPosition -win $_nWave3 {("G1" 6)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"G1" \
{/tb_soc_top/HCLK} \
{/tb_soc_top/SYS_HADDR\[31:0\]} \
{/tb_soc_top/SYS_HRDATA\[31:0\]} \
{/tb_soc_top/SYS_HREADY} \
{/tb_soc_top/SYS_HWDATA\[31:0\]} \
{/tb_soc_top/SYS_HWRITE} \
}
wvAddSignal -win $_nWave3 -group {"G2" \
}
wvSelectSignal -win $_nWave3 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave3 {("G1" 6)}
wvSelectGroup -win $_nWave3 {G2}
wvSelectGroup -win $_nWave3 {G2}
wvSelectSignal -win $_nWave3 {( "G1" 6 )} 
wvSetPosition -win $_nWave3 {("G2" 0)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G2" 1)}
wvSetPosition -win $_nWave3 {("G2" 1)}
wvSetPosition -win $_nWave3 {("G2" 0)}
wvSetPosition -win $_nWave3 {("G1" 5)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 5)}
wvSetPosition -win $_nWave3 {("G1" 6)}
wvSelectGroup -win $_nWave3 {G2}
wvGetSignalSetScope -win $_nWave3 "/tb_soc_top/u_dut"
wvGetSignalSetScope -win $_nWave3 "/tb_soc_top/u_flash"
wvGetSignalSetScope -win $_nWave3 "/tb_soc_top/u_cpu"
wvGetSignalSetScope -win $_nWave3 "/tb_soc_top/u_flash"
wvGetSignalSetScope -win $_nWave3 "/tb_soc_top/u_cpu"
wvGetSignalSetScope -win $_nWave3 "/tb_soc_top/u_boot_rom_icode"
wvGetSignalSetScope -win $_nWave3 "/tb_soc_top/u_boot_rom_dcode"
wvGetSignalSetScope -win $_nWave3 "/tb_soc_top/u_dut/u_core"
wvSetPosition -win $_nWave3 {("G1" 7)}
wvSetPosition -win $_nWave3 {("G1" 7)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"G1" \
{/tb_soc_top/HCLK} \
{/tb_soc_top/SYS_HADDR\[31:0\]} \
{/tb_soc_top/SYS_HRDATA\[31:0\]} \
{/tb_soc_top/SYS_HREADY} \
{/tb_soc_top/SYS_HWDATA\[31:0\]} \
{/tb_soc_top/SYS_HWRITE} \
{/tb_soc_top/u_dut/u_core/state\[2:0\]} \
}
wvAddSignal -win $_nWave3 -group {"G2" \
}
wvAddSignal -win $_nWave3 -group {"G3" \
}
wvSelectSignal -win $_nWave3 {( "G1" 7 )} 
wvSetPosition -win $_nWave3 {("G1" 7)}
wvSetPosition -win $_nWave3 {("G2" 0)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G2" 1)}
wvGetSignalSetScope -win $_nWave3 "/tb_soc_top/u_cpu"
wvGetSignalSetScope -win $_nWave3 "/tb_soc_top/u_dut"
wvSetPosition -win $_nWave3 {("G2" 5)}
wvSetPosition -win $_nWave3 {("G2" 5)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"G1" \
{/tb_soc_top/HCLK} \
{/tb_soc_top/SYS_HADDR\[31:0\]} \
{/tb_soc_top/SYS_HRDATA\[31:0\]} \
{/tb_soc_top/SYS_HREADY} \
{/tb_soc_top/SYS_HWDATA\[31:0\]} \
{/tb_soc_top/SYS_HWRITE} \
}
wvAddSignal -win $_nWave3 -group {"G2" \
{/tb_soc_top/u_dut/u_core/state\[2:0\]} \
{/tb_soc_top/u_dut/qspi_clk} \
{/tb_soc_top/u_dut/qspi_cs_n} \
{/tb_soc_top/u_dut/qspi_data_in\[3:0\]} \
{/tb_soc_top/u_dut/qspi_data_out\[3:0\]} \
}
wvAddSignal -win $_nWave3 -group {"G3" \
}
wvSelectSignal -win $_nWave3 {( "G2" 2 3 4 5 )} 
wvSetPosition -win $_nWave3 {("G2" 5)}
wvGetSignalSetScope -win $_nWave3 "/tb_soc_top/u_dut/u_core"
wvSetPosition -win $_nWave3 {("G2" 6)}
wvSetPosition -win $_nWave3 {("G2" 6)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"G1" \
{/tb_soc_top/HCLK} \
{/tb_soc_top/SYS_HADDR\[31:0\]} \
{/tb_soc_top/SYS_HRDATA\[31:0\]} \
{/tb_soc_top/SYS_HREADY} \
{/tb_soc_top/SYS_HWDATA\[31:0\]} \
{/tb_soc_top/SYS_HWRITE} \
}
wvAddSignal -win $_nWave3 -group {"G2" \
{/tb_soc_top/u_dut/u_core/state\[2:0\]} \
{/tb_soc_top/u_dut/qspi_clk} \
{/tb_soc_top/u_dut/qspi_cs_n} \
{/tb_soc_top/u_dut/qspi_data_in\[3:0\]} \
{/tb_soc_top/u_dut/qspi_data_out\[3:0\]} \
{/tb_soc_top/u_dut/u_core/cnt\[5:0\]} \
}
wvAddSignal -win $_nWave3 -group {"G3" \
}
wvSelectSignal -win $_nWave3 {( "G2" 6 )} 
wvSetPosition -win $_nWave3 {("G2" 6)}
wvSetPosition -win $_nWave3 {("G2" 6)}
wvSetPosition -win $_nWave3 {("G2" 6)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"G1" \
{/tb_soc_top/HCLK} \
{/tb_soc_top/SYS_HADDR\[31:0\]} \
{/tb_soc_top/SYS_HRDATA\[31:0\]} \
{/tb_soc_top/SYS_HREADY} \
{/tb_soc_top/SYS_HWDATA\[31:0\]} \
{/tb_soc_top/SYS_HWRITE} \
}
wvAddSignal -win $_nWave3 -group {"G2" \
{/tb_soc_top/u_dut/u_core/state\[2:0\]} \
{/tb_soc_top/u_dut/qspi_clk} \
{/tb_soc_top/u_dut/qspi_cs_n} \
{/tb_soc_top/u_dut/qspi_data_in\[3:0\]} \
{/tb_soc_top/u_dut/qspi_data_out\[3:0\]} \
{/tb_soc_top/u_dut/u_core/cnt\[5:0\]} \
}
wvAddSignal -win $_nWave3 -group {"G3" \
}
wvSelectSignal -win $_nWave3 {( "G2" 6 )} 
wvSetPosition -win $_nWave3 {("G2" 6)}
wvGetSignalClose -win $_nWave3
wvZoom -win $_nWave3 0.000000 4022552.783109
wvZoom -win $_nWave3 993899.228511 3963857.946780
verdiDockWidgetMaximize -dock windowDock_nWave_3
wvSelectSignal -win $_nWave3 {( "G2" 1 )} 
wvSelectGroup -win $_nWave3 {G2}
wvSelectSignal -win $_nWave3 {( "G2" 1 )} 
wvSetPosition -win $_nWave3 {("G2" 1)}
wvSetPosition -win $_nWave3 {("G2" 2)}
wvSetPosition -win $_nWave3 {("G2" 3)}
wvMoveSelected -win $_nWave3
wvSetPosition -win $_nWave3 {("G2" 3)}
wvSetCursor -win $_nWave3 1516819.975600 -snap {("G3" 0)}
wvSelectSignal -win $_nWave3 {( "G2" 5 )} 
wvSelectSignal -win $_nWave3 {( "G2" 6 )} 
wvZoom -win $_nWave3 1149908.733168 1973292.229964
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("G2" 3)}
wvSelectGroup -win $_nWave3 {G3}
wvSetCursor -win $_nWave3 1307947.792053 -snap {("G3" 0)}
wvSearchNext -win $_nWave3
wvSearchNext -win $_nWave3
wvSearchPrev -win $_nWave3
wvSearchPrev -win $_nWave3
wvZoomAll -win $_nWave3
wvZoom -win $_nWave3 0.000000 5331094.049904
wvZoom -win $_nWave3 1176729.012935 2015787.961288
wvSetCursor -win $_nWave3 1403806.386673 -snap {("G3" 0)}
wvSelectSignal -win $_nWave3 {( "G2" 1 )} 
wvSelectGroup -win $_nWave3 {G3}
wvSetCursor -win $_nWave3 1267721.010212 -snap {("G1" 2)}
wvSetCursor -win $_nWave3 1258058.143245 -snap {("G1" 1)}
verdiShowWindow -win $_Verdi_1 -switchFS
wvSetCursor -win $_nWave3 2097757.563237 -snap {("G1" 2)}
wvSetCursor -win $_nWave3 2097757.563237 -snap {("G1" 1)}
wvZoom -win $_nWave3 2037648.500938 2712769.026628
wvSetCursor -win $_nWave3 2720315.938943 -snap {("G1" 2)}
wvSetCursor -win $_nWave3 2718675.305831 -snap {("G1" 1)}
wvSetCursor -win $_nWave3 3337481.099943 -snap {("G1" 1)}
verdiShowWindow -win $_Verdi_1 -switchFS
verdiWindowResize -win $_Verdi_1 "234" "153" "1272" "700"
wvSaveSignal -win $_nWave3 \
           "/home/user18/Projects/Flash_controller/source/2_pure_xip/signal.rc"
debExit
