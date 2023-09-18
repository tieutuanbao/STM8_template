#include "stm8s_clk.h"

#include <string.h>
#include "led_control.h"

void Clk_Init() {
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
}

void delayMicroseconds(uint32_t us) {
    while(us--) {
        nop();
        nop();
        nop();
        nop();
    }
}

void delay(uint32_t ms) {
    while(ms--) {
        delayMicroseconds(1000);
    }
}

int main() {
    Clk_Init();
    LedControl_Init();
    enableInterrupts();

    for(uint8_t indexLed = 0; indexLed < 28; indexLed++) {
        ledBrightness[indexLed] = 10;
    }
    while(1) {
    }
}