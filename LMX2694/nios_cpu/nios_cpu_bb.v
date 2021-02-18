
module nios_cpu (
	clk_clk,
	pio_0_external_connection_export,
	reset_reset_n,
	spi_0_external_MISO,
	spi_0_external_MOSI,
	spi_0_external_SCLK,
	spi_0_external_SS_n);	

	input		clk_clk;
	input	[1:0]	pio_0_external_connection_export;
	input		reset_reset_n;
	input		spi_0_external_MISO;
	output		spi_0_external_MOSI;
	output		spi_0_external_SCLK;
	output		spi_0_external_SS_n;
endmodule
