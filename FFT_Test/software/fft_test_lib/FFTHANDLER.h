/*
 * FFTHANDLER.h
 *
 *  Created on: Feb 19, 2021
 *      Author: giova
 */

#ifndef FFTHANDLER_H_
#define FFTHANDLER_H_
#include "alt_types.h"
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
class FFT_HANDLER {
public:
	uint8_t max_index;
private:
	uint32_t base_address;
	uint8_t last_index;
	uint16_t dac_value;
public:
	FFT_HANDLER();
	virtual ~FFT_HANDLER();
	bool Init(void);
	uint8_t Read_Index(void);
	uint16_t Read_DAC_Value(void);
};
extern FFT_HANDLER dummy2;
#endif /* FFTHANDLER_H_ */