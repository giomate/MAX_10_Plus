/*
 * ADF5610Driver.cpp
 *
 *  Created on: Dec 6, 2020
 *      Author: GMateusDP
 */

#include "ADF5610Driver.h"
#include <stdio.h>
#include "math.h"
#include "string.h"
#include <inttypes.h>
#include "system.h"
#include "unistd.h"

static SPI_Handler staticSPI;

ADF5610_Driver::ADF5610_Driver() {
	// TODO Auto-generated constructor stub
	 current_frequency=1752;
		 refin=50*1000*1000;

		 buffer32=0;
		 dir=1;
		 spi=&staticSPI;
		 isLocked=false;
		 upper_limit=4400;
		 lower_limit=57.09;
		 step=(upper_limit-lower_limit)/20000;
		 target_frequency=current_frequency+step;
		 pll_started=false;
}

ADF5610_Driver::~ADF5610_Driver() {
	// TODO Auto-generated destructor stub
}

void ADF5610_Driver::Init(void){
	spi=&staticSPI;
	spi->Init(SPI_ADF5610_BASE,0);
	spi->SetCS(true);
	 InitiateRegisters();
	 InitPLL();
	 CompleteConfigurationFlow(0);


}
bool  ADF5610_Driver::InitPLL(void){

	while(!pll_started|false){
		CompleteConfigurationFlow(0);
		ReadAllRegisters();
		pll_started= bitRead(RegRead[1],1)&(bitRead(RegRead[1],0)==0);
	}
	return pll_started;
}

void ADF5610_Driver::SetNextFrequency(void)     // Freq hier lokal oben global
{

  CalculateVCOValues();



}
void ADF5610_Driver::ShowRegisters(int index){

	switch (index){
		  case 0:
			  printf("Read R%d",index);
			  printf(":  0x%08" PRIx32 "\n",RegRead[index]);
			  break;
		  case 16:
		  		  break;
		  case 17:
		  	  		  break;
		  case 18:
		  	  		  break;
		  case 19:
		  	  		  break;
		  default:
			  printf("Write R%d",index);
			  printf(":  0x%08" PRIx32 "\t",RegWrite[index]);
			  printf("Read R%d",index);
			  printf(":  0x%08" PRIx32 "\n",RegRead[index]);

			  break;


	  }


}
bool ADF5610_Driver::LockDetect(void){

  ReadRegisters(18);
  bool locked=false;
  //if ((digitalRead(12)== HIGH))   // select lock/unlock
  if ((bitRead(RegRead[18],1)== HIGH)&&(bitRead(RegRead[18],2)== LOW))   // select lock/unlock
  {
    locked = true;
  } else {
    locked = false;
  }
  return locked;
}

void  ADF5610_Driver::WriteRegisters(uint8_t index) {
  uint8_t vco_index=0;
  buffer32 = 0;


  //RegAdr = d;
  if (index>19){
    if(index==23){
      vco_index=3;
    }else if (index==24){
      vco_index=4;
    }else{
      vco_index=5;
    }
  }else{
    vco_index=index;
  }
  switch (vco_index){
	 // case 0:
		//  ReadRegisters(vco_index);
		 // ShowRegisters(vco_index);
		//  break;
	  case 16:
	  		  break;
	  case 17:
	  	  		  break;
	  case 18:
	  	  		  break;
	  case 19:
	  	  		  break;
	  default:
		  buffer32 =((uint32_t)vco_index <<3)|(RegWrite[index]<<8);
		 // buffer32 =((uint32_t)vco_index <<25)|(RegWrite[index]<<1);
		  ConvertU32FourByteArray(to_send,buffer32);
		    // Serial.println(buffer, HEX);
		    spi->SetCS(false);
		    usleep(10);


		          spi->WriteData(to_send,4);
		    usleep(10);

		   spi->SetCS(true);
		  // usleep(1);

		    //Serial.print(received[4], HEX);Serial.print(received[3], HEX); Serial.print(received[2], HEX);Serial.println(received[1], HEX);
		   if(!isLocked){
			   usleep(100);
			  // ReadRegisters(vco_index);
			   if(vco_index<20){
				   if(RegRead[vco_index]!=RegWrite[vco_index]){
							//   ShowRegisters(vco_index);

						   }
			   }
		   }



		  break;


  }
}
void ADF5610_Driver::ConvertU32FourByteArray(uint8_t *array,uint32_t  data){
	for (int i =0;i<4;i++){
		array[i]=(uint8_t)((data>>((3-i)*8)&0xff));
	}
}

