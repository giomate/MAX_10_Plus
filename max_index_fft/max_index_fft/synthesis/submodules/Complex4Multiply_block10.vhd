-- -------------------------------------------------------------
-- 
-- File Name: D:\Salukat\Development\Software\Quartus\MAX_10_Plus\fft_index\max_10_frequency_index\Complex4Multiply_block10.vhd
-- Created: 2021-02-21 20:02:11
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Complex4Multiply_block10
-- Source Path: max_10_frequency_index/max_10_index_frequency/FFT_streamer/FFT HDL Optimized/TWDLMULT_SDNF1_3/Complex4Multiply
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Complex4Multiply_block10 IS
  PORT( clk                               :   IN    std_logic;
        enb_1_32_0                        :   IN    std_logic;
        din2_re_dly3                      :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        din2_im_dly3                      :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        di2_vld_dly3                      :   IN    std_logic;
        twdl_3_14_re                      :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        twdl_3_14_im                      :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        softReset                         :   IN    std_logic;
        twdlXdin_14_re                    :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        twdlXdin_14_im                    :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        twdlXdin2_vld                     :   OUT   std_logic
        );
END Complex4Multiply_block10;


ARCHITECTURE rtl OF Complex4Multiply_block10 IS

  -- Signals
  SIGNAL din2_re_dly3_signed              : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din_re_reg                       : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din2_im_dly3_signed              : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din_im_reg                       : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL twdl_3_14_re_signed              : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL twdl_re_reg                      : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12_En10
  SIGNAL twdl_3_14_im_signed              : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL twdl_im_reg                      : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12_En10
  SIGNAL Complex4Multiply_din1_re_pipe1   : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL Complex4Multiply_din1_im_pipe1   : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL Complex4Multiply_mult1_re_pipe1  : signed(23 DOWNTO 0) := to_signed(16#000000#, 24);  -- sfix24
  SIGNAL Complex4Multiply_mult2_re_pipe1  : signed(23 DOWNTO 0) := to_signed(16#000000#, 24);  -- sfix24
  SIGNAL Complex4Multiply_mult1_im_pipe1  : signed(23 DOWNTO 0) := to_signed(16#000000#, 24);  -- sfix24
  SIGNAL Complex4Multiply_mult2_im_pipe1  : signed(23 DOWNTO 0) := to_signed(16#000000#, 24);  -- sfix24
  SIGNAL Complex4Multiply_twiddle_re_pipe1 : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL Complex4Multiply_twiddle_im_pipe1 : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL prod1_re                         : signed(23 DOWNTO 0) := to_signed(16#000000#, 24);  -- sfix24_En10
  SIGNAL prod1_im                         : signed(23 DOWNTO 0) := to_signed(16#000000#, 24);  -- sfix24_En10
  SIGNAL prod2_re                         : signed(23 DOWNTO 0) := to_signed(16#000000#, 24);  -- sfix24_En10
  SIGNAL prod2_im                         : signed(23 DOWNTO 0) := to_signed(16#000000#, 24);  -- sfix24_En10
  SIGNAL din_vld_dly1                     : std_logic := '0';
  SIGNAL din_vld_dly2                     : std_logic := '0';
  SIGNAL din_vld_dly3                     : std_logic := '0';
  SIGNAL prod_vld                         : std_logic := '0';
  SIGNAL Complex4Add_multRes_re_reg       : signed(24 DOWNTO 0) := to_signed(16#0000000#, 25);  -- sfix25
  SIGNAL Complex4Add_multRes_im_reg       : signed(24 DOWNTO 0) := to_signed(16#0000000#, 25);  -- sfix25
  SIGNAL Complex4Add_prod_vld_reg1        : std_logic := '0';
  SIGNAL Complex4Add_prod1_re_reg         : signed(23 DOWNTO 0) := to_signed(16#000000#, 24);  -- sfix24
  SIGNAL Complex4Add_prod1_im_reg         : signed(23 DOWNTO 0) := to_signed(16#000000#, 24);  -- sfix24
  SIGNAL Complex4Add_prod2_re_reg         : signed(23 DOWNTO 0) := to_signed(16#000000#, 24);  -- sfix24
  SIGNAL Complex4Add_prod2_im_reg         : signed(23 DOWNTO 0) := to_signed(16#000000#, 24);  -- sfix24
  SIGNAL Complex4Add_multRes_re_reg_next  : signed(24 DOWNTO 0);  -- sfix25_En10
  SIGNAL Complex4Add_multRes_im_reg_next  : signed(24 DOWNTO 0);  -- sfix25_En10
  SIGNAL Complex4Add_sub_cast             : signed(24 DOWNTO 0);  -- sfix25_En10
  SIGNAL Complex4Add_sub_cast_1           : signed(24 DOWNTO 0);  -- sfix25_En10
  SIGNAL Complex4Add_add_cast             : signed(24 DOWNTO 0);  -- sfix25_En10
  SIGNAL Complex4Add_add_cast_1           : signed(24 DOWNTO 0);  -- sfix25_En10
  SIGNAL mulResFP_re                      : signed(24 DOWNTO 0);  -- sfix25_En10
  SIGNAL mulResFP_im                      : signed(24 DOWNTO 0);  -- sfix25_En10
  SIGNAL twdlXdin_14_re_tmp               : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL twdlXdin_14_im_tmp               : signed(11 DOWNTO 0);  -- sfix12

BEGIN
  din2_re_dly3_signed <= signed(din2_re_dly3);

  intdelay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din_re_reg <= din2_re_dly3_signed;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  din2_im_dly3_signed <= signed(din2_im_dly3);

  intdelay_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din_im_reg <= din2_im_dly3_signed;
      END IF;
    END IF;
  END PROCESS intdelay_1_process;


  twdl_3_14_re_signed <= signed(twdl_3_14_re);

  intdelay_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        twdl_re_reg <= twdl_3_14_re_signed;
      END IF;
    END IF;
  END PROCESS intdelay_2_process;


  twdl_3_14_im_signed <= signed(twdl_3_14_im);

  intdelay_3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        twdl_im_reg <= twdl_3_14_im_signed;
      END IF;
    END IF;
  END PROCESS intdelay_3_process;


  -- Complex4Multiply
  Complex4Multiply_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        prod1_re <= Complex4Multiply_mult1_re_pipe1;
        prod2_re <= Complex4Multiply_mult2_re_pipe1;
        prod1_im <= Complex4Multiply_mult1_im_pipe1;
        prod2_im <= Complex4Multiply_mult2_im_pipe1;
        Complex4Multiply_mult1_re_pipe1 <= Complex4Multiply_din1_re_pipe1 * Complex4Multiply_twiddle_re_pipe1;
        Complex4Multiply_mult2_re_pipe1 <= Complex4Multiply_din1_im_pipe1 * Complex4Multiply_twiddle_im_pipe1;
        Complex4Multiply_mult1_im_pipe1 <= Complex4Multiply_din1_re_pipe1 * Complex4Multiply_twiddle_im_pipe1;
        Complex4Multiply_mult2_im_pipe1 <= Complex4Multiply_din1_im_pipe1 * Complex4Multiply_twiddle_re_pipe1;
        Complex4Multiply_twiddle_re_pipe1 <= twdl_re_reg;
        Complex4Multiply_twiddle_im_pipe1 <= twdl_im_reg;
        Complex4Multiply_din1_re_pipe1 <= din_re_reg;
        Complex4Multiply_din1_im_pipe1 <= din_im_reg;
      END IF;
    END IF;
  END PROCESS Complex4Multiply_process;


  intdelay_4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din_vld_dly1 <= di2_vld_dly3;
      END IF;
    END IF;
  END PROCESS intdelay_4_process;


  intdelay_5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din_vld_dly2 <= din_vld_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_5_process;


  intdelay_6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din_vld_dly3 <= din_vld_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_6_process;


  intdelay_7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        prod_vld <= din_vld_dly3;
      END IF;
    END IF;
  END PROCESS intdelay_7_process;


  -- Complex4Add
  Complex4Add_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        Complex4Add_multRes_re_reg <= Complex4Add_multRes_re_reg_next;
        Complex4Add_multRes_im_reg <= Complex4Add_multRes_im_reg_next;
        Complex4Add_prod1_re_reg <= prod1_re;
        Complex4Add_prod1_im_reg <= prod1_im;
        Complex4Add_prod2_re_reg <= prod2_re;
        Complex4Add_prod2_im_reg <= prod2_im;
        twdlXdin2_vld <= Complex4Add_prod_vld_reg1;
        Complex4Add_prod_vld_reg1 <= prod_vld;
      END IF;
    END IF;
  END PROCESS Complex4Add_process;

  Complex4Add_sub_cast <= resize(Complex4Add_prod1_re_reg, 25);
  Complex4Add_sub_cast_1 <= resize(Complex4Add_prod2_re_reg, 25);
  Complex4Add_multRes_re_reg_next <= Complex4Add_sub_cast - Complex4Add_sub_cast_1;
  Complex4Add_add_cast <= resize(Complex4Add_prod1_im_reg, 25);
  Complex4Add_add_cast_1 <= resize(Complex4Add_prod2_im_reg, 25);
  Complex4Add_multRes_im_reg_next <= Complex4Add_add_cast + Complex4Add_add_cast_1;
  mulResFP_re <= Complex4Add_multRes_re_reg;
  mulResFP_im <= Complex4Add_multRes_im_reg;

  twdlXdin_14_re_tmp <= mulResFP_re(21 DOWNTO 10);

  twdlXdin_14_re <= std_logic_vector(twdlXdin_14_re_tmp);

  twdlXdin_14_im_tmp <= mulResFP_im(21 DOWNTO 10);

  twdlXdin_14_im <= std_logic_vector(twdlXdin_14_im_tmp);

END rtl;

