#include <stdint.h>

int main(void) {
    // 1. QSPI Flash Addresses (Hardware mapped to 0x4000_xxxx)
    volatile uint32_t* flash_0000   = (volatile uint32_t*)0x40000000;
    volatile uint32_t* flash_1000   = (volatile uint32_t*)0x40001000;
    volatile uint32_t* flash_2000   = (volatile uint32_t*)0x40002000;
    volatile uint32_t* flash_2004   = (volatile uint32_t*)0x40002004;

    // 2. SRAM "Echo" Addresses (To visually prove CPU captured the data)
    volatile uint32_t* echo_0000    = (volatile uint32_t*)0x20008000;
    volatile uint32_t* echo_1000_w  = (volatile uint32_t*)0x20008004; // Echo for Write Check
    volatile uint32_t* echo_1000_e  = (volatile uint32_t*)0x20008008; // Echo for Erase Check
    volatile uint32_t* echo_2000    = (volatile uint32_t*)0x2000800C;
    volatile uint32_t* echo_2004    = (volatile uint32_t*)0x20008010;

    volatile uint32_t read_data;

    // =========================================================================
    // DYNAMIC XIP PHASE (Toggling writes and reads)
    // =========================================================================

    // 1. Initial Read -> FSM sends 0xEC, locks XIP to 1
    read_data = *flash_0000;
    *echo_0000 = read_data; 

    // 2. Write Operation -> FSM drops XIP lock automatically, sends WREN + PROG
    *flash_1000 = 0x12345678;

    // 3. Read Check Write -> FSM sends 0xEC again, re-locks XIP to 1
    read_data = *flash_1000; 
    *echo_1000_w = read_data;   // <--- ²¹³ä Echo£¡ÈÃ Sniffer ×¥ÅÄ 0x12345678

    // 4. Erase Operation -> FSM drops XIP lock automatically, sends WREN + ERASE
    *flash_1000 = 0xFFFFFFFF;

    // 5. Read Check Erase -> FSM sends 0xEC again, re-locks XIP to 1
    read_data = *flash_1000;
    *echo_1000_e = read_data;   // <--- ²¹³ä Echo£¡ÈÃ Sniffer ×¥ÅÄ 0xFFFFFFFF

    // =========================================================================
    // CONTINUOUS XIP BURST PHASE (Maximum Performance)
    // =========================================================================

    // 6. XIP Read 2000 -> FSM sees XIP is active, SKIPS 0xEC command
    read_data = *flash_2000;
    *echo_2000 = read_data; 

    // 7. XIP Read 2004 -> FSM sees XIP is still active, SKIPS 0xEC command
    read_data = *flash_2004;
    *echo_2004 = read_data; 
    
    // Halt the CPU forever when the test is done
    while(1) {}
    
    return 0;
}
