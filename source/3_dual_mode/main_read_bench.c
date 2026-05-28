#include <stdint.h>

#define FLASH_BASE      0x40000000u
#define DONE_MARKER     0x20008000u
#define PAYLOAD_WORDS   4u
#define MAGIC_WORD      0xAABBCCDDu
#define FAIL_WORD       0xDEAD0001u

int main(void) {
    volatile uint32_t* flash = (volatile uint32_t*)FLASH_BASE;
    volatile uint32_t* done = (volatile uint32_t*)DONE_MARKER;
    uint32_t word = 0;
    uint32_t checksum = 0;

    for (uint32_t i = 0; i < PAYLOAD_WORDS; i++) {
        word = flash[i];
        checksum ^= word;
    }

    *done = (word == MAGIC_WORD && checksum != 0u) ? MAGIC_WORD : FAIL_WORD;

    while (1) {}

    return 0;
}
