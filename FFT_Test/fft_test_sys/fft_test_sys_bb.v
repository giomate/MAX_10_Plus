
module fft_test_sys (
	clk_clk,
	index_fft_0_index_out_max_index_byte,
	pio_1_external_connection_export,
	pio_1_external_connection_1_export,
	reset_reset_n,
	dac_tones_generator_0_dac_out_data_dac,
	dac_tones_generator_0_switches_switches_in,
	dac_tones_generator_0_spi_data_data,
	dac_tones_generator_0_spi_data_spi_clk,
	dac_tones_generator_0_spi_data_spi_sync);	

	input		clk_clk;
	output	[7:0]	index_fft_0_index_out_max_index_byte;
	input	[7:0]	pio_1_external_connection_export;
	input	[15:0]	pio_1_external_connection_1_export;
	input		reset_reset_n;
	output	[15:0]	dac_tones_generator_0_dac_out_data_dac;
	input	[4:0]	dac_tones_generator_0_switches_switches_in;
	output		dac_tones_generator_0_spi_data_data;
	output		dac_tones_generator_0_spi_data_spi_clk;
	output		dac_tones_generator_0_spi_data_spi_sync;
endmodule
