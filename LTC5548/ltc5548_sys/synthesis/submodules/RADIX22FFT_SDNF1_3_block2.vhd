-- -------------------------------------------------------------
-- 
-- File Name: D:\Salukat\Development\Software\Quartus\MAX_10_Plus\fft_index\max_10_frequency_index\RADIX22FFT_SDNF1_3_block2.vhd
-- Created: 2021-02-21 20:02:11
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: RADIX22FFT_SDNF1_3_block2
-- Source Path: max_10_frequency_index/max_10_index_frequency/FFT_streamer/FFT HDL Optimized/RADIX22FFT_SDNF1_3
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY RADIX22FFT_SDNF1_3_block2 IS
  PORT( clk                               :   IN    std_logic;
        enb_1_32_0                        :   IN    std_logic;
        twdlXdin_4_re                     :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        twdlXdin_4_im                     :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        twdlXdin_8_re                     :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        twdlXdin_8_im                     :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        twdlXdin_1_vld                    :   IN    std_logic;
        softReset                         :   IN    std_logic;
        dout_7_re                         :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_7_im                         :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_8_re                         :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_8_im                         :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_7_vld                        :   OUT   std_logic
        );
END RADIX22FFT_SDNF1_3_block2;


ARCHITECTURE rtl OF RADIX22FFT_SDNF1_3_block2 IS

  -- Signals
  SIGNAL twdlXdin_4_re_signed             : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL twdlXdin_4_im_signed             : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL twdlXdin_8_re_signed             : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL twdlXdin_8_im_signed             : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL Radix22ButterflyG1_NF_btf1_re_reg : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL Radix22ButterflyG1_NF_btf1_im_reg : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL Radix22ButterflyG1_NF_btf2_re_reg : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL Radix22ButterflyG1_NF_btf2_im_reg : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL Radix22ButterflyG1_NF_dinXtwdl_vld_dly1 : std_logic := '0';
  SIGNAL Radix22ButterflyG1_NF_btf1_re_reg_next : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL Radix22ButterflyG1_NF_btf1_im_reg_next : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL Radix22ButterflyG1_NF_btf2_re_reg_next : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL Radix22ButterflyG1_NF_btf2_im_reg_next : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL Radix22ButterflyG1_NF_dinXtwdl_vld_dly1_next : std_logic;
  SIGNAL dout_7_re_tmp                    : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_7_im_tmp                    : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_8_re_tmp                    : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_8_im_tmp                    : signed(11 DOWNTO 0);  -- sfix12

BEGIN
  twdlXdin_4_re_signed <= signed(twdlXdin_4_re);

  twdlXdin_4_im_signed <= signed(twdlXdin_4_im);

  twdlXdin_8_re_signed <= signed(twdlXdin_8_re);

  twdlXdin_8_im_signed <= signed(twdlXdin_8_im);

  -- Radix22ButterflyG1_NF
  Radix22ButterflyG1_NF_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        Radix22ButterflyG1_NF_btf1_re_reg <= Radix22ButterflyG1_NF_btf1_re_reg_next;
        Radix22ButterflyG1_NF_btf1_im_reg <= Radix22ButterflyG1_NF_btf1_im_reg_next;
        Radix22ButterflyG1_NF_btf2_re_reg <= Radix22ButterflyG1_NF_btf2_re_reg_next;
        Radix22ButterflyG1_NF_btf2_im_reg <= Radix22ButterflyG1_NF_btf2_im_reg_next;
        Radix22ButterflyG1_NF_dinXtwdl_vld_dly1 <= Radix22ButterflyG1_NF_dinXtwdl_vld_dly1_next;
      END IF;
    END IF;
  END PROCESS Radix22ButterflyG1_NF_process;

  Radix22ButterflyG1_NF_output : PROCESS (Radix22ButterflyG1_NF_btf1_im_reg, Radix22ButterflyG1_NF_btf1_re_reg,
       Radix22ButterflyG1_NF_btf2_im_reg, Radix22ButterflyG1_NF_btf2_re_reg,
       Radix22ButterflyG1_NF_dinXtwdl_vld_dly1, twdlXdin_1_vld,
       twdlXdin_4_im_signed, twdlXdin_4_re_signed, twdlXdin_8_im_signed,
       twdlXdin_8_re_signed)
    VARIABLE sra_temp : signed(12 DOWNTO 0);
    VARIABLE sra_temp_0 : signed(12 DOWNTO 0);
    VARIABLE sra_temp_1 : signed(12 DOWNTO 0);
    VARIABLE sra_temp_2 : signed(12 DOWNTO 0);
  BEGIN
    Radix22ButterflyG1_NF_btf1_re_reg_next <= Radix22ButterflyG1_NF_btf1_re_reg;
    Radix22ButterflyG1_NF_btf1_im_reg_next <= Radix22ButterflyG1_NF_btf1_im_reg;
    Radix22ButterflyG1_NF_btf2_re_reg_next <= Radix22ButterflyG1_NF_btf2_re_reg;
    Radix22ButterflyG1_NF_btf2_im_reg_next <= Radix22ButterflyG1_NF_btf2_im_reg;
    Radix22ButterflyG1_NF_dinXtwdl_vld_dly1_next <= twdlXdin_1_vld;
    IF twdlXdin_1_vld = '1' THEN 
      Radix22ButterflyG1_NF_btf1_re_reg_next <= resize(twdlXdin_4_re_signed, 13) + resize(twdlXdin_8_re_signed, 13);
      Radix22ButterflyG1_NF_btf2_re_reg_next <= resize(twdlXdin_4_re_signed, 13) - resize(twdlXdin_8_re_signed, 13);
      Radix22ButterflyG1_NF_btf1_im_reg_next <= resize(twdlXdin_4_im_signed, 13) + resize(twdlXdin_8_im_signed, 13);
      Radix22ButterflyG1_NF_btf2_im_reg_next <= resize(twdlXdin_4_im_signed, 13) - resize(twdlXdin_8_im_signed, 13);
    END IF;
    sra_temp := SHIFT_RIGHT(Radix22ButterflyG1_NF_btf1_re_reg, 1);
    dout_7_re_tmp <= sra_temp(11 DOWNTO 0);
    sra_temp_0 := SHIFT_RIGHT(Radix22ButterflyG1_NF_btf1_im_reg, 1);
    dout_7_im_tmp <= sra_temp_0(11 DOWNTO 0);
    sra_temp_1 := SHIFT_RIGHT(Radix22ButterflyG1_NF_btf2_re_reg, 1);
    dout_8_re_tmp <= sra_temp_1(11 DOWNTO 0);
    sra_temp_2 := SHIFT_RIGHT(Radix22ButterflyG1_NF_btf2_im_reg, 1);
    dout_8_im_tmp <= sra_temp_2(11 DOWNTO 0);
    dout_7_vld <= Radix22ButterflyG1_NF_dinXtwdl_vld_dly1;
  END PROCESS Radix22ButterflyG1_NF_output;


  dout_7_re <= std_logic_vector(dout_7_re_tmp);

  dout_7_im <= std_logic_vector(dout_7_im_tmp);

  dout_8_re <= std_logic_vector(dout_8_re_tmp);

  dout_8_im <= std_logic_vector(dout_8_im_tmp);

END rtl;

