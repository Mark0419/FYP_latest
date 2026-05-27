MEMORY
{
  ROM (rx) : ORIGIN = 0x00000000, LENGTH = 4K
  RAM (rwx): ORIGIN = 0x20000000, LENGTH = 64K
}

SECTIONS
{
  /* 1. Force the linker to completely throw away metadata */
  /DISCARD/ :
  {
    *(.note.gnu.build-id)
    *(.ARM.attributes)
    *(.comment)
  }

  /* 2. Now the vector table will start exactly at 0x00000000 */
  .text :
  {
    KEEP(*(.isr_vector))
    *(.text*)
    *(.rodata*)
  } > ROM

  .data : { *(.data*) } > RAM
  .bss  : { *(.bss*)  } > RAM
}
