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

-- VHDL created from sub_half_0002
-- VHDL created on Sun Sep 02 18:21:18 2018


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

entity sub_half_0002 is
    port (
        a : in std_logic_vector(15 downto 0);  -- float16_m10
        b : in std_logic_vector(15 downto 0);  -- float16_m10
        q : out std_logic_vector(15 downto 0);  -- float16_m10
        clk : in std_logic;
        areset : in std_logic
    );
end sub_half_0002;

architecture normal of sub_half_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracX_uid6_fpSubTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal expFracY_uid7_fpSubTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal xGTEy_uid8_fpSubTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal xGTEy_uid8_fpSubTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal xGTEy_uid8_fpSubTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal xGTEy_uid8_fpSubTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sigY_uid9_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal invSigY_uid10_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracY_uid11_fpSubTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expY_uid12_fpSubTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal ypn_uid13_fpSubTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal aSig_uid17_fpSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid17_fpSubTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal bSig_uid18_fpSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bSig_uid18_fpSubTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal cstAllOWE_uid19_fpSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cstZeroWF_uid20_fpSubTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal cstAllZWE_uid21_fpSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal exp_aSig_uid22_fpSubTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal exp_aSig_uid22_fpSubTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal frac_aSig_uid23_fpSubTest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal frac_aSig_uid23_fpSubTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal excZ_aSig_uid17_uid24_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid25_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid26_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid27_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_aSig_uid28_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid29_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid29_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid30_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid31_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_aSig_uid32_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_bSig_uid36_fpSubTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal exp_bSig_uid36_fpSubTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal frac_bSig_uid37_fpSubTest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal frac_bSig_uid37_fpSubTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal excZ_bSig_uid18_uid38_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid39_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid39_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid40_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid40_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid41_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_bSig_uid42_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid43_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid43_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid44_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid45_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_bSig_uid46_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigA_uid51_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sigB_uid52_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid53_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid53_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid57_fpSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid57_fpSubTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal oFracB_uid60_fpSubTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expAmExpB_uid61_fpSubTest_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expAmExpB_uid61_fpSubTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expAmExpB_uid61_fpSubTest_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expAmExpB_uid61_fpSubTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal cWFP2_uid62_fpSubTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal shiftedOut_uid64_fpSubTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid64_fpSubTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid64_fpSubTest_o : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid64_fpSubTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal padConst_uid65_fpSubTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightPaddedIn_uid66_fpSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal iShiftedOut_uid68_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal alignFracBPostShiftOut_uid69_fpSubTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal alignFracBPostShiftOut_uid69_fpSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cmpEQ_stickyBits_cZwF_uid72_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal cmpEQ_stickyBits_cZwF_uid72_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invCmpEQ_stickyBits_cZwF_uid73_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal effSubInvSticky_uid75_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zocst_uid77_fpSubTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracAAddOp_uid78_fpSubTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal fracBAddOp_uid81_fpSubTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal fracBAddOpPostXor_uid82_fpSubTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal fracBAddOpPostXor_uid82_fpSubTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal fracAddResult_uid83_fpSubTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal fracAddResult_uid83_fpSubTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal fracAddResult_uid83_fpSubTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal fracAddResult_uid83_fpSubTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid84_fpSubTest_in : STD_LOGIC_VECTOR (13 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid84_fpSubTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal fracGRS_uid85_fpSubTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal cAmA_uid87_fpSubTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal aMinusA_uid88_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNorm_uid90_fpSubTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal oneCST_uid91_fpSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expInc_uid92_fpSubTest_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expInc_uid92_fpSubTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expInc_uid92_fpSubTest_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expInc_uid92_fpSubTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expPostNorm_uid93_fpSubTest_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expPostNorm_uid93_fpSubTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expPostNorm_uid93_fpSubTest_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expPostNorm_uid93_fpSubTest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal Sticky0_uid94_fpSubTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky0_uid94_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky1_uid95_fpSubTest_in : STD_LOGIC_VECTOR (1 downto 0);
    signal Sticky1_uid95_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Round_uid96_fpSubTest_in : STD_LOGIC_VECTOR (2 downto 0);
    signal Round_uid96_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Guard_uid97_fpSubTest_in : STD_LOGIC_VECTOR (3 downto 0);
    signal Guard_uid97_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal LSB_uid98_fpSubTest_in : STD_LOGIC_VECTOR (4 downto 0);
    signal LSB_uid98_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rndBitCond_uid99_fpSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cRBit_uid100_fpSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rBi_uid101_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rBi_uid101_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid102_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNormRndRange_uid103_fpSubTest_in : STD_LOGIC_VECTOR (12 downto 0);
    signal fracPostNormRndRange_uid103_fpSubTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expFracR_uid104_fpSubTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rndExpFrac_uid105_fpSubTest_a : STD_LOGIC_VECTOR (18 downto 0);
    signal rndExpFrac_uid105_fpSubTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal rndExpFrac_uid105_fpSubTest_o : STD_LOGIC_VECTOR (18 downto 0);
    signal rndExpFrac_uid105_fpSubTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal wEP2AllOwE_uid106_fpSubTest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal rndExp_uid107_fpSubTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal rndExp_uid107_fpSubTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rOvfEQMax_uid108_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rndExpFracOvfBits_uid110_fpSubTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal rndExpFracOvfBits_uid110_fpSubTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rOvfExtraBits_uid111_fpSubTest_a : STD_LOGIC_VECTOR (3 downto 0);
    signal rOvfExtraBits_uid111_fpSubTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rOvfExtraBits_uid111_fpSubTest_o : STD_LOGIC_VECTOR (3 downto 0);
    signal rOvfExtraBits_uid111_fpSubTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal rOvf_uid112_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal wEP2AllZ_uid113_fpSubTest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal rUdfEQMin_uid115_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdfExtraBit_uid116_fpSubTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal rUdfExtraBit_uid116_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdf_uid117_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExc_uid118_fpSubTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal fracRPreExc_uid118_fpSubTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expRPreExc_uid119_fpSubTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal expRPreExc_uid119_fpSubTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal regInputs_uid120_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal regInputs_uid120_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZeroVInC_uid121_fpSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal excRZero_uid122_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rInfOvf_uid123_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfVInC_uid124_fpSubTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal excRInf_uid125_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN2_uid126_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAIBISub_uid127_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid128_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid129_fpSubTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid130_fpSubTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal invAMinusA_uid131_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRReg_uid132_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigBBInf_uid133_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigAAInf_uid134_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInf_uid135_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAZBZSigASigB_uid136_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excBZARSigA_uid137_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRZero_uid138_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid139_fpSubTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid139_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid140_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid141_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneFracRPostExc2_uid142_fpSubTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal fracRPostExc_uid145_fpSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid145_fpSubTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expRPostExc_uid149_fpSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid149_fpSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal R_uid150_fpSubTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal zs_uid152_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid153_lzCountVal_uid86_fpSubTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid154_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mO_uid155_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStage_uid156_lzCountVal_uid86_fpSubTest_in : STD_LOGIC_VECTOR (6 downto 0);
    signal vStage_uid156_lzCountVal_uid86_fpSubTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal cStage_uid157_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal vStagei_uid159_lzCountVal_uid86_fpSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid159_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid160_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid162_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid165_lzCountVal_uid86_fpSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid165_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid166_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid168_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid171_lzCountVal_uid86_fpSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid171_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid173_lzCountVal_uid86_fpSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid174_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid175_lzCountVal_uid86_fpSubTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal wIntCst_uid179_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal shiftedOut_uid180_alignmentShifter_uid65_fpSubTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid180_alignmentShifter_uid65_fpSubTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid180_alignmentShifter_uid65_fpSubTest_o : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid180_alignmentShifter_uid65_fpSubTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx1Rng8_uid181_alignmentShifter_uid65_fpSubTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal rightShiftStage0Idx1_uid183_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage0Idx2Rng16_uid184_alignmentShifter_uid65_fpSubTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rightShiftStage0Idx2Pad16_uid185_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx2_uid186_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage0Idx3_uid187_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage0_uid189_alignmentShifter_uid65_fpSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid189_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage1Idx1Rng2_uid190_alignmentShifter_uid65_fpSubTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal rightShiftStage1Idx1_uid192_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage1Idx2Rng4_uid193_alignmentShifter_uid65_fpSubTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal rightShiftStage1Idx2_uid195_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage1Idx3Rng6_uid196_alignmentShifter_uid65_fpSubTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal rightShiftStage1Idx3Pad6_uid197_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStage1Idx3_uid198_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage1_uid200_alignmentShifter_uid65_fpSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid200_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage2Idx1Rng1_uid201_alignmentShifter_uid65_fpSubTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal rightShiftStage2Idx1_uid203_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage2_uid205_alignmentShifter_uid65_fpSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid205_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal r_uid207_alignmentShifter_uid65_fpSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid207_alignmentShifter_uid65_fpSubTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal leftShiftStage0Idx1Rng4_uid212_fracPostNormExt_uid89_fpSubTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal leftShiftStage0Idx1Rng4_uid212_fracPostNormExt_uid89_fpSubTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal leftShiftStage0Idx1_uid213_fracPostNormExt_uid89_fpSubTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal leftShiftStage0Idx2_uid216_fracPostNormExt_uid89_fpSubTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal leftShiftStage0Idx3Rng12_uid218_fracPostNormExt_uid89_fpSubTest_in : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage0Idx3Rng12_uid218_fracPostNormExt_uid89_fpSubTest_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage0Idx3_uid219_fracPostNormExt_uid89_fpSubTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal leftShiftStage0_uid221_fracPostNormExt_uid89_fpSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid221_fracPostNormExt_uid89_fpSubTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal leftShiftStage1Idx1Rng1_uid223_fracPostNormExt_uid89_fpSubTest_in : STD_LOGIC_VECTOR (13 downto 0);
    signal leftShiftStage1Idx1Rng1_uid223_fracPostNormExt_uid89_fpSubTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal leftShiftStage1Idx1_uid224_fracPostNormExt_uid89_fpSubTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal leftShiftStage1Idx2Rng2_uid226_fracPostNormExt_uid89_fpSubTest_in : STD_LOGIC_VECTOR (12 downto 0);
    signal leftShiftStage1Idx2Rng2_uid226_fracPostNormExt_uid89_fpSubTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal leftShiftStage1Idx2_uid227_fracPostNormExt_uid89_fpSubTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal leftShiftStage1Idx3Pad3_uid228_fracPostNormExt_uid89_fpSubTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage1Idx3Rng3_uid229_fracPostNormExt_uid89_fpSubTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal leftShiftStage1Idx3Rng3_uid229_fracPostNormExt_uid89_fpSubTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal leftShiftStage1Idx3_uid230_fracPostNormExt_uid89_fpSubTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal leftShiftStage1_uid232_fracPostNormExt_uid89_fpSubTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid232_fracPostNormExt_uid89_fpSubTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal rightShiftStageSel4Dto3_uid188_alignmentShifter_uid65_fpSubTest_merged_bit_select_in : STD_LOGIC_VECTOR (4 downto 0);
    signal rightShiftStageSel4Dto3_uid188_alignmentShifter_uid65_fpSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel4Dto3_uid188_alignmentShifter_uid65_fpSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel4Dto3_uid188_alignmentShifter_uid65_fpSubTest_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal stickyBits_uid70_fpSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (9 downto 0);
    signal stickyBits_uid70_fpSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (12 downto 0);
    signal rVStage_uid161_lzCountVal_uid86_fpSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid161_lzCountVal_uid86_fpSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid167_lzCountVal_uid86_fpSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid167_lzCountVal_uid86_fpSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel3Dto2_uid220_fracPostNormExt_uid89_fpSubTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel3Dto2_uid220_fracPostNormExt_uid89_fpSubTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_stickyBits_uid70_fpSubTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist1_fracPostNormRndRange_uid103_fpSubTest_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist2_aMinusA_uid88_fpSubTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_effSub_uid53_fpSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sigB_uid52_fpSubTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_sigA_uid51_fpSubTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_InvExpXIsZero_uid45_fpSubTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_excI_bSig_uid42_fpSubTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_excZ_bSig_uid18_uid38_fpSubTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_excZ_bSig_uid18_uid38_fpSubTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_excI_aSig_uid28_fpSubTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_excZ_aSig_uid17_uid24_fpSubTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_frac_aSig_uid23_fpSubTest_b_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist13_exp_aSig_uid22_fpSubTest_b_1_q : STD_LOGIC_VECTOR (4 downto 0);

begin


    -- cAmA_uid87_fpSubTest(CONSTANT,86)
    cAmA_uid87_fpSubTest_q <= "1111";

    -- zs_uid152_lzCountVal_uid86_fpSubTest(CONSTANT,151)
    zs_uid152_lzCountVal_uid86_fpSubTest_q <= "00000000";

    -- sigY_uid9_fpSubTest(BITSELECT,8)@0
    sigY_uid9_fpSubTest_b <= STD_LOGIC_VECTOR(b(15 downto 15));

    -- invSigY_uid10_fpSubTest(LOGICAL,9)@0
    invSigY_uid10_fpSubTest_q <= not (sigY_uid9_fpSubTest_b);

    -- expY_uid12_fpSubTest(BITSELECT,11)@0
    expY_uid12_fpSubTest_b <= b(14 downto 10);

    -- fracY_uid11_fpSubTest(BITSELECT,10)@0
    fracY_uid11_fpSubTest_b <= b(9 downto 0);

    -- ypn_uid13_fpSubTest(BITJOIN,12)@0
    ypn_uid13_fpSubTest_q <= invSigY_uid10_fpSubTest_q & expY_uid12_fpSubTest_b & fracY_uid11_fpSubTest_b;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- expFracY_uid7_fpSubTest(BITSELECT,6)@0
    expFracY_uid7_fpSubTest_b <= b(14 downto 0);

    -- expFracX_uid6_fpSubTest(BITSELECT,5)@0
    expFracX_uid6_fpSubTest_b <= a(14 downto 0);

    -- xGTEy_uid8_fpSubTest(COMPARE,7)@0
    xGTEy_uid8_fpSubTest_a <= STD_LOGIC_VECTOR("00" & expFracX_uid6_fpSubTest_b);
    xGTEy_uid8_fpSubTest_b <= STD_LOGIC_VECTOR("00" & expFracY_uid7_fpSubTest_b);
    xGTEy_uid8_fpSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid8_fpSubTest_a) - UNSIGNED(xGTEy_uid8_fpSubTest_b));
    xGTEy_uid8_fpSubTest_n(0) <= not (xGTEy_uid8_fpSubTest_o(16));

    -- bSig_uid18_fpSubTest(MUX,17)@0
    bSig_uid18_fpSubTest_s <= xGTEy_uid8_fpSubTest_n;
    bSig_uid18_fpSubTest_combproc: PROCESS (bSig_uid18_fpSubTest_s, a, ypn_uid13_fpSubTest_q)
    BEGIN
        CASE (bSig_uid18_fpSubTest_s) IS
            WHEN "0" => bSig_uid18_fpSubTest_q <= a;
            WHEN "1" => bSig_uid18_fpSubTest_q <= ypn_uid13_fpSubTest_q;
            WHEN OTHERS => bSig_uid18_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigB_uid52_fpSubTest(BITSELECT,51)@0
    sigB_uid52_fpSubTest_b <= STD_LOGIC_VECTOR(bSig_uid18_fpSubTest_q(15 downto 15));

    -- aSig_uid17_fpSubTest(MUX,16)@0
    aSig_uid17_fpSubTest_s <= xGTEy_uid8_fpSubTest_n;
    aSig_uid17_fpSubTest_combproc: PROCESS (aSig_uid17_fpSubTest_s, ypn_uid13_fpSubTest_q, a)
    BEGIN
        CASE (aSig_uid17_fpSubTest_s) IS
            WHEN "0" => aSig_uid17_fpSubTest_q <= ypn_uid13_fpSubTest_q;
            WHEN "1" => aSig_uid17_fpSubTest_q <= a;
            WHEN OTHERS => aSig_uid17_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigA_uid51_fpSubTest(BITSELECT,50)@0
    sigA_uid51_fpSubTest_b <= STD_LOGIC_VECTOR(aSig_uid17_fpSubTest_q(15 downto 15));

    -- effSub_uid53_fpSubTest(LOGICAL,52)@0 + 1
    effSub_uid53_fpSubTest_qi <= sigA_uid51_fpSubTest_b xor sigB_uid52_fpSubTest_b;
    effSub_uid53_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid53_fpSubTest_qi, xout => effSub_uid53_fpSubTest_q, clk => clk, aclr => areset );

    -- exp_bSig_uid36_fpSubTest(BITSELECT,35)@0
    exp_bSig_uid36_fpSubTest_in <= bSig_uid18_fpSubTest_q(14 downto 0);
    exp_bSig_uid36_fpSubTest_b <= exp_bSig_uid36_fpSubTest_in(14 downto 10);

    -- exp_aSig_uid22_fpSubTest(BITSELECT,21)@0
    exp_aSig_uid22_fpSubTest_in <= aSig_uid17_fpSubTest_q(14 downto 0);
    exp_aSig_uid22_fpSubTest_b <= exp_aSig_uid22_fpSubTest_in(14 downto 10);

    -- expAmExpB_uid61_fpSubTest(SUB,60)@0
    expAmExpB_uid61_fpSubTest_a <= STD_LOGIC_VECTOR("0" & exp_aSig_uid22_fpSubTest_b);
    expAmExpB_uid61_fpSubTest_b <= STD_LOGIC_VECTOR("0" & exp_bSig_uid36_fpSubTest_b);
    expAmExpB_uid61_fpSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expAmExpB_uid61_fpSubTest_a) - UNSIGNED(expAmExpB_uid61_fpSubTest_b));
    expAmExpB_uid61_fpSubTest_q <= expAmExpB_uid61_fpSubTest_o(5 downto 0);

    -- cWFP2_uid62_fpSubTest(CONSTANT,61)
    cWFP2_uid62_fpSubTest_q <= "1100";

    -- shiftedOut_uid64_fpSubTest(COMPARE,63)@0
    shiftedOut_uid64_fpSubTest_a <= STD_LOGIC_VECTOR("0000" & cWFP2_uid62_fpSubTest_q);
    shiftedOut_uid64_fpSubTest_b <= STD_LOGIC_VECTOR("00" & expAmExpB_uid61_fpSubTest_q);
    shiftedOut_uid64_fpSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid64_fpSubTest_a) - UNSIGNED(shiftedOut_uid64_fpSubTest_b));
    shiftedOut_uid64_fpSubTest_c(0) <= shiftedOut_uid64_fpSubTest_o(7);

    -- iShiftedOut_uid68_fpSubTest(LOGICAL,67)@0
    iShiftedOut_uid68_fpSubTest_q <= not (shiftedOut_uid64_fpSubTest_c);

    -- rightShiftStage0Idx3_uid187_alignmentShifter_uid65_fpSubTest(CONSTANT,186)
    rightShiftStage0Idx3_uid187_alignmentShifter_uid65_fpSubTest_q <= "00000000000000000000000";

    -- rightShiftStage2Idx1Rng1_uid201_alignmentShifter_uid65_fpSubTest(BITSELECT,200)@0
    rightShiftStage2Idx1Rng1_uid201_alignmentShifter_uid65_fpSubTest_b <= rightShiftStage1_uid200_alignmentShifter_uid65_fpSubTest_q(22 downto 1);

    -- rightShiftStage2Idx1_uid203_alignmentShifter_uid65_fpSubTest(BITJOIN,202)@0
    rightShiftStage2Idx1_uid203_alignmentShifter_uid65_fpSubTest_q <= GND_q & rightShiftStage2Idx1Rng1_uid201_alignmentShifter_uid65_fpSubTest_b;

    -- rightShiftStage1Idx3Pad6_uid197_alignmentShifter_uid65_fpSubTest(CONSTANT,196)
    rightShiftStage1Idx3Pad6_uid197_alignmentShifter_uid65_fpSubTest_q <= "000000";

    -- rightShiftStage1Idx3Rng6_uid196_alignmentShifter_uid65_fpSubTest(BITSELECT,195)@0
    rightShiftStage1Idx3Rng6_uid196_alignmentShifter_uid65_fpSubTest_b <= rightShiftStage0_uid189_alignmentShifter_uid65_fpSubTest_q(22 downto 6);

    -- rightShiftStage1Idx3_uid198_alignmentShifter_uid65_fpSubTest(BITJOIN,197)@0
    rightShiftStage1Idx3_uid198_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage1Idx3Pad6_uid197_alignmentShifter_uid65_fpSubTest_q & rightShiftStage1Idx3Rng6_uid196_alignmentShifter_uid65_fpSubTest_b;

    -- zs_uid160_lzCountVal_uid86_fpSubTest(CONSTANT,159)
    zs_uid160_lzCountVal_uid86_fpSubTest_q <= "0000";

    -- rightShiftStage1Idx2Rng4_uid193_alignmentShifter_uid65_fpSubTest(BITSELECT,192)@0
    rightShiftStage1Idx2Rng4_uid193_alignmentShifter_uid65_fpSubTest_b <= rightShiftStage0_uid189_alignmentShifter_uid65_fpSubTest_q(22 downto 4);

    -- rightShiftStage1Idx2_uid195_alignmentShifter_uid65_fpSubTest(BITJOIN,194)@0
    rightShiftStage1Idx2_uid195_alignmentShifter_uid65_fpSubTest_q <= zs_uid160_lzCountVal_uid86_fpSubTest_q & rightShiftStage1Idx2Rng4_uid193_alignmentShifter_uid65_fpSubTest_b;

    -- zs_uid166_lzCountVal_uid86_fpSubTest(CONSTANT,165)
    zs_uid166_lzCountVal_uid86_fpSubTest_q <= "00";

    -- rightShiftStage1Idx1Rng2_uid190_alignmentShifter_uid65_fpSubTest(BITSELECT,189)@0
    rightShiftStage1Idx1Rng2_uid190_alignmentShifter_uid65_fpSubTest_b <= rightShiftStage0_uid189_alignmentShifter_uid65_fpSubTest_q(22 downto 2);

    -- rightShiftStage1Idx1_uid192_alignmentShifter_uid65_fpSubTest(BITJOIN,191)@0
    rightShiftStage1Idx1_uid192_alignmentShifter_uid65_fpSubTest_q <= zs_uid166_lzCountVal_uid86_fpSubTest_q & rightShiftStage1Idx1Rng2_uid190_alignmentShifter_uid65_fpSubTest_b;

    -- rightShiftStage0Idx2Pad16_uid185_alignmentShifter_uid65_fpSubTest(CONSTANT,184)
    rightShiftStage0Idx2Pad16_uid185_alignmentShifter_uid65_fpSubTest_q <= "0000000000000000";

    -- rightShiftStage0Idx2Rng16_uid184_alignmentShifter_uid65_fpSubTest(BITSELECT,183)@0
    rightShiftStage0Idx2Rng16_uid184_alignmentShifter_uid65_fpSubTest_b <= rightPaddedIn_uid66_fpSubTest_q(22 downto 16);

    -- rightShiftStage0Idx2_uid186_alignmentShifter_uid65_fpSubTest(BITJOIN,185)@0
    rightShiftStage0Idx2_uid186_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage0Idx2Pad16_uid185_alignmentShifter_uid65_fpSubTest_q & rightShiftStage0Idx2Rng16_uid184_alignmentShifter_uid65_fpSubTest_b;

    -- rightShiftStage0Idx1Rng8_uid181_alignmentShifter_uid65_fpSubTest(BITSELECT,180)@0
    rightShiftStage0Idx1Rng8_uid181_alignmentShifter_uid65_fpSubTest_b <= rightPaddedIn_uid66_fpSubTest_q(22 downto 8);

    -- rightShiftStage0Idx1_uid183_alignmentShifter_uid65_fpSubTest(BITJOIN,182)@0
    rightShiftStage0Idx1_uid183_alignmentShifter_uid65_fpSubTest_q <= zs_uid152_lzCountVal_uid86_fpSubTest_q & rightShiftStage0Idx1Rng8_uid181_alignmentShifter_uid65_fpSubTest_b;

    -- cstAllZWE_uid21_fpSubTest(CONSTANT,20)
    cstAllZWE_uid21_fpSubTest_q <= "00000";

    -- excZ_bSig_uid18_uid38_fpSubTest(LOGICAL,37)@0
    excZ_bSig_uid18_uid38_fpSubTest_q <= "1" WHEN exp_bSig_uid36_fpSubTest_b = cstAllZWE_uid21_fpSubTest_q ELSE "0";

    -- InvExpXIsZero_uid45_fpSubTest(LOGICAL,44)@0
    InvExpXIsZero_uid45_fpSubTest_q <= not (excZ_bSig_uid18_uid38_fpSubTest_q);

    -- cstZeroWF_uid20_fpSubTest(CONSTANT,19)
    cstZeroWF_uid20_fpSubTest_q <= "0000000000";

    -- frac_bSig_uid37_fpSubTest(BITSELECT,36)@0
    frac_bSig_uid37_fpSubTest_in <= bSig_uid18_fpSubTest_q(9 downto 0);
    frac_bSig_uid37_fpSubTest_b <= frac_bSig_uid37_fpSubTest_in(9 downto 0);

    -- fracBz_uid57_fpSubTest(MUX,56)@0
    fracBz_uid57_fpSubTest_s <= excZ_bSig_uid18_uid38_fpSubTest_q;
    fracBz_uid57_fpSubTest_combproc: PROCESS (fracBz_uid57_fpSubTest_s, frac_bSig_uid37_fpSubTest_b, cstZeroWF_uid20_fpSubTest_q)
    BEGIN
        CASE (fracBz_uid57_fpSubTest_s) IS
            WHEN "0" => fracBz_uid57_fpSubTest_q <= frac_bSig_uid37_fpSubTest_b;
            WHEN "1" => fracBz_uid57_fpSubTest_q <= cstZeroWF_uid20_fpSubTest_q;
            WHEN OTHERS => fracBz_uid57_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oFracB_uid60_fpSubTest(BITJOIN,59)@0
    oFracB_uid60_fpSubTest_q <= InvExpXIsZero_uid45_fpSubTest_q & fracBz_uid57_fpSubTest_q;

    -- padConst_uid65_fpSubTest(CONSTANT,64)
    padConst_uid65_fpSubTest_q <= "000000000000";

    -- rightPaddedIn_uid66_fpSubTest(BITJOIN,65)@0
    rightPaddedIn_uid66_fpSubTest_q <= oFracB_uid60_fpSubTest_q & padConst_uid65_fpSubTest_q;

    -- rightShiftStage0_uid189_alignmentShifter_uid65_fpSubTest(MUX,188)@0
    rightShiftStage0_uid189_alignmentShifter_uid65_fpSubTest_s <= rightShiftStageSel4Dto3_uid188_alignmentShifter_uid65_fpSubTest_merged_bit_select_b;
    rightShiftStage0_uid189_alignmentShifter_uid65_fpSubTest_combproc: PROCESS (rightShiftStage0_uid189_alignmentShifter_uid65_fpSubTest_s, rightPaddedIn_uid66_fpSubTest_q, rightShiftStage0Idx1_uid183_alignmentShifter_uid65_fpSubTest_q, rightShiftStage0Idx2_uid186_alignmentShifter_uid65_fpSubTest_q, rightShiftStage0Idx3_uid187_alignmentShifter_uid65_fpSubTest_q)
    BEGIN
        CASE (rightShiftStage0_uid189_alignmentShifter_uid65_fpSubTest_s) IS
            WHEN "00" => rightShiftStage0_uid189_alignmentShifter_uid65_fpSubTest_q <= rightPaddedIn_uid66_fpSubTest_q;
            WHEN "01" => rightShiftStage0_uid189_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage0Idx1_uid183_alignmentShifter_uid65_fpSubTest_q;
            WHEN "10" => rightShiftStage0_uid189_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage0Idx2_uid186_alignmentShifter_uid65_fpSubTest_q;
            WHEN "11" => rightShiftStage0_uid189_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage0Idx3_uid187_alignmentShifter_uid65_fpSubTest_q;
            WHEN OTHERS => rightShiftStage0_uid189_alignmentShifter_uid65_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid200_alignmentShifter_uid65_fpSubTest(MUX,199)@0
    rightShiftStage1_uid200_alignmentShifter_uid65_fpSubTest_s <= rightShiftStageSel4Dto3_uid188_alignmentShifter_uid65_fpSubTest_merged_bit_select_c;
    rightShiftStage1_uid200_alignmentShifter_uid65_fpSubTest_combproc: PROCESS (rightShiftStage1_uid200_alignmentShifter_uid65_fpSubTest_s, rightShiftStage0_uid189_alignmentShifter_uid65_fpSubTest_q, rightShiftStage1Idx1_uid192_alignmentShifter_uid65_fpSubTest_q, rightShiftStage1Idx2_uid195_alignmentShifter_uid65_fpSubTest_q, rightShiftStage1Idx3_uid198_alignmentShifter_uid65_fpSubTest_q)
    BEGIN
        CASE (rightShiftStage1_uid200_alignmentShifter_uid65_fpSubTest_s) IS
            WHEN "00" => rightShiftStage1_uid200_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage0_uid189_alignmentShifter_uid65_fpSubTest_q;
            WHEN "01" => rightShiftStage1_uid200_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage1Idx1_uid192_alignmentShifter_uid65_fpSubTest_q;
            WHEN "10" => rightShiftStage1_uid200_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage1Idx2_uid195_alignmentShifter_uid65_fpSubTest_q;
            WHEN "11" => rightShiftStage1_uid200_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage1Idx3_uid198_alignmentShifter_uid65_fpSubTest_q;
            WHEN OTHERS => rightShiftStage1_uid200_alignmentShifter_uid65_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStageSel4Dto3_uid188_alignmentShifter_uid65_fpSubTest_merged_bit_select(BITSELECT,233)@0
    rightShiftStageSel4Dto3_uid188_alignmentShifter_uid65_fpSubTest_merged_bit_select_in <= expAmExpB_uid61_fpSubTest_q(4 downto 0);
    rightShiftStageSel4Dto3_uid188_alignmentShifter_uid65_fpSubTest_merged_bit_select_b <= rightShiftStageSel4Dto3_uid188_alignmentShifter_uid65_fpSubTest_merged_bit_select_in(4 downto 3);
    rightShiftStageSel4Dto3_uid188_alignmentShifter_uid65_fpSubTest_merged_bit_select_c <= rightShiftStageSel4Dto3_uid188_alignmentShifter_uid65_fpSubTest_merged_bit_select_in(2 downto 1);
    rightShiftStageSel4Dto3_uid188_alignmentShifter_uid65_fpSubTest_merged_bit_select_d <= rightShiftStageSel4Dto3_uid188_alignmentShifter_uid65_fpSubTest_merged_bit_select_in(0 downto 0);

    -- rightShiftStage2_uid205_alignmentShifter_uid65_fpSubTest(MUX,204)@0
    rightShiftStage2_uid205_alignmentShifter_uid65_fpSubTest_s <= rightShiftStageSel4Dto3_uid188_alignmentShifter_uid65_fpSubTest_merged_bit_select_d;
    rightShiftStage2_uid205_alignmentShifter_uid65_fpSubTest_combproc: PROCESS (rightShiftStage2_uid205_alignmentShifter_uid65_fpSubTest_s, rightShiftStage1_uid200_alignmentShifter_uid65_fpSubTest_q, rightShiftStage2Idx1_uid203_alignmentShifter_uid65_fpSubTest_q)
    BEGIN
        CASE (rightShiftStage2_uid205_alignmentShifter_uid65_fpSubTest_s) IS
            WHEN "0" => rightShiftStage2_uid205_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage1_uid200_alignmentShifter_uid65_fpSubTest_q;
            WHEN "1" => rightShiftStage2_uid205_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage2Idx1_uid203_alignmentShifter_uid65_fpSubTest_q;
            WHEN OTHERS => rightShiftStage2_uid205_alignmentShifter_uid65_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- wIntCst_uid179_alignmentShifter_uid65_fpSubTest(CONSTANT,178)
    wIntCst_uid179_alignmentShifter_uid65_fpSubTest_q <= "10111";

    -- shiftedOut_uid180_alignmentShifter_uid65_fpSubTest(COMPARE,179)@0
    shiftedOut_uid180_alignmentShifter_uid65_fpSubTest_a <= STD_LOGIC_VECTOR("00" & expAmExpB_uid61_fpSubTest_q);
    shiftedOut_uid180_alignmentShifter_uid65_fpSubTest_b <= STD_LOGIC_VECTOR("000" & wIntCst_uid179_alignmentShifter_uid65_fpSubTest_q);
    shiftedOut_uid180_alignmentShifter_uid65_fpSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid180_alignmentShifter_uid65_fpSubTest_a) - UNSIGNED(shiftedOut_uid180_alignmentShifter_uid65_fpSubTest_b));
    shiftedOut_uid180_alignmentShifter_uid65_fpSubTest_n(0) <= not (shiftedOut_uid180_alignmentShifter_uid65_fpSubTest_o(7));

    -- r_uid207_alignmentShifter_uid65_fpSubTest(MUX,206)@0
    r_uid207_alignmentShifter_uid65_fpSubTest_s <= shiftedOut_uid180_alignmentShifter_uid65_fpSubTest_n;
    r_uid207_alignmentShifter_uid65_fpSubTest_combproc: PROCESS (r_uid207_alignmentShifter_uid65_fpSubTest_s, rightShiftStage2_uid205_alignmentShifter_uid65_fpSubTest_q, rightShiftStage0Idx3_uid187_alignmentShifter_uid65_fpSubTest_q)
    BEGIN
        CASE (r_uid207_alignmentShifter_uid65_fpSubTest_s) IS
            WHEN "0" => r_uid207_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage2_uid205_alignmentShifter_uid65_fpSubTest_q;
            WHEN "1" => r_uid207_alignmentShifter_uid65_fpSubTest_q <= rightShiftStage0Idx3_uid187_alignmentShifter_uid65_fpSubTest_q;
            WHEN OTHERS => r_uid207_alignmentShifter_uid65_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- alignFracBPostShiftOut_uid69_fpSubTest(LOGICAL,68)@0
    alignFracBPostShiftOut_uid69_fpSubTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 1 => iShiftedOut_uid68_fpSubTest_q(0)) & iShiftedOut_uid68_fpSubTest_q));
    alignFracBPostShiftOut_uid69_fpSubTest_q <= r_uid207_alignmentShifter_uid65_fpSubTest_q and alignFracBPostShiftOut_uid69_fpSubTest_b;

    -- stickyBits_uid70_fpSubTest_merged_bit_select(BITSELECT,234)@0
    stickyBits_uid70_fpSubTest_merged_bit_select_b <= alignFracBPostShiftOut_uid69_fpSubTest_q(9 downto 0);
    stickyBits_uid70_fpSubTest_merged_bit_select_c <= alignFracBPostShiftOut_uid69_fpSubTest_q(22 downto 10);

    -- redist0_stickyBits_uid70_fpSubTest_merged_bit_select_c_1(DELAY,238)
    redist0_stickyBits_uid70_fpSubTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => stickyBits_uid70_fpSubTest_merged_bit_select_c, xout => redist0_stickyBits_uid70_fpSubTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- fracBAddOp_uid81_fpSubTest(BITJOIN,80)@1
    fracBAddOp_uid81_fpSubTest_q <= GND_q & redist0_stickyBits_uid70_fpSubTest_merged_bit_select_c_1_q;

    -- fracBAddOpPostXor_uid82_fpSubTest(LOGICAL,81)@1
    fracBAddOpPostXor_uid82_fpSubTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 1 => effSub_uid53_fpSubTest_q(0)) & effSub_uid53_fpSubTest_q));
    fracBAddOpPostXor_uid82_fpSubTest_q <= fracBAddOp_uid81_fpSubTest_q xor fracBAddOpPostXor_uid82_fpSubTest_b;

    -- zocst_uid77_fpSubTest(CONSTANT,76)
    zocst_uid77_fpSubTest_q <= "01";

    -- frac_aSig_uid23_fpSubTest(BITSELECT,22)@0
    frac_aSig_uid23_fpSubTest_in <= aSig_uid17_fpSubTest_q(9 downto 0);
    frac_aSig_uid23_fpSubTest_b <= frac_aSig_uid23_fpSubTest_in(9 downto 0);

    -- redist12_frac_aSig_uid23_fpSubTest_b_1(DELAY,250)
    redist12_frac_aSig_uid23_fpSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 10, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_aSig_uid23_fpSubTest_b, xout => redist12_frac_aSig_uid23_fpSubTest_b_1_q, clk => clk, aclr => areset );

    -- cmpEQ_stickyBits_cZwF_uid72_fpSubTest(LOGICAL,71)@0 + 1
    cmpEQ_stickyBits_cZwF_uid72_fpSubTest_qi <= "1" WHEN stickyBits_uid70_fpSubTest_merged_bit_select_b = cstZeroWF_uid20_fpSubTest_q ELSE "0";
    cmpEQ_stickyBits_cZwF_uid72_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => cmpEQ_stickyBits_cZwF_uid72_fpSubTest_qi, xout => cmpEQ_stickyBits_cZwF_uid72_fpSubTest_q, clk => clk, aclr => areset );

    -- effSubInvSticky_uid75_fpSubTest(LOGICAL,74)@1
    effSubInvSticky_uid75_fpSubTest_q <= effSub_uid53_fpSubTest_q and cmpEQ_stickyBits_cZwF_uid72_fpSubTest_q;

    -- fracAAddOp_uid78_fpSubTest(BITJOIN,77)@1
    fracAAddOp_uid78_fpSubTest_q <= zocst_uid77_fpSubTest_q & redist12_frac_aSig_uid23_fpSubTest_b_1_q & GND_q & effSubInvSticky_uid75_fpSubTest_q;

    -- fracAddResult_uid83_fpSubTest(ADD,82)@1
    fracAddResult_uid83_fpSubTest_a <= STD_LOGIC_VECTOR("0" & fracAAddOp_uid78_fpSubTest_q);
    fracAddResult_uid83_fpSubTest_b <= STD_LOGIC_VECTOR("0" & fracBAddOpPostXor_uid82_fpSubTest_q);
    fracAddResult_uid83_fpSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(fracAddResult_uid83_fpSubTest_a) + UNSIGNED(fracAddResult_uid83_fpSubTest_b));
    fracAddResult_uid83_fpSubTest_q <= fracAddResult_uid83_fpSubTest_o(14 downto 0);

    -- rangeFracAddResultMwfp3Dto0_uid84_fpSubTest(BITSELECT,83)@1
    rangeFracAddResultMwfp3Dto0_uid84_fpSubTest_in <= fracAddResult_uid83_fpSubTest_q(13 downto 0);
    rangeFracAddResultMwfp3Dto0_uid84_fpSubTest_b <= rangeFracAddResultMwfp3Dto0_uid84_fpSubTest_in(13 downto 0);

    -- invCmpEQ_stickyBits_cZwF_uid73_fpSubTest(LOGICAL,72)@1
    invCmpEQ_stickyBits_cZwF_uid73_fpSubTest_q <= not (cmpEQ_stickyBits_cZwF_uid72_fpSubTest_q);

    -- fracGRS_uid85_fpSubTest(BITJOIN,84)@1
    fracGRS_uid85_fpSubTest_q <= rangeFracAddResultMwfp3Dto0_uid84_fpSubTest_b & invCmpEQ_stickyBits_cZwF_uid73_fpSubTest_q;

    -- rVStage_uid153_lzCountVal_uid86_fpSubTest(BITSELECT,152)@1
    rVStage_uid153_lzCountVal_uid86_fpSubTest_b <= fracGRS_uid85_fpSubTest_q(14 downto 7);

    -- vCount_uid154_lzCountVal_uid86_fpSubTest(LOGICAL,153)@1
    vCount_uid154_lzCountVal_uid86_fpSubTest_q <= "1" WHEN rVStage_uid153_lzCountVal_uid86_fpSubTest_b = zs_uid152_lzCountVal_uid86_fpSubTest_q ELSE "0";

    -- vStage_uid156_lzCountVal_uid86_fpSubTest(BITSELECT,155)@1
    vStage_uid156_lzCountVal_uid86_fpSubTest_in <= fracGRS_uid85_fpSubTest_q(6 downto 0);
    vStage_uid156_lzCountVal_uid86_fpSubTest_b <= vStage_uid156_lzCountVal_uid86_fpSubTest_in(6 downto 0);

    -- mO_uid155_lzCountVal_uid86_fpSubTest(CONSTANT,154)
    mO_uid155_lzCountVal_uid86_fpSubTest_q <= "1";

    -- cStage_uid157_lzCountVal_uid86_fpSubTest(BITJOIN,156)@1
    cStage_uid157_lzCountVal_uid86_fpSubTest_q <= vStage_uid156_lzCountVal_uid86_fpSubTest_b & mO_uid155_lzCountVal_uid86_fpSubTest_q;

    -- vStagei_uid159_lzCountVal_uid86_fpSubTest(MUX,158)@1
    vStagei_uid159_lzCountVal_uid86_fpSubTest_s <= vCount_uid154_lzCountVal_uid86_fpSubTest_q;
    vStagei_uid159_lzCountVal_uid86_fpSubTest_combproc: PROCESS (vStagei_uid159_lzCountVal_uid86_fpSubTest_s, rVStage_uid153_lzCountVal_uid86_fpSubTest_b, cStage_uid157_lzCountVal_uid86_fpSubTest_q)
    BEGIN
        CASE (vStagei_uid159_lzCountVal_uid86_fpSubTest_s) IS
            WHEN "0" => vStagei_uid159_lzCountVal_uid86_fpSubTest_q <= rVStage_uid153_lzCountVal_uid86_fpSubTest_b;
            WHEN "1" => vStagei_uid159_lzCountVal_uid86_fpSubTest_q <= cStage_uid157_lzCountVal_uid86_fpSubTest_q;
            WHEN OTHERS => vStagei_uid159_lzCountVal_uid86_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid161_lzCountVal_uid86_fpSubTest_merged_bit_select(BITSELECT,235)@1
    rVStage_uid161_lzCountVal_uid86_fpSubTest_merged_bit_select_b <= vStagei_uid159_lzCountVal_uid86_fpSubTest_q(7 downto 4);
    rVStage_uid161_lzCountVal_uid86_fpSubTest_merged_bit_select_c <= vStagei_uid159_lzCountVal_uid86_fpSubTest_q(3 downto 0);

    -- vCount_uid162_lzCountVal_uid86_fpSubTest(LOGICAL,161)@1
    vCount_uid162_lzCountVal_uid86_fpSubTest_q <= "1" WHEN rVStage_uid161_lzCountVal_uid86_fpSubTest_merged_bit_select_b = zs_uid160_lzCountVal_uid86_fpSubTest_q ELSE "0";

    -- vStagei_uid165_lzCountVal_uid86_fpSubTest(MUX,164)@1
    vStagei_uid165_lzCountVal_uid86_fpSubTest_s <= vCount_uid162_lzCountVal_uid86_fpSubTest_q;
    vStagei_uid165_lzCountVal_uid86_fpSubTest_combproc: PROCESS (vStagei_uid165_lzCountVal_uid86_fpSubTest_s, rVStage_uid161_lzCountVal_uid86_fpSubTest_merged_bit_select_b, rVStage_uid161_lzCountVal_uid86_fpSubTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid165_lzCountVal_uid86_fpSubTest_s) IS
            WHEN "0" => vStagei_uid165_lzCountVal_uid86_fpSubTest_q <= rVStage_uid161_lzCountVal_uid86_fpSubTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid165_lzCountVal_uid86_fpSubTest_q <= rVStage_uid161_lzCountVal_uid86_fpSubTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid165_lzCountVal_uid86_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid167_lzCountVal_uid86_fpSubTest_merged_bit_select(BITSELECT,236)@1
    rVStage_uid167_lzCountVal_uid86_fpSubTest_merged_bit_select_b <= vStagei_uid165_lzCountVal_uid86_fpSubTest_q(3 downto 2);
    rVStage_uid167_lzCountVal_uid86_fpSubTest_merged_bit_select_c <= vStagei_uid165_lzCountVal_uid86_fpSubTest_q(1 downto 0);

    -- vCount_uid168_lzCountVal_uid86_fpSubTest(LOGICAL,167)@1
    vCount_uid168_lzCountVal_uid86_fpSubTest_q <= "1" WHEN rVStage_uid167_lzCountVal_uid86_fpSubTest_merged_bit_select_b = zs_uid166_lzCountVal_uid86_fpSubTest_q ELSE "0";

    -- vStagei_uid171_lzCountVal_uid86_fpSubTest(MUX,170)@1
    vStagei_uid171_lzCountVal_uid86_fpSubTest_s <= vCount_uid168_lzCountVal_uid86_fpSubTest_q;
    vStagei_uid171_lzCountVal_uid86_fpSubTest_combproc: PROCESS (vStagei_uid171_lzCountVal_uid86_fpSubTest_s, rVStage_uid167_lzCountVal_uid86_fpSubTest_merged_bit_select_b, rVStage_uid167_lzCountVal_uid86_fpSubTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid171_lzCountVal_uid86_fpSubTest_s) IS
            WHEN "0" => vStagei_uid171_lzCountVal_uid86_fpSubTest_q <= rVStage_uid167_lzCountVal_uid86_fpSubTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid171_lzCountVal_uid86_fpSubTest_q <= rVStage_uid167_lzCountVal_uid86_fpSubTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid171_lzCountVal_uid86_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid173_lzCountVal_uid86_fpSubTest(BITSELECT,172)@1
    rVStage_uid173_lzCountVal_uid86_fpSubTest_b <= vStagei_uid171_lzCountVal_uid86_fpSubTest_q(1 downto 1);

    -- vCount_uid174_lzCountVal_uid86_fpSubTest(LOGICAL,173)@1
    vCount_uid174_lzCountVal_uid86_fpSubTest_q <= "1" WHEN rVStage_uid173_lzCountVal_uid86_fpSubTest_b = GND_q ELSE "0";

    -- r_uid175_lzCountVal_uid86_fpSubTest(BITJOIN,174)@1
    r_uid175_lzCountVal_uid86_fpSubTest_q <= vCount_uid154_lzCountVal_uid86_fpSubTest_q & vCount_uid162_lzCountVal_uid86_fpSubTest_q & vCount_uid168_lzCountVal_uid86_fpSubTest_q & vCount_uid174_lzCountVal_uid86_fpSubTest_q;

    -- aMinusA_uid88_fpSubTest(LOGICAL,87)@1
    aMinusA_uid88_fpSubTest_q <= "1" WHEN r_uid175_lzCountVal_uid86_fpSubTest_q = cAmA_uid87_fpSubTest_q ELSE "0";

    -- invAMinusA_uid131_fpSubTest(LOGICAL,130)@1
    invAMinusA_uid131_fpSubTest_q <= not (aMinusA_uid88_fpSubTest_q);

    -- redist5_sigA_uid51_fpSubTest_b_1(DELAY,243)
    redist5_sigA_uid51_fpSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigA_uid51_fpSubTest_b, xout => redist5_sigA_uid51_fpSubTest_b_1_q, clk => clk, aclr => areset );

    -- cstAllOWE_uid19_fpSubTest(CONSTANT,18)
    cstAllOWE_uid19_fpSubTest_q <= "11111";

    -- expXIsMax_uid39_fpSubTest(LOGICAL,38)@0 + 1
    expXIsMax_uid39_fpSubTest_qi <= "1" WHEN exp_bSig_uid36_fpSubTest_b = cstAllOWE_uid19_fpSubTest_q ELSE "0";
    expXIsMax_uid39_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid39_fpSubTest_qi, xout => expXIsMax_uid39_fpSubTest_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid44_fpSubTest(LOGICAL,43)@1
    invExpXIsMax_uid44_fpSubTest_q <= not (expXIsMax_uid39_fpSubTest_q);

    -- redist6_InvExpXIsZero_uid45_fpSubTest_q_1(DELAY,244)
    redist6_InvExpXIsZero_uid45_fpSubTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => InvExpXIsZero_uid45_fpSubTest_q, xout => redist6_InvExpXIsZero_uid45_fpSubTest_q_1_q, clk => clk, aclr => areset );

    -- excR_bSig_uid46_fpSubTest(LOGICAL,45)@1
    excR_bSig_uid46_fpSubTest_q <= redist6_InvExpXIsZero_uid45_fpSubTest_q_1_q and invExpXIsMax_uid44_fpSubTest_q;

    -- redist13_exp_aSig_uid22_fpSubTest_b_1(DELAY,251)
    redist13_exp_aSig_uid22_fpSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_aSig_uid22_fpSubTest_b, xout => redist13_exp_aSig_uid22_fpSubTest_b_1_q, clk => clk, aclr => areset );

    -- expXIsMax_uid25_fpSubTest(LOGICAL,24)@1
    expXIsMax_uid25_fpSubTest_q <= "1" WHEN redist13_exp_aSig_uid22_fpSubTest_b_1_q = cstAllOWE_uid19_fpSubTest_q ELSE "0";

    -- invExpXIsMax_uid30_fpSubTest(LOGICAL,29)@1
    invExpXIsMax_uid30_fpSubTest_q <= not (expXIsMax_uid25_fpSubTest_q);

    -- excZ_aSig_uid17_uid24_fpSubTest(LOGICAL,23)@1
    excZ_aSig_uid17_uid24_fpSubTest_q <= "1" WHEN redist13_exp_aSig_uid22_fpSubTest_b_1_q = cstAllZWE_uid21_fpSubTest_q ELSE "0";

    -- InvExpXIsZero_uid31_fpSubTest(LOGICAL,30)@1
    InvExpXIsZero_uid31_fpSubTest_q <= not (excZ_aSig_uid17_uid24_fpSubTest_q);

    -- excR_aSig_uid32_fpSubTest(LOGICAL,31)@1
    excR_aSig_uid32_fpSubTest_q <= InvExpXIsZero_uid31_fpSubTest_q and invExpXIsMax_uid30_fpSubTest_q;

    -- signRReg_uid132_fpSubTest(LOGICAL,131)@1
    signRReg_uid132_fpSubTest_q <= excR_aSig_uid32_fpSubTest_q and excR_bSig_uid46_fpSubTest_q and redist5_sigA_uid51_fpSubTest_b_1_q and invAMinusA_uid131_fpSubTest_q;

    -- redist4_sigB_uid52_fpSubTest_b_1(DELAY,242)
    redist4_sigB_uid52_fpSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigB_uid52_fpSubTest_b, xout => redist4_sigB_uid52_fpSubTest_b_1_q, clk => clk, aclr => areset );

    -- redist8_excZ_bSig_uid18_uid38_fpSubTest_q_1(DELAY,246)
    redist8_excZ_bSig_uid18_uid38_fpSubTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_bSig_uid18_uid38_fpSubTest_q, xout => redist8_excZ_bSig_uid18_uid38_fpSubTest_q_1_q, clk => clk, aclr => areset );

    -- excAZBZSigASigB_uid136_fpSubTest(LOGICAL,135)@1
    excAZBZSigASigB_uid136_fpSubTest_q <= excZ_aSig_uid17_uid24_fpSubTest_q and redist8_excZ_bSig_uid18_uid38_fpSubTest_q_1_q and redist5_sigA_uid51_fpSubTest_b_1_q and redist4_sigB_uid52_fpSubTest_b_1_q;

    -- excBZARSigA_uid137_fpSubTest(LOGICAL,136)@1
    excBZARSigA_uid137_fpSubTest_q <= redist8_excZ_bSig_uid18_uid38_fpSubTest_q_1_q and excR_aSig_uid32_fpSubTest_q and redist5_sigA_uid51_fpSubTest_b_1_q;

    -- signRZero_uid138_fpSubTest(LOGICAL,137)@1
    signRZero_uid138_fpSubTest_q <= excBZARSigA_uid137_fpSubTest_q or excAZBZSigASigB_uid136_fpSubTest_q;

    -- fracXIsZero_uid40_fpSubTest(LOGICAL,39)@0 + 1
    fracXIsZero_uid40_fpSubTest_qi <= "1" WHEN cstZeroWF_uid20_fpSubTest_q = frac_bSig_uid37_fpSubTest_b ELSE "0";
    fracXIsZero_uid40_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid40_fpSubTest_qi, xout => fracXIsZero_uid40_fpSubTest_q, clk => clk, aclr => areset );

    -- excI_bSig_uid42_fpSubTest(LOGICAL,41)@1
    excI_bSig_uid42_fpSubTest_q <= expXIsMax_uid39_fpSubTest_q and fracXIsZero_uid40_fpSubTest_q;

    -- sigBBInf_uid133_fpSubTest(LOGICAL,132)@1
    sigBBInf_uid133_fpSubTest_q <= redist4_sigB_uid52_fpSubTest_b_1_q and excI_bSig_uid42_fpSubTest_q;

    -- fracXIsZero_uid26_fpSubTest(LOGICAL,25)@1
    fracXIsZero_uid26_fpSubTest_q <= "1" WHEN cstZeroWF_uid20_fpSubTest_q = redist12_frac_aSig_uid23_fpSubTest_b_1_q ELSE "0";

    -- excI_aSig_uid28_fpSubTest(LOGICAL,27)@1
    excI_aSig_uid28_fpSubTest_q <= expXIsMax_uid25_fpSubTest_q and fracXIsZero_uid26_fpSubTest_q;

    -- sigAAInf_uid134_fpSubTest(LOGICAL,133)@1
    sigAAInf_uid134_fpSubTest_q <= redist5_sigA_uid51_fpSubTest_b_1_q and excI_aSig_uid28_fpSubTest_q;

    -- signRInf_uid135_fpSubTest(LOGICAL,134)@1
    signRInf_uid135_fpSubTest_q <= sigAAInf_uid134_fpSubTest_q or sigBBInf_uid133_fpSubTest_q;

    -- signRInfRZRReg_uid139_fpSubTest(LOGICAL,138)@1 + 1
    signRInfRZRReg_uid139_fpSubTest_qi <= signRInf_uid135_fpSubTest_q or signRZero_uid138_fpSubTest_q or signRReg_uid132_fpSubTest_q;
    signRInfRZRReg_uid139_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRInfRZRReg_uid139_fpSubTest_qi, xout => signRInfRZRReg_uid139_fpSubTest_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid41_fpSubTest(LOGICAL,40)@1
    fracXIsNotZero_uid41_fpSubTest_q <= not (fracXIsZero_uid40_fpSubTest_q);

    -- excN_bSig_uid43_fpSubTest(LOGICAL,42)@1 + 1
    excN_bSig_uid43_fpSubTest_qi <= expXIsMax_uid39_fpSubTest_q and fracXIsNotZero_uid41_fpSubTest_q;
    excN_bSig_uid43_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_bSig_uid43_fpSubTest_qi, xout => excN_bSig_uid43_fpSubTest_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid27_fpSubTest(LOGICAL,26)@1
    fracXIsNotZero_uid27_fpSubTest_q <= not (fracXIsZero_uid26_fpSubTest_q);

    -- excN_aSig_uid29_fpSubTest(LOGICAL,28)@1 + 1
    excN_aSig_uid29_fpSubTest_qi <= expXIsMax_uid25_fpSubTest_q and fracXIsNotZero_uid27_fpSubTest_q;
    excN_aSig_uid29_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_aSig_uid29_fpSubTest_qi, xout => excN_aSig_uid29_fpSubTest_q, clk => clk, aclr => areset );

    -- excRNaN2_uid126_fpSubTest(LOGICAL,125)@2
    excRNaN2_uid126_fpSubTest_q <= excN_aSig_uid29_fpSubTest_q or excN_bSig_uid43_fpSubTest_q;

    -- redist3_effSub_uid53_fpSubTest_q_2(DELAY,241)
    redist3_effSub_uid53_fpSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid53_fpSubTest_q, xout => redist3_effSub_uid53_fpSubTest_q_2_q, clk => clk, aclr => areset );

    -- redist7_excI_bSig_uid42_fpSubTest_q_1(DELAY,245)
    redist7_excI_bSig_uid42_fpSubTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_bSig_uid42_fpSubTest_q, xout => redist7_excI_bSig_uid42_fpSubTest_q_1_q, clk => clk, aclr => areset );

    -- redist10_excI_aSig_uid28_fpSubTest_q_1(DELAY,248)
    redist10_excI_aSig_uid28_fpSubTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_aSig_uid28_fpSubTest_q, xout => redist10_excI_aSig_uid28_fpSubTest_q_1_q, clk => clk, aclr => areset );

    -- excAIBISub_uid127_fpSubTest(LOGICAL,126)@2
    excAIBISub_uid127_fpSubTest_q <= redist10_excI_aSig_uid28_fpSubTest_q_1_q and redist7_excI_bSig_uid42_fpSubTest_q_1_q and redist3_effSub_uid53_fpSubTest_q_2_q;

    -- excRNaN_uid128_fpSubTest(LOGICAL,127)@2
    excRNaN_uid128_fpSubTest_q <= excAIBISub_uid127_fpSubTest_q or excRNaN2_uid126_fpSubTest_q;

    -- invExcRNaN_uid140_fpSubTest(LOGICAL,139)@2
    invExcRNaN_uid140_fpSubTest_q <= not (excRNaN_uid128_fpSubTest_q);

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signRPostExc_uid141_fpSubTest(LOGICAL,140)@2
    signRPostExc_uid141_fpSubTest_q <= invExcRNaN_uid140_fpSubTest_q and signRInfRZRReg_uid139_fpSubTest_q;

    -- cRBit_uid100_fpSubTest(CONSTANT,99)
    cRBit_uid100_fpSubTest_q <= "01000";

    -- leftShiftStage1Idx3Rng3_uid229_fracPostNormExt_uid89_fpSubTest(BITSELECT,228)@1
    leftShiftStage1Idx3Rng3_uid229_fracPostNormExt_uid89_fpSubTest_in <= leftShiftStage0_uid221_fracPostNormExt_uid89_fpSubTest_q(11 downto 0);
    leftShiftStage1Idx3Rng3_uid229_fracPostNormExt_uid89_fpSubTest_b <= leftShiftStage1Idx3Rng3_uid229_fracPostNormExt_uid89_fpSubTest_in(11 downto 0);

    -- leftShiftStage1Idx3Pad3_uid228_fracPostNormExt_uid89_fpSubTest(CONSTANT,227)
    leftShiftStage1Idx3Pad3_uid228_fracPostNormExt_uid89_fpSubTest_q <= "000";

    -- leftShiftStage1Idx3_uid230_fracPostNormExt_uid89_fpSubTest(BITJOIN,229)@1
    leftShiftStage1Idx3_uid230_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage1Idx3Rng3_uid229_fracPostNormExt_uid89_fpSubTest_b & leftShiftStage1Idx3Pad3_uid228_fracPostNormExt_uid89_fpSubTest_q;

    -- leftShiftStage1Idx2Rng2_uid226_fracPostNormExt_uid89_fpSubTest(BITSELECT,225)@1
    leftShiftStage1Idx2Rng2_uid226_fracPostNormExt_uid89_fpSubTest_in <= leftShiftStage0_uid221_fracPostNormExt_uid89_fpSubTest_q(12 downto 0);
    leftShiftStage1Idx2Rng2_uid226_fracPostNormExt_uid89_fpSubTest_b <= leftShiftStage1Idx2Rng2_uid226_fracPostNormExt_uid89_fpSubTest_in(12 downto 0);

    -- leftShiftStage1Idx2_uid227_fracPostNormExt_uid89_fpSubTest(BITJOIN,226)@1
    leftShiftStage1Idx2_uid227_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage1Idx2Rng2_uid226_fracPostNormExt_uid89_fpSubTest_b & zs_uid166_lzCountVal_uid86_fpSubTest_q;

    -- leftShiftStage1Idx1Rng1_uid223_fracPostNormExt_uid89_fpSubTest(BITSELECT,222)@1
    leftShiftStage1Idx1Rng1_uid223_fracPostNormExt_uid89_fpSubTest_in <= leftShiftStage0_uid221_fracPostNormExt_uid89_fpSubTest_q(13 downto 0);
    leftShiftStage1Idx1Rng1_uid223_fracPostNormExt_uid89_fpSubTest_b <= leftShiftStage1Idx1Rng1_uid223_fracPostNormExt_uid89_fpSubTest_in(13 downto 0);

    -- leftShiftStage1Idx1_uid224_fracPostNormExt_uid89_fpSubTest(BITJOIN,223)@1
    leftShiftStage1Idx1_uid224_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage1Idx1Rng1_uid223_fracPostNormExt_uid89_fpSubTest_b & GND_q;

    -- leftShiftStage0Idx3Rng12_uid218_fracPostNormExt_uid89_fpSubTest(BITSELECT,217)@1
    leftShiftStage0Idx3Rng12_uid218_fracPostNormExt_uid89_fpSubTest_in <= fracGRS_uid85_fpSubTest_q(2 downto 0);
    leftShiftStage0Idx3Rng12_uid218_fracPostNormExt_uid89_fpSubTest_b <= leftShiftStage0Idx3Rng12_uid218_fracPostNormExt_uid89_fpSubTest_in(2 downto 0);

    -- leftShiftStage0Idx3_uid219_fracPostNormExt_uid89_fpSubTest(BITJOIN,218)@1
    leftShiftStage0Idx3_uid219_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage0Idx3Rng12_uid218_fracPostNormExt_uid89_fpSubTest_b & padConst_uid65_fpSubTest_q;

    -- leftShiftStage0Idx2_uid216_fracPostNormExt_uid89_fpSubTest(BITJOIN,215)@1
    leftShiftStage0Idx2_uid216_fracPostNormExt_uid89_fpSubTest_q <= vStage_uid156_lzCountVal_uid86_fpSubTest_b & zs_uid152_lzCountVal_uid86_fpSubTest_q;

    -- leftShiftStage0Idx1Rng4_uid212_fracPostNormExt_uid89_fpSubTest(BITSELECT,211)@1
    leftShiftStage0Idx1Rng4_uid212_fracPostNormExt_uid89_fpSubTest_in <= fracGRS_uid85_fpSubTest_q(10 downto 0);
    leftShiftStage0Idx1Rng4_uid212_fracPostNormExt_uid89_fpSubTest_b <= leftShiftStage0Idx1Rng4_uid212_fracPostNormExt_uid89_fpSubTest_in(10 downto 0);

    -- leftShiftStage0Idx1_uid213_fracPostNormExt_uid89_fpSubTest(BITJOIN,212)@1
    leftShiftStage0Idx1_uid213_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage0Idx1Rng4_uid212_fracPostNormExt_uid89_fpSubTest_b & zs_uid160_lzCountVal_uid86_fpSubTest_q;

    -- leftShiftStage0_uid221_fracPostNormExt_uid89_fpSubTest(MUX,220)@1
    leftShiftStage0_uid221_fracPostNormExt_uid89_fpSubTest_s <= leftShiftStageSel3Dto2_uid220_fracPostNormExt_uid89_fpSubTest_merged_bit_select_b;
    leftShiftStage0_uid221_fracPostNormExt_uid89_fpSubTest_combproc: PROCESS (leftShiftStage0_uid221_fracPostNormExt_uid89_fpSubTest_s, fracGRS_uid85_fpSubTest_q, leftShiftStage0Idx1_uid213_fracPostNormExt_uid89_fpSubTest_q, leftShiftStage0Idx2_uid216_fracPostNormExt_uid89_fpSubTest_q, leftShiftStage0Idx3_uid219_fracPostNormExt_uid89_fpSubTest_q)
    BEGIN
        CASE (leftShiftStage0_uid221_fracPostNormExt_uid89_fpSubTest_s) IS
            WHEN "00" => leftShiftStage0_uid221_fracPostNormExt_uid89_fpSubTest_q <= fracGRS_uid85_fpSubTest_q;
            WHEN "01" => leftShiftStage0_uid221_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage0Idx1_uid213_fracPostNormExt_uid89_fpSubTest_q;
            WHEN "10" => leftShiftStage0_uid221_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage0Idx2_uid216_fracPostNormExt_uid89_fpSubTest_q;
            WHEN "11" => leftShiftStage0_uid221_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage0Idx3_uid219_fracPostNormExt_uid89_fpSubTest_q;
            WHEN OTHERS => leftShiftStage0_uid221_fracPostNormExt_uid89_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStageSel3Dto2_uid220_fracPostNormExt_uid89_fpSubTest_merged_bit_select(BITSELECT,237)@1
    leftShiftStageSel3Dto2_uid220_fracPostNormExt_uid89_fpSubTest_merged_bit_select_b <= r_uid175_lzCountVal_uid86_fpSubTest_q(3 downto 2);
    leftShiftStageSel3Dto2_uid220_fracPostNormExt_uid89_fpSubTest_merged_bit_select_c <= r_uid175_lzCountVal_uid86_fpSubTest_q(1 downto 0);

    -- leftShiftStage1_uid232_fracPostNormExt_uid89_fpSubTest(MUX,231)@1
    leftShiftStage1_uid232_fracPostNormExt_uid89_fpSubTest_s <= leftShiftStageSel3Dto2_uid220_fracPostNormExt_uid89_fpSubTest_merged_bit_select_c;
    leftShiftStage1_uid232_fracPostNormExt_uid89_fpSubTest_combproc: PROCESS (leftShiftStage1_uid232_fracPostNormExt_uid89_fpSubTest_s, leftShiftStage0_uid221_fracPostNormExt_uid89_fpSubTest_q, leftShiftStage1Idx1_uid224_fracPostNormExt_uid89_fpSubTest_q, leftShiftStage1Idx2_uid227_fracPostNormExt_uid89_fpSubTest_q, leftShiftStage1Idx3_uid230_fracPostNormExt_uid89_fpSubTest_q)
    BEGIN
        CASE (leftShiftStage1_uid232_fracPostNormExt_uid89_fpSubTest_s) IS
            WHEN "00" => leftShiftStage1_uid232_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage0_uid221_fracPostNormExt_uid89_fpSubTest_q;
            WHEN "01" => leftShiftStage1_uid232_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage1Idx1_uid224_fracPostNormExt_uid89_fpSubTest_q;
            WHEN "10" => leftShiftStage1_uid232_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage1Idx2_uid227_fracPostNormExt_uid89_fpSubTest_q;
            WHEN "11" => leftShiftStage1_uid232_fracPostNormExt_uid89_fpSubTest_q <= leftShiftStage1Idx3_uid230_fracPostNormExt_uid89_fpSubTest_q;
            WHEN OTHERS => leftShiftStage1_uid232_fracPostNormExt_uid89_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- LSB_uid98_fpSubTest(BITSELECT,97)@1
    LSB_uid98_fpSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid232_fracPostNormExt_uid89_fpSubTest_q(4 downto 0));
    LSB_uid98_fpSubTest_b <= STD_LOGIC_VECTOR(LSB_uid98_fpSubTest_in(4 downto 4));

    -- Guard_uid97_fpSubTest(BITSELECT,96)@1
    Guard_uid97_fpSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid232_fracPostNormExt_uid89_fpSubTest_q(3 downto 0));
    Guard_uid97_fpSubTest_b <= STD_LOGIC_VECTOR(Guard_uid97_fpSubTest_in(3 downto 3));

    -- Round_uid96_fpSubTest(BITSELECT,95)@1
    Round_uid96_fpSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid232_fracPostNormExt_uid89_fpSubTest_q(2 downto 0));
    Round_uid96_fpSubTest_b <= STD_LOGIC_VECTOR(Round_uid96_fpSubTest_in(2 downto 2));

    -- Sticky1_uid95_fpSubTest(BITSELECT,94)@1
    Sticky1_uid95_fpSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid232_fracPostNormExt_uid89_fpSubTest_q(1 downto 0));
    Sticky1_uid95_fpSubTest_b <= STD_LOGIC_VECTOR(Sticky1_uid95_fpSubTest_in(1 downto 1));

    -- Sticky0_uid94_fpSubTest(BITSELECT,93)@1
    Sticky0_uid94_fpSubTest_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid232_fracPostNormExt_uid89_fpSubTest_q(0 downto 0));
    Sticky0_uid94_fpSubTest_b <= STD_LOGIC_VECTOR(Sticky0_uid94_fpSubTest_in(0 downto 0));

    -- rndBitCond_uid99_fpSubTest(BITJOIN,98)@1
    rndBitCond_uid99_fpSubTest_q <= LSB_uid98_fpSubTest_b & Guard_uid97_fpSubTest_b & Round_uid96_fpSubTest_b & Sticky1_uid95_fpSubTest_b & Sticky0_uid94_fpSubTest_b;

    -- rBi_uid101_fpSubTest(LOGICAL,100)@1 + 1
    rBi_uid101_fpSubTest_qi <= "1" WHEN rndBitCond_uid99_fpSubTest_q = cRBit_uid100_fpSubTest_q ELSE "0";
    rBi_uid101_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rBi_uid101_fpSubTest_qi, xout => rBi_uid101_fpSubTest_q, clk => clk, aclr => areset );

    -- roundBit_uid102_fpSubTest(LOGICAL,101)@2
    roundBit_uid102_fpSubTest_q <= not (rBi_uid101_fpSubTest_q);

    -- oneCST_uid91_fpSubTest(CONSTANT,90)
    oneCST_uid91_fpSubTest_q <= "00001";

    -- expInc_uid92_fpSubTest(ADD,91)@1
    expInc_uid92_fpSubTest_a <= STD_LOGIC_VECTOR("0" & redist13_exp_aSig_uid22_fpSubTest_b_1_q);
    expInc_uid92_fpSubTest_b <= STD_LOGIC_VECTOR("0" & oneCST_uid91_fpSubTest_q);
    expInc_uid92_fpSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expInc_uid92_fpSubTest_a) + UNSIGNED(expInc_uid92_fpSubTest_b));
    expInc_uid92_fpSubTest_q <= expInc_uid92_fpSubTest_o(5 downto 0);

    -- expPostNorm_uid93_fpSubTest(SUB,92)@1 + 1
    expPostNorm_uid93_fpSubTest_a <= STD_LOGIC_VECTOR("0" & expInc_uid92_fpSubTest_q);
    expPostNorm_uid93_fpSubTest_b <= STD_LOGIC_VECTOR("000" & r_uid175_lzCountVal_uid86_fpSubTest_q);
    expPostNorm_uid93_fpSubTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPostNorm_uid93_fpSubTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expPostNorm_uid93_fpSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNorm_uid93_fpSubTest_a) - UNSIGNED(expPostNorm_uid93_fpSubTest_b));
        END IF;
    END PROCESS;
    expPostNorm_uid93_fpSubTest_q <= expPostNorm_uid93_fpSubTest_o(6 downto 0);

    -- fracPostNorm_uid90_fpSubTest(BITSELECT,89)@1
    fracPostNorm_uid90_fpSubTest_b <= leftShiftStage1_uid232_fracPostNormExt_uid89_fpSubTest_q(14 downto 1);

    -- fracPostNormRndRange_uid103_fpSubTest(BITSELECT,102)@1
    fracPostNormRndRange_uid103_fpSubTest_in <= fracPostNorm_uid90_fpSubTest_b(12 downto 0);
    fracPostNormRndRange_uid103_fpSubTest_b <= fracPostNormRndRange_uid103_fpSubTest_in(12 downto 2);

    -- redist1_fracPostNormRndRange_uid103_fpSubTest_b_1(DELAY,239)
    redist1_fracPostNormRndRange_uid103_fpSubTest_b_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracPostNormRndRange_uid103_fpSubTest_b, xout => redist1_fracPostNormRndRange_uid103_fpSubTest_b_1_q, clk => clk, aclr => areset );

    -- expFracR_uid104_fpSubTest(BITJOIN,103)@2
    expFracR_uid104_fpSubTest_q <= expPostNorm_uid93_fpSubTest_q & redist1_fracPostNormRndRange_uid103_fpSubTest_b_1_q;

    -- rndExpFrac_uid105_fpSubTest(ADD,104)@2
    rndExpFrac_uid105_fpSubTest_a <= STD_LOGIC_VECTOR("0" & expFracR_uid104_fpSubTest_q);
    rndExpFrac_uid105_fpSubTest_b <= STD_LOGIC_VECTOR("000000000000000000" & roundBit_uid102_fpSubTest_q);
    rndExpFrac_uid105_fpSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(rndExpFrac_uid105_fpSubTest_a) + UNSIGNED(rndExpFrac_uid105_fpSubTest_b));
    rndExpFrac_uid105_fpSubTest_q <= rndExpFrac_uid105_fpSubTest_o(18 downto 0);

    -- expRPreExc_uid119_fpSubTest(BITSELECT,118)@2
    expRPreExc_uid119_fpSubTest_in <= rndExpFrac_uid105_fpSubTest_q(15 downto 0);
    expRPreExc_uid119_fpSubTest_b <= expRPreExc_uid119_fpSubTest_in(15 downto 11);

    -- rndExpFracOvfBits_uid110_fpSubTest(BITSELECT,109)@2
    rndExpFracOvfBits_uid110_fpSubTest_in <= rndExpFrac_uid105_fpSubTest_q(17 downto 0);
    rndExpFracOvfBits_uid110_fpSubTest_b <= rndExpFracOvfBits_uid110_fpSubTest_in(17 downto 16);

    -- rOvfExtraBits_uid111_fpSubTest(COMPARE,110)@2
    rOvfExtraBits_uid111_fpSubTest_a <= STD_LOGIC_VECTOR("00" & rndExpFracOvfBits_uid110_fpSubTest_b);
    rOvfExtraBits_uid111_fpSubTest_b <= STD_LOGIC_VECTOR("00" & zocst_uid77_fpSubTest_q);
    rOvfExtraBits_uid111_fpSubTest_o <= STD_LOGIC_VECTOR(UNSIGNED(rOvfExtraBits_uid111_fpSubTest_a) - UNSIGNED(rOvfExtraBits_uid111_fpSubTest_b));
    rOvfExtraBits_uid111_fpSubTest_n(0) <= not (rOvfExtraBits_uid111_fpSubTest_o(3));

    -- wEP2AllOwE_uid106_fpSubTest(CONSTANT,105)
    wEP2AllOwE_uid106_fpSubTest_q <= "0011111";

    -- rndExp_uid107_fpSubTest(BITSELECT,106)@2
    rndExp_uid107_fpSubTest_in <= rndExpFrac_uid105_fpSubTest_q(17 downto 0);
    rndExp_uid107_fpSubTest_b <= rndExp_uid107_fpSubTest_in(17 downto 11);

    -- rOvfEQMax_uid108_fpSubTest(LOGICAL,107)@2
    rOvfEQMax_uid108_fpSubTest_q <= "1" WHEN rndExp_uid107_fpSubTest_b = wEP2AllOwE_uid106_fpSubTest_q ELSE "0";

    -- rOvf_uid112_fpSubTest(LOGICAL,111)@2
    rOvf_uid112_fpSubTest_q <= rOvfEQMax_uid108_fpSubTest_q or rOvfExtraBits_uid111_fpSubTest_n;

    -- regInputs_uid120_fpSubTest(LOGICAL,119)@1 + 1
    regInputs_uid120_fpSubTest_qi <= excR_aSig_uid32_fpSubTest_q and excR_bSig_uid46_fpSubTest_q;
    regInputs_uid120_fpSubTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => regInputs_uid120_fpSubTest_qi, xout => regInputs_uid120_fpSubTest_q, clk => clk, aclr => areset );

    -- rInfOvf_uid123_fpSubTest(LOGICAL,122)@2
    rInfOvf_uid123_fpSubTest_q <= regInputs_uid120_fpSubTest_q and rOvf_uid112_fpSubTest_q;

    -- excRInfVInC_uid124_fpSubTest(BITJOIN,123)@2
    excRInfVInC_uid124_fpSubTest_q <= rInfOvf_uid123_fpSubTest_q & excN_bSig_uid43_fpSubTest_q & excN_aSig_uid29_fpSubTest_q & redist7_excI_bSig_uid42_fpSubTest_q_1_q & redist10_excI_aSig_uid28_fpSubTest_q_1_q & redist3_effSub_uid53_fpSubTest_q_2_q;

    -- excRInf_uid125_fpSubTest(LOOKUP,124)@2
    excRInf_uid125_fpSubTest_combproc: PROCESS (excRInfVInC_uid124_fpSubTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRInfVInC_uid124_fpSubTest_q) IS
            WHEN "000000" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "000001" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "000010" => excRInf_uid125_fpSubTest_q <= "1";
            WHEN "000011" => excRInf_uid125_fpSubTest_q <= "1";
            WHEN "000100" => excRInf_uid125_fpSubTest_q <= "1";
            WHEN "000101" => excRInf_uid125_fpSubTest_q <= "1";
            WHEN "000110" => excRInf_uid125_fpSubTest_q <= "1";
            WHEN "000111" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "001000" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "001001" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "001010" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "001011" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "001100" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "001101" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "001110" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "001111" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "010000" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "010001" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "010010" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "010011" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "010100" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "010101" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "010110" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "010111" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "011000" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "011001" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "011010" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "011011" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "011100" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "011101" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "011110" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "011111" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "100000" => excRInf_uid125_fpSubTest_q <= "1";
            WHEN "100001" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "100010" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "100011" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "100100" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "100101" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "100110" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "100111" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "101000" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "101001" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "101010" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "101011" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "101100" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "101101" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "101110" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "101111" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "110000" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "110001" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "110010" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "110011" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "110100" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "110101" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "110110" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "110111" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "111000" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "111001" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "111010" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "111011" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "111100" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "111101" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "111110" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN "111111" => excRInf_uid125_fpSubTest_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRInf_uid125_fpSubTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- redist2_aMinusA_uid88_fpSubTest_q_1(DELAY,240)
    redist2_aMinusA_uid88_fpSubTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aMinusA_uid88_fpSubTest_q, xout => redist2_aMinusA_uid88_fpSubTest_q_1_q, clk => clk, aclr => areset );

    -- rUdfExtraBit_uid116_fpSubTest(BITSELECT,115)@2
    rUdfExtraBit_uid116_fpSubTest_in <= STD_LOGIC_VECTOR(rndExpFrac_uid105_fpSubTest_q(17 downto 0));
    rUdfExtraBit_uid116_fpSubTest_b <= STD_LOGIC_VECTOR(rUdfExtraBit_uid116_fpSubTest_in(17 downto 17));

    -- wEP2AllZ_uid113_fpSubTest(CONSTANT,112)
    wEP2AllZ_uid113_fpSubTest_q <= "0000000";

    -- rUdfEQMin_uid115_fpSubTest(LOGICAL,114)@2
    rUdfEQMin_uid115_fpSubTest_q <= "1" WHEN rndExp_uid107_fpSubTest_b = wEP2AllZ_uid113_fpSubTest_q ELSE "0";

    -- rUdf_uid117_fpSubTest(LOGICAL,116)@2
    rUdf_uid117_fpSubTest_q <= rUdfEQMin_uid115_fpSubTest_q or rUdfExtraBit_uid116_fpSubTest_b;

    -- redist9_excZ_bSig_uid18_uid38_fpSubTest_q_2(DELAY,247)
    redist9_excZ_bSig_uid18_uid38_fpSubTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist8_excZ_bSig_uid18_uid38_fpSubTest_q_1_q, xout => redist9_excZ_bSig_uid18_uid38_fpSubTest_q_2_q, clk => clk, aclr => areset );

    -- redist11_excZ_aSig_uid17_uid24_fpSubTest_q_1(DELAY,249)
    redist11_excZ_aSig_uid17_uid24_fpSubTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_aSig_uid17_uid24_fpSubTest_q, xout => redist11_excZ_aSig_uid17_uid24_fpSubTest_q_1_q, clk => clk, aclr => areset );

    -- excRZeroVInC_uid121_fpSubTest(BITJOIN,120)@2
    excRZeroVInC_uid121_fpSubTest_q <= redist2_aMinusA_uid88_fpSubTest_q_1_q & rUdf_uid117_fpSubTest_q & regInputs_uid120_fpSubTest_q & redist9_excZ_bSig_uid18_uid38_fpSubTest_q_2_q & redist11_excZ_aSig_uid17_uid24_fpSubTest_q_1_q;

    -- excRZero_uid122_fpSubTest(LOOKUP,121)@2
    excRZero_uid122_fpSubTest_combproc: PROCESS (excRZeroVInC_uid121_fpSubTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRZeroVInC_uid121_fpSubTest_q) IS
            WHEN "00000" => excRZero_uid122_fpSubTest_q <= "0";
            WHEN "00001" => excRZero_uid122_fpSubTest_q <= "0";
            WHEN "00010" => excRZero_uid122_fpSubTest_q <= "0";
            WHEN "00011" => excRZero_uid122_fpSubTest_q <= "1";
            WHEN "00100" => excRZero_uid122_fpSubTest_q <= "0";
            WHEN "00101" => excRZero_uid122_fpSubTest_q <= "0";
            WHEN "00110" => excRZero_uid122_fpSubTest_q <= "0";
            WHEN "00111" => excRZero_uid122_fpSubTest_q <= "0";
            WHEN "01000" => excRZero_uid122_fpSubTest_q <= "0";
            WHEN "01001" => excRZero_uid122_fpSubTest_q <= "0";
            WHEN "01010" => excRZero_uid122_fpSubTest_q <= "0";
            WHEN "01011" => excRZero_uid122_fpSubTest_q <= "1";
            WHEN "01100" => excRZero_uid122_fpSubTest_q <= "1";
            WHEN "01101" => excRZero_uid122_fpSubTest_q <= "0";
            WHEN "01110" => excRZero_uid122_fpSubTest_q <= "0";
            WHEN "01111" => excRZero_uid122_fpSubTest_q <= "0";
            WHEN "10000" => excRZero_uid122_fpSubTest_q <= "0";
            WHEN "10001" => excRZero_uid122_fpSubTest_q <= "0";
            WHEN "10010" => excRZero_uid122_fpSubTest_q <= "0";
            WHEN "10011" => excRZero_uid122_fpSubTest_q <= "1";
            WHEN "10100" => excRZero_uid122_fpSubTest_q <= "1";
            WHEN "10101" => excRZero_uid122_fpSubTest_q <= "0";
            WHEN "10110" => excRZero_uid122_fpSubTest_q <= "0";
            WHEN "10111" => excRZero_uid122_fpSubTest_q <= "0";
            WHEN "11000" => excRZero_uid122_fpSubTest_q <= "0";
            WHEN "11001" => excRZero_uid122_fpSubTest_q <= "0";
            WHEN "11010" => excRZero_uid122_fpSubTest_q <= "0";
            WHEN "11011" => excRZero_uid122_fpSubTest_q <= "1";
            WHEN "11100" => excRZero_uid122_fpSubTest_q <= "1";
            WHEN "11101" => excRZero_uid122_fpSubTest_q <= "0";
            WHEN "11110" => excRZero_uid122_fpSubTest_q <= "0";
            WHEN "11111" => excRZero_uid122_fpSubTest_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRZero_uid122_fpSubTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- concExc_uid129_fpSubTest(BITJOIN,128)@2
    concExc_uid129_fpSubTest_q <= excRNaN_uid128_fpSubTest_q & excRInf_uid125_fpSubTest_q & excRZero_uid122_fpSubTest_q;

    -- excREnc_uid130_fpSubTest(LOOKUP,129)@2
    excREnc_uid130_fpSubTest_combproc: PROCESS (concExc_uid129_fpSubTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid129_fpSubTest_q) IS
            WHEN "000" => excREnc_uid130_fpSubTest_q <= "01";
            WHEN "001" => excREnc_uid130_fpSubTest_q <= "00";
            WHEN "010" => excREnc_uid130_fpSubTest_q <= "10";
            WHEN "011" => excREnc_uid130_fpSubTest_q <= "10";
            WHEN "100" => excREnc_uid130_fpSubTest_q <= "11";
            WHEN "101" => excREnc_uid130_fpSubTest_q <= "11";
            WHEN "110" => excREnc_uid130_fpSubTest_q <= "11";
            WHEN "111" => excREnc_uid130_fpSubTest_q <= "11";
            WHEN OTHERS => -- unreachable
                           excREnc_uid130_fpSubTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid149_fpSubTest(MUX,148)@2
    expRPostExc_uid149_fpSubTest_s <= excREnc_uid130_fpSubTest_q;
    expRPostExc_uid149_fpSubTest_combproc: PROCESS (expRPostExc_uid149_fpSubTest_s, cstAllZWE_uid21_fpSubTest_q, expRPreExc_uid119_fpSubTest_b, cstAllOWE_uid19_fpSubTest_q)
    BEGIN
        CASE (expRPostExc_uid149_fpSubTest_s) IS
            WHEN "00" => expRPostExc_uid149_fpSubTest_q <= cstAllZWE_uid21_fpSubTest_q;
            WHEN "01" => expRPostExc_uid149_fpSubTest_q <= expRPreExc_uid119_fpSubTest_b;
            WHEN "10" => expRPostExc_uid149_fpSubTest_q <= cstAllOWE_uid19_fpSubTest_q;
            WHEN "11" => expRPostExc_uid149_fpSubTest_q <= cstAllOWE_uid19_fpSubTest_q;
            WHEN OTHERS => expRPostExc_uid149_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid142_fpSubTest(CONSTANT,141)
    oneFracRPostExc2_uid142_fpSubTest_q <= "0000000001";

    -- fracRPreExc_uid118_fpSubTest(BITSELECT,117)@2
    fracRPreExc_uid118_fpSubTest_in <= rndExpFrac_uid105_fpSubTest_q(10 downto 0);
    fracRPreExc_uid118_fpSubTest_b <= fracRPreExc_uid118_fpSubTest_in(10 downto 1);

    -- fracRPostExc_uid145_fpSubTest(MUX,144)@2
    fracRPostExc_uid145_fpSubTest_s <= excREnc_uid130_fpSubTest_q;
    fracRPostExc_uid145_fpSubTest_combproc: PROCESS (fracRPostExc_uid145_fpSubTest_s, cstZeroWF_uid20_fpSubTest_q, fracRPreExc_uid118_fpSubTest_b, oneFracRPostExc2_uid142_fpSubTest_q)
    BEGIN
        CASE (fracRPostExc_uid145_fpSubTest_s) IS
            WHEN "00" => fracRPostExc_uid145_fpSubTest_q <= cstZeroWF_uid20_fpSubTest_q;
            WHEN "01" => fracRPostExc_uid145_fpSubTest_q <= fracRPreExc_uid118_fpSubTest_b;
            WHEN "10" => fracRPostExc_uid145_fpSubTest_q <= cstZeroWF_uid20_fpSubTest_q;
            WHEN "11" => fracRPostExc_uid145_fpSubTest_q <= oneFracRPostExc2_uid142_fpSubTest_q;
            WHEN OTHERS => fracRPostExc_uid145_fpSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid150_fpSubTest(BITJOIN,149)@2
    R_uid150_fpSubTest_q <= signRPostExc_uid141_fpSubTest_q & expRPostExc_uid149_fpSubTest_q & fracRPostExc_uid145_fpSubTest_q;

    -- xOut(GPOUT,4)@2
    q <= R_uid150_fpSubTest_q;

END normal;
