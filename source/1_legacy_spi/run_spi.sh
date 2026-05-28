
#!/bin/bash
set -e

echo "======================================================="
echo " PHASE 1: COMPILING C-CODE BOOTLOADER (SOFTWARE)"
echo "======================================================="
# 1. Compile startup.c and bootloader.c using the custom linker script
arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O1 -T linker.ld startup.c bootloader.c -o bootloader.elf -nostartfiles

# 2. Extract the raw hexadecimal payload for the Verilog Boot ROM
arm-none-eabi-objcopy -O binary bootloader.elf boot_rom.bin
hexdump -v -e '1/4 "%08x\n"' boot_rom.bin > boot_rom.hex

echo "Software compilation complete. boot_rom.hex generated."
echo ""

echo "======================================================="
echo " PHASE 2: COMPILING HARDWARE WITH VCS"
echo "======================================================="

# Define your exact absolute paths
ARM_IP_ROOT="/home/user18/Projects/Flash_controller/arm_soc_project/ARM_IPs/Cortex-M3/AT425-BU-50000-r2p1-00rel1"
LOGICAL="$ARM_IP_ROOT/logical"

# Run VCS: Include ARM IPs AND your custom FYP IPs
vcs +lint=TFIPC-L -sverilog -debug_access+all -timescale=1ns/1ps +libext+.v \
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
  ahb_rom.v \
  sram_top_512kb.v \
  sram_model_64kb.v \
  ahb_spi_wrapper.sv \
  ahb_sram_wrapper.sv \
  spi_fsm.sv \
  tb_soc_top.sv

echo "Hardware compilation complete."
echo ""

if [[ ! -x ./simv ]]; then
  echo "ERROR: VCS completed but ./simv was not generated."
  exit 1
fi

echo "======================================================="
echo " PHASE 3: RUNNING SoC SIMULATION"
echo "======================================================="
./simv
