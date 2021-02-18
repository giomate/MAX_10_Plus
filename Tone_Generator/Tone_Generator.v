
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module Tone_Generator(

	//////////// CLOCK //////////
	input 		          		ADC_CLK_10,
	input 		          		MAX10_CLK1_50,
	input 		          		MAX10_CLK2_50,
	input 		          		MAX10_CLK3_50,

	//////////// KEY //////////
	input 		          		FPGA_RESET_n,
	input 		     [4:0]		KEY,

	//////////// SW //////////
	input 		     [9:0]		SW,

	//////////// LEDR //////////
	output		     [9:0]		LEDR,

	//////////// HEX //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,

	//////////// DAC //////////
	inout 		          		DAC_DATA,
	output		          		DAC_SCLK,
	output		          		DAC_SYNC_n,

	//////////// QSPI Flash //////////
	inout 		     [3:0]		FLASH_DATA,
	output		          		FLASH_DCLK,
	output		          		FLASH_NCSO,
	output		          		FLASH_RESET_n,

	//////////// Power Monitor //////////
	output		          		PM_I2C_SCL,
	inout 		          		PM_I2C_SDA,

	//////////// PS2 //////////
	inout 		          		PS2_CLK,
	inout 		          		PS2_CLK2,
	inout 		          		PS2_DAT,
	inout 		          		PS2_DAT2,

	//////////// Uart to USB //////////
	output		          		UART_RESET_n,
	input 		          		UART_RX,
	output		          		UART_TX,

	//////////// TMD 2x6 GPIO Header, TMD connect to TMD Default //////////
	inout 		     [7:0]		GPIO
);



//=======================================================
//  REG/WIRE declarations
//=======================================================
wire pll1_c0;

wire pll1_locked;
wire pll1_clk;
wire        RESET_N ;



//=======================================================
//  Structural coding
//=======================================================
pll100 pll100MHz(

	.inclk0(MAX10_CLK1_50),
	.c0(pll1_clk),
	.locked(pll1_locked)
	
	);
	

	assign  RESET_N = 1;
	
DAC16 dac (
   .RESET_N (RESET_N) , 
   .CLK_100  (pll1_clk) ,
   .DATA16  (DATA16  )  ,
   .DIN     (DAC_DATA ),
   .SCLK    (DAC_SCLK ),
   .SYNC    (DAC_SYNC_n),
   .SW      (SW[4:0])
 );

 //----LED DISPLAY--
assign LEDR[9:0]  =  SW [9:0] ; 



endmodule
