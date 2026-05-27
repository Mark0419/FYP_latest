#!/bin/bash

# 1. Compile C code to object files
arm-none-eabi-gcc -c -mcpu=cortex-m3 -mthumb -O1 startup.c -o startup.o
arm-none-eabi-gcc -c -mcpu=cortex-m3 -mthumb -O1 main.c -o main.o

# 2. Link object files into an ELF executable (using your linker script)
arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -nostartfiles -T linker.ld startup.o main.o -o firmware.elf

# 3. DIRECTLY extract to Verilog Hex format (ONLY .text and .rodata)
arm-none-eabi-objcopy -O verilog -j .text -j .rodata firmware.elf firmware.hex

# 4. Copy to the simulation directory and run
cp firmware.hex ../
cd ../
./simv
