	component adc_input2_channel0 is
		port (
			clk_clk                               : in  std_logic                     := 'X'; -- clk
			reset_reset_n                         : in  std_logic                     := 'X'; -- reset_n
			adc_in2_ch0_converter_0_adc_out_rx_in : out std_logic_vector(11 downto 0)         -- rx_in
		);
	end component adc_input2_channel0;

	u0 : component adc_input2_channel0
		port map (
			clk_clk                               => CONNECTED_TO_clk_clk,                               --                             clk.clk
			reset_reset_n                         => CONNECTED_TO_reset_reset_n,                         --                           reset.reset_n
			adc_in2_ch0_converter_0_adc_out_rx_in => CONNECTED_TO_adc_in2_ch0_converter_0_adc_out_rx_in  -- adc_in2_ch0_converter_0_adc_out.rx_in
		);

