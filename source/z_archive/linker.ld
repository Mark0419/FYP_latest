MEMORY
{
  ROM (rx) : ORIGIN = 0x00000000, LENGTH = 4K
  RAM (rwx): ORIGIN = 0x20000000, LENGTH = 64K
}

SECTIONS
{
  .text :
  {
    KEEP(*(.isr_vector))
    *(.text*)
    *(.rodata*)
  } > ROM

  .data : { *(.data*) } > RAM
  .bss  : { *(.bss*)  } > RAM
}
