
#ifndef __LED_H_
#define __LED_H_

#define LED_ID XPAR_AXI_GPIO_0_DEVICE_ID
#define LED_CHANNEL 1

#define OFF		0b000
#define RED		0b001
#define GREEN	0b010
#define YELLOW	0b011
#define BLUE	0b100
#define VIOLET	0b101
#define LIGHTBLUE	0b110
#define WHITE	0b111

void configureLED();
void greenblinkLED();
void redblinkLED();
void yellowLED();
void colorLED(int color);
void blinkLED(int color);

#endif
