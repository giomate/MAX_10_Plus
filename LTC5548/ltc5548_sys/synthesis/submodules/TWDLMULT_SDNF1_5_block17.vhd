-- -------------------------------------------------------------
-- 
-- File Name: D:\Salukat\Development\Software\Quartus\MAX_10\FFT\max_10_frequency_index\TWDLMULT_SDNF1_5_block17.vhd
-- Created: 2021-01-31 17:42:19
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: TWDLMULT_SDNF1_5_block17
-- Source Path: max_10_frequency_index/max_10_index_frequency/FFT_streamer/FFT HDL Optimized/TWDLMULT_SDNF1_5
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY TWDLMULT_SDNF1_5_block17 IS
  PORT( clk                               :   IN    std_logic;
        enb_1_64_0                        :   IN    std_logic;
        dout_34_re                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_34_im                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_36_re                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_36_im                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_4_vld                        :   IN    std_logic;
        twdl_5_37_re                      :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        twdl_5_37_im                      :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        twdl_5_38_re                      :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        twdl_5_38_im                      :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        twdl_5_38_vld                     :   IN    std_logic;
        softReset                         :   IN    std_logic;
        twdlXdin_37_re                    :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        twdlXdin_37_im                    :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        twdlXdin_38_re                    :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        twdlXdin_38_im                    :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        twdlXdin_37_vld                   :   OUT   std_logic
        );
END TWDLMULT_SDNF1_5_block17;


