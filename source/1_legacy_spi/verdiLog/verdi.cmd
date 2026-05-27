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
