module tone_generator_qip(


		input 		          		clk_in,
		input 		          		reset_n,
		//////////// DAC //////////
	output 		          		DAC_DATA,
	output		          		DAC_SCLK,
	output		          		DAC_SYNC_n,
	input 		     [4:0]		SW
		
		

);

	DAC16 dac (
   .RESET_N (reset_n) , 
   .CLK_100  (clk_in) ,
   .DIN     (DAC_DATA ),
   .SCLK    (DAC_SCLK ),
   .SYNC    (DAC_SYNC_n),
   .SW      (SW[4:0])
 );
 
 
endmodule