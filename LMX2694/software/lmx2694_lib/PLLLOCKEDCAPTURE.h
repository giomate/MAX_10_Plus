/*
 * PLLLOCKEDCAPTURE.h
 *
 *  Created on: Feb 14, 2021
 *      Author: giova
 */

#ifndef PLLLOCKEDCAPTURE_H_
#define PLLLOCKEDCAPTURE_H_
#include "alt_types.h"
 #include <stdlib.h>
 #include <stdint.h>
 #include <stdbool.h>

class PLL_LOCKED_CAPTURE {
public:
	bool is_locked;
private:
	bool bool_result,pll_locked,watching;
	uint8_t last_locked;
	uint32_t base_address;
	volatile uint8_t edge_capture;
public:
	PLL_LOCKED_CAPTURE();
	virtual ~PLL_LOCKED_CAPTURE();
	bool Is_Locked(void);
private:
	void disable_pll_pio(void);
	void init_pll_pio(void);
	bool Capture_Interrupt(void);

};

#endif /* PLLLOCKEDCAPTURE_H_ */
