verdiSetActWin -dock widgetDock_<Decl._Tree>
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/tb_soc_top.fsdb}
verdiSetActWin -win $_nWave2
verdiWindowResize -win $_Verdi_1 "90" "77" "1757" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -win $_nWave2
wvRestoreSignal -win $_nWave2 \
           "/home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/signal.rc" \
           -overWriteAutoAlias on -appendSignals on
verdiDockWidgetMaximize -dock windowDock_nWave_2
verdiShowWindow -win $_Verdi_1 -switchFS
wvSetCursor -win $_nWave2 1765250.736196 -snap {("G5" 3)}
wvZoom -win $_nWave2 289969.141104 2670768.404908
wvSetCursor -win $_nWave2 969154.207159 -snap {("G4" 2)}
wvScrollDown -win $_nWave2 0
verdiShowWindow -win $_Verdi_1 -switchFS
verdiWindowResize -win $_Verdi_1 "90" "77" "1757" "700"
wvOpenFile -win $_nWave2 \
           {/home/user18/Projects/Flash_controller/FYP_latest/source/2_pure_xip/soc_full.fsdb}
wvZoomAll -win $_nWave2
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/sync_fifo"
wvRestoreSignal -win $_nWave2 \
           "/home/user18/Projects/Flash_controller/FYP_latest/source/2_pure_xip/signal.rc" \
           -overWriteAutoAlias on -appendSignals on
