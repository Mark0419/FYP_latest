/* Minimal Linker Script for Cortex-M3 Simulation */

MEMORY
{
  ROM (rx)  : ORIGIN = 0x00000000, LENGTH = 64K
  RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 64K
}

_estack = ORIGIN(RAM) + LENGTH(RAM);

SECTIONS
{
  .text :
  {
    KEEP(*(.isr_vector))
    *(.text*)
    *(.rodata*)
  } > ROM

  /* THE FIX: Destroy the GNU metadata so it doesn't shift our pointers! */
  /DISCARD/ :
  {
    *(.note*)
    *(.comment)
    *(.ARM.exidx)
  }
}
