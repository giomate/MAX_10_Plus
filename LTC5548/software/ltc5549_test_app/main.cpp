/*
 * main.cpp
 *
 *  Created on: Feb 21, 2021
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
#include "LTC5548HANDLER.h"

 LTC5548_HANDLER  searcher;

int main(){

	uint8_t  max_index;
	uint16_t adc_value,max_adc=0,min_adc=0xffff;
	searcher.Init();
	searcher.Set_Enable(true);
	while(1){
		max_index=searcher.Read_Index();
		if (max_index!=0){
			printf("max_index: %d \r\n",max_index);
			usleep(1000);
		}else{
			adc_value=searcher.Read_ADC_Value();
			if(adc_value<min_adc){
				min_adc=adc_value;
				printf("min adc value: %d \r\n",adc_value);
			}
			if(adc_value>max_adc){
				max_adc=adc_value;
				printf("max adc value: %d \r\n",adc_value);
			}
			//printf("adc value: %d \r\n",dac_value);
			usleep(100);
		}
		usleep(10000);
		searcher.Check_Mixer();
	}
	 return 0;
}