/* linker.ld - Boot ROM Linker Script */

ENTRY(Reset_Handler)

MEMORY
{
    /* The internal Boot ROM where this bootloader lives */
    ROM (rx) : ORIGIN = 0x00000000, LENGTH = 4K 
    
    /* The internal SRAM */
    RAM (rwx): ORIGIN = 0x20000000, LENGTH = 512K
}

SECTIONS
{
    .text :
    {
        /* The Vector Table MUST be the absolute first thing in ROM */
        KEEP(*(.isr_vector))
        
        /* Followed by the actual C code (main and functions) */
        *(.text*)
        *(.rodata*)
        . = ALIGN(4);
    } > ROM

    /* Discard compiler metadata that shifts the vector table */
    /DISCARD/ :
    {
        *(.ARM.attributes)
        *(.note.gnu.build-id)
    }
}
