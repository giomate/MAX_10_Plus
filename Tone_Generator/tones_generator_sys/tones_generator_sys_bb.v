
module tones_generator_sys (
	dac_tones_generator_0_clock_clk,
	dac_tones_generator_0_reset_reset_n,
	dac_tones_generator_0_spi_data_data,
	dac_tones_generator_0_spi_data_spi_clk,
	dac_tones_generator_0_spi_data_spi_sync,
	dac_tones_generator_0_switches_switches_in,
	dac_tones_generator_0_dac_out_data_dac);	

	input		dac_tones_generator_0_clock_clk;
	input		dac_tones_generator_0_reset_reset_n;
	output		dac_tones_generator_0_spi_data_data;
	output		dac_tones_generator_0_spi_data_spi_clk;
	output		dac_tones_generator_0_spi_data_spi_sync;
	input	[4:0]	dac_tones_generator_0_switches_switches_in;
	output	[15:0]	dac_tones_generator_0_dac_out_data_dac;
endmodule
