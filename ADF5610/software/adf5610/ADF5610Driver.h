/*
 * ADF5610Driver.h
 *
 *  Created on: Dec 6, 2020
 *      Author: GMateusDP
 */

#ifndef ADF5610DRIVER_H_
#define ADF5610DRIVER_H_
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include "core/Arduino.h"
#include "SPIHandler.h"
class ADF5610_Driver {
public:
	double current_frequency;  // Start-up frequency = 5000 MHz
private:
	SPI_Handler		*spi;
	double upper_limit,lower_limit;


	long refin ;      // Referenzquarz = 100.000 Mhz - Enter exact value to calibrate (divide by 10)

	uint32_t RegRead[24];      // ADF5610 Reg's
	uint32_t RegWrite[24];      // ADF5610 Reg's
	uint32_t RegIni[24];      // ADF5610 Reg's
	uint32_t buffer32;
	char receivedChars[5];   // an array to store the received data
	double step,target_frequency;
	 int dir;
	 bool isLocked;




	   uint8_t received_bytes[4];
	   uint8_t to_send[4];
	   bool pll_started;

public:
	ADF5610_Driver();
	virtual ~ADF5610_Driver();
	void Init(void);
	void SetNextFrequency(void);
	void CalculateVCOValues(void);
	void WriteRegisters(uint8_t d);
	void ReadRegisters(uint8_t d);
	bool LockDetect(void);
	void InitiateRegisters(void);
	void CompleteConfigurationFlow(unsigned int k);
	void ShortConfigurationFlow(void );
	void ReadAllRegisters(void);
	void ShowRegisters(int m);
	long Flipper(uint32_t recibido);
	long CalculateGCD(long a, long b);
	bool SelfTest(uint8_t cycles);
private:
	void ConvertU32FourByteArray(uint8_t *array,uint32_t  data);
	bool  InitPLL(void);
	void WriteSubVCO(void);

};

#endif /* ADF5610DRIVER_H_ */
