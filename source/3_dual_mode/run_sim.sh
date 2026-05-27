#!/bin/bash

echo "Compiling Dual-Mode Architecture..."

vcs -sverilog -debug_access+all -timescale=1ns/1ps $INC_FLAGS $Y_FLAGS +libext+.v \
  +incdir+../0_shared_ip/arm_m3_core/logical/cortexm3_integration/verilog \
  +incdir+../0_shared_ip/arm_m3_core/logical/cortexm3/verilog \
  +incdir+../0_shared_ip/ \
  ../0_shared_ip/arm_m3_core/logical/cortexm3_integration/verilog/CORTEXM3INTEGRATION.v \
  ../0_shared_ip/arm_m3_core/logical/cortexm3/verilog/CORTEXM3.v \
  ../0_shared_ip/tb_top_soc.sv \
  ../0_shared_ip/boot_rom.v \
  ahb_wrapper_dual.sv \
  ../0_shared_ip/qspi_core_full.sv \
  ../0_shared_ip/sync_fifo_full.sv \
  ../0_shared_ip/flash_model_final.sv

echo "Compilation Finished! Running Simulation..."
./simv
