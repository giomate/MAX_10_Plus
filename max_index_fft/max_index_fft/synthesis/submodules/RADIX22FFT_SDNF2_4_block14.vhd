-- -------------------------------------------------------------
-- 
-- File Name: D:\Salukat\Development\Software\Quartus\MAX_10_Plus\fft_index\max_10_frequency_index\RADIX22FFT_SDNF2_4_block14.vhd
-- Created: 2021-02-21 20:02:11
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: RADIX22FFT_SDNF2_4_block14
-- Source Path: max_10_frequency_index/max_10_index_frequency/FFT_streamer/FFT HDL Optimized/RADIX22FFT_SDNF2_4
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY RADIX22FFT_SDNF2_4_block14 IS
  PORT( clk                               :   IN    std_logic;
        enb_1_32_0                        :   IN    std_logic;
        rotate_31                         :   IN    std_logic;  -- ufix1
        dout_28_re                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_28_im                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_32_re                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_32_im                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_1_vld                        :   IN    std_logic;
        softReset                         :   IN    std_logic;
        dout_31_re                        :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_31_im                        :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_32_re_1                      :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_32_im_1                      :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_4_vld                        :   OUT   std_logic
        );
END RADIX22FFT_SDNF2_4_block14;


ARCHITECTURE rtl OF RADIX22FFT_SDNF2_4_block14 IS

  -- Signals
  SIGNAL dout_28_re_signed                : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_28_im_signed                : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_32_re_signed                : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_32_im_signed                : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL Radix22ButterflyG2_NF_din_vld_dly : std_logic := '0';
  SIGNAL Radix22ButterflyG2_NF_btf1_re_reg : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL Radix22ButterflyG2_NF_btf1_im_reg : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL Radix22ButterflyG2_NF_btf2_re_reg : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL Radix22ButterflyG2_NF_btf2_im_reg : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL Radix22ButterflyG2_NF_din_vld_dly_next : std_logic;
  SIGNAL Radix22ButterflyG2_NF_btf1_re_reg_next : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL Radix22ButterflyG2_NF_btf1_im_reg_next : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL Radix22ButterflyG2_NF_btf2_re_reg_next : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL Radix22ButterflyG2_NF_btf2_im_reg_next : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL dout_31_re_tmp                   : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_31_im_tmp                   : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_32_re_tmp                   : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_32_im_tmp                   : signed(11 DOWNTO 0);  -- sfix12

BEGIN
  dout_28_re_signed <= signed(dout_28_re);

  dout_28_im_signed <= signed(dout_28_im);

  dout_32_re_signed <= signed(dout_32_re);

  dout_32_im_signed <= signed(dout_32_im);

  -- Radix22ButterflyG2_NF
  Radix22ButterflyG2_NF_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        Radix22ButterflyG2_NF_din_vld_dly <= Radix22ButterflyG2_NF_din_vld_dly_next;
        Radix22ButterflyG2_NF_btf1_re_reg <= Radix22ButterflyG2_NF_btf1_re_reg_next;
        Radix22ButterflyG2_NF_btf1_im_reg <= Radix22ButterflyG2_NF_btf1_im_reg_next;
        Radix22ButterflyG2_NF_btf2_re_reg <= Radix22ButterflyG2_NF_btf2_re_reg_next;
        Radix22ButterflyG2_NF_btf2_im_reg <= Radix22ButterflyG2_NF_btf2_im_reg_next;
      END IF;
    END IF;
  END PROCESS Radix22ButterflyG2_NF_process;

  Radix22ButterflyG2_NF_output : PROCESS (Radix22ButterflyG2_NF_btf1_im_reg, Radix22ButterflyG2_NF_btf1_re_reg,
       Radix22ButterflyG2_NF_btf2_im_reg, Radix22ButterflyG2_NF_btf2_re_reg,
       Radix22ButterflyG2_NF_din_vld_dly, dout_1_vld, dout_28_im_signed,
       dout_28_re_signed, dout_32_im_signed, dout_32_re_signed, rotate_31)
    VARIABLE sra_temp : signed(12 DOWNTO 0);
    VARIABLE sra_temp_0 : signed(12 DOWNTO 0);
    VARIABLE sra_temp_1 : signed(12 DOWNTO 0);
    VARIABLE sra_temp_2 : signed(12 DOWNTO 0);
  BEGIN
    Radix22ButterflyG2_NF_btf1_re_reg_next <= Radix22ButterflyG2_NF_btf1_re_reg;
    Radix22ButterflyG2_NF_btf1_im_reg_next <= Radix22ButterflyG2_NF_btf1_im_reg;
    Radix22ButterflyG2_NF_btf2_re_reg_next <= Radix22ButterflyG2_NF_btf2_re_reg;
    Radix22ButterflyG2_NF_btf2_im_reg_next <= Radix22ButterflyG2_NF_btf2_im_reg;
    Radix22ButterflyG2_NF_din_vld_dly_next <= dout_1_vld;
    IF rotate_31 /= '0' THEN 
      IF dout_1_vld = '1' THEN 
        Radix22ButterflyG2_NF_btf1_re_reg_next <= resize(dout_28_re_signed, 13) + resize(dout_32_im_signed, 13);
        Radix22ButterflyG2_NF_btf2_re_reg_next <= resize(dout_28_re_signed, 13) - resize(dout_32_im_signed, 13);
        Radix22ButterflyG2_NF_btf2_im_reg_next <= resize(dout_28_im_signed, 13) + resize(dout_32_re_signed, 13);
        Radix22ButterflyG2_NF_btf1_im_reg_next <= resize(dout_28_im_signed, 13) - resize(dout_32_re_signed, 13);
      END IF;
    ELSIF dout_1_vld = '1' THEN 
      Radix22ButterflyG2_NF_btf1_re_reg_next <= resize(dout_28_re_signed, 13) + resize(dout_32_re_signed, 13);
      Radix22ButterflyG2_NF_btf2_re_reg_next <= resize(dout_28_re_signed, 13) - resize(dout_32_re_signed, 13);
      Radix22ButterflyG2_NF_btf1_im_reg_next <= resize(dout_28_im_signed, 13) + resize(dout_32_im_signed, 13);
      Radix22ButterflyG2_NF_btf2_im_reg_next <= resize(dout_28_im_signed, 13) - resize(dout_32_im_signed, 13);
    END IF;
    sra_temp := SHIFT_RIGHT(Radix22ButterflyG2_NF_btf1_re_reg, 1);
    dout_31_re_tmp <= sra_temp(11 DOWNTO 0);
    sra_temp_0 := SHIFT_RIGHT(Radix22ButterflyG2_NF_btf1_im_reg, 1);
    dout_31_im_tmp <= sra_temp_0(11 DOWNTO 0);
    sra_temp_1 := SHIFT_RIGHT(Radix22ButterflyG2_NF_btf2_re_reg, 1);
    dout_32_re_tmp <= sra_temp_1(11 DOWNTO 0);
    sra_temp_2 := SHIFT_RIGHT(Radix22ButterflyG2_NF_btf2_im_reg, 1);
    dout_32_im_tmp <= sra_temp_2(11 DOWNTO 0);
    dout_4_vld <= Radix22ButterflyG2_NF_din_vld_dly;
  END PROCESS Radix22ButterflyG2_NF_output;


  dout_31_re <= std_logic_vector(dout_31_re_tmp);

  dout_31_im <= std_logic_vector(dout_31_im_tmp);

  dout_32_re_1 <= std_logic_vector(dout_32_re_tmp);

  dout_32_im_1 <= std_logic_vector(dout_32_im_tmp);

END rtl;

