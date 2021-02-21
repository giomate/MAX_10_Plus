	component anain2_converter is
		port (
			modular_adc_0_command_valid          : in  std_logic                     := 'X';             -- valid
			modular_adc_0_command_channel        : in  std_logic_vector(4 downto 0)  := (others => 'X'); -- channel
			modular_adc_0_command_startofpacket  : in  std_logic                     := 'X';             -- startofpacket
			modular_adc_0_command_endofpacket    : in  std_logic                     := 'X';             -- endofpacket
			modular_adc_0_command_ready          : out std_logic;                                        -- ready
			modular_adc_0_response_valid         : out std_logic;                                        -- valid
			modular_adc_0_response_channel       : out std_logic_vector(4 downto 0);                     -- channel
			modular_adc_0_response_data          : out std_logic_vector(11 downto 0);                    -- data
			modular_adc_0_response_startofpacket : out std_logic;                                        -- startofpacket
			modular_adc_0_response_endofpacket   : out std_logic;                                        -- endofpacket
			modular_adc_0_reset_sink_reset_n     : in  std_logic                     := 'X';             -- reset_n
			modular_adc_0_adc_pll_clock_clk      : in  std_logic                     := 'X';             -- clk
			modular_adc_0_clock_clk              : in  std_logic                     := 'X';             -- clk
			modular_adc_0_adc_pll_locked_export  : in  std_logic                     := 'X'              -- export
		);
	end component anain2_converter;

	u0 : component anain2_converter
		port map (
			modular_adc_0_command_valid          => CONNECTED_TO_modular_adc_0_command_valid,          --        modular_adc_0_command.valid
			modular_adc_0_command_channel        => CONNECTED_TO_modular_adc_0_command_channel,        --                             .channel
			modular_adc_0_command_startofpacket  => CONNECTED_TO_modular_adc_0_command_startofpacket,  --                             .startofpacket
			modular_adc_0_command_endofpacket    => CONNECTED_TO_modular_adc_0_command_endofpacket,    --                             .endofpacket
			modular_adc_0_command_ready          => CONNECTED_TO_modular_adc_0_command_ready,          --                             .ready
			modular_adc_0_response_valid         => CONNECTED_TO_modular_adc_0_response_valid,         --       modular_adc_0_response.valid
			modular_adc_0_response_channel       => CONNECTED_TO_modular_adc_0_response_channel,       --                             .channel
			modular_adc_0_response_data          => CONNECTED_TO_modular_adc_0_response_data,          --                             .data
			modular_adc_0_response_startofpacket => CONNECTED_TO_modular_adc_0_response_startofpacket, --                             .startofpacket
			modular_adc_0_response_endofpacket   => CONNECTED_TO_modular_adc_0_response_endofpacket,   --                             .endofpacket
			modular_adc_0_reset_sink_reset_n     => CONNECTED_TO_modular_adc_0_reset_sink_reset_n,     --     modular_adc_0_reset_sink.reset_n
			modular_adc_0_adc_pll_clock_clk      => CONNECTED_TO_modular_adc_0_adc_pll_clock_clk,      --  modular_adc_0_adc_pll_clock.clk
			modular_adc_0_clock_clk              => CONNECTED_TO_modular_adc_0_clock_clk,              --          modular_adc_0_clock.clk
			modular_adc_0_adc_pll_locked_export  => CONNECTED_TO_modular_adc_0_adc_pll_locked_export   -- modular_adc_0_adc_pll_locked.export
		);

