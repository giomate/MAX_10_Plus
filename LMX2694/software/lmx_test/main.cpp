/*
 * main.cpp
 *
 *  Created on: Dec 6, 2020
 *      Author: GMateusDP
 */


#include "main.h"


//static ADF5610_Driver adf;
static lmx2694_Handler pll;
int main()
{

	 pll.Init();

	//adf.CompleteConfigurationFlow(0);

	 int counter=0;
	 int counter2=0;
	while (1){
		if(pll.Self_Test()){

		}else{
			while(counter<0xffff){
				counter++;
				while(counter2<0xf){
							counter2++;
						}
				counter2=0;
			}
			counter=0;
		}





	}

  return 0;
}






