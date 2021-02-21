	component adc_converter_IN2 is
		port (
			clk      : in  std_logic                     := 'X'; -- clk
			reset_n  : in  std_logic                     := 'X'; -- reset_n
			adc_data : out std_logic_vector(11 downto 0)         -- rx_in
		);
	end component adc_converter_IN2;

	u0 : component adc_converter_IN2
		port map (
			clk      => CONNECTED_TO_clk,      --   clock.clk
			reset_n  => CONNECTED_TO_reset_n,  --   reset.reset_n
			adc_data => CONNECTED_TO_adc_data  -- adc_out.rx_in
		);

