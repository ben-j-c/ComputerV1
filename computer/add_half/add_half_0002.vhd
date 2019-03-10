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

-- VHDL created from add_half_0002
-- VHDL created on Sun Sep 02 18:15:21 2018


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

entity add_half_0002 is
    port (
        a : in std_logic_vector(15 downto 0);  -- float16_m10
        b : in std_logic_vector(15 downto 0);  -- float16_m10
        q : out std_logic_vector(15 downto 0);  -- float16_m10
        clk : in std_logic;
        areset : in std_logic
    );
end add_half_0002;

architecture normal of add_half_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracX_uid6_fpAddTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal expFracY_uid7_fpAddTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal xGTEy_uid8_fpAddTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal xGTEy_uid8_fpAddTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal xGTEy_uid8_fpAddTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal xGTEy_uid8_fpAddTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sigY_uid9_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracY_uid10_fpAddTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expY_uid11_fpAddTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal ypn_uid12_fpAddTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal aSig_uid16_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid16_fpAddTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal bSig_uid17_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bSig_uid17_fpAddTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal cstAllOWE_uid18_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cstZeroWF_uid19_fpAddTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal cstAllZWE_uid20_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal exp_aSig_uid21_fpAddTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal exp_aSig_uid21_fpAddTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal frac_aSig_uid22_fpAddTest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal frac_aSig_uid22_fpAddTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal excZ_aSig_uid16_uid23_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid24_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid25_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid26_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_aSig_uid27_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid28_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid28_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid29_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid30_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_aSig_uid31_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_bSig_uid35_fpAddTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal exp_bSig_uid35_fpAddTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal frac_bSig_uid36_fpAddTest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal frac_bSig_uid36_fpAddTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal excZ_bSig_uid17_uid37_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid39_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid39_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid40_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_bSig_uid41_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid42_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid42_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid43_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid44_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_bSig_uid45_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigA_uid50_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sigB_uid51_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid52_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid52_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid56_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid56_fpAddTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal oFracB_uid59_fpAddTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expAmExpB_uid60_fpAddTest_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expAmExpB_uid60_fpAddTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expAmExpB_uid60_fpAddTest_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expAmExpB_uid60_fpAddTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal cWFP2_uid61_fpAddTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal shiftedOut_uid63_fpAddTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid63_fpAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid63_fpAddTest_o : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid63_fpAddTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal padConst_uid64_fpAddTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightPaddedIn_uid65_fpAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal iShiftedOut_uid67_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal alignFracBPostShiftOut_uid68_fpAddTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal alignFracBPostShiftOut_uid68_fpAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal effSubInvSticky_uid74_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zocst_uid76_fpAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracAAddOp_uid77_fpAddTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal fracBAddOp_uid80_fpAddTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal fracBAddOpPostXor_uid81_fpAddTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal fracBAddOpPostXor_uid81_fpAddTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal fracAddResult_uid82_fpAddTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal fracAddResult_uid82_fpAddTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal fracAddResult_uid82_fpAddTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal fracAddResult_uid82_fpAddTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_in : STD_LOGIC_VECTOR (13 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal fracGRS_uid84_fpAddTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal cAmA_uid86_fpAddTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal aMinusA_uid87_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNorm_uid89_fpAddTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal oneCST_uid90_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expInc_uid91_fpAddTest_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expInc_uid91_fpAddTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expInc_uid91_fpAddTest_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expInc_uid91_fpAddTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expPostNorm_uid92_fpAddTest_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expPostNorm_uid92_fpAddTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expPostNorm_uid92_fpAddTest_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expPostNorm_uid92_fpAddTest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal Sticky0_uid93_fpAddTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky0_uid93_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky1_uid94_fpAddTest_in : STD_LOGIC_VECTOR (1 downto 0);
    signal Sticky1_uid94_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Round_uid95_fpAddTest_in : STD_LOGIC_VECTOR (2 downto 0);
    signal Round_uid95_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Guard_uid96_fpAddTest_in : STD_LOGIC_VECTOR (3 downto 0);
    signal Guard_uid96_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal LSB_uid97_fpAddTest_in : STD_LOGIC_VECTOR (4 downto 0);
    signal LSB_uid97_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rndBitCond_uid98_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cRBit_uid99_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rBi_uid100_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rBi_uid100_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid101_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNormRndRange_uid102_fpAddTest_in : STD_LOGIC_VECTOR (12 downto 0);
    signal fracPostNormRndRange_uid102_fpAddTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expFracR_uid103_fpAddTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rndExpFrac_uid104_fpAddTest_a : STD_LOGIC_VECTOR (18 downto 0);
    signal rndExpFrac_uid104_fpAddTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal rndExpFrac_uid104_fpAddTest_o : STD_LOGIC_VECTOR (18 downto 0);
    signal rndExpFrac_uid104_fpAddTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal wEP2AllOwE_uid105_fpAddTest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal rndExp_uid106_fpAddTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal rndExp_uid106_fpAddTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rOvfEQMax_uid107_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rndExpFracOvfBits_uid109_fpAddTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal rndExpFracOvfBits_uid109_fpAddTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rOvfExtraBits_uid110_fpAddTest_a : STD_LOGIC_VECTOR (3 downto 0);
    signal rOvfExtraBits_uid110_fpAddTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rOvfExtraBits_uid110_fpAddTest_o : STD_LOGIC_VECTOR (3 downto 0);
    signal rOvfExtraBits_uid110_fpAddTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal rOvf_uid111_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal wEP2AllZ_uid112_fpAddTest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal rUdfEQMin_uid114_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdfExtraBit_uid115_fpAddTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal rUdfExtraBit_uid115_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdf_uid116_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExc_uid117_fpAddTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal fracRPreExc_uid117_fpAddTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expRPreExc_uid118_fpAddTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal expRPreExc_uid118_fpAddTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal regInputs_uid119_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal regInputs_uid119_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZeroVInC_uid120_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal excRZero_uid121_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rInfOvf_uid122_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfVInC_uid123_fpAddTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal excRInf_uid124_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN2_uid125_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAIBISub_uid126_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid127_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid128_fpAddTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid129_fpAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal invAMinusA_uid130_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRReg_uid131_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigBBInf_uid132_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigAAInf_uid133_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInf_uid134_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAZBZSigASigB_uid135_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excBZARSigA_uid136_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRZero_uid137_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid138_fpAddTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid138_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid139_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid140_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneFracRPostExc2_uid141_fpAddTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal fracRPostExc_uid144_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid144_fpAddTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expRPostExc_uid148_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid148_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal R_uid149_fpAddTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal zs_uid151_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid152_lzCountVal_uid85_fpAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid153_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mO_uid154_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStage_uid155_lzCountVal_uid85_fpAddTest_in : STD_LOGIC_VECTOR (6 downto 0);
    signal vStage_uid155_lzCountVal_uid85_fpAddTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal cStage_uid156_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal vStagei_uid158_lzCountVal_uid85_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid158_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid159_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid161_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid164_lzCountVal_uid85_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid164_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid165_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid167_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid170_lzCountVal_uid85_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid170_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid172_lzCountVal_uid85_fpAddTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid173_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid174_lzCountVal_uid85_fpAddTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal wIntCst_uid178_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal shiftedOut_uid179_alignmentShifter_uid64_fpAddTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid179_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid179_alignmentShifter_uid64_fpAddTest_o : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid179_alignmentShifter_uid64_fpAddTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx1Rng8_uid180_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal rightShiftStage0Idx1_uid182_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage0Idx2Rng16_uid183_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rightShiftStage0Idx2Pad16_uid184_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx2_uid185_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage0Idx3_uid186_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage0_uid188_alignmentShifter_uid64_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid188_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage1Idx1Rng2_uid189_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal rightShiftStage1Idx1_uid191_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage1Idx2Rng4_uid192_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal rightShiftStage1Idx2_uid194_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage1Idx3Rng6_uid195_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal rightShiftStage1Idx3Pad6_uid196_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStage1Idx3_uid197_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage1_uid199_alignmentShifter_uid64_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid199_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage2Idx1Rng1_uid200_alignmentShifter_uid64_fpAddTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal rightShiftStage2Idx1_uid202_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage2_uid204_alignmentShifter_uid64_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid204_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal r_uid206_alignmentShifter_uid64_fpAddTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid206_alignmentShifter_uid64_fpAddTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal leftShiftStage0Idx1Rng4_uid211_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal leftShiftStage0Idx1Rng4_uid211_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal leftShiftStage0Idx1_uid212_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal leftShiftStage0Idx2_uid215_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal leftShiftStage0Idx3Rng12_uid217_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage0Idx3Rng12_uid217_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage0Idx3_uid218_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal leftShiftStage0_uid220_fracPostNormExt_uid88_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid220_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal leftShiftStage1Idx1Rng1_uid222_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (13 downto 0);
    signal leftShiftStage1Idx1Rng1_uid222_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal leftShiftStage1Idx1_uid223_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal leftShiftStage1Idx2Rng2_uid225_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (12 downto 0);
    signal leftShiftStage1Idx2Rng2_uid225_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal leftShiftStage1Idx2_uid226_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal leftShiftStage1Idx3Pad3_uid227_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage1Idx3Rng3_uid228_fracPostNormExt_uid88_fpAddTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal leftShiftStage1Idx3Rng3_uid228_fracPostNormExt_uid88_fpAddTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal leftShiftStage1Idx3_uid229_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal leftShiftStage1_uid231_fracPostNormExt_uid88_fpAddTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid231_fracPostNormExt_uid88_fpAddTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal rightShiftStageSel4Dto3_uid187_alignmentShifter_uid64_fpAddTest_merged_bit_select_in : STD_LOGIC_VECTOR (4 downto 0);
    signal rightShiftStageSel4Dto3_uid187_alignmentShifter_uid64_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel4Dto3_uid187_alignmentShifter_uid64_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel4Dto3_uid187_alignmentShifter_uid64_fpAddTest_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal stickyBits_uid69_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (9 downto 0);
    signal stickyBits_uid69_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (12 downto 0);
    signal rVStage_uid160_lzCountVal_uid85_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid160_lzCountVal_uid85_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel3Dto2_uid219_fracPostNormExt_uid88_fpAddTest_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel3Dto2_uid219_fracPostNormExt_uid88_fpAddTest_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_stickyBits_uid69_fpAddTest_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist1_fracPostNormRndRange_uid102_fpAddTest_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist2_aMinusA_uid87_fpAddTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_effSub_uid52_fpAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sigB_uid51_fpAddTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_sigA_uid50_fpAddTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_InvExpXIsZero_uid44_fpAddTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_excI_bSig_uid41_fpAddTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_excZ_bSig_uid17_uid37_fpAddTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_excZ_bSig_uid17_uid37_fpAddTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_excI_aSig_uid27_fpAddTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_excZ_aSig_uid16_uid23_fpAddTest_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_frac_aSig_uid22_fpAddTest_b_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist13_exp_aSig_uid21_fpAddTest_b_1_q : STD_LOGIC_VECTOR (4 downto 0);

begin


    -- cAmA_uid86_fpAddTest(CONSTANT,85)
    cAmA_uid86_fpAddTest_q <= "1111";

    -- zs_uid151_lzCountVal_uid85_fpAddTest(CONSTANT,150)
    zs_uid151_lzCountVal_uid85_fpAddTest_q <= "00000000";

    -- sigY_uid9_fpAddTest(BITSELECT,8)@0
    sigY_uid9_fpAddTest_b <= STD_LOGIC_VECTOR(b(15 downto 15));

    -- expY_uid11_fpAddTest(BITSELECT,10)@0
    expY_uid11_fpAddTest_b <= b(14 downto 10);

    -- fracY_uid10_fpAddTest(BITSELECT,9)@0
    fracY_uid10_fpAddTest_b <= b(9 downto 0);

    -- ypn_uid12_fpAddTest(BITJOIN,11)@0
    ypn_uid12_fpAddTest_q <= sigY_uid9_fpAddTest_b & expY_uid11_fpAddTest_b & fracY_uid10_fpAddTest_b;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- expFracY_uid7_fpAddTest(BITSELECT,6)@0
    expFracY_uid7_fpAddTest_b <= b(14 downto 0);

    -- expFracX_uid6_fpAddTest(BITSELECT,5)@0
    expFracX_uid6_fpAddTest_b <= a(14 downto 0);

    -- xGTEy_uid8_fpAddTest(COMPARE,7)@0
    xGTEy_uid8_fpAddTest_a <= STD_LOGIC_VECTOR("00" & expFracX_uid6_fpAddTest_b);
    xGTEy_uid8_fpAddTest_b <= STD_LOGIC_VECTOR("00" & expFracY_uid7_fpAddTest_b);
    xGTEy_uid8_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid8_fpAddTest_a) - UNSIGNED(xGTEy_uid8_fpAddTest_b));
    xGTEy_uid8_fpAddTest_n(0) <= not (xGTEy_uid8_fpAddTest_o(16));

    -- bSig_uid17_fpAddTest(MUX,16)@0
    bSig_uid17_fpAddTest_s <= xGTEy_uid8_fpAddTest_n;
    bSig_uid17_fpAddTest_combproc: PROCESS (bSig_uid17_fpAddTest_s, a, ypn_uid12_fpAddTest_q)
    BEGIN
        CASE (bSig_uid17_fpAddTest_s) IS
            WHEN "0" => bSig_uid17_fpAddTest_q <= a;
            WHEN "1" => bSig_uid17_fpAddTest_q <= ypn_uid12_fpAddTest_q;
            WHEN OTHERS => bSig_uid17_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigB_uid51_fpAddTest(BITSELECT,50)@0
    sigB_uid51_fpAddTest_b <= STD_LOGIC_VECTOR(bSig_uid17_fpAddTest_q(15 downto 15));

    -- aSig_uid16_fpAddTest(MUX,15)@0
    aSig_uid16_fpAddTest_s <= xGTEy_uid8_fpAddTest_n;
    aSig_uid16_fpAddTest_combproc: PROCESS (aSig_uid16_fpAddTest_s, ypn_uid12_fpAddTest_q, a)
    BEGIN
        CASE (aSig_uid16_fpAddTest_s) IS
            WHEN "0" => aSig_uid16_fpAddTest_q <= ypn_uid12_fpAddTest_q;
            WHEN "1" => aSig_uid16_fpAddTest_q <= a;
            WHEN OTHERS => aSig_uid16_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigA_uid50_fpAddTest(BITSELECT,49)@0
    sigA_uid50_fpAddTest_b <= STD_LOGIC_VECTOR(aSig_uid16_fpAddTest_q(15 downto 15));

    -- effSub_uid52_fpAddTest(LOGICAL,51)@0 + 1
    effSub_uid52_fpAddTest_qi <= sigA_uid50_fpAddTest_b xor sigB_uid51_fpAddTest_b;
    effSub_uid52_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid52_fpAddTest_qi, xout => effSub_uid52_fpAddTest_q, clk => clk, aclr => areset );

    -- exp_bSig_uid35_fpAddTest(BITSELECT,34)@0
    exp_bSig_uid35_fpAddTest_in <= bSig_uid17_fpAddTest_q(14 downto 0);
    exp_bSig_uid35_fpAddTest_b <= exp_bSig_uid35_fpAddTest_in(14 downto 10);

    -- exp_aSig_uid21_fpAddTest(BITSELECT,20)@0
    exp_aSig_uid21_fpAddTest_in <= aSig_uid16_fpAddTest_q(14 downto 0);
    exp_aSig_uid21_fpAddTest_b <= exp_aSig_uid21_fpAddTest_in(14 downto 10);

    -- expAmExpB_uid60_fpAddTest(SUB,59)@0
    expAmExpB_uid60_fpAddTest_a <= STD_LOGIC_VECTOR("0" & exp_aSig_uid21_fpAddTest_b);
    expAmExpB_uid60_fpAddTest_b <= STD_LOGIC_VECTOR("0" & exp_bSig_uid35_fpAddTest_b);
    expAmExpB_uid60_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expAmExpB_uid60_fpAddTest_a) - UNSIGNED(expAmExpB_uid60_fpAddTest_b));
    expAmExpB_uid60_fpAddTest_q <= expAmExpB_uid60_fpAddTest_o(5 downto 0);

    -- cWFP2_uid61_fpAddTest(CONSTANT,60)
    cWFP2_uid61_fpAddTest_q <= "1100";

    -- shiftedOut_uid63_fpAddTest(COMPARE,62)@0
    shiftedOut_uid63_fpAddTest_a <= STD_LOGIC_VECTOR("0000" & cWFP2_uid61_fpAddTest_q);
    shiftedOut_uid63_fpAddTest_b <= STD_LOGIC_VECTOR("00" & expAmExpB_uid60_fpAddTest_q);
    shiftedOut_uid63_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid63_fpAddTest_a) - UNSIGNED(shiftedOut_uid63_fpAddTest_b));
    shiftedOut_uid63_fpAddTest_c(0) <= shiftedOut_uid63_fpAddTest_o(7);

    -- iShiftedOut_uid67_fpAddTest(LOGICAL,66)@0
    iShiftedOut_uid67_fpAddTest_q <= not (shiftedOut_uid63_fpAddTest_c);

    -- rightShiftStage0Idx3_uid186_alignmentShifter_uid64_fpAddTest(CONSTANT,185)
    rightShiftStage0Idx3_uid186_alignmentShifter_uid64_fpAddTest_q <= "00000000000000000000000";

    -- rightShiftStage2Idx1Rng1_uid200_alignmentShifter_uid64_fpAddTest(BITSELECT,199)@0
    rightShiftStage2Idx1Rng1_uid200_alignmentShifter_uid64_fpAddTest_b <= rightShiftStage1_uid199_alignmentShifter_uid64_fpAddTest_q(22 downto 1);

    -- rightShiftStage2Idx1_uid202_alignmentShifter_uid64_fpAddTest(BITJOIN,201)@0
    rightShiftStage2Idx1_uid202_alignmentShifter_uid64_fpAddTest_q <= GND_q & rightShiftStage2Idx1Rng1_uid200_alignmentShifter_uid64_fpAddTest_b;

    -- rightShiftStage1Idx3Pad6_uid196_alignmentShifter_uid64_fpAddTest(CONSTANT,195)
    rightShiftStage1Idx3Pad6_uid196_alignmentShifter_uid64_fpAddTest_q <= "000000";

    -- rightShiftStage1Idx3Rng6_uid195_alignmentShifter_uid64_fpAddTest(BITSELECT,194)@0
    rightShiftStage1Idx3Rng6_uid195_alignmentShifter_uid64_fpAddTest_b <= rightShiftStage0_uid188_alignmentShifter_uid64_fpAddTest_q(22 downto 6);

    -- rightShiftStage1Idx3_uid197_alignmentShifter_uid64_fpAddTest(BITJOIN,196)@0
    rightShiftStage1Idx3_uid197_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage1Idx3Pad6_uid196_alignmentShifter_uid64_fpAddTest_q & rightShiftStage1Idx3Rng6_uid195_alignmentShifter_uid64_fpAddTest_b;

    -- zs_uid159_lzCountVal_uid85_fpAddTest(CONSTANT,158)
    zs_uid159_lzCountVal_uid85_fpAddTest_q <= "0000";

    -- rightShiftStage1Idx2Rng4_uid192_alignmentShifter_uid64_fpAddTest(BITSELECT,191)@0
    rightShiftStage1Idx2Rng4_uid192_alignmentShifter_uid64_fpAddTest_b <= rightShiftStage0_uid188_alignmentShifter_uid64_fpAddTest_q(22 downto 4);

    -- rightShiftStage1Idx2_uid194_alignmentShifter_uid64_fpAddTest(BITJOIN,193)@0
    rightShiftStage1Idx2_uid194_alignmentShifter_uid64_fpAddTest_q <= zs_uid159_lzCountVal_uid85_fpAddTest_q & rightShiftStage1Idx2Rng4_uid192_alignmentShifter_uid64_fpAddTest_b;

    -- zs_uid165_lzCountVal_uid85_fpAddTest(CONSTANT,164)
    zs_uid165_lzCountVal_uid85_fpAddTest_q <= "00";

    -- rightShiftStage1Idx1Rng2_uid189_alignmentShifter_uid64_fpAddTest(BITSELECT,188)@0
    rightShiftStage1Idx1Rng2_uid189_alignmentShifter_uid64_fpAddTest_b <= rightShiftStage0_uid188_alignmentShifter_uid64_fpAddTest_q(22 downto 2);

    -- rightShiftStage1Idx1_uid191_alignmentShifter_uid64_fpAddTest(BITJOIN,190)@0
    rightShiftStage1Idx1_uid191_alignmentShifter_uid64_fpAddTest_q <= zs_uid165_lzCountVal_uid85_fpAddTest_q & rightShiftStage1Idx1Rng2_uid189_alignmentShifter_uid64_fpAddTest_b;

    -- rightShiftStage0Idx2Pad16_uid184_alignmentShifter_uid64_fpAddTest(CONSTANT,183)
    rightShiftStage0Idx2Pad16_uid184_alignmentShifter_uid64_fpAddTest_q <= "0000000000000000";

    -- rightShiftStage0Idx2Rng16_uid183_alignmentShifter_uid64_fpAddTest(BITSELECT,182)@0
    rightShiftStage0Idx2Rng16_uid183_alignmentShifter_uid64_fpAddTest_b <= rightPaddedIn_uid65_fpAddTest_q(22 downto 16);

    -- rightShiftStage0Idx2_uid185_alignmentShifter_uid64_fpAddTest(BITJOIN,184)@0
    rightShiftStage0Idx2_uid185_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage0Idx2Pad16_uid184_alignmentShifter_uid64_fpAddTest_q & rightShiftStage0Idx2Rng16_uid183_alignmentShifter_uid64_fpAddTest_b;

    -- rightShiftStage0Idx1Rng8_uid180_alignmentShifter_uid64_fpAddTest(BITSELECT,179)@0
    rightShiftStage0Idx1Rng8_uid180_alignmentShifter_uid64_fpAddTest_b <= rightPaddedIn_uid65_fpAddTest_q(22 downto 8);

    -- rightShiftStage0Idx1_uid182_alignmentShifter_uid64_fpAddTest(BITJOIN,181)@0
    rightShiftStage0Idx1_uid182_alignmentShifter_uid64_fpAddTest_q <= zs_uid151_lzCountVal_uid85_fpAddTest_q & rightShiftStage0Idx1Rng8_uid180_alignmentShifter_uid64_fpAddTest_b;

    -- cstAllZWE_uid20_fpAddTest(CONSTANT,19)
    cstAllZWE_uid20_fpAddTest_q <= "00000";

    -- excZ_bSig_uid17_uid37_fpAddTest(LOGICAL,36)@0
    excZ_bSig_uid17_uid37_fpAddTest_q <= "1" WHEN exp_bSig_uid35_fpAddTest_b = cstAllZWE_uid20_fpAddTest_q ELSE "0";

    -- InvExpXIsZero_uid44_fpAddTest(LOGICAL,43)@0
    InvExpXIsZero_uid44_fpAddTest_q <= not (excZ_bSig_uid17_uid37_fpAddTest_q);

    -- cstZeroWF_uid19_fpAddTest(CONSTANT,18)
    cstZeroWF_uid19_fpAddTest_q <= "0000000000";

    -- frac_bSig_uid36_fpAddTest(BITSELECT,35)@0
    frac_bSig_uid36_fpAddTest_in <= bSig_uid17_fpAddTest_q(9 downto 0);
    frac_bSig_uid36_fpAddTest_b <= frac_bSig_uid36_fpAddTest_in(9 downto 0);

    -- fracBz_uid56_fpAddTest(MUX,55)@0
    fracBz_uid56_fpAddTest_s <= excZ_bSig_uid17_uid37_fpAddTest_q;
    fracBz_uid56_fpAddTest_combproc: PROCESS (fracBz_uid56_fpAddTest_s, frac_bSig_uid36_fpAddTest_b, cstZeroWF_uid19_fpAddTest_q)
    BEGIN
        CASE (fracBz_uid56_fpAddTest_s) IS
            WHEN "0" => fracBz_uid56_fpAddTest_q <= frac_bSig_uid36_fpAddTest_b;
            WHEN "1" => fracBz_uid56_fpAddTest_q <= cstZeroWF_uid19_fpAddTest_q;
            WHEN OTHERS => fracBz_uid56_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oFracB_uid59_fpAddTest(BITJOIN,58)@0
    oFracB_uid59_fpAddTest_q <= InvExpXIsZero_uid44_fpAddTest_q & fracBz_uid56_fpAddTest_q;

    -- padConst_uid64_fpAddTest(CONSTANT,63)
    padConst_uid64_fpAddTest_q <= "000000000000";

    -- rightPaddedIn_uid65_fpAddTest(BITJOIN,64)@0
    rightPaddedIn_uid65_fpAddTest_q <= oFracB_uid59_fpAddTest_q & padConst_uid64_fpAddTest_q;

    -- rightShiftStage0_uid188_alignmentShifter_uid64_fpAddTest(MUX,187)@0
    rightShiftStage0_uid188_alignmentShifter_uid64_fpAddTest_s <= rightShiftStageSel4Dto3_uid187_alignmentShifter_uid64_fpAddTest_merged_bit_select_b;
    rightShiftStage0_uid188_alignmentShifter_uid64_fpAddTest_combproc: PROCESS (rightShiftStage0_uid188_alignmentShifter_uid64_fpAddTest_s, rightPaddedIn_uid65_fpAddTest_q, rightShiftStage0Idx1_uid182_alignmentShifter_uid64_fpAddTest_q, rightShiftStage0Idx2_uid185_alignmentShifter_uid64_fpAddTest_q, rightShiftStage0Idx3_uid186_alignmentShifter_uid64_fpAddTest_q)
    BEGIN
        CASE (rightShiftStage0_uid188_alignmentShifter_uid64_fpAddTest_s) IS
            WHEN "00" => rightShiftStage0_uid188_alignmentShifter_uid64_fpAddTest_q <= rightPaddedIn_uid65_fpAddTest_q;
            WHEN "01" => rightShiftStage0_uid188_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage0Idx1_uid182_alignmentShifter_uid64_fpAddTest_q;
            WHEN "10" => rightShiftStage0_uid188_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage0Idx2_uid185_alignmentShifter_uid64_fpAddTest_q;
            WHEN "11" => rightShiftStage0_uid188_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage0Idx3_uid186_alignmentShifter_uid64_fpAddTest_q;
            WHEN OTHERS => rightShiftStage0_uid188_alignmentShifter_uid64_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid199_alignmentShifter_uid64_fpAddTest(MUX,198)@0
    rightShiftStage1_uid199_alignmentShifter_uid64_fpAddTest_s <= rightShiftStageSel4Dto3_uid187_alignmentShifter_uid64_fpAddTest_merged_bit_select_c;
    rightShiftStage1_uid199_alignmentShifter_uid64_fpAddTest_combproc: PROCESS (rightShiftStage1_uid199_alignmentShifter_uid64_fpAddTest_s, rightShiftStage0_uid188_alignmentShifter_uid64_fpAddTest_q, rightShiftStage1Idx1_uid191_alignmentShifter_uid64_fpAddTest_q, rightShiftStage1Idx2_uid194_alignmentShifter_uid64_fpAddTest_q, rightShiftStage1Idx3_uid197_alignmentShifter_uid64_fpAddTest_q)
    BEGIN
        CASE (rightShiftStage1_uid199_alignmentShifter_uid64_fpAddTest_s) IS
            WHEN "00" => rightShiftStage1_uid199_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage0_uid188_alignmentShifter_uid64_fpAddTest_q;
            WHEN "01" => rightShiftStage1_uid199_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage1Idx1_uid191_alignmentShifter_uid64_fpAddTest_q;
            WHEN "10" => rightShiftStage1_uid199_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage1Idx2_uid194_alignmentShifter_uid64_fpAddTest_q;
            WHEN "11" => rightShiftStage1_uid199_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage1Idx3_uid197_alignmentShifter_uid64_fpAddTest_q;
            WHEN OTHERS => rightShiftStage1_uid199_alignmentShifter_uid64_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStageSel4Dto3_uid187_alignmentShifter_uid64_fpAddTest_merged_bit_select(BITSELECT,232)@0
    rightShiftStageSel4Dto3_uid187_alignmentShifter_uid64_fpAddTest_merged_bit_select_in <= expAmExpB_uid60_fpAddTest_q(4 downto 0);
    rightShiftStageSel4Dto3_uid187_alignmentShifter_uid64_fpAddTest_merged_bit_select_b <= rightShiftStageSel4Dto3_uid187_alignmentShifter_uid64_fpAddTest_merged_bit_select_in(4 downto 3);
    rightShiftStageSel4Dto3_uid187_alignmentShifter_uid64_fpAddTest_merged_bit_select_c <= rightShiftStageSel4Dto3_uid187_alignmentShifter_uid64_fpAddTest_merged_bit_select_in(2 downto 1);
    rightShiftStageSel4Dto3_uid187_alignmentShifter_uid64_fpAddTest_merged_bit_select_d <= rightShiftStageSel4Dto3_uid187_alignmentShifter_uid64_fpAddTest_merged_bit_select_in(0 downto 0);

    -- rightShiftStage2_uid204_alignmentShifter_uid64_fpAddTest(MUX,203)@0
    rightShiftStage2_uid204_alignmentShifter_uid64_fpAddTest_s <= rightShiftStageSel4Dto3_uid187_alignmentShifter_uid64_fpAddTest_merged_bit_select_d;
    rightShiftStage2_uid204_alignmentShifter_uid64_fpAddTest_combproc: PROCESS (rightShiftStage2_uid204_alignmentShifter_uid64_fpAddTest_s, rightShiftStage1_uid199_alignmentShifter_uid64_fpAddTest_q, rightShiftStage2Idx1_uid202_alignmentShifter_uid64_fpAddTest_q)
    BEGIN
        CASE (rightShiftStage2_uid204_alignmentShifter_uid64_fpAddTest_s) IS
            WHEN "0" => rightShiftStage2_uid204_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage1_uid199_alignmentShifter_uid64_fpAddTest_q;
            WHEN "1" => rightShiftStage2_uid204_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage2Idx1_uid202_alignmentShifter_uid64_fpAddTest_q;
            WHEN OTHERS => rightShiftStage2_uid204_alignmentShifter_uid64_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- wIntCst_uid178_alignmentShifter_uid64_fpAddTest(CONSTANT,177)
    wIntCst_uid178_alignmentShifter_uid64_fpAddTest_q <= "10111";

    -- shiftedOut_uid179_alignmentShifter_uid64_fpAddTest(COMPARE,178)@0
    shiftedOut_uid179_alignmentShifter_uid64_fpAddTest_a <= STD_LOGIC_VECTOR("00" & expAmExpB_uid60_fpAddTest_q);
    shiftedOut_uid179_alignmentShifter_uid64_fpAddTest_b <= STD_LOGIC_VECTOR("000" & wIntCst_uid178_alignmentShifter_uid64_fpAddTest_q);
    shiftedOut_uid179_alignmentShifter_uid64_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid179_alignmentShifter_uid64_fpAddTest_a) - UNSIGNED(shiftedOut_uid179_alignmentShifter_uid64_fpAddTest_b));
    shiftedOut_uid179_alignmentShifter_uid64_fpAddTest_n(0) <= not (shiftedOut_uid179_alignmentShifter_uid64_fpAddTest_o(7));

    -- r_uid206_alignmentShifter_uid64_fpAddTest(MUX,205)@0
    r_uid206_alignmentShifter_uid64_fpAddTest_s <= shiftedOut_uid179_alignmentShifter_uid64_fpAddTest_n;
    r_uid206_alignmentShifter_uid64_fpAddTest_combproc: PROCESS (r_uid206_alignmentShifter_uid64_fpAddTest_s, rightShiftStage2_uid204_alignmentShifter_uid64_fpAddTest_q, rightShiftStage0Idx3_uid186_alignmentShifter_uid64_fpAddTest_q)
    BEGIN
        CASE (r_uid206_alignmentShifter_uid64_fpAddTest_s) IS
            WHEN "0" => r_uid206_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage2_uid204_alignmentShifter_uid64_fpAddTest_q;
            WHEN "1" => r_uid206_alignmentShifter_uid64_fpAddTest_q <= rightShiftStage0Idx3_uid186_alignmentShifter_uid64_fpAddTest_q;
            WHEN OTHERS => r_uid206_alignmentShifter_uid64_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- alignFracBPostShiftOut_uid68_fpAddTest(LOGICAL,67)@0
    alignFracBPostShiftOut_uid68_fpAddTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 1 => iShiftedOut_uid67_fpAddTest_q(0)) & iShiftedOut_uid67_fpAddTest_q));
    alignFracBPostShiftOut_uid68_fpAddTest_q <= r_uid206_alignmentShifter_uid64_fpAddTest_q and alignFracBPostShiftOut_uid68_fpAddTest_b;

    -- stickyBits_uid69_fpAddTest_merged_bit_select(BITSELECT,233)@0
    stickyBits_uid69_fpAddTest_merged_bit_select_b <= alignFracBPostShiftOut_uid68_fpAddTest_q(9 downto 0);
    stickyBits_uid69_fpAddTest_merged_bit_select_c <= alignFracBPostShiftOut_uid68_fpAddTest_q(22 downto 10);

    -- redist0_stickyBits_uid69_fpAddTest_merged_bit_select_c_1(DELAY,237)
    redist0_stickyBits_uid69_fpAddTest_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => stickyBits_uid69_fpAddTest_merged_bit_select_c, xout => redist0_stickyBits_uid69_fpAddTest_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- fracBAddOp_uid80_fpAddTest(BITJOIN,79)@1
    fracBAddOp_uid80_fpAddTest_q <= GND_q & redist0_stickyBits_uid69_fpAddTest_merged_bit_select_c_1_q;

    -- fracBAddOpPostXor_uid81_fpAddTest(LOGICAL,80)@1
    fracBAddOpPostXor_uid81_fpAddTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 1 => effSub_uid52_fpAddTest_q(0)) & effSub_uid52_fpAddTest_q));
    fracBAddOpPostXor_uid81_fpAddTest_q <= fracBAddOp_uid80_fpAddTest_q xor fracBAddOpPostXor_uid81_fpAddTest_b;

    -- zocst_uid76_fpAddTest(CONSTANT,75)
    zocst_uid76_fpAddTest_q <= "01";

    -- frac_aSig_uid22_fpAddTest(BITSELECT,21)@0
    frac_aSig_uid22_fpAddTest_in <= aSig_uid16_fpAddTest_q(9 downto 0);
    frac_aSig_uid22_fpAddTest_b <= frac_aSig_uid22_fpAddTest_in(9 downto 0);

    -- redist12_frac_aSig_uid22_fpAddTest_b_1(DELAY,249)
    redist12_frac_aSig_uid22_fpAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 10, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_aSig_uid22_fpAddTest_b, xout => redist12_frac_aSig_uid22_fpAddTest_b_1_q, clk => clk, aclr => areset );

    -- cmpEQ_stickyBits_cZwF_uid71_fpAddTest(LOGICAL,70)@0 + 1
    cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi <= "1" WHEN stickyBits_uid69_fpAddTest_merged_bit_select_b = cstZeroWF_uid19_fpAddTest_q ELSE "0";
    cmpEQ_stickyBits_cZwF_uid71_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => cmpEQ_stickyBits_cZwF_uid71_fpAddTest_qi, xout => cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q, clk => clk, aclr => areset );

    -- effSubInvSticky_uid74_fpAddTest(LOGICAL,73)@1
    effSubInvSticky_uid74_fpAddTest_q <= effSub_uid52_fpAddTest_q and cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q;

    -- fracAAddOp_uid77_fpAddTest(BITJOIN,76)@1
    fracAAddOp_uid77_fpAddTest_q <= zocst_uid76_fpAddTest_q & redist12_frac_aSig_uid22_fpAddTest_b_1_q & GND_q & effSubInvSticky_uid74_fpAddTest_q;

    -- fracAddResult_uid82_fpAddTest(ADD,81)@1
    fracAddResult_uid82_fpAddTest_a <= STD_LOGIC_VECTOR("0" & fracAAddOp_uid77_fpAddTest_q);
    fracAddResult_uid82_fpAddTest_b <= STD_LOGIC_VECTOR("0" & fracBAddOpPostXor_uid81_fpAddTest_q);
    fracAddResult_uid82_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(fracAddResult_uid82_fpAddTest_a) + UNSIGNED(fracAddResult_uid82_fpAddTest_b));
    fracAddResult_uid82_fpAddTest_q <= fracAddResult_uid82_fpAddTest_o(14 downto 0);

    -- rangeFracAddResultMwfp3Dto0_uid83_fpAddTest(BITSELECT,82)@1
    rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_in <= fracAddResult_uid82_fpAddTest_q(13 downto 0);
    rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_b <= rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_in(13 downto 0);

    -- invCmpEQ_stickyBits_cZwF_uid72_fpAddTest(LOGICAL,71)@1
    invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_q <= not (cmpEQ_stickyBits_cZwF_uid71_fpAddTest_q);

    -- fracGRS_uid84_fpAddTest(BITJOIN,83)@1
    fracGRS_uid84_fpAddTest_q <= rangeFracAddResultMwfp3Dto0_uid83_fpAddTest_b & invCmpEQ_stickyBits_cZwF_uid72_fpAddTest_q;

    -- rVStage_uid152_lzCountVal_uid85_fpAddTest(BITSELECT,151)@1
    rVStage_uid152_lzCountVal_uid85_fpAddTest_b <= fracGRS_uid84_fpAddTest_q(14 downto 7);

    -- vCount_uid153_lzCountVal_uid85_fpAddTest(LOGICAL,152)@1
    vCount_uid153_lzCountVal_uid85_fpAddTest_q <= "1" WHEN rVStage_uid152_lzCountVal_uid85_fpAddTest_b = zs_uid151_lzCountVal_uid85_fpAddTest_q ELSE "0";

    -- vStage_uid155_lzCountVal_uid85_fpAddTest(BITSELECT,154)@1
    vStage_uid155_lzCountVal_uid85_fpAddTest_in <= fracGRS_uid84_fpAddTest_q(6 downto 0);
    vStage_uid155_lzCountVal_uid85_fpAddTest_b <= vStage_uid155_lzCountVal_uid85_fpAddTest_in(6 downto 0);

    -- mO_uid154_lzCountVal_uid85_fpAddTest(CONSTANT,153)
    mO_uid154_lzCountVal_uid85_fpAddTest_q <= "1";

    -- cStage_uid156_lzCountVal_uid85_fpAddTest(BITJOIN,155)@1
    cStage_uid156_lzCountVal_uid85_fpAddTest_q <= vStage_uid155_lzCountVal_uid85_fpAddTest_b & mO_uid154_lzCountVal_uid85_fpAddTest_q;

    -- vStagei_uid158_lzCountVal_uid85_fpAddTest(MUX,157)@1
    vStagei_uid158_lzCountVal_uid85_fpAddTest_s <= vCount_uid153_lzCountVal_uid85_fpAddTest_q;
    vStagei_uid158_lzCountVal_uid85_fpAddTest_combproc: PROCESS (vStagei_uid158_lzCountVal_uid85_fpAddTest_s, rVStage_uid152_lzCountVal_uid85_fpAddTest_b, cStage_uid156_lzCountVal_uid85_fpAddTest_q)
    BEGIN
        CASE (vStagei_uid158_lzCountVal_uid85_fpAddTest_s) IS
            WHEN "0" => vStagei_uid158_lzCountVal_uid85_fpAddTest_q <= rVStage_uid152_lzCountVal_uid85_fpAddTest_b;
            WHEN "1" => vStagei_uid158_lzCountVal_uid85_fpAddTest_q <= cStage_uid156_lzCountVal_uid85_fpAddTest_q;
            WHEN OTHERS => vStagei_uid158_lzCountVal_uid85_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid160_lzCountVal_uid85_fpAddTest_merged_bit_select(BITSELECT,234)@1
    rVStage_uid160_lzCountVal_uid85_fpAddTest_merged_bit_select_b <= vStagei_uid158_lzCountVal_uid85_fpAddTest_q(7 downto 4);
    rVStage_uid160_lzCountVal_uid85_fpAddTest_merged_bit_select_c <= vStagei_uid158_lzCountVal_uid85_fpAddTest_q(3 downto 0);

    -- vCount_uid161_lzCountVal_uid85_fpAddTest(LOGICAL,160)@1
    vCount_uid161_lzCountVal_uid85_fpAddTest_q <= "1" WHEN rVStage_uid160_lzCountVal_uid85_fpAddTest_merged_bit_select_b = zs_uid159_lzCountVal_uid85_fpAddTest_q ELSE "0";

    -- vStagei_uid164_lzCountVal_uid85_fpAddTest(MUX,163)@1
    vStagei_uid164_lzCountVal_uid85_fpAddTest_s <= vCount_uid161_lzCountVal_uid85_fpAddTest_q;
    vStagei_uid164_lzCountVal_uid85_fpAddTest_combproc: PROCESS (vStagei_uid164_lzCountVal_uid85_fpAddTest_s, rVStage_uid160_lzCountVal_uid85_fpAddTest_merged_bit_select_b, rVStage_uid160_lzCountVal_uid85_fpAddTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid164_lzCountVal_uid85_fpAddTest_s) IS
            WHEN "0" => vStagei_uid164_lzCountVal_uid85_fpAddTest_q <= rVStage_uid160_lzCountVal_uid85_fpAddTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid164_lzCountVal_uid85_fpAddTest_q <= rVStage_uid160_lzCountVal_uid85_fpAddTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid164_lzCountVal_uid85_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select(BITSELECT,235)@1
    rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_b <= vStagei_uid164_lzCountVal_uid85_fpAddTest_q(3 downto 2);
    rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_c <= vStagei_uid164_lzCountVal_uid85_fpAddTest_q(1 downto 0);

    -- vCount_uid167_lzCountVal_uid85_fpAddTest(LOGICAL,166)@1
    vCount_uid167_lzCountVal_uid85_fpAddTest_q <= "1" WHEN rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_b = zs_uid165_lzCountVal_uid85_fpAddTest_q ELSE "0";

    -- vStagei_uid170_lzCountVal_uid85_fpAddTest(MUX,169)@1
    vStagei_uid170_lzCountVal_uid85_fpAddTest_s <= vCount_uid167_lzCountVal_uid85_fpAddTest_q;
    vStagei_uid170_lzCountVal_uid85_fpAddTest_combproc: PROCESS (vStagei_uid170_lzCountVal_uid85_fpAddTest_s, rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_b, rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid170_lzCountVal_uid85_fpAddTest_s) IS
            WHEN "0" => vStagei_uid170_lzCountVal_uid85_fpAddTest_q <= rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_b;
            WHEN "1" => vStagei_uid170_lzCountVal_uid85_fpAddTest_q <= rVStage_uid166_lzCountVal_uid85_fpAddTest_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid170_lzCountVal_uid85_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid172_lzCountVal_uid85_fpAddTest(BITSELECT,171)@1
    rVStage_uid172_lzCountVal_uid85_fpAddTest_b <= vStagei_uid170_lzCountVal_uid85_fpAddTest_q(1 downto 1);

    -- vCount_uid173_lzCountVal_uid85_fpAddTest(LOGICAL,172)@1
    vCount_uid173_lzCountVal_uid85_fpAddTest_q <= "1" WHEN rVStage_uid172_lzCountVal_uid85_fpAddTest_b = GND_q ELSE "0";

    -- r_uid174_lzCountVal_uid85_fpAddTest(BITJOIN,173)@1
    r_uid174_lzCountVal_uid85_fpAddTest_q <= vCount_uid153_lzCountVal_uid85_fpAddTest_q & vCount_uid161_lzCountVal_uid85_fpAddTest_q & vCount_uid167_lzCountVal_uid85_fpAddTest_q & vCount_uid173_lzCountVal_uid85_fpAddTest_q;

    -- aMinusA_uid87_fpAddTest(LOGICAL,86)@1
    aMinusA_uid87_fpAddTest_q <= "1" WHEN r_uid174_lzCountVal_uid85_fpAddTest_q = cAmA_uid86_fpAddTest_q ELSE "0";

    -- invAMinusA_uid130_fpAddTest(LOGICAL,129)@1
    invAMinusA_uid130_fpAddTest_q <= not (aMinusA_uid87_fpAddTest_q);

    -- redist5_sigA_uid50_fpAddTest_b_1(DELAY,242)
    redist5_sigA_uid50_fpAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigA_uid50_fpAddTest_b, xout => redist5_sigA_uid50_fpAddTest_b_1_q, clk => clk, aclr => areset );

    -- cstAllOWE_uid18_fpAddTest(CONSTANT,17)
    cstAllOWE_uid18_fpAddTest_q <= "11111";

    -- expXIsMax_uid38_fpAddTest(LOGICAL,37)@0 + 1
    expXIsMax_uid38_fpAddTest_qi <= "1" WHEN exp_bSig_uid35_fpAddTest_b = cstAllOWE_uid18_fpAddTest_q ELSE "0";
    expXIsMax_uid38_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid38_fpAddTest_qi, xout => expXIsMax_uid38_fpAddTest_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid43_fpAddTest(LOGICAL,42)@1
    invExpXIsMax_uid43_fpAddTest_q <= not (expXIsMax_uid38_fpAddTest_q);

    -- redist6_InvExpXIsZero_uid44_fpAddTest_q_1(DELAY,243)
    redist6_InvExpXIsZero_uid44_fpAddTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => InvExpXIsZero_uid44_fpAddTest_q, xout => redist6_InvExpXIsZero_uid44_fpAddTest_q_1_q, clk => clk, aclr => areset );

    -- excR_bSig_uid45_fpAddTest(LOGICAL,44)@1
    excR_bSig_uid45_fpAddTest_q <= redist6_InvExpXIsZero_uid44_fpAddTest_q_1_q and invExpXIsMax_uid43_fpAddTest_q;

    -- redist13_exp_aSig_uid21_fpAddTest_b_1(DELAY,250)
    redist13_exp_aSig_uid21_fpAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_aSig_uid21_fpAddTest_b, xout => redist13_exp_aSig_uid21_fpAddTest_b_1_q, clk => clk, aclr => areset );

    -- expXIsMax_uid24_fpAddTest(LOGICAL,23)@1
    expXIsMax_uid24_fpAddTest_q <= "1" WHEN redist13_exp_aSig_uid21_fpAddTest_b_1_q = cstAllOWE_uid18_fpAddTest_q ELSE "0";

    -- invExpXIsMax_uid29_fpAddTest(LOGICAL,28)@1
    invExpXIsMax_uid29_fpAddTest_q <= not (expXIsMax_uid24_fpAddTest_q);

    -- excZ_aSig_uid16_uid23_fpAddTest(LOGICAL,22)@1
    excZ_aSig_uid16_uid23_fpAddTest_q <= "1" WHEN redist13_exp_aSig_uid21_fpAddTest_b_1_q = cstAllZWE_uid20_fpAddTest_q ELSE "0";

    -- InvExpXIsZero_uid30_fpAddTest(LOGICAL,29)@1
    InvExpXIsZero_uid30_fpAddTest_q <= not (excZ_aSig_uid16_uid23_fpAddTest_q);

    -- excR_aSig_uid31_fpAddTest(LOGICAL,30)@1
    excR_aSig_uid31_fpAddTest_q <= InvExpXIsZero_uid30_fpAddTest_q and invExpXIsMax_uid29_fpAddTest_q;

    -- signRReg_uid131_fpAddTest(LOGICAL,130)@1
    signRReg_uid131_fpAddTest_q <= excR_aSig_uid31_fpAddTest_q and excR_bSig_uid45_fpAddTest_q and redist5_sigA_uid50_fpAddTest_b_1_q and invAMinusA_uid130_fpAddTest_q;

    -- redist4_sigB_uid51_fpAddTest_b_1(DELAY,241)
    redist4_sigB_uid51_fpAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigB_uid51_fpAddTest_b, xout => redist4_sigB_uid51_fpAddTest_b_1_q, clk => clk, aclr => areset );

    -- redist8_excZ_bSig_uid17_uid37_fpAddTest_q_1(DELAY,245)
    redist8_excZ_bSig_uid17_uid37_fpAddTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_bSig_uid17_uid37_fpAddTest_q, xout => redist8_excZ_bSig_uid17_uid37_fpAddTest_q_1_q, clk => clk, aclr => areset );

    -- excAZBZSigASigB_uid135_fpAddTest(LOGICAL,134)@1
    excAZBZSigASigB_uid135_fpAddTest_q <= excZ_aSig_uid16_uid23_fpAddTest_q and redist8_excZ_bSig_uid17_uid37_fpAddTest_q_1_q and redist5_sigA_uid50_fpAddTest_b_1_q and redist4_sigB_uid51_fpAddTest_b_1_q;

    -- excBZARSigA_uid136_fpAddTest(LOGICAL,135)@1
    excBZARSigA_uid136_fpAddTest_q <= redist8_excZ_bSig_uid17_uid37_fpAddTest_q_1_q and excR_aSig_uid31_fpAddTest_q and redist5_sigA_uid50_fpAddTest_b_1_q;

    -- signRZero_uid137_fpAddTest(LOGICAL,136)@1
    signRZero_uid137_fpAddTest_q <= excBZARSigA_uid136_fpAddTest_q or excAZBZSigASigB_uid135_fpAddTest_q;

    -- fracXIsZero_uid39_fpAddTest(LOGICAL,38)@0 + 1
    fracXIsZero_uid39_fpAddTest_qi <= "1" WHEN cstZeroWF_uid19_fpAddTest_q = frac_bSig_uid36_fpAddTest_b ELSE "0";
    fracXIsZero_uid39_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid39_fpAddTest_qi, xout => fracXIsZero_uid39_fpAddTest_q, clk => clk, aclr => areset );

    -- excI_bSig_uid41_fpAddTest(LOGICAL,40)@1
    excI_bSig_uid41_fpAddTest_q <= expXIsMax_uid38_fpAddTest_q and fracXIsZero_uid39_fpAddTest_q;

    -- sigBBInf_uid132_fpAddTest(LOGICAL,131)@1
    sigBBInf_uid132_fpAddTest_q <= redist4_sigB_uid51_fpAddTest_b_1_q and excI_bSig_uid41_fpAddTest_q;

    -- fracXIsZero_uid25_fpAddTest(LOGICAL,24)@1
    fracXIsZero_uid25_fpAddTest_q <= "1" WHEN cstZeroWF_uid19_fpAddTest_q = redist12_frac_aSig_uid22_fpAddTest_b_1_q ELSE "0";

    -- excI_aSig_uid27_fpAddTest(LOGICAL,26)@1
    excI_aSig_uid27_fpAddTest_q <= expXIsMax_uid24_fpAddTest_q and fracXIsZero_uid25_fpAddTest_q;

    -- sigAAInf_uid133_fpAddTest(LOGICAL,132)@1
    sigAAInf_uid133_fpAddTest_q <= redist5_sigA_uid50_fpAddTest_b_1_q and excI_aSig_uid27_fpAddTest_q;

    -- signRInf_uid134_fpAddTest(LOGICAL,133)@1
    signRInf_uid134_fpAddTest_q <= sigAAInf_uid133_fpAddTest_q or sigBBInf_uid132_fpAddTest_q;

    -- signRInfRZRReg_uid138_fpAddTest(LOGICAL,137)@1 + 1
    signRInfRZRReg_uid138_fpAddTest_qi <= signRInf_uid134_fpAddTest_q or signRZero_uid137_fpAddTest_q or signRReg_uid131_fpAddTest_q;
    signRInfRZRReg_uid138_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRInfRZRReg_uid138_fpAddTest_qi, xout => signRInfRZRReg_uid138_fpAddTest_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid40_fpAddTest(LOGICAL,39)@1
    fracXIsNotZero_uid40_fpAddTest_q <= not (fracXIsZero_uid39_fpAddTest_q);

    -- excN_bSig_uid42_fpAddTest(LOGICAL,41)@1 + 1
    excN_bSig_uid42_fpAddTest_qi <= expXIsMax_uid38_fpAddTest_q and fracXIsNotZero_uid40_fpAddTest_q;
    excN_bSig_uid42_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_bSig_uid42_fpAddTest_qi, xout => excN_bSig_uid42_fpAddTest_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid26_fpAddTest(LOGICAL,25)@1
    fracXIsNotZero_uid26_fpAddTest_q <= not (fracXIsZero_uid25_fpAddTest_q);

    -- excN_aSig_uid28_fpAddTest(LOGICAL,27)@1 + 1
    excN_aSig_uid28_fpAddTest_qi <= expXIsMax_uid24_fpAddTest_q and fracXIsNotZero_uid26_fpAddTest_q;
    excN_aSig_uid28_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_aSig_uid28_fpAddTest_qi, xout => excN_aSig_uid28_fpAddTest_q, clk => clk, aclr => areset );

    -- excRNaN2_uid125_fpAddTest(LOGICAL,124)@2
    excRNaN2_uid125_fpAddTest_q <= excN_aSig_uid28_fpAddTest_q or excN_bSig_uid42_fpAddTest_q;

    -- redist3_effSub_uid52_fpAddTest_q_2(DELAY,240)
    redist3_effSub_uid52_fpAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid52_fpAddTest_q, xout => redist3_effSub_uid52_fpAddTest_q_2_q, clk => clk, aclr => areset );

    -- redist7_excI_bSig_uid41_fpAddTest_q_1(DELAY,244)
    redist7_excI_bSig_uid41_fpAddTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_bSig_uid41_fpAddTest_q, xout => redist7_excI_bSig_uid41_fpAddTest_q_1_q, clk => clk, aclr => areset );

    -- redist10_excI_aSig_uid27_fpAddTest_q_1(DELAY,247)
    redist10_excI_aSig_uid27_fpAddTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_aSig_uid27_fpAddTest_q, xout => redist10_excI_aSig_uid27_fpAddTest_q_1_q, clk => clk, aclr => areset );

    -- excAIBISub_uid126_fpAddTest(LOGICAL,125)@2
    excAIBISub_uid126_fpAddTest_q <= redist10_excI_aSig_uid27_fpAddTest_q_1_q and redist7_excI_bSig_uid41_fpAddTest_q_1_q and redist3_effSub_uid52_fpAddTest_q_2_q;

    -- excRNaN_uid127_fpAddTest(LOGICAL,126)@2
    excRNaN_uid127_fpAddTest_q <= excAIBISub_uid126_fpAddTest_q or excRNaN2_uid125_fpAddTest_q;

    -- invExcRNaN_uid139_fpAddTest(LOGICAL,138)@2
    invExcRNaN_uid139_fpAddTest_q <= not (excRNaN_uid127_fpAddTest_q);

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signRPostExc_uid140_fpAddTest(LOGICAL,139)@2
    signRPostExc_uid140_fpAddTest_q <= invExcRNaN_uid139_fpAddTest_q and signRInfRZRReg_uid138_fpAddTest_q;

    -- cRBit_uid99_fpAddTest(CONSTANT,98)
    cRBit_uid99_fpAddTest_q <= "01000";

    -- leftShiftStage1Idx3Rng3_uid228_fracPostNormExt_uid88_fpAddTest(BITSELECT,227)@1
    leftShiftStage1Idx3Rng3_uid228_fracPostNormExt_uid88_fpAddTest_in <= leftShiftStage0_uid220_fracPostNormExt_uid88_fpAddTest_q(11 downto 0);
    leftShiftStage1Idx3Rng3_uid228_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage1Idx3Rng3_uid228_fracPostNormExt_uid88_fpAddTest_in(11 downto 0);

    -- leftShiftStage1Idx3Pad3_uid227_fracPostNormExt_uid88_fpAddTest(CONSTANT,226)
    leftShiftStage1Idx3Pad3_uid227_fracPostNormExt_uid88_fpAddTest_q <= "000";

    -- leftShiftStage1Idx3_uid229_fracPostNormExt_uid88_fpAddTest(BITJOIN,228)@1
    leftShiftStage1Idx3_uid229_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1Idx3Rng3_uid228_fracPostNormExt_uid88_fpAddTest_b & leftShiftStage1Idx3Pad3_uid227_fracPostNormExt_uid88_fpAddTest_q;

    -- leftShiftStage1Idx2Rng2_uid225_fracPostNormExt_uid88_fpAddTest(BITSELECT,224)@1
    leftShiftStage1Idx2Rng2_uid225_fracPostNormExt_uid88_fpAddTest_in <= leftShiftStage0_uid220_fracPostNormExt_uid88_fpAddTest_q(12 downto 0);
    leftShiftStage1Idx2Rng2_uid225_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage1Idx2Rng2_uid225_fracPostNormExt_uid88_fpAddTest_in(12 downto 0);

    -- leftShiftStage1Idx2_uid226_fracPostNormExt_uid88_fpAddTest(BITJOIN,225)@1
    leftShiftStage1Idx2_uid226_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1Idx2Rng2_uid225_fracPostNormExt_uid88_fpAddTest_b & zs_uid165_lzCountVal_uid85_fpAddTest_q;

    -- leftShiftStage1Idx1Rng1_uid222_fracPostNormExt_uid88_fpAddTest(BITSELECT,221)@1
    leftShiftStage1Idx1Rng1_uid222_fracPostNormExt_uid88_fpAddTest_in <= leftShiftStage0_uid220_fracPostNormExt_uid88_fpAddTest_q(13 downto 0);
    leftShiftStage1Idx1Rng1_uid222_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage1Idx1Rng1_uid222_fracPostNormExt_uid88_fpAddTest_in(13 downto 0);

    -- leftShiftStage1Idx1_uid223_fracPostNormExt_uid88_fpAddTest(BITJOIN,222)@1
    leftShiftStage1Idx1_uid223_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1Idx1Rng1_uid222_fracPostNormExt_uid88_fpAddTest_b & GND_q;

    -- leftShiftStage0Idx3Rng12_uid217_fracPostNormExt_uid88_fpAddTest(BITSELECT,216)@1
    leftShiftStage0Idx3Rng12_uid217_fracPostNormExt_uid88_fpAddTest_in <= fracGRS_uid84_fpAddTest_q(2 downto 0);
    leftShiftStage0Idx3Rng12_uid217_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage0Idx3Rng12_uid217_fracPostNormExt_uid88_fpAddTest_in(2 downto 0);

    -- leftShiftStage0Idx3_uid218_fracPostNormExt_uid88_fpAddTest(BITJOIN,217)@1
    leftShiftStage0Idx3_uid218_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage0Idx3Rng12_uid217_fracPostNormExt_uid88_fpAddTest_b & padConst_uid64_fpAddTest_q;

    -- leftShiftStage0Idx2_uid215_fracPostNormExt_uid88_fpAddTest(BITJOIN,214)@1
    leftShiftStage0Idx2_uid215_fracPostNormExt_uid88_fpAddTest_q <= vStage_uid155_lzCountVal_uid85_fpAddTest_b & zs_uid151_lzCountVal_uid85_fpAddTest_q;

    -- leftShiftStage0Idx1Rng4_uid211_fracPostNormExt_uid88_fpAddTest(BITSELECT,210)@1
    leftShiftStage0Idx1Rng4_uid211_fracPostNormExt_uid88_fpAddTest_in <= fracGRS_uid84_fpAddTest_q(10 downto 0);
    leftShiftStage0Idx1Rng4_uid211_fracPostNormExt_uid88_fpAddTest_b <= leftShiftStage0Idx1Rng4_uid211_fracPostNormExt_uid88_fpAddTest_in(10 downto 0);

    -- leftShiftStage0Idx1_uid212_fracPostNormExt_uid88_fpAddTest(BITJOIN,211)@1
    leftShiftStage0Idx1_uid212_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage0Idx1Rng4_uid211_fracPostNormExt_uid88_fpAddTest_b & zs_uid159_lzCountVal_uid85_fpAddTest_q;

    -- leftShiftStage0_uid220_fracPostNormExt_uid88_fpAddTest(MUX,219)@1
    leftShiftStage0_uid220_fracPostNormExt_uid88_fpAddTest_s <= leftShiftStageSel3Dto2_uid219_fracPostNormExt_uid88_fpAddTest_merged_bit_select_b;
    leftShiftStage0_uid220_fracPostNormExt_uid88_fpAddTest_combproc: PROCESS (leftShiftStage0_uid220_fracPostNormExt_uid88_fpAddTest_s, fracGRS_uid84_fpAddTest_q, leftShiftStage0Idx1_uid212_fracPostNormExt_uid88_fpAddTest_q, leftShiftStage0Idx2_uid215_fracPostNormExt_uid88_fpAddTest_q, leftShiftStage0Idx3_uid218_fracPostNormExt_uid88_fpAddTest_q)
    BEGIN
        CASE (leftShiftStage0_uid220_fracPostNormExt_uid88_fpAddTest_s) IS
            WHEN "00" => leftShiftStage0_uid220_fracPostNormExt_uid88_fpAddTest_q <= fracGRS_uid84_fpAddTest_q;
            WHEN "01" => leftShiftStage0_uid220_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage0Idx1_uid212_fracPostNormExt_uid88_fpAddTest_q;
            WHEN "10" => leftShiftStage0_uid220_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage0Idx2_uid215_fracPostNormExt_uid88_fpAddTest_q;
            WHEN "11" => leftShiftStage0_uid220_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage0Idx3_uid218_fracPostNormExt_uid88_fpAddTest_q;
            WHEN OTHERS => leftShiftStage0_uid220_fracPostNormExt_uid88_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStageSel3Dto2_uid219_fracPostNormExt_uid88_fpAddTest_merged_bit_select(BITSELECT,236)@1
    leftShiftStageSel3Dto2_uid219_fracPostNormExt_uid88_fpAddTest_merged_bit_select_b <= r_uid174_lzCountVal_uid85_fpAddTest_q(3 downto 2);
    leftShiftStageSel3Dto2_uid219_fracPostNormExt_uid88_fpAddTest_merged_bit_select_c <= r_uid174_lzCountVal_uid85_fpAddTest_q(1 downto 0);

    -- leftShiftStage1_uid231_fracPostNormExt_uid88_fpAddTest(MUX,230)@1
    leftShiftStage1_uid231_fracPostNormExt_uid88_fpAddTest_s <= leftShiftStageSel3Dto2_uid219_fracPostNormExt_uid88_fpAddTest_merged_bit_select_c;
    leftShiftStage1_uid231_fracPostNormExt_uid88_fpAddTest_combproc: PROCESS (leftShiftStage1_uid231_fracPostNormExt_uid88_fpAddTest_s, leftShiftStage0_uid220_fracPostNormExt_uid88_fpAddTest_q, leftShiftStage1Idx1_uid223_fracPostNormExt_uid88_fpAddTest_q, leftShiftStage1Idx2_uid226_fracPostNormExt_uid88_fpAddTest_q, leftShiftStage1Idx3_uid229_fracPostNormExt_uid88_fpAddTest_q)
    BEGIN
        CASE (leftShiftStage1_uid231_fracPostNormExt_uid88_fpAddTest_s) IS
            WHEN "00" => leftShiftStage1_uid231_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage0_uid220_fracPostNormExt_uid88_fpAddTest_q;
            WHEN "01" => leftShiftStage1_uid231_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1Idx1_uid223_fracPostNormExt_uid88_fpAddTest_q;
            WHEN "10" => leftShiftStage1_uid231_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1Idx2_uid226_fracPostNormExt_uid88_fpAddTest_q;
            WHEN "11" => leftShiftStage1_uid231_fracPostNormExt_uid88_fpAddTest_q <= leftShiftStage1Idx3_uid229_fracPostNormExt_uid88_fpAddTest_q;
            WHEN OTHERS => leftShiftStage1_uid231_fracPostNormExt_uid88_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- LSB_uid97_fpAddTest(BITSELECT,96)@1
    LSB_uid97_fpAddTest_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid231_fracPostNormExt_uid88_fpAddTest_q(4 downto 0));
    LSB_uid97_fpAddTest_b <= STD_LOGIC_VECTOR(LSB_uid97_fpAddTest_in(4 downto 4));

    -- Guard_uid96_fpAddTest(BITSELECT,95)@1
    Guard_uid96_fpAddTest_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid231_fracPostNormExt_uid88_fpAddTest_q(3 downto 0));
    Guard_uid96_fpAddTest_b <= STD_LOGIC_VECTOR(Guard_uid96_fpAddTest_in(3 downto 3));

    -- Round_uid95_fpAddTest(BITSELECT,94)@1
    Round_uid95_fpAddTest_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid231_fracPostNormExt_uid88_fpAddTest_q(2 downto 0));
    Round_uid95_fpAddTest_b <= STD_LOGIC_VECTOR(Round_uid95_fpAddTest_in(2 downto 2));

    -- Sticky1_uid94_fpAddTest(BITSELECT,93)@1
    Sticky1_uid94_fpAddTest_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid231_fracPostNormExt_uid88_fpAddTest_q(1 downto 0));
    Sticky1_uid94_fpAddTest_b <= STD_LOGIC_VECTOR(Sticky1_uid94_fpAddTest_in(1 downto 1));

    -- Sticky0_uid93_fpAddTest(BITSELECT,92)@1
    Sticky0_uid93_fpAddTest_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid231_fracPostNormExt_uid88_fpAddTest_q(0 downto 0));
    Sticky0_uid93_fpAddTest_b <= STD_LOGIC_VECTOR(Sticky0_uid93_fpAddTest_in(0 downto 0));

    -- rndBitCond_uid98_fpAddTest(BITJOIN,97)@1
    rndBitCond_uid98_fpAddTest_q <= LSB_uid97_fpAddTest_b & Guard_uid96_fpAddTest_b & Round_uid95_fpAddTest_b & Sticky1_uid94_fpAddTest_b & Sticky0_uid93_fpAddTest_b;

    -- rBi_uid100_fpAddTest(LOGICAL,99)@1 + 1
    rBi_uid100_fpAddTest_qi <= "1" WHEN rndBitCond_uid98_fpAddTest_q = cRBit_uid99_fpAddTest_q ELSE "0";
    rBi_uid100_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rBi_uid100_fpAddTest_qi, xout => rBi_uid100_fpAddTest_q, clk => clk, aclr => areset );

    -- roundBit_uid101_fpAddTest(LOGICAL,100)@2
    roundBit_uid101_fpAddTest_q <= not (rBi_uid100_fpAddTest_q);

    -- oneCST_uid90_fpAddTest(CONSTANT,89)
    oneCST_uid90_fpAddTest_q <= "00001";

    -- expInc_uid91_fpAddTest(ADD,90)@1
    expInc_uid91_fpAddTest_a <= STD_LOGIC_VECTOR("0" & redist13_exp_aSig_uid21_fpAddTest_b_1_q);
    expInc_uid91_fpAddTest_b <= STD_LOGIC_VECTOR("0" & oneCST_uid90_fpAddTest_q);
    expInc_uid91_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expInc_uid91_fpAddTest_a) + UNSIGNED(expInc_uid91_fpAddTest_b));
    expInc_uid91_fpAddTest_q <= expInc_uid91_fpAddTest_o(5 downto 0);

    -- expPostNorm_uid92_fpAddTest(SUB,91)@1 + 1
    expPostNorm_uid92_fpAddTest_a <= STD_LOGIC_VECTOR("0" & expInc_uid91_fpAddTest_q);
    expPostNorm_uid92_fpAddTest_b <= STD_LOGIC_VECTOR("000" & r_uid174_lzCountVal_uid85_fpAddTest_q);
    expPostNorm_uid92_fpAddTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPostNorm_uid92_fpAddTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expPostNorm_uid92_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNorm_uid92_fpAddTest_a) - UNSIGNED(expPostNorm_uid92_fpAddTest_b));
        END IF;
    END PROCESS;
    expPostNorm_uid92_fpAddTest_q <= expPostNorm_uid92_fpAddTest_o(6 downto 0);

    -- fracPostNorm_uid89_fpAddTest(BITSELECT,88)@1
    fracPostNorm_uid89_fpAddTest_b <= leftShiftStage1_uid231_fracPostNormExt_uid88_fpAddTest_q(14 downto 1);

    -- fracPostNormRndRange_uid102_fpAddTest(BITSELECT,101)@1
    fracPostNormRndRange_uid102_fpAddTest_in <= fracPostNorm_uid89_fpAddTest_b(12 downto 0);
    fracPostNormRndRange_uid102_fpAddTest_b <= fracPostNormRndRange_uid102_fpAddTest_in(12 downto 2);

    -- redist1_fracPostNormRndRange_uid102_fpAddTest_b_1(DELAY,238)
    redist1_fracPostNormRndRange_uid102_fpAddTest_b_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracPostNormRndRange_uid102_fpAddTest_b, xout => redist1_fracPostNormRndRange_uid102_fpAddTest_b_1_q, clk => clk, aclr => areset );

    -- expFracR_uid103_fpAddTest(BITJOIN,102)@2
    expFracR_uid103_fpAddTest_q <= expPostNorm_uid92_fpAddTest_q & redist1_fracPostNormRndRange_uid102_fpAddTest_b_1_q;

    -- rndExpFrac_uid104_fpAddTest(ADD,103)@2
    rndExpFrac_uid104_fpAddTest_a <= STD_LOGIC_VECTOR("0" & expFracR_uid103_fpAddTest_q);
    rndExpFrac_uid104_fpAddTest_b <= STD_LOGIC_VECTOR("000000000000000000" & roundBit_uid101_fpAddTest_q);
    rndExpFrac_uid104_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(rndExpFrac_uid104_fpAddTest_a) + UNSIGNED(rndExpFrac_uid104_fpAddTest_b));
    rndExpFrac_uid104_fpAddTest_q <= rndExpFrac_uid104_fpAddTest_o(18 downto 0);

    -- expRPreExc_uid118_fpAddTest(BITSELECT,117)@2
    expRPreExc_uid118_fpAddTest_in <= rndExpFrac_uid104_fpAddTest_q(15 downto 0);
    expRPreExc_uid118_fpAddTest_b <= expRPreExc_uid118_fpAddTest_in(15 downto 11);

    -- rndExpFracOvfBits_uid109_fpAddTest(BITSELECT,108)@2
    rndExpFracOvfBits_uid109_fpAddTest_in <= rndExpFrac_uid104_fpAddTest_q(17 downto 0);
    rndExpFracOvfBits_uid109_fpAddTest_b <= rndExpFracOvfBits_uid109_fpAddTest_in(17 downto 16);

    -- rOvfExtraBits_uid110_fpAddTest(COMPARE,109)@2
    rOvfExtraBits_uid110_fpAddTest_a <= STD_LOGIC_VECTOR("00" & rndExpFracOvfBits_uid109_fpAddTest_b);
    rOvfExtraBits_uid110_fpAddTest_b <= STD_LOGIC_VECTOR("00" & zocst_uid76_fpAddTest_q);
    rOvfExtraBits_uid110_fpAddTest_o <= STD_LOGIC_VECTOR(UNSIGNED(rOvfExtraBits_uid110_fpAddTest_a) - UNSIGNED(rOvfExtraBits_uid110_fpAddTest_b));
    rOvfExtraBits_uid110_fpAddTest_n(0) <= not (rOvfExtraBits_uid110_fpAddTest_o(3));

    -- wEP2AllOwE_uid105_fpAddTest(CONSTANT,104)
    wEP2AllOwE_uid105_fpAddTest_q <= "0011111";

    -- rndExp_uid106_fpAddTest(BITSELECT,105)@2
    rndExp_uid106_fpAddTest_in <= rndExpFrac_uid104_fpAddTest_q(17 downto 0);
    rndExp_uid106_fpAddTest_b <= rndExp_uid106_fpAddTest_in(17 downto 11);

    -- rOvfEQMax_uid107_fpAddTest(LOGICAL,106)@2
    rOvfEQMax_uid107_fpAddTest_q <= "1" WHEN rndExp_uid106_fpAddTest_b = wEP2AllOwE_uid105_fpAddTest_q ELSE "0";

    -- rOvf_uid111_fpAddTest(LOGICAL,110)@2
    rOvf_uid111_fpAddTest_q <= rOvfEQMax_uid107_fpAddTest_q or rOvfExtraBits_uid110_fpAddTest_n;

    -- regInputs_uid119_fpAddTest(LOGICAL,118)@1 + 1
    regInputs_uid119_fpAddTest_qi <= excR_aSig_uid31_fpAddTest_q and excR_bSig_uid45_fpAddTest_q;
    regInputs_uid119_fpAddTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => regInputs_uid119_fpAddTest_qi, xout => regInputs_uid119_fpAddTest_q, clk => clk, aclr => areset );

    -- rInfOvf_uid122_fpAddTest(LOGICAL,121)@2
    rInfOvf_uid122_fpAddTest_q <= regInputs_uid119_fpAddTest_q and rOvf_uid111_fpAddTest_q;

    -- excRInfVInC_uid123_fpAddTest(BITJOIN,122)@2
    excRInfVInC_uid123_fpAddTest_q <= rInfOvf_uid122_fpAddTest_q & excN_bSig_uid42_fpAddTest_q & excN_aSig_uid28_fpAddTest_q & redist7_excI_bSig_uid41_fpAddTest_q_1_q & redist10_excI_aSig_uid27_fpAddTest_q_1_q & redist3_effSub_uid52_fpAddTest_q_2_q;

    -- excRInf_uid124_fpAddTest(LOOKUP,123)@2
    excRInf_uid124_fpAddTest_combproc: PROCESS (excRInfVInC_uid123_fpAddTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRInfVInC_uid123_fpAddTest_q) IS
            WHEN "000000" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "000001" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "000010" => excRInf_uid124_fpAddTest_q <= "1";
            WHEN "000011" => excRInf_uid124_fpAddTest_q <= "1";
            WHEN "000100" => excRInf_uid124_fpAddTest_q <= "1";
            WHEN "000101" => excRInf_uid124_fpAddTest_q <= "1";
            WHEN "000110" => excRInf_uid124_fpAddTest_q <= "1";
            WHEN "000111" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "001000" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "001001" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "001010" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "001011" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "001100" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "001101" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "001110" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "001111" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "010000" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "010001" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "010010" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "010011" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "010100" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "010101" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "010110" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "010111" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "011000" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "011001" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "011010" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "011011" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "011100" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "011101" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "011110" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "011111" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "100000" => excRInf_uid124_fpAddTest_q <= "1";
            WHEN "100001" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "100010" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "100011" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "100100" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "100101" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "100110" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "100111" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "101000" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "101001" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "101010" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "101011" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "101100" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "101101" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "101110" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "101111" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "110000" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "110001" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "110010" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "110011" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "110100" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "110101" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "110110" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "110111" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "111000" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "111001" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "111010" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "111011" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "111100" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "111101" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "111110" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN "111111" => excRInf_uid124_fpAddTest_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRInf_uid124_fpAddTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- redist2_aMinusA_uid87_fpAddTest_q_1(DELAY,239)
    redist2_aMinusA_uid87_fpAddTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aMinusA_uid87_fpAddTest_q, xout => redist2_aMinusA_uid87_fpAddTest_q_1_q, clk => clk, aclr => areset );

    -- rUdfExtraBit_uid115_fpAddTest(BITSELECT,114)@2
    rUdfExtraBit_uid115_fpAddTest_in <= STD_LOGIC_VECTOR(rndExpFrac_uid104_fpAddTest_q(17 downto 0));
    rUdfExtraBit_uid115_fpAddTest_b <= STD_LOGIC_VECTOR(rUdfExtraBit_uid115_fpAddTest_in(17 downto 17));

    -- wEP2AllZ_uid112_fpAddTest(CONSTANT,111)
    wEP2AllZ_uid112_fpAddTest_q <= "0000000";

    -- rUdfEQMin_uid114_fpAddTest(LOGICAL,113)@2
    rUdfEQMin_uid114_fpAddTest_q <= "1" WHEN rndExp_uid106_fpAddTest_b = wEP2AllZ_uid112_fpAddTest_q ELSE "0";

    -- rUdf_uid116_fpAddTest(LOGICAL,115)@2
    rUdf_uid116_fpAddTest_q <= rUdfEQMin_uid114_fpAddTest_q or rUdfExtraBit_uid115_fpAddTest_b;

    -- redist9_excZ_bSig_uid17_uid37_fpAddTest_q_2(DELAY,246)
    redist9_excZ_bSig_uid17_uid37_fpAddTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist8_excZ_bSig_uid17_uid37_fpAddTest_q_1_q, xout => redist9_excZ_bSig_uid17_uid37_fpAddTest_q_2_q, clk => clk, aclr => areset );

    -- redist11_excZ_aSig_uid16_uid23_fpAddTest_q_1(DELAY,248)
    redist11_excZ_aSig_uid16_uid23_fpAddTest_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_aSig_uid16_uid23_fpAddTest_q, xout => redist11_excZ_aSig_uid16_uid23_fpAddTest_q_1_q, clk => clk, aclr => areset );

    -- excRZeroVInC_uid120_fpAddTest(BITJOIN,119)@2
    excRZeroVInC_uid120_fpAddTest_q <= redist2_aMinusA_uid87_fpAddTest_q_1_q & rUdf_uid116_fpAddTest_q & regInputs_uid119_fpAddTest_q & redist9_excZ_bSig_uid17_uid37_fpAddTest_q_2_q & redist11_excZ_aSig_uid16_uid23_fpAddTest_q_1_q;

    -- excRZero_uid121_fpAddTest(LOOKUP,120)@2
    excRZero_uid121_fpAddTest_combproc: PROCESS (excRZeroVInC_uid120_fpAddTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRZeroVInC_uid120_fpAddTest_q) IS
            WHEN "00000" => excRZero_uid121_fpAddTest_q <= "0";
            WHEN "00001" => excRZero_uid121_fpAddTest_q <= "0";
            WHEN "00010" => excRZero_uid121_fpAddTest_q <= "0";
            WHEN "00011" => excRZero_uid121_fpAddTest_q <= "1";
            WHEN "00100" => excRZero_uid121_fpAddTest_q <= "0";
            WHEN "00101" => excRZero_uid121_fpAddTest_q <= "0";
            WHEN "00110" => excRZero_uid121_fpAddTest_q <= "0";
            WHEN "00111" => excRZero_uid121_fpAddTest_q <= "0";
            WHEN "01000" => excRZero_uid121_fpAddTest_q <= "0";
            WHEN "01001" => excRZero_uid121_fpAddTest_q <= "0";
            WHEN "01010" => excRZero_uid121_fpAddTest_q <= "0";
            WHEN "01011" => excRZero_uid121_fpAddTest_q <= "1";
            WHEN "01100" => excRZero_uid121_fpAddTest_q <= "1";
            WHEN "01101" => excRZero_uid121_fpAddTest_q <= "0";
            WHEN "01110" => excRZero_uid121_fpAddTest_q <= "0";
            WHEN "01111" => excRZero_uid121_fpAddTest_q <= "0";
            WHEN "10000" => excRZero_uid121_fpAddTest_q <= "0";
            WHEN "10001" => excRZero_uid121_fpAddTest_q <= "0";
            WHEN "10010" => excRZero_uid121_fpAddTest_q <= "0";
            WHEN "10011" => excRZero_uid121_fpAddTest_q <= "1";
            WHEN "10100" => excRZero_uid121_fpAddTest_q <= "1";
            WHEN "10101" => excRZero_uid121_fpAddTest_q <= "0";
            WHEN "10110" => excRZero_uid121_fpAddTest_q <= "0";
            WHEN "10111" => excRZero_uid121_fpAddTest_q <= "0";
            WHEN "11000" => excRZero_uid121_fpAddTest_q <= "0";
            WHEN "11001" => excRZero_uid121_fpAddTest_q <= "0";
            WHEN "11010" => excRZero_uid121_fpAddTest_q <= "0";
            WHEN "11011" => excRZero_uid121_fpAddTest_q <= "1";
            WHEN "11100" => excRZero_uid121_fpAddTest_q <= "1";
            WHEN "11101" => excRZero_uid121_fpAddTest_q <= "0";
            WHEN "11110" => excRZero_uid121_fpAddTest_q <= "0";
            WHEN "11111" => excRZero_uid121_fpAddTest_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRZero_uid121_fpAddTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- concExc_uid128_fpAddTest(BITJOIN,127)@2
    concExc_uid128_fpAddTest_q <= excRNaN_uid127_fpAddTest_q & excRInf_uid124_fpAddTest_q & excRZero_uid121_fpAddTest_q;

    -- excREnc_uid129_fpAddTest(LOOKUP,128)@2
    excREnc_uid129_fpAddTest_combproc: PROCESS (concExc_uid128_fpAddTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid128_fpAddTest_q) IS
            WHEN "000" => excREnc_uid129_fpAddTest_q <= "01";
            WHEN "001" => excREnc_uid129_fpAddTest_q <= "00";
            WHEN "010" => excREnc_uid129_fpAddTest_q <= "10";
            WHEN "011" => excREnc_uid129_fpAddTest_q <= "10";
            WHEN "100" => excREnc_uid129_fpAddTest_q <= "11";
            WHEN "101" => excREnc_uid129_fpAddTest_q <= "11";
            WHEN "110" => excREnc_uid129_fpAddTest_q <= "11";
            WHEN "111" => excREnc_uid129_fpAddTest_q <= "11";
            WHEN OTHERS => -- unreachable
                           excREnc_uid129_fpAddTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid148_fpAddTest(MUX,147)@2
    expRPostExc_uid148_fpAddTest_s <= excREnc_uid129_fpAddTest_q;
    expRPostExc_uid148_fpAddTest_combproc: PROCESS (expRPostExc_uid148_fpAddTest_s, cstAllZWE_uid20_fpAddTest_q, expRPreExc_uid118_fpAddTest_b, cstAllOWE_uid18_fpAddTest_q)
    BEGIN
        CASE (expRPostExc_uid148_fpAddTest_s) IS
            WHEN "00" => expRPostExc_uid148_fpAddTest_q <= cstAllZWE_uid20_fpAddTest_q;
            WHEN "01" => expRPostExc_uid148_fpAddTest_q <= expRPreExc_uid118_fpAddTest_b;
            WHEN "10" => expRPostExc_uid148_fpAddTest_q <= cstAllOWE_uid18_fpAddTest_q;
            WHEN "11" => expRPostExc_uid148_fpAddTest_q <= cstAllOWE_uid18_fpAddTest_q;
            WHEN OTHERS => expRPostExc_uid148_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid141_fpAddTest(CONSTANT,140)
    oneFracRPostExc2_uid141_fpAddTest_q <= "0000000001";

    -- fracRPreExc_uid117_fpAddTest(BITSELECT,116)@2
    fracRPreExc_uid117_fpAddTest_in <= rndExpFrac_uid104_fpAddTest_q(10 downto 0);
    fracRPreExc_uid117_fpAddTest_b <= fracRPreExc_uid117_fpAddTest_in(10 downto 1);

    -- fracRPostExc_uid144_fpAddTest(MUX,143)@2
    fracRPostExc_uid144_fpAddTest_s <= excREnc_uid129_fpAddTest_q;
    fracRPostExc_uid144_fpAddTest_combproc: PROCESS (fracRPostExc_uid144_fpAddTest_s, cstZeroWF_uid19_fpAddTest_q, fracRPreExc_uid117_fpAddTest_b, oneFracRPostExc2_uid141_fpAddTest_q)
    BEGIN
        CASE (fracRPostExc_uid144_fpAddTest_s) IS
            WHEN "00" => fracRPostExc_uid144_fpAddTest_q <= cstZeroWF_uid19_fpAddTest_q;
            WHEN "01" => fracRPostExc_uid144_fpAddTest_q <= fracRPreExc_uid117_fpAddTest_b;
            WHEN "10" => fracRPostExc_uid144_fpAddTest_q <= cstZeroWF_uid19_fpAddTest_q;
            WHEN "11" => fracRPostExc_uid144_fpAddTest_q <= oneFracRPostExc2_uid141_fpAddTest_q;
            WHEN OTHERS => fracRPostExc_uid144_fpAddTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid149_fpAddTest(BITJOIN,148)@2
    R_uid149_fpAddTest_q <= signRPostExc_uid140_fpAddTest_q & expRPostExc_uid148_fpAddTest_q & fracRPostExc_uid144_fpAddTest_q;

    -- xOut(GPOUT,4)@2
    q <= R_uid149_fpAddTest_q;

END normal;
