#!/bin/bash
echo "=== 2. Compiling Hardware with VCS ==="

# Step back to the root directory
cd ..

# Define exact absolute paths
ARM_IP_ROOT="/home/user18/Projects/Flash_controller/arm_soc_project/ARM_IPs/Cortex-M3/AT425-BU-50000-r2p1-00rel1"
LOGICAL="$ARM_IP_ROOT/logical"

# Run VCS: Absolute paths for every module AND every header
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
  ./2_pure_xip/tb_top_soc.sv \
  ./0_shared_ip/boot_rom.v \
  ./2_pure_xip/ahb_wrapper_pure.sv \
  ./2_pure_xip/qspi_pure_xip.sv \
  ./0_shared_ip/sync_fifo_full.sv \
  ./2_pure_xip/flash_model_pure.sv

echo "=== 3. Running Simulation ==="
./simv

# Clean up simulation garbage
mv simv simv.daidir *.fsdb novas* verdi* 2_pure_xip/ 2>/dev/null
cd 2_pure_xip/
