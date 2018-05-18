#include <stdint.h>

#include "top_defines.h"

#define GPIO_CONFIG     *((volatile uint32_t *)(0xf0000000 | GPIO_CONFIG_ADDR  ))
#define GPIO_DOUT       *((volatile uint32_t *)(0xf0000000 | GPIO_DOUT_ADDR    ))
#define GPIO_DIN        *((volatile uint32_t *)(0xf0000000 | GPIO_DIN_ADDR     ))
#define GPIO_DOUT_SET   *((volatile  int32_t *)(0xf0000000 | GPIO_DOUT_SET_ADDR))
#define GPIO_DOUT_CLR   *((volatile uint64_t *)(0xf0000000 | GPIO_DOUT_CLR_ADDR))

static inline uint32_t rdcycle(void) {
    uint32_t cycle;
    asm volatile ("rdcycle %0" : "=r"(cycle));
    return cycle;
}

int main() {

    GPIO_CONFIG = 0xff;

//    UART_BAUD = FREQ / BAUD_RATE;
//    LEDS = 0xAA;

    uint32_t start;

    for (;;) {
        GPIO_DOUT_SET = 0xf0;
        GPIO_DOUT_CLR = 0x0f;

        start = rdcycle();
        while ((rdcycle() - start) <= 100);

        GPIO_DOUT = 0x0f;

        start = rdcycle();
        while ((rdcycle() - start) <= 100);
    }
}
