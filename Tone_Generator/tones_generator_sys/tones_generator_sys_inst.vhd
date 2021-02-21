	component tones_generator_sys is
		port (
			dac_tones_generator_0_clock_clk            : in  std_logic                     := 'X';             -- clk
			dac_tones_generator_0_reset_reset_n        : in  std_logic                     := 'X';             -- reset_n
			dac_tones_generator_0_spi_data_data        : out std_logic;                                        -- data
			dac_tones_generator_0_spi_data_spi_clk     : out std_logic;                                        -- spi_clk
			dac_tones_generator_0_spi_data_spi_sync    : out std_logic;                                        -- spi_sync
			dac_tones_generator_0_switches_switches_in : in  std_logic_vector(4 downto 0)  := (others => 'X'); -- switches_in
			dac_tones_generator_0_dac_out_data_dac     : out std_logic_vector(15 downto 0)                     -- data_dac
		);
	end component tones_generator_sys;

	u0 : component tones_generator_sys
		port map (
			dac_tones_generator_0_clock_clk            => CONNECTED_TO_dac_tones_generator_0_clock_clk,            --    dac_tones_generator_0_clock.clk
			dac_tones_generator_0_reset_reset_n        => CONNECTED_TO_dac_tones_generator_0_reset_reset_n,        --    dac_tones_generator_0_reset.reset_n
			dac_tones_generator_0_spi_data_data        => CONNECTED_TO_dac_tones_generator_0_spi_data_data,        -- dac_tones_generator_0_spi_data.data
			dac_tones_generator_0_spi_data_spi_clk     => CONNECTED_TO_dac_tones_generator_0_spi_data_spi_clk,     --                               .spi_clk
			dac_tones_generator_0_spi_data_spi_sync    => CONNECTED_TO_dac_tones_generator_0_spi_data_spi_sync,    --                               .spi_sync
			dac_tones_generator_0_switches_switches_in => CONNECTED_TO_dac_tones_generator_0_switches_switches_in, -- dac_tones_generator_0_switches.switches_in
			dac_tones_generator_0_dac_out_data_dac     => CONNECTED_TO_dac_tones_generator_0_dac_out_data_dac      --  dac_tones_generator_0_dac_out.data_dac
		);

