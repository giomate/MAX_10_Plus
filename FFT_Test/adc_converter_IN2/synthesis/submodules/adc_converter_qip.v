module adc_converter_qip(

	input 		          		clk,
	input 		          		reset_n,
	output  reg [11:0]					adc_data
	);
	//=======================================================
//  REG/WIRE declarations
//=======================================================
	reg  		rsp_valid;
	wire 		[4:0]cmd_channel;

	wire		cmd_ready=1;

	wire pll10_locked;
	wire pll10_clk;

	wire rspn_valid;
	wire [11:0]rspn_data;
	wire [4:0]rspn_ch;

	
	
	//=======================================================
//  Structural coding
//=======================================================
	pll10 pll10MHz(

	.inclk0(clk),
	.c0(pll10_clk),
	.locked(pll10_locked)
	
	);
	
	anain2_converter u0(
	.modular_adc_0_adc_pll_locked_export(pll10_locked),
	.modular_adc_0_adc_pll_clock_clk(pll10_clk),
	.modular_adc_0_reset_sink_reset_n(reset_n),
	.modular_adc_0_clock_clk(pll10_clk),

	
	.modular_adc_0_command_valid(pll10_locked),
	.modular_adc_0_command_channel(0),
	.modular_adc_0_command_ready(cmd_ready),
	
	.modular_adc_0_response_valid(rspn_valid),

	.modular_adc_0_response_channel(rspn_ch),
	.modular_adc_0_response_data(rspn_data)
	
	);
	
	always@(posedge pll10_clk) begin
		if (rspn_valid && rspn_ch == 0)begin
			adc_data <= rspn_data;
		end
	end
	
	endmodule