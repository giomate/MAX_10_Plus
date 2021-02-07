	component cpu is
		port (
			clk_clk                   : in  std_logic := 'X'; -- clk
			reset_reset_n             : in  std_logic := 'X'; -- reset_n
			spi_adf5610_external_MISO : in  std_logic := 'X'; -- MISO
			spi_adf5610_external_MOSI : out std_logic;        -- MOSI
			spi_adf5610_external_SCLK : out std_logic;        -- SCLK
			spi_adf5610_external_SS_n : out std_logic         -- SS_n
		);
	end component cpu;

	u0 : component cpu
		port map (
			clk_clk                   => CONNECTED_TO_clk_clk,                   --                  clk.clk
			reset_reset_n             => CONNECTED_TO_reset_reset_n,             --                reset.reset_n
			spi_adf5610_external_MISO => CONNECTED_TO_spi_adf5610_external_MISO, -- spi_adf5610_external.MISO
			spi_adf5610_external_MOSI => CONNECTED_TO_spi_adf5610_external_MOSI, --                     .MOSI
			spi_adf5610_external_SCLK => CONNECTED_TO_spi_adf5610_external_SCLK, --                     .SCLK
			spi_adf5610_external_SS_n => CONNECTED_TO_spi_adf5610_external_SS_n  --                     .SS_n
		);

