/*
 * main.cpp
 *
 *  Created on: Jan 30, 2021
 *      Author: giova
 */



#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>
#include <inttypes.h>
#include "sys/alt_flash_types.h"
#include "io.h"
#include "alt_types.h"  // alt_u32
//#include "altera_avalon_pio_regs.h" //IOWR_ALTERA_AVALON_PIO_DATA
#include "sys/alt_irq.h"  // interrupt
#include "sys/alt_alarm.h" // time tick function (alt_nticks(), alt_ticks_per_second())
#include "sys/alt_timestamp.h"
#include "sys/alt_stdio.h"
#include "system.h"

#define DEBUG_DUMP  /*printf */
int main()
{
printf("Hello from Nios II!\n");
uint32_t count = 0;
uint32_t delay;
while(1)
{
	printf("Counter: 0x%08" PRIx32 "\n",count);
delay = 0;
while(delay < 2000000)
{
delay++;
}
count++;
}
return 0;
}