wvZoomAll -win $_nWave2
wvSelectGroup -win $_nWave2 {G1} {G2} {G3}
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSelectGroup -win $_nWave2 {G1} {G2}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 4)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 4 5 )} {( "G4" 1 2 3 4 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSelectSignal -win $_nWave2 {( "G5" 1 2 3 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSelectGroup -win $_nWave2 {G5}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSelectGroup -win $_nWave2 {G4}
wvSelectGroup -win $_nWave2 {G6}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSelectGroup -win $_nWave2 {G3}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSelectGroup -win $_nWave2 {G4}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvRestoreSignal -win $_nWave2 \
           "/home/user18/Projects/Flash_controller/FYP_latest/source/2_pure_xip/signal.rc" \
           -overWriteAutoAlias on -appendSignals on
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 1321009.569697 -snap {("G1" 3)}
wvZoom -win $_nWave2 570333.483163 1402163.741214
wvSetCursor -win $_nWave2 625471.288438 -snap {("G1" 5)}
wvScrollDown -win $_nWave2 0
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 687556.175354 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 1332280.982407 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 2824616.025307 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 2317402.453324 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 683047.610270 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 665013.349933 -snap {("G1" 2)}
wvZoom -win $_nWave2 633453.394343 2910278.761908
verdiShowWindow -win $_Verdi_1 -switchFS
wvSetCursor -win $_nWave2 2708901.397088 -snap {("G3" 0)}
wvZoom -win $_nWave2 659550.003844 1847713.283523
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 1435976.598045 -snap {("G3" 0)}
wvZoom -win $_nWave2 1806749.442904 2935455.727531
wvSetCursor -win $_nWave2 1846862.779000 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 1826806.110952 -snap {("G1" 4)}
verdiShowWindow -win $_Verdi_1 -switchFS
verdiWindowResize -win $_Verdi_1 "90" "77" "1757" "700"
wvOpenFile -win $_nWave2 \
           {/home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/soc_full.fsdb}
wvZoomAll -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvCloseGetStreamsDialog -win $_nWave2
wvAttrOrderConfigDlg -win $_nWave2 -close
wvCloseDetailsViewDlg -win $_nWave2
wvCloseDetailsViewDlg -win $_nWave2 -streamLevel
wvCloseFilterColorizeDlg -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 554722.151471 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvCloseGetStreamsDialog -win $_nWave2
wvAttrOrderConfigDlg -win $_nWave2 -close
wvCloseDetailsViewDlg -win $_nWave2
wvCloseDetailsViewDlg -win $_nWave2 -streamLevel
wvCloseFilterColorizeDlg -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvCloseFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvCloseGetStreamsDialog -win $_nWave2
wvAttrOrderConfigDlg -win $_nWave2 -close
wvCloseDetailsViewDlg -win $_nWave2
wvCloseDetailsViewDlg -win $_nWave2 -streamLevel
wvCloseFilterColorizeDlg -win $_nWave2
wvGetSignalClose -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/soc_full.fsdb}
wvRestoreSignal -win $_nWave2 \
           "/home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/signal.rc" \
           -overWriteAutoAlias on -appendSignals on
wvZoomAll -win $_nWave2
verdiShowWindow -win $_Verdi_1 -switchFS
wvZoom -win $_nWave2 701923.749230 1642964.380065
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
verdiWindowResize -win $_Verdi_1 "125" "218" "1757" "700"
verdiShowWindow -win $_Verdi_1 -switchFS
wvSelectGroup -win $_nWave2 {G3}
wvSetCursor -win $_nWave2 1353035.412863 -snap {("G3" 0)}
wvSetCursor -win $_nWave2 1563725.319114 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 1548860.316981
wvSetCursor -win $_nWave2 1567902.261861 -snap {("G1" 5)}
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 1543700.564175 2584250.713415
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 1497921.791291
wvZoom -win $_nWave2 1497921.791291 2598242.445186
wvSetCursor -win $_nWave2 1570175.223263 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 1588849.072480 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 1570893.448233 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 2337957.716092 -snap {("G3" 0)}
wvSetCursor -win $_nWave2 2625965.929024 -snap {("G1" 2)}
wvZoom -win $_nWave2 2552850.627088 3312014.420278
wvSetCursor -win $_nWave2 3043432.973862 -snap {("G3" 0)}
wvSetCursor -win $_nWave2 3370190.549077 -snap {("G1" 5)}
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3352945.836281 4236985.135924
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 3356408.131188 4313155.623882
wvSetCursor -win $_nWave2 4070846.206672 -snap {("G3" 0)}
wvSetCursor -win $_nWave2 4207613.635458 -snap {("G1" 4)}
wvZoom -win $_nWave2 4169643.499978 4969014.773247
wvSetCursor -win $_nWave2 4692991.663874 -snap {("G3" 0)}
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 0.000000
wvSetCursor -win $_nWave2 4847612.189627 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 4606548.528890 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 5050063.922022 -snap {("G2" 3)}
verdiShowWindow -win $_Verdi_1 -switchFS
verdiWindowResize -win $_Verdi_1 "80" "94" "1757" "700"
wvOpenFile -win $_nWave2 \
           {/home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/tb_soc_top.fsdb}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSetPosition -win $_nWave2 {("G2" 3)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSelectGroup -win $_nWave2 {G2}
wvSelectGroup -win $_nWave2 {G2}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSelectGroup -win $_nWave2 {G1}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSelectGroup -win $_nWave2 {G3}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvRestoreSignal -win $_nWave2 \
           "/home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/signal.rc" \
           -overWriteAutoAlias on -appendSignals on
wvSetCursor -win $_nWave2 7907735.446489 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 4488021.404226 -snap {("G5" 3)}
wvSetCursor -win $_nWave2 4629331.901840 -snap {("G5" 3)}
wvSetCursor -win $_nWave2 5307622.290389 -snap {("G5" 3)}
wvDisplayGridCount -win $_nWave2 -off
wvCloseGetStreamsDialog -win $_nWave2
wvAttrOrderConfigDlg -win $_nWave2 -close
wvCloseDetailsViewDlg -win $_nWave2
wvCloseDetailsViewDlg -win $_nWave2 -streamLevel
wvCloseFilterColorizeDlg -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 1752250.170416 -snap {("G3" 5)}
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 2803600.272665 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvCloseGetStreamsDialog -win $_nWave2
wvAttrOrderConfigDlg -win $_nWave2 -close
wvCloseDetailsViewDlg -win $_nWave2
wvCloseDetailsViewDlg -win $_nWave2 -streamLevel
wvCloseFilterColorizeDlg -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvCloseFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvCloseGetStreamsDialog -win $_nWave2
wvAttrOrderConfigDlg -win $_nWave2 -close
wvCloseDetailsViewDlg -win $_nWave2
wvCloseDetailsViewDlg -win $_nWave2 -streamLevel
wvCloseFilterColorizeDlg -win $_nWave2
wvGetSignalClose -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/tb_soc_top.fsdb}
wvRestoreSignal -win $_nWave2 \
           "/home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/signal.rc" \
           -overWriteAutoAlias on -appendSignals on
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 2662289.775051 -snap {("G5" 2)}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSetCursor -win $_nWave2 4442802.044990 -snap {("G5" 2)}
wvSetCursor -win $_nWave2 7913387.866394 -snap {("G2" 3)}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvZoom -win $_nWave2 7760772.528971 8269490.320382
wvSetCursor -win $_nWave2 7949417.708607 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 7968906.420180 -snap {("G3" 5)}
wvSetCursor -win $_nWave2 7928333.835589 -snap {("G2" 2)}
wvZoom -win $_nWave2 7923825.770634 8216156.444226
wvOpenFile -win $_nWave2 \
           {/home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/soc_dual_read_bench.fsdb}
wvZoomAll -win $_nWave2
wvCloseFile -win $_nWave2 \
           {/home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/tb_soc_top.fsdb}
wvSetPosition -win $_nWave2 {("G5" 0)}
wvDisplayGridCount -win $_nWave2 -off
wvCloseGetStreamsDialog -win $_nWave2
wvAttrOrderConfigDlg -win $_nWave2 -close
wvCloseDetailsViewDlg -win $_nWave2
wvCloseDetailsViewDlg -win $_nWave2 -streamLevel
wvCloseFilterColorizeDlg -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 584581.562025
wvRestoreSignal -win $_nWave2 \
           "/home/user18/Projects/Flash_controller/FYP_latest/source/3_dual_mode/signal.rc" \
           -overWriteAutoAlias on -appendSignals on
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 701902.251125 3403848.551154
wvZoom -win $_nWave2 727559.885822 3018984.030697
wvCloseFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvCloseGetStreamsDialog -win $_nWave2
wvAttrOrderConfigDlg -win $_nWave2 -close
wvCloseDetailsViewDlg -win $_nWave2
wvCloseDetailsViewDlg -win $_nWave2 -streamLevel
wvCloseFilterColorizeDlg -win $_nWave2
wvGetSignalClose -win $_nWave2
wvOpenFile -win $_nWave2 -mul \
           {/home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/tb_spi.fsdb} {/home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/tb_soc_top.fsdb} 
wvSelectGroup -win $_nWave2 {G1}
wvRestoreSignal -win $_nWave2 \
           "/home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/signal.rc" \
           -overWriteAutoAlias on -appendSignals on
wvZoomAll -win $_nWave2
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSelectGroup -win $_nWave2 {G2}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSelectGroup -win $_nWave2 {G3}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSelectGroup -win $_nWave2 {G4}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G5" 3)}
wvSelectGroup -win $_nWave2 {G5}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 0)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_soc_top/u_spi"
wvGetSignalSetScope -win $_nWave2 "/tb_soc_top"
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 1)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G6" \
{/tb_soc_top/HCLK} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G6" 1 )} 
wvSetPosition -win $_nWave2 {("G6" 1)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G6" \
{/tb_soc_top/HCLK} \
{/tb_soc_top/HADDRS\[31:0\]} \
{/tb_soc_top/HRDATAS\[31:0\]} \
{/tb_soc_top/HREADYS} \
{/tb_soc_top/HWDATAS\[31:0\]} \
{/tb_soc_top/HWRITES} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G6" 2 3 4 5 6 )} 
wvSetPosition -win $_nWave2 {("G6" 6)}
wvGetSignalSetScope -win $_nWave2 "/tb_soc_top/u_spi/u_spi_fsm"
wvSetPosition -win $_nWave2 {("G6" 8)}
wvSetPosition -win $_nWave2 {("G6" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G6" \
{/tb_soc_top/HCLK} \
{/tb_soc_top/HADDRS\[31:0\]} \
{/tb_soc_top/HRDATAS\[31:0\]} \
{/tb_soc_top/HREADYS} \
{/tb_soc_top/HWDATAS\[31:0\]} \
{/tb_soc_top/HWRITES} \
{/tb_soc_top/u_spi/u_spi_fsm/cmd\[7:0\]} \
{/tb_soc_top/u_spi/u_spi_fsm/flash_addr\[31:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G6" 7 8 )} 
wvSetPosition -win $_nWave2 {("G6" 8)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSelectGroup -win $_nWave2 {G3}
wvGetSignalSetScope -win $_nWave2 "/tb_soc_top/u_spi"
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G6" \
{/tb_soc_top/HCLK} \
{/tb_soc_top/HADDRS\[31:0\]} \
{/tb_soc_top/HRDATAS\[31:0\]} \
{/tb_soc_top/HREADYS} \
{/tb_soc_top/HWDATAS\[31:0\]} \
{/tb_soc_top/HWRITES} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_soc_top/u_spi/u_spi_fsm/cmd\[7:0\]} \
{/tb_soc_top/u_spi/u_spi_fsm/flash_addr\[31:0\]} \
{/tb_soc_top/u_spi/spi_clk} \
{/tb_soc_top/u_spi/spi_cs_n} \
{/tb_soc_top/u_spi/spi_miso} \
{/tb_soc_top/u_spi/spi_mosi} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
}
wvSelectSignal -win $_nWave2 {( "G2" 3 4 5 6 )} 
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G6" \
{/tb_soc_top/HCLK} \
{/tb_soc_top/HADDRS\[31:0\]} \
{/tb_soc_top/HRDATAS\[31:0\]} \
{/tb_soc_top/HREADYS} \
{/tb_soc_top/HWDATAS\[31:0\]} \
{/tb_soc_top/HWRITES} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
{/tb_soc_top/u_spi/u_spi_fsm/cmd\[7:0\]} \
{/tb_soc_top/u_spi/u_spi_fsm/flash_addr\[31:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G3" \
{/tb_soc_top/u_spi/spi_clk} \
{/tb_soc_top/u_spi/spi_cs_n} \
{/tb_soc_top/u_spi/spi_miso} \
{/tb_soc_top/u_spi/spi_mosi} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvGetSignalClose -win $_nWave2
wvZoomAll -win $_nWave2
wvZoom -win $_nWave2 7285969.256987 8162094.342195
wvSelectSignal -win $_nWave2 {( "G6" 3 )} 
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSetPosition -win $_nWave2 {("G6" 6)}
wvSetPosition -win $_nWave2 {("G6" 5)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 5)}
wvSelectSignal -win $_nWave2 {( "G6" 6 )} 
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetPosition -win $_nWave2 {("G6" 3)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G6" 3)}
wvSetPosition -win $_nWave2 {("G6" 4)}
wvSetCursor -win $_nWave2 7937349.965499 -snap {("G4" 0)}
wvSelectGroup -win $_nWave2 {G6}
wvSelectGroup -win $_nWave2 {G6}
wvSelectGroup -win $_nWave2 {G6}
wvRenameGroup -win $_nWave2 {G6} {System}
wvSelectSignal -win $_nWave2 {( "System" 6 )} 
wvSelectGroup -win $_nWave2 {G2}
wvRenameGroup -win $_nWave2 {G2} {FSM}
wvSelectGroup -win $_nWave2 {G3}
wvSelectSignal -win $_nWave2 {( "FSM" 2 )} 
wvSelectSignal -win $_nWave2 {( "FSM" 2 )} 
wvSelectGroup -win $_nWave2 {G3}
wvRenameGroup -win $_nWave2 {G3} {Physical spi}
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 2786643.012952 -snap {("G4" 0)}
wvZoom -win $_nWave2 423931.492843 2730118.813906
wvSetCursor -win $_nWave2 966286.384299 -snap {("Physical spi" 2)}
wvSetCursor -win $_nWave2 950565.952663 -snap {("System" 6)}
wvSetCursor -win $_nWave2 568559.463898 -snap {("System" 4)}
wvSetCursor -win $_nWave2 607860.542989 -snap {("System" 4)}
wvSetCursor -win $_nWave2 667598.183207 -snap {("System" 4)}
wvSetCursor -win $_nWave2 746200.341389 -snap {("System" 4)}
wvZoom -win $_nWave2 519826.125825 1145499.304954
wvSetCursor -win $_nWave2 869981.326960 -snap {("System" 2)}
wvSetCursor -win $_nWave2 672086.061032 -snap {("System" 2)}
wvSetCursor -win $_nWave2 687013.505660 -snap {("System" 2)}
wvSetCursor -win $_nWave2 706205.934468 -snap {("System" 2)}
wvSetCursor -win $_nWave2 723692.369604 -snap {("System" 2)}
wvSetCursor -win $_nWave2 746296.785755 -snap {("System" 2)}
wvSetCursor -win $_nWave2 768474.703488 -snap {("System" 5)}
wvSetCursor -win $_nWave2 621759.247714 -snap {("System" 5)}
wvSetCursor -win $_nWave2 588065.872696 -snap {("System" 2)}
wvSetCursor -win $_nWave2 867496.377448 -snap {("System" 2)}
wvSetCursor -win $_nWave2 889674.295181 -snap {("System" 5)}
wvSetCursor -win $_nWave2 908013.727153 -snap {("System" 2)}
wvSetCursor -win $_nWave2 890953.790435 -snap {("System" 2)}
wvSetCursor -win $_nWave2 967297.007247 -snap {("Physical spi" 2)}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_soc_top"
wvGetSignalSetScope -win $_nWave2 "/tb_soc_top/u_spi"
wvGetSignalSetScope -win $_nWave2 "/tb_soc_top/u_spi"
wvGetSignalSetScope -win $_nWave2 "/tb_soc_top/u_spi/u_spi_fsm"
wvGetSignalSetScope -win $_nWave2 "/tb_soc_top"
wvGetSignalSetScope -win $_nWave2 "/tb_soc_top/u_spi"
wvSetPosition -win $_nWave2 {("System" 5)}
wvSetPosition -win $_nWave2 {("System" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"System" \
{/tb_soc_top/HCLK} \
{/tb_soc_top/HADDRS\[31:0\]} \
{/tb_soc_top/HREADYS} \
{/tb_soc_top/HWRITES} \
{/tb_soc_top/u_spi/ctrl_reg\[31:0\]} \
{/tb_soc_top/HWDATAS\[31:0\]} \
{/tb_soc_top/HRDATAS\[31:0\]} \
}
wvAddSignal -win $_nWave2 -group {"FSM" \
{/tb_soc_top/u_spi/u_spi_fsm/cmd\[7:0\]} \
{/tb_soc_top/u_spi/u_spi_fsm/flash_addr\[31:0\]} \
}
wvAddSignal -win $_nWave2 -group {"Physical spi" \
{/tb_soc_top/u_spi/spi_clk} \
{/tb_soc_top/u_spi/spi_cs_n} \
{/tb_soc_top/u_spi/spi_miso} \
{/tb_soc_top/u_spi/spi_mosi} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "System" 5 )} 
wvSetPosition -win $_nWave2 {("System" 5)}
wvSetPosition -win $_nWave2 {("System" 5)}
wvSetPosition -win $_nWave2 {("System" 5)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"System" \
{/tb_soc_top/HCLK} \
{/tb_soc_top/HADDRS\[31:0\]} \
{/tb_soc_top/HREADYS} \
{/tb_soc_top/HWRITES} \
{/tb_soc_top/u_spi/ctrl_reg\[31:0\]} \
{/tb_soc_top/HWDATAS\[31:0\]} \
{/tb_soc_top/HRDATAS\[31:0\]} \
}
wvAddSignal -win $_nWave2 -group {"FSM" \
{/tb_soc_top/u_spi/u_spi_fsm/cmd\[7:0\]} \
{/tb_soc_top/u_spi/u_spi_fsm/flash_addr\[31:0\]} \
}
wvAddSignal -win $_nWave2 -group {"Physical spi" \
{/tb_soc_top/u_spi/spi_clk} \
{/tb_soc_top/u_spi/spi_cs_n} \
{/tb_soc_top/u_spi/spi_miso} \
{/tb_soc_top/u_spi/spi_mosi} \
}
wvAddSignal -win $_nWave2 -group {"G4" \
}
wvSelectSignal -win $_nWave2 {( "System" 5 )} 
wvSetPosition -win $_nWave2 {("System" 5)}
wvGetSignalClose -win $_nWave2
wvSetCursor -win $_nWave2 947678.080022 -snap {("System" 5)}
wvSetCursor -win $_nWave2 869628.869537 -snap {("System" 4)}
wvSetCursor -win $_nWave2 888821.298345 -snap {("System" 2)}
wvSetPosition -win $_nWave2 {("System" 6)}
wvSetPosition -win $_nWave2 {("System" 7)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("System" 7)}
wvSetCursor -win $_nWave2 873893.853717 -snap {("G4" 0)}
wvSetPosition -win $_nWave2 {("System" 6)}
wvSetPosition -win $_nWave2 {("System" 5)}
wvSetPosition -win $_nWave2 {("System" 4)}
wvSetPosition -win $_nWave2 {("System" 3)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("System" 3)}
wvSetPosition -win $_nWave2 {("System" 4)}
wvSetPosition -win $_nWave2 {("System" 5)}
wvSetPosition -win $_nWave2 {("System" 6)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("System" 6)}
wvSelectSignal -win $_nWave2 {( "System" 3 )} 
wvSetPosition -win $_nWave2 {("System" 2)}
wvSetPosition -win $_nWave2 {("System" 1)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("System" 1)}
wvSetPosition -win $_nWave2 {("System" 2)}
wvSetCursor -win $_nWave2 843185.967625 -snap {("G4" 0)}
wvSetCursor -win $_nWave2 872187.860045 -snap {("System" 4)}
wvSetCursor -win $_nWave2 888821.298345 -snap {("System" 3)}
wvSetCursor -win $_nWave2 910146.219242 -snap {("System" 3)}
wvSetCursor -win $_nWave2 927632.654378 -snap {("System" 4)}
wvSetCursor -win $_nWave2 948957.575276 -snap {("System" 5)}
wvSetCursor -win $_nWave2 970413.709419 -snap {("Physical spi" 2)}
wvSetCursor -win $_nWave2 950794.782194 -snap {("System" 7)}
wvSetCursor -win $_nWave2 969560.712583 -snap {("Physical spi" 2)}
wvSetCursor -win $_nWave2 1053154.402501 -snap {("System" 7)}
wvSetCursor -win $_nWave2 1069361.342383 -snap {("System" 6)}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSetCursor -win $_nWave2 1089406.768027 -snap {("Physical spi" 4)}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSetCursor -win $_nWave2 1030549.986350 -snap {("System" 3)}
wvSetCursor -win $_nWave2 1049315.916740 -snap {("System" 3)}
wvSetCursor -win $_nWave2 1110731.688924 -snap {("System" 3)}
wvSetCursor -win $_nWave2 1130777.114568 -snap {("System" 3)}
wvSetCursor -win $_nWave2 1210958.817142 -snap {("System" 3)}
wvSetCursor -win $_nWave2 1226312.760188 -snap {("System" 3)}
wvSetCursor -win $_nWave2 1308626.954852 -snap {("System" 3)}
wvSetCursor -win $_nWave2 1326966.386824 -snap {("System" 3)}
wvSetCursor -win $_nWave2 1410133.578324 -snap {("System" 3)}
wvSetCursor -win $_nWave2 1431884.997639 -snap {("System" 3)}
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 1627008.023850 -snap {("System" 3)}
wvSearchNext -win $_nWave2
wvSetCursor -win $_nWave2 2672526.245607 -snap {("System" 3)}
wvSetCursor -win $_nWave2 2689586.182325 -snap {("FSM" 2)}
wvSetCursor -win $_nWave2 2709205.109551 -snap {("System" 3)}
wvSetCursor -win $_nWave2 2791945.802632 -snap {("System" 3)}
wvSetCursor -win $_nWave2 2809005.739350 -snap {("System" 3)}
wvSetCursor -win $_nWave2 2865303.530519 -snap {("System" 3)}
wvSetCursor -win $_nWave2 4416094.428021 -snap {("System" 3)}
wvSetCursor -win $_nWave2 3581863.522515 -snap {("System" 2)}
wvSetCursor -win $_nWave2 595391.791455 -snap {("System" 3)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 2432746.975975 -snap {("System" 3)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 2494589.246578 -snap {("System" 3)}
wvSetCursor -win $_nWave2 2509943.189624 -snap {("System" 3)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 520470.347648 2705886.162236
wvSelectSignal -win $_nWave2 {( "System" 7 )} 
wvSelectSignal -win $_nWave2 {( "System" 7 )} 
wvSetRadix -win $_nWave2 -format Bin
wvSetCursor -win $_nWave2 964406.211825 -snap {("System" 7)}
wvSetCursor -win $_nWave2 1037402.377411 -snap {("System" 7)}
wvSetCursor -win $_nWave2 1064217.295381 -snap {("System" 7)}
wvSelectSignal -win $_nWave2 {( "System" 7 )} 
wvSetRadix -win $_nWave2 -format Hex
wvSetCursor -win $_nWave2 807985.856997 -snap {("G4" 0)}
wvSetCursor -win $_nWave2 2486897.665478 -snap {("System" 3)}
wvSetCursor -win $_nWave2 2510733.148118 -snap {("System" 3)}
wvSetCursor -win $_nWave2 2530099.477763 -snap {("System" 5)}
wvSetCursor -win $_nWave2 2513712.583448 -snap {("System" 3)}
wvSetCursor -win $_nWave2 2227792.819402 -snap {("G4" 0)}
wvSelectSignal -win $_nWave2 {( "Physical spi" 4 )} 
wvSelectGroup -win $_nWave2 {G4}
wvSetCursor -win $_nWave2 2049015.597229 -snap {("G4" 0)}
wvSetCursor -win $_nWave2 2626838.477394 -snap {("System" 4)}
wvSetCursor -win $_nWave2 2646206.009796 -snap {("System" 3)}
wvSetCursor -win $_nWave2 2665573.542198 -snap {("System" 3)}
wvSetCursor -win $_nWave2 2686430.884785 -snap {("System" 4)}
wvSetCursor -win $_nWave2 4405671.838017 -snap {("System" 5)}
wvSetCursor -win $_nWave2 4425039.370419 -snap {("System" 5)}
wvSetCursor -win $_nWave2 2530000.815383 -snap {("System" 5)}
wvSetCursor -win $_nWave2 4264139.870463 -snap {("System" 7)}
wvSetCursor -win $_nWave2 6027628.186183 -snap {("System" 3)}
wvSetCursor -win $_nWave2 7783443.979451 -snap {("System" 3)}
wvZoom -win $_nWave2 7785564.537175 8207180.819467
wvSetCursor -win $_nWave2 8088954.877527 -snap {("System" 7)}
wvSetCursor -win $_nWave2 8109089.083453 -snap {("System" 7)}
debExit