void ADF5610_Driver::ReadRegisters(uint8_t index) {

	//buffer32=(uint32_t)index<<3;
	//ConvertU32FourByteArray(toSend,buffer32);
	//memcpy(toSend,&buffer32,4);
//	to_send[0]=(0x80)|(index<<1);
	//to_send[0]=0;
	to_send[0]=0;
	to_send[1]=0;
	to_send[2]=index;
	to_send[3]=0;


  //  spi->Open();
   // usleep(1);
 //   spi->WriteData(to_send,4);


   //  spi->Close();
   //  usleep(1);
  //   spi->Open();
    // usleep(1);

    // SPI.transfer(0x00);SPI.transfer(0x00);SPI.transfer(d);SPI.transfer(0x00);
	spi->SetCS(false);
	 usleep(10);
	spi->WriteData(to_send,4);
	usleep(10);
	spi->SetCS(true);
	 usleep(10);
	 spi->SetCS(false);
	 usleep(10);
     spi->ReadData(received_bytes,4);
     usleep(10);
     spi->SetCS(true);
     //spi->ReadData(received_bytes,4);
    // spi->Close();



  RegRead[index]=0;
  for(int i =0; i<4;i++){
	  RegRead[index]|=(uint32_t)(received_bytes[i]<<((3-i)*8));
  }

//   RegRead[index]=((received_bytes[3]))|((received_bytes[2])<<16);

 //   RegRead[index]|=((received_bytes[0])>>24)|((received_bytes[1])>>8);
  RegRead[index]>>=7;
  RegRead[index]&=0x00ffffff;
 //   bitClear(RegRead[index],24);





}
void ADF5610_Driver::InitiateRegisters(void){
        // ADF5610 Reg's

  for (int i = 0; i <= 24; i++) {
    switch (i) {
    case 0:
          RegIni[i] = 0x20;
          break;
      case 1:
        RegIni[i] = 0x2;
        break;
      case 2:
        RegIni[i] = 0x1;
        break;
      case 3:
        RegIni[i] = 0x31;
        break;
      case 4:
        RegIni[i] = 0xFD70A3;
        break;
      case 5:
        RegIni[i] = 0x000;
        break;
      case 6:
        RegIni[i] = 0x2F4A;
        break;
      case 7:
        RegIni[i] = 0x214D;
        break;
      case 8:
        RegIni[i] = 0xC9BEFF;
        break;
        case 9:
        RegIni[i] = 0x3FFF;
        break;
        case 10:
       // RegIni[i] = 0x2043;
        RegIni[i] = 0x2047;
        break;
        case 11:
        RegIni[i] = 0xF8061;
        break;
        case 15:
        RegIni[i] = 0x081;
        break;
        case 20:
        RegIni[i] = RegIni[5];
         break;
        case 21:
       RegIni[i] = 0x8E08;
      //  RegIni[i] = (0x01<<3)|(0x00<<7)|(0x07<<9)|(0x01<<12)|(0x01<<15);
         break;
         case 22:
       RegIni[i] = 0x390;
      //   RegIni[i] =(0x02<<3)|(0x07<<7)|(0x00);
         break;
        default:
        RegIni[i] = 0x0;
        break;
    }
    RegWrite[i]=RegIni[i];

  }
}
void ADF5610_Driver::CompleteConfigurationFlow(unsigned int k){
  for (int i=k; i<20;i++){
    if (i==5){
      for(int j=20;j<23;j++){
        WriteRegisters(j);
        WriteRegisters(5);
      }

    }else if(i!=4){
      WriteRegisters(i);
    }
  }
  WriteRegisters(3);
  WriteRegisters(4);

}
void ADF5610_Driver::ShortConfigurationFlow(void){
  WriteRegisters(8);
  WriteSubVCO();
  WriteRegisters(3);
  WriteRegisters(4);
}
void ADF5610_Driver::WriteSubVCO(void){
	WriteRegisters(22);
	//WriteRegisters(5);
	WriteRegisters(20);
	WriteRegisters(5);
}

void ADF5610_Driver::ReadAllRegisters(){
  for (int i=0; i<=19;i++){
    ReadRegisters((uint8_t)i);
  }
}

long ADF5610_Driver::Flipper(uint32_t recibido){
  byte b1,b2;
  bool bit1;
  uint32_t transformado=0;
  for(int i=0;i<4;i++){
    b1=((byte)(recibido >> ((3-i) * 8)))&0xFF;

    for(int j=0;j<8;j++){
      bit1=bitRead(b1,j);
      bitWrite(b2,7-j,bit1);

    }
    transformado<<=8;

    transformado |=(uint32_t)(b2);

  }
  return (long)transformado;
}