ARCHITECTURE rtl OF TWDLMULT_SDNF1_5_block17 IS

  -- Component Declarations
  COMPONENT Complex4Multiply_block86
    PORT( clk                             :   IN    std_logic;
          enb_1_64_0                      :   IN    std_logic;
          din2_re_dly3                    :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
          din2_im_dly3                    :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
          di2_vld_dly3                    :   IN    std_logic;
          twdl_5_38_re                    :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          twdl_5_38_im                    :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          softReset                       :   IN    std_logic;
          twdlXdin_38_re                  :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
          twdlXdin_38_im                  :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
          twdlXdin2_vld                   :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : Complex4Multiply_block86
    USE ENTITY work.Complex4Multiply_block86(rtl);

  -- Signals
  SIGNAL dout_34_re_signed                : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din1_re_dly1                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_re_dly2                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_re_dly3                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_re_dly4                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_re_dly5                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_re_dly6                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_re_dly7                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_re_dly8                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_re_dly9                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL dout_34_im_signed                : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din1_im_dly1                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_im_dly2                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_im_dly3                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_im_dly4                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_im_dly5                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_im_dly6                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_im_dly7                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_im_dly8                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_im_dly9                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL dout_36_re_signed                : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din2_re_dly1                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din2_re_dly2                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL dout_36_im_signed                : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din2_im_dly1                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din2_im_dly2                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din2_re_dly3                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din2_im_dly3                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL di2_vld_dly1                     : std_logic := '0';
  SIGNAL di2_vld_dly2                     : std_logic := '0';
  SIGNAL di2_vld_dly3                     : std_logic := '0';
  SIGNAL twdlXdin_38_re_tmp               : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL twdlXdin_38_im_tmp               : std_logic_vector(11 DOWNTO 0);  -- ufix12

BEGIN
  u_MUL4_2 : Complex4Multiply_block86
    PORT MAP( clk => clk,
              enb_1_64_0 => enb_1_64_0,
              din2_re_dly3 => std_logic_vector(din2_re_dly3),  -- sfix12
              din2_im_dly3 => std_logic_vector(din2_im_dly3),  -- sfix12
              di2_vld_dly3 => di2_vld_dly3,
              twdl_5_38_re => twdl_5_38_re,  -- sfix12_En10
              twdl_5_38_im => twdl_5_38_im,  -- sfix12_En10
              softReset => softReset,
              twdlXdin_38_re => twdlXdin_38_re_tmp,  -- sfix12
              twdlXdin_38_im => twdlXdin_38_im_tmp,  -- sfix12
              twdlXdin2_vld => twdlXdin_37_vld
              );

  dout_34_re_signed <= signed(dout_34_re);

  intdelay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        din1_re_dly1 <= dout_34_re_signed;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  intdelay_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        din1_re_dly2 <= din1_re_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_1_process;


  intdelay_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        din1_re_dly3 <= din1_re_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_2_process;


  intdelay_3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        din1_re_dly4 <= din1_re_dly3;
      END IF;
    END IF;
  END PROCESS intdelay_3_process;


  intdelay_4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        din1_re_dly5 <= din1_re_dly4;
      END IF;
    END IF;
  END PROCESS intdelay_4_process;


  intdelay_5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        din1_re_dly6 <= din1_re_dly5;
      END IF;
    END IF;
  END PROCESS intdelay_5_process;


  intdelay_6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        din1_re_dly7 <= din1_re_dly6;
      END IF;
    END IF;
  END PROCESS intdelay_6_process;


  intdelay_7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        din1_re_dly8 <= din1_re_dly7;
      END IF;
    END IF;
  END PROCESS intdelay_7_process;


  intdelay_8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        din1_re_dly9 <= din1_re_dly8;
      END IF;
    END IF;
  END PROCESS intdelay_8_process;


  twdlXdin_37_re <= std_logic_vector(din1_re_dly9);

  dout_34_im_signed <= signed(dout_34_im);

  intdelay_9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        din1_im_dly1 <= dout_34_im_signed;
      END IF;
    END IF;
  END PROCESS intdelay_9_process;


  intdelay_10_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        din1_im_dly2 <= din1_im_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_10_process;


  intdelay_11_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        din1_im_dly3 <= din1_im_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_11_process;


  intdelay_12_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        din1_im_dly4 <= din1_im_dly3;
      END IF;
    END IF;
  END PROCESS intdelay_12_process;


  intdelay_13_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        din1_im_dly5 <= din1_im_dly4;
      END IF;
    END IF;
  END PROCESS intdelay_13_process;


  intdelay_14_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        din1_im_dly6 <= din1_im_dly5;
      END IF;
    END IF;
  END PROCESS intdelay_14_process;


  intdelay_15_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        din1_im_dly7 <= din1_im_dly6;
      END IF;
    END IF;
  END PROCESS intdelay_15_process;


  intdelay_16_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        din1_im_dly8 <= din1_im_dly7;
      END IF;
    END IF;
  END PROCESS intdelay_16_process;


  intdelay_17_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        din1_im_dly9 <= din1_im_dly8;
      END IF;
    END IF;
  END PROCESS intdelay_17_process;


  twdlXdin_37_im <= std_logic_vector(din1_im_dly9);

  dout_36_re_signed <= signed(dout_36_re);

  intdelay_18_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        din2_re_dly1 <= dout_36_re_signed;
      END IF;
    END IF;
  END PROCESS intdelay_18_process;


  intdelay_19_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        din2_re_dly2 <= din2_re_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_19_process;


  dout_36_im_signed <= signed(dout_36_im);

  intdelay_20_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        din2_im_dly1 <= dout_36_im_signed;
      END IF;
    END IF;
  END PROCESS intdelay_20_process;


  intdelay_21_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        din2_im_dly2 <= din2_im_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_21_process;


  intdelay_22_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        din2_re_dly3 <= din2_re_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_22_process;


  intdelay_23_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        din2_im_dly3 <= din2_im_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_23_process;


  intdelay_24_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        di2_vld_dly1 <= dout_4_vld;
      END IF;
    END IF;
  END PROCESS intdelay_24_process;


  intdelay_25_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        di2_vld_dly2 <= di2_vld_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_25_process;


  intdelay_26_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_64_0 = '1' THEN
        di2_vld_dly3 <= di2_vld_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_26_process;


  twdlXdin_38_re <= twdlXdin_38_re_tmp;

  twdlXdin_38_im <= twdlXdin_38_im_tmp;

END rtl;
