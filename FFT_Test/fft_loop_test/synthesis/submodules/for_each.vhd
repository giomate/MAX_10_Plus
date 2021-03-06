-- -------------------------------------------------------------
-- 
-- File Name: D:\Salukat\Development\Software\Quartus\MAX_10\FFT\max_10_frequency_index\for_each.vhd
-- Created: 2021-01-31 19:41:15
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: for_each
-- Source Path: max_10_frequency_index/max_10_index_frequency/frequency_max/index_finder/for_each
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY for_each IS
  PORT( clk                               :   IN    std_logic;
        enb_1_32_0                        :   IN    std_logic;
        fft_data_re                       :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        fft_data_im                       :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        enable                            :   IN    std_logic;
        Out1                              :   OUT   std_logic_vector(12 DOWNTO 0);  -- sfix13
        Out2                              :   OUT   std_logic
        );
END for_each;


ARCHITECTURE rtl OF for_each IS

  ATTRIBUTE multstyle : string;

  -- Component Declarations
  COMPONENT Quadrant_Mapper
    PORT( clk                             :   IN    std_logic;
          enb_1_32_0                      :   IN    std_logic;
          xin                             :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
          yin                             :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
          xout                            :   OUT   std_logic_vector(12 DOWNTO 0);  -- sfix13
          yout                            :   OUT   std_logic_vector(12 DOWNTO 0)  -- sfix13
          );
  END COMPONENT;

  COMPONENT CordicKernelMag
    PORT( xin                             :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
          yin                             :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
          idx                             :   IN    std_logic_vector(4 DOWNTO 0);  -- ufix5
          xout                            :   OUT   std_logic_vector(12 DOWNTO 0);  -- sfix13
          yout                            :   OUT   std_logic_vector(12 DOWNTO 0)  -- sfix13
          );
  END COMPONENT;

  COMPONENT CordicKernelMag_block
    PORT( xin                             :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
          yin                             :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
          idx                             :   IN    std_logic_vector(4 DOWNTO 0);  -- ufix5
          xout                            :   OUT   std_logic_vector(12 DOWNTO 0);  -- sfix13
          yout                            :   OUT   std_logic_vector(12 DOWNTO 0)  -- sfix13
          );
  END COMPONENT;

  COMPONENT CordicKernelMag_block1
    PORT( xin                             :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
          yin                             :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
          idx                             :   IN    std_logic_vector(4 DOWNTO 0);  -- ufix5
          xout                            :   OUT   std_logic_vector(12 DOWNTO 0);  -- sfix13
          yout                            :   OUT   std_logic_vector(12 DOWNTO 0)  -- sfix13
          );
  END COMPONENT;

  COMPONENT CordicKernelMag_block2
    PORT( xin                             :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
          yin                             :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
          idx                             :   IN    std_logic_vector(4 DOWNTO 0);  -- ufix5
          xout                            :   OUT   std_logic_vector(12 DOWNTO 0);  -- sfix13
          yout                            :   OUT   std_logic_vector(12 DOWNTO 0)  -- sfix13
          );
  END COMPONENT;

  COMPONENT CordicKernelMag_block3
    PORT( xin                             :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
          yin                             :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
          idx                             :   IN    std_logic_vector(4 DOWNTO 0);  -- ufix5
          xout                            :   OUT   std_logic_vector(12 DOWNTO 0);  -- sfix13
          yout                            :   OUT   std_logic_vector(12 DOWNTO 0)  -- sfix13
          );
  END COMPONENT;

  COMPONENT CordicKernelMag_block4
    PORT( xin                             :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
          yin                             :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
          idx                             :   IN    std_logic_vector(4 DOWNTO 0);  -- ufix5
          xout                            :   OUT   std_logic_vector(12 DOWNTO 0);  -- sfix13
          yout                            :   OUT   std_logic_vector(12 DOWNTO 0)  -- sfix13
          );
  END COMPONENT;

  COMPONENT CordicKernelMag_block5
    PORT( xin                             :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
          yin                             :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
          idx                             :   IN    std_logic_vector(4 DOWNTO 0);  -- ufix5
          xout                            :   OUT   std_logic_vector(12 DOWNTO 0);  -- sfix13
          yout                            :   OUT   std_logic_vector(12 DOWNTO 0)  -- sfix13
          );
  END COMPONENT;

  COMPONENT CordicKernelMag_block6
    PORT( xin                             :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
          yin                             :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
          idx                             :   IN    std_logic_vector(4 DOWNTO 0);  -- ufix5
          xout                            :   OUT   std_logic_vector(12 DOWNTO 0);  -- sfix13
          yout                            :   OUT   std_logic_vector(12 DOWNTO 0)  -- sfix13
          );
  END COMPONENT;

  COMPONENT CordicKernelMag_block7
    PORT( xin                             :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
          yin                             :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
          idx                             :   IN    std_logic_vector(4 DOWNTO 0);  -- ufix5
          xout                            :   OUT   std_logic_vector(12 DOWNTO 0);  -- sfix13
          yout                            :   OUT   std_logic_vector(12 DOWNTO 0)  -- sfix13
          );
  END COMPONENT;

  COMPONENT CordicKernelMag_block8
    PORT( xin                             :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
          yin                             :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
          idx                             :   IN    std_logic_vector(4 DOWNTO 0);  -- ufix5
          xout                            :   OUT   std_logic_vector(12 DOWNTO 0);  -- sfix13
          yout                            :   OUT   std_logic_vector(12 DOWNTO 0)  -- sfix13
          );
  END COMPONENT;

  COMPONENT CordicKernelMag_block9
    PORT( xin                             :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
          yin                             :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
          idx                             :   IN    std_logic_vector(4 DOWNTO 0);  -- ufix5
          xout                            :   OUT   std_logic_vector(12 DOWNTO 0);  -- sfix13
          yout                            :   OUT   std_logic_vector(12 DOWNTO 0)  -- sfix13
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : Quadrant_Mapper
    USE ENTITY work.Quadrant_Mapper(rtl);

  FOR ALL : CordicKernelMag
    USE ENTITY work.CordicKernelMag(rtl);

  FOR ALL : CordicKernelMag_block
    USE ENTITY work.CordicKernelMag_block(rtl);

  FOR ALL : CordicKernelMag_block1
    USE ENTITY work.CordicKernelMag_block1(rtl);

  FOR ALL : CordicKernelMag_block2
    USE ENTITY work.CordicKernelMag_block2(rtl);

  FOR ALL : CordicKernelMag_block3
    USE ENTITY work.CordicKernelMag_block3(rtl);

  FOR ALL : CordicKernelMag_block4
    USE ENTITY work.CordicKernelMag_block4(rtl);

  FOR ALL : CordicKernelMag_block5
    USE ENTITY work.CordicKernelMag_block5(rtl);

  FOR ALL : CordicKernelMag_block6
    USE ENTITY work.CordicKernelMag_block6(rtl);

  FOR ALL : CordicKernelMag_block7
    USE ENTITY work.CordicKernelMag_block7(rtl);

  FOR ALL : CordicKernelMag_block8
    USE ENTITY work.CordicKernelMag_block8(rtl);

  FOR ALL : CordicKernelMag_block9
    USE ENTITY work.CordicKernelMag_block9(rtl);

  -- Signals
  SIGNAL Delay_ValidIn_reg                : std_logic_vector(0 TO 13) := ('0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');  -- ufix1 [14]
  SIGNAL Delay_ValidIn_reg_next           : std_logic_vector(0 TO 13);  -- ufix1 [14]
  SIGNAL ValidOutDelayed                  : std_logic;
  SIGNAL fft_data_re_signed               : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL fft_data_im_signed               : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL qMapReal                         : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL qMapImag                         : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL qMapReal_1                       : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL qMapImag_1                       : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL XQMapped                         : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL yQMapped                         : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL shift1                           : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL xout1                            : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL yout1                            : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL xout1_signed                     : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL yout1_signed                     : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL xout1_1                          : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL yout1_1                          : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL shift2                           : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL xout2                            : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL yout2                            : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL xout2_signed                     : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL yout2_signed                     : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL xout2_1                          : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL yout2_1                          : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL shift3                           : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL xout3                            : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL yout3                            : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL xout3_signed                     : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL yout3_signed                     : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL xout3_1                          : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL yout3_1                          : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL shift4                           : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL xout4                            : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL yout4                            : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL xout4_signed                     : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL yout4_signed                     : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL xout4_1                          : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL yout4_1                          : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL shift5                           : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL xout5                            : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL yout5                            : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL xout5_signed                     : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL yout5_signed                     : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL xout5_1                          : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL yout5_1                          : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL shift6                           : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL xout6                            : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL yout6                            : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL xout6_signed                     : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL yout6_signed                     : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL xout6_1                          : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL yout6_1                          : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL shift7                           : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL xout7                            : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL yout7                            : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL xout7_signed                     : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL yout7_signed                     : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL xout7_1                          : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL yout7_1                          : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL shift8                           : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL xout8                            : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL yout8                            : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL xout8_signed                     : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL yout8_signed                     : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL xout8_1                          : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL yout8_1                          : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL shift9                           : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL xout9                            : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL yout9                            : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL xout9_signed                     : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL yout9_signed                     : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL xout9_1                          : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL yout9_1                          : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL shift10                          : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL xout10                           : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL yout10                           : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL xout10_signed                    : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL yout10_signed                    : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL xout10_1                         : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL yout10_1                         : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL shift11                          : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL xout11                           : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL yout11                           : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL xout11_signed                    : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL reset_1                          : std_logic;
  SIGNAL xout11_1                         : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL CSD_Gain_Factor_mul_temp         : signed(26 DOWNTO 0);  -- sfix27_En13
  SIGNAL CSD_Gain_Factor_cast             : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL xoutscaled                       : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL zeroC                            : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL outSwitchMag                     : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL outSwitchMag_1                   : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL validOut                         : std_logic := '0';

BEGIN
  u_QuadrantMapper : Quadrant_Mapper
    PORT MAP( clk => clk,
              enb_1_32_0 => enb_1_32_0,
              xin => std_logic_vector(qMapReal_1),  -- sfix13
              yin => std_logic_vector(qMapImag_1),  -- sfix13
              xout => XQMapped,  -- sfix13
              yout => yQMapped  -- sfix13
              );

  u_Iteration : CordicKernelMag
    PORT MAP( xin => XQMapped,  -- sfix13
              yin => yQMapped,  -- sfix13
              idx => std_logic_vector(shift1),  -- ufix5
              xout => xout1,  -- sfix13
              yout => yout1  -- sfix13
              );

  u_Iteration1 : CordicKernelMag_block
    PORT MAP( xin => std_logic_vector(xout1_1),  -- sfix13
              yin => std_logic_vector(yout1_1),  -- sfix13
              idx => std_logic_vector(shift2),  -- ufix5
              xout => xout2,  -- sfix13
              yout => yout2  -- sfix13
              );

  u_Iteration2 : CordicKernelMag_block1
    PORT MAP( xin => std_logic_vector(xout2_1),  -- sfix13
              yin => std_logic_vector(yout2_1),  -- sfix13
              idx => std_logic_vector(shift3),  -- ufix5
              xout => xout3,  -- sfix13
              yout => yout3  -- sfix13
              );

  u_Iteration3 : CordicKernelMag_block2
    PORT MAP( xin => std_logic_vector(xout3_1),  -- sfix13
              yin => std_logic_vector(yout3_1),  -- sfix13
              idx => std_logic_vector(shift4),  -- ufix5
              xout => xout4,  -- sfix13
              yout => yout4  -- sfix13
              );

  u_Iteration4 : CordicKernelMag_block3
    PORT MAP( xin => std_logic_vector(xout4_1),  -- sfix13
              yin => std_logic_vector(yout4_1),  -- sfix13
              idx => std_logic_vector(shift5),  -- ufix5
              xout => xout5,  -- sfix13
              yout => yout5  -- sfix13
              );

  u_Iteration5 : CordicKernelMag_block4
    PORT MAP( xin => std_logic_vector(xout5_1),  -- sfix13
              yin => std_logic_vector(yout5_1),  -- sfix13
              idx => std_logic_vector(shift6),  -- ufix5
              xout => xout6,  -- sfix13
              yout => yout6  -- sfix13
              );

  u_Iteration6 : CordicKernelMag_block5
    PORT MAP( xin => std_logic_vector(xout6_1),  -- sfix13
              yin => std_logic_vector(yout6_1),  -- sfix13
              idx => std_logic_vector(shift7),  -- ufix5
              xout => xout7,  -- sfix13
              yout => yout7  -- sfix13
              );

  u_Iteration7 : CordicKernelMag_block6
    PORT MAP( xin => std_logic_vector(xout7_1),  -- sfix13
              yin => std_logic_vector(yout7_1),  -- sfix13
              idx => std_logic_vector(shift8),  -- ufix5
              xout => xout8,  -- sfix13
              yout => yout8  -- sfix13
              );

  u_Iteration8 : CordicKernelMag_block7
    PORT MAP( xin => std_logic_vector(xout8_1),  -- sfix13
              yin => std_logic_vector(yout8_1),  -- sfix13
              idx => std_logic_vector(shift9),  -- ufix5
              xout => xout9,  -- sfix13
              yout => yout9  -- sfix13
              );

  u_Iteration9 : CordicKernelMag_block8
    PORT MAP( xin => std_logic_vector(xout9_1),  -- sfix13
              yin => std_logic_vector(yout9_1),  -- sfix13
              idx => std_logic_vector(shift10),  -- ufix5
              xout => xout10,  -- sfix13
              yout => yout10  -- sfix13
              );

  u_Iteration10 : CordicKernelMag_block9
    PORT MAP( xin => std_logic_vector(xout10_1),  -- sfix13
              yin => std_logic_vector(yout10_1),  -- sfix13
              idx => std_logic_vector(shift11),  -- ufix5
              xout => xout11,  -- sfix13
              yout => yout11  -- sfix13
              );

  Delay_ValidIn_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        Delay_ValidIn_reg(0) <= Delay_ValidIn_reg_next(0);
        Delay_ValidIn_reg(1) <= Delay_ValidIn_reg_next(1);
        Delay_ValidIn_reg(2) <= Delay_ValidIn_reg_next(2);
        Delay_ValidIn_reg(3) <= Delay_ValidIn_reg_next(3);
        Delay_ValidIn_reg(4) <= Delay_ValidIn_reg_next(4);
        Delay_ValidIn_reg(5) <= Delay_ValidIn_reg_next(5);
        Delay_ValidIn_reg(6) <= Delay_ValidIn_reg_next(6);
        Delay_ValidIn_reg(7) <= Delay_ValidIn_reg_next(7);
        Delay_ValidIn_reg(8) <= Delay_ValidIn_reg_next(8);
        Delay_ValidIn_reg(9) <= Delay_ValidIn_reg_next(9);
        Delay_ValidIn_reg(10) <= Delay_ValidIn_reg_next(10);
        Delay_ValidIn_reg(11) <= Delay_ValidIn_reg_next(11);
        Delay_ValidIn_reg(12) <= Delay_ValidIn_reg_next(12);
        Delay_ValidIn_reg(13) <= Delay_ValidIn_reg_next(13);
      END IF;
    END IF;
  END PROCESS Delay_ValidIn_process;

  ValidOutDelayed <= Delay_ValidIn_reg(13);
  Delay_ValidIn_reg_next(0) <= enable;
  Delay_ValidIn_reg_next(1) <= Delay_ValidIn_reg(0);
  Delay_ValidIn_reg_next(2) <= Delay_ValidIn_reg(1);
  Delay_ValidIn_reg_next(3) <= Delay_ValidIn_reg(2);
  Delay_ValidIn_reg_next(4) <= Delay_ValidIn_reg(3);
  Delay_ValidIn_reg_next(5) <= Delay_ValidIn_reg(4);
  Delay_ValidIn_reg_next(6) <= Delay_ValidIn_reg(5);
  Delay_ValidIn_reg_next(7) <= Delay_ValidIn_reg(6);
  Delay_ValidIn_reg_next(8) <= Delay_ValidIn_reg(7);
  Delay_ValidIn_reg_next(9) <= Delay_ValidIn_reg(8);
  Delay_ValidIn_reg_next(10) <= Delay_ValidIn_reg(9);
  Delay_ValidIn_reg_next(11) <= Delay_ValidIn_reg(10);
  Delay_ValidIn_reg_next(12) <= Delay_ValidIn_reg(11);
  Delay_ValidIn_reg_next(13) <= Delay_ValidIn_reg(12);

  -- Complex to Magnitude-Angle HDL Optimized
  fft_data_re_signed <= signed(fft_data_re);

  qMapReal <= resize(fft_data_re_signed, 13);

  fft_data_im_signed <= signed(fft_data_im);

  qMapImag <= resize(fft_data_im_signed, 13);

  delayMatch_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        qMapReal_1 <= qMapReal;
      END IF;
    END IF;
  END PROCESS delayMatch_process;


  delayMatch1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        qMapImag_1 <= qMapImag;
      END IF;
    END IF;
  END PROCESS delayMatch1_process;


  shift1 <= to_unsigned(16#01#, 5);

  xout1_signed <= signed(xout1);

  yout1_signed <= signed(yout1);

  delayMatch2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        xout1_1 <= xout1_signed;
      END IF;
    END IF;
  END PROCESS delayMatch2_process;


  delayMatch3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        yout1_1 <= yout1_signed;
      END IF;
    END IF;
  END PROCESS delayMatch3_process;


  shift2 <= to_unsigned(16#02#, 5);

  xout2_signed <= signed(xout2);

  yout2_signed <= signed(yout2);

  delayMatch4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        xout2_1 <= xout2_signed;
      END IF;
    END IF;
  END PROCESS delayMatch4_process;


  delayMatch5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        yout2_1 <= yout2_signed;
      END IF;
    END IF;
  END PROCESS delayMatch5_process;


  shift3 <= to_unsigned(16#03#, 5);

  xout3_signed <= signed(xout3);

  yout3_signed <= signed(yout3);

  delayMatch6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        xout3_1 <= xout3_signed;
      END IF;
    END IF;
  END PROCESS delayMatch6_process;


  delayMatch7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        yout3_1 <= yout3_signed;
      END IF;
    END IF;
  END PROCESS delayMatch7_process;


  shift4 <= to_unsigned(16#04#, 5);

  xout4_signed <= signed(xout4);

  yout4_signed <= signed(yout4);

  delayMatch8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        xout4_1 <= xout4_signed;
      END IF;
    END IF;
  END PROCESS delayMatch8_process;


  delayMatch9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        yout4_1 <= yout4_signed;
      END IF;
    END IF;
  END PROCESS delayMatch9_process;


  shift5 <= to_unsigned(16#05#, 5);

  xout5_signed <= signed(xout5);

  yout5_signed <= signed(yout5);

  delayMatch10_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        xout5_1 <= xout5_signed;
      END IF;
    END IF;
  END PROCESS delayMatch10_process;


  delayMatch11_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        yout5_1 <= yout5_signed;
      END IF;
    END IF;
  END PROCESS delayMatch11_process;


  shift6 <= to_unsigned(16#06#, 5);

  xout6_signed <= signed(xout6);

  yout6_signed <= signed(yout6);

  delayMatch12_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        xout6_1 <= xout6_signed;
      END IF;
    END IF;
  END PROCESS delayMatch12_process;


  delayMatch13_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        yout6_1 <= yout6_signed;
      END IF;
    END IF;
  END PROCESS delayMatch13_process;


  shift7 <= to_unsigned(16#07#, 5);

  xout7_signed <= signed(xout7);

  yout7_signed <= signed(yout7);

  delayMatch14_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        xout7_1 <= xout7_signed;
      END IF;
    END IF;
  END PROCESS delayMatch14_process;


  delayMatch15_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        yout7_1 <= yout7_signed;
      END IF;
    END IF;
  END PROCESS delayMatch15_process;


  shift8 <= to_unsigned(16#08#, 5);

  xout8_signed <= signed(xout8);

  yout8_signed <= signed(yout8);

  delayMatch16_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        xout8_1 <= xout8_signed;
      END IF;
    END IF;
  END PROCESS delayMatch16_process;


  delayMatch17_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        yout8_1 <= yout8_signed;
      END IF;
    END IF;
  END PROCESS delayMatch17_process;


  shift9 <= to_unsigned(16#09#, 5);

  xout9_signed <= signed(xout9);

  yout9_signed <= signed(yout9);

  delayMatch18_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        xout9_1 <= xout9_signed;
      END IF;
    END IF;
  END PROCESS delayMatch18_process;


  delayMatch19_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        yout9_1 <= yout9_signed;
      END IF;
    END IF;
  END PROCESS delayMatch19_process;


  shift10 <= to_unsigned(16#0A#, 5);

  xout10_signed <= signed(xout10);

  yout10_signed <= signed(yout10);

  delayMatch20_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        xout10_1 <= xout10_signed;
      END IF;
    END IF;
  END PROCESS delayMatch20_process;


  delayMatch21_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        yout10_1 <= yout10_signed;
      END IF;
    END IF;
  END PROCESS delayMatch21_process;


  shift11 <= to_unsigned(16#0B#, 5);

  xout11_signed <= signed(xout11);

  reset_1 <=  NOT ValidOutDelayed;

  delayMatch22_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        xout11_1 <= xout11_signed;
      END IF;
    END IF;
  END PROCESS delayMatch22_process;


  -- CSD Encoding (7035) : 1001'001'00001'01'; Cost (Adders) = 4
  CSD_Gain_Factor_mul_temp <= (((resize(xout11_1 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 27) - resize(xout11_1 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 27)) - resize(xout11_1 & '0' & '0' & '0' & '0' & '0' & '0' & '0', 27)) - resize(xout11_1 & '0' & '0', 27)) - resize(xout11_1, 27);
  CSD_Gain_Factor_cast <= CSD_Gain_Factor_mul_temp(25 DOWNTO 0);
  xoutscaled <= CSD_Gain_Factor_cast(25 DOWNTO 13);

  zeroC <= to_signed(16#0000#, 13);

  
  outSwitchMag <= xoutscaled WHEN reset_1 = '0' ELSE
      zeroC;

  delayMatch23_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        outSwitchMag_1 <= outSwitchMag;
      END IF;
    END IF;
  END PROCESS delayMatch23_process;


  Out1 <= std_logic_vector(outSwitchMag_1);

  DelayValidOut_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        validOut <= ValidOutDelayed;
      END IF;
    END IF;
  END PROCESS DelayValidOut_process;


  Out2 <= validOut;

END rtl;