void ADF5610_Driver::CalculateVCOValues(void){
   byte VCOAdd=0;
  double fPD;
  uint32_t aux=0;

  //double PFDFreq = refin * ((1.0 + RD2refdoubl) / (R_Counter * (1.0 + RD1_Rdiv2))); //Phase detector frequency
  double fX=50; //Phase detector frequency



    double  fDIV=target_frequency;
    int k=floor(log((14600)/(fDIV))/log(2));
   // Serial.println((byte)k,BIN);
    byte kDIV=7-(byte)(k);
   // Serial.println(kDIV,BIN);


  double fVCO = 7300*((target_frequency*pow(2, k))/(14600)); //VCO
  //Serial.println(fVCO);
  if (fVCO<4000){
    fPD = 1*fX; //Phase detector frequency
  }else{
    fPD = 2*fX; //Phase detector frequency
  }

  double N = fVCO /fPD;   // Calculate N

  //Serial.println(N);

  double N_Int = floor(fVCO/fPD);   // N= 50 for 5 GHz   // Turn N into integer
  //Serial.println((uint32_t)N_Int,HEX);

  double F_Frac1x = (N - N_Int) * pow(2, 24);   // Calculate Frac1 (N remainder * 2^24)

  uint32_t F_FracN = (uint32_t)F_Frac1x;  // turn Frac1 into an integer
  //Serial.println(F_FracN,HEX);


  ////////////////// Set 32 bit register values R0 to R12 ///////////////////////////


  for (int i = 0; i < 23; i++) {
    //Serial.println(i);
    switch (i) {
      case 3:
        RegWrite[i] =(uint32_t)(0x00FFFFFF&((long)N_Int));  //Fixed value (Phase control not needed)
        break;
      case 4:
        RegWrite[i] =(uint32_t)(0x00FFFFFF&(F_FracN));
        break;
      case 5:
        ReadRegisters((uint8_t)0x10);

		for (int j=15;j>=0;j--){
		  if(j>7){
			//bitWrite(RegWrite[i], j, 0);
			  if(j!=13){
				  bitWrite(RegWrite[i], j, bitRead(RegRead[0x10],j-8));
			  }

		  }else{
			bitWrite(RegWrite[i], j, 0);
		  }
		}


        bitWrite(RegWrite[i], 13,1);
       // Serial.println(RegWrite[i],HEX);
        break;
      case 8:
        if (fVCO<4000){
          bitWrite(RegWrite[i], 19, 0);
        }else{
          bitWrite(RegWrite[i], 19, 1);
        }
        break;
      case 20:
    	  aux=RegWrite[5];
    	  bitClear(aux,7);
        RegWrite[i]=aux;
        break;
      case 21:
        RegWrite[i]=RegIni[i];
        break;
      case 22:
      VCOAdd=0b00000010;
        for (int j=3;j<16;j++){
          if (j<7){
            bitWrite(RegWrite[i], j, bitRead(VCOAdd,j-3));
          }else{
            bitWrite(RegWrite[i], j, bitRead(kDIV,j-7));
          }
        }
        //Serial.println(RegWrite[i],HEX);

        break;
      default:
        RegWrite[i] =RegRead[i] ;
        break;
    }

  }
}
long ADF5610_Driver::CalculateGCD(long a, long b) {
   if (a == 0 || b == 0)
      return 0;
   else if (a == b)
      return a;
   else if (a > b)
      return CalculateGCD(a-b, b);
   else return CalculateGCD(a, b-a);
}

bool	ADF5610_Driver::SelfTest(uint8_t cycles){
	dir=1;
	int errorCounter=0;
	int counter=0;
	while (((lower_limit<=current_frequency)&(current_frequency<=upper_limit))&&(cycles>counter)){

		 if(LockDetect()){
			 isLocked=true;
			 current_frequency=target_frequency;
			  if ((current_frequency>(upper_limit-step))&&(dir==1)){


				dir=-1;
			  }else if((current_frequency<(lower_limit+step))&&(dir==-1)){

				dir=1;

			  }
			   printf("Current frequence: %lf\n",current_frequency);
				target_frequency=current_frequency+(dir*step);

				SetNextFrequency();
				ShortConfigurationFlow();
				usleep(1000);


		 }else{
			 errorCounter++;
			 if(isLocked){
				 isLocked=false;
				  printf("**************************\n\r");
				   printf("Not Locked at:  %lf",target_frequency);
				   printf(" MHz\n");
				   printf("**************************\n");
			 }
			//next_frequency=current_frequency;
		   SetNextFrequency();
		   CompleteConfigurationFlow(1);

			for (int var = 1; var < 24; ++var) {
			//	ShowRegisters(var);
			}

			usleep(100000);
			if(errorCounter>1000){
				return false;
			}


		 }
	}
	return true;
}




