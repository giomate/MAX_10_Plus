// -------------------------------------------------------------
// 
// File Name: D:\Salukat\Development\Software\Quartus\MAX_10_Plus\Sine_Wave\sine_wave\enable_sine_wave.v
// Created: 2021-02-18 14:48:56
// 
// Generated by MATLAB 9.8 and HDL Coder 3.16
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: enable_sine_wave
// Source Path: sine_wave/raw_sine_wave/enable_sine_wave
// Hierarchy Level: 1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module enable_sine_wave
          (clk,
           reset,
           enb,
           Enable,
           wave_out);


  input   clk;
  input   reset;
  input   enb;
  input   Enable;
  output  signed [15:0] wave_out;  // int16


  wire enb_gated;
  wire signed [15:0] Sine_Wave_out1;  // int16
  wire signed [15:0] Amplitud_out1;  // int16
  wire signed [15:0] Add_out1;  // int16
  wire signed [15:0] Add_out1_bypass;  // int16
  reg signed [15:0] Add_out1_last_value;  // int16


  assign enb_gated = Enable && enb;

  Sine_Wave u_Sine_Wave (.clk(clk),
                         .reset(reset),
                         .enb(enb_gated),
                         .Sine_Wave_out1(Sine_Wave_out1)  // int16
                         );

  assign Amplitud_out1 = 16'sb0111111111111111;



  assign Add_out1 = Sine_Wave_out1 + Amplitud_out1;



  always @(posedge clk or posedge reset)
    begin : wave_out_bypass_process
      if (reset == 1'b1) begin
        Add_out1_last_value <= 16'sb0000000000000000;
      end
      else begin
        if (enb_gated) begin
          Add_out1_last_value <= Add_out1_bypass;
        end
      end
    end



  assign Add_out1_bypass = (Enable == 1'b0 ? Add_out1_last_value :
              Add_out1);



  assign wave_out = Add_out1_bypass;

endmodule  // enable_sine_wave

