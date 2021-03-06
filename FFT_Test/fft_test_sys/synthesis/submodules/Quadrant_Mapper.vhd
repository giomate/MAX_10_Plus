-- -------------------------------------------------------------
-- 
-- File Name: D:\Salukat\Development\Software\Quartus\MAX_10\FFT\max_10_frequency_index\Quadrant_Mapper.vhd
-- Created: 2021-01-31 19:41:15
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Quadrant_Mapper
-- Source Path: max_10_frequency_index/max_10_index_frequency/frequency_max/index_finder/for_each/magnitud_fft/Quadrant_Mapper
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Quadrant_Mapper IS
  PORT( clk                               :   IN    std_logic;
        enb_1_32_0                        :   IN    std_logic;
        xin                               :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
        yin                               :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
        xout                              :   OUT   std_logic_vector(12 DOWNTO 0);  -- sfix13
        yout                              :   OUT   std_logic_vector(12 DOWNTO 0)  -- sfix13
        );
END Quadrant_Mapper;


ARCHITECTURE rtl OF Quadrant_Mapper IS

  ATTRIBUTE multstyle : string;

  -- Signals
  SIGNAL xin_signed                       : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL abs_y                            : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL xAbs                             : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL xAbs_1                           : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL yin_signed                       : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL abs1_y                           : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL yAbs                             : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL yAbs_1                           : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL relop_relop1                     : std_logic;
  SIGNAL xout_1                           : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL xout_tmp                         : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL yout_1                           : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL yout_tmp                         : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13

BEGIN
  xin_signed <= signed(xin);

  
  abs_y <=  - (resize(xin_signed, 14)) WHEN xin_signed < to_signed(16#0000#, 13) ELSE
      resize(xin_signed, 14);
  xAbs <= abs_y(12 DOWNTO 0);

  delayMatch_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        xAbs_1 <= xAbs;
      END IF;
    END IF;
  END PROCESS delayMatch_process;


  yin_signed <= signed(yin);

  
  abs1_y <=  - (resize(yin_signed, 14)) WHEN yin_signed < to_signed(16#0000#, 13) ELSE
      resize(yin_signed, 14);
  yAbs <= abs1_y(12 DOWNTO 0);

  delayMatch1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        yAbs_1 <= yAbs;
      END IF;
    END IF;
  END PROCESS delayMatch1_process;


  
  relop_relop1 <= '1' WHEN xAbs_1 > yAbs_1 ELSE
      '0';

  
  xout_1 <= yAbs_1 WHEN relop_relop1 = '0' ELSE
      xAbs_1;

  delayMatch3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        xout_tmp <= xout_1;
      END IF;
    END IF;
  END PROCESS delayMatch3_process;


  xout <= std_logic_vector(xout_tmp);

  
  yout_1 <= xAbs_1 WHEN relop_relop1 = '0' ELSE
      yAbs_1;

  delayMatch2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        yout_tmp <= yout_1;
      END IF;
    END IF;
  END PROCESS delayMatch2_process;


  yout <= std_logic_vector(yout_tmp);

END rtl;

