#include <stdint.h>

// =========================================================================
// 1. Hardware Register Definitions
// =========================================================================
// SPI Controller MMRs (Hardware mapped to 0x4000_xxxx)
#define SPI_CTRL_REG  (*((volatile uint32_t*)0x40000000))
#define SPI_CMD_REG   (*((volatile uint32_t*)0x40000004))
#define SPI_ADDR_REG  (*((volatile uint32_t*)0x40000008))
#define SPI_DATA_REG  (*((volatile uint32_t*)0x4000000C))

// Memory Map Bases
#define SRAM_BASE     0x20000000
#define FLASH_START   0x00000000

// Copy the 4-word SRAM payload: two instruction words plus two literals.
#define PAYLOAD_WORDS 4
#define SPI_STATUS_BUSY 0x02u

int main(void) {
    
    // Pointer to the SRAM destination
    volatile uint32_t* sram_dest = (volatile uint32_t*)SRAM_BASE;
    
    // Physical SPI Flash address tracker
    uint32_t flash_src_addr = FLASH_START;

    // =========================================================================
    // PHASE 1: THE SHADOWING LOOP
    // =========================================================================
    for (uint32_t i = 0; i < PAYLOAD_WORDS; i++) {
        
        // 1. Configure the SPI Hardware for a Standard Read (0x03)
        SPI_CMD_REG  = 0x03;
        SPI_ADDR_REG = flash_src_addr;
        
        // 2. Trigger the FSM Engine (Start Bit = 1)
        SPI_CTRL_REG = 0x01;
        
        // 3. Wait for the start request to reach the FSM, then wait for done.
        while ((SPI_CTRL_REG & SPI_STATUS_BUSY) == 0u) {
        }
        while (SPI_CTRL_REG & SPI_STATUS_BUSY) {
        }
        
        // 4. Retrieve the fetched 32-bit word from the SPI Controller
        uint32_t fetched_word = SPI_DATA_REG;
        
        // 5. Write the word into the internal SRAM (The Shadow Copy)
        *sram_dest = fetched_word;
        
        // 6. Increment addresses
        flash_src_addr += 4; // SPI Flash is byte-addressable
        sram_dest++;         // Pointer arithmetic advances by 4 bytes (1 word)
    }

    // =========================================================================
    // PHASE 2: THE JUMP TO SRAM
    // =========================================================================
    
    // ARM Cortex-M3 requires the LSB of the jump address to be 1 for Thumb mode.
    // So 0x2000_0000 becomes 0x2000_0001.
    uint32_t thumb_jump_addr = SRAM_BASE | 0x00000001;

    // Cast the physical address into a C function pointer
    void (*jump_to_sram)(void) = (void (*)(void))thumb_jump_addr;

    // Liftoff! Transfer PC execution to the shadowed code in SRAM
    jump_to_sram();

    // The CPU should never reach this infinite loop
    while(1) {}
    
    return 0;
}
