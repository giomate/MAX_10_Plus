
module max_index_fft (
	clk_clk,
	reset_reset_n,
	index_fft_0_input_uint12,
	index_fft_0_output_uint8);	

	input		clk_clk;
	input		reset_reset_n;
	input	[11:0]	index_fft_0_input_uint12;
	output	[7:0]	index_fft_0_output_uint8;
endmodule
