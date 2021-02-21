	component max_index_fft is
		port (
			clk_clk                  : in  std_logic                     := 'X';             -- clk
			reset_reset_n            : in  std_logic                     := 'X';             -- reset_n
			index_fft_0_input_uint12 : in  std_logic_vector(11 downto 0) := (others => 'X'); -- uint12
			index_fft_0_output_uint8 : out std_logic_vector(7 downto 0)                      -- uint8
		);
	end component max_index_fft;

	u0 : component max_index_fft
		port map (
			clk_clk                  => CONNECTED_TO_clk_clk,                  --                clk.clk
			reset_reset_n            => CONNECTED_TO_reset_reset_n,            --              reset.reset_n
			index_fft_0_input_uint12 => CONNECTED_TO_index_fft_0_input_uint12, --  index_fft_0_input.uint12
			index_fft_0_output_uint8 => CONNECTED_TO_index_fft_0_output_uint8  -- index_fft_0_output.uint8
		);

