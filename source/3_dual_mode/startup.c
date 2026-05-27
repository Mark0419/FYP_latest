#include <stdint.h>

// These are defined in the linker script
extern uint32_t _estack; 

// Forward declaration of main
extern int main(void);

// The Reset Handler
void Reset_Handler(void) {
    main();
    while(1); // Trap if main exits
}

// Default handler for faults
void Default_Handler(void) {
    while(1);
}

// THE FIX: Added __attribute__((used)) so GCC doesn't throw this away!
__attribute__((used, section(".isr_vector")))
void (* const g_pfnVectors[])(void) = {
    (void (*)(void))(&_estack), // 0x00: Initial Stack Pointer
    Reset_Handler,              // 0x04: Reset Vector
    Default_Handler,            // 0x08: NMI
    Default_Handler,            // 0x0C: HardFault
};
