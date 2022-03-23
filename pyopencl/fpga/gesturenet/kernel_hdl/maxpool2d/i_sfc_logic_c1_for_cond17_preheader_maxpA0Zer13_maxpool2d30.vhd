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

-- VHDL created from i_sfc_logic_c1_for_cond17_preheader_maxpool2d_c1_enter13_maxpool2d30
-- VHDL created on Sat Mar 12 13:30:07 2022


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

entity i_sfc_logic_c1_for_cond17_preheader_maxpool2d_c1_enter13_maxpool2d30 is
    port (
        in_c1_eni2_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni2_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni2_2 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni2_3 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni2_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni2_5 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi115_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi115_1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c1_for_cond17_preheader_maxpool2d_c1_enter13_maxpool2d30;

architecture normal of i_sfc_logic_c1_for_cond17_preheader_maxpool2d_c1_enter13_maxpool2d30 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_maxpool2d_0_maxpool2d_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_reduction_maxpool2d_1_maxpool2d_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_reduction_maxpool2d_2_maxpool2d_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (31 downto 0);
    signal cstAllOWE_uid12_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid13_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid14_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (7 downto 0);
    signal exp_x_uid15_i_selcond_maxpool2d_0_maxpool2d_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid16_i_selcond_maxpool2d_0_maxpool2d_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expXIsZero_uid17_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid18_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid19_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid20_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid21_i_selcond_maxpool2d_0_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid21_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid23_i_selcond_maxpool2d_0_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid23_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_y_uid32_i_selcond_maxpool2d_0_maxpool2d_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_y_uid33_i_selcond_maxpool2d_0_maxpool2d_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expXIsZero_uid34_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid35_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid36_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid37_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid38_i_selcond_maxpool2d_0_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid38_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid40_i_selcond_maxpool2d_0_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid40_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid46_i_selcond_maxpool2d_0_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid46_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracX_uid51_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid53_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (30 downto 0);
    signal efxGTefy_uid55_i_selcond_maxpool2d_0_maxpool2d_a : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid55_i_selcond_maxpool2d_0_maxpool2d_b : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid55_i_selcond_maxpool2d_0_maxpool2d_o : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid55_i_selcond_maxpool2d_0_maxpool2d_c : STD_LOGIC_VECTOR (0 downto 0);
    signal efxLTefy_uid56_i_selcond_maxpool2d_0_maxpool2d_a : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid56_i_selcond_maxpool2d_0_maxpool2d_b : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid56_i_selcond_maxpool2d_0_maxpool2d_o : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid56_i_selcond_maxpool2d_0_maxpool2d_c : STD_LOGIC_VECTOR (0 downto 0);
    signal signX_uid60_i_selcond_maxpool2d_0_maxpool2d_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid61_i_selcond_maxpool2d_0_maxpool2d_b : STD_LOGIC_VECTOR (0 downto 0);
    signal two_uid62_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (1 downto 0);
    signal concSXSY_uid63_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sxLTsy_uid64_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xorSigns_uid65_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsy_uid66_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid67_i_selcond_maxpool2d_0_maxpool2d_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid67_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcYZ_uid68_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcXZ_uid69_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneNonZero_uid70_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rc2_uid71_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsyExpFracCompMux_uid72_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid73_i_selcond_maxpool2d_0_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid73_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid74_i_selcond_maxpool2d_0_maxpool2d_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid74_i_selcond_maxpool2d_0_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_x_uid79_i_selcond_maxpool2d_1_maxpool2d_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid80_i_selcond_maxpool2d_1_maxpool2d_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expXIsZero_uid81_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid82_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid83_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid84_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid85_i_selcond_maxpool2d_1_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid85_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid87_i_selcond_maxpool2d_1_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid87_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_y_uid96_i_selcond_maxpool2d_1_maxpool2d_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_y_uid97_i_selcond_maxpool2d_1_maxpool2d_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expXIsZero_uid98_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid99_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid100_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid101_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid102_i_selcond_maxpool2d_1_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid102_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid104_i_selcond_maxpool2d_1_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid104_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid110_i_selcond_maxpool2d_1_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid110_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracX_uid115_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid117_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (30 downto 0);
    signal efxGTefy_uid119_i_selcond_maxpool2d_1_maxpool2d_a : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid119_i_selcond_maxpool2d_1_maxpool2d_b : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid119_i_selcond_maxpool2d_1_maxpool2d_o : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid119_i_selcond_maxpool2d_1_maxpool2d_c : STD_LOGIC_VECTOR (0 downto 0);
    signal efxLTefy_uid120_i_selcond_maxpool2d_1_maxpool2d_a : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid120_i_selcond_maxpool2d_1_maxpool2d_b : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid120_i_selcond_maxpool2d_1_maxpool2d_o : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid120_i_selcond_maxpool2d_1_maxpool2d_c : STD_LOGIC_VECTOR (0 downto 0);
    signal signX_uid124_i_selcond_maxpool2d_1_maxpool2d_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid125_i_selcond_maxpool2d_1_maxpool2d_b : STD_LOGIC_VECTOR (0 downto 0);
    signal concSXSY_uid127_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sxLTsy_uid128_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xorSigns_uid129_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsy_uid130_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid131_i_selcond_maxpool2d_1_maxpool2d_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid131_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcYZ_uid132_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcXZ_uid133_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneNonZero_uid134_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rc2_uid135_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsyExpFracCompMux_uid136_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid137_i_selcond_maxpool2d_1_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid137_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid138_i_selcond_maxpool2d_1_maxpool2d_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid138_i_selcond_maxpool2d_1_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_x_uid143_i_selcond_maxpool2d_2_maxpool2d_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid144_i_selcond_maxpool2d_2_maxpool2d_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expXIsZero_uid145_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid146_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid147_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid148_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid149_i_selcond_maxpool2d_2_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid149_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid151_i_selcond_maxpool2d_2_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid151_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_y_uid160_i_selcond_maxpool2d_2_maxpool2d_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_y_uid161_i_selcond_maxpool2d_2_maxpool2d_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expXIsZero_uid162_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid163_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid164_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid165_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid166_i_selcond_maxpool2d_2_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid166_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid168_i_selcond_maxpool2d_2_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid168_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid174_i_selcond_maxpool2d_2_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid174_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracX_uid179_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid181_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (30 downto 0);
    signal efxGTefy_uid183_i_selcond_maxpool2d_2_maxpool2d_a : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid183_i_selcond_maxpool2d_2_maxpool2d_b : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid183_i_selcond_maxpool2d_2_maxpool2d_o : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid183_i_selcond_maxpool2d_2_maxpool2d_c : STD_LOGIC_VECTOR (0 downto 0);
    signal efxLTefy_uid184_i_selcond_maxpool2d_2_maxpool2d_a : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid184_i_selcond_maxpool2d_2_maxpool2d_b : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid184_i_selcond_maxpool2d_2_maxpool2d_o : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid184_i_selcond_maxpool2d_2_maxpool2d_c : STD_LOGIC_VECTOR (0 downto 0);
    signal signX_uid188_i_selcond_maxpool2d_2_maxpool2d_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid189_i_selcond_maxpool2d_2_maxpool2d_b : STD_LOGIC_VECTOR (0 downto 0);
    signal concSXSY_uid191_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sxLTsy_uid192_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xorSigns_uid193_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsy_uid194_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid195_i_selcond_maxpool2d_2_maxpool2d_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid195_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcYZ_uid196_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcXZ_uid197_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneNonZero_uid198_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rc2_uid199_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsyExpFracCompMux_uid200_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid201_i_selcond_maxpool2d_2_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid201_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid202_i_selcond_maxpool2d_2_maxpool2d_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid202_i_selcond_maxpool2d_2_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_reduction_maxpool2d_1_maxpool2d_q_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_reduction_maxpool2d_1_maxpool2d_q_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_reduction_maxpool2d_0_maxpool2d_q_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_i_reduction_maxpool2d_0_maxpool2d_q_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_sync_in_aunroll_x_in_c1_eni2_1_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_sync_in_aunroll_x_in_c1_eni2_1_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_sync_in_aunroll_x_in_c1_eni2_2_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_sync_in_aunroll_x_in_c1_eni2_2_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_sync_in_aunroll_x_in_c1_eni2_3_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_sync_in_aunroll_x_in_c1_eni2_3_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_sync_in_aunroll_x_in_c1_eni2_5_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_sync_in_aunroll_x_in_c1_eni2_5_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_sync_in_aunroll_x_in_i_valid_5_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist12_sync_in_aunroll_x_in_i_valid_5(DELAY,215)
    redist12_sync_in_aunroll_x_in_i_valid_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist12_sync_in_aunroll_x_in_i_valid_5_q, clk => clock, aclr => resetn );

    -- redist10_sync_in_aunroll_x_in_c1_eni2_5_1(DELAY,213)
    redist10_sync_in_aunroll_x_in_c1_eni2_5_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni2_5, xout => redist10_sync_in_aunroll_x_in_c1_eni2_5_1_q, clk => clock, aclr => resetn );

    -- redist11_sync_in_aunroll_x_in_c1_eni2_5_2(DELAY,214)
    redist11_sync_in_aunroll_x_in_c1_eni2_5_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist10_sync_in_aunroll_x_in_c1_eni2_5_1_q, xout => redist11_sync_in_aunroll_x_in_c1_eni2_5_2_q, clk => clock, aclr => resetn );

    -- redist4_sync_in_aunroll_x_in_c1_eni2_1_1(DELAY,207)
    redist4_sync_in_aunroll_x_in_c1_eni2_1_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni2_1, xout => redist4_sync_in_aunroll_x_in_c1_eni2_1_1_q, clk => clock, aclr => resetn );

    -- redist5_sync_in_aunroll_x_in_c1_eni2_1_2(DELAY,208)
    redist5_sync_in_aunroll_x_in_c1_eni2_1_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist4_sync_in_aunroll_x_in_c1_eni2_1_1_q, xout => redist5_sync_in_aunroll_x_in_c1_eni2_1_2_q, clk => clock, aclr => resetn );

    -- frac_y_uid33_i_selcond_maxpool2d_0_maxpool2d(BITSELECT,32)@132
    frac_y_uid33_i_selcond_maxpool2d_0_maxpool2d_b <= in_c1_eni2_5(22 downto 0);

    -- cstZeroWF_uid13_i_selcond_maxpool2d_0_maxpool2d(CONSTANT,12)
    cstZeroWF_uid13_i_selcond_maxpool2d_0_maxpool2d_q <= "00000000000000000000000";

    -- fracXIsZero_uid36_i_selcond_maxpool2d_0_maxpool2d(LOGICAL,35)@132
    fracXIsZero_uid36_i_selcond_maxpool2d_0_maxpool2d_q <= "1" WHEN cstZeroWF_uid13_i_selcond_maxpool2d_0_maxpool2d_q = frac_y_uid33_i_selcond_maxpool2d_0_maxpool2d_b ELSE "0";

    -- cstAllZWE_uid14_i_selcond_maxpool2d_0_maxpool2d(CONSTANT,13)
    cstAllZWE_uid14_i_selcond_maxpool2d_0_maxpool2d_q <= "00000000";

    -- exp_y_uid32_i_selcond_maxpool2d_0_maxpool2d(BITSELECT,31)@132
    exp_y_uid32_i_selcond_maxpool2d_0_maxpool2d_b <= in_c1_eni2_5(30 downto 23);

    -- expXIsZero_uid34_i_selcond_maxpool2d_0_maxpool2d(LOGICAL,33)@132
    expXIsZero_uid34_i_selcond_maxpool2d_0_maxpool2d_q <= "1" WHEN exp_y_uid32_i_selcond_maxpool2d_0_maxpool2d_b = cstAllZWE_uid14_i_selcond_maxpool2d_0_maxpool2d_q ELSE "0";

    -- excZ_y_uid38_i_selcond_maxpool2d_0_maxpool2d(LOGICAL,37)@132 + 1
    excZ_y_uid38_i_selcond_maxpool2d_0_maxpool2d_qi <= expXIsZero_uid34_i_selcond_maxpool2d_0_maxpool2d_q and fracXIsZero_uid36_i_selcond_maxpool2d_0_maxpool2d_q;
    excZ_y_uid38_i_selcond_maxpool2d_0_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excZ_y_uid38_i_selcond_maxpool2d_0_maxpool2d_qi, xout => excZ_y_uid38_i_selcond_maxpool2d_0_maxpool2d_q, clk => clock, aclr => resetn );

    -- invExcYZ_uid68_i_selcond_maxpool2d_0_maxpool2d(LOGICAL,67)@133
    invExcYZ_uid68_i_selcond_maxpool2d_0_maxpool2d_q <= not (excZ_y_uid38_i_selcond_maxpool2d_0_maxpool2d_q);

    -- frac_x_uid16_i_selcond_maxpool2d_0_maxpool2d(BITSELECT,15)@132
    frac_x_uid16_i_selcond_maxpool2d_0_maxpool2d_b <= in_c1_eni2_1(22 downto 0);

    -- fracXIsZero_uid19_i_selcond_maxpool2d_0_maxpool2d(LOGICAL,18)@132
    fracXIsZero_uid19_i_selcond_maxpool2d_0_maxpool2d_q <= "1" WHEN cstZeroWF_uid13_i_selcond_maxpool2d_0_maxpool2d_q = frac_x_uid16_i_selcond_maxpool2d_0_maxpool2d_b ELSE "0";

    -- exp_x_uid15_i_selcond_maxpool2d_0_maxpool2d(BITSELECT,14)@132
    exp_x_uid15_i_selcond_maxpool2d_0_maxpool2d_b <= in_c1_eni2_1(30 downto 23);

    -- expXIsZero_uid17_i_selcond_maxpool2d_0_maxpool2d(LOGICAL,16)@132
    expXIsZero_uid17_i_selcond_maxpool2d_0_maxpool2d_q <= "1" WHEN exp_x_uid15_i_selcond_maxpool2d_0_maxpool2d_b = cstAllZWE_uid14_i_selcond_maxpool2d_0_maxpool2d_q ELSE "0";

    -- excZ_x_uid21_i_selcond_maxpool2d_0_maxpool2d(LOGICAL,20)@132 + 1
    excZ_x_uid21_i_selcond_maxpool2d_0_maxpool2d_qi <= expXIsZero_uid17_i_selcond_maxpool2d_0_maxpool2d_q and fracXIsZero_uid19_i_selcond_maxpool2d_0_maxpool2d_q;
    excZ_x_uid21_i_selcond_maxpool2d_0_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excZ_x_uid21_i_selcond_maxpool2d_0_maxpool2d_qi, xout => excZ_x_uid21_i_selcond_maxpool2d_0_maxpool2d_q, clk => clock, aclr => resetn );

    -- invExcXZ_uid69_i_selcond_maxpool2d_0_maxpool2d(LOGICAL,68)@133
    invExcXZ_uid69_i_selcond_maxpool2d_0_maxpool2d_q <= not (excZ_x_uid21_i_selcond_maxpool2d_0_maxpool2d_q);

    -- oneNonZero_uid70_i_selcond_maxpool2d_0_maxpool2d(LOGICAL,69)@133
    oneNonZero_uid70_i_selcond_maxpool2d_0_maxpool2d_q <= invExcXZ_uid69_i_selcond_maxpool2d_0_maxpool2d_q or invExcYZ_uid68_i_selcond_maxpool2d_0_maxpool2d_q;

    -- two_uid62_i_selcond_maxpool2d_0_maxpool2d(CONSTANT,61)
    two_uid62_i_selcond_maxpool2d_0_maxpool2d_q <= "10";

    -- signX_uid60_i_selcond_maxpool2d_0_maxpool2d(BITSELECT,59)@133
    signX_uid60_i_selcond_maxpool2d_0_maxpool2d_b <= STD_LOGIC_VECTOR(redist4_sync_in_aunroll_x_in_c1_eni2_1_1_q(31 downto 31));

    -- signY_uid61_i_selcond_maxpool2d_0_maxpool2d(BITSELECT,60)@133
    signY_uid61_i_selcond_maxpool2d_0_maxpool2d_b <= STD_LOGIC_VECTOR(redist10_sync_in_aunroll_x_in_c1_eni2_5_1_q(31 downto 31));

    -- concSXSY_uid63_i_selcond_maxpool2d_0_maxpool2d(BITJOIN,62)@133
    concSXSY_uid63_i_selcond_maxpool2d_0_maxpool2d_q <= signX_uid60_i_selcond_maxpool2d_0_maxpool2d_b & signY_uid61_i_selcond_maxpool2d_0_maxpool2d_b;

    -- sxLTsy_uid64_i_selcond_maxpool2d_0_maxpool2d(LOGICAL,63)@133
    sxLTsy_uid64_i_selcond_maxpool2d_0_maxpool2d_q <= "1" WHEN concSXSY_uid63_i_selcond_maxpool2d_0_maxpool2d_q = two_uid62_i_selcond_maxpool2d_0_maxpool2d_q ELSE "0";

    -- rc2_uid71_i_selcond_maxpool2d_0_maxpool2d(LOGICAL,70)@133
    rc2_uid71_i_selcond_maxpool2d_0_maxpool2d_q <= sxLTsy_uid64_i_selcond_maxpool2d_0_maxpool2d_q and oneNonZero_uid70_i_selcond_maxpool2d_0_maxpool2d_q;

    -- expFracX_uid51_i_selcond_maxpool2d_0_maxpool2d(BITJOIN,50)@132
    expFracX_uid51_i_selcond_maxpool2d_0_maxpool2d_q <= exp_x_uid15_i_selcond_maxpool2d_0_maxpool2d_b & frac_x_uid16_i_selcond_maxpool2d_0_maxpool2d_b;

    -- expFracY_uid53_i_selcond_maxpool2d_0_maxpool2d(BITJOIN,52)@132
    expFracY_uid53_i_selcond_maxpool2d_0_maxpool2d_q <= exp_y_uid32_i_selcond_maxpool2d_0_maxpool2d_b & frac_y_uid33_i_selcond_maxpool2d_0_maxpool2d_b;

    -- efxGTefy_uid55_i_selcond_maxpool2d_0_maxpool2d(COMPARE,54)@132 + 1
    efxGTefy_uid55_i_selcond_maxpool2d_0_maxpool2d_a <= STD_LOGIC_VECTOR("00" & expFracY_uid53_i_selcond_maxpool2d_0_maxpool2d_q);
    efxGTefy_uid55_i_selcond_maxpool2d_0_maxpool2d_b <= STD_LOGIC_VECTOR("00" & expFracX_uid51_i_selcond_maxpool2d_0_maxpool2d_q);
    efxGTefy_uid55_i_selcond_maxpool2d_0_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            efxGTefy_uid55_i_selcond_maxpool2d_0_maxpool2d_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            efxGTefy_uid55_i_selcond_maxpool2d_0_maxpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(efxGTefy_uid55_i_selcond_maxpool2d_0_maxpool2d_a) - UNSIGNED(efxGTefy_uid55_i_selcond_maxpool2d_0_maxpool2d_b));
        END IF;
    END PROCESS;
    efxGTefy_uid55_i_selcond_maxpool2d_0_maxpool2d_c(0) <= efxGTefy_uid55_i_selcond_maxpool2d_0_maxpool2d_o(32);

    -- efxLTefy_uid56_i_selcond_maxpool2d_0_maxpool2d(COMPARE,55)@132 + 1
    efxLTefy_uid56_i_selcond_maxpool2d_0_maxpool2d_a <= STD_LOGIC_VECTOR("00" & expFracX_uid51_i_selcond_maxpool2d_0_maxpool2d_q);
    efxLTefy_uid56_i_selcond_maxpool2d_0_maxpool2d_b <= STD_LOGIC_VECTOR("00" & expFracY_uid53_i_selcond_maxpool2d_0_maxpool2d_q);
    efxLTefy_uid56_i_selcond_maxpool2d_0_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            efxLTefy_uid56_i_selcond_maxpool2d_0_maxpool2d_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            efxLTefy_uid56_i_selcond_maxpool2d_0_maxpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(efxLTefy_uid56_i_selcond_maxpool2d_0_maxpool2d_a) - UNSIGNED(efxLTefy_uid56_i_selcond_maxpool2d_0_maxpool2d_b));
        END IF;
    END PROCESS;
    efxLTefy_uid56_i_selcond_maxpool2d_0_maxpool2d_c(0) <= efxLTefy_uid56_i_selcond_maxpool2d_0_maxpool2d_o(32);

    -- expFracCompMux_uid67_i_selcond_maxpool2d_0_maxpool2d(MUX,66)@133
    expFracCompMux_uid67_i_selcond_maxpool2d_0_maxpool2d_s <= signX_uid60_i_selcond_maxpool2d_0_maxpool2d_b;
    expFracCompMux_uid67_i_selcond_maxpool2d_0_maxpool2d_combproc: PROCESS (expFracCompMux_uid67_i_selcond_maxpool2d_0_maxpool2d_s, efxLTefy_uid56_i_selcond_maxpool2d_0_maxpool2d_c, efxGTefy_uid55_i_selcond_maxpool2d_0_maxpool2d_c)
    BEGIN
        CASE (expFracCompMux_uid67_i_selcond_maxpool2d_0_maxpool2d_s) IS
            WHEN "0" => expFracCompMux_uid67_i_selcond_maxpool2d_0_maxpool2d_q <= efxLTefy_uid56_i_selcond_maxpool2d_0_maxpool2d_c;
            WHEN "1" => expFracCompMux_uid67_i_selcond_maxpool2d_0_maxpool2d_q <= efxGTefy_uid55_i_selcond_maxpool2d_0_maxpool2d_c;
            WHEN OTHERS => expFracCompMux_uid67_i_selcond_maxpool2d_0_maxpool2d_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- xorSigns_uid65_i_selcond_maxpool2d_0_maxpool2d(LOGICAL,64)@133
    xorSigns_uid65_i_selcond_maxpool2d_0_maxpool2d_q <= signX_uid60_i_selcond_maxpool2d_0_maxpool2d_b xor signY_uid61_i_selcond_maxpool2d_0_maxpool2d_b;

    -- sxEQsy_uid66_i_selcond_maxpool2d_0_maxpool2d(LOGICAL,65)@133
    sxEQsy_uid66_i_selcond_maxpool2d_0_maxpool2d_q <= not (xorSigns_uid65_i_selcond_maxpool2d_0_maxpool2d_q);

    -- sxEQsyExpFracCompMux_uid72_i_selcond_maxpool2d_0_maxpool2d(LOGICAL,71)@133
    sxEQsyExpFracCompMux_uid72_i_selcond_maxpool2d_0_maxpool2d_q <= sxEQsy_uid66_i_selcond_maxpool2d_0_maxpool2d_q and expFracCompMux_uid67_i_selcond_maxpool2d_0_maxpool2d_q;

    -- r_uid73_i_selcond_maxpool2d_0_maxpool2d(LOGICAL,72)@133 + 1
    r_uid73_i_selcond_maxpool2d_0_maxpool2d_qi <= sxEQsyExpFracCompMux_uid72_i_selcond_maxpool2d_0_maxpool2d_q or rc2_uid71_i_selcond_maxpool2d_0_maxpool2d_q;
    r_uid73_i_selcond_maxpool2d_0_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => r_uid73_i_selcond_maxpool2d_0_maxpool2d_qi, xout => r_uid73_i_selcond_maxpool2d_0_maxpool2d_q, clk => clock, aclr => resetn );

    -- fracXIsNotZero_uid37_i_selcond_maxpool2d_0_maxpool2d(LOGICAL,36)@132
    fracXIsNotZero_uid37_i_selcond_maxpool2d_0_maxpool2d_q <= not (fracXIsZero_uid36_i_selcond_maxpool2d_0_maxpool2d_q);

    -- cstAllOWE_uid12_i_selcond_maxpool2d_0_maxpool2d(CONSTANT,11)
    cstAllOWE_uid12_i_selcond_maxpool2d_0_maxpool2d_q <= "11111111";

    -- expXIsMax_uid35_i_selcond_maxpool2d_0_maxpool2d(LOGICAL,34)@132
    expXIsMax_uid35_i_selcond_maxpool2d_0_maxpool2d_q <= "1" WHEN exp_y_uid32_i_selcond_maxpool2d_0_maxpool2d_b = cstAllOWE_uid12_i_selcond_maxpool2d_0_maxpool2d_q ELSE "0";

    -- excN_y_uid40_i_selcond_maxpool2d_0_maxpool2d(LOGICAL,39)@132 + 1
    excN_y_uid40_i_selcond_maxpool2d_0_maxpool2d_qi <= expXIsMax_uid35_i_selcond_maxpool2d_0_maxpool2d_q and fracXIsNotZero_uid37_i_selcond_maxpool2d_0_maxpool2d_q;
    excN_y_uid40_i_selcond_maxpool2d_0_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excN_y_uid40_i_selcond_maxpool2d_0_maxpool2d_qi, xout => excN_y_uid40_i_selcond_maxpool2d_0_maxpool2d_q, clk => clock, aclr => resetn );

    -- fracXIsNotZero_uid20_i_selcond_maxpool2d_0_maxpool2d(LOGICAL,19)@132
    fracXIsNotZero_uid20_i_selcond_maxpool2d_0_maxpool2d_q <= not (fracXIsZero_uid19_i_selcond_maxpool2d_0_maxpool2d_q);

    -- expXIsMax_uid18_i_selcond_maxpool2d_0_maxpool2d(LOGICAL,17)@132
    expXIsMax_uid18_i_selcond_maxpool2d_0_maxpool2d_q <= "1" WHEN exp_x_uid15_i_selcond_maxpool2d_0_maxpool2d_b = cstAllOWE_uid12_i_selcond_maxpool2d_0_maxpool2d_q ELSE "0";

    -- excN_x_uid23_i_selcond_maxpool2d_0_maxpool2d(LOGICAL,22)@132 + 1
    excN_x_uid23_i_selcond_maxpool2d_0_maxpool2d_qi <= expXIsMax_uid18_i_selcond_maxpool2d_0_maxpool2d_q and fracXIsNotZero_uid20_i_selcond_maxpool2d_0_maxpool2d_q;
    excN_x_uid23_i_selcond_maxpool2d_0_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excN_x_uid23_i_selcond_maxpool2d_0_maxpool2d_qi, xout => excN_x_uid23_i_selcond_maxpool2d_0_maxpool2d_q, clk => clock, aclr => resetn );

    -- oneIsNaN_uid46_i_selcond_maxpool2d_0_maxpool2d(LOGICAL,45)@133 + 1
    oneIsNaN_uid46_i_selcond_maxpool2d_0_maxpool2d_qi <= excN_x_uid23_i_selcond_maxpool2d_0_maxpool2d_q or excN_y_uid40_i_selcond_maxpool2d_0_maxpool2d_q;
    oneIsNaN_uid46_i_selcond_maxpool2d_0_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => oneIsNaN_uid46_i_selcond_maxpool2d_0_maxpool2d_qi, xout => oneIsNaN_uid46_i_selcond_maxpool2d_0_maxpool2d_q, clk => clock, aclr => resetn );

    -- rPostExc_uid74_i_selcond_maxpool2d_0_maxpool2d(MUX,73)@134
    rPostExc_uid74_i_selcond_maxpool2d_0_maxpool2d_s <= oneIsNaN_uid46_i_selcond_maxpool2d_0_maxpool2d_q;
    rPostExc_uid74_i_selcond_maxpool2d_0_maxpool2d_combproc: PROCESS (rPostExc_uid74_i_selcond_maxpool2d_0_maxpool2d_s, r_uid73_i_selcond_maxpool2d_0_maxpool2d_q, GND_q)
    BEGIN
        CASE (rPostExc_uid74_i_selcond_maxpool2d_0_maxpool2d_s) IS
            WHEN "0" => rPostExc_uid74_i_selcond_maxpool2d_0_maxpool2d_q <= r_uid73_i_selcond_maxpool2d_0_maxpool2d_q;
            WHEN "1" => rPostExc_uid74_i_selcond_maxpool2d_0_maxpool2d_q <= GND_q;
            WHEN OTHERS => rPostExc_uid74_i_selcond_maxpool2d_0_maxpool2d_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_maxpool2d_0_maxpool2d(MUX,5)@134 + 1
    i_reduction_maxpool2d_0_maxpool2d_s <= rPostExc_uid74_i_selcond_maxpool2d_0_maxpool2d_q;
    i_reduction_maxpool2d_0_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_reduction_maxpool2d_0_maxpool2d_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_reduction_maxpool2d_0_maxpool2d_s) IS
                WHEN "0" => i_reduction_maxpool2d_0_maxpool2d_q <= redist5_sync_in_aunroll_x_in_c1_eni2_1_2_q;
                WHEN "1" => i_reduction_maxpool2d_0_maxpool2d_q <= redist11_sync_in_aunroll_x_in_c1_eni2_5_2_q;
                WHEN OTHERS => i_reduction_maxpool2d_0_maxpool2d_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist2_i_reduction_maxpool2d_0_maxpool2d_q_2(DELAY,205)
    redist2_i_reduction_maxpool2d_0_maxpool2d_q_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_reduction_maxpool2d_0_maxpool2d_q, xout => redist2_i_reduction_maxpool2d_0_maxpool2d_q_2_q, clk => clock, aclr => resetn );

    -- redist3_i_reduction_maxpool2d_0_maxpool2d_q_3(DELAY,206)
    redist3_i_reduction_maxpool2d_0_maxpool2d_q_3 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist2_i_reduction_maxpool2d_0_maxpool2d_q_2_q, xout => redist3_i_reduction_maxpool2d_0_maxpool2d_q_3_q, clk => clock, aclr => resetn );

    -- redist6_sync_in_aunroll_x_in_c1_eni2_2_1(DELAY,209)
    redist6_sync_in_aunroll_x_in_c1_eni2_2_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni2_2, xout => redist6_sync_in_aunroll_x_in_c1_eni2_2_1_q, clk => clock, aclr => resetn );

    -- redist7_sync_in_aunroll_x_in_c1_eni2_2_2(DELAY,210)
    redist7_sync_in_aunroll_x_in_c1_eni2_2_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist6_sync_in_aunroll_x_in_c1_eni2_2_1_q, xout => redist7_sync_in_aunroll_x_in_c1_eni2_2_2_q, clk => clock, aclr => resetn );

    -- redist8_sync_in_aunroll_x_in_c1_eni2_3_1(DELAY,211)
    redist8_sync_in_aunroll_x_in_c1_eni2_3_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni2_3, xout => redist8_sync_in_aunroll_x_in_c1_eni2_3_1_q, clk => clock, aclr => resetn );

    -- redist9_sync_in_aunroll_x_in_c1_eni2_3_2(DELAY,212)
    redist9_sync_in_aunroll_x_in_c1_eni2_3_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist8_sync_in_aunroll_x_in_c1_eni2_3_1_q, xout => redist9_sync_in_aunroll_x_in_c1_eni2_3_2_q, clk => clock, aclr => resetn );

    -- frac_y_uid97_i_selcond_maxpool2d_1_maxpool2d(BITSELECT,96)@132
    frac_y_uid97_i_selcond_maxpool2d_1_maxpool2d_b <= in_c1_eni2_2(22 downto 0);

    -- fracXIsZero_uid100_i_selcond_maxpool2d_1_maxpool2d(LOGICAL,99)@132
    fracXIsZero_uid100_i_selcond_maxpool2d_1_maxpool2d_q <= "1" WHEN cstZeroWF_uid13_i_selcond_maxpool2d_0_maxpool2d_q = frac_y_uid97_i_selcond_maxpool2d_1_maxpool2d_b ELSE "0";

    -- exp_y_uid96_i_selcond_maxpool2d_1_maxpool2d(BITSELECT,95)@132
    exp_y_uid96_i_selcond_maxpool2d_1_maxpool2d_b <= in_c1_eni2_2(30 downto 23);

    -- expXIsZero_uid98_i_selcond_maxpool2d_1_maxpool2d(LOGICAL,97)@132
    expXIsZero_uid98_i_selcond_maxpool2d_1_maxpool2d_q <= "1" WHEN exp_y_uid96_i_selcond_maxpool2d_1_maxpool2d_b = cstAllZWE_uid14_i_selcond_maxpool2d_0_maxpool2d_q ELSE "0";

    -- excZ_y_uid102_i_selcond_maxpool2d_1_maxpool2d(LOGICAL,101)@132 + 1
    excZ_y_uid102_i_selcond_maxpool2d_1_maxpool2d_qi <= expXIsZero_uid98_i_selcond_maxpool2d_1_maxpool2d_q and fracXIsZero_uid100_i_selcond_maxpool2d_1_maxpool2d_q;
    excZ_y_uid102_i_selcond_maxpool2d_1_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excZ_y_uid102_i_selcond_maxpool2d_1_maxpool2d_qi, xout => excZ_y_uid102_i_selcond_maxpool2d_1_maxpool2d_q, clk => clock, aclr => resetn );

    -- invExcYZ_uid132_i_selcond_maxpool2d_1_maxpool2d(LOGICAL,131)@133
    invExcYZ_uid132_i_selcond_maxpool2d_1_maxpool2d_q <= not (excZ_y_uid102_i_selcond_maxpool2d_1_maxpool2d_q);

    -- frac_x_uid80_i_selcond_maxpool2d_1_maxpool2d(BITSELECT,79)@132
    frac_x_uid80_i_selcond_maxpool2d_1_maxpool2d_b <= in_c1_eni2_3(22 downto 0);

    -- fracXIsZero_uid83_i_selcond_maxpool2d_1_maxpool2d(LOGICAL,82)@132
    fracXIsZero_uid83_i_selcond_maxpool2d_1_maxpool2d_q <= "1" WHEN cstZeroWF_uid13_i_selcond_maxpool2d_0_maxpool2d_q = frac_x_uid80_i_selcond_maxpool2d_1_maxpool2d_b ELSE "0";

    -- exp_x_uid79_i_selcond_maxpool2d_1_maxpool2d(BITSELECT,78)@132
    exp_x_uid79_i_selcond_maxpool2d_1_maxpool2d_b <= in_c1_eni2_3(30 downto 23);

    -- expXIsZero_uid81_i_selcond_maxpool2d_1_maxpool2d(LOGICAL,80)@132
    expXIsZero_uid81_i_selcond_maxpool2d_1_maxpool2d_q <= "1" WHEN exp_x_uid79_i_selcond_maxpool2d_1_maxpool2d_b = cstAllZWE_uid14_i_selcond_maxpool2d_0_maxpool2d_q ELSE "0";

    -- excZ_x_uid85_i_selcond_maxpool2d_1_maxpool2d(LOGICAL,84)@132 + 1
    excZ_x_uid85_i_selcond_maxpool2d_1_maxpool2d_qi <= expXIsZero_uid81_i_selcond_maxpool2d_1_maxpool2d_q and fracXIsZero_uid83_i_selcond_maxpool2d_1_maxpool2d_q;
    excZ_x_uid85_i_selcond_maxpool2d_1_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excZ_x_uid85_i_selcond_maxpool2d_1_maxpool2d_qi, xout => excZ_x_uid85_i_selcond_maxpool2d_1_maxpool2d_q, clk => clock, aclr => resetn );

    -- invExcXZ_uid133_i_selcond_maxpool2d_1_maxpool2d(LOGICAL,132)@133
    invExcXZ_uid133_i_selcond_maxpool2d_1_maxpool2d_q <= not (excZ_x_uid85_i_selcond_maxpool2d_1_maxpool2d_q);

    -- oneNonZero_uid134_i_selcond_maxpool2d_1_maxpool2d(LOGICAL,133)@133
    oneNonZero_uid134_i_selcond_maxpool2d_1_maxpool2d_q <= invExcXZ_uid133_i_selcond_maxpool2d_1_maxpool2d_q or invExcYZ_uid132_i_selcond_maxpool2d_1_maxpool2d_q;

    -- signX_uid124_i_selcond_maxpool2d_1_maxpool2d(BITSELECT,123)@133
    signX_uid124_i_selcond_maxpool2d_1_maxpool2d_b <= STD_LOGIC_VECTOR(redist8_sync_in_aunroll_x_in_c1_eni2_3_1_q(31 downto 31));

    -- signY_uid125_i_selcond_maxpool2d_1_maxpool2d(BITSELECT,124)@133
    signY_uid125_i_selcond_maxpool2d_1_maxpool2d_b <= STD_LOGIC_VECTOR(redist6_sync_in_aunroll_x_in_c1_eni2_2_1_q(31 downto 31));

    -- concSXSY_uid127_i_selcond_maxpool2d_1_maxpool2d(BITJOIN,126)@133
    concSXSY_uid127_i_selcond_maxpool2d_1_maxpool2d_q <= signX_uid124_i_selcond_maxpool2d_1_maxpool2d_b & signY_uid125_i_selcond_maxpool2d_1_maxpool2d_b;

    -- sxLTsy_uid128_i_selcond_maxpool2d_1_maxpool2d(LOGICAL,127)@133
    sxLTsy_uid128_i_selcond_maxpool2d_1_maxpool2d_q <= "1" WHEN concSXSY_uid127_i_selcond_maxpool2d_1_maxpool2d_q = two_uid62_i_selcond_maxpool2d_0_maxpool2d_q ELSE "0";

    -- rc2_uid135_i_selcond_maxpool2d_1_maxpool2d(LOGICAL,134)@133
    rc2_uid135_i_selcond_maxpool2d_1_maxpool2d_q <= sxLTsy_uid128_i_selcond_maxpool2d_1_maxpool2d_q and oneNonZero_uid134_i_selcond_maxpool2d_1_maxpool2d_q;

    -- expFracX_uid115_i_selcond_maxpool2d_1_maxpool2d(BITJOIN,114)@132
    expFracX_uid115_i_selcond_maxpool2d_1_maxpool2d_q <= exp_x_uid79_i_selcond_maxpool2d_1_maxpool2d_b & frac_x_uid80_i_selcond_maxpool2d_1_maxpool2d_b;

    -- expFracY_uid117_i_selcond_maxpool2d_1_maxpool2d(BITJOIN,116)@132
    expFracY_uid117_i_selcond_maxpool2d_1_maxpool2d_q <= exp_y_uid96_i_selcond_maxpool2d_1_maxpool2d_b & frac_y_uid97_i_selcond_maxpool2d_1_maxpool2d_b;

    -- efxGTefy_uid119_i_selcond_maxpool2d_1_maxpool2d(COMPARE,118)@132 + 1
    efxGTefy_uid119_i_selcond_maxpool2d_1_maxpool2d_a <= STD_LOGIC_VECTOR("00" & expFracY_uid117_i_selcond_maxpool2d_1_maxpool2d_q);
    efxGTefy_uid119_i_selcond_maxpool2d_1_maxpool2d_b <= STD_LOGIC_VECTOR("00" & expFracX_uid115_i_selcond_maxpool2d_1_maxpool2d_q);
    efxGTefy_uid119_i_selcond_maxpool2d_1_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            efxGTefy_uid119_i_selcond_maxpool2d_1_maxpool2d_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            efxGTefy_uid119_i_selcond_maxpool2d_1_maxpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(efxGTefy_uid119_i_selcond_maxpool2d_1_maxpool2d_a) - UNSIGNED(efxGTefy_uid119_i_selcond_maxpool2d_1_maxpool2d_b));
        END IF;
    END PROCESS;
    efxGTefy_uid119_i_selcond_maxpool2d_1_maxpool2d_c(0) <= efxGTefy_uid119_i_selcond_maxpool2d_1_maxpool2d_o(32);

    -- efxLTefy_uid120_i_selcond_maxpool2d_1_maxpool2d(COMPARE,119)@132 + 1
    efxLTefy_uid120_i_selcond_maxpool2d_1_maxpool2d_a <= STD_LOGIC_VECTOR("00" & expFracX_uid115_i_selcond_maxpool2d_1_maxpool2d_q);
    efxLTefy_uid120_i_selcond_maxpool2d_1_maxpool2d_b <= STD_LOGIC_VECTOR("00" & expFracY_uid117_i_selcond_maxpool2d_1_maxpool2d_q);
    efxLTefy_uid120_i_selcond_maxpool2d_1_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            efxLTefy_uid120_i_selcond_maxpool2d_1_maxpool2d_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            efxLTefy_uid120_i_selcond_maxpool2d_1_maxpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(efxLTefy_uid120_i_selcond_maxpool2d_1_maxpool2d_a) - UNSIGNED(efxLTefy_uid120_i_selcond_maxpool2d_1_maxpool2d_b));
        END IF;
    END PROCESS;
    efxLTefy_uid120_i_selcond_maxpool2d_1_maxpool2d_c(0) <= efxLTefy_uid120_i_selcond_maxpool2d_1_maxpool2d_o(32);

    -- expFracCompMux_uid131_i_selcond_maxpool2d_1_maxpool2d(MUX,130)@133
    expFracCompMux_uid131_i_selcond_maxpool2d_1_maxpool2d_s <= signX_uid124_i_selcond_maxpool2d_1_maxpool2d_b;
    expFracCompMux_uid131_i_selcond_maxpool2d_1_maxpool2d_combproc: PROCESS (expFracCompMux_uid131_i_selcond_maxpool2d_1_maxpool2d_s, efxLTefy_uid120_i_selcond_maxpool2d_1_maxpool2d_c, efxGTefy_uid119_i_selcond_maxpool2d_1_maxpool2d_c)
    BEGIN
        CASE (expFracCompMux_uid131_i_selcond_maxpool2d_1_maxpool2d_s) IS
            WHEN "0" => expFracCompMux_uid131_i_selcond_maxpool2d_1_maxpool2d_q <= efxLTefy_uid120_i_selcond_maxpool2d_1_maxpool2d_c;
            WHEN "1" => expFracCompMux_uid131_i_selcond_maxpool2d_1_maxpool2d_q <= efxGTefy_uid119_i_selcond_maxpool2d_1_maxpool2d_c;
            WHEN OTHERS => expFracCompMux_uid131_i_selcond_maxpool2d_1_maxpool2d_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- xorSigns_uid129_i_selcond_maxpool2d_1_maxpool2d(LOGICAL,128)@133
    xorSigns_uid129_i_selcond_maxpool2d_1_maxpool2d_q <= signX_uid124_i_selcond_maxpool2d_1_maxpool2d_b xor signY_uid125_i_selcond_maxpool2d_1_maxpool2d_b;

    -- sxEQsy_uid130_i_selcond_maxpool2d_1_maxpool2d(LOGICAL,129)@133
    sxEQsy_uid130_i_selcond_maxpool2d_1_maxpool2d_q <= not (xorSigns_uid129_i_selcond_maxpool2d_1_maxpool2d_q);

    -- sxEQsyExpFracCompMux_uid136_i_selcond_maxpool2d_1_maxpool2d(LOGICAL,135)@133
    sxEQsyExpFracCompMux_uid136_i_selcond_maxpool2d_1_maxpool2d_q <= sxEQsy_uid130_i_selcond_maxpool2d_1_maxpool2d_q and expFracCompMux_uid131_i_selcond_maxpool2d_1_maxpool2d_q;

    -- r_uid137_i_selcond_maxpool2d_1_maxpool2d(LOGICAL,136)@133 + 1
    r_uid137_i_selcond_maxpool2d_1_maxpool2d_qi <= sxEQsyExpFracCompMux_uid136_i_selcond_maxpool2d_1_maxpool2d_q or rc2_uid135_i_selcond_maxpool2d_1_maxpool2d_q;
    r_uid137_i_selcond_maxpool2d_1_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => r_uid137_i_selcond_maxpool2d_1_maxpool2d_qi, xout => r_uid137_i_selcond_maxpool2d_1_maxpool2d_q, clk => clock, aclr => resetn );

    -- fracXIsNotZero_uid101_i_selcond_maxpool2d_1_maxpool2d(LOGICAL,100)@132
    fracXIsNotZero_uid101_i_selcond_maxpool2d_1_maxpool2d_q <= not (fracXIsZero_uid100_i_selcond_maxpool2d_1_maxpool2d_q);

    -- expXIsMax_uid99_i_selcond_maxpool2d_1_maxpool2d(LOGICAL,98)@132
    expXIsMax_uid99_i_selcond_maxpool2d_1_maxpool2d_q <= "1" WHEN exp_y_uid96_i_selcond_maxpool2d_1_maxpool2d_b = cstAllOWE_uid12_i_selcond_maxpool2d_0_maxpool2d_q ELSE "0";

    -- excN_y_uid104_i_selcond_maxpool2d_1_maxpool2d(LOGICAL,103)@132 + 1
    excN_y_uid104_i_selcond_maxpool2d_1_maxpool2d_qi <= expXIsMax_uid99_i_selcond_maxpool2d_1_maxpool2d_q and fracXIsNotZero_uid101_i_selcond_maxpool2d_1_maxpool2d_q;
    excN_y_uid104_i_selcond_maxpool2d_1_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excN_y_uid104_i_selcond_maxpool2d_1_maxpool2d_qi, xout => excN_y_uid104_i_selcond_maxpool2d_1_maxpool2d_q, clk => clock, aclr => resetn );

    -- fracXIsNotZero_uid84_i_selcond_maxpool2d_1_maxpool2d(LOGICAL,83)@132
    fracXIsNotZero_uid84_i_selcond_maxpool2d_1_maxpool2d_q <= not (fracXIsZero_uid83_i_selcond_maxpool2d_1_maxpool2d_q);

    -- expXIsMax_uid82_i_selcond_maxpool2d_1_maxpool2d(LOGICAL,81)@132
    expXIsMax_uid82_i_selcond_maxpool2d_1_maxpool2d_q <= "1" WHEN exp_x_uid79_i_selcond_maxpool2d_1_maxpool2d_b = cstAllOWE_uid12_i_selcond_maxpool2d_0_maxpool2d_q ELSE "0";

    -- excN_x_uid87_i_selcond_maxpool2d_1_maxpool2d(LOGICAL,86)@132 + 1
    excN_x_uid87_i_selcond_maxpool2d_1_maxpool2d_qi <= expXIsMax_uid82_i_selcond_maxpool2d_1_maxpool2d_q and fracXIsNotZero_uid84_i_selcond_maxpool2d_1_maxpool2d_q;
    excN_x_uid87_i_selcond_maxpool2d_1_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excN_x_uid87_i_selcond_maxpool2d_1_maxpool2d_qi, xout => excN_x_uid87_i_selcond_maxpool2d_1_maxpool2d_q, clk => clock, aclr => resetn );

    -- oneIsNaN_uid110_i_selcond_maxpool2d_1_maxpool2d(LOGICAL,109)@133 + 1
    oneIsNaN_uid110_i_selcond_maxpool2d_1_maxpool2d_qi <= excN_x_uid87_i_selcond_maxpool2d_1_maxpool2d_q or excN_y_uid104_i_selcond_maxpool2d_1_maxpool2d_q;
    oneIsNaN_uid110_i_selcond_maxpool2d_1_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => oneIsNaN_uid110_i_selcond_maxpool2d_1_maxpool2d_qi, xout => oneIsNaN_uid110_i_selcond_maxpool2d_1_maxpool2d_q, clk => clock, aclr => resetn );

    -- rPostExc_uid138_i_selcond_maxpool2d_1_maxpool2d(MUX,137)@134
    rPostExc_uid138_i_selcond_maxpool2d_1_maxpool2d_s <= oneIsNaN_uid110_i_selcond_maxpool2d_1_maxpool2d_q;
    rPostExc_uid138_i_selcond_maxpool2d_1_maxpool2d_combproc: PROCESS (rPostExc_uid138_i_selcond_maxpool2d_1_maxpool2d_s, r_uid137_i_selcond_maxpool2d_1_maxpool2d_q, GND_q)
    BEGIN
        CASE (rPostExc_uid138_i_selcond_maxpool2d_1_maxpool2d_s) IS
            WHEN "0" => rPostExc_uid138_i_selcond_maxpool2d_1_maxpool2d_q <= r_uid137_i_selcond_maxpool2d_1_maxpool2d_q;
            WHEN "1" => rPostExc_uid138_i_selcond_maxpool2d_1_maxpool2d_q <= GND_q;
            WHEN OTHERS => rPostExc_uid138_i_selcond_maxpool2d_1_maxpool2d_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_maxpool2d_1_maxpool2d(MUX,6)@134 + 1
    i_reduction_maxpool2d_1_maxpool2d_s <= rPostExc_uid138_i_selcond_maxpool2d_1_maxpool2d_q;
    i_reduction_maxpool2d_1_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_reduction_maxpool2d_1_maxpool2d_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_reduction_maxpool2d_1_maxpool2d_s) IS
                WHEN "0" => i_reduction_maxpool2d_1_maxpool2d_q <= redist9_sync_in_aunroll_x_in_c1_eni2_3_2_q;
                WHEN "1" => i_reduction_maxpool2d_1_maxpool2d_q <= redist7_sync_in_aunroll_x_in_c1_eni2_2_2_q;
                WHEN OTHERS => i_reduction_maxpool2d_1_maxpool2d_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist0_i_reduction_maxpool2d_1_maxpool2d_q_2(DELAY,203)
    redist0_i_reduction_maxpool2d_1_maxpool2d_q_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_reduction_maxpool2d_1_maxpool2d_q, xout => redist0_i_reduction_maxpool2d_1_maxpool2d_q_2_q, clk => clock, aclr => resetn );

    -- redist1_i_reduction_maxpool2d_1_maxpool2d_q_3(DELAY,204)
    redist1_i_reduction_maxpool2d_1_maxpool2d_q_3 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist0_i_reduction_maxpool2d_1_maxpool2d_q_2_q, xout => redist1_i_reduction_maxpool2d_1_maxpool2d_q_3_q, clk => clock, aclr => resetn );

    -- frac_y_uid161_i_selcond_maxpool2d_2_maxpool2d(BITSELECT,160)@135
    frac_y_uid161_i_selcond_maxpool2d_2_maxpool2d_b <= i_reduction_maxpool2d_0_maxpool2d_q(22 downto 0);

    -- fracXIsZero_uid164_i_selcond_maxpool2d_2_maxpool2d(LOGICAL,163)@135
    fracXIsZero_uid164_i_selcond_maxpool2d_2_maxpool2d_q <= "1" WHEN cstZeroWF_uid13_i_selcond_maxpool2d_0_maxpool2d_q = frac_y_uid161_i_selcond_maxpool2d_2_maxpool2d_b ELSE "0";

    -- exp_y_uid160_i_selcond_maxpool2d_2_maxpool2d(BITSELECT,159)@135
    exp_y_uid160_i_selcond_maxpool2d_2_maxpool2d_b <= i_reduction_maxpool2d_0_maxpool2d_q(30 downto 23);

    -- expXIsZero_uid162_i_selcond_maxpool2d_2_maxpool2d(LOGICAL,161)@135
    expXIsZero_uid162_i_selcond_maxpool2d_2_maxpool2d_q <= "1" WHEN exp_y_uid160_i_selcond_maxpool2d_2_maxpool2d_b = cstAllZWE_uid14_i_selcond_maxpool2d_0_maxpool2d_q ELSE "0";

    -- excZ_y_uid166_i_selcond_maxpool2d_2_maxpool2d(LOGICAL,165)@135 + 1
    excZ_y_uid166_i_selcond_maxpool2d_2_maxpool2d_qi <= expXIsZero_uid162_i_selcond_maxpool2d_2_maxpool2d_q and fracXIsZero_uid164_i_selcond_maxpool2d_2_maxpool2d_q;
    excZ_y_uid166_i_selcond_maxpool2d_2_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excZ_y_uid166_i_selcond_maxpool2d_2_maxpool2d_qi, xout => excZ_y_uid166_i_selcond_maxpool2d_2_maxpool2d_q, clk => clock, aclr => resetn );

    -- invExcYZ_uid196_i_selcond_maxpool2d_2_maxpool2d(LOGICAL,195)@136
    invExcYZ_uid196_i_selcond_maxpool2d_2_maxpool2d_q <= not (excZ_y_uid166_i_selcond_maxpool2d_2_maxpool2d_q);

    -- frac_x_uid144_i_selcond_maxpool2d_2_maxpool2d(BITSELECT,143)@135
    frac_x_uid144_i_selcond_maxpool2d_2_maxpool2d_b <= i_reduction_maxpool2d_1_maxpool2d_q(22 downto 0);

    -- fracXIsZero_uid147_i_selcond_maxpool2d_2_maxpool2d(LOGICAL,146)@135
    fracXIsZero_uid147_i_selcond_maxpool2d_2_maxpool2d_q <= "1" WHEN cstZeroWF_uid13_i_selcond_maxpool2d_0_maxpool2d_q = frac_x_uid144_i_selcond_maxpool2d_2_maxpool2d_b ELSE "0";

    -- exp_x_uid143_i_selcond_maxpool2d_2_maxpool2d(BITSELECT,142)@135
    exp_x_uid143_i_selcond_maxpool2d_2_maxpool2d_b <= i_reduction_maxpool2d_1_maxpool2d_q(30 downto 23);

    -- expXIsZero_uid145_i_selcond_maxpool2d_2_maxpool2d(LOGICAL,144)@135
    expXIsZero_uid145_i_selcond_maxpool2d_2_maxpool2d_q <= "1" WHEN exp_x_uid143_i_selcond_maxpool2d_2_maxpool2d_b = cstAllZWE_uid14_i_selcond_maxpool2d_0_maxpool2d_q ELSE "0";

    -- excZ_x_uid149_i_selcond_maxpool2d_2_maxpool2d(LOGICAL,148)@135 + 1
    excZ_x_uid149_i_selcond_maxpool2d_2_maxpool2d_qi <= expXIsZero_uid145_i_selcond_maxpool2d_2_maxpool2d_q and fracXIsZero_uid147_i_selcond_maxpool2d_2_maxpool2d_q;
    excZ_x_uid149_i_selcond_maxpool2d_2_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excZ_x_uid149_i_selcond_maxpool2d_2_maxpool2d_qi, xout => excZ_x_uid149_i_selcond_maxpool2d_2_maxpool2d_q, clk => clock, aclr => resetn );

    -- invExcXZ_uid197_i_selcond_maxpool2d_2_maxpool2d(LOGICAL,196)@136
    invExcXZ_uid197_i_selcond_maxpool2d_2_maxpool2d_q <= not (excZ_x_uid149_i_selcond_maxpool2d_2_maxpool2d_q);

    -- oneNonZero_uid198_i_selcond_maxpool2d_2_maxpool2d(LOGICAL,197)@136
    oneNonZero_uid198_i_selcond_maxpool2d_2_maxpool2d_q <= invExcXZ_uid197_i_selcond_maxpool2d_2_maxpool2d_q or invExcYZ_uid196_i_selcond_maxpool2d_2_maxpool2d_q;

    -- signX_uid188_i_selcond_maxpool2d_2_maxpool2d(BITSELECT,187)@136
    signX_uid188_i_selcond_maxpool2d_2_maxpool2d_b <= STD_LOGIC_VECTOR(redist0_i_reduction_maxpool2d_1_maxpool2d_q_2_q(31 downto 31));

    -- signY_uid189_i_selcond_maxpool2d_2_maxpool2d(BITSELECT,188)@136
    signY_uid189_i_selcond_maxpool2d_2_maxpool2d_b <= STD_LOGIC_VECTOR(redist2_i_reduction_maxpool2d_0_maxpool2d_q_2_q(31 downto 31));

    -- concSXSY_uid191_i_selcond_maxpool2d_2_maxpool2d(BITJOIN,190)@136
    concSXSY_uid191_i_selcond_maxpool2d_2_maxpool2d_q <= signX_uid188_i_selcond_maxpool2d_2_maxpool2d_b & signY_uid189_i_selcond_maxpool2d_2_maxpool2d_b;

    -- sxLTsy_uid192_i_selcond_maxpool2d_2_maxpool2d(LOGICAL,191)@136
    sxLTsy_uid192_i_selcond_maxpool2d_2_maxpool2d_q <= "1" WHEN concSXSY_uid191_i_selcond_maxpool2d_2_maxpool2d_q = two_uid62_i_selcond_maxpool2d_0_maxpool2d_q ELSE "0";

    -- rc2_uid199_i_selcond_maxpool2d_2_maxpool2d(LOGICAL,198)@136
    rc2_uid199_i_selcond_maxpool2d_2_maxpool2d_q <= sxLTsy_uid192_i_selcond_maxpool2d_2_maxpool2d_q and oneNonZero_uid198_i_selcond_maxpool2d_2_maxpool2d_q;

    -- expFracX_uid179_i_selcond_maxpool2d_2_maxpool2d(BITJOIN,178)@135
    expFracX_uid179_i_selcond_maxpool2d_2_maxpool2d_q <= exp_x_uid143_i_selcond_maxpool2d_2_maxpool2d_b & frac_x_uid144_i_selcond_maxpool2d_2_maxpool2d_b;

    -- expFracY_uid181_i_selcond_maxpool2d_2_maxpool2d(BITJOIN,180)@135
    expFracY_uid181_i_selcond_maxpool2d_2_maxpool2d_q <= exp_y_uid160_i_selcond_maxpool2d_2_maxpool2d_b & frac_y_uid161_i_selcond_maxpool2d_2_maxpool2d_b;

    -- efxGTefy_uid183_i_selcond_maxpool2d_2_maxpool2d(COMPARE,182)@135 + 1
    efxGTefy_uid183_i_selcond_maxpool2d_2_maxpool2d_a <= STD_LOGIC_VECTOR("00" & expFracY_uid181_i_selcond_maxpool2d_2_maxpool2d_q);
    efxGTefy_uid183_i_selcond_maxpool2d_2_maxpool2d_b <= STD_LOGIC_VECTOR("00" & expFracX_uid179_i_selcond_maxpool2d_2_maxpool2d_q);
    efxGTefy_uid183_i_selcond_maxpool2d_2_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            efxGTefy_uid183_i_selcond_maxpool2d_2_maxpool2d_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            efxGTefy_uid183_i_selcond_maxpool2d_2_maxpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(efxGTefy_uid183_i_selcond_maxpool2d_2_maxpool2d_a) - UNSIGNED(efxGTefy_uid183_i_selcond_maxpool2d_2_maxpool2d_b));
        END IF;
    END PROCESS;
    efxGTefy_uid183_i_selcond_maxpool2d_2_maxpool2d_c(0) <= efxGTefy_uid183_i_selcond_maxpool2d_2_maxpool2d_o(32);

    -- efxLTefy_uid184_i_selcond_maxpool2d_2_maxpool2d(COMPARE,183)@135 + 1
    efxLTefy_uid184_i_selcond_maxpool2d_2_maxpool2d_a <= STD_LOGIC_VECTOR("00" & expFracX_uid179_i_selcond_maxpool2d_2_maxpool2d_q);
    efxLTefy_uid184_i_selcond_maxpool2d_2_maxpool2d_b <= STD_LOGIC_VECTOR("00" & expFracY_uid181_i_selcond_maxpool2d_2_maxpool2d_q);
    efxLTefy_uid184_i_selcond_maxpool2d_2_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            efxLTefy_uid184_i_selcond_maxpool2d_2_maxpool2d_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            efxLTefy_uid184_i_selcond_maxpool2d_2_maxpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(efxLTefy_uid184_i_selcond_maxpool2d_2_maxpool2d_a) - UNSIGNED(efxLTefy_uid184_i_selcond_maxpool2d_2_maxpool2d_b));
        END IF;
    END PROCESS;
    efxLTefy_uid184_i_selcond_maxpool2d_2_maxpool2d_c(0) <= efxLTefy_uid184_i_selcond_maxpool2d_2_maxpool2d_o(32);

    -- expFracCompMux_uid195_i_selcond_maxpool2d_2_maxpool2d(MUX,194)@136
    expFracCompMux_uid195_i_selcond_maxpool2d_2_maxpool2d_s <= signX_uid188_i_selcond_maxpool2d_2_maxpool2d_b;
    expFracCompMux_uid195_i_selcond_maxpool2d_2_maxpool2d_combproc: PROCESS (expFracCompMux_uid195_i_selcond_maxpool2d_2_maxpool2d_s, efxLTefy_uid184_i_selcond_maxpool2d_2_maxpool2d_c, efxGTefy_uid183_i_selcond_maxpool2d_2_maxpool2d_c)
    BEGIN
        CASE (expFracCompMux_uid195_i_selcond_maxpool2d_2_maxpool2d_s) IS
            WHEN "0" => expFracCompMux_uid195_i_selcond_maxpool2d_2_maxpool2d_q <= efxLTefy_uid184_i_selcond_maxpool2d_2_maxpool2d_c;
            WHEN "1" => expFracCompMux_uid195_i_selcond_maxpool2d_2_maxpool2d_q <= efxGTefy_uid183_i_selcond_maxpool2d_2_maxpool2d_c;
            WHEN OTHERS => expFracCompMux_uid195_i_selcond_maxpool2d_2_maxpool2d_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- xorSigns_uid193_i_selcond_maxpool2d_2_maxpool2d(LOGICAL,192)@136
    xorSigns_uid193_i_selcond_maxpool2d_2_maxpool2d_q <= signX_uid188_i_selcond_maxpool2d_2_maxpool2d_b xor signY_uid189_i_selcond_maxpool2d_2_maxpool2d_b;

    -- sxEQsy_uid194_i_selcond_maxpool2d_2_maxpool2d(LOGICAL,193)@136
    sxEQsy_uid194_i_selcond_maxpool2d_2_maxpool2d_q <= not (xorSigns_uid193_i_selcond_maxpool2d_2_maxpool2d_q);

    -- sxEQsyExpFracCompMux_uid200_i_selcond_maxpool2d_2_maxpool2d(LOGICAL,199)@136
    sxEQsyExpFracCompMux_uid200_i_selcond_maxpool2d_2_maxpool2d_q <= sxEQsy_uid194_i_selcond_maxpool2d_2_maxpool2d_q and expFracCompMux_uid195_i_selcond_maxpool2d_2_maxpool2d_q;

    -- r_uid201_i_selcond_maxpool2d_2_maxpool2d(LOGICAL,200)@136 + 1
    r_uid201_i_selcond_maxpool2d_2_maxpool2d_qi <= sxEQsyExpFracCompMux_uid200_i_selcond_maxpool2d_2_maxpool2d_q or rc2_uid199_i_selcond_maxpool2d_2_maxpool2d_q;
    r_uid201_i_selcond_maxpool2d_2_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => r_uid201_i_selcond_maxpool2d_2_maxpool2d_qi, xout => r_uid201_i_selcond_maxpool2d_2_maxpool2d_q, clk => clock, aclr => resetn );

    -- fracXIsNotZero_uid165_i_selcond_maxpool2d_2_maxpool2d(LOGICAL,164)@135
    fracXIsNotZero_uid165_i_selcond_maxpool2d_2_maxpool2d_q <= not (fracXIsZero_uid164_i_selcond_maxpool2d_2_maxpool2d_q);

    -- expXIsMax_uid163_i_selcond_maxpool2d_2_maxpool2d(LOGICAL,162)@135
    expXIsMax_uid163_i_selcond_maxpool2d_2_maxpool2d_q <= "1" WHEN exp_y_uid160_i_selcond_maxpool2d_2_maxpool2d_b = cstAllOWE_uid12_i_selcond_maxpool2d_0_maxpool2d_q ELSE "0";

    -- excN_y_uid168_i_selcond_maxpool2d_2_maxpool2d(LOGICAL,167)@135 + 1
    excN_y_uid168_i_selcond_maxpool2d_2_maxpool2d_qi <= expXIsMax_uid163_i_selcond_maxpool2d_2_maxpool2d_q and fracXIsNotZero_uid165_i_selcond_maxpool2d_2_maxpool2d_q;
    excN_y_uid168_i_selcond_maxpool2d_2_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excN_y_uid168_i_selcond_maxpool2d_2_maxpool2d_qi, xout => excN_y_uid168_i_selcond_maxpool2d_2_maxpool2d_q, clk => clock, aclr => resetn );

    -- fracXIsNotZero_uid148_i_selcond_maxpool2d_2_maxpool2d(LOGICAL,147)@135
    fracXIsNotZero_uid148_i_selcond_maxpool2d_2_maxpool2d_q <= not (fracXIsZero_uid147_i_selcond_maxpool2d_2_maxpool2d_q);

    -- expXIsMax_uid146_i_selcond_maxpool2d_2_maxpool2d(LOGICAL,145)@135
    expXIsMax_uid146_i_selcond_maxpool2d_2_maxpool2d_q <= "1" WHEN exp_x_uid143_i_selcond_maxpool2d_2_maxpool2d_b = cstAllOWE_uid12_i_selcond_maxpool2d_0_maxpool2d_q ELSE "0";

    -- excN_x_uid151_i_selcond_maxpool2d_2_maxpool2d(LOGICAL,150)@135 + 1
    excN_x_uid151_i_selcond_maxpool2d_2_maxpool2d_qi <= expXIsMax_uid146_i_selcond_maxpool2d_2_maxpool2d_q and fracXIsNotZero_uid148_i_selcond_maxpool2d_2_maxpool2d_q;
    excN_x_uid151_i_selcond_maxpool2d_2_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excN_x_uid151_i_selcond_maxpool2d_2_maxpool2d_qi, xout => excN_x_uid151_i_selcond_maxpool2d_2_maxpool2d_q, clk => clock, aclr => resetn );

    -- oneIsNaN_uid174_i_selcond_maxpool2d_2_maxpool2d(LOGICAL,173)@136 + 1
    oneIsNaN_uid174_i_selcond_maxpool2d_2_maxpool2d_qi <= excN_x_uid151_i_selcond_maxpool2d_2_maxpool2d_q or excN_y_uid168_i_selcond_maxpool2d_2_maxpool2d_q;
    oneIsNaN_uid174_i_selcond_maxpool2d_2_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => oneIsNaN_uid174_i_selcond_maxpool2d_2_maxpool2d_qi, xout => oneIsNaN_uid174_i_selcond_maxpool2d_2_maxpool2d_q, clk => clock, aclr => resetn );

    -- rPostExc_uid202_i_selcond_maxpool2d_2_maxpool2d(MUX,201)@137
    rPostExc_uid202_i_selcond_maxpool2d_2_maxpool2d_s <= oneIsNaN_uid174_i_selcond_maxpool2d_2_maxpool2d_q;
    rPostExc_uid202_i_selcond_maxpool2d_2_maxpool2d_combproc: PROCESS (rPostExc_uid202_i_selcond_maxpool2d_2_maxpool2d_s, r_uid201_i_selcond_maxpool2d_2_maxpool2d_q, GND_q)
    BEGIN
        CASE (rPostExc_uid202_i_selcond_maxpool2d_2_maxpool2d_s) IS
            WHEN "0" => rPostExc_uid202_i_selcond_maxpool2d_2_maxpool2d_q <= r_uid201_i_selcond_maxpool2d_2_maxpool2d_q;
            WHEN "1" => rPostExc_uid202_i_selcond_maxpool2d_2_maxpool2d_q <= GND_q;
            WHEN OTHERS => rPostExc_uid202_i_selcond_maxpool2d_2_maxpool2d_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_reduction_maxpool2d_2_maxpool2d(MUX,7)@137
    i_reduction_maxpool2d_2_maxpool2d_s <= rPostExc_uid202_i_selcond_maxpool2d_2_maxpool2d_q;
    i_reduction_maxpool2d_2_maxpool2d_combproc: PROCESS (i_reduction_maxpool2d_2_maxpool2d_s, redist1_i_reduction_maxpool2d_1_maxpool2d_q_3_q, redist3_i_reduction_maxpool2d_0_maxpool2d_q_3_q)
    BEGIN
        CASE (i_reduction_maxpool2d_2_maxpool2d_s) IS
            WHEN "0" => i_reduction_maxpool2d_2_maxpool2d_q <= redist1_i_reduction_maxpool2d_1_maxpool2d_q_3_q;
            WHEN "1" => i_reduction_maxpool2d_2_maxpool2d_q <= redist3_i_reduction_maxpool2d_0_maxpool2d_q_3_q;
            WHEN OTHERS => i_reduction_maxpool2d_2_maxpool2d_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,3)@137
    out_c1_exi115_0 <= GND_q;
    out_c1_exi115_1 <= i_reduction_maxpool2d_2_maxpool2d_q;
    out_o_valid <= redist12_sync_in_aunroll_x_in_i_valid_5_q;

END normal;
