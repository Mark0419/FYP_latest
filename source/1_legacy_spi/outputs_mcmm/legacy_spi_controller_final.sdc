################################################################################
#
# Design name:  ahb_spi_legacy
#
# Created by fc write_sdc on Thu May 28 15:58:06 2026
#
################################################################################

set sdc_version 2.1
set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA

################################################################################
#
# Units
# time_unit               : 1e-09
# resistance_unit         : 1000000
# capacitive_load_unit    : 1e-15
# voltage_unit            : 1
# current_unit            : 1e-06
# power_unit              : 1e-12
################################################################################


# Mode: func_mode
# Corner: ff_corner
# Scenario: func_ff

# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 66
create_clock -name HCLK -period 20 -waveform {0 10} [get_ports {HCLK}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 73
create_generated_clock -name SPI_CLK -divide_by 1 -source [get_ports {HCLK}] \
    [get_ports {spi_clk}]
set_propagated_clock [get_clocks {HCLK}]
set_propagated_clock [get_clocks {SPI_CLK}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 524
set_false_path -from [get_ports {HRESETn}]
set_load -pin_load 5 [get_ports {HRDATA[31]}]
set_load -pin_load 5 [get_ports {HRDATA[30]}]
set_load -pin_load 5 [get_ports {HRDATA[29]}]
set_load -pin_load 5 [get_ports {HRDATA[28]}]
set_load -pin_load 5 [get_ports {HRDATA[27]}]
set_load -pin_load 5 [get_ports {HRDATA[26]}]
set_load -pin_load 5 [get_ports {HRDATA[25]}]
set_load -pin_load 5 [get_ports {HRDATA[24]}]
set_load -pin_load 5 [get_ports {HRDATA[23]}]
set_load -pin_load 5 [get_ports {HRDATA[22]}]
set_load -pin_load 5 [get_ports {HRDATA[21]}]
set_load -pin_load 5 [get_ports {HRDATA[20]}]
set_load -pin_load 5 [get_ports {HRDATA[19]}]
set_load -pin_load 5 [get_ports {HRDATA[18]}]
set_load -pin_load 5 [get_ports {HRDATA[17]}]
set_load -pin_load 5 [get_ports {HRDATA[16]}]
set_load -pin_load 5 [get_ports {HRDATA[15]}]
set_load -pin_load 5 [get_ports {HRDATA[14]}]
set_load -pin_load 5 [get_ports {HRDATA[13]}]
set_load -pin_load 5 [get_ports {HRDATA[12]}]
set_load -pin_load 5 [get_ports {HRDATA[11]}]
set_load -pin_load 5 [get_ports {HRDATA[10]}]
set_load -pin_load 5 [get_ports {HRDATA[9]}]
set_load -pin_load 5 [get_ports {HRDATA[8]}]
set_load -pin_load 5 [get_ports {HRDATA[7]}]
set_load -pin_load 5 [get_ports {HRDATA[6]}]
set_load -pin_load 5 [get_ports {HRDATA[5]}]
set_load -pin_load 5 [get_ports {HRDATA[4]}]
set_load -pin_load 5 [get_ports {HRDATA[3]}]
set_load -pin_load 5 [get_ports {HRDATA[2]}]
set_load -pin_load 5 [get_ports {HRDATA[1]}]
set_load -pin_load 5 [get_ports {HRDATA[0]}]
set_load -pin_load 5 [get_ports {HREADYOUT}]
set_load -pin_load 5 [get_ports {HRESP[1]}]
set_load -pin_load 5 [get_ports {HRESP[0]}]
set_load -pin_load 5 [get_ports {HSPLIT[15]}]
set_load -pin_load 5 [get_ports {HSPLIT[14]}]
set_load -pin_load 5 [get_ports {HSPLIT[13]}]
set_load -pin_load 5 [get_ports {HSPLIT[12]}]
set_load -pin_load 5 [get_ports {HSPLIT[11]}]
set_load -pin_load 5 [get_ports {HSPLIT[10]}]
set_load -pin_load 5 [get_ports {HSPLIT[9]}]
set_load -pin_load 5 [get_ports {HSPLIT[8]}]
set_load -pin_load 5 [get_ports {HSPLIT[7]}]
set_load -pin_load 5 [get_ports {HSPLIT[6]}]
set_load -pin_load 5 [get_ports {HSPLIT[5]}]
set_load -pin_load 5 [get_ports {HSPLIT[4]}]
set_load -pin_load 5 [get_ports {HSPLIT[3]}]
set_load -pin_load 5 [get_ports {HSPLIT[2]}]
set_load -pin_load 5 [get_ports {HSPLIT[1]}]
set_load -pin_load 5 [get_ports {HSPLIT[0]}]
set_load -pin_load 5 [get_ports {spi_cs_n}]
set_load -pin_load 5 [get_ports {spi_clk}]
set_load -pin_load 5 [get_ports {spi_mosi}]
# Warning: Libcell power domain derates are skipped!

# Set latency for io paths.
# -origin useful_skew
set_clock_latency 0.515977 [get_clocks {HCLK}]
# Set propagated on clock sources to avoid removing latency for IO paths.
set_propagated_clock  [get_ports {HCLK}]
set_clock_uncertainty -setup 0.5 [get_clocks {HCLK}]
set_clock_uncertainty -hold 0.1 [get_clocks {HCLK}]
set_clock_uncertainty -setup 0.5 [get_clocks {SPI_CLK}]
set_clock_uncertainty -hold 0.1 [get_clocks {SPI_CLK}]
set_clock_transition 0.2 [get_clocks {HCLK}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 352; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 353
set_input_transition 0.2 [get_ports {HRESETn}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 354; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 355
set_input_transition 0.2 [get_ports {HSEL}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 356; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 357
set_input_transition 0.2 [get_ports {HADDR[31]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 358; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 359
set_input_transition 0.2 [get_ports {HADDR[30]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 360; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 361
set_input_transition 0.2 [get_ports {HADDR[29]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 362; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 363
set_input_transition 0.2 [get_ports {HADDR[28]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 364; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 365
set_input_transition 0.2 [get_ports {HADDR[27]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 366; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 367
set_input_transition 0.2 [get_ports {HADDR[26]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 368; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 369
set_input_transition 0.2 [get_ports {HADDR[25]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 370; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 371
set_input_transition 0.2 [get_ports {HADDR[24]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 372; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 373
set_input_transition 0.2 [get_ports {HADDR[23]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 374; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 375
set_input_transition 0.2 [get_ports {HADDR[22]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 376; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 377
set_input_transition 0.2 [get_ports {HADDR[21]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 378; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 379
set_input_transition 0.2 [get_ports {HADDR[20]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 380; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 381
set_input_transition 0.2 [get_ports {HADDR[19]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 382; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 383
set_input_transition 0.2 [get_ports {HADDR[18]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 384; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 385
set_input_transition 0.2 [get_ports {HADDR[17]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 386; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 387
set_input_transition 0.2 [get_ports {HADDR[16]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 388; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 389
set_input_transition 0.2 [get_ports {HADDR[15]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 390; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 391
set_input_transition 0.2 [get_ports {HADDR[14]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 392; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 393
set_input_transition 0.2 [get_ports {HADDR[13]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 394; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 395
set_input_transition 0.2 [get_ports {HADDR[12]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 396; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 397
set_input_transition 0.2 [get_ports {HADDR[11]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 398; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 399
set_input_transition 0.2 [get_ports {HADDR[10]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 400; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 401
set_input_transition 0.2 [get_ports {HADDR[9]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 402; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 403
set_input_transition 0.2 [get_ports {HADDR[8]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 404; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 405
set_input_transition 0.2 [get_ports {HADDR[7]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 406; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 407
set_input_transition 0.2 [get_ports {HADDR[6]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 408; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 409
set_input_transition 0.2 [get_ports {HADDR[5]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 410; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 411
set_input_transition 0.2 [get_ports {HADDR[4]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 412; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 413
set_input_transition 0.2 [get_ports {HADDR[3]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 414; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 415
set_input_transition 0.2 [get_ports {HADDR[2]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 416; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 417
set_input_transition 0.2 [get_ports {HADDR[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 418; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 419
set_input_transition 0.2 [get_ports {HADDR[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 420; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 421
set_input_transition 0.2 [get_ports {HTRANS[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 422; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 423
set_input_transition 0.2 [get_ports {HTRANS[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 424; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 425
set_input_transition 0.2 [get_ports {HWRITE}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 426; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 427
set_input_transition 0.2 [get_ports {HSIZE[2]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 428; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 429
set_input_transition 0.2 [get_ports {HSIZE[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 430; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 431
set_input_transition 0.2 [get_ports {HSIZE[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 432; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 433
set_input_transition 0.2 [get_ports {HBURST[2]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 434; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 435
set_input_transition 0.2 [get_ports {HBURST[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 436; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 437
set_input_transition 0.2 [get_ports {HBURST[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 438; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 439
set_input_transition 0.2 [get_ports {HPROT[3]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 440; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 441
set_input_transition 0.2 [get_ports {HPROT[2]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 442; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 443
set_input_transition 0.2 [get_ports {HPROT[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 444; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 445
set_input_transition 0.2 [get_ports {HPROT[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 446; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 447
set_input_transition 0.2 [get_ports {HMASTER[3]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 448; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 449
set_input_transition 0.2 [get_ports {HMASTER[2]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 450; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 451
set_input_transition 0.2 [get_ports {HMASTER[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 452; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 453
set_input_transition 0.2 [get_ports {HMASTER[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 454; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 455
set_input_transition 0.2 [get_ports {HMASTLOCK}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 456; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 457
set_input_transition 0.2 [get_ports {HWDATA[31]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 458; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 459
set_input_transition 0.2 [get_ports {HWDATA[30]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 460; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 461
set_input_transition 0.2 [get_ports {HWDATA[29]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 462; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 463
set_input_transition 0.2 [get_ports {HWDATA[28]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 464; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 465
set_input_transition 0.2 [get_ports {HWDATA[27]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 466; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 467
set_input_transition 0.2 [get_ports {HWDATA[26]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 468; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 469
set_input_transition 0.2 [get_ports {HWDATA[25]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 470; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 471
set_input_transition 0.2 [get_ports {HWDATA[24]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 472; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 473
set_input_transition 0.2 [get_ports {HWDATA[23]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 474; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 475
set_input_transition 0.2 [get_ports {HWDATA[22]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 476; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 477
set_input_transition 0.2 [get_ports {HWDATA[21]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 478; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 479
set_input_transition 0.2 [get_ports {HWDATA[20]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 480; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 481
set_input_transition 0.2 [get_ports {HWDATA[19]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 482; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 483
set_input_transition 0.2 [get_ports {HWDATA[18]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 484; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 485
set_input_transition 0.2 [get_ports {HWDATA[17]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 486; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 487
set_input_transition 0.2 [get_ports {HWDATA[16]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 488; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 489
set_input_transition 0.2 [get_ports {HWDATA[15]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 490; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 491
set_input_transition 0.2 [get_ports {HWDATA[14]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 492; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 493
set_input_transition 0.2 [get_ports {HWDATA[13]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 494; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 495
set_input_transition 0.2 [get_ports {HWDATA[12]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 496; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 497
set_input_transition 0.2 [get_ports {HWDATA[11]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 498; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 499
set_input_transition 0.2 [get_ports {HWDATA[10]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 500; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 501
set_input_transition 0.2 [get_ports {HWDATA[9]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 502; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 503
set_input_transition 0.2 [get_ports {HWDATA[8]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 504; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 505
set_input_transition 0.2 [get_ports {HWDATA[7]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 506; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 507
set_input_transition 0.2 [get_ports {HWDATA[6]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 508; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 509
set_input_transition 0.2 [get_ports {HWDATA[5]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 510; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 511
set_input_transition 0.2 [get_ports {HWDATA[4]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 512; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 513
set_input_transition 0.2 [get_ports {HWDATA[3]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 514; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 515
set_input_transition 0.2 [get_ports {HWDATA[2]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 516; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 517
set_input_transition 0.2 [get_ports {HWDATA[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 518; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 519
set_input_transition 0.2 [get_ports {HWDATA[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 520; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 521
set_input_transition 0.2 [get_ports {HREADY}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 522; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 523
set_input_transition 0.2 [get_ports {spi_miso}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 76; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 77
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HSEL}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HSEL}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 78; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 79
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[31]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[31]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 80; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 81
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[30]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[30]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 82; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 83
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[29]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[29]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 84; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 85
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[28]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[28]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 86; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 87
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[27]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[27]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 88; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 89
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[26]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[26]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 90; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 91
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[25]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[25]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 92; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 93
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[24]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[24]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 94; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 95
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[23]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[23]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 96; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 97
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[22]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[22]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 98; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 99
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[21]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[21]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 100; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 101
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[20]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[20]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 102; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 103
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[19]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[19]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 104; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 105
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[18]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[18]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 106; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 107
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[17]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[17]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 108; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 109
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[16]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[16]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 110; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 111
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[15]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[15]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 112; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 113
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[14]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[14]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 114; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 115
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[13]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[13]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 116; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 117
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[12]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[12]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 118; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 119
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[11]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[11]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 120; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 121
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[10]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[10]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 122; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 123
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[9]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[9]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 124; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 125
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[8]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[8]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 126; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 127
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[7]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[7]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 128; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 129
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[6]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[6]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 130; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 131
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[5]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[5]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 132; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 133
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[4]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[4]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 134; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 135
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[3]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[3]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 136; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 137
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[2]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[2]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 138; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 139
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[1]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 140; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 141
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HADDR[0]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HADDR[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 142; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 143
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HTRANS[1]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HTRANS[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 144; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 145
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HTRANS[0]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HTRANS[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 146; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 147
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWRITE}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWRITE}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 148; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 149
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HSIZE[2]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HSIZE[2]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 150; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 151
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HSIZE[1]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HSIZE[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 152; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 153
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HSIZE[0]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HSIZE[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 154; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 155
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HBURST[2]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HBURST[2]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 156; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 157
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HBURST[1]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HBURST[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 158; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 159
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HBURST[0]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HBURST[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 160; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 161
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HPROT[3]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HPROT[3]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 162; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 163
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HPROT[2]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HPROT[2]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 164; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 165
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HPROT[1]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HPROT[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 166; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 167
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HPROT[0]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HPROT[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 168; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 169
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HMASTER[3]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HMASTER[3]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 170; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 171
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HMASTER[2]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HMASTER[2]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 172; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 173
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HMASTER[1]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HMASTER[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 174; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 175
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HMASTER[0]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HMASTER[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 176; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 177
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HMASTLOCK}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HMASTLOCK}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 178; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 179
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[31]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[31]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 180; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 181
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[30]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[30]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 182; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 183
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[29]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[29]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 184; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 185
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[28]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[28]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 186; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 187
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[27]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[27]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 188; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 189
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[26]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[26]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 190; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 191
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[25]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[25]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 192; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 193
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[24]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[24]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 194; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 195
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[23]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[23]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 196; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 197
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[22]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[22]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 198; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 199
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[21]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[21]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 200; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 201
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[20]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[20]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 202; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 203
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[19]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[19]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 204; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 205
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[18]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[18]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 206; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 207
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[17]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[17]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 208; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 209
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[16]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[16]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 210; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 211
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[15]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[15]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 212; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 213
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[14]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[14]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 214; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 215
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[13]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[13]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 216; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 217
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[12]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[12]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 218; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 219
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[11]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[11]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 220; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 221
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[10]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[10]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 222; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 223
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[9]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[9]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 224; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 225
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[8]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[8]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 226; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 227
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[7]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[7]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 228; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 229
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[6]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[6]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 230; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 231
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[5]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[5]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 232; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 233
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[4]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[4]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 234; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 235
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[3]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[3]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 236; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 237
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[2]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[2]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 238; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 239
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[1]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 240; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 241
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HWDATA[0]}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HWDATA[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 242; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 243
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HREADY}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HREADY}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 246; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 247
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[31]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[31]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 248; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 249
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[30]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[30]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 250; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 251
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[29]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[29]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 252; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 253
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[28]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[28]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 254; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 255
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[27]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[27]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 256; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 257
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[26]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[26]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 258; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 259
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[25]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[25]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 260; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 261
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[24]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[24]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 262; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 263
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[23]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[23]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 264; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 265
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[22]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[22]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 266; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 267
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[21]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[21]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 268; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 269
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[20]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[20]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 270; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 271
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[19]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[19]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 272; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 273
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[18]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[18]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 274; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 275
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[17]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[17]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 276; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 277
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[16]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[16]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 278; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 279
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[15]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[15]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 280; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 281
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[14]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[14]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 282; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 283
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[13]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[13]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 284; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 285
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[12]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[12]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 286; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 287
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[11]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[11]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 288; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 289
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[10]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[10]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 290; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 291
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[9]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[9]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 292; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 293
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[8]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[8]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 294; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 295
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[7]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[7]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 296; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 297
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[6]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[6]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 298; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 299
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[5]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[5]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 300; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 301
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[4]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[4]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 302; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 303
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[3]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[3]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 304; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 305
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[2]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[2]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 306; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 307
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[1]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 308; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 309
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRDATA[0]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRDATA[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 310; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 311
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HREADYOUT}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HREADYOUT}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 312; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 313
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRESP[1]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRESP[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 314; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 315
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HRESP[0]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HRESP[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 316; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 317
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HSPLIT[15]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HSPLIT[15]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 318; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 319
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HSPLIT[14]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HSPLIT[14]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 320; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 321
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HSPLIT[13]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HSPLIT[13]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 322; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 323
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HSPLIT[12]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HSPLIT[12]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 324; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 325
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HSPLIT[11]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HSPLIT[11]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 326; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 327
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HSPLIT[10]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HSPLIT[10]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 328; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 329
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HSPLIT[9]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HSPLIT[9]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 330; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 331
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HSPLIT[8]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HSPLIT[8]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 332; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 333
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HSPLIT[7]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HSPLIT[7]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 334; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 335
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HSPLIT[6]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HSPLIT[6]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 336; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 337
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HSPLIT[5]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HSPLIT[5]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 338; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 339
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HSPLIT[4]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HSPLIT[4]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 340; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 341
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HSPLIT[3]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HSPLIT[3]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 342; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 343
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HSPLIT[2]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HSPLIT[2]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 344; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 345
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HSPLIT[1]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HSPLIT[1]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 346; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 347
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {HSPLIT[0]}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {HSPLIT[0]}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 348; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 349
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {spi_cs_n}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {spi_cs_n}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 350; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 351
set_output_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {spi_mosi}]
set_output_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {spi_mosi}]
# /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 244; \
#   /home/user18/Projects/Flash_controller/FYP_latest/source/1_legacy_spi/outputs/legacy_spi_controller.sdc, \
#   line 245
set_input_delay -clock [get_clocks {HCLK}] -min 1 [get_ports {spi_miso}]
set_input_delay -clock [get_clocks {HCLK}] -max 8 [get_ports {spi_miso}]
set_max_transition 1.5 [current_design]
