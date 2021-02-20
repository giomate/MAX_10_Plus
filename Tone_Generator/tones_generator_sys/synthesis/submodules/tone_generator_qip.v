module tone_generator_qip(


		input 		          		clk_in,
		input 		          		reset_n,
		//////////// DAC //////////
	output 		          		DAC_DATA,
	output		          		DAC_SCLK,
	output		          		DAC_SYNC_n,
	output				[15:0]			dac_data_out,
	input 		     [4:0]		SW
		
		

);

	DAC16 dac (
   .RESET_N (reset_n) , 
   .CLK_100  (clk_in) ,
   .DIN     (DAC_DATA ),
   .SCLK    (DAC_SCLK ),
   .SYNC    (DAC_SYNC_n),
	.DATA16(dac_data_out),
   .SW      (SW[4:0])
 );
 
 
endmodule