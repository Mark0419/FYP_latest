#include <stdint.h>

#define FLASH_BASE        0x40000000u
#define TEST_FLASH_ADDR   0x40001000u
#define DONE_MARKER       0x20008000u

#define BOOT_WORD         0x49024801u
#define MAGIC_WORD        0xAABBCCDDu
#define PROGRAM_WORD      0x12345678u
#define ERASED_WORD       0xFFFFFFFFu

#define FAIL_BOOT_READ    0xDEAD0001u
#define FAIL_PROGRAM_READ 0xDEAD0002u
#define FAIL_ERASE_READ   0xDEAD0003u
#define FAIL_FINAL_READ   0xDEAD0004u

int main(void) {
    volatile uint32_t* flash_base = (volatile uint32_t*)FLASH_BASE;
    volatile uint32_t* test_flash = (volatile uint32_t*)TEST_FLASH_ADDR;
    volatile uint32_t* done = (volatile uint32_t*)DONE_MARKER;
    uint32_t read_data;

    read_data = flash_base[0];
    if (read_data != BOOT_WORD) {
        *done = FAIL_BOOT_READ;
        while (1) {}
    }

    *test_flash = PROGRAM_WORD;
    read_data = *test_flash;
    if (read_data != PROGRAM_WORD) {
        *done = FAIL_PROGRAM_READ;
        while (1) {}
    }

    *test_flash = ERASED_WORD;
    read_data = *test_flash;
    if (read_data != ERASED_WORD) {
        *done = FAIL_ERASE_READ;
        while (1) {}
    }

    read_data = flash_base[3];
    if (read_data != MAGIC_WORD) {
        *done = FAIL_FINAL_READ;
        while (1) {}
    }

    *done = MAGIC_WORD;

    while (1) {}

    return 0;
}
