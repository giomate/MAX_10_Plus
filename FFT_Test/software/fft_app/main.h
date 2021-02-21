/*
 * main.h
 *
 *  Created on: Feb 19, 2021
 *      Author: giova
 */

#ifndef MAIN_H_
#define MAIN_H_

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>
#include "system.h"
#include "io.h"
#include "alt_types.h"  // alt_u32
//#include "altera_avalon_pio_regs.h" //IOWR_ALTERA_AVALON_PIO_DATA
#include "sys/alt_alarm.h" // time tick function (alt_nticks(), alt_ticks_per_second())

#include "sys/alt_stdio.h"


#define DEBUG_DUMP  /*printf */

#include "FFTHANDLER.h"



#endif /* MAIN_H_ */