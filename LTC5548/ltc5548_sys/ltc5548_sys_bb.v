
module ltc5548_sys (
	adc_in2_ch0_converter_0_adc_out_rx_in,
	clk_clk,
	pio_0_external_connection_export,
	pio_1_external_connection_export,
	pio_2_external_connection_export,
	pio_3_external_connection_export,
	reset_reset_n,
	spi_0_external_MISO,
	spi_0_external_MOSI,
	spi_0_external_SCLK,
	spi_0_external_SS_n,
	index_fft_0_input_uint12,
	index_fft_0_output_uint8);	

	output	[11:0]	adc_in2_ch0_converter_0_adc_out_rx_in;
	input		clk_clk;
	input	[1:0]	pio_0_external_connection_export;
	input	[11:0]	pio_1_external_connection_export;
	input	[7:0]	pio_2_external_connection_export;
	output		pio_3_external_connection_export;
	input		reset_reset_n;
	input		spi_0_external_MISO;
	output		spi_0_external_MOSI;
	output		spi_0_external_SCLK;
	output		spi_0_external_SS_n;
	input	[11:0]	index_fft_0_input_uint12;
	output	[7:0]	index_fft_0_output_uint8;
endmodule
