#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xgpio.h"
#include "xil_types.h"
#include "LED.h"
#include "sleep.h"



#define test 	0b001000

void configureLED()
{
    XGpio_Config *cfg_ptr;
    XGpio led_device;

	// Initialize LED Device
	cfg_ptr = XGpio_LookupConfig(LED_ID);
	XGpio_CfgInitialize(&led_device, cfg_ptr, cfg_ptr->BaseAddress);

	// Set Led Tristate
	XGpio_SetDataDirection(&led_device, LED_CHANNEL, 0);
	// Set Colors
	XGpio_DiscreteWrite(&led_device, LED_CHANNEL, RED);
	usleep(500000);
	XGpio_DiscreteWrite(&led_device, LED_CHANNEL, GREEN);
	usleep(500000);
	XGpio_DiscreteWrite(&led_device, LED_CHANNEL, YELLOW);
	usleep(500000);
	XGpio_DiscreteWrite(&led_device, LED_CHANNEL, BLUE);
	usleep(500000);
	XGpio_DiscreteWrite(&led_device, LED_CHANNEL, VIOLET);
	usleep(500000);
	XGpio_DiscreteWrite(&led_device, LED_CHANNEL, LIGHTBLUE);
	usleep(500000);
	XGpio_DiscreteWrite(&led_device, LED_CHANNEL, WHITE);
	usleep(500000);
	XGpio_DiscreteWrite(&led_device, LED_CHANNEL, test);
}

void greenblinkLED()
{
    XGpio_Config *cfg_ptr;
    XGpio led_device;

    // Initialize LED Device
	cfg_ptr = XGpio_LookupConfig(LED_ID);
	XGpio_CfgInitialize(&led_device, cfg_ptr, cfg_ptr->BaseAddress);

	// Set Led Tristate
	XGpio_SetDataDirection(&led_device, LED_CHANNEL, 0);

	// Set Colors
	XGpio_DiscreteWrite(&led_device, LED_CHANNEL, GREEN);
	usleep(400000);
	XGpio_DiscreteWrite(&led_device, LED_CHANNEL, OFF);
}

void redblinkLED()
{
    XGpio_Config *cfg_ptr;
    XGpio led_device;

    // Initialize LED Device
	cfg_ptr = XGpio_LookupConfig(LED_ID);
	XGpio_CfgInitialize(&led_device, cfg_ptr, cfg_ptr->BaseAddress);

	// Set Led Tristate
	XGpio_SetDataDirection(&led_device, LED_CHANNEL, 0);

	// Set Colors
	XGpio_DiscreteWrite(&led_device, LED_CHANNEL, RED);
	usleep(400000);
	XGpio_DiscreteWrite(&led_device, LED_CHANNEL, OFF);
}

void yellowLED()
{
    XGpio_Config *cfg_ptr;
    XGpio led_device;

    // Initialize LED Device
	cfg_ptr = XGpio_LookupConfig(LED_ID);
	XGpio_CfgInitialize(&led_device, cfg_ptr, cfg_ptr->BaseAddress);

	// Set Led Tristate
	XGpio_SetDataDirection(&led_device, LED_CHANNEL, 0);

	// Set Colors
	XGpio_DiscreteWrite(&led_device, LED_CHANNEL, YELLOW);

}

void colorLED(int color)
{
    XGpio_Config *cfg_ptr;
    XGpio led_device;

    // Initialize LED Device
	cfg_ptr = XGpio_LookupConfig(LED_ID);
	XGpio_CfgInitialize(&led_device, cfg_ptr, cfg_ptr->BaseAddress);

	// Set Led Tristate
	XGpio_SetDataDirection(&led_device, LED_CHANNEL, 0);

	// Set Colors
	XGpio_DiscreteWrite(&led_device, LED_CHANNEL, color);

}

void blinkLED(int color)
{
    XGpio_Config *cfg_ptr;
    XGpio led_device;

    // Initialize LED Device
	cfg_ptr = XGpio_LookupConfig(LED_ID);
	XGpio_CfgInitialize(&led_device, cfg_ptr, cfg_ptr->BaseAddress);

	// Set Led Tristate
	XGpio_SetDataDirection(&led_device, LED_CHANNEL, 0);

	// Set Colors
	XGpio_DiscreteWrite(&led_device, LED_CHANNEL, color);
	usleep(400000);
	XGpio_DiscreteWrite(&led_device, LED_CHANNEL, OFF);
}
