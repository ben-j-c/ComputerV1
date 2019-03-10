-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 17.1 (Release Build #590)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2017 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from cordicFixedPoint_CORDIC_0
-- VHDL created on Sat Mar 09 20:45:01 2019


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity cordicFixedPoint_CORDIC_0 is
    port (
        a : in std_logic_vector(15 downto 0);  -- sfix16_en13
        c : out std_logic_vector(14 downto 0);  -- sfix15_en13
        s : out std_logic_vector(14 downto 0);  -- sfix15_en13
        clk : in std_logic;
        areset : in std_logic
    );
end cordicFixedPoint_CORDIC_0;

architecture normal of cordicFixedPoint_CORDIC_0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal constantZero_uid6_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal signA_uid7_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignA_uid8_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal absAE_uid9_sincosTest_a : STD_LOGIC_VECTOR (17 downto 0);
    signal absAE_uid9_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal absAE_uid9_sincosTest_o : STD_LOGIC_VECTOR (17 downto 0);
    signal absAE_uid9_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal absAE_uid9_sincosTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal absAR_uid10_sincosTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal absAR_uid10_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal cstPiO2_uid11_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal padACst_uid12_sincosTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal aPostPad_uid13_sincosTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal argMPiO2_uid14_sincosTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal argMPiO2_uid14_sincosTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal argMPiO2_uid14_sincosTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal argMPiO2_uid14_sincosTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal firstQuadrant_uid15_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal absARE_bottomRange_uid17_sincosTest_in : STD_LOGIC_VECTOR (13 downto 0);
    signal absARE_bottomRange_uid17_sincosTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal absARE_mergedSignalTM_uid18_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal argMPiO2_uid20_sincosTest_in : STD_LOGIC_VECTOR (18 downto 0);
    signal argMPiO2_uid20_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal absA_uid21_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal absA_uid21_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal cstOneOverK_uid22_sincosTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal cstArcTan2Mi_0_uid26_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal xip1E_1_uid32_sincosTest_q : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1E_1CostZeroPaddingA_uid33_sincosTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal yip1E_1NA_uid34_sincosTest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_1sumAHighB_uid35_sincosTest_a : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1E_1sumAHighB_uid35_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1E_1sumAHighB_uid35_sincosTest_o : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1E_1sumAHighB_uid35_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_1sumAHighB_uid35_sincosTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal invSignOfSelectionSignal_uid36_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_1NA_uid38_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_1sumAHighB_uid39_sincosTest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_1sumAHighB_uid39_sincosTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_1sumAHighB_uid39_sincosTest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_1sumAHighB_uid39_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_1sumAHighB_uid39_sincosTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal xip1_1_topRange_uid41_sincosTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal xip1_1_topRange_uid41_sincosTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal xip1_1_mergedSignalTM_uid42_sincosTest_q : STD_LOGIC_VECTOR (32 downto 0);
    signal xMSB_uid44_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1_1_mergedSignalTM_uid48_sincosTest_q : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid50_sincosTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_uid50_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xMSB_uid51_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid53_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid56_sincosTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal twoToMiSiYip_uid57_sincosTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal cstArcTan2Mi_1_uid58_sincosTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1E_2_uid60_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_2_uid60_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_2_uid60_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_2_uid60_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_2_uid60_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_2_uid61_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_2_uid61_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_2_uid61_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_2_uid61_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_2_uid61_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal aip1E_2_uid63_sincosTest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_2_uid63_sincosTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_2_uid63_sincosTest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_2_uid63_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_2_uid63_sincosTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal xip1_2_uid64_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_2_uid64_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_2_uid65_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_2_uid65_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid66_sincosTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_uid66_sincosTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal xMSB_uid67_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid69_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid72_sincosTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal twoToMiSiYip_uid73_sincosTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal cstArcTan2Mi_2_uid74_sincosTest_q : STD_LOGIC_VECTOR (21 downto 0);
    signal xip1E_3_uid76_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_3_uid76_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_3_uid76_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_3_uid76_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_3_uid76_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_3_uid77_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_3_uid77_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_3_uid77_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_3_uid77_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_3_uid77_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal aip1E_3_uid79_sincosTest_a : STD_LOGIC_VECTOR (25 downto 0);
    signal aip1E_3_uid79_sincosTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal aip1E_3_uid79_sincosTest_o : STD_LOGIC_VECTOR (25 downto 0);
    signal aip1E_3_uid79_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_3_uid79_sincosTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1_3_uid80_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_3_uid80_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_3_uid81_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_3_uid81_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid82_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_uid82_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal xMSB_uid83_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid85_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid88_sincosTest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal twoToMiSiYip_uid89_sincosTest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal cstArcTan2Mi_3_uid90_sincosTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1E_4_uid92_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_4_uid92_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_4_uid92_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_4_uid92_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_4_uid92_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_4_uid93_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_4_uid93_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_4_uid93_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_4_uid93_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_4_uid93_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal aip1E_4_uid95_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_4_uid95_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_4_uid95_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_4_uid95_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_4_uid95_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal xip1_4_uid96_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_4_uid96_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_4_uid97_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_4_uid97_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid98_sincosTest_in : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_uid98_sincosTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal xMSB_uid99_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid101_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid104_sincosTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal twoToMiSiYip_uid105_sincosTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal cstArcTan2Mi_4_uid106_sincosTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1E_5_uid108_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_5_uid108_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_5_uid108_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_5_uid108_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_5_uid108_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_5_uid109_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_5_uid109_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_5_uid109_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_5_uid109_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_5_uid109_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal aip1E_5_uid111_sincosTest_a : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_5_uid111_sincosTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_5_uid111_sincosTest_o : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_5_uid111_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_5_uid111_sincosTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_5_uid112_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_5_uid112_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_5_uid113_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_5_uid113_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid114_sincosTest_in : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_uid114_sincosTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal xMSB_uid115_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid117_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid120_sincosTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal twoToMiSiYip_uid121_sincosTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal cstArcTan2Mi_5_uid122_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal xip1E_6_uid124_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_6_uid124_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_6_uid124_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_6_uid124_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_6_uid124_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_6_uid125_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_6_uid125_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_6_uid125_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_6_uid125_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_6_uid125_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal aip1E_6_uid127_sincosTest_a : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_6_uid127_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_6_uid127_sincosTest_o : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_6_uid127_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_6_uid127_sincosTest_q : STD_LOGIC_VECTOR (21 downto 0);
    signal xip1_6_uid128_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_6_uid128_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_6_uid129_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_6_uid129_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid130_sincosTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid130_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid131_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid133_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid136_sincosTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal twoToMiSiYip_uid137_sincosTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal cstArcTan2Mi_6_uid138_sincosTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1E_7_uid140_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_7_uid140_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_7_uid140_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_7_uid140_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_7_uid140_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_7_uid141_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_7_uid141_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_7_uid141_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_7_uid141_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_7_uid141_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal aip1E_7_uid143_sincosTest_a : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_7_uid143_sincosTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_7_uid143_sincosTest_o : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_7_uid143_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_7_uid143_sincosTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_7_uid144_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_7_uid144_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_7_uid145_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_7_uid145_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid146_sincosTest_in : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_uid146_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal xMSB_uid147_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid149_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid152_sincosTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal twoToMiSiYip_uid153_sincosTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal cstArcTan2Mi_7_uid154_sincosTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal xip1E_8_uid156_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_8_uid156_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_8_uid156_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_8_uid156_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_8_uid156_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_8_uid157_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_8_uid157_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_8_uid157_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_8_uid157_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_8_uid157_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal aip1E_8_uid159_sincosTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_8_uid159_sincosTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_8_uid159_sincosTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_8_uid159_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_8_uid159_sincosTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1_8_uid160_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_8_uid160_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_8_uid161_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_8_uid161_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid162_sincosTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_uid162_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal xMSB_uid163_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid165_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid168_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal twoToMiSiYip_uid169_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal cstArcTan2Mi_8_uid170_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal xip1E_9_uid172_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_9_uid172_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_9_uid172_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_9_uid172_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_9_uid172_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_9_uid173_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_9_uid173_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_9_uid173_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_9_uid173_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_9_uid173_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lowRangeA_uid175_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid175_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid176_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_9high_uid177_sincosTest_a : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_9high_uid177_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_9high_uid177_sincosTest_o : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_9high_uid177_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_9high_uid177_sincosTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_9_uid178_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal xip1_9_uid179_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_9_uid179_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_9_uid180_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_9_uid180_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid181_sincosTest_in : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_uid181_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal xMSB_uid182_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid184_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid187_sincosTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal twoToMiSiYip_uid188_sincosTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal cstArcTan2Mi_9_uid189_sincosTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal xip1E_10_uid191_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_10_uid191_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_10_uid191_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_10_uid191_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_10_uid191_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_10_uid192_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_10_uid192_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_10_uid192_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_10_uid192_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_10_uid192_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lowRangeA_uid194_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid194_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid195_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_10high_uid196_sincosTest_a : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_10high_uid196_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_10high_uid196_sincosTest_o : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_10high_uid196_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_10high_uid196_sincosTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_10_uid197_sincosTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1_10_uid198_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_10_uid198_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_10_uid199_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_10_uid199_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid200_sincosTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_uid200_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal xMSB_uid201_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid203_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid206_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal twoToMiSiYip_uid207_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal cstArcTan2Mi_10_uid208_sincosTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal xip1E_11_uid210_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_11_uid210_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_11_uid210_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_11_uid210_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_11_uid210_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_11_uid211_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_11_uid211_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_11_uid211_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_11_uid211_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_11_uid211_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lowRangeA_uid213_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid213_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid214_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_11high_uid215_sincosTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_11high_uid215_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_11high_uid215_sincosTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_11high_uid215_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_11high_uid215_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_11_uid216_sincosTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal xip1_11_uid217_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_11_uid217_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_11_uid218_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_11_uid218_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid219_sincosTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_uid219_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal xMSB_uid220_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid222_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid225_sincosTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal twoToMiSiYip_uid226_sincosTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal cstArcTan2Mi_11_uid227_sincosTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal xip1E_12_uid229_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_12_uid229_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_12_uid229_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_12_uid229_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_12_uid229_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_12_uid230_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_12_uid230_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_12_uid230_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_12_uid230_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_12_uid230_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lowRangeA_uid232_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid232_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid233_sincosTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_12high_uid234_sincosTest_a : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_12high_uid234_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_12high_uid234_sincosTest_o : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_12high_uid234_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_12high_uid234_sincosTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_12_uid235_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal xip1_12_uid236_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_12_uid236_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_12_uid237_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_12_uid237_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid238_sincosTest_in : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_uid238_sincosTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal xMSB_uid239_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid241_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid244_sincosTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal twoToMiSiYip_uid245_sincosTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal cstArcTan2Mi_12_uid246_sincosTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal xip1E_13_uid248_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_13_uid248_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_13_uid248_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_13_uid248_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_13_uid248_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_13_uid249_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_13_uid249_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_13_uid249_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_13_uid249_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_13_uid249_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lowRangeA_uid251_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid251_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid252_sincosTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal aip1E_13high_uid253_sincosTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_13high_uid253_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_13high_uid253_sincosTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_13high_uid253_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_13high_uid253_sincosTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_13_uid254_sincosTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal xip1_13_uid255_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_13_uid255_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_13_uid256_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_13_uid256_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid257_sincosTest_in : STD_LOGIC_VECTOR (12 downto 0);
    signal aip1E_uid257_sincosTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal xMSB_uid258_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid260_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid263_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal twoToMiSiYip_uid264_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal cstArcTan2Mi_13_uid265_sincosTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal xip1E_14_uid267_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_14_uid267_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_14_uid267_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_14_uid267_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_14_uid267_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_14_uid268_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_14_uid268_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_14_uid268_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_14_uid268_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_14_uid268_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lowRangeA_uid270_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid270_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid271_sincosTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal aip1E_14high_uid272_sincosTest_a : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_14high_uid272_sincosTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_14high_uid272_sincosTest_o : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_14high_uid272_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_14high_uid272_sincosTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal aip1E_14_uid273_sincosTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal xip1_14_uid274_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_14_uid274_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_14_uid275_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_14_uid275_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid276_sincosTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal aip1E_uid276_sincosTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal xMSB_uid277_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid279_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid282_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal twoToMiSiYip_uid283_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal xip1E_15_uid286_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_15_uid286_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_15_uid286_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_15_uid286_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_15_uid286_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_15_uid287_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_15_uid287_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_15_uid287_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_15_uid287_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_15_uid287_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal xip1_15_uid293_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_15_uid293_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_15_uid294_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_15_uid294_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal xSumPreRnd_uid296_sincosTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal xSumPreRnd_uid296_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal xSumPostRnd_uid299_sincosTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal xSumPostRnd_uid299_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal xSumPostRnd_uid299_sincosTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal xSumPostRnd_uid299_sincosTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal ySumPreRnd_uid300_sincosTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal ySumPreRnd_uid300_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal ySumPostRnd_uid303_sincosTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal ySumPostRnd_uid303_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal ySumPostRnd_uid303_sincosTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal ySumPostRnd_uid303_sincosTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal xPostExc_uid304_sincosTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal xPostExc_uid304_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal yPostExc_uid305_sincosTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal yPostExc_uid305_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal invFirstQuadrant_uid306_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond2_uid307_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond1_uid308_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond0_uid310_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond_uid311_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstZeroForAddSub_uid313_sincosTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal invSinNegCond_uid314_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinPostNeg_uid315_sincosTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal sinPostNeg_uid315_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal sinPostNeg_uid315_sincosTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal sinPostNeg_uid315_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal sinPostNeg_uid315_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal invCosNegCond_uid316_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cosPostNeg_uid317_sincosTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal cosPostNeg_uid317_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal cosPostNeg_uid317_sincosTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal cosPostNeg_uid317_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal cosPostNeg_uid317_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal xPostRR_uid318_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xPostRR_uid318_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal xPostRR_uid319_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xPostRR_uid319_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal cos_uid320_sincosTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal cos_uid320_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal sin_uid321_sincosTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal sin_uid321_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal redist0_ySumPreRnd_uid300_sincosTest_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist1_xSumPreRnd_uid296_sincosTest_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist2_xMSB_uid277_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_xMSB_uid258_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_xMSB_uid239_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_xMSB_uid220_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_xMSB_uid201_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_yip1_10_uid199_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist8_xip1_10_uid198_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist9_aip1E_uid162_sincosTest_b_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist10_xMSB_uid147_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_xMSB_uid131_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_xMSB_uid115_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_yip1_5_uid113_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist14_xip1_5_uid112_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist15_aip1E_uid82_sincosTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist16_xMSB_uid67_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_xMSB_uid51_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_firstQuadrant_uid15_sincosTest_b_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_invSignA_uid8_sincosTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_signA_uid7_sincosTest_b_4_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- invFirstQuadrant_uid306_sincosTest(LOGICAL,305)@4
    invFirstQuadrant_uid306_sincosTest_q <= not (redist18_firstQuadrant_uid15_sincosTest_b_4_q);

    -- signA_uid7_sincosTest(BITSELECT,6)@0
    signA_uid7_sincosTest_b <= STD_LOGIC_VECTOR(a(15 downto 15));

    -- redist20_signA_uid7_sincosTest_b_4(DELAY,341)
    redist20_signA_uid7_sincosTest_b_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => signA_uid7_sincosTest_b, xout => redist20_signA_uid7_sincosTest_b_4_q, clk => clk, aclr => areset );

    -- sinNegCond2_uid307_sincosTest(LOGICAL,306)@4
    sinNegCond2_uid307_sincosTest_q <= redist20_signA_uid7_sincosTest_b_4_q and invFirstQuadrant_uid306_sincosTest_q;

    -- sinNegCond1_uid308_sincosTest(LOGICAL,307)@4
    sinNegCond1_uid308_sincosTest_q <= redist20_signA_uid7_sincosTest_b_4_q and redist18_firstQuadrant_uid15_sincosTest_b_4_q;

    -- invSignA_uid8_sincosTest(LOGICAL,7)@0
    invSignA_uid8_sincosTest_q <= not (signA_uid7_sincosTest_b);

    -- redist19_invSignA_uid8_sincosTest_q_4(DELAY,340)
    redist19_invSignA_uid8_sincosTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => invSignA_uid8_sincosTest_q, xout => redist19_invSignA_uid8_sincosTest_q_4_q, clk => clk, aclr => areset );

    -- sinNegCond0_uid310_sincosTest(LOGICAL,309)@4
    sinNegCond0_uid310_sincosTest_q <= redist19_invSignA_uid8_sincosTest_q_4_q and invFirstQuadrant_uid306_sincosTest_q;

    -- sinNegCond_uid311_sincosTest(LOGICAL,310)@4
    sinNegCond_uid311_sincosTest_q <= sinNegCond0_uid310_sincosTest_q or sinNegCond1_uid308_sincosTest_q or sinNegCond2_uid307_sincosTest_q;

    -- invSinNegCond_uid314_sincosTest(LOGICAL,313)@4
    invSinNegCond_uid314_sincosTest_q <= not (sinNegCond_uid311_sincosTest_q);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- xMSB_uid147_sincosTest(BITSELECT,146)@1
    xMSB_uid147_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid146_sincosTest_b(18 downto 18));

    -- cstArcTan2Mi_7_uid154_sincosTest(CONSTANT,153)
    cstArcTan2Mi_7_uid154_sincosTest_q <= "01111111111111111";

    -- xMSB_uid131_sincosTest(BITSELECT,130)@1
    xMSB_uid131_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid130_sincosTest_b(19 downto 19));

    -- cstArcTan2Mi_6_uid138_sincosTest(CONSTANT,137)
    cstArcTan2Mi_6_uid138_sincosTest_q <= "011111111111110101";

    -- xMSB_uid115_sincosTest(BITSELECT,114)@1
    xMSB_uid115_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid114_sincosTest_b(20 downto 20));

    -- cstArcTan2Mi_5_uid122_sincosTest(CONSTANT,121)
    cstArcTan2Mi_5_uid122_sincosTest_q <= "0111111111110101011";

    -- xMSB_uid99_sincosTest(BITSELECT,98)@1
    xMSB_uid99_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid98_sincosTest_b(21 downto 21));

    -- cstArcTan2Mi_4_uid106_sincosTest(CONSTANT,105)
    cstArcTan2Mi_4_uid106_sincosTest_q <= "01111111110101010111";

    -- xMSB_uid83_sincosTest(BITSELECT,82)@1
    xMSB_uid83_sincosTest_b <= STD_LOGIC_VECTOR(redist15_aip1E_uid82_sincosTest_b_1_q(22 downto 22));

    -- cstArcTan2Mi_3_uid90_sincosTest(CONSTANT,89)
    cstArcTan2Mi_3_uid90_sincosTest_q <= "011111110101011011101";

    -- xMSB_uid67_sincosTest(BITSELECT,66)@0
    xMSB_uid67_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid66_sincosTest_b(23 downto 23));

    -- cstArcTan2Mi_2_uid74_sincosTest(CONSTANT,73)
    cstArcTan2Mi_2_uid74_sincosTest_q <= "0111110101101101110110";

    -- xMSB_uid51_sincosTest(BITSELECT,50)@0
    xMSB_uid51_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid50_sincosTest_b(24 downto 24));

    -- cstArcTan2Mi_1_uid58_sincosTest(CONSTANT,57)
    cstArcTan2Mi_1_uid58_sincosTest_q <= "01110110101100011001110";

    -- invSignOfSelectionSignal_uid36_sincosTest(LOGICAL,35)@0
    invSignOfSelectionSignal_uid36_sincosTest_q <= not (VCC_q);

    -- cstArcTan2Mi_0_uid26_sincosTest(CONSTANT,25)
    cstArcTan2Mi_0_uid26_sincosTest_q <= "011001001000011111101101";

    -- constantZero_uid6_sincosTest(CONSTANT,5)
    constantZero_uid6_sincosTest_q <= "0000000000000000";

    -- absAE_uid9_sincosTest(ADDSUB,8)@0
    absAE_uid9_sincosTest_s <= invSignA_uid8_sincosTest_q;
    absAE_uid9_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => constantZero_uid6_sincosTest_q(15)) & constantZero_uid6_sincosTest_q));
    absAE_uid9_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => a(15)) & a));
    absAE_uid9_sincosTest_combproc: PROCESS (absAE_uid9_sincosTest_a, absAE_uid9_sincosTest_b, absAE_uid9_sincosTest_s)
    BEGIN
        IF (absAE_uid9_sincosTest_s = "1") THEN
            absAE_uid9_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(absAE_uid9_sincosTest_a) + SIGNED(absAE_uid9_sincosTest_b));
        ELSE
            absAE_uid9_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(absAE_uid9_sincosTest_a) - SIGNED(absAE_uid9_sincosTest_b));
        END IF;
    END PROCESS;
    absAE_uid9_sincosTest_q <= absAE_uid9_sincosTest_o(16 downto 0);

    -- absAR_uid10_sincosTest(BITSELECT,9)@0
    absAR_uid10_sincosTest_in <= absAE_uid9_sincosTest_q(14 downto 0);
    absAR_uid10_sincosTest_b <= absAR_uid10_sincosTest_in(14 downto 0);

    -- absARE_bottomRange_uid17_sincosTest(BITSELECT,16)@0
    absARE_bottomRange_uid17_sincosTest_in <= absAR_uid10_sincosTest_b(13 downto 0);
    absARE_bottomRange_uid17_sincosTest_b <= absARE_bottomRange_uid17_sincosTest_in(13 downto 0);

    -- absARE_mergedSignalTM_uid18_sincosTest(BITJOIN,17)@0
    absARE_mergedSignalTM_uid18_sincosTest_q <= absARE_bottomRange_uid17_sincosTest_b & padACst_uid12_sincosTest_q;

    -- cstPiO2_uid11_sincosTest(CONSTANT,10)
    cstPiO2_uid11_sincosTest_q <= "1100100100001111111";

    -- aPostPad_uid13_sincosTest(BITJOIN,12)@0
    aPostPad_uid13_sincosTest_q <= absAR_uid10_sincosTest_b & padACst_uid12_sincosTest_q;

    -- argMPiO2_uid14_sincosTest(SUB,13)@0
    argMPiO2_uid14_sincosTest_a <= STD_LOGIC_VECTOR("0" & aPostPad_uid13_sincosTest_q);
    argMPiO2_uid14_sincosTest_b <= STD_LOGIC_VECTOR("00" & cstPiO2_uid11_sincosTest_q);
    argMPiO2_uid14_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(argMPiO2_uid14_sincosTest_a) - UNSIGNED(argMPiO2_uid14_sincosTest_b));
    argMPiO2_uid14_sincosTest_q <= argMPiO2_uid14_sincosTest_o(20 downto 0);

    -- argMPiO2_uid20_sincosTest(BITSELECT,19)@0
    argMPiO2_uid20_sincosTest_in <= argMPiO2_uid14_sincosTest_q(18 downto 0);
    argMPiO2_uid20_sincosTest_b <= argMPiO2_uid20_sincosTest_in(18 downto 0);

    -- firstQuadrant_uid15_sincosTest(BITSELECT,14)@0
    firstQuadrant_uid15_sincosTest_b <= STD_LOGIC_VECTOR(argMPiO2_uid14_sincosTest_q(20 downto 20));

    -- absA_uid21_sincosTest(MUX,20)@0
    absA_uid21_sincosTest_s <= firstQuadrant_uid15_sincosTest_b;
    absA_uid21_sincosTest_combproc: PROCESS (absA_uid21_sincosTest_s, argMPiO2_uid20_sincosTest_b, absARE_mergedSignalTM_uid18_sincosTest_q)
    BEGIN
        CASE (absA_uid21_sincosTest_s) IS
            WHEN "0" => absA_uid21_sincosTest_q <= argMPiO2_uid20_sincosTest_b;
            WHEN "1" => absA_uid21_sincosTest_q <= absARE_mergedSignalTM_uid18_sincosTest_q;
            WHEN OTHERS => absA_uid21_sincosTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- padACst_uid12_sincosTest(CONSTANT,11)
    padACst_uid12_sincosTest_q <= "00000";

    -- aip1E_1NA_uid38_sincosTest(BITJOIN,37)@0
    aip1E_1NA_uid38_sincosTest_q <= absA_uid21_sincosTest_q & padACst_uid12_sincosTest_q;

    -- aip1E_1sumAHighB_uid39_sincosTest(ADDSUB,38)@0
    aip1E_1sumAHighB_uid39_sincosTest_s <= invSignOfSelectionSignal_uid36_sincosTest_q;
    aip1E_1sumAHighB_uid39_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & aip1E_1NA_uid38_sincosTest_q));
    aip1E_1sumAHighB_uid39_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 24 => cstArcTan2Mi_0_uid26_sincosTest_q(23)) & cstArcTan2Mi_0_uid26_sincosTest_q));
    aip1E_1sumAHighB_uid39_sincosTest_combproc: PROCESS (aip1E_1sumAHighB_uid39_sincosTest_a, aip1E_1sumAHighB_uid39_sincosTest_b, aip1E_1sumAHighB_uid39_sincosTest_s)
    BEGIN
        IF (aip1E_1sumAHighB_uid39_sincosTest_s = "1") THEN
            aip1E_1sumAHighB_uid39_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_1sumAHighB_uid39_sincosTest_a) + SIGNED(aip1E_1sumAHighB_uid39_sincosTest_b));
        ELSE
            aip1E_1sumAHighB_uid39_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_1sumAHighB_uid39_sincosTest_a) - SIGNED(aip1E_1sumAHighB_uid39_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_1sumAHighB_uid39_sincosTest_q <= aip1E_1sumAHighB_uid39_sincosTest_o(25 downto 0);

    -- aip1E_uid50_sincosTest(BITSELECT,49)@0
    aip1E_uid50_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_1sumAHighB_uid39_sincosTest_q(24 downto 0));
    aip1E_uid50_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid50_sincosTest_in(24 downto 0));

    -- aip1E_2_uid63_sincosTest(ADDSUB,62)@0
    aip1E_2_uid63_sincosTest_s <= xMSB_uid51_sincosTest_b;
    aip1E_2_uid63_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => aip1E_uid50_sincosTest_b(24)) & aip1E_uid50_sincosTest_b));
    aip1E_2_uid63_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 23 => cstArcTan2Mi_1_uid58_sincosTest_q(22)) & cstArcTan2Mi_1_uid58_sincosTest_q));
    aip1E_2_uid63_sincosTest_combproc: PROCESS (aip1E_2_uid63_sincosTest_a, aip1E_2_uid63_sincosTest_b, aip1E_2_uid63_sincosTest_s)
    BEGIN
        IF (aip1E_2_uid63_sincosTest_s = "1") THEN
            aip1E_2_uid63_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_2_uid63_sincosTest_a) + SIGNED(aip1E_2_uid63_sincosTest_b));
        ELSE
            aip1E_2_uid63_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_2_uid63_sincosTest_a) - SIGNED(aip1E_2_uid63_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_2_uid63_sincosTest_q <= aip1E_2_uid63_sincosTest_o(25 downto 0);

    -- aip1E_uid66_sincosTest(BITSELECT,65)@0
    aip1E_uid66_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_2_uid63_sincosTest_q(23 downto 0));
    aip1E_uid66_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid66_sincosTest_in(23 downto 0));

    -- aip1E_3_uid79_sincosTest(ADDSUB,78)@0
    aip1E_3_uid79_sincosTest_s <= xMSB_uid67_sincosTest_b;
    aip1E_3_uid79_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 24 => aip1E_uid66_sincosTest_b(23)) & aip1E_uid66_sincosTest_b));
    aip1E_3_uid79_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 22 => cstArcTan2Mi_2_uid74_sincosTest_q(21)) & cstArcTan2Mi_2_uid74_sincosTest_q));
    aip1E_3_uid79_sincosTest_combproc: PROCESS (aip1E_3_uid79_sincosTest_a, aip1E_3_uid79_sincosTest_b, aip1E_3_uid79_sincosTest_s)
    BEGIN
        IF (aip1E_3_uid79_sincosTest_s = "1") THEN
            aip1E_3_uid79_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_3_uid79_sincosTest_a) + SIGNED(aip1E_3_uid79_sincosTest_b));
        ELSE
            aip1E_3_uid79_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_3_uid79_sincosTest_a) - SIGNED(aip1E_3_uid79_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_3_uid79_sincosTest_q <= aip1E_3_uid79_sincosTest_o(24 downto 0);

    -- aip1E_uid82_sincosTest(BITSELECT,81)@0
    aip1E_uid82_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_3_uid79_sincosTest_q(22 downto 0));
    aip1E_uid82_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid82_sincosTest_in(22 downto 0));

    -- redist15_aip1E_uid82_sincosTest_b_1(DELAY,336)
    redist15_aip1E_uid82_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid82_sincosTest_b, xout => redist15_aip1E_uid82_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_4_uid95_sincosTest(ADDSUB,94)@1
    aip1E_4_uid95_sincosTest_s <= xMSB_uid83_sincosTest_b;
    aip1E_4_uid95_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => redist15_aip1E_uid82_sincosTest_b_1_q(22)) & redist15_aip1E_uid82_sincosTest_b_1_q));
    aip1E_4_uid95_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 21 => cstArcTan2Mi_3_uid90_sincosTest_q(20)) & cstArcTan2Mi_3_uid90_sincosTest_q));
    aip1E_4_uid95_sincosTest_combproc: PROCESS (aip1E_4_uid95_sincosTest_a, aip1E_4_uid95_sincosTest_b, aip1E_4_uid95_sincosTest_s)
    BEGIN
        IF (aip1E_4_uid95_sincosTest_s = "1") THEN
            aip1E_4_uid95_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_4_uid95_sincosTest_a) + SIGNED(aip1E_4_uid95_sincosTest_b));
        ELSE
            aip1E_4_uid95_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_4_uid95_sincosTest_a) - SIGNED(aip1E_4_uid95_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_4_uid95_sincosTest_q <= aip1E_4_uid95_sincosTest_o(23 downto 0);

    -- aip1E_uid98_sincosTest(BITSELECT,97)@1
    aip1E_uid98_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_4_uid95_sincosTest_q(21 downto 0));
    aip1E_uid98_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid98_sincosTest_in(21 downto 0));

    -- aip1E_5_uid111_sincosTest(ADDSUB,110)@1
    aip1E_5_uid111_sincosTest_s <= xMSB_uid99_sincosTest_b;
    aip1E_5_uid111_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 22 => aip1E_uid98_sincosTest_b(21)) & aip1E_uid98_sincosTest_b));
    aip1E_5_uid111_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 20 => cstArcTan2Mi_4_uid106_sincosTest_q(19)) & cstArcTan2Mi_4_uid106_sincosTest_q));
    aip1E_5_uid111_sincosTest_combproc: PROCESS (aip1E_5_uid111_sincosTest_a, aip1E_5_uid111_sincosTest_b, aip1E_5_uid111_sincosTest_s)
    BEGIN
        IF (aip1E_5_uid111_sincosTest_s = "1") THEN
            aip1E_5_uid111_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_5_uid111_sincosTest_a) + SIGNED(aip1E_5_uid111_sincosTest_b));
        ELSE
            aip1E_5_uid111_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_5_uid111_sincosTest_a) - SIGNED(aip1E_5_uid111_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_5_uid111_sincosTest_q <= aip1E_5_uid111_sincosTest_o(22 downto 0);

    -- aip1E_uid114_sincosTest(BITSELECT,113)@1
    aip1E_uid114_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_5_uid111_sincosTest_q(20 downto 0));
    aip1E_uid114_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid114_sincosTest_in(20 downto 0));

    -- aip1E_6_uid127_sincosTest(ADDSUB,126)@1
    aip1E_6_uid127_sincosTest_s <= xMSB_uid115_sincosTest_b;
    aip1E_6_uid127_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 21 => aip1E_uid114_sincosTest_b(20)) & aip1E_uid114_sincosTest_b));
    aip1E_6_uid127_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 19 => cstArcTan2Mi_5_uid122_sincosTest_q(18)) & cstArcTan2Mi_5_uid122_sincosTest_q));
    aip1E_6_uid127_sincosTest_combproc: PROCESS (aip1E_6_uid127_sincosTest_a, aip1E_6_uid127_sincosTest_b, aip1E_6_uid127_sincosTest_s)
    BEGIN
        IF (aip1E_6_uid127_sincosTest_s = "1") THEN
            aip1E_6_uid127_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_6_uid127_sincosTest_a) + SIGNED(aip1E_6_uid127_sincosTest_b));
        ELSE
            aip1E_6_uid127_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_6_uid127_sincosTest_a) - SIGNED(aip1E_6_uid127_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_6_uid127_sincosTest_q <= aip1E_6_uid127_sincosTest_o(21 downto 0);

    -- aip1E_uid130_sincosTest(BITSELECT,129)@1
    aip1E_uid130_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_6_uid127_sincosTest_q(19 downto 0));
    aip1E_uid130_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid130_sincosTest_in(19 downto 0));

    -- aip1E_7_uid143_sincosTest(ADDSUB,142)@1
    aip1E_7_uid143_sincosTest_s <= xMSB_uid131_sincosTest_b;
    aip1E_7_uid143_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => aip1E_uid130_sincosTest_b(19)) & aip1E_uid130_sincosTest_b));
    aip1E_7_uid143_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 18 => cstArcTan2Mi_6_uid138_sincosTest_q(17)) & cstArcTan2Mi_6_uid138_sincosTest_q));
    aip1E_7_uid143_sincosTest_combproc: PROCESS (aip1E_7_uid143_sincosTest_a, aip1E_7_uid143_sincosTest_b, aip1E_7_uid143_sincosTest_s)
    BEGIN
        IF (aip1E_7_uid143_sincosTest_s = "1") THEN
            aip1E_7_uid143_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_7_uid143_sincosTest_a) + SIGNED(aip1E_7_uid143_sincosTest_b));
        ELSE
            aip1E_7_uid143_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_7_uid143_sincosTest_a) - SIGNED(aip1E_7_uid143_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_7_uid143_sincosTest_q <= aip1E_7_uid143_sincosTest_o(20 downto 0);

    -- aip1E_uid146_sincosTest(BITSELECT,145)@1
    aip1E_uid146_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_7_uid143_sincosTest_q(18 downto 0));
    aip1E_uid146_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid146_sincosTest_in(18 downto 0));

    -- aip1E_8_uid159_sincosTest(ADDSUB,158)@1
    aip1E_8_uid159_sincosTest_s <= xMSB_uid147_sincosTest_b;
    aip1E_8_uid159_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => aip1E_uid146_sincosTest_b(18)) & aip1E_uid146_sincosTest_b));
    aip1E_8_uid159_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 17 => cstArcTan2Mi_7_uid154_sincosTest_q(16)) & cstArcTan2Mi_7_uid154_sincosTest_q));
    aip1E_8_uid159_sincosTest_combproc: PROCESS (aip1E_8_uid159_sincosTest_a, aip1E_8_uid159_sincosTest_b, aip1E_8_uid159_sincosTest_s)
    BEGIN
        IF (aip1E_8_uid159_sincosTest_s = "1") THEN
            aip1E_8_uid159_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_8_uid159_sincosTest_a) + SIGNED(aip1E_8_uid159_sincosTest_b));
        ELSE
            aip1E_8_uid159_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_8_uid159_sincosTest_a) - SIGNED(aip1E_8_uid159_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_8_uid159_sincosTest_q <= aip1E_8_uid159_sincosTest_o(19 downto 0);

    -- aip1E_uid162_sincosTest(BITSELECT,161)@1
    aip1E_uid162_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_8_uid159_sincosTest_q(17 downto 0));
    aip1E_uid162_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid162_sincosTest_in(17 downto 0));

    -- redist9_aip1E_uid162_sincosTest_b_1(DELAY,330)
    redist9_aip1E_uid162_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid162_sincosTest_b, xout => redist9_aip1E_uid162_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid163_sincosTest(BITSELECT,162)@2
    xMSB_uid163_sincosTest_b <= STD_LOGIC_VECTOR(redist9_aip1E_uid162_sincosTest_b_1_q(17 downto 17));

    -- cstArcTan2Mi_8_uid170_sincosTest(CONSTANT,169)
    cstArcTan2Mi_8_uid170_sincosTest_q <= "0100000000000000";

    -- highABits_uid176_sincosTest(BITSELECT,175)@2
    highABits_uid176_sincosTest_b <= STD_LOGIC_VECTOR(redist9_aip1E_uid162_sincosTest_b_1_q(17 downto 1));

    -- aip1E_9high_uid177_sincosTest(ADDSUB,176)@2
    aip1E_9high_uid177_sincosTest_s <= xMSB_uid163_sincosTest_b;
    aip1E_9high_uid177_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 17 => highABits_uid176_sincosTest_b(16)) & highABits_uid176_sincosTest_b));
    aip1E_9high_uid177_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => cstArcTan2Mi_8_uid170_sincosTest_q(15)) & cstArcTan2Mi_8_uid170_sincosTest_q));
    aip1E_9high_uid177_sincosTest_combproc: PROCESS (aip1E_9high_uid177_sincosTest_a, aip1E_9high_uid177_sincosTest_b, aip1E_9high_uid177_sincosTest_s)
    BEGIN
        IF (aip1E_9high_uid177_sincosTest_s = "1") THEN
            aip1E_9high_uid177_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_9high_uid177_sincosTest_a) + SIGNED(aip1E_9high_uid177_sincosTest_b));
        ELSE
            aip1E_9high_uid177_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_9high_uid177_sincosTest_a) - SIGNED(aip1E_9high_uid177_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_9high_uid177_sincosTest_q <= aip1E_9high_uid177_sincosTest_o(17 downto 0);

    -- lowRangeA_uid175_sincosTest(BITSELECT,174)@2
    lowRangeA_uid175_sincosTest_in <= redist9_aip1E_uid162_sincosTest_b_1_q(0 downto 0);
    lowRangeA_uid175_sincosTest_b <= lowRangeA_uid175_sincosTest_in(0 downto 0);

    -- aip1E_9_uid178_sincosTest(BITJOIN,177)@2
    aip1E_9_uid178_sincosTest_q <= aip1E_9high_uid177_sincosTest_q & lowRangeA_uid175_sincosTest_b;

    -- aip1E_uid181_sincosTest(BITSELECT,180)@2
    aip1E_uid181_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_9_uid178_sincosTest_q(16 downto 0));
    aip1E_uid181_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid181_sincosTest_in(16 downto 0));

    -- xMSB_uid182_sincosTest(BITSELECT,181)@2
    xMSB_uid182_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid181_sincosTest_b(16 downto 16));

    -- cstArcTan2Mi_9_uid189_sincosTest(CONSTANT,188)
    cstArcTan2Mi_9_uid189_sincosTest_q <= "010000000000000";

    -- highABits_uid195_sincosTest(BITSELECT,194)@2
    highABits_uid195_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid181_sincosTest_b(16 downto 1));

    -- aip1E_10high_uid196_sincosTest(ADDSUB,195)@2
    aip1E_10high_uid196_sincosTest_s <= xMSB_uid182_sincosTest_b;
    aip1E_10high_uid196_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => highABits_uid195_sincosTest_b(15)) & highABits_uid195_sincosTest_b));
    aip1E_10high_uid196_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 15 => cstArcTan2Mi_9_uid189_sincosTest_q(14)) & cstArcTan2Mi_9_uid189_sincosTest_q));
    aip1E_10high_uid196_sincosTest_combproc: PROCESS (aip1E_10high_uid196_sincosTest_a, aip1E_10high_uid196_sincosTest_b, aip1E_10high_uid196_sincosTest_s)
    BEGIN
        IF (aip1E_10high_uid196_sincosTest_s = "1") THEN
            aip1E_10high_uid196_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_10high_uid196_sincosTest_a) + SIGNED(aip1E_10high_uid196_sincosTest_b));
        ELSE
            aip1E_10high_uid196_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_10high_uid196_sincosTest_a) - SIGNED(aip1E_10high_uid196_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_10high_uid196_sincosTest_q <= aip1E_10high_uid196_sincosTest_o(16 downto 0);

    -- lowRangeA_uid194_sincosTest(BITSELECT,193)@2
    lowRangeA_uid194_sincosTest_in <= aip1E_uid181_sincosTest_b(0 downto 0);
    lowRangeA_uid194_sincosTest_b <= lowRangeA_uid194_sincosTest_in(0 downto 0);

    -- aip1E_10_uid197_sincosTest(BITJOIN,196)@2
    aip1E_10_uid197_sincosTest_q <= aip1E_10high_uid196_sincosTest_q & lowRangeA_uid194_sincosTest_b;

    -- aip1E_uid200_sincosTest(BITSELECT,199)@2
    aip1E_uid200_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_10_uid197_sincosTest_q(15 downto 0));
    aip1E_uid200_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid200_sincosTest_in(15 downto 0));

    -- xMSB_uid201_sincosTest(BITSELECT,200)@2
    xMSB_uid201_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid200_sincosTest_b(15 downto 15));

    -- cstArcTan2Mi_10_uid208_sincosTest(CONSTANT,207)
    cstArcTan2Mi_10_uid208_sincosTest_q <= "01000000000000";

    -- highABits_uid214_sincosTest(BITSELECT,213)@2
    highABits_uid214_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid200_sincosTest_b(15 downto 1));

    -- aip1E_11high_uid215_sincosTest(ADDSUB,214)@2
    aip1E_11high_uid215_sincosTest_s <= xMSB_uid201_sincosTest_b;
    aip1E_11high_uid215_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => highABits_uid214_sincosTest_b(14)) & highABits_uid214_sincosTest_b));
    aip1E_11high_uid215_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 14 => cstArcTan2Mi_10_uid208_sincosTest_q(13)) & cstArcTan2Mi_10_uid208_sincosTest_q));
    aip1E_11high_uid215_sincosTest_combproc: PROCESS (aip1E_11high_uid215_sincosTest_a, aip1E_11high_uid215_sincosTest_b, aip1E_11high_uid215_sincosTest_s)
    BEGIN
        IF (aip1E_11high_uid215_sincosTest_s = "1") THEN
            aip1E_11high_uid215_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_11high_uid215_sincosTest_a) + SIGNED(aip1E_11high_uid215_sincosTest_b));
        ELSE
            aip1E_11high_uid215_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_11high_uid215_sincosTest_a) - SIGNED(aip1E_11high_uid215_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_11high_uid215_sincosTest_q <= aip1E_11high_uid215_sincosTest_o(15 downto 0);

    -- lowRangeA_uid213_sincosTest(BITSELECT,212)@2
    lowRangeA_uid213_sincosTest_in <= aip1E_uid200_sincosTest_b(0 downto 0);
    lowRangeA_uid213_sincosTest_b <= lowRangeA_uid213_sincosTest_in(0 downto 0);

    -- aip1E_11_uid216_sincosTest(BITJOIN,215)@2
    aip1E_11_uid216_sincosTest_q <= aip1E_11high_uid215_sincosTest_q & lowRangeA_uid213_sincosTest_b;

    -- aip1E_uid219_sincosTest(BITSELECT,218)@2
    aip1E_uid219_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_11_uid216_sincosTest_q(14 downto 0));
    aip1E_uid219_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid219_sincosTest_in(14 downto 0));

    -- xMSB_uid220_sincosTest(BITSELECT,219)@2
    xMSB_uid220_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid219_sincosTest_b(14 downto 14));

    -- cstArcTan2Mi_11_uid227_sincosTest(CONSTANT,226)
    cstArcTan2Mi_11_uid227_sincosTest_q <= "0100000000000";

    -- highABits_uid233_sincosTest(BITSELECT,232)@2
    highABits_uid233_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid219_sincosTest_b(14 downto 1));

    -- aip1E_12high_uid234_sincosTest(ADDSUB,233)@2
    aip1E_12high_uid234_sincosTest_s <= xMSB_uid220_sincosTest_b;
    aip1E_12high_uid234_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => highABits_uid233_sincosTest_b(13)) & highABits_uid233_sincosTest_b));
    aip1E_12high_uid234_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 13 => cstArcTan2Mi_11_uid227_sincosTest_q(12)) & cstArcTan2Mi_11_uid227_sincosTest_q));
    aip1E_12high_uid234_sincosTest_combproc: PROCESS (aip1E_12high_uid234_sincosTest_a, aip1E_12high_uid234_sincosTest_b, aip1E_12high_uid234_sincosTest_s)
    BEGIN
        IF (aip1E_12high_uid234_sincosTest_s = "1") THEN
            aip1E_12high_uid234_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_12high_uid234_sincosTest_a) + SIGNED(aip1E_12high_uid234_sincosTest_b));
        ELSE
            aip1E_12high_uid234_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_12high_uid234_sincosTest_a) - SIGNED(aip1E_12high_uid234_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_12high_uid234_sincosTest_q <= aip1E_12high_uid234_sincosTest_o(14 downto 0);

    -- lowRangeA_uid232_sincosTest(BITSELECT,231)@2
    lowRangeA_uid232_sincosTest_in <= aip1E_uid219_sincosTest_b(0 downto 0);
    lowRangeA_uid232_sincosTest_b <= lowRangeA_uid232_sincosTest_in(0 downto 0);

    -- aip1E_12_uid235_sincosTest(BITJOIN,234)@2
    aip1E_12_uid235_sincosTest_q <= aip1E_12high_uid234_sincosTest_q & lowRangeA_uid232_sincosTest_b;

    -- aip1E_uid238_sincosTest(BITSELECT,237)@2
    aip1E_uid238_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_12_uid235_sincosTest_q(13 downto 0));
    aip1E_uid238_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid238_sincosTest_in(13 downto 0));

    -- xMSB_uid239_sincosTest(BITSELECT,238)@2
    xMSB_uid239_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid238_sincosTest_b(13 downto 13));

    -- cstArcTan2Mi_12_uid246_sincosTest(CONSTANT,245)
    cstArcTan2Mi_12_uid246_sincosTest_q <= "010000000000";

    -- highABits_uid252_sincosTest(BITSELECT,251)@2
    highABits_uid252_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid238_sincosTest_b(13 downto 1));

    -- aip1E_13high_uid253_sincosTest(ADDSUB,252)@2
    aip1E_13high_uid253_sincosTest_s <= xMSB_uid239_sincosTest_b;
    aip1E_13high_uid253_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => highABits_uid252_sincosTest_b(12)) & highABits_uid252_sincosTest_b));
    aip1E_13high_uid253_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => cstArcTan2Mi_12_uid246_sincosTest_q(11)) & cstArcTan2Mi_12_uid246_sincosTest_q));
    aip1E_13high_uid253_sincosTest_combproc: PROCESS (aip1E_13high_uid253_sincosTest_a, aip1E_13high_uid253_sincosTest_b, aip1E_13high_uid253_sincosTest_s)
    BEGIN
        IF (aip1E_13high_uid253_sincosTest_s = "1") THEN
            aip1E_13high_uid253_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_13high_uid253_sincosTest_a) + SIGNED(aip1E_13high_uid253_sincosTest_b));
        ELSE
            aip1E_13high_uid253_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_13high_uid253_sincosTest_a) - SIGNED(aip1E_13high_uid253_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_13high_uid253_sincosTest_q <= aip1E_13high_uid253_sincosTest_o(13 downto 0);

    -- lowRangeA_uid251_sincosTest(BITSELECT,250)@2
    lowRangeA_uid251_sincosTest_in <= aip1E_uid238_sincosTest_b(0 downto 0);
    lowRangeA_uid251_sincosTest_b <= lowRangeA_uid251_sincosTest_in(0 downto 0);

    -- aip1E_13_uid254_sincosTest(BITJOIN,253)@2
    aip1E_13_uid254_sincosTest_q <= aip1E_13high_uid253_sincosTest_q & lowRangeA_uid251_sincosTest_b;

    -- aip1E_uid257_sincosTest(BITSELECT,256)@2
    aip1E_uid257_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_13_uid254_sincosTest_q(12 downto 0));
    aip1E_uid257_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid257_sincosTest_in(12 downto 0));

    -- xMSB_uid258_sincosTest(BITSELECT,257)@2
    xMSB_uid258_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid257_sincosTest_b(12 downto 12));

    -- cstArcTan2Mi_13_uid265_sincosTest(CONSTANT,264)
    cstArcTan2Mi_13_uid265_sincosTest_q <= "01000000000";

    -- highABits_uid271_sincosTest(BITSELECT,270)@2
    highABits_uid271_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid257_sincosTest_b(12 downto 1));

    -- aip1E_14high_uid272_sincosTest(ADDSUB,271)@2
    aip1E_14high_uid272_sincosTest_s <= xMSB_uid258_sincosTest_b;
    aip1E_14high_uid272_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => highABits_uid271_sincosTest_b(11)) & highABits_uid271_sincosTest_b));
    aip1E_14high_uid272_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 11 => cstArcTan2Mi_13_uid265_sincosTest_q(10)) & cstArcTan2Mi_13_uid265_sincosTest_q));
    aip1E_14high_uid272_sincosTest_combproc: PROCESS (aip1E_14high_uid272_sincosTest_a, aip1E_14high_uid272_sincosTest_b, aip1E_14high_uid272_sincosTest_s)
    BEGIN
        IF (aip1E_14high_uid272_sincosTest_s = "1") THEN
            aip1E_14high_uid272_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_14high_uid272_sincosTest_a) + SIGNED(aip1E_14high_uid272_sincosTest_b));
        ELSE
            aip1E_14high_uid272_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_14high_uid272_sincosTest_a) - SIGNED(aip1E_14high_uid272_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_14high_uid272_sincosTest_q <= aip1E_14high_uid272_sincosTest_o(12 downto 0);

    -- lowRangeA_uid270_sincosTest(BITSELECT,269)@2
    lowRangeA_uid270_sincosTest_in <= aip1E_uid257_sincosTest_b(0 downto 0);
    lowRangeA_uid270_sincosTest_b <= lowRangeA_uid270_sincosTest_in(0 downto 0);

    -- aip1E_14_uid273_sincosTest(BITJOIN,272)@2
    aip1E_14_uid273_sincosTest_q <= aip1E_14high_uid272_sincosTest_q & lowRangeA_uid270_sincosTest_b;

    -- aip1E_uid276_sincosTest(BITSELECT,275)@2
    aip1E_uid276_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_14_uid273_sincosTest_q(11 downto 0));
    aip1E_uid276_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid276_sincosTest_in(11 downto 0));

    -- xMSB_uid277_sincosTest(BITSELECT,276)@2
    xMSB_uid277_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid276_sincosTest_b(11 downto 11));

    -- redist2_xMSB_uid277_sincosTest_b_1(DELAY,323)
    redist2_xMSB_uid277_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid277_sincosTest_b, xout => redist2_xMSB_uid277_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid279_sincosTest(LOGICAL,278)@3
    signOfSelectionSignal_uid279_sincosTest_q <= not (redist2_xMSB_uid277_sincosTest_b_1_q);

    -- redist3_xMSB_uid258_sincosTest_b_1(DELAY,324)
    redist3_xMSB_uid258_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid258_sincosTest_b, xout => redist3_xMSB_uid258_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- redist4_xMSB_uid239_sincosTest_b_1(DELAY,325)
    redist4_xMSB_uid239_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid239_sincosTest_b, xout => redist4_xMSB_uid239_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid241_sincosTest(LOGICAL,240)@3
    signOfSelectionSignal_uid241_sincosTest_q <= not (redist4_xMSB_uid239_sincosTest_b_1_q);

    -- redist5_xMSB_uid220_sincosTest_b_1(DELAY,326)
    redist5_xMSB_uid220_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid220_sincosTest_b, xout => redist5_xMSB_uid220_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- redist6_xMSB_uid201_sincosTest_b_1(DELAY,327)
    redist6_xMSB_uid201_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid201_sincosTest_b, xout => redist6_xMSB_uid201_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid203_sincosTest(LOGICAL,202)@3
    signOfSelectionSignal_uid203_sincosTest_q <= not (redist6_xMSB_uid201_sincosTest_b_1_q);

    -- signOfSelectionSignal_uid165_sincosTest(LOGICAL,164)@2
    signOfSelectionSignal_uid165_sincosTest_q <= not (xMSB_uid163_sincosTest_b);

    -- redist10_xMSB_uid147_sincosTest_b_1(DELAY,331)
    redist10_xMSB_uid147_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid147_sincosTest_b, xout => redist10_xMSB_uid147_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- redist11_xMSB_uid131_sincosTest_b_1(DELAY,332)
    redist11_xMSB_uid131_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid131_sincosTest_b, xout => redist11_xMSB_uid131_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid133_sincosTest(LOGICAL,132)@2
    signOfSelectionSignal_uid133_sincosTest_q <= not (redist11_xMSB_uid131_sincosTest_b_1_q);

    -- redist12_xMSB_uid115_sincosTest_b_1(DELAY,333)
    redist12_xMSB_uid115_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid115_sincosTest_b, xout => redist12_xMSB_uid115_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid101_sincosTest(LOGICAL,100)@1
    signOfSelectionSignal_uid101_sincosTest_q <= not (xMSB_uid99_sincosTest_b);

    -- redist16_xMSB_uid67_sincosTest_b_1(DELAY,337)
    redist16_xMSB_uid67_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid67_sincosTest_b, xout => redist16_xMSB_uid67_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid69_sincosTest(LOGICAL,68)@1
    signOfSelectionSignal_uid69_sincosTest_q <= not (redist16_xMSB_uid67_sincosTest_b_1_q);

    -- redist17_xMSB_uid51_sincosTest_b_1(DELAY,338)
    redist17_xMSB_uid51_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid51_sincosTest_b, xout => redist17_xMSB_uid51_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid44_sincosTest(BITSELECT,43)@1
    xMSB_uid44_sincosTest_b <= STD_LOGIC_VECTOR(yip1E_1sumAHighB_uid35_sincosTest_q(31 downto 31));

    -- cstOneOverK_uid22_sincosTest(CONSTANT,21)
    cstOneOverK_uid22_sincosTest_q <= "100110110111010011101101101010";

    -- yip1E_1CostZeroPaddingA_uid33_sincosTest(CONSTANT,32)
    yip1E_1CostZeroPaddingA_uid33_sincosTest_q <= "000000000000000000000000000000";

    -- yip1E_1NA_uid34_sincosTest(BITJOIN,33)@1
    yip1E_1NA_uid34_sincosTest_q <= GND_q & yip1E_1CostZeroPaddingA_uid33_sincosTest_q;

    -- yip1E_1sumAHighB_uid35_sincosTest(ADDSUB,34)@1
    yip1E_1sumAHighB_uid35_sincosTest_s <= VCC_q;
    yip1E_1sumAHighB_uid35_sincosTest_a <= STD_LOGIC_VECTOR("00" & yip1E_1NA_uid34_sincosTest_q);
    yip1E_1sumAHighB_uid35_sincosTest_b <= STD_LOGIC_VECTOR("000" & cstOneOverK_uid22_sincosTest_q);
    yip1E_1sumAHighB_uid35_sincosTest_combproc: PROCESS (yip1E_1sumAHighB_uid35_sincosTest_a, yip1E_1sumAHighB_uid35_sincosTest_b, yip1E_1sumAHighB_uid35_sincosTest_s)
    BEGIN
        IF (yip1E_1sumAHighB_uid35_sincosTest_s = "1") THEN
            yip1E_1sumAHighB_uid35_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(yip1E_1sumAHighB_uid35_sincosTest_a) + UNSIGNED(yip1E_1sumAHighB_uid35_sincosTest_b));
        ELSE
            yip1E_1sumAHighB_uid35_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(yip1E_1sumAHighB_uid35_sincosTest_a) - UNSIGNED(yip1E_1sumAHighB_uid35_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_1sumAHighB_uid35_sincosTest_q <= yip1E_1sumAHighB_uid35_sincosTest_o(31 downto 0);

    -- yip1_1_mergedSignalTM_uid48_sincosTest(BITJOIN,47)@1
    yip1_1_mergedSignalTM_uid48_sincosTest_q <= xMSB_uid44_sincosTest_b & yip1E_1sumAHighB_uid35_sincosTest_q;

    -- twoToMiSiYip_uid57_sincosTest(BITSELECT,56)@1
    twoToMiSiYip_uid57_sincosTest_b <= STD_LOGIC_VECTOR(yip1_1_mergedSignalTM_uid48_sincosTest_q(32 downto 1));

    -- xip1E_1_uid32_sincosTest(BITJOIN,31)@1
    xip1E_1_uid32_sincosTest_q <= STD_LOGIC_VECTOR((2 downto 1 => GND_q(0)) & GND_q) & cstOneOverK_uid22_sincosTest_q;

    -- xip1_1_topRange_uid41_sincosTest(BITSELECT,40)@1
    xip1_1_topRange_uid41_sincosTest_in <= xip1E_1_uid32_sincosTest_q(31 downto 0);
    xip1_1_topRange_uid41_sincosTest_b <= xip1_1_topRange_uid41_sincosTest_in(31 downto 0);

    -- xip1_1_mergedSignalTM_uid42_sincosTest(BITJOIN,41)@1
    xip1_1_mergedSignalTM_uid42_sincosTest_q <= GND_q & xip1_1_topRange_uid41_sincosTest_b;

    -- xip1E_2_uid60_sincosTest(ADDSUB,59)@1
    xip1E_2_uid60_sincosTest_s <= redist17_xMSB_uid51_sincosTest_b_1_q;
    xip1E_2_uid60_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => xip1_1_mergedSignalTM_uid42_sincosTest_q(32)) & xip1_1_mergedSignalTM_uid42_sincosTest_q));
    xip1E_2_uid60_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 32 => twoToMiSiYip_uid57_sincosTest_b(31)) & twoToMiSiYip_uid57_sincosTest_b));
    xip1E_2_uid60_sincosTest_combproc: PROCESS (xip1E_2_uid60_sincosTest_a, xip1E_2_uid60_sincosTest_b, xip1E_2_uid60_sincosTest_s)
    BEGIN
        IF (xip1E_2_uid60_sincosTest_s = "1") THEN
            xip1E_2_uid60_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2_uid60_sincosTest_a) + SIGNED(xip1E_2_uid60_sincosTest_b));
        ELSE
            xip1E_2_uid60_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2_uid60_sincosTest_a) - SIGNED(xip1E_2_uid60_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_2_uid60_sincosTest_q <= xip1E_2_uid60_sincosTest_o(33 downto 0);

    -- xip1_2_uid64_sincosTest(BITSELECT,63)@1
    xip1_2_uid64_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_2_uid60_sincosTest_q(32 downto 0));
    xip1_2_uid64_sincosTest_b <= STD_LOGIC_VECTOR(xip1_2_uid64_sincosTest_in(32 downto 0));

    -- twoToMiSiXip_uid72_sincosTest(BITSELECT,71)@1
    twoToMiSiXip_uid72_sincosTest_b <= STD_LOGIC_VECTOR(xip1_2_uid64_sincosTest_b(32 downto 2));

    -- signOfSelectionSignal_uid53_sincosTest(LOGICAL,52)@1
    signOfSelectionSignal_uid53_sincosTest_q <= not (redist17_xMSB_uid51_sincosTest_b_1_q);

    -- twoToMiSiXip_uid56_sincosTest(BITSELECT,55)@1
    twoToMiSiXip_uid56_sincosTest_b <= STD_LOGIC_VECTOR(xip1_1_mergedSignalTM_uid42_sincosTest_q(32 downto 1));

    -- yip1E_2_uid61_sincosTest(ADDSUB,60)@1
    yip1E_2_uid61_sincosTest_s <= signOfSelectionSignal_uid53_sincosTest_q;
    yip1E_2_uid61_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => yip1_1_mergedSignalTM_uid48_sincosTest_q(32)) & yip1_1_mergedSignalTM_uid48_sincosTest_q));
    yip1E_2_uid61_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 32 => twoToMiSiXip_uid56_sincosTest_b(31)) & twoToMiSiXip_uid56_sincosTest_b));
    yip1E_2_uid61_sincosTest_combproc: PROCESS (yip1E_2_uid61_sincosTest_a, yip1E_2_uid61_sincosTest_b, yip1E_2_uid61_sincosTest_s)
    BEGIN
        IF (yip1E_2_uid61_sincosTest_s = "1") THEN
            yip1E_2_uid61_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2_uid61_sincosTest_a) + SIGNED(yip1E_2_uid61_sincosTest_b));
        ELSE
            yip1E_2_uid61_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2_uid61_sincosTest_a) - SIGNED(yip1E_2_uid61_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_2_uid61_sincosTest_q <= yip1E_2_uid61_sincosTest_o(33 downto 0);

    -- yip1_2_uid65_sincosTest(BITSELECT,64)@1
    yip1_2_uid65_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_2_uid61_sincosTest_q(32 downto 0));
    yip1_2_uid65_sincosTest_b <= STD_LOGIC_VECTOR(yip1_2_uid65_sincosTest_in(32 downto 0));

    -- yip1E_3_uid77_sincosTest(ADDSUB,76)@1
    yip1E_3_uid77_sincosTest_s <= signOfSelectionSignal_uid69_sincosTest_q;
    yip1E_3_uid77_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => yip1_2_uid65_sincosTest_b(32)) & yip1_2_uid65_sincosTest_b));
    yip1E_3_uid77_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 31 => twoToMiSiXip_uid72_sincosTest_b(30)) & twoToMiSiXip_uid72_sincosTest_b));
    yip1E_3_uid77_sincosTest_combproc: PROCESS (yip1E_3_uid77_sincosTest_a, yip1E_3_uid77_sincosTest_b, yip1E_3_uid77_sincosTest_s)
    BEGIN
        IF (yip1E_3_uid77_sincosTest_s = "1") THEN
            yip1E_3_uid77_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3_uid77_sincosTest_a) + SIGNED(yip1E_3_uid77_sincosTest_b));
        ELSE
            yip1E_3_uid77_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3_uid77_sincosTest_a) - SIGNED(yip1E_3_uid77_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_3_uid77_sincosTest_q <= yip1E_3_uid77_sincosTest_o(33 downto 0);

    -- yip1_3_uid81_sincosTest(BITSELECT,80)@1
    yip1_3_uid81_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_3_uid77_sincosTest_q(32 downto 0));
    yip1_3_uid81_sincosTest_b <= STD_LOGIC_VECTOR(yip1_3_uid81_sincosTest_in(32 downto 0));

    -- twoToMiSiYip_uid89_sincosTest(BITSELECT,88)@1
    twoToMiSiYip_uid89_sincosTest_b <= STD_LOGIC_VECTOR(yip1_3_uid81_sincosTest_b(32 downto 3));

    -- twoToMiSiYip_uid73_sincosTest(BITSELECT,72)@1
    twoToMiSiYip_uid73_sincosTest_b <= STD_LOGIC_VECTOR(yip1_2_uid65_sincosTest_b(32 downto 2));

    -- xip1E_3_uid76_sincosTest(ADDSUB,75)@1
    xip1E_3_uid76_sincosTest_s <= redist16_xMSB_uid67_sincosTest_b_1_q;
    xip1E_3_uid76_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => xip1_2_uid64_sincosTest_b(32)) & xip1_2_uid64_sincosTest_b));
    xip1E_3_uid76_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 31 => twoToMiSiYip_uid73_sincosTest_b(30)) & twoToMiSiYip_uid73_sincosTest_b));
    xip1E_3_uid76_sincosTest_combproc: PROCESS (xip1E_3_uid76_sincosTest_a, xip1E_3_uid76_sincosTest_b, xip1E_3_uid76_sincosTest_s)
    BEGIN
        IF (xip1E_3_uid76_sincosTest_s = "1") THEN
            xip1E_3_uid76_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3_uid76_sincosTest_a) + SIGNED(xip1E_3_uid76_sincosTest_b));
        ELSE
            xip1E_3_uid76_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3_uid76_sincosTest_a) - SIGNED(xip1E_3_uid76_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_3_uid76_sincosTest_q <= xip1E_3_uid76_sincosTest_o(33 downto 0);

    -- xip1_3_uid80_sincosTest(BITSELECT,79)@1
    xip1_3_uid80_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_3_uid76_sincosTest_q(32 downto 0));
    xip1_3_uid80_sincosTest_b <= STD_LOGIC_VECTOR(xip1_3_uid80_sincosTest_in(32 downto 0));

    -- xip1E_4_uid92_sincosTest(ADDSUB,91)@1
    xip1E_4_uid92_sincosTest_s <= xMSB_uid83_sincosTest_b;
    xip1E_4_uid92_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => xip1_3_uid80_sincosTest_b(32)) & xip1_3_uid80_sincosTest_b));
    xip1E_4_uid92_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 30 => twoToMiSiYip_uid89_sincosTest_b(29)) & twoToMiSiYip_uid89_sincosTest_b));
    xip1E_4_uid92_sincosTest_combproc: PROCESS (xip1E_4_uid92_sincosTest_a, xip1E_4_uid92_sincosTest_b, xip1E_4_uid92_sincosTest_s)
    BEGIN
        IF (xip1E_4_uid92_sincosTest_s = "1") THEN
            xip1E_4_uid92_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4_uid92_sincosTest_a) + SIGNED(xip1E_4_uid92_sincosTest_b));
        ELSE
            xip1E_4_uid92_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4_uid92_sincosTest_a) - SIGNED(xip1E_4_uid92_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_4_uid92_sincosTest_q <= xip1E_4_uid92_sincosTest_o(33 downto 0);

    -- xip1_4_uid96_sincosTest(BITSELECT,95)@1
    xip1_4_uid96_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_4_uid92_sincosTest_q(32 downto 0));
    xip1_4_uid96_sincosTest_b <= STD_LOGIC_VECTOR(xip1_4_uid96_sincosTest_in(32 downto 0));

    -- twoToMiSiXip_uid104_sincosTest(BITSELECT,103)@1
    twoToMiSiXip_uid104_sincosTest_b <= STD_LOGIC_VECTOR(xip1_4_uid96_sincosTest_b(32 downto 4));

    -- signOfSelectionSignal_uid85_sincosTest(LOGICAL,84)@1
    signOfSelectionSignal_uid85_sincosTest_q <= not (xMSB_uid83_sincosTest_b);

    -- twoToMiSiXip_uid88_sincosTest(BITSELECT,87)@1
    twoToMiSiXip_uid88_sincosTest_b <= STD_LOGIC_VECTOR(xip1_3_uid80_sincosTest_b(32 downto 3));

    -- yip1E_4_uid93_sincosTest(ADDSUB,92)@1
    yip1E_4_uid93_sincosTest_s <= signOfSelectionSignal_uid85_sincosTest_q;
    yip1E_4_uid93_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => yip1_3_uid81_sincosTest_b(32)) & yip1_3_uid81_sincosTest_b));
    yip1E_4_uid93_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 30 => twoToMiSiXip_uid88_sincosTest_b(29)) & twoToMiSiXip_uid88_sincosTest_b));
    yip1E_4_uid93_sincosTest_combproc: PROCESS (yip1E_4_uid93_sincosTest_a, yip1E_4_uid93_sincosTest_b, yip1E_4_uid93_sincosTest_s)
    BEGIN
        IF (yip1E_4_uid93_sincosTest_s = "1") THEN
            yip1E_4_uid93_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4_uid93_sincosTest_a) + SIGNED(yip1E_4_uid93_sincosTest_b));
        ELSE
            yip1E_4_uid93_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4_uid93_sincosTest_a) - SIGNED(yip1E_4_uid93_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_4_uid93_sincosTest_q <= yip1E_4_uid93_sincosTest_o(33 downto 0);

    -- yip1_4_uid97_sincosTest(BITSELECT,96)@1
    yip1_4_uid97_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_4_uid93_sincosTest_q(32 downto 0));
    yip1_4_uid97_sincosTest_b <= STD_LOGIC_VECTOR(yip1_4_uid97_sincosTest_in(32 downto 0));

    -- yip1E_5_uid109_sincosTest(ADDSUB,108)@1
    yip1E_5_uid109_sincosTest_s <= signOfSelectionSignal_uid101_sincosTest_q;
    yip1E_5_uid109_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => yip1_4_uid97_sincosTest_b(32)) & yip1_4_uid97_sincosTest_b));
    yip1E_5_uid109_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 29 => twoToMiSiXip_uid104_sincosTest_b(28)) & twoToMiSiXip_uid104_sincosTest_b));
    yip1E_5_uid109_sincosTest_combproc: PROCESS (yip1E_5_uid109_sincosTest_a, yip1E_5_uid109_sincosTest_b, yip1E_5_uid109_sincosTest_s)
    BEGIN
        IF (yip1E_5_uid109_sincosTest_s = "1") THEN
            yip1E_5_uid109_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5_uid109_sincosTest_a) + SIGNED(yip1E_5_uid109_sincosTest_b));
        ELSE
            yip1E_5_uid109_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5_uid109_sincosTest_a) - SIGNED(yip1E_5_uid109_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_5_uid109_sincosTest_q <= yip1E_5_uid109_sincosTest_o(33 downto 0);

    -- yip1_5_uid113_sincosTest(BITSELECT,112)@1
    yip1_5_uid113_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_5_uid109_sincosTest_q(32 downto 0));
    yip1_5_uid113_sincosTest_b <= STD_LOGIC_VECTOR(yip1_5_uid113_sincosTest_in(32 downto 0));

    -- redist13_yip1_5_uid113_sincosTest_b_1(DELAY,334)
    redist13_yip1_5_uid113_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_5_uid113_sincosTest_b, xout => redist13_yip1_5_uid113_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid121_sincosTest(BITSELECT,120)@2
    twoToMiSiYip_uid121_sincosTest_b <= STD_LOGIC_VECTOR(redist13_yip1_5_uid113_sincosTest_b_1_q(32 downto 5));

    -- twoToMiSiYip_uid105_sincosTest(BITSELECT,104)@1
    twoToMiSiYip_uid105_sincosTest_b <= STD_LOGIC_VECTOR(yip1_4_uid97_sincosTest_b(32 downto 4));

    -- xip1E_5_uid108_sincosTest(ADDSUB,107)@1
    xip1E_5_uid108_sincosTest_s <= xMSB_uid99_sincosTest_b;
    xip1E_5_uid108_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => xip1_4_uid96_sincosTest_b(32)) & xip1_4_uid96_sincosTest_b));
    xip1E_5_uid108_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 29 => twoToMiSiYip_uid105_sincosTest_b(28)) & twoToMiSiYip_uid105_sincosTest_b));
    xip1E_5_uid108_sincosTest_combproc: PROCESS (xip1E_5_uid108_sincosTest_a, xip1E_5_uid108_sincosTest_b, xip1E_5_uid108_sincosTest_s)
    BEGIN
        IF (xip1E_5_uid108_sincosTest_s = "1") THEN
            xip1E_5_uid108_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5_uid108_sincosTest_a) + SIGNED(xip1E_5_uid108_sincosTest_b));
        ELSE
            xip1E_5_uid108_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5_uid108_sincosTest_a) - SIGNED(xip1E_5_uid108_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_5_uid108_sincosTest_q <= xip1E_5_uid108_sincosTest_o(33 downto 0);

    -- xip1_5_uid112_sincosTest(BITSELECT,111)@1
    xip1_5_uid112_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_5_uid108_sincosTest_q(32 downto 0));
    xip1_5_uid112_sincosTest_b <= STD_LOGIC_VECTOR(xip1_5_uid112_sincosTest_in(32 downto 0));

    -- redist14_xip1_5_uid112_sincosTest_b_1(DELAY,335)
    redist14_xip1_5_uid112_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_5_uid112_sincosTest_b, xout => redist14_xip1_5_uid112_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_6_uid124_sincosTest(ADDSUB,123)@2
    xip1E_6_uid124_sincosTest_s <= redist12_xMSB_uid115_sincosTest_b_1_q;
    xip1E_6_uid124_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist14_xip1_5_uid112_sincosTest_b_1_q(32)) & redist14_xip1_5_uid112_sincosTest_b_1_q));
    xip1E_6_uid124_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 28 => twoToMiSiYip_uid121_sincosTest_b(27)) & twoToMiSiYip_uid121_sincosTest_b));
    xip1E_6_uid124_sincosTest_combproc: PROCESS (xip1E_6_uid124_sincosTest_a, xip1E_6_uid124_sincosTest_b, xip1E_6_uid124_sincosTest_s)
    BEGIN
        IF (xip1E_6_uid124_sincosTest_s = "1") THEN
            xip1E_6_uid124_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6_uid124_sincosTest_a) + SIGNED(xip1E_6_uid124_sincosTest_b));
        ELSE
            xip1E_6_uid124_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6_uid124_sincosTest_a) - SIGNED(xip1E_6_uid124_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_6_uid124_sincosTest_q <= xip1E_6_uid124_sincosTest_o(33 downto 0);

    -- xip1_6_uid128_sincosTest(BITSELECT,127)@2
    xip1_6_uid128_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_6_uid124_sincosTest_q(32 downto 0));
    xip1_6_uid128_sincosTest_b <= STD_LOGIC_VECTOR(xip1_6_uid128_sincosTest_in(32 downto 0));

    -- twoToMiSiXip_uid136_sincosTest(BITSELECT,135)@2
    twoToMiSiXip_uid136_sincosTest_b <= STD_LOGIC_VECTOR(xip1_6_uid128_sincosTest_b(32 downto 6));

    -- signOfSelectionSignal_uid117_sincosTest(LOGICAL,116)@2
    signOfSelectionSignal_uid117_sincosTest_q <= not (redist12_xMSB_uid115_sincosTest_b_1_q);

    -- twoToMiSiXip_uid120_sincosTest(BITSELECT,119)@2
    twoToMiSiXip_uid120_sincosTest_b <= STD_LOGIC_VECTOR(redist14_xip1_5_uid112_sincosTest_b_1_q(32 downto 5));

    -- yip1E_6_uid125_sincosTest(ADDSUB,124)@2
    yip1E_6_uid125_sincosTest_s <= signOfSelectionSignal_uid117_sincosTest_q;
    yip1E_6_uid125_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist13_yip1_5_uid113_sincosTest_b_1_q(32)) & redist13_yip1_5_uid113_sincosTest_b_1_q));
    yip1E_6_uid125_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 28 => twoToMiSiXip_uid120_sincosTest_b(27)) & twoToMiSiXip_uid120_sincosTest_b));
    yip1E_6_uid125_sincosTest_combproc: PROCESS (yip1E_6_uid125_sincosTest_a, yip1E_6_uid125_sincosTest_b, yip1E_6_uid125_sincosTest_s)
    BEGIN
        IF (yip1E_6_uid125_sincosTest_s = "1") THEN
            yip1E_6_uid125_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6_uid125_sincosTest_a) + SIGNED(yip1E_6_uid125_sincosTest_b));
        ELSE
            yip1E_6_uid125_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6_uid125_sincosTest_a) - SIGNED(yip1E_6_uid125_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_6_uid125_sincosTest_q <= yip1E_6_uid125_sincosTest_o(33 downto 0);

    -- yip1_6_uid129_sincosTest(BITSELECT,128)@2
    yip1_6_uid129_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_6_uid125_sincosTest_q(32 downto 0));
    yip1_6_uid129_sincosTest_b <= STD_LOGIC_VECTOR(yip1_6_uid129_sincosTest_in(32 downto 0));

    -- yip1E_7_uid141_sincosTest(ADDSUB,140)@2
    yip1E_7_uid141_sincosTest_s <= signOfSelectionSignal_uid133_sincosTest_q;
    yip1E_7_uid141_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => yip1_6_uid129_sincosTest_b(32)) & yip1_6_uid129_sincosTest_b));
    yip1E_7_uid141_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 27 => twoToMiSiXip_uid136_sincosTest_b(26)) & twoToMiSiXip_uid136_sincosTest_b));
    yip1E_7_uid141_sincosTest_combproc: PROCESS (yip1E_7_uid141_sincosTest_a, yip1E_7_uid141_sincosTest_b, yip1E_7_uid141_sincosTest_s)
    BEGIN
        IF (yip1E_7_uid141_sincosTest_s = "1") THEN
            yip1E_7_uid141_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7_uid141_sincosTest_a) + SIGNED(yip1E_7_uid141_sincosTest_b));
        ELSE
            yip1E_7_uid141_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7_uid141_sincosTest_a) - SIGNED(yip1E_7_uid141_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_7_uid141_sincosTest_q <= yip1E_7_uid141_sincosTest_o(33 downto 0);

    -- yip1_7_uid145_sincosTest(BITSELECT,144)@2
    yip1_7_uid145_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_7_uid141_sincosTest_q(32 downto 0));
    yip1_7_uid145_sincosTest_b <= STD_LOGIC_VECTOR(yip1_7_uid145_sincosTest_in(32 downto 0));

    -- twoToMiSiYip_uid153_sincosTest(BITSELECT,152)@2
    twoToMiSiYip_uid153_sincosTest_b <= STD_LOGIC_VECTOR(yip1_7_uid145_sincosTest_b(32 downto 7));

    -- twoToMiSiYip_uid137_sincosTest(BITSELECT,136)@2
    twoToMiSiYip_uid137_sincosTest_b <= STD_LOGIC_VECTOR(yip1_6_uid129_sincosTest_b(32 downto 6));

    -- xip1E_7_uid140_sincosTest(ADDSUB,139)@2
    xip1E_7_uid140_sincosTest_s <= redist11_xMSB_uid131_sincosTest_b_1_q;
    xip1E_7_uid140_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => xip1_6_uid128_sincosTest_b(32)) & xip1_6_uid128_sincosTest_b));
    xip1E_7_uid140_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 27 => twoToMiSiYip_uid137_sincosTest_b(26)) & twoToMiSiYip_uid137_sincosTest_b));
    xip1E_7_uid140_sincosTest_combproc: PROCESS (xip1E_7_uid140_sincosTest_a, xip1E_7_uid140_sincosTest_b, xip1E_7_uid140_sincosTest_s)
    BEGIN
        IF (xip1E_7_uid140_sincosTest_s = "1") THEN
            xip1E_7_uid140_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7_uid140_sincosTest_a) + SIGNED(xip1E_7_uid140_sincosTest_b));
        ELSE
            xip1E_7_uid140_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7_uid140_sincosTest_a) - SIGNED(xip1E_7_uid140_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_7_uid140_sincosTest_q <= xip1E_7_uid140_sincosTest_o(33 downto 0);

    -- xip1_7_uid144_sincosTest(BITSELECT,143)@2
    xip1_7_uid144_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_7_uid140_sincosTest_q(32 downto 0));
    xip1_7_uid144_sincosTest_b <= STD_LOGIC_VECTOR(xip1_7_uid144_sincosTest_in(32 downto 0));

    -- xip1E_8_uid156_sincosTest(ADDSUB,155)@2
    xip1E_8_uid156_sincosTest_s <= redist10_xMSB_uid147_sincosTest_b_1_q;
    xip1E_8_uid156_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => xip1_7_uid144_sincosTest_b(32)) & xip1_7_uid144_sincosTest_b));
    xip1E_8_uid156_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 26 => twoToMiSiYip_uid153_sincosTest_b(25)) & twoToMiSiYip_uid153_sincosTest_b));
    xip1E_8_uid156_sincosTest_combproc: PROCESS (xip1E_8_uid156_sincosTest_a, xip1E_8_uid156_sincosTest_b, xip1E_8_uid156_sincosTest_s)
    BEGIN
        IF (xip1E_8_uid156_sincosTest_s = "1") THEN
            xip1E_8_uid156_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid156_sincosTest_a) + SIGNED(xip1E_8_uid156_sincosTest_b));
        ELSE
            xip1E_8_uid156_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid156_sincosTest_a) - SIGNED(xip1E_8_uid156_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_8_uid156_sincosTest_q <= xip1E_8_uid156_sincosTest_o(33 downto 0);

    -- xip1_8_uid160_sincosTest(BITSELECT,159)@2
    xip1_8_uid160_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_8_uid156_sincosTest_q(32 downto 0));
    xip1_8_uid160_sincosTest_b <= STD_LOGIC_VECTOR(xip1_8_uid160_sincosTest_in(32 downto 0));

    -- twoToMiSiXip_uid168_sincosTest(BITSELECT,167)@2
    twoToMiSiXip_uid168_sincosTest_b <= STD_LOGIC_VECTOR(xip1_8_uid160_sincosTest_b(32 downto 8));

    -- signOfSelectionSignal_uid149_sincosTest(LOGICAL,148)@2
    signOfSelectionSignal_uid149_sincosTest_q <= not (redist10_xMSB_uid147_sincosTest_b_1_q);

    -- twoToMiSiXip_uid152_sincosTest(BITSELECT,151)@2
    twoToMiSiXip_uid152_sincosTest_b <= STD_LOGIC_VECTOR(xip1_7_uid144_sincosTest_b(32 downto 7));

    -- yip1E_8_uid157_sincosTest(ADDSUB,156)@2
    yip1E_8_uid157_sincosTest_s <= signOfSelectionSignal_uid149_sincosTest_q;
    yip1E_8_uid157_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => yip1_7_uid145_sincosTest_b(32)) & yip1_7_uid145_sincosTest_b));
    yip1E_8_uid157_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 26 => twoToMiSiXip_uid152_sincosTest_b(25)) & twoToMiSiXip_uid152_sincosTest_b));
    yip1E_8_uid157_sincosTest_combproc: PROCESS (yip1E_8_uid157_sincosTest_a, yip1E_8_uid157_sincosTest_b, yip1E_8_uid157_sincosTest_s)
    BEGIN
        IF (yip1E_8_uid157_sincosTest_s = "1") THEN
            yip1E_8_uid157_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid157_sincosTest_a) + SIGNED(yip1E_8_uid157_sincosTest_b));
        ELSE
            yip1E_8_uid157_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid157_sincosTest_a) - SIGNED(yip1E_8_uid157_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_8_uid157_sincosTest_q <= yip1E_8_uid157_sincosTest_o(33 downto 0);

    -- yip1_8_uid161_sincosTest(BITSELECT,160)@2
    yip1_8_uid161_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_8_uid157_sincosTest_q(32 downto 0));
    yip1_8_uid161_sincosTest_b <= STD_LOGIC_VECTOR(yip1_8_uid161_sincosTest_in(32 downto 0));

    -- yip1E_9_uid173_sincosTest(ADDSUB,172)@2
    yip1E_9_uid173_sincosTest_s <= signOfSelectionSignal_uid165_sincosTest_q;
    yip1E_9_uid173_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => yip1_8_uid161_sincosTest_b(32)) & yip1_8_uid161_sincosTest_b));
    yip1E_9_uid173_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 25 => twoToMiSiXip_uid168_sincosTest_b(24)) & twoToMiSiXip_uid168_sincosTest_b));
    yip1E_9_uid173_sincosTest_combproc: PROCESS (yip1E_9_uid173_sincosTest_a, yip1E_9_uid173_sincosTest_b, yip1E_9_uid173_sincosTest_s)
    BEGIN
        IF (yip1E_9_uid173_sincosTest_s = "1") THEN
            yip1E_9_uid173_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid173_sincosTest_a) + SIGNED(yip1E_9_uid173_sincosTest_b));
        ELSE
            yip1E_9_uid173_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid173_sincosTest_a) - SIGNED(yip1E_9_uid173_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_9_uid173_sincosTest_q <= yip1E_9_uid173_sincosTest_o(33 downto 0);

    -- yip1_9_uid180_sincosTest(BITSELECT,179)@2
    yip1_9_uid180_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_9_uid173_sincosTest_q(32 downto 0));
    yip1_9_uid180_sincosTest_b <= STD_LOGIC_VECTOR(yip1_9_uid180_sincosTest_in(32 downto 0));

    -- twoToMiSiYip_uid188_sincosTest(BITSELECT,187)@2
    twoToMiSiYip_uid188_sincosTest_b <= STD_LOGIC_VECTOR(yip1_9_uid180_sincosTest_b(32 downto 9));

    -- twoToMiSiYip_uid169_sincosTest(BITSELECT,168)@2
    twoToMiSiYip_uid169_sincosTest_b <= STD_LOGIC_VECTOR(yip1_8_uid161_sincosTest_b(32 downto 8));

    -- xip1E_9_uid172_sincosTest(ADDSUB,171)@2
    xip1E_9_uid172_sincosTest_s <= xMSB_uid163_sincosTest_b;
    xip1E_9_uid172_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => xip1_8_uid160_sincosTest_b(32)) & xip1_8_uid160_sincosTest_b));
    xip1E_9_uid172_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 25 => twoToMiSiYip_uid169_sincosTest_b(24)) & twoToMiSiYip_uid169_sincosTest_b));
    xip1E_9_uid172_sincosTest_combproc: PROCESS (xip1E_9_uid172_sincosTest_a, xip1E_9_uid172_sincosTest_b, xip1E_9_uid172_sincosTest_s)
    BEGIN
        IF (xip1E_9_uid172_sincosTest_s = "1") THEN
            xip1E_9_uid172_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid172_sincosTest_a) + SIGNED(xip1E_9_uid172_sincosTest_b));
        ELSE
            xip1E_9_uid172_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid172_sincosTest_a) - SIGNED(xip1E_9_uid172_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_9_uid172_sincosTest_q <= xip1E_9_uid172_sincosTest_o(33 downto 0);

    -- xip1_9_uid179_sincosTest(BITSELECT,178)@2
    xip1_9_uid179_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_9_uid172_sincosTest_q(32 downto 0));
    xip1_9_uid179_sincosTest_b <= STD_LOGIC_VECTOR(xip1_9_uid179_sincosTest_in(32 downto 0));

    -- xip1E_10_uid191_sincosTest(ADDSUB,190)@2
    xip1E_10_uid191_sincosTest_s <= xMSB_uid182_sincosTest_b;
    xip1E_10_uid191_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => xip1_9_uid179_sincosTest_b(32)) & xip1_9_uid179_sincosTest_b));
    xip1E_10_uid191_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 24 => twoToMiSiYip_uid188_sincosTest_b(23)) & twoToMiSiYip_uid188_sincosTest_b));
    xip1E_10_uid191_sincosTest_combproc: PROCESS (xip1E_10_uid191_sincosTest_a, xip1E_10_uid191_sincosTest_b, xip1E_10_uid191_sincosTest_s)
    BEGIN
        IF (xip1E_10_uid191_sincosTest_s = "1") THEN
            xip1E_10_uid191_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_10_uid191_sincosTest_a) + SIGNED(xip1E_10_uid191_sincosTest_b));
        ELSE
            xip1E_10_uid191_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_10_uid191_sincosTest_a) - SIGNED(xip1E_10_uid191_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_10_uid191_sincosTest_q <= xip1E_10_uid191_sincosTest_o(33 downto 0);

    -- xip1_10_uid198_sincosTest(BITSELECT,197)@2
    xip1_10_uid198_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_10_uid191_sincosTest_q(32 downto 0));
    xip1_10_uid198_sincosTest_b <= STD_LOGIC_VECTOR(xip1_10_uid198_sincosTest_in(32 downto 0));

    -- redist8_xip1_10_uid198_sincosTest_b_1(DELAY,329)
    redist8_xip1_10_uid198_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_10_uid198_sincosTest_b, xout => redist8_xip1_10_uid198_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid206_sincosTest(BITSELECT,205)@3
    twoToMiSiXip_uid206_sincosTest_b <= STD_LOGIC_VECTOR(redist8_xip1_10_uid198_sincosTest_b_1_q(32 downto 10));

    -- signOfSelectionSignal_uid184_sincosTest(LOGICAL,183)@2
    signOfSelectionSignal_uid184_sincosTest_q <= not (xMSB_uid182_sincosTest_b);

    -- twoToMiSiXip_uid187_sincosTest(BITSELECT,186)@2
    twoToMiSiXip_uid187_sincosTest_b <= STD_LOGIC_VECTOR(xip1_9_uid179_sincosTest_b(32 downto 9));

    -- yip1E_10_uid192_sincosTest(ADDSUB,191)@2
    yip1E_10_uid192_sincosTest_s <= signOfSelectionSignal_uid184_sincosTest_q;
    yip1E_10_uid192_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => yip1_9_uid180_sincosTest_b(32)) & yip1_9_uid180_sincosTest_b));
    yip1E_10_uid192_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 24 => twoToMiSiXip_uid187_sincosTest_b(23)) & twoToMiSiXip_uid187_sincosTest_b));
    yip1E_10_uid192_sincosTest_combproc: PROCESS (yip1E_10_uid192_sincosTest_a, yip1E_10_uid192_sincosTest_b, yip1E_10_uid192_sincosTest_s)
    BEGIN
        IF (yip1E_10_uid192_sincosTest_s = "1") THEN
            yip1E_10_uid192_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_10_uid192_sincosTest_a) + SIGNED(yip1E_10_uid192_sincosTest_b));
        ELSE
            yip1E_10_uid192_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_10_uid192_sincosTest_a) - SIGNED(yip1E_10_uid192_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_10_uid192_sincosTest_q <= yip1E_10_uid192_sincosTest_o(33 downto 0);

    -- yip1_10_uid199_sincosTest(BITSELECT,198)@2
    yip1_10_uid199_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_10_uid192_sincosTest_q(32 downto 0));
    yip1_10_uid199_sincosTest_b <= STD_LOGIC_VECTOR(yip1_10_uid199_sincosTest_in(32 downto 0));

    -- redist7_yip1_10_uid199_sincosTest_b_1(DELAY,328)
    redist7_yip1_10_uid199_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_10_uid199_sincosTest_b, xout => redist7_yip1_10_uid199_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_11_uid211_sincosTest(ADDSUB,210)@3
    yip1E_11_uid211_sincosTest_s <= signOfSelectionSignal_uid203_sincosTest_q;
    yip1E_11_uid211_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist7_yip1_10_uid199_sincosTest_b_1_q(32)) & redist7_yip1_10_uid199_sincosTest_b_1_q));
    yip1E_11_uid211_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 23 => twoToMiSiXip_uid206_sincosTest_b(22)) & twoToMiSiXip_uid206_sincosTest_b));
    yip1E_11_uid211_sincosTest_combproc: PROCESS (yip1E_11_uid211_sincosTest_a, yip1E_11_uid211_sincosTest_b, yip1E_11_uid211_sincosTest_s)
    BEGIN
        IF (yip1E_11_uid211_sincosTest_s = "1") THEN
            yip1E_11_uid211_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_11_uid211_sincosTest_a) + SIGNED(yip1E_11_uid211_sincosTest_b));
        ELSE
            yip1E_11_uid211_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_11_uid211_sincosTest_a) - SIGNED(yip1E_11_uid211_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_11_uid211_sincosTest_q <= yip1E_11_uid211_sincosTest_o(33 downto 0);

    -- yip1_11_uid218_sincosTest(BITSELECT,217)@3
    yip1_11_uid218_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_11_uid211_sincosTest_q(32 downto 0));
    yip1_11_uid218_sincosTest_b <= STD_LOGIC_VECTOR(yip1_11_uid218_sincosTest_in(32 downto 0));

    -- twoToMiSiYip_uid226_sincosTest(BITSELECT,225)@3
    twoToMiSiYip_uid226_sincosTest_b <= STD_LOGIC_VECTOR(yip1_11_uid218_sincosTest_b(32 downto 11));

    -- twoToMiSiYip_uid207_sincosTest(BITSELECT,206)@3
    twoToMiSiYip_uid207_sincosTest_b <= STD_LOGIC_VECTOR(redist7_yip1_10_uid199_sincosTest_b_1_q(32 downto 10));

    -- xip1E_11_uid210_sincosTest(ADDSUB,209)@3
    xip1E_11_uid210_sincosTest_s <= redist6_xMSB_uid201_sincosTest_b_1_q;
    xip1E_11_uid210_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist8_xip1_10_uid198_sincosTest_b_1_q(32)) & redist8_xip1_10_uid198_sincosTest_b_1_q));
    xip1E_11_uid210_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 23 => twoToMiSiYip_uid207_sincosTest_b(22)) & twoToMiSiYip_uid207_sincosTest_b));
    xip1E_11_uid210_sincosTest_combproc: PROCESS (xip1E_11_uid210_sincosTest_a, xip1E_11_uid210_sincosTest_b, xip1E_11_uid210_sincosTest_s)
    BEGIN
        IF (xip1E_11_uid210_sincosTest_s = "1") THEN
            xip1E_11_uid210_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_11_uid210_sincosTest_a) + SIGNED(xip1E_11_uid210_sincosTest_b));
        ELSE
            xip1E_11_uid210_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_11_uid210_sincosTest_a) - SIGNED(xip1E_11_uid210_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_11_uid210_sincosTest_q <= xip1E_11_uid210_sincosTest_o(33 downto 0);

    -- xip1_11_uid217_sincosTest(BITSELECT,216)@3
    xip1_11_uid217_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_11_uid210_sincosTest_q(32 downto 0));
    xip1_11_uid217_sincosTest_b <= STD_LOGIC_VECTOR(xip1_11_uid217_sincosTest_in(32 downto 0));

    -- xip1E_12_uid229_sincosTest(ADDSUB,228)@3
    xip1E_12_uid229_sincosTest_s <= redist5_xMSB_uid220_sincosTest_b_1_q;
    xip1E_12_uid229_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => xip1_11_uid217_sincosTest_b(32)) & xip1_11_uid217_sincosTest_b));
    xip1E_12_uid229_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 22 => twoToMiSiYip_uid226_sincosTest_b(21)) & twoToMiSiYip_uid226_sincosTest_b));
    xip1E_12_uid229_sincosTest_combproc: PROCESS (xip1E_12_uid229_sincosTest_a, xip1E_12_uid229_sincosTest_b, xip1E_12_uid229_sincosTest_s)
    BEGIN
        IF (xip1E_12_uid229_sincosTest_s = "1") THEN
            xip1E_12_uid229_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_12_uid229_sincosTest_a) + SIGNED(xip1E_12_uid229_sincosTest_b));
        ELSE
            xip1E_12_uid229_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_12_uid229_sincosTest_a) - SIGNED(xip1E_12_uid229_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_12_uid229_sincosTest_q <= xip1E_12_uid229_sincosTest_o(33 downto 0);

    -- xip1_12_uid236_sincosTest(BITSELECT,235)@3
    xip1_12_uid236_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_12_uid229_sincosTest_q(32 downto 0));
    xip1_12_uid236_sincosTest_b <= STD_LOGIC_VECTOR(xip1_12_uid236_sincosTest_in(32 downto 0));

    -- twoToMiSiXip_uid244_sincosTest(BITSELECT,243)@3
    twoToMiSiXip_uid244_sincosTest_b <= STD_LOGIC_VECTOR(xip1_12_uid236_sincosTest_b(32 downto 12));

    -- signOfSelectionSignal_uid222_sincosTest(LOGICAL,221)@3
    signOfSelectionSignal_uid222_sincosTest_q <= not (redist5_xMSB_uid220_sincosTest_b_1_q);

    -- twoToMiSiXip_uid225_sincosTest(BITSELECT,224)@3
    twoToMiSiXip_uid225_sincosTest_b <= STD_LOGIC_VECTOR(xip1_11_uid217_sincosTest_b(32 downto 11));

    -- yip1E_12_uid230_sincosTest(ADDSUB,229)@3
    yip1E_12_uid230_sincosTest_s <= signOfSelectionSignal_uid222_sincosTest_q;
    yip1E_12_uid230_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => yip1_11_uid218_sincosTest_b(32)) & yip1_11_uid218_sincosTest_b));
    yip1E_12_uid230_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 22 => twoToMiSiXip_uid225_sincosTest_b(21)) & twoToMiSiXip_uid225_sincosTest_b));
    yip1E_12_uid230_sincosTest_combproc: PROCESS (yip1E_12_uid230_sincosTest_a, yip1E_12_uid230_sincosTest_b, yip1E_12_uid230_sincosTest_s)
    BEGIN
        IF (yip1E_12_uid230_sincosTest_s = "1") THEN
            yip1E_12_uid230_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_12_uid230_sincosTest_a) + SIGNED(yip1E_12_uid230_sincosTest_b));
        ELSE
            yip1E_12_uid230_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_12_uid230_sincosTest_a) - SIGNED(yip1E_12_uid230_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_12_uid230_sincosTest_q <= yip1E_12_uid230_sincosTest_o(33 downto 0);

    -- yip1_12_uid237_sincosTest(BITSELECT,236)@3
    yip1_12_uid237_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_12_uid230_sincosTest_q(32 downto 0));
    yip1_12_uid237_sincosTest_b <= STD_LOGIC_VECTOR(yip1_12_uid237_sincosTest_in(32 downto 0));

    -- yip1E_13_uid249_sincosTest(ADDSUB,248)@3
    yip1E_13_uid249_sincosTest_s <= signOfSelectionSignal_uid241_sincosTest_q;
    yip1E_13_uid249_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => yip1_12_uid237_sincosTest_b(32)) & yip1_12_uid237_sincosTest_b));
    yip1E_13_uid249_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 21 => twoToMiSiXip_uid244_sincosTest_b(20)) & twoToMiSiXip_uid244_sincosTest_b));
    yip1E_13_uid249_sincosTest_combproc: PROCESS (yip1E_13_uid249_sincosTest_a, yip1E_13_uid249_sincosTest_b, yip1E_13_uid249_sincosTest_s)
    BEGIN
        IF (yip1E_13_uid249_sincosTest_s = "1") THEN
            yip1E_13_uid249_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_13_uid249_sincosTest_a) + SIGNED(yip1E_13_uid249_sincosTest_b));
        ELSE
            yip1E_13_uid249_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_13_uid249_sincosTest_a) - SIGNED(yip1E_13_uid249_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_13_uid249_sincosTest_q <= yip1E_13_uid249_sincosTest_o(33 downto 0);

    -- yip1_13_uid256_sincosTest(BITSELECT,255)@3
    yip1_13_uid256_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_13_uid249_sincosTest_q(32 downto 0));
    yip1_13_uid256_sincosTest_b <= STD_LOGIC_VECTOR(yip1_13_uid256_sincosTest_in(32 downto 0));

    -- twoToMiSiYip_uid264_sincosTest(BITSELECT,263)@3
    twoToMiSiYip_uid264_sincosTest_b <= STD_LOGIC_VECTOR(yip1_13_uid256_sincosTest_b(32 downto 13));

    -- twoToMiSiYip_uid245_sincosTest(BITSELECT,244)@3
    twoToMiSiYip_uid245_sincosTest_b <= STD_LOGIC_VECTOR(yip1_12_uid237_sincosTest_b(32 downto 12));

    -- xip1E_13_uid248_sincosTest(ADDSUB,247)@3
    xip1E_13_uid248_sincosTest_s <= redist4_xMSB_uid239_sincosTest_b_1_q;
    xip1E_13_uid248_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => xip1_12_uid236_sincosTest_b(32)) & xip1_12_uid236_sincosTest_b));
    xip1E_13_uid248_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 21 => twoToMiSiYip_uid245_sincosTest_b(20)) & twoToMiSiYip_uid245_sincosTest_b));
    xip1E_13_uid248_sincosTest_combproc: PROCESS (xip1E_13_uid248_sincosTest_a, xip1E_13_uid248_sincosTest_b, xip1E_13_uid248_sincosTest_s)
    BEGIN
        IF (xip1E_13_uid248_sincosTest_s = "1") THEN
            xip1E_13_uid248_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_13_uid248_sincosTest_a) + SIGNED(xip1E_13_uid248_sincosTest_b));
        ELSE
            xip1E_13_uid248_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_13_uid248_sincosTest_a) - SIGNED(xip1E_13_uid248_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_13_uid248_sincosTest_q <= xip1E_13_uid248_sincosTest_o(33 downto 0);

    -- xip1_13_uid255_sincosTest(BITSELECT,254)@3
    xip1_13_uid255_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_13_uid248_sincosTest_q(32 downto 0));
    xip1_13_uid255_sincosTest_b <= STD_LOGIC_VECTOR(xip1_13_uid255_sincosTest_in(32 downto 0));

    -- xip1E_14_uid267_sincosTest(ADDSUB,266)@3
    xip1E_14_uid267_sincosTest_s <= redist3_xMSB_uid258_sincosTest_b_1_q;
    xip1E_14_uid267_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => xip1_13_uid255_sincosTest_b(32)) & xip1_13_uid255_sincosTest_b));
    xip1E_14_uid267_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 20 => twoToMiSiYip_uid264_sincosTest_b(19)) & twoToMiSiYip_uid264_sincosTest_b));
    xip1E_14_uid267_sincosTest_combproc: PROCESS (xip1E_14_uid267_sincosTest_a, xip1E_14_uid267_sincosTest_b, xip1E_14_uid267_sincosTest_s)
    BEGIN
        IF (xip1E_14_uid267_sincosTest_s = "1") THEN
            xip1E_14_uid267_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_14_uid267_sincosTest_a) + SIGNED(xip1E_14_uid267_sincosTest_b));
        ELSE
            xip1E_14_uid267_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_14_uid267_sincosTest_a) - SIGNED(xip1E_14_uid267_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_14_uid267_sincosTest_q <= xip1E_14_uid267_sincosTest_o(33 downto 0);

    -- xip1_14_uid274_sincosTest(BITSELECT,273)@3
    xip1_14_uid274_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_14_uid267_sincosTest_q(32 downto 0));
    xip1_14_uid274_sincosTest_b <= STD_LOGIC_VECTOR(xip1_14_uid274_sincosTest_in(32 downto 0));

    -- twoToMiSiXip_uid282_sincosTest(BITSELECT,281)@3
    twoToMiSiXip_uid282_sincosTest_b <= STD_LOGIC_VECTOR(xip1_14_uid274_sincosTest_b(32 downto 14));

    -- signOfSelectionSignal_uid260_sincosTest(LOGICAL,259)@3
    signOfSelectionSignal_uid260_sincosTest_q <= not (redist3_xMSB_uid258_sincosTest_b_1_q);

    -- twoToMiSiXip_uid263_sincosTest(BITSELECT,262)@3
    twoToMiSiXip_uid263_sincosTest_b <= STD_LOGIC_VECTOR(xip1_13_uid255_sincosTest_b(32 downto 13));

    -- yip1E_14_uid268_sincosTest(ADDSUB,267)@3
    yip1E_14_uid268_sincosTest_s <= signOfSelectionSignal_uid260_sincosTest_q;
    yip1E_14_uid268_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => yip1_13_uid256_sincosTest_b(32)) & yip1_13_uid256_sincosTest_b));
    yip1E_14_uid268_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 20 => twoToMiSiXip_uid263_sincosTest_b(19)) & twoToMiSiXip_uid263_sincosTest_b));
    yip1E_14_uid268_sincosTest_combproc: PROCESS (yip1E_14_uid268_sincosTest_a, yip1E_14_uid268_sincosTest_b, yip1E_14_uid268_sincosTest_s)
    BEGIN
        IF (yip1E_14_uid268_sincosTest_s = "1") THEN
            yip1E_14_uid268_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_14_uid268_sincosTest_a) + SIGNED(yip1E_14_uid268_sincosTest_b));
        ELSE
            yip1E_14_uid268_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_14_uid268_sincosTest_a) - SIGNED(yip1E_14_uid268_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_14_uid268_sincosTest_q <= yip1E_14_uid268_sincosTest_o(33 downto 0);

    -- yip1_14_uid275_sincosTest(BITSELECT,274)@3
    yip1_14_uid275_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_14_uid268_sincosTest_q(32 downto 0));
    yip1_14_uid275_sincosTest_b <= STD_LOGIC_VECTOR(yip1_14_uid275_sincosTest_in(32 downto 0));

    -- yip1E_15_uid287_sincosTest(ADDSUB,286)@3
    yip1E_15_uid287_sincosTest_s <= signOfSelectionSignal_uid279_sincosTest_q;
    yip1E_15_uid287_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => yip1_14_uid275_sincosTest_b(32)) & yip1_14_uid275_sincosTest_b));
    yip1E_15_uid287_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 19 => twoToMiSiXip_uid282_sincosTest_b(18)) & twoToMiSiXip_uid282_sincosTest_b));
    yip1E_15_uid287_sincosTest_combproc: PROCESS (yip1E_15_uid287_sincosTest_a, yip1E_15_uid287_sincosTest_b, yip1E_15_uid287_sincosTest_s)
    BEGIN
        IF (yip1E_15_uid287_sincosTest_s = "1") THEN
            yip1E_15_uid287_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_15_uid287_sincosTest_a) + SIGNED(yip1E_15_uid287_sincosTest_b));
        ELSE
            yip1E_15_uid287_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_15_uid287_sincosTest_a) - SIGNED(yip1E_15_uid287_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_15_uid287_sincosTest_q <= yip1E_15_uid287_sincosTest_o(33 downto 0);

    -- yip1_15_uid294_sincosTest(BITSELECT,293)@3
    yip1_15_uid294_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_15_uid287_sincosTest_q(32 downto 0));
    yip1_15_uid294_sincosTest_b <= STD_LOGIC_VECTOR(yip1_15_uid294_sincosTest_in(32 downto 0));

    -- ySumPreRnd_uid300_sincosTest(BITSELECT,299)@3
    ySumPreRnd_uid300_sincosTest_in <= yip1_15_uid294_sincosTest_b(31 downto 0);
    ySumPreRnd_uid300_sincosTest_b <= ySumPreRnd_uid300_sincosTest_in(31 downto 16);

    -- redist0_ySumPreRnd_uid300_sincosTest_b_1(DELAY,321)
    redist0_ySumPreRnd_uid300_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => ySumPreRnd_uid300_sincosTest_b, xout => redist0_ySumPreRnd_uid300_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- ySumPostRnd_uid303_sincosTest(ADD,302)@4
    ySumPostRnd_uid303_sincosTest_a <= STD_LOGIC_VECTOR("0" & redist0_ySumPreRnd_uid300_sincosTest_b_1_q);
    ySumPostRnd_uid303_sincosTest_b <= STD_LOGIC_VECTOR("0000000000000000" & VCC_q);
    ySumPostRnd_uid303_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(ySumPostRnd_uid303_sincosTest_a) + UNSIGNED(ySumPostRnd_uid303_sincosTest_b));
    ySumPostRnd_uid303_sincosTest_q <= ySumPostRnd_uid303_sincosTest_o(16 downto 0);

    -- yPostExc_uid305_sincosTest(BITSELECT,304)@4
    yPostExc_uid305_sincosTest_in <= STD_LOGIC_VECTOR(ySumPostRnd_uid303_sincosTest_q(15 downto 0));
    yPostExc_uid305_sincosTest_b <= STD_LOGIC_VECTOR(yPostExc_uid305_sincosTest_in(15 downto 1));

    -- cstZeroForAddSub_uid313_sincosTest(CONSTANT,312)
    cstZeroForAddSub_uid313_sincosTest_q <= "000000000000000";

    -- sinPostNeg_uid315_sincosTest(ADDSUB,314)@4
    sinPostNeg_uid315_sincosTest_s <= invSinNegCond_uid314_sincosTest_q;
    sinPostNeg_uid315_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => cstZeroForAddSub_uid313_sincosTest_q(14)) & cstZeroForAddSub_uid313_sincosTest_q));
    sinPostNeg_uid315_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => yPostExc_uid305_sincosTest_b(14)) & yPostExc_uid305_sincosTest_b));
    sinPostNeg_uid315_sincosTest_combproc: PROCESS (sinPostNeg_uid315_sincosTest_a, sinPostNeg_uid315_sincosTest_b, sinPostNeg_uid315_sincosTest_s)
    BEGIN
        IF (sinPostNeg_uid315_sincosTest_s = "1") THEN
            sinPostNeg_uid315_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(sinPostNeg_uid315_sincosTest_a) + SIGNED(sinPostNeg_uid315_sincosTest_b));
        ELSE
            sinPostNeg_uid315_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(sinPostNeg_uid315_sincosTest_a) - SIGNED(sinPostNeg_uid315_sincosTest_b));
        END IF;
    END PROCESS;
    sinPostNeg_uid315_sincosTest_q <= sinPostNeg_uid315_sincosTest_o(15 downto 0);

    -- invCosNegCond_uid316_sincosTest(LOGICAL,315)@4
    invCosNegCond_uid316_sincosTest_q <= not (sinNegCond2_uid307_sincosTest_q);

    -- twoToMiSiYip_uid283_sincosTest(BITSELECT,282)@3
    twoToMiSiYip_uid283_sincosTest_b <= STD_LOGIC_VECTOR(yip1_14_uid275_sincosTest_b(32 downto 14));

    -- xip1E_15_uid286_sincosTest(ADDSUB,285)@3
    xip1E_15_uid286_sincosTest_s <= redist2_xMSB_uid277_sincosTest_b_1_q;
    xip1E_15_uid286_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => xip1_14_uid274_sincosTest_b(32)) & xip1_14_uid274_sincosTest_b));
    xip1E_15_uid286_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 19 => twoToMiSiYip_uid283_sincosTest_b(18)) & twoToMiSiYip_uid283_sincosTest_b));
    xip1E_15_uid286_sincosTest_combproc: PROCESS (xip1E_15_uid286_sincosTest_a, xip1E_15_uid286_sincosTest_b, xip1E_15_uid286_sincosTest_s)
    BEGIN
        IF (xip1E_15_uid286_sincosTest_s = "1") THEN
            xip1E_15_uid286_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_15_uid286_sincosTest_a) + SIGNED(xip1E_15_uid286_sincosTest_b));
        ELSE
            xip1E_15_uid286_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_15_uid286_sincosTest_a) - SIGNED(xip1E_15_uid286_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_15_uid286_sincosTest_q <= xip1E_15_uid286_sincosTest_o(33 downto 0);

    -- xip1_15_uid293_sincosTest(BITSELECT,292)@3
    xip1_15_uid293_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_15_uid286_sincosTest_q(32 downto 0));
    xip1_15_uid293_sincosTest_b <= STD_LOGIC_VECTOR(xip1_15_uid293_sincosTest_in(32 downto 0));

    -- xSumPreRnd_uid296_sincosTest(BITSELECT,295)@3
    xSumPreRnd_uid296_sincosTest_in <= xip1_15_uid293_sincosTest_b(31 downto 0);
    xSumPreRnd_uid296_sincosTest_b <= xSumPreRnd_uid296_sincosTest_in(31 downto 16);

    -- redist1_xSumPreRnd_uid296_sincosTest_b_1(DELAY,322)
    redist1_xSumPreRnd_uid296_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xSumPreRnd_uid296_sincosTest_b, xout => redist1_xSumPreRnd_uid296_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xSumPostRnd_uid299_sincosTest(ADD,298)@4
    xSumPostRnd_uid299_sincosTest_a <= STD_LOGIC_VECTOR("0" & redist1_xSumPreRnd_uid296_sincosTest_b_1_q);
    xSumPostRnd_uid299_sincosTest_b <= STD_LOGIC_VECTOR("0000000000000000" & VCC_q);
    xSumPostRnd_uid299_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xSumPostRnd_uid299_sincosTest_a) + UNSIGNED(xSumPostRnd_uid299_sincosTest_b));
    xSumPostRnd_uid299_sincosTest_q <= xSumPostRnd_uid299_sincosTest_o(16 downto 0);

    -- xPostExc_uid304_sincosTest(BITSELECT,303)@4
    xPostExc_uid304_sincosTest_in <= STD_LOGIC_VECTOR(xSumPostRnd_uid299_sincosTest_q(15 downto 0));
    xPostExc_uid304_sincosTest_b <= STD_LOGIC_VECTOR(xPostExc_uid304_sincosTest_in(15 downto 1));

    -- cosPostNeg_uid317_sincosTest(ADDSUB,316)@4
    cosPostNeg_uid317_sincosTest_s <= invCosNegCond_uid316_sincosTest_q;
    cosPostNeg_uid317_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => cstZeroForAddSub_uid313_sincosTest_q(14)) & cstZeroForAddSub_uid313_sincosTest_q));
    cosPostNeg_uid317_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => xPostExc_uid304_sincosTest_b(14)) & xPostExc_uid304_sincosTest_b));
    cosPostNeg_uid317_sincosTest_combproc: PROCESS (cosPostNeg_uid317_sincosTest_a, cosPostNeg_uid317_sincosTest_b, cosPostNeg_uid317_sincosTest_s)
    BEGIN
        IF (cosPostNeg_uid317_sincosTest_s = "1") THEN
            cosPostNeg_uid317_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(cosPostNeg_uid317_sincosTest_a) + SIGNED(cosPostNeg_uid317_sincosTest_b));
        ELSE
            cosPostNeg_uid317_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(cosPostNeg_uid317_sincosTest_a) - SIGNED(cosPostNeg_uid317_sincosTest_b));
        END IF;
    END PROCESS;
    cosPostNeg_uid317_sincosTest_q <= cosPostNeg_uid317_sincosTest_o(15 downto 0);

    -- redist18_firstQuadrant_uid15_sincosTest_b_4(DELAY,339)
    redist18_firstQuadrant_uid15_sincosTest_b_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => firstQuadrant_uid15_sincosTest_b, xout => redist18_firstQuadrant_uid15_sincosTest_b_4_q, clk => clk, aclr => areset );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- xPostRR_uid319_sincosTest(MUX,318)@4
    xPostRR_uid319_sincosTest_s <= redist18_firstQuadrant_uid15_sincosTest_b_4_q;
    xPostRR_uid319_sincosTest_combproc: PROCESS (xPostRR_uid319_sincosTest_s, cosPostNeg_uid317_sincosTest_q, sinPostNeg_uid315_sincosTest_q)
    BEGIN
        CASE (xPostRR_uid319_sincosTest_s) IS
            WHEN "0" => xPostRR_uid319_sincosTest_q <= cosPostNeg_uid317_sincosTest_q;
            WHEN "1" => xPostRR_uid319_sincosTest_q <= sinPostNeg_uid315_sincosTest_q;
            WHEN OTHERS => xPostRR_uid319_sincosTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sin_uid321_sincosTest(BITSELECT,320)@4
    sin_uid321_sincosTest_in <= STD_LOGIC_VECTOR(xPostRR_uid319_sincosTest_q(14 downto 0));
    sin_uid321_sincosTest_b <= STD_LOGIC_VECTOR(sin_uid321_sincosTest_in(14 downto 0));

    -- xPostRR_uid318_sincosTest(MUX,317)@4
    xPostRR_uid318_sincosTest_s <= redist18_firstQuadrant_uid15_sincosTest_b_4_q;
    xPostRR_uid318_sincosTest_combproc: PROCESS (xPostRR_uid318_sincosTest_s, sinPostNeg_uid315_sincosTest_q, cosPostNeg_uid317_sincosTest_q)
    BEGIN
        CASE (xPostRR_uid318_sincosTest_s) IS
            WHEN "0" => xPostRR_uid318_sincosTest_q <= sinPostNeg_uid315_sincosTest_q;
            WHEN "1" => xPostRR_uid318_sincosTest_q <= cosPostNeg_uid317_sincosTest_q;
            WHEN OTHERS => xPostRR_uid318_sincosTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cos_uid320_sincosTest(BITSELECT,319)@4
    cos_uid320_sincosTest_in <= STD_LOGIC_VECTOR(xPostRR_uid318_sincosTest_q(14 downto 0));
    cos_uid320_sincosTest_b <= STD_LOGIC_VECTOR(cos_uid320_sincosTest_in(14 downto 0));

    -- xOut(GPOUT,4)@4
    c <= cos_uid320_sincosTest_b;
    s <= sin_uid321_sincosTest_b;

END normal;
