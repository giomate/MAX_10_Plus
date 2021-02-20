module  DAC16  (
 input         RESET_N , 
 input         CLK_100 , 
 output [15:0] DATA16 ,  //to DAC data  
 output reg    SYNC ,
 output reg    SCLK,
 output reg    DIN ,
 
 input    [4:0]   SW ,
 output   reg     TR_CK  
 

 
 );
 
 //-- 25MHZ --
 //always @( posedge CLK_50 )   SYS_CLK <=~SYS_CLK ; 

 
 ///Register definitions///
 
  //--test
 reg        SYS_CLK  ;  
  reg [7:0]  ST  ;
  reg [7:0]  CNT ;
  reg  [23:0]RDATA ;
 
reg   [4:0] WAVE ;
reg  [4:0] WAVE_SW ;
reg   H_L ; 

wire [4:0] BASE ;
wire clk_sine;


 //--FSM--
 always @( negedge RESET_N or posedge CLK_100  )begin
 if ( !RESET_N) begin 
   ST<=0;
	SYNC  <=1; 
	SCLK  <=0;  
	DIN   <=0 ;  	 
	CNT   <=0; 
	TR_CK <=0;
  end
 else begin 
  case (ST)
  0: begin 
     { DIN , RDATA[23:0] }   <= {  9'h0, DATA16[15:0]  } ;
	  	CNT   <=0; 
       ST<=1 ;  
  end
  1: begin 
       SCLK  <=0;
     { DIN , RDATA[23:0] }   <= { RDATA[23:0] ,1'b0 } ;	 
	    SYNC  <=0; 
	    ST<= 2; 
  end
  2:begin 
	     CNT <= CNT +1; 
		  ST<= 3; 
		  SCLK  <=1; 
   end
  3: begin 
        SCLK  <=0;	  
	  if  ( CNT==24) begin 
	       ST<=4  ;  	
		    TR_CK <=1;	 
		end 
	   else  ST<=1 ;  
  end
  4: begin 
      ST<=0 ;  	
	   SYNC  <=1; 
	   TR_CK <=0;
	   DIN   <=0 ;
  end  
  endcase 
  end
 end
 

 
 
 

 
 //-----Clock Sine SOURCE //

assign BASE = 31 ;

always @( posedge CLK_100 ) begin 
	WAVE_SW<=SW;
end
 

				 
//--change--
always @( posedge CLK_100 ) begin 
 if ( WAVE >  WAVE_SW ) begin 
      H_L <= ~H_L;     
		WAVE <= 0; 
 end
 else  WAVE <=  WAVE +1 ; 
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
assign DATA16=data_wave;  
 
//---

 
endmodule