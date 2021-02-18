// -------------------------------------------------------------
// 
// File Name: D:\Salukat\Development\Software\Quartus\MAX_10_Plus\Sine_Wave\sine_wave\Sine_Wave.v
// Created: 2021-02-18 14:48:56
// 
// Generated by MATLAB 9.8 and HDL Coder 3.16
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Sine_Wave
// Source Path: sine_wave/raw_sine_wave/enable_sine_wave/Sine Wave
// Hierarchy Level: 2
// 
// Sine Wave
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Sine_Wave
          (clk,
           reset,
           enb,
           Sine_Wave_out1);


  input   clk;
  input   reset;
  input   enb;
  output  signed [15:0] Sine_Wave_out1;  // int16


  reg [6:0] address_cnt1;  // ufix7
  wire [6:0] Lookup_Table3_k;  // ufix7
  wire signed [15:0] Lookup_Table3_table_data [0:99];  // sfix16 [100]
  wire signed [15:0] lut1out1;  // int16


  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 99
  always @(posedge clk or posedge reset)
    begin : Sine_Wave_addrcnt_temp_process1_process
      if (reset == 1'b1) begin
        address_cnt1 <= 7'b0000000;
      end
      else begin
        if (enb) begin
          if (address_cnt1 >= 7'b1100011) begin
            address_cnt1 <= 7'b0000000;
          end
          else begin
            address_cnt1 <= address_cnt1 + 7'b0000001;
          end
        end
      end
    end



  assign Lookup_Table3_table_data[0] = 16'sb0000000000000000;
  assign Lookup_Table3_table_data[1] = 16'sb0000100000001001;
  assign Lookup_Table3_table_data[2] = 16'sb0001000000001010;
  assign Lookup_Table3_table_data[3] = 16'sb0001011111111011;
  assign Lookup_Table3_table_data[4] = 16'sb0001111111010100;
  assign Lookup_Table3_table_data[5] = 16'sb0010011110001101;
  assign Lookup_Table3_table_data[6] = 16'sb0010111100011110;
  assign Lookup_Table3_table_data[7] = 16'sb0011011001111111;
  assign Lookup_Table3_table_data[8] = 16'sb0011110110101001;
  assign Lookup_Table3_table_data[9] = 16'sb0100010010010101;
  assign Lookup_Table3_table_data[10] = 16'sb0100101100111011;
  assign Lookup_Table3_table_data[11] = 16'sb0101000110010110;
  assign Lookup_Table3_table_data[12] = 16'sb0101011110011110;
  assign Lookup_Table3_table_data[13] = 16'sb0101110101001110;
  assign Lookup_Table3_table_data[14] = 16'sb0110001010011111;
  assign Lookup_Table3_table_data[15] = 16'sb0110011110001101;
  assign Lookup_Table3_table_data[16] = 16'sb0110110000010010;
  assign Lookup_Table3_table_data[17] = 16'sb0111000000101001;
  assign Lookup_Table3_table_data[18] = 16'sb0111001111010000;
  assign Lookup_Table3_table_data[19] = 16'sb0111011100000001;
  assign Lookup_Table3_table_data[20] = 16'sb0111100110111011;
  assign Lookup_Table3_table_data[21] = 16'sb0111101111111001;
  assign Lookup_Table3_table_data[22] = 16'sb0111110110111010;
  assign Lookup_Table3_table_data[23] = 16'sb0111111011111100;
  assign Lookup_Table3_table_data[24] = 16'sb0111111110111110;
  assign Lookup_Table3_table_data[25] = 16'sb0111111111111111;
  assign Lookup_Table3_table_data[26] = 16'sb0111111110111110;
  assign Lookup_Table3_table_data[27] = 16'sb0111111011111100;
  assign Lookup_Table3_table_data[28] = 16'sb0111110110111010;
  assign Lookup_Table3_table_data[29] = 16'sb0111101111111001;
  assign Lookup_Table3_table_data[30] = 16'sb0111100110111011;
  assign Lookup_Table3_table_data[31] = 16'sb0111011100000001;
  assign Lookup_Table3_table_data[32] = 16'sb0111001111010000;
  assign Lookup_Table3_table_data[33] = 16'sb0111000000101001;
  assign Lookup_Table3_table_data[34] = 16'sb0110110000010010;
  assign Lookup_Table3_table_data[35] = 16'sb0110011110001101;
  assign Lookup_Table3_table_data[36] = 16'sb0110001010011111;
  assign Lookup_Table3_table_data[37] = 16'sb0101110101001110;
  assign Lookup_Table3_table_data[38] = 16'sb0101011110011110;
  assign Lookup_Table3_table_data[39] = 16'sb0101000110010110;
  assign Lookup_Table3_table_data[40] = 16'sb0100101100111011;
  assign Lookup_Table3_table_data[41] = 16'sb0100010010010101;
  assign Lookup_Table3_table_data[42] = 16'sb0011110110101001;
  assign Lookup_Table3_table_data[43] = 16'sb0011011001111111;
  assign Lookup_Table3_table_data[44] = 16'sb0010111100011110;
  assign Lookup_Table3_table_data[45] = 16'sb0010011110001101;
  assign Lookup_Table3_table_data[46] = 16'sb0001111111010100;
  assign Lookup_Table3_table_data[47] = 16'sb0001011111111011;
  assign Lookup_Table3_table_data[48] = 16'sb0001000000001010;
  assign Lookup_Table3_table_data[49] = 16'sb0000100000001001;
  assign Lookup_Table3_table_data[50] = 16'sb0000000000000000;
  assign Lookup_Table3_table_data[51] = 16'sb1111011111110111;
  assign Lookup_Table3_table_data[52] = 16'sb1110111111110110;
  assign Lookup_Table3_table_data[53] = 16'sb1110100000000101;
  assign Lookup_Table3_table_data[54] = 16'sb1110000000101100;
  assign Lookup_Table3_table_data[55] = 16'sb1101100001110011;
  assign Lookup_Table3_table_data[56] = 16'sb1101000011100010;
  assign Lookup_Table3_table_data[57] = 16'sb1100100110000001;
  assign Lookup_Table3_table_data[58] = 16'sb1100001001010111;
  assign Lookup_Table3_table_data[59] = 16'sb1011101101101011;
  assign Lookup_Table3_table_data[60] = 16'sb1011010011000101;
  assign Lookup_Table3_table_data[61] = 16'sb1010111001101010;
  assign Lookup_Table3_table_data[62] = 16'sb1010100001100010;
  assign Lookup_Table3_table_data[63] = 16'sb1010001010110010;
  assign Lookup_Table3_table_data[64] = 16'sb1001110101100001;
  assign Lookup_Table3_table_data[65] = 16'sb1001100001110011;
  assign Lookup_Table3_table_data[66] = 16'sb1001001111101110;
  assign Lookup_Table3_table_data[67] = 16'sb1000111111010111;
  assign Lookup_Table3_table_data[68] = 16'sb1000110000110000;
  assign Lookup_Table3_table_data[69] = 16'sb1000100011111111;
  assign Lookup_Table3_table_data[70] = 16'sb1000011001000101;
  assign Lookup_Table3_table_data[71] = 16'sb1000010000000111;
  assign Lookup_Table3_table_data[72] = 16'sb1000001001000110;
  assign Lookup_Table3_table_data[73] = 16'sb1000000100000100;
  assign Lookup_Table3_table_data[74] = 16'sb1000000001000010;
  assign Lookup_Table3_table_data[75] = 16'sb1000000000000001;
  assign Lookup_Table3_table_data[76] = 16'sb1000000001000010;
  assign Lookup_Table3_table_data[77] = 16'sb1000000100000100;
  assign Lookup_Table3_table_data[78] = 16'sb1000001001000110;
  assign Lookup_Table3_table_data[79] = 16'sb1000010000000111;
  assign Lookup_Table3_table_data[80] = 16'sb1000011001000101;
  assign Lookup_Table3_table_data[81] = 16'sb1000100011111111;
  assign Lookup_Table3_table_data[82] = 16'sb1000110000110000;
  assign Lookup_Table3_table_data[83] = 16'sb1000111111010111;
  assign Lookup_Table3_table_data[84] = 16'sb1001001111101110;
  assign Lookup_Table3_table_data[85] = 16'sb1001100001110011;
  assign Lookup_Table3_table_data[86] = 16'sb1001110101100001;
  assign Lookup_Table3_table_data[87] = 16'sb1010001010110010;
  assign Lookup_Table3_table_data[88] = 16'sb1010100001100010;
  assign Lookup_Table3_table_data[89] = 16'sb1010111001101010;
  assign Lookup_Table3_table_data[90] = 16'sb1011010011000101;
  assign Lookup_Table3_table_data[91] = 16'sb1011101101101011;
  assign Lookup_Table3_table_data[92] = 16'sb1100001001010111;
  assign Lookup_Table3_table_data[93] = 16'sb1100100110000001;
  assign Lookup_Table3_table_data[94] = 16'sb1101000011100010;
  assign Lookup_Table3_table_data[95] = 16'sb1101100001110011;
  assign Lookup_Table3_table_data[96] = 16'sb1110000000101100;
  assign Lookup_Table3_table_data[97] = 16'sb1110100000000101;
  assign Lookup_Table3_table_data[98] = 16'sb1110111111110110;
  assign Lookup_Table3_table_data[99] = 16'sb1111011111110111;
  assign Lookup_Table3_k = (address_cnt1 == 7'b0000000 ? 7'b0000000 :
              (address_cnt1 >= 7'b1100011 ? 7'b1100011 :
              address_cnt1));
  assign lut1out1 = Lookup_Table3_table_data[Lookup_Table3_k];



  assign Sine_Wave_out1 = lut1out1;

endmodule  // Sine_Wave

