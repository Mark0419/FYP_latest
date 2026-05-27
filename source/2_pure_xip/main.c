#include <stdint.h>

#define FLASH_BASE      0x40000000u
#define SRAM_SHADOW     0x20000000u
#define MAGIC_ADDR      0x20008000u
#define PAYLOAD_WORDS   4u

int main(void) {
    volatile uint32_t* flash = (volatile uint32_t*)FLASH_BASE;
    volatile uint32_t* shadow = (volatile uint32_t*)SRAM_SHADOW;
    volatile uint32_t* magic = (volatile uint32_t*)MAGIC_ADDR;
    uint32_t word = 0;

    for (uint32_t i = 0; i < PAYLOAD_WORDS; i++) {
        word = flash[i];
        shadow[i] = word;
    }

    *magic = word;

    while (1) {}

    return 0;
}
