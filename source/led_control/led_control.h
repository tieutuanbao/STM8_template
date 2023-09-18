#ifndef __LED_CONTROL_H__
#define __LED_CONTROL_H__

#include <stm8s.h>

#define LED_COUNT_MAX       28
#define LED_BRIGHTNESS_RES  50

extern uint8_t ledBrightness[LED_COUNT_MAX];

void LedControl_Init(void);
uint8_t *LedControl_GetLedBuffer(void);

#endif