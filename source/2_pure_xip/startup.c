extern void main(void);

// Define the top of the stack (e.g., 64KB into RAM)
#define STACK_TOP 0x20010000 

// This array will be placed exactly at address 0x00000000 by the linker
__attribute__((section(".isr_vector")))
const void * VectorTable[] = {
    (void *)STACK_TOP,  // Address 0x0: Initial Stack Pointer
    (void *)main        // Address 0x4: Reset Vector (Where to start running)
};
