#include "led_control.h"
#include "stm8s.h"
#include "stm8s_gpio.h"
#include "stm8s_tim4.h"

#define IO_HC595_OE_PORT    GPIOD
#define IO_HC595_OE_PIN     GPIO_PIN_3
#define IO_HC595_CLK_PORT   GPIOD
#define IO_HC595_CLK_PIN    GPIO_PIN_2
#define IO_HC595_LAT_PORT   GPIOC
#define IO_HC595_LAT_PIN    GPIO_PIN_7
#define IO_HC595_DAT_PORT   GPIOC
#define IO_HC595_DAT_PIN    GPIO_PIN_6

#define IO_HC595_OE_SET_HIGH    IO_HC595_OE_PORT->ODR |= IO_HC595_OE_PIN
#define IO_HC595_OE_SET_LOW     IO_HC595_OE_PORT->ODR &= ~IO_HC595_OE_PIN
#define IO_HC595_CLK_SET_HIGH   IO_HC595_CLK_PORT->ODR |= IO_HC595_CLK_PIN
#define IO_HC595_CLK_SET_LOW    IO_HC595_CLK_PORT->ODR &= ~IO_HC595_CLK_PIN
#define IO_HC595_LAT_SET_HIGH   IO_HC595_LAT_PORT->ODR |= IO_HC595_LAT_PIN
#define IO_HC595_LAT_SET_LOW    IO_HC595_LAT_PORT->ODR &= ~IO_HC595_LAT_PIN
#define IO_HC595_DAT_SET_HIGH   IO_HC595_DAT_PORT->ODR |= IO_HC595_DAT_PIN
#define IO_HC595_DAT_SET_LOW    IO_HC595_DAT_PORT->ODR &= ~IO_HC595_DAT_PIN

uint8_t ledBrightness[LED_COUNT_MAX];
static uint8_t timeCount = 0;

INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23) {
#define SHIFT_BIT(n) \
    if(ledBrightness[n] > timeCount) { \
        IO_HC595_DAT_SET_HIGH; \
    } \
    else { \
        IO_HC595_DAT_SET_LOW; \
    } \
    IO_HC595_CLK_SET_HIGH; \
    IO_HC595_CLK_SET_LOW;
    
    TIM4->SR1 = (uint8_t)(~TIM4_IT_UPDATE);
    /* Ghi dịch dữ liệu */
    SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
    SHIFT_BIT(16); SHIFT_BIT(17); SHIFT_BIT(18); SHIFT_BIT(19); SHIFT_BIT(20); SHIFT_BIT(21); SHIFT_BIT(22); SHIFT_BIT(23);
    SHIFT_BIT(8); SHIFT_BIT(9); SHIFT_BIT(10); SHIFT_BIT(11); SHIFT_BIT(12); SHIFT_BIT(13); SHIFT_BIT(14); SHIFT_BIT(15); 
    SHIFT_BIT(0); SHIFT_BIT(1); SHIFT_BIT(2); SHIFT_BIT(3); SHIFT_BIT(4); SHIFT_BIT(5); SHIFT_BIT(6); SHIFT_BIT(7);
    
    timeCount++;
    if(timeCount >= LED_BRIGHTNESS_RES) {
        timeCount = 0;
    }
    IO_HC595_LAT_SET_LOW;
    IO_HC595_LAT_SET_HIGH;
}

void LedControl_Init(void) {
    GPIO_Init(IO_HC595_OE_PORT, IO_HC595_OE_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
    GPIO_Init(IO_HC595_CLK_PORT, IO_HC595_CLK_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
    GPIO_Init(IO_HC595_LAT_PORT, IO_HC595_LAT_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
    GPIO_Init(IO_HC595_DAT_PORT, IO_HC595_DAT_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
    IO_HC595_OE_SET_LOW;
    /* Time base configuration */
    TIM4_TimeBaseInit(TIM4_PRESCALER_16, 124);
    /* Clear TIM4 update flag */
    TIM4_ClearFlag(TIM4_FLAG_UPDATE);
    /* Enable update interrupt */
    TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
    /* Enable TIM4 */
    TIM4_Cmd(ENABLE);
}

uint8_t *LedControl_GetLedBuffer(void) {
    return ledBrightness;
}