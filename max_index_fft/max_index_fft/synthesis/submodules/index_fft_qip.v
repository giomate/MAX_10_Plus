module index_fft_qip(


	//////////// CLOCK //////////

	input 		          		clk_in,
	input 		          		reset_n,
	input 	[11:0]				rx_in_fft,
	output [7:0]					max_index
	);


//=======================================================
//  REG/WIRE declarations
//=======================================================
	wire reset_fft;
	//wire  [11:0] rx_in_fft;
	



//=======================================================
//  Structural coding
//=======================================================

assign reset_fft=~reset_n;

 max_10_index_frequency u0(
 .clk(clk_in),                           //   :   IN    std_logic;
        .reset(1'b0),                      //     :   IN    std_logic;
        .clk_enable(1'b1)      ,                 //:   IN    std_logic;
        .rx_in (rx_in_fft)   ,                  //    :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix12
      //  .ce_out  (LEDR[0])   ,                 //   :   OUT   std_logic;
        .index_max    (max_index)             //    :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
       // .valid_out  (LEDR[9])                   //   :   OUT   std_logic
        );
endmodule