#!/bin/bash
set -e

echo "=== 1. Compiling Dual-Mode Common Read Benchmark Firmware ==="
arm-none-eabi-gcc -c -mcpu=cortex-m3 -mthumb -O1 startup.c -o startup.o
arm-none-eabi-gcc -c -mcpu=cortex-m3 -mthumb -O1 main_read_bench.c -o main.o
arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -nostartfiles -T linker.ld startup.o main.o -o firmware.elf
arm-none-eabi-objcopy -O verilog -j .text -j .rodata firmware.elf firmware.hex
cp firmware.hex ../

echo "=== 2. Compiling Dual-Mode Read Benchmark Hardware with VCS ==="
cd ..

ARM_IP_ROOT="/home/user18/Projects/Flash_controller/arm_soc_project/ARM_IPs/Cortex-M3/AT425-BU-50000-r2p1-00rel1"
LOGICAL="$ARM_IP_ROOT/logical"

vcs -sverilog -debug_access+all -timescale=1ns/1ps $INC_FLAGS $Y_FLAGS +libext+.v \
  +define+ARM_TestBench \
  +incdir+"$LOGICAL/cm3_lic_defs/verilog" \
  +incdir+"$LOGICAL/cortexm3_integration/verilog" \
  +incdir+"$LOGICAL/cortexm3/verilog" \
  +incdir+"$LOGICAL/cm3_dpu/verilog" \
  +incdir+"$LOGICAL/cm3_bus_matrix/verilog" \
  +incdir+"$LOGICAL/cm3_mpu/verilog" \
  +incdir+"$LOGICAL/cm3_nvic/verilog" \
  +incdir+"$LOGICAL/cm3_wic/verilog" \
  +incdir+"$LOGICAL/cm3_tpiu/verilog" \
  +incdir+"$LOGICAL/cm3_fpb/verilog" \
  +incdir+"$LOGICAL/cm3_dwt/verilog" \
  +incdir+"$LOGICAL/cm3_itm/verilog" \
  +incdir+"$LOGICAL/cm3_etm/verilog" \
  +incdir+"$LOGICAL/cm3_dap_ahb_ap/verilog" \
  +incdir+"$LOGICAL/dapswjdp/verilog" \
  +incdir+"$LOGICAL/models/cells" \
  -y "$LOGICAL/cortexm3/verilog" \
  -y "$LOGICAL/cortexm3_integration/verilog" \
  -y "$LOGICAL/cm3_bus_matrix/verilog" \
  -y "$LOGICAL/cm3_dpu/verilog" \
  -y "$LOGICAL/cm3_mpu/verilog" \
  -y "$LOGICAL/cm3_nvic/verilog" \
  -y "$LOGICAL/cm3_wic/verilog" \
  -y "$LOGICAL/cm3_tpiu/verilog" \
  -y "$LOGICAL/cm3_fpb/verilog" \
  -y "$LOGICAL/cm3_dwt/verilog" \
  -y "$LOGICAL/cm3_itm/verilog" \
  -y "$LOGICAL/cm3_etm/verilog" \
  -y "$LOGICAL/cm3_dap_ahb_ap/verilog" \
  -y "$LOGICAL/dapswjdp/verilog" \
  -y "$LOGICAL/models/cells" \
  "$LOGICAL/cortexm3_integration/verilog/CORTEXM3INTEGRATION.v" \
  "$LOGICAL/cortexm3/verilog/CORTEXM3.v" \
  ./3_dual_mode/tb_top_soc_read_bench.sv \
  ./0_shared_ip/boot_rom.v \
  ./3_dual_mode/ahb_wrapper_dual.sv \
  ./3_dual_mode/qspi_dual.sv \
  ./0_shared_ip/sync_fifo_full.sv \
  ./0_shared_ip/flash_model_final.sv

if [[ ! -x ./simv ]]; then
  echo "ERROR: VCS completed but ./simv was not generated."
  exit 1
fi

echo "=== 3. Running Dual-Mode Read Benchmark Simulation ==="
./simv

mv simv simv.daidir *.fsdb novas* verdi* 3_dual_mode/ 2>/dev/null || true
cd 3_dual_mode
