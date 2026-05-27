#include <stdint.h>

// Base address of the QSPI peripheral
#define FLASH_BASE 0x40000000

// Variable to store the 3-byte ID
volatile uint32_t jedec_id = 0;

int main(void) {
    // To fetch the ID, we need to send the 0x9F command.
    // In your XIP bridge, writing to a specific address or 
    // triggering a read often maps to specific SPI opcodes.
    
    // NOTE: Depending on your FSM, you might need to send 0x9F
    // as a dummy write first, or map it to a specific memory offset.
    
    // If your FSM is configured to Read on any access to this range:
    jedec_id = *((volatile uint32_t *)(FLASH_BASE + 0x09F0)); 

    // Idling...
    while(1) { }
}
