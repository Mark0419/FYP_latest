#!/bin/bash

# 1. Compile and Link into an ELF file
arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O1 -T linker.ld startup.c bootloader.c -o bootloader.elf -nostartfiles

# 2. Extract the raw binary/hex for the Verilog Boot ROM
arm-none-eabi-objcopy -O verilog bootloader.elf boot_rom.hex

cp boot_rom.hex ../
cd ../
./simv
