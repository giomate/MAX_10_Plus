	fft_loop_test u0 (
		.clk_clk                                    (<connected-to-clk_clk>),                                    //                            clk.clk
		.index_fft_0_index_out_max_index_byte       (<connected-to-index_fft_0_index_out_max_index_byte>),       //          index_fft_0_index_out.max_index_byte
		.pio_0_external_connection_export           (<connected-to-pio_0_external_connection_export>),           //      pio_0_external_connection.export
		.reset_reset_n                              (<connected-to-reset_reset_n>),                              //                          reset.reset_n
		.dac_tones_generator_0_spi_data_data        (<connected-to-dac_tones_generator_0_spi_data_data>),        // dac_tones_generator_0_spi_data.data
		.dac_tones_generator_0_spi_data_spi_clk     (<connected-to-dac_tones_generator_0_spi_data_spi_clk>),     //                               .spi_clk
		.dac_tones_generator_0_spi_data_spi_sync    (<connected-to-dac_tones_generator_0_spi_data_spi_sync>),    //                               .spi_sync
		.dac_tones_generator_0_switches_switches_in (<connected-to-dac_tones_generator_0_switches_switches_in>)  // dac_tones_generator_0_switches.switches_in
	);

