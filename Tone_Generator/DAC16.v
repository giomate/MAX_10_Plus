module  DAC16  (
 input         RESET_N , 
 input         CLK_100 , 
 output [15:0] DATA16 ,  //to DAC data  
 output reg    SYNC=1'b1 ,
 output reg    SCLK,
 output reg    DIN ,
 
 input    [4:0]   SW ,
 output   reg     TR_CK  
 

 
 );
 
 //-- 25MHZ --
 //always @( posedge CLK_50 )   SYS_CLK <=~SYS_CLK ; 

 
 ///Register definitions///
 
  //--test
 reg        SYS_CLK= 1'b1 ;  
  reg [7:0]  ST=0  ;
  reg [4:0]  CNT=0;
  reg  [23:0]RDATA ;
 
reg   [5:0] WAVE=5'b000000 ;
reg  [4:0] WAVE_SW ;
reg   H_L ; 

wire [4:0] BASE ;
wire clk_sine;
reg clk_50=0;
reg clk_25=0;



 always @( posedge CLK_100  )
	clk_50=~clk_50;
	
 always @( posedge clk_50  )
	clk_25=~clk_25;


 //--FSM--
 always @( negedge RESET_N or posedge clk_50  )begin
 if ( !RESET_N) begin 
   ST<=0;
	SYNC  <=1; 
	SCLK  <=0;  
	DIN   <=0 ;  	 
	CNT   <=0; 

  end
 else begin 
  case (ST)
  0: begin 
     	CNT   <=23; 
		DIN   <=RDATA[23] ;
		SYNC  <=0;
		SCLK  <=1;
       ST<=3 ;  
  end

  1:begin 
		  CNT <= CNT -1; 
		  ST<= 2; 
		  SCLK  <=1; 
   end
	2:begin 
			DIN   <= RDATA[CNT];
	      ST<= 3; 
		  
   end
	3: begin 
       SCLK  <=0;
     	 
	     
	    ST<= 4; 
  end
  4: begin 
        
	  if  ( CNT==0) begin 
	       ST<=5  ;  	
		end 
	   else begin 
			ST<=1 ;  
		end
  end
  5: begin 
      ST<=0 ;  	
	   SYNC  <=1;
		SCLK  <=1;	
	   
  end  
  endcase 
  end
 end
 

 
 
 

 
 //-----Clock Sine SOURCE //



always @( posedge CLK_100 ) begin 
	WAVE_SW<=SW;
end
 

				 
//--change--
always @( posedge CLK_100 ) begin 
	if(WAVE_SW>0)begin
	
	 if ( WAVE > WAVE_SW ) begin 
			H_L <= ~H_L;     
			WAVE <= 0; 
	 end
	 else begin
		WAVE <=  WAVE +1 ;
		end
	end
	else begin
		H_L <= ~H_L; 
	end
	
 end
 
 
 //Sine Generation
 wire  [15:0] data_wave;
 
 assign clk_sine=H_L;

 raw_sine_wave  sine_wave(
				.clk(clk_sine),
           .reset(1'b0),
           .clk_enable(1'b1),
           .Enable(RESET_N),
           .wave_out(data_wave)
			  );
//assign DATA16=H_L?data_wave:16'hffff;  
assign DATA16=data_wave; 
always @( posedge clk_sine ) begin 
	RDATA[23:0]  <= { 8'h0, DATA16[15:0] } ;
end
 //assign DATA16=H_L?0:16'hffff; 
//---

 
endmodule