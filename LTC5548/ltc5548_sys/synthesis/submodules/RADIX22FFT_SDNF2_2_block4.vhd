-- -------------------------------------------------------------
-- 
-- File Name: D:\Salukat\Development\Software\Quartus\MAX_10_Plus\fft_index\max_10_frequency_index\RADIX22FFT_SDNF2_2_block4.vhd
-- Created: 2021-02-21 20:02:10
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: RADIX22FFT_SDNF2_2_block4
-- Source Path: max_10_frequency_index/max_10_index_frequency/FFT_streamer/FFT HDL Optimized/RADIX22FFT_SDNF2_2
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY RADIX22FFT_SDNF2_2_block4 IS
  PORT( clk                               :   IN    std_logic;
        enb_1_32_0                        :   IN    std_logic;
        rotate_11                         :   IN    std_logic;  -- ufix1
        dout_11_re                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_11_im                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_27_re                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_27_im                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_1_vld                        :   IN    std_logic;
        softReset                         :   IN    std_logic;
        dout_11_re_1                      :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_11_im_1                      :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_12_re                        :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_12_im                        :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_2_vld                        :   OUT   std_logic
        );
END RADIX22FFT_SDNF2_2_block4;


ARCHITECTURE rtl OF RADIX22FFT_SDNF2_2_block4 IS

  -- Signals
  SIGNAL dout_11_re_signed                : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_11_im_signed                : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_27_re_signed                : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_27_im_signed                : signed(11 DOWNTO 0);  -- sfix12
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
  SIGNAL dout_11_re_tmp                   : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_11_im_tmp                   : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_12_re_tmp                   : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_12_im_tmp                   : signed(11 DOWNTO 0);  -- sfix12

BEGIN
  dout_11_re_signed <= signed(dout_11_re);

  dout_11_im_signed <= signed(dout_11_im);

  dout_27_re_signed <= signed(dout_27_re);

  dout_27_im_signed <= signed(dout_27_im);

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
       Radix22ButterflyG2_NF_din_vld_dly, dout_11_im_signed, dout_11_re_signed,
       dout_1_vld, dout_27_im_signed, dout_27_re_signed, rotate_11)
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
    IF rotate_11 /= '0' THEN 
      IF dout_1_vld = '1' THEN 
        Radix22ButterflyG2_NF_btf1_re_reg_next <= resize(dout_11_re_signed, 13) + resize(dout_27_im_signed, 13);
        Radix22ButterflyG2_NF_btf2_re_reg_next <= resize(dout_11_re_signed, 13) - resize(dout_27_im_signed, 13);
        Radix22ButterflyG2_NF_btf2_im_reg_next <= resize(dout_11_im_signed, 13) + resize(dout_27_re_signed, 13);
        Radix22ButterflyG2_NF_btf1_im_reg_next <= resize(dout_11_im_signed, 13) - resize(dout_27_re_signed, 13);
      END IF;
    ELSIF dout_1_vld = '1' THEN 
      Radix22ButterflyG2_NF_btf1_re_reg_next <= resize(dout_11_re_signed, 13) + resize(dout_27_re_signed, 13);
      Radix22ButterflyG2_NF_btf2_re_reg_next <= resize(dout_11_re_signed, 13) - resize(dout_27_re_signed, 13);
      Radix22ButterflyG2_NF_btf1_im_reg_next <= resize(dout_11_im_signed, 13) + resize(dout_27_im_signed, 13);
      Radix22ButterflyG2_NF_btf2_im_reg_next <= resize(dout_11_im_signed, 13) - resize(dout_27_im_signed, 13);
    END IF;
    sra_temp := SHIFT_RIGHT(Radix22ButterflyG2_NF_btf1_re_reg, 1);
    dout_11_re_tmp <= sra_temp(11 DOWNTO 0);
    sra_temp_0 := SHIFT_RIGHT(Radix22ButterflyG2_NF_btf1_im_reg, 1);
    dout_11_im_tmp <= sra_temp_0(11 DOWNTO 0);
    sra_temp_1 := SHIFT_RIGHT(Radix22ButterflyG2_NF_btf2_re_reg, 1);
    dout_12_re_tmp <= sra_temp_1(11 DOWNTO 0);
    sra_temp_2 := SHIFT_RIGHT(Radix22ButterflyG2_NF_btf2_im_reg, 1);
    dout_12_im_tmp <= sra_temp_2(11 DOWNTO 0);
    dout_2_vld <= Radix22ButterflyG2_NF_din_vld_dly;
  END PROCESS Radix22ButterflyG2_NF_output;


  dout_12_re <= std_logic_vector(dout_12_re_tmp);

  dout_12_im <= std_logic_vector(dout_12_im_tmp);

  dout_11_re_1 <= std_logic_vector(dout_11_re_tmp);

  dout_11_im_1 <= std_logic_vector(dout_11_im_tmp);

END rtl;

