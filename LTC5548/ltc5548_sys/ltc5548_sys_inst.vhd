	component ltc5548_sys is
		port (
			adc_in2_ch0_converter_0_adc_out_rx_in : out std_logic_vector(11 downto 0);                    -- rx_in
			clk_clk                               : in  std_logic                     := 'X';             -- clk
			pio_0_external_connection_export      : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			pio_1_external_connection_export      : in  std_logic_vector(11 downto 0) := (others => 'X'); -- export
			pio_2_external_connection_export      : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			pio_3_external_connection_export      : out std_logic;                                        -- export
			reset_reset_n                         : in  std_logic                     := 'X';             -- reset_n
			spi_0_external_MISO                   : in  std_logic                     := 'X';             -- MISO
			spi_0_external_MOSI                   : out std_logic;                                        -- MOSI
			spi_0_external_SCLK                   : out std_logic;                                        -- SCLK
			spi_0_external_SS_n                   : out std_logic;                                        -- SS_n
			index_fft_0_input_uint12              : in  std_logic_vector(11 downto 0) := (others => 'X'); -- uint12
			index_fft_0_output_uint8              : out std_logic_vector(7 downto 0)                      -- uint8
		);
	end component ltc5548_sys;

	u0 : component ltc5548_sys
		port map (
			adc_in2_ch0_converter_0_adc_out_rx_in => CONNECTED_TO_adc_in2_ch0_converter_0_adc_out_rx_in, -- adc_in2_ch0_converter_0_adc_out.rx_in
			clk_clk                               => CONNECTED_TO_clk_clk,                               --                             clk.clk
			pio_0_external_connection_export      => CONNECTED_TO_pio_0_external_connection_export,      --       pio_0_external_connection.export
			pio_1_external_connection_export      => CONNECTED_TO_pio_1_external_connection_export,      --       pio_1_external_connection.export
			pio_2_external_connection_export      => CONNECTED_TO_pio_2_external_connection_export,      --       pio_2_external_connection.export
			pio_3_external_connection_export      => CONNECTED_TO_pio_3_external_connection_export,      --       pio_3_external_connection.export
			reset_reset_n                         => CONNECTED_TO_reset_reset_n,                         --                           reset.reset_n
			spi_0_external_MISO                   => CONNECTED_TO_spi_0_external_MISO,                   --                  spi_0_external.MISO
			spi_0_external_MOSI                   => CONNECTED_TO_spi_0_external_MOSI,                   --                                .MOSI
			spi_0_external_SCLK                   => CONNECTED_TO_spi_0_external_SCLK,                   --                                .SCLK
			spi_0_external_SS_n                   => CONNECTED_TO_spi_0_external_SS_n,                   --                                .SS_n
			index_fft_0_input_uint12              => CONNECTED_TO_index_fft_0_input_uint12,              --               index_fft_0_input.uint12
			index_fft_0_output_uint8              => CONNECTED_TO_index_fft_0_output_uint8               --              index_fft_0_output.uint8
		);

