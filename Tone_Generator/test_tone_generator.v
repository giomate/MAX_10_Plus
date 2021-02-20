

module test_tone_generator(

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
	output	reg	     [6:0]		HEX0,
	output	reg     [6:0]		HEX1,

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
wire [15:0] DATA16;
wire [19:0] counter20;



//=======================================================
//  Structural coding
//=======================================================
pll100 pll100MHz(

	.inclk0(MAX10_CLK1_50),
	.c0(pll1_clk),
	.locked(pll1_locked)
	
	);
	

	assign  RESET_N = 1;
	
tones_generator_sys dac16 (
   .dac_tones_generator_0_reset_reset_n (RESET_N) , 
   .dac_tones_generator_0_clock_clk (pll1_clk) ,
   .dac_tones_generator_0_dac_out_data_dac  (DATA16  )  ,
   .dac_tones_generator_0_spi_data_data     (DAC_DATA ),
   .dac_tones_generator_0_spi_data_spi_clk    (DAC_SCLK ),
   .dac_tones_generator_0_spi_data_spi_sync    (DAC_SYNC_n),
   .dac_tones_generator_0_switches_switches_in      (SW[4:0])
 );

 //----LED DISPLAY--
assign LEDR[4:0]  =  SW [4:0] ; 

counter c20(
	.clock(pll1_clk),
	.q(counter20)
	);
	
	always@(posedge pll1_clk) begin
		if(counter20==1)begin
			 HEX1[6:0]  <=  DATA16 [15:9] ; 
			 HEX0[6:0]  <=  DATA16 [8:2] ; 
			 end
			end
			


endmodule
