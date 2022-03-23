-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.1 (Release Build #625)
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
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

-- VHDL created from floatComponent_i_sfc_logic_c0_for_end_loopexit_avgpool2d_c0_enter10_avgpool2d19_A0Z8744ck26742c246j2x65
-- VHDL created on Sat Mar 12 13:30:05 2022


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

entity floatComponent_i_sfc_logic_c0_for_end_loopexit_avgpool2d_c0_enter10_avgpool2d19_A0Z8744ck26742c246j2x65 is
    port (
        in_0 : in std_logic_vector(31 downto 0);  -- sfix32
        out_primWireOut : out std_logic_vector(31 downto 0);  -- float32_m23
        clock : in std_logic;
        resetn : in std_logic
    );
end floatComponent_i_sfc_logic_c0_for_end_loopexit_avgpool2d_c0_enter10_avgpool2d19_A0Z8744ck26742c246j2x65;

architecture normal of floatComponent_i_sfc_logic_c0_for_end_loopexit_avgpool2d_c0_enter10_avgpool2d19_A0Z8744ck26742c246j2x65 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signX_uid6_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xXorSign_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (31 downto 0);
    signal xXorSign_uid7_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (31 downto 0);
    signal xXorSign_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal yE_uid8_block_rsrvd_fix_a : STD_LOGIC_VECTOR (32 downto 0);
    signal yE_uid8_block_rsrvd_fix_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yE_uid8_block_rsrvd_fix_o : STD_LOGIC_VECTOR (32 downto 0);
    signal yE_uid8_block_rsrvd_fix_q : STD_LOGIC_VECTOR (32 downto 0);
    signal y_uid9_block_rsrvd_fix_in : STD_LOGIC_VECTOR (31 downto 0);
    signal y_uid9_block_rsrvd_fix_b : STD_LOGIC_VECTOR (31 downto 0);
    signal maxCount_uid11_block_rsrvd_fix_q : STD_LOGIC_VECTOR (5 downto 0);
    signal inIsZero_uid12_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal inIsZero_uid12_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal msbIn_uid13_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expPreRnd_uid14_block_rsrvd_fix_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expPreRnd_uid14_block_rsrvd_fix_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expPreRnd_uid14_block_rsrvd_fix_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expPreRnd_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expFracRnd_uid16_block_rsrvd_fix_q : STD_LOGIC_VECTOR (32 downto 0);
    signal sticky_uid20_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal sticky_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal nr_uid21_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rnd_uid22_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rnd_uid22_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracR_uid24_block_rsrvd_fix_a : STD_LOGIC_VECTOR (34 downto 0);
    signal expFracR_uid24_block_rsrvd_fix_b : STD_LOGIC_VECTOR (34 downto 0);
    signal expFracR_uid24_block_rsrvd_fix_o : STD_LOGIC_VECTOR (34 downto 0);
    signal expFracR_uid24_block_rsrvd_fix_q : STD_LOGIC_VECTOR (33 downto 0);
    signal fracR_uid25_block_rsrvd_fix_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracR_uid25_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expR_uid26_block_rsrvd_fix_b : STD_LOGIC_VECTOR (9 downto 0);
    signal udf_uid27_block_rsrvd_fix_a : STD_LOGIC_VECTOR (11 downto 0);
    signal udf_uid27_block_rsrvd_fix_b : STD_LOGIC_VECTOR (11 downto 0);
    signal udf_uid27_block_rsrvd_fix_o : STD_LOGIC_VECTOR (11 downto 0);
    signal udf_uid27_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expInf_uid28_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal ovf_uid29_block_rsrvd_fix_a : STD_LOGIC_VECTOR (11 downto 0);
    signal ovf_uid29_block_rsrvd_fix_b : STD_LOGIC_VECTOR (11 downto 0);
    signal ovf_uid29_block_rsrvd_fix_o : STD_LOGIC_VECTOR (11 downto 0);
    signal ovf_uid29_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal excSelector_uid30_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracZ_uid31_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRPostExc_uid32_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostExc_uid32_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal udfOrInZero_uid33_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excSelector_uid34_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal expZ_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expR_uid38_block_rsrvd_fix_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expR_uid38_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expRPostExc_uid39_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid39_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal outRes_uid40_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid42_lzcShifterZ1_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid44_lzcShifterZ1_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid46_lzcShifterZ1_uid10_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid46_lzcShifterZ1_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid47_lzcShifterZ1_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid49_lzcShifterZ1_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cStage_uid52_lzcShifterZ1_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vStagei_uid53_lzcShifterZ1_uid10_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid53_lzcShifterZ1_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid56_lzcShifterZ1_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cStage_uid59_lzcShifterZ1_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vStagei_uid60_lzcShifterZ1_uid10_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid60_lzcShifterZ1_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid61_lzcShifterZ1_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid63_lzcShifterZ1_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cStage_uid66_lzcShifterZ1_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vStagei_uid67_lzcShifterZ1_uid10_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid67_lzcShifterZ1_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid68_lzcShifterZ1_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid70_lzcShifterZ1_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cStage_uid73_lzcShifterZ1_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vStagei_uid74_lzcShifterZ1_uid10_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid74_lzcShifterZ1_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid77_lzcShifterZ1_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cStage_uid80_lzcShifterZ1_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vStagei_uid81_lzcShifterZ1_uid10_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid81_lzcShifterZ1_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid82_lzcShifterZ1_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (5 downto 0);
    signal vCountBig_uid84_lzcShifterZ1_uid10_block_rsrvd_fix_a : STD_LOGIC_VECTOR (7 downto 0);
    signal vCountBig_uid84_lzcShifterZ1_uid10_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal vCountBig_uid84_lzcShifterZ1_uid10_block_rsrvd_fix_o : STD_LOGIC_VECTOR (7 downto 0);
    signal vCountBig_uid84_lzcShifterZ1_uid10_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal vCountFinal_uid86_lzcShifterZ1_uid10_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vCountFinal_uid86_lzcShifterZ1_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (5 downto 0);
    signal l_uid17_block_rsrvd_fix_merged_bit_select_in : STD_LOGIC_VECTOR (1 downto 0);
    signal l_uid17_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal l_uid17_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rVStage_uid48_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid48_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid55_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid55_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (23 downto 0);
    signal rVStage_uid62_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid62_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (27 downto 0);
    signal rVStage_uid69_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid69_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (29 downto 0);
    signal rVStage_uid76_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rVStage_uid76_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (30 downto 0);
    signal fracRnd_uid15_block_rsrvd_fix_merged_bit_select_in : STD_LOGIC_VECTOR (30 downto 0);
    signal fracRnd_uid15_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRnd_uid15_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (6 downto 0);
    signal redist0_fracRnd_uid15_block_rsrvd_fix_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist1_vCount_uid70_lzcShifterZ1_uid10_block_rsrvd_fix_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_vCount_uid63_lzcShifterZ1_uid10_block_rsrvd_fix_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_vCount_uid56_lzcShifterZ1_uid10_block_rsrvd_fix_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_vCount_uid49_lzcShifterZ1_uid10_block_rsrvd_fix_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_vCount_uid44_lzcShifterZ1_uid10_block_rsrvd_fix_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_expR_uid38_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist7_expR_uid26_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist8_fracR_uid25_block_rsrvd_fix_b_2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist9_expFracRnd_uid16_block_rsrvd_fix_q_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist10_inIsZero_uid12_block_rsrvd_fix_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_y_uid9_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_signX_uid6_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_signX_uid6_block_rsrvd_fix_b_11_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signX_uid6_block_rsrvd_fix(BITSELECT,5)@0
    signX_uid6_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(in_0(31 downto 31));

    -- redist12_signX_uid6_block_rsrvd_fix_b_1(DELAY,107)
    redist12_signX_uid6_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => signX_uid6_block_rsrvd_fix_b, xout => redist12_signX_uid6_block_rsrvd_fix_b_1_q, clk => clock, aclr => resetn );

    -- redist13_signX_uid6_block_rsrvd_fix_b_11(DELAY,108)
    redist13_signX_uid6_block_rsrvd_fix_b_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 10, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist12_signX_uid6_block_rsrvd_fix_b_1_q, xout => redist13_signX_uid6_block_rsrvd_fix_b_11_q, clk => clock, aclr => resetn );

    -- expInf_uid28_block_rsrvd_fix(CONSTANT,27)
    expInf_uid28_block_rsrvd_fix_q <= "11111111";

    -- expZ_uid37_block_rsrvd_fix(CONSTANT,36)
    expZ_uid37_block_rsrvd_fix_q <= "00000000";

    -- rVStage_uid76_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select(BITSELECT,93)@7
    rVStage_uid76_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_b <= vStagei_uid74_lzcShifterZ1_uid10_block_rsrvd_fix_q(31 downto 31);
    rVStage_uid76_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_c <= vStagei_uid74_lzcShifterZ1_uid10_block_rsrvd_fix_q(30 downto 0);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- cStage_uid80_lzcShifterZ1_uid10_block_rsrvd_fix(BITJOIN,79)@7
    cStage_uid80_lzcShifterZ1_uid10_block_rsrvd_fix_q <= rVStage_uid76_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_c & GND_q;

    -- rVStage_uid69_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select(BITSELECT,92)@6
    rVStage_uid69_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_b <= vStagei_uid67_lzcShifterZ1_uid10_block_rsrvd_fix_q(31 downto 30);
    rVStage_uid69_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_c <= vStagei_uid67_lzcShifterZ1_uid10_block_rsrvd_fix_q(29 downto 0);

    -- zs_uid68_lzcShifterZ1_uid10_block_rsrvd_fix(CONSTANT,67)
    zs_uid68_lzcShifterZ1_uid10_block_rsrvd_fix_q <= "00";

    -- cStage_uid73_lzcShifterZ1_uid10_block_rsrvd_fix(BITJOIN,72)@6
    cStage_uid73_lzcShifterZ1_uid10_block_rsrvd_fix_q <= rVStage_uid69_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_c & zs_uid68_lzcShifterZ1_uid10_block_rsrvd_fix_q;

    -- rVStage_uid62_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select(BITSELECT,91)@5
    rVStage_uid62_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_b <= vStagei_uid60_lzcShifterZ1_uid10_block_rsrvd_fix_q(31 downto 28);
    rVStage_uid62_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_c <= vStagei_uid60_lzcShifterZ1_uid10_block_rsrvd_fix_q(27 downto 0);

    -- zs_uid61_lzcShifterZ1_uid10_block_rsrvd_fix(CONSTANT,60)
    zs_uid61_lzcShifterZ1_uid10_block_rsrvd_fix_q <= "0000";

    -- cStage_uid66_lzcShifterZ1_uid10_block_rsrvd_fix(BITJOIN,65)@5
    cStage_uid66_lzcShifterZ1_uid10_block_rsrvd_fix_q <= rVStage_uid62_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_c & zs_uid61_lzcShifterZ1_uid10_block_rsrvd_fix_q;

    -- rVStage_uid55_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select(BITSELECT,90)@4
    rVStage_uid55_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_b <= vStagei_uid53_lzcShifterZ1_uid10_block_rsrvd_fix_q(31 downto 24);
    rVStage_uid55_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_c <= vStagei_uid53_lzcShifterZ1_uid10_block_rsrvd_fix_q(23 downto 0);

    -- cStage_uid59_lzcShifterZ1_uid10_block_rsrvd_fix(BITJOIN,58)@4
    cStage_uid59_lzcShifterZ1_uid10_block_rsrvd_fix_q <= rVStage_uid55_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_c & expZ_uid37_block_rsrvd_fix_q;

    -- rVStage_uid48_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select(BITSELECT,89)@3
    rVStage_uid48_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_b <= vStagei_uid46_lzcShifterZ1_uid10_block_rsrvd_fix_q(31 downto 16);
    rVStage_uid48_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_c <= vStagei_uid46_lzcShifterZ1_uid10_block_rsrvd_fix_q(15 downto 0);

    -- zs_uid47_lzcShifterZ1_uid10_block_rsrvd_fix(CONSTANT,46)
    zs_uid47_lzcShifterZ1_uid10_block_rsrvd_fix_q <= "0000000000000000";

    -- cStage_uid52_lzcShifterZ1_uid10_block_rsrvd_fix(BITJOIN,51)@3
    cStage_uid52_lzcShifterZ1_uid10_block_rsrvd_fix_q <= rVStage_uid48_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_c & zs_uid47_lzcShifterZ1_uid10_block_rsrvd_fix_q;

    -- zs_uid42_lzcShifterZ1_uid10_block_rsrvd_fix(CONSTANT,41)
    zs_uid42_lzcShifterZ1_uid10_block_rsrvd_fix_q <= "00000000000000000000000000000000";

    -- xXorSign_uid7_block_rsrvd_fix(LOGICAL,6)@0 + 1
    xXorSign_uid7_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 1 => signX_uid6_block_rsrvd_fix_b(0)) & signX_uid6_block_rsrvd_fix_b));
    xXorSign_uid7_block_rsrvd_fix_qi <= in_0 xor xXorSign_uid7_block_rsrvd_fix_b;
    xXorSign_uid7_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => xXorSign_uid7_block_rsrvd_fix_qi, xout => xXorSign_uid7_block_rsrvd_fix_q, clk => clock, aclr => resetn );

    -- yE_uid8_block_rsrvd_fix(ADD,7)@1
    yE_uid8_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & xXorSign_uid7_block_rsrvd_fix_q);
    yE_uid8_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000" & redist12_signX_uid6_block_rsrvd_fix_b_1_q);
    yE_uid8_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(yE_uid8_block_rsrvd_fix_a) + UNSIGNED(yE_uid8_block_rsrvd_fix_b));
    yE_uid8_block_rsrvd_fix_q <= yE_uid8_block_rsrvd_fix_o(32 downto 0);

    -- y_uid9_block_rsrvd_fix(BITSELECT,8)@1
    y_uid9_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(yE_uid8_block_rsrvd_fix_q(31 downto 0));
    y_uid9_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(y_uid9_block_rsrvd_fix_in(31 downto 0));

    -- redist11_y_uid9_block_rsrvd_fix_b_1(DELAY,106)
    redist11_y_uid9_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => y_uid9_block_rsrvd_fix_b, xout => redist11_y_uid9_block_rsrvd_fix_b_1_q, clk => clock, aclr => resetn );

    -- vCount_uid44_lzcShifterZ1_uid10_block_rsrvd_fix(LOGICAL,43)@2
    vCount_uid44_lzcShifterZ1_uid10_block_rsrvd_fix_q <= "1" WHEN redist11_y_uid9_block_rsrvd_fix_b_1_q = zs_uid42_lzcShifterZ1_uid10_block_rsrvd_fix_q ELSE "0";

    -- vStagei_uid46_lzcShifterZ1_uid10_block_rsrvd_fix(MUX,45)@2 + 1
    vStagei_uid46_lzcShifterZ1_uid10_block_rsrvd_fix_s <= vCount_uid44_lzcShifterZ1_uid10_block_rsrvd_fix_q;
    vStagei_uid46_lzcShifterZ1_uid10_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            vStagei_uid46_lzcShifterZ1_uid10_block_rsrvd_fix_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (vStagei_uid46_lzcShifterZ1_uid10_block_rsrvd_fix_s) IS
                WHEN "0" => vStagei_uid46_lzcShifterZ1_uid10_block_rsrvd_fix_q <= redist11_y_uid9_block_rsrvd_fix_b_1_q;
                WHEN "1" => vStagei_uid46_lzcShifterZ1_uid10_block_rsrvd_fix_q <= zs_uid42_lzcShifterZ1_uid10_block_rsrvd_fix_q;
                WHEN OTHERS => vStagei_uid46_lzcShifterZ1_uid10_block_rsrvd_fix_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- vCount_uid49_lzcShifterZ1_uid10_block_rsrvd_fix(LOGICAL,48)@3
    vCount_uid49_lzcShifterZ1_uid10_block_rsrvd_fix_q <= "1" WHEN rVStage_uid48_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_b = zs_uid47_lzcShifterZ1_uid10_block_rsrvd_fix_q ELSE "0";

    -- vStagei_uid53_lzcShifterZ1_uid10_block_rsrvd_fix(MUX,52)@3 + 1
    vStagei_uid53_lzcShifterZ1_uid10_block_rsrvd_fix_s <= vCount_uid49_lzcShifterZ1_uid10_block_rsrvd_fix_q;
    vStagei_uid53_lzcShifterZ1_uid10_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            vStagei_uid53_lzcShifterZ1_uid10_block_rsrvd_fix_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (vStagei_uid53_lzcShifterZ1_uid10_block_rsrvd_fix_s) IS
                WHEN "0" => vStagei_uid53_lzcShifterZ1_uid10_block_rsrvd_fix_q <= vStagei_uid46_lzcShifterZ1_uid10_block_rsrvd_fix_q;
                WHEN "1" => vStagei_uid53_lzcShifterZ1_uid10_block_rsrvd_fix_q <= cStage_uid52_lzcShifterZ1_uid10_block_rsrvd_fix_q;
                WHEN OTHERS => vStagei_uid53_lzcShifterZ1_uid10_block_rsrvd_fix_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- vCount_uid56_lzcShifterZ1_uid10_block_rsrvd_fix(LOGICAL,55)@4
    vCount_uid56_lzcShifterZ1_uid10_block_rsrvd_fix_q <= "1" WHEN rVStage_uid55_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_b = expZ_uid37_block_rsrvd_fix_q ELSE "0";

    -- vStagei_uid60_lzcShifterZ1_uid10_block_rsrvd_fix(MUX,59)@4 + 1
    vStagei_uid60_lzcShifterZ1_uid10_block_rsrvd_fix_s <= vCount_uid56_lzcShifterZ1_uid10_block_rsrvd_fix_q;
    vStagei_uid60_lzcShifterZ1_uid10_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            vStagei_uid60_lzcShifterZ1_uid10_block_rsrvd_fix_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (vStagei_uid60_lzcShifterZ1_uid10_block_rsrvd_fix_s) IS
                WHEN "0" => vStagei_uid60_lzcShifterZ1_uid10_block_rsrvd_fix_q <= vStagei_uid53_lzcShifterZ1_uid10_block_rsrvd_fix_q;
                WHEN "1" => vStagei_uid60_lzcShifterZ1_uid10_block_rsrvd_fix_q <= cStage_uid59_lzcShifterZ1_uid10_block_rsrvd_fix_q;
                WHEN OTHERS => vStagei_uid60_lzcShifterZ1_uid10_block_rsrvd_fix_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- vCount_uid63_lzcShifterZ1_uid10_block_rsrvd_fix(LOGICAL,62)@5
    vCount_uid63_lzcShifterZ1_uid10_block_rsrvd_fix_q <= "1" WHEN rVStage_uid62_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_b = zs_uid61_lzcShifterZ1_uid10_block_rsrvd_fix_q ELSE "0";

    -- vStagei_uid67_lzcShifterZ1_uid10_block_rsrvd_fix(MUX,66)@5 + 1
    vStagei_uid67_lzcShifterZ1_uid10_block_rsrvd_fix_s <= vCount_uid63_lzcShifterZ1_uid10_block_rsrvd_fix_q;
    vStagei_uid67_lzcShifterZ1_uid10_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            vStagei_uid67_lzcShifterZ1_uid10_block_rsrvd_fix_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (vStagei_uid67_lzcShifterZ1_uid10_block_rsrvd_fix_s) IS
                WHEN "0" => vStagei_uid67_lzcShifterZ1_uid10_block_rsrvd_fix_q <= vStagei_uid60_lzcShifterZ1_uid10_block_rsrvd_fix_q;
                WHEN "1" => vStagei_uid67_lzcShifterZ1_uid10_block_rsrvd_fix_q <= cStage_uid66_lzcShifterZ1_uid10_block_rsrvd_fix_q;
                WHEN OTHERS => vStagei_uid67_lzcShifterZ1_uid10_block_rsrvd_fix_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- vCount_uid70_lzcShifterZ1_uid10_block_rsrvd_fix(LOGICAL,69)@6
    vCount_uid70_lzcShifterZ1_uid10_block_rsrvd_fix_q <= "1" WHEN rVStage_uid69_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_b = zs_uid68_lzcShifterZ1_uid10_block_rsrvd_fix_q ELSE "0";

    -- vStagei_uid74_lzcShifterZ1_uid10_block_rsrvd_fix(MUX,73)@6 + 1
    vStagei_uid74_lzcShifterZ1_uid10_block_rsrvd_fix_s <= vCount_uid70_lzcShifterZ1_uid10_block_rsrvd_fix_q;
    vStagei_uid74_lzcShifterZ1_uid10_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            vStagei_uid74_lzcShifterZ1_uid10_block_rsrvd_fix_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (vStagei_uid74_lzcShifterZ1_uid10_block_rsrvd_fix_s) IS
                WHEN "0" => vStagei_uid74_lzcShifterZ1_uid10_block_rsrvd_fix_q <= vStagei_uid67_lzcShifterZ1_uid10_block_rsrvd_fix_q;
                WHEN "1" => vStagei_uid74_lzcShifterZ1_uid10_block_rsrvd_fix_q <= cStage_uid73_lzcShifterZ1_uid10_block_rsrvd_fix_q;
                WHEN OTHERS => vStagei_uid74_lzcShifterZ1_uid10_block_rsrvd_fix_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- vCount_uid77_lzcShifterZ1_uid10_block_rsrvd_fix(LOGICAL,76)@7
    vCount_uid77_lzcShifterZ1_uid10_block_rsrvd_fix_q <= "1" WHEN rVStage_uid76_lzcShifterZ1_uid10_block_rsrvd_fix_merged_bit_select_b = GND_q ELSE "0";

    -- vStagei_uid81_lzcShifterZ1_uid10_block_rsrvd_fix(MUX,80)@7
    vStagei_uid81_lzcShifterZ1_uid10_block_rsrvd_fix_s <= vCount_uid77_lzcShifterZ1_uid10_block_rsrvd_fix_q;
    vStagei_uid81_lzcShifterZ1_uid10_block_rsrvd_fix_combproc: PROCESS (vStagei_uid81_lzcShifterZ1_uid10_block_rsrvd_fix_s, vStagei_uid74_lzcShifterZ1_uid10_block_rsrvd_fix_q, cStage_uid80_lzcShifterZ1_uid10_block_rsrvd_fix_q)
    BEGIN
        CASE (vStagei_uid81_lzcShifterZ1_uid10_block_rsrvd_fix_s) IS
            WHEN "0" => vStagei_uid81_lzcShifterZ1_uid10_block_rsrvd_fix_q <= vStagei_uid74_lzcShifterZ1_uid10_block_rsrvd_fix_q;
            WHEN "1" => vStagei_uid81_lzcShifterZ1_uid10_block_rsrvd_fix_q <= cStage_uid80_lzcShifterZ1_uid10_block_rsrvd_fix_q;
            WHEN OTHERS => vStagei_uid81_lzcShifterZ1_uid10_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRnd_uid15_block_rsrvd_fix_merged_bit_select(BITSELECT,94)@7
    fracRnd_uid15_block_rsrvd_fix_merged_bit_select_in <= vStagei_uid81_lzcShifterZ1_uid10_block_rsrvd_fix_q(30 downto 0);
    fracRnd_uid15_block_rsrvd_fix_merged_bit_select_b <= fracRnd_uid15_block_rsrvd_fix_merged_bit_select_in(30 downto 7);
    fracRnd_uid15_block_rsrvd_fix_merged_bit_select_c <= fracRnd_uid15_block_rsrvd_fix_merged_bit_select_in(6 downto 0);

    -- sticky_uid20_block_rsrvd_fix(LOGICAL,19)@7 + 1
    sticky_uid20_block_rsrvd_fix_qi <= "1" WHEN fracRnd_uid15_block_rsrvd_fix_merged_bit_select_c /= "0000000" ELSE "0";
    sticky_uid20_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => sticky_uid20_block_rsrvd_fix_qi, xout => sticky_uid20_block_rsrvd_fix_q, clk => clock, aclr => resetn );

    -- nr_uid21_block_rsrvd_fix(LOGICAL,20)@8
    nr_uid21_block_rsrvd_fix_q <= not (l_uid17_block_rsrvd_fix_merged_bit_select_c);

    -- maxCount_uid11_block_rsrvd_fix(CONSTANT,10)
    maxCount_uid11_block_rsrvd_fix_q <= "100000";

    -- redist5_vCount_uid44_lzcShifterZ1_uid10_block_rsrvd_fix_q_5(DELAY,100)
    redist5_vCount_uid44_lzcShifterZ1_uid10_block_rsrvd_fix_q_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid44_lzcShifterZ1_uid10_block_rsrvd_fix_q, xout => redist5_vCount_uid44_lzcShifterZ1_uid10_block_rsrvd_fix_q_5_q, clk => clock, aclr => resetn );

    -- redist4_vCount_uid49_lzcShifterZ1_uid10_block_rsrvd_fix_q_4(DELAY,99)
    redist4_vCount_uid49_lzcShifterZ1_uid10_block_rsrvd_fix_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid49_lzcShifterZ1_uid10_block_rsrvd_fix_q, xout => redist4_vCount_uid49_lzcShifterZ1_uid10_block_rsrvd_fix_q_4_q, clk => clock, aclr => resetn );

    -- redist3_vCount_uid56_lzcShifterZ1_uid10_block_rsrvd_fix_q_3(DELAY,98)
    redist3_vCount_uid56_lzcShifterZ1_uid10_block_rsrvd_fix_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid56_lzcShifterZ1_uid10_block_rsrvd_fix_q, xout => redist3_vCount_uid56_lzcShifterZ1_uid10_block_rsrvd_fix_q_3_q, clk => clock, aclr => resetn );

    -- redist2_vCount_uid63_lzcShifterZ1_uid10_block_rsrvd_fix_q_2(DELAY,97)
    redist2_vCount_uid63_lzcShifterZ1_uid10_block_rsrvd_fix_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid63_lzcShifterZ1_uid10_block_rsrvd_fix_q, xout => redist2_vCount_uid63_lzcShifterZ1_uid10_block_rsrvd_fix_q_2_q, clk => clock, aclr => resetn );

    -- redist1_vCount_uid70_lzcShifterZ1_uid10_block_rsrvd_fix_q_1(DELAY,96)
    redist1_vCount_uid70_lzcShifterZ1_uid10_block_rsrvd_fix_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => vCount_uid70_lzcShifterZ1_uid10_block_rsrvd_fix_q, xout => redist1_vCount_uid70_lzcShifterZ1_uid10_block_rsrvd_fix_q_1_q, clk => clock, aclr => resetn );

    -- vCount_uid82_lzcShifterZ1_uid10_block_rsrvd_fix(BITJOIN,81)@7
    vCount_uid82_lzcShifterZ1_uid10_block_rsrvd_fix_q <= redist5_vCount_uid44_lzcShifterZ1_uid10_block_rsrvd_fix_q_5_q & redist4_vCount_uid49_lzcShifterZ1_uid10_block_rsrvd_fix_q_4_q & redist3_vCount_uid56_lzcShifterZ1_uid10_block_rsrvd_fix_q_3_q & redist2_vCount_uid63_lzcShifterZ1_uid10_block_rsrvd_fix_q_2_q & redist1_vCount_uid70_lzcShifterZ1_uid10_block_rsrvd_fix_q_1_q & vCount_uid77_lzcShifterZ1_uid10_block_rsrvd_fix_q;

    -- vCountBig_uid84_lzcShifterZ1_uid10_block_rsrvd_fix(COMPARE,83)@7
    vCountBig_uid84_lzcShifterZ1_uid10_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & maxCount_uid11_block_rsrvd_fix_q);
    vCountBig_uid84_lzcShifterZ1_uid10_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & vCount_uid82_lzcShifterZ1_uid10_block_rsrvd_fix_q);
    vCountBig_uid84_lzcShifterZ1_uid10_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(vCountBig_uid84_lzcShifterZ1_uid10_block_rsrvd_fix_a) - UNSIGNED(vCountBig_uid84_lzcShifterZ1_uid10_block_rsrvd_fix_b));
    vCountBig_uid84_lzcShifterZ1_uid10_block_rsrvd_fix_c(0) <= vCountBig_uid84_lzcShifterZ1_uid10_block_rsrvd_fix_o(7);

    -- vCountFinal_uid86_lzcShifterZ1_uid10_block_rsrvd_fix(MUX,85)@7 + 1
    vCountFinal_uid86_lzcShifterZ1_uid10_block_rsrvd_fix_s <= vCountBig_uid84_lzcShifterZ1_uid10_block_rsrvd_fix_c;
    vCountFinal_uid86_lzcShifterZ1_uid10_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            vCountFinal_uid86_lzcShifterZ1_uid10_block_rsrvd_fix_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (vCountFinal_uid86_lzcShifterZ1_uid10_block_rsrvd_fix_s) IS
                WHEN "0" => vCountFinal_uid86_lzcShifterZ1_uid10_block_rsrvd_fix_q <= vCount_uid82_lzcShifterZ1_uid10_block_rsrvd_fix_q;
                WHEN "1" => vCountFinal_uid86_lzcShifterZ1_uid10_block_rsrvd_fix_q <= maxCount_uid11_block_rsrvd_fix_q;
                WHEN OTHERS => vCountFinal_uid86_lzcShifterZ1_uid10_block_rsrvd_fix_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- msbIn_uid13_block_rsrvd_fix(CONSTANT,12)
    msbIn_uid13_block_rsrvd_fix_q <= "10011110";

    -- expPreRnd_uid14_block_rsrvd_fix(SUB,13)@8
    expPreRnd_uid14_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & msbIn_uid13_block_rsrvd_fix_q);
    expPreRnd_uid14_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("000" & vCountFinal_uid86_lzcShifterZ1_uid10_block_rsrvd_fix_q);
    expPreRnd_uid14_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(expPreRnd_uid14_block_rsrvd_fix_a) - UNSIGNED(expPreRnd_uid14_block_rsrvd_fix_b));
    expPreRnd_uid14_block_rsrvd_fix_q <= expPreRnd_uid14_block_rsrvd_fix_o(8 downto 0);

    -- redist0_fracRnd_uid15_block_rsrvd_fix_merged_bit_select_b_1(DELAY,95)
    redist0_fracRnd_uid15_block_rsrvd_fix_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => fracRnd_uid15_block_rsrvd_fix_merged_bit_select_b, xout => redist0_fracRnd_uid15_block_rsrvd_fix_merged_bit_select_b_1_q, clk => clock, aclr => resetn );

    -- expFracRnd_uid16_block_rsrvd_fix(BITJOIN,15)@8
    expFracRnd_uid16_block_rsrvd_fix_q <= expPreRnd_uid14_block_rsrvd_fix_q & redist0_fracRnd_uid15_block_rsrvd_fix_merged_bit_select_b_1_q;

    -- l_uid17_block_rsrvd_fix_merged_bit_select(BITSELECT,88)@8
    l_uid17_block_rsrvd_fix_merged_bit_select_in <= STD_LOGIC_VECTOR(expFracRnd_uid16_block_rsrvd_fix_q(1 downto 0));
    l_uid17_block_rsrvd_fix_merged_bit_select_b <= STD_LOGIC_VECTOR(l_uid17_block_rsrvd_fix_merged_bit_select_in(1 downto 1));
    l_uid17_block_rsrvd_fix_merged_bit_select_c <= STD_LOGIC_VECTOR(l_uid17_block_rsrvd_fix_merged_bit_select_in(0 downto 0));

    -- rnd_uid22_block_rsrvd_fix(LOGICAL,21)@8 + 1
    rnd_uid22_block_rsrvd_fix_qi <= l_uid17_block_rsrvd_fix_merged_bit_select_b or nr_uid21_block_rsrvd_fix_q or sticky_uid20_block_rsrvd_fix_q;
    rnd_uid22_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rnd_uid22_block_rsrvd_fix_qi, xout => rnd_uid22_block_rsrvd_fix_q, clk => clock, aclr => resetn );

    -- redist9_expFracRnd_uid16_block_rsrvd_fix_q_1(DELAY,104)
    redist9_expFracRnd_uid16_block_rsrvd_fix_q_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => expFracRnd_uid16_block_rsrvd_fix_q, xout => redist9_expFracRnd_uid16_block_rsrvd_fix_q_1_q, clk => clock, aclr => resetn );

    -- expFracR_uid24_block_rsrvd_fix(ADD,23)@9
    expFracR_uid24_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist9_expFracRnd_uid16_block_rsrvd_fix_q_1_q(32)) & redist9_expFracRnd_uid16_block_rsrvd_fix_q_1_q));
    expFracR_uid24_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000000000000000000000000000" & rnd_uid22_block_rsrvd_fix_q));
    expFracR_uid24_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(expFracR_uid24_block_rsrvd_fix_a) + SIGNED(expFracR_uid24_block_rsrvd_fix_b));
    expFracR_uid24_block_rsrvd_fix_q <= expFracR_uid24_block_rsrvd_fix_o(33 downto 0);

    -- expR_uid26_block_rsrvd_fix(BITSELECT,25)@9
    expR_uid26_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(expFracR_uid24_block_rsrvd_fix_q(33 downto 24));

    -- redist7_expR_uid26_block_rsrvd_fix_b_1(DELAY,102)
    redist7_expR_uid26_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 10, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => expR_uid26_block_rsrvd_fix_b, xout => redist7_expR_uid26_block_rsrvd_fix_b_1_q, clk => clock, aclr => resetn );

    -- expR_uid38_block_rsrvd_fix(BITSELECT,37)@10
    expR_uid38_block_rsrvd_fix_in <= redist7_expR_uid26_block_rsrvd_fix_b_1_q(7 downto 0);
    expR_uid38_block_rsrvd_fix_b <= expR_uid38_block_rsrvd_fix_in(7 downto 0);

    -- redist6_expR_uid38_block_rsrvd_fix_b_1(DELAY,101)
    redist6_expR_uid38_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => expR_uid38_block_rsrvd_fix_b, xout => redist6_expR_uid38_block_rsrvd_fix_b_1_q, clk => clock, aclr => resetn );

    -- ovf_uid29_block_rsrvd_fix(COMPARE,28)@10 + 1
    ovf_uid29_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 10 => redist7_expR_uid26_block_rsrvd_fix_b_1_q(9)) & redist7_expR_uid26_block_rsrvd_fix_b_1_q));
    ovf_uid29_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & expInf_uid28_block_rsrvd_fix_q));
    ovf_uid29_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            ovf_uid29_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            ovf_uid29_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(ovf_uid29_block_rsrvd_fix_a) - SIGNED(ovf_uid29_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    ovf_uid29_block_rsrvd_fix_n(0) <= not (ovf_uid29_block_rsrvd_fix_o(11));

    -- inIsZero_uid12_block_rsrvd_fix(LOGICAL,11)@8 + 1
    inIsZero_uid12_block_rsrvd_fix_qi <= "1" WHEN vCountFinal_uid86_lzcShifterZ1_uid10_block_rsrvd_fix_q = maxCount_uid11_block_rsrvd_fix_q ELSE "0";
    inIsZero_uid12_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => inIsZero_uid12_block_rsrvd_fix_qi, xout => inIsZero_uid12_block_rsrvd_fix_q, clk => clock, aclr => resetn );

    -- redist10_inIsZero_uid12_block_rsrvd_fix_q_3(DELAY,105)
    redist10_inIsZero_uid12_block_rsrvd_fix_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => inIsZero_uid12_block_rsrvd_fix_q, xout => redist10_inIsZero_uid12_block_rsrvd_fix_q_3_q, clk => clock, aclr => resetn );

    -- udf_uid27_block_rsrvd_fix(COMPARE,26)@10 + 1
    udf_uid27_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000" & GND_q));
    udf_uid27_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 10 => redist7_expR_uid26_block_rsrvd_fix_b_1_q(9)) & redist7_expR_uid26_block_rsrvd_fix_b_1_q));
    udf_uid27_block_rsrvd_fix_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            udf_uid27_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            udf_uid27_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(udf_uid27_block_rsrvd_fix_a) - SIGNED(udf_uid27_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    udf_uid27_block_rsrvd_fix_n(0) <= not (udf_uid27_block_rsrvd_fix_o(11));

    -- udfOrInZero_uid33_block_rsrvd_fix(LOGICAL,32)@11
    udfOrInZero_uid33_block_rsrvd_fix_q <= udf_uid27_block_rsrvd_fix_n or redist10_inIsZero_uid12_block_rsrvd_fix_q_3_q;

    -- excSelector_uid34_block_rsrvd_fix(BITJOIN,33)@11
    excSelector_uid34_block_rsrvd_fix_q <= ovf_uid29_block_rsrvd_fix_n & udfOrInZero_uid33_block_rsrvd_fix_q;

    -- expRPostExc_uid39_block_rsrvd_fix(MUX,38)@11
    expRPostExc_uid39_block_rsrvd_fix_s <= excSelector_uid34_block_rsrvd_fix_q;
    expRPostExc_uid39_block_rsrvd_fix_combproc: PROCESS (expRPostExc_uid39_block_rsrvd_fix_s, redist6_expR_uid38_block_rsrvd_fix_b_1_q, expZ_uid37_block_rsrvd_fix_q, expInf_uid28_block_rsrvd_fix_q)
    BEGIN
        CASE (expRPostExc_uid39_block_rsrvd_fix_s) IS
            WHEN "00" => expRPostExc_uid39_block_rsrvd_fix_q <= redist6_expR_uid38_block_rsrvd_fix_b_1_q;
            WHEN "01" => expRPostExc_uid39_block_rsrvd_fix_q <= expZ_uid37_block_rsrvd_fix_q;
            WHEN "10" => expRPostExc_uid39_block_rsrvd_fix_q <= expInf_uid28_block_rsrvd_fix_q;
            WHEN "11" => expRPostExc_uid39_block_rsrvd_fix_q <= expInf_uid28_block_rsrvd_fix_q;
            WHEN OTHERS => expRPostExc_uid39_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracZ_uid31_block_rsrvd_fix(CONSTANT,30)
    fracZ_uid31_block_rsrvd_fix_q <= "00000000000000000000000";

    -- fracR_uid25_block_rsrvd_fix(BITSELECT,24)@9
    fracR_uid25_block_rsrvd_fix_in <= expFracR_uid24_block_rsrvd_fix_q(23 downto 0);
    fracR_uid25_block_rsrvd_fix_b <= fracR_uid25_block_rsrvd_fix_in(23 downto 1);

    -- redist8_fracR_uid25_block_rsrvd_fix_b_2(DELAY,103)
    redist8_fracR_uid25_block_rsrvd_fix_b_2 : dspba_delay
    GENERIC MAP ( width => 23, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => fracR_uid25_block_rsrvd_fix_b, xout => redist8_fracR_uid25_block_rsrvd_fix_b_2_q, clk => clock, aclr => resetn );

    -- excSelector_uid30_block_rsrvd_fix(LOGICAL,29)@11
    excSelector_uid30_block_rsrvd_fix_q <= redist10_inIsZero_uid12_block_rsrvd_fix_q_3_q or ovf_uid29_block_rsrvd_fix_n or udf_uid27_block_rsrvd_fix_n;

    -- fracRPostExc_uid32_block_rsrvd_fix(MUX,31)@11
    fracRPostExc_uid32_block_rsrvd_fix_s <= excSelector_uid30_block_rsrvd_fix_q;
    fracRPostExc_uid32_block_rsrvd_fix_combproc: PROCESS (fracRPostExc_uid32_block_rsrvd_fix_s, redist8_fracR_uid25_block_rsrvd_fix_b_2_q, fracZ_uid31_block_rsrvd_fix_q)
    BEGIN
        CASE (fracRPostExc_uid32_block_rsrvd_fix_s) IS
            WHEN "0" => fracRPostExc_uid32_block_rsrvd_fix_q <= redist8_fracR_uid25_block_rsrvd_fix_b_2_q;
            WHEN "1" => fracRPostExc_uid32_block_rsrvd_fix_q <= fracZ_uid31_block_rsrvd_fix_q;
            WHEN OTHERS => fracRPostExc_uid32_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- outRes_uid40_block_rsrvd_fix(BITJOIN,39)@11
    outRes_uid40_block_rsrvd_fix_q <= redist13_signX_uid6_block_rsrvd_fix_b_11_q & expRPostExc_uid39_block_rsrvd_fix_q & fracRPostExc_uid32_block_rsrvd_fix_q;

    -- out_primWireOut(GPOUT,4)@11
    out_primWireOut <= outRes_uid40_block_rsrvd_fix_q;

END normal;
