#include <stdint.h>

int main(void) {
    // 1. QSPI Flash Addresses (Hardware mapped to 0x4000_xxxx)
    volatile uint32_t* flash_0000   = (volatile uint32_t*)0x40000000;
    volatile uint32_t* flash_1000   = (volatile uint32_t*)0x40001000;
    volatile uint32_t* flash_2000   = (volatile uint32_t*)0x40002000;
    volatile uint32_t* flash_3000   = (volatile uint32_t*)0x40003000;

    // 2. SRAM "Echo" Addresses (To visually prove CPU captured the data in Verdi)
    volatile uint32_t* echo_0000    = (volatile uint32_t*)0x20008000;
    volatile uint32_t* echo_1000    = (volatile uint32_t*)0x20008004;
    volatile uint32_t* echo_2000    = (volatile uint32_t*)0x20008008;
    volatile uint32_t* echo_3000    = (volatile uint32_t*)0x2000800C;

    volatile uint32_t read_data;

    // =========================================================================
    // PURE XIP CONTINUOUS READ TEST
    // =========================================================================

    // 1. Initial Boot Read
    // FSM State: IDLE -> CMD (Sends 0xEC) -> ADDR -> MODE (Sends 0xA5) -> DATA
    // Result: xip_active flag locks to 1.
    read_data = *flash_0000;
    *echo_0000 = read_data; 

    // 2. Continuous XIP Read 1
    // FSM State: IDLE -> ADDR (Skips CMD entirely!)
    read_data = *flash_1000;
    *echo_1000 = read_data; 

    // 3. Continuous XIP Read 2
    // FSM State: IDLE -> ADDR
    read_data = *flash_2000;
    *echo_2000 = read_data; 

    // 4. Continuous XIP Read 3
    // FSM State: IDLE -> ADDR
    read_data = *flash_3000;
    *echo_3000 = read_data; 
    
    // Halt the CPU forever
    while(1) {}
    
    return 0;
}
