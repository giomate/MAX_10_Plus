
module ltc5548_sys (
	adc_in2_ch0_converter_0_adc_out_rx_in,
	clk_clk,
	index_fft_0_index_out_max_index_byte,
	index_fft_0_rx_input_rx_in,
	pio_0_external_connection_export,
	pio_1_external_connection_export,
	pio_2_external_connection_export,
	pio_3_external_connection_export,
	reset_reset_n,
	spi_0_external_MISO,
	spi_0_external_MOSI,
	spi_0_external_SCLK,
	spi_0_external_SS_n);	

	output	[11:0]	adc_in2_ch0_converter_0_adc_out_rx_in;
	input		clk_clk;
	output	[7:0]	index_fft_0_index_out_max_index_byte;
	input	[11:0]	index_fft_0_rx_input_rx_in;
	input	[1:0]	pio_0_external_connection_export;
	input	[11:0]	pio_1_external_connection_export;
	input	[7:0]	pio_2_external_connection_export;
	output		pio_3_external_connection_export;
	input		reset_reset_n;
	input		spi_0_external_MISO;
	output		spi_0_external_MOSI;
	output		spi_0_external_SCLK;
	output		spi_0_external_SS_n;
endmodule
