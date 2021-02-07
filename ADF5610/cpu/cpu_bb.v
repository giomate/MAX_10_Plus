
module cpu (
	clk_clk,
	reset_reset_n,
	spi_adf5610_external_MISO,
	spi_adf5610_external_MOSI,
	spi_adf5610_external_SCLK,
	spi_adf5610_external_SS_n);	

	input		clk_clk;
	input		reset_reset_n;
	input		spi_adf5610_external_MISO;
	output		spi_adf5610_external_MOSI;
	output		spi_adf5610_external_SCLK;
	output		spi_adf5610_external_SS_n;
endmodule
