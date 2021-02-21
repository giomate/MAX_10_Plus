	component fft_loop_test is
		port (
			clk_clk                                    : in  std_logic                    := 'X';             -- clk
			index_fft_0_index_out_max_index_byte       : out std_logic_vector(7 downto 0);                    -- max_index_byte
			pio_0_external_connection_export           : out std_logic_vector(7 downto 0);                    -- export
			reset_reset_n                              : in  std_logic                    := 'X';             -- reset_n
			dac_tones_generator_0_spi_data_data        : out std_logic;                                       -- data
			dac_tones_generator_0_spi_data_spi_clk     : out std_logic;                                       -- spi_clk
			dac_tones_generator_0_spi_data_spi_sync    : out std_logic;                                       -- spi_sync
			dac_tones_generator_0_switches_switches_in : in  std_logic_vector(4 downto 0) := (others => 'X')  -- switches_in
		);
	end component fft_loop_test;

	u0 : component fft_loop_test
		port map (
			clk_clk                                    => CONNECTED_TO_clk_clk,                                    --                            clk.clk
			index_fft_0_index_out_max_index_byte       => CONNECTED_TO_index_fft_0_index_out_max_index_byte,       --          index_fft_0_index_out.max_index_byte
			pio_0_external_connection_export           => CONNECTED_TO_pio_0_external_connection_export,           --      pio_0_external_connection.export
			reset_reset_n                              => CONNECTED_TO_reset_reset_n,                              --                          reset.reset_n
			dac_tones_generator_0_spi_data_data        => CONNECTED_TO_dac_tones_generator_0_spi_data_data,        -- dac_tones_generator_0_spi_data.data
			dac_tones_generator_0_spi_data_spi_clk     => CONNECTED_TO_dac_tones_generator_0_spi_data_spi_clk,     --                               .spi_clk
			dac_tones_generator_0_spi_data_spi_sync    => CONNECTED_TO_dac_tones_generator_0_spi_data_spi_sync,    --                               .spi_sync
			dac_tones_generator_0_switches_switches_in => CONNECTED_TO_dac_tones_generator_0_switches_switches_in  -- dac_tones_generator_0_switches.switches_in
		);

