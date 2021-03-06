-- -------------------------------------------------------------
-- 
-- File Name: D:\Salukat\Development\Software\Quartus\MAX_10\FFT\max_10_frequency_index\dsp_FIRFilter.vhd
-- Created: 2021-01-31 19:41:13
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: dsp_FIRFilter
-- Source Path: dsp.FIRFilter
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY dsp_FIRFilter IS
  PORT( clk                               :   IN    std_logic;
        enb                               :   IN    std_logic;
        dsp_FIRFilter_in                  :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dsp_FIRFilter_out                 :   OUT   std_logic_vector(28 DOWNTO 0)  -- sfix29_En15
        );
END dsp_FIRFilter;


ARCHITECTURE rtl OF dsp_FIRFilter IS

  -- Signals
  SIGNAL dsp_FIRFilter_in_signed          : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL product32                        : signed(23 DOWNTO 0);  -- sfix24_En15
  SIGNAL sum_31                           : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_31                           : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast                   : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_30                           : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_30                           : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_1                 : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_29                           : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_29                           : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_2                 : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_28                           : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_28                           : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_3                 : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_27                           : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_27                           : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_4                 : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_26                           : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_26                           : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_5                 : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_25                           : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_25                           : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_6                 : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_24                           : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_24                           : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_7                 : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_23                           : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_23                           : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_8                 : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_22                           : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_22                           : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_9                 : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_21                           : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_21                           : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_10                : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_20                           : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_20                           : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_11                : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_19                           : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_19                           : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_12                : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_18                           : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_18                           : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_13                : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_17                           : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_17                           : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_14                : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_16                           : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_16                           : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_15                : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_15                           : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_15                           : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_16                : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_14                           : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_14                           : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_17                : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_13                           : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_13                           : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_18                : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_12                           : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_12                           : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_19                : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_11                           : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_11                           : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_20                : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_10                           : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_10                           : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_21                : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_9                            : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_9                            : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_22                : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_8                            : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_8                            : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_23                : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_7                            : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_7                            : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_24                : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_6                            : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_6                            : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_25                : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_5                            : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_5                            : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_26                : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_4                            : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_4                            : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_27                : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_3                            : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_3                            : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_28                : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_2                            : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_2                            : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_29                : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL sum_1                            : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL del_1                            : signed(28 DOWNTO 0) := to_signed(16#00000000#, 29);  -- sfix29_En15
  SIGNAL adder_add_cast_30                : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL finalsum                         : signed(28 DOWNTO 0);  -- sfix29_En15

  ATTRIBUTE multstyle : string;

BEGIN
  -- coeff1
  -- 
  -- coeff2
  -- 
  -- coeff3
  -- 
  -- coeff4
  -- 
  -- coeff5
  -- 
  -- coeff6
  -- 
  -- coeff7
  -- 
  -- coeff8
  -- 
  -- coeff9
  -- 
  -- coeff10
  -- 
  -- coeff11
  -- 
  -- coeff12
  -- 
  -- coeff13
  -- 
  -- coeff14
  -- 
  -- coeff15
  -- 
  -- coeff16
  -- 
  -- coeff17
  -- 
  -- coeff18
  -- 
  -- coeff19
  -- 
  -- coeff20
  -- 
  -- coeff21
  -- 
  -- coeff22
  -- 
  -- coeff23
  -- 
  -- coeff24
  -- 
  -- coeff25
  -- 
  -- coeff26
  -- 
  -- coeff27
  -- 
  -- coeff28
  -- 
  -- coeff29
  -- 
  -- coeff30
  -- 
  -- coeff31
  dsp_FIRFilter_in_signed <= signed(dsp_FIRFilter_in);

  -- coeff32
  product32 <= resize(dsp_FIRFilter_in_signed & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 24);

  sum_31 <= resize(product32, 29);

  intdelay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_31 <= sum_31;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  adder_add_cast <= resize(product32, 29);
  sum_30 <= adder_add_cast + del_31;

  intdelay_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_30 <= sum_30;
      END IF;
    END IF;
  END PROCESS intdelay_1_process;


  adder_add_cast_1 <= resize(product32, 29);
  sum_29 <= adder_add_cast_1 + del_30;

  intdelay_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_29 <= sum_29;
      END IF;
    END IF;
  END PROCESS intdelay_2_process;


  adder_add_cast_2 <= resize(product32, 29);
  sum_28 <= adder_add_cast_2 + del_29;

  intdelay_3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_28 <= sum_28;
      END IF;
    END IF;
  END PROCESS intdelay_3_process;


  adder_add_cast_3 <= resize(product32, 29);
  sum_27 <= adder_add_cast_3 + del_28;

  intdelay_4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_27 <= sum_27;
      END IF;
    END IF;
  END PROCESS intdelay_4_process;


  adder_add_cast_4 <= resize(product32, 29);
  sum_26 <= adder_add_cast_4 + del_27;

  intdelay_5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_26 <= sum_26;
      END IF;
    END IF;
  END PROCESS intdelay_5_process;


  adder_add_cast_5 <= resize(product32, 29);
  sum_25 <= adder_add_cast_5 + del_26;

  intdelay_6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_25 <= sum_25;
      END IF;
    END IF;
  END PROCESS intdelay_6_process;


  adder_add_cast_6 <= resize(product32, 29);
  sum_24 <= adder_add_cast_6 + del_25;

  intdelay_7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_24 <= sum_24;
      END IF;
    END IF;
  END PROCESS intdelay_7_process;


  adder_add_cast_7 <= resize(product32, 29);
  sum_23 <= adder_add_cast_7 + del_24;

  intdelay_8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_23 <= sum_23;
      END IF;
    END IF;
  END PROCESS intdelay_8_process;


  adder_add_cast_8 <= resize(product32, 29);
  sum_22 <= adder_add_cast_8 + del_23;

  intdelay_9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_22 <= sum_22;
      END IF;
    END IF;
  END PROCESS intdelay_9_process;


  adder_add_cast_9 <= resize(product32, 29);
  sum_21 <= adder_add_cast_9 + del_22;

  intdelay_10_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_21 <= sum_21;
      END IF;
    END IF;
  END PROCESS intdelay_10_process;


  adder_add_cast_10 <= resize(product32, 29);
  sum_20 <= adder_add_cast_10 + del_21;

  intdelay_11_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_20 <= sum_20;
      END IF;
    END IF;
  END PROCESS intdelay_11_process;


  adder_add_cast_11 <= resize(product32, 29);
  sum_19 <= adder_add_cast_11 + del_20;

  intdelay_12_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_19 <= sum_19;
      END IF;
    END IF;
  END PROCESS intdelay_12_process;


  adder_add_cast_12 <= resize(product32, 29);
  sum_18 <= adder_add_cast_12 + del_19;

  intdelay_13_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_18 <= sum_18;
      END IF;
    END IF;
  END PROCESS intdelay_13_process;


  adder_add_cast_13 <= resize(product32, 29);
  sum_17 <= adder_add_cast_13 + del_18;

  intdelay_14_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_17 <= sum_17;
      END IF;
    END IF;
  END PROCESS intdelay_14_process;


  adder_add_cast_14 <= resize(product32, 29);
  sum_16 <= adder_add_cast_14 + del_17;

  intdelay_15_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_16 <= sum_16;
      END IF;
    END IF;
  END PROCESS intdelay_15_process;


  adder_add_cast_15 <= resize(product32, 29);
  sum_15 <= adder_add_cast_15 + del_16;

  intdelay_16_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_15 <= sum_15;
      END IF;
    END IF;
  END PROCESS intdelay_16_process;


  adder_add_cast_16 <= resize(product32, 29);
  sum_14 <= adder_add_cast_16 + del_15;

  intdelay_17_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_14 <= sum_14;
      END IF;
    END IF;
  END PROCESS intdelay_17_process;


  adder_add_cast_17 <= resize(product32, 29);
  sum_13 <= adder_add_cast_17 + del_14;

  intdelay_18_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_13 <= sum_13;
      END IF;
    END IF;
  END PROCESS intdelay_18_process;


  adder_add_cast_18 <= resize(product32, 29);
  sum_12 <= adder_add_cast_18 + del_13;

  intdelay_19_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_12 <= sum_12;
      END IF;
    END IF;
  END PROCESS intdelay_19_process;


  adder_add_cast_19 <= resize(product32, 29);
  sum_11 <= adder_add_cast_19 + del_12;

  intdelay_20_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_11 <= sum_11;
      END IF;
    END IF;
  END PROCESS intdelay_20_process;


  adder_add_cast_20 <= resize(product32, 29);
  sum_10 <= adder_add_cast_20 + del_11;

  intdelay_21_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_10 <= sum_10;
      END IF;
    END IF;
  END PROCESS intdelay_21_process;


  adder_add_cast_21 <= resize(product32, 29);
  sum_9 <= adder_add_cast_21 + del_10;

  intdelay_22_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_9 <= sum_9;
      END IF;
    END IF;
  END PROCESS intdelay_22_process;


  adder_add_cast_22 <= resize(product32, 29);
  sum_8 <= adder_add_cast_22 + del_9;

  intdelay_23_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_8 <= sum_8;
      END IF;
    END IF;
  END PROCESS intdelay_23_process;


  adder_add_cast_23 <= resize(product32, 29);
  sum_7 <= adder_add_cast_23 + del_8;

  intdelay_24_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_7 <= sum_7;
      END IF;
    END IF;
  END PROCESS intdelay_24_process;


  adder_add_cast_24 <= resize(product32, 29);
  sum_6 <= adder_add_cast_24 + del_7;

  intdelay_25_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_6 <= sum_6;
      END IF;
    END IF;
  END PROCESS intdelay_25_process;


  adder_add_cast_25 <= resize(product32, 29);
  sum_5 <= adder_add_cast_25 + del_6;

  intdelay_26_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_5 <= sum_5;
      END IF;
    END IF;
  END PROCESS intdelay_26_process;


  adder_add_cast_26 <= resize(product32, 29);
  sum_4 <= adder_add_cast_26 + del_5;

  intdelay_27_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_4 <= sum_4;
      END IF;
    END IF;
  END PROCESS intdelay_27_process;


  adder_add_cast_27 <= resize(product32, 29);
  sum_3 <= adder_add_cast_27 + del_4;

  intdelay_28_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_3 <= sum_3;
      END IF;
    END IF;
  END PROCESS intdelay_28_process;


  adder_add_cast_28 <= resize(product32, 29);
  sum_2 <= adder_add_cast_28 + del_3;

  intdelay_29_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_2 <= sum_2;
      END IF;
    END IF;
  END PROCESS intdelay_29_process;


  adder_add_cast_29 <= resize(product32, 29);
  sum_1 <= adder_add_cast_29 + del_2;

  intdelay_30_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        del_1 <= sum_1;
      END IF;
    END IF;
  END PROCESS intdelay_30_process;


  adder_add_cast_30 <= resize(product32, 29);
  finalsum <= adder_add_cast_30 + del_1;

  dsp_FIRFilter_out <= std_logic_vector(finalsum);

END rtl;

