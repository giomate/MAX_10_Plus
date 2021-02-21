	component max_index_fft is
		port (
			clk_clk                              : in  std_logic                     := 'X';             -- clk
			reset_reset_n                        : in  std_logic                     := 'X';             -- reset_n
			index_fft_0_index_out_max_index_byte : out std_logic_vector(7 downto 0);                     -- max_index_byte
			index_fft_0_rx_input_rx_in           : in  std_logic_vector(11 downto 0) := (others => 'X')  -- rx_in
		);
	end component max_index_fft;

	u0 : component max_index_fft
		port map (
			clk_clk                              => CONNECTED_TO_clk_clk,                              --                   clk.clk
			reset_reset_n                        => CONNECTED_TO_reset_reset_n,                        --                 reset.reset_n
			index_fft_0_index_out_max_index_byte => CONNECTED_TO_index_fft_0_index_out_max_index_byte, -- index_fft_0_index_out.max_index_byte
			index_fft_0_rx_input_rx_in           => CONNECTED_TO_index_fft_0_rx_input_rx_in            --  index_fft_0_rx_input.rx_in
		);

