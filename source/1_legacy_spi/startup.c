#include <stdint.h>

// =========================================================================
// 1. Memory Definitions
// =========================================================================
// The Cortex-M3 stack grows downwards. 
// For a 512KB SRAM starting at 0x2000_0000, the top of the stack is 0x2008_0000.
#define SRAM_START 0x20000000
#define SRAM_SIZE  (512 * 1024) // 512 KB
#define INITIAL_SP (SRAM_START + SRAM_SIZE)

// =========================================================================
// 2. External Function Declarations
// =========================================================================
// This tells the compiler that main() exists in your bootloader.c file
extern int main(void);

// =========================================================================
// 3. Exception and Interrupt Handlers
// =========================================================================

// The Reset Handler: The absolute first line of code executed after power-on.
void Reset_Handler(void) {
    // In a full OS, we would initialize .data and .bss sections here.
    // Since this is a pure shadowing bootloader, we don't need global variables.
    // We jump straight into your shadowing loop!
    main();
    
    // Safety net: CPU should never reach here if main() jumps to SRAM
    while (1) {}
}

// Default Handlers for System Faults
// If the CPU crashes, it will get trapped in one of these infinite loops.
void NMI_Handler(void)        { while(1) {} }
void HardFault_Handler(void)  { while(1) {} }
void MemManage_Handler(void)  { while(1) {} }
void BusFault_Handler(void)   { while(1) {} }
void UsageFault_Handler(void) { while(1) {} }

// =========================================================================
// 4. The Vector Table
// =========================================================================
// This array MUST be placed exactly at 0x0000_0000.
// We use the compiler attribute to force GCC to place it in the ".isr_vector" 
// section, which our linker.ld maps directly to the start of the ROM.

__attribute__((section(".isr_vector"), used))
const uint32_t vector_table[] = {
    (uint32_t)INITIAL_SP,         // Word 0: Initial Stack Pointer
    (uint32_t)&Reset_Handler,     // Word 1: Reset Vector (Entry Point)
    (uint32_t)&NMI_Handler,       // Word 2: Non-Maskable Interrupt
    (uint32_t)&HardFault_Handler, // Word 3: Hard Fault
    (uint32_t)&MemManage_Handler, // Word 4: Memory Management Fault
    (uint32_t)&BusFault_Handler,  // Word 5: Bus Fault
    (uint32_t)&UsageFault_Handler // Word 6: Usage Fault
};
