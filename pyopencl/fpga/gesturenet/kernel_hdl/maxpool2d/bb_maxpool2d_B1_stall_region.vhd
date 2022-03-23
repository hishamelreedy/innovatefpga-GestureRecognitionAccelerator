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

-- VHDL created from bb_maxpool2d_B1_stall_region
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

entity bb_maxpool2d_B1_stall_region is
    port (
        in_c0_exe12 : in std_logic_vector(63 downto 0);  -- ufix64
        in_i_010 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im_addr_011 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_17 : in std_logic_vector(63 downto 0);  -- ufix64
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe12 : out std_logic_vector(63 downto 0);  -- ufix64
        out_i_010 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_mul22 : out std_logic_vector(31 downto 0);  -- ufix32
        out_mul24 : out std_logic_vector(31 downto 0);  -- ufix32
        out_output_im_addr_011 : out std_logic_vector(63 downto 0);  -- ufix64
        out_output_im_addr_17 : out std_logic_vector(63 downto 0);  -- ufix64
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_maxpool2d_B1_stall_region;

architecture normal of bb_maxpool2d_B1_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component maxpool2d_B1_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B1_merge_reg_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B1_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B1_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_mul22_maxpool2d_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul22_maxpool2d_vt_select_31_b : STD_LOGIC_VECTOR (30 downto 0);
    signal i_mul24_maxpool2d_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul24_maxpool2d_vt_select_31_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage0Idx1Rng1_uid33_i_mul22_maxpool2d_maxpool2d13_shift_x_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage0Idx1Rng1_uid33_i_mul22_maxpool2d_maxpool2d13_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage0Idx1_uid34_i_mul22_maxpool2d_maxpool2d13_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid36_i_mul22_maxpool2d_maxpool2d13_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid36_i_mul22_maxpool2d_maxpool2d13_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx1Rng1_uid42_i_mul24_maxpool2d_maxpool2d14_shift_x_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage0Idx1Rng1_uid42_i_mul24_maxpool2d_maxpool2d14_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage0Idx1_uid43_i_mul24_maxpool2d_maxpool2d14_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid45_i_mul24_maxpool2d_maxpool2d14_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid45_i_mul24_maxpool2d_maxpool2d14_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_maxpool2d_B1_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (255 downto 0);
    signal bubble_select_maxpool2d_B1_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_maxpool2d_B1_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_maxpool2d_B1_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_maxpool2d_B1_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_maxpool2d_B1_merge_reg_aunroll_x_f : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (255 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (63 downto 0);
    signal SE_out_maxpool2d_B1_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B1_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B1_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_stall_entry(STALLENABLE,59)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= maxpool2d_B1_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,50)
    bubble_join_stall_entry_q <= in_output_im_addr_17 & in_output_im_addr_011 & in_j_16 & in_i_010 & in_c0_exe12;

    -- bubble_select_stall_entry(BITSELECT,51)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(95 downto 64));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(127 downto 96));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(191 downto 128));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(255 downto 192));

    -- maxpool2d_B1_merge_reg_aunroll_x(BLACKBOX,12)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_data_out_2@1
    -- out out_data_out_3@1
    -- out out_data_out_4@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    themaxpool2d_B1_merge_reg_aunroll_x : maxpool2d_B1_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_e,
        in_data_in_1 => bubble_select_stall_entry_c,
        in_data_in_2 => bubble_select_stall_entry_f,
        in_data_in_3 => bubble_select_stall_entry_d,
        in_data_in_4 => bubble_select_stall_entry_b,
        in_stall_in => SE_out_maxpool2d_B1_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3,
        out_data_out_4 => maxpool2d_B1_merge_reg_aunroll_x_out_data_out_4,
        out_stall_out => maxpool2d_B1_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => maxpool2d_B1_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_maxpool2d_B1_merge_reg_aunroll_x(STALLENABLE,54)
    -- Valid signal propagation
    SE_out_maxpool2d_B1_merge_reg_aunroll_x_V0 <= SE_out_maxpool2d_B1_merge_reg_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_maxpool2d_B1_merge_reg_aunroll_x_backStall <= in_stall_in or not (SE_out_maxpool2d_B1_merge_reg_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_maxpool2d_B1_merge_reg_aunroll_x_wireValid <= maxpool2d_B1_merge_reg_aunroll_x_out_valid_out;

    -- leftShiftStage0Idx1Rng1_uid42_i_mul24_maxpool2d_maxpool2d14_shift_x(BITSELECT,41)@1
    leftShiftStage0Idx1Rng1_uid42_i_mul24_maxpool2d_maxpool2d14_shift_x_in <= bubble_select_maxpool2d_B1_merge_reg_aunroll_x_e(30 downto 0);
    leftShiftStage0Idx1Rng1_uid42_i_mul24_maxpool2d_maxpool2d14_shift_x_b <= leftShiftStage0Idx1Rng1_uid42_i_mul24_maxpool2d_maxpool2d14_shift_x_in(30 downto 0);

    -- leftShiftStage0Idx1_uid43_i_mul24_maxpool2d_maxpool2d14_shift_x(BITJOIN,42)@1
    leftShiftStage0Idx1_uid43_i_mul24_maxpool2d_maxpool2d14_shift_x_q <= leftShiftStage0Idx1Rng1_uid42_i_mul24_maxpool2d_maxpool2d14_shift_x_b & GND_q;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- leftShiftStage0_uid45_i_mul24_maxpool2d_maxpool2d14_shift_x(MUX,44)@1
    leftShiftStage0_uid45_i_mul24_maxpool2d_maxpool2d14_shift_x_s <= VCC_q;
    leftShiftStage0_uid45_i_mul24_maxpool2d_maxpool2d14_shift_x_combproc: PROCESS (leftShiftStage0_uid45_i_mul24_maxpool2d_maxpool2d14_shift_x_s, bubble_select_maxpool2d_B1_merge_reg_aunroll_x_e, leftShiftStage0Idx1_uid43_i_mul24_maxpool2d_maxpool2d14_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid45_i_mul24_maxpool2d_maxpool2d14_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid45_i_mul24_maxpool2d_maxpool2d14_shift_x_q <= bubble_select_maxpool2d_B1_merge_reg_aunroll_x_e;
            WHEN "1" => leftShiftStage0_uid45_i_mul24_maxpool2d_maxpool2d14_shift_x_q <= leftShiftStage0Idx1_uid43_i_mul24_maxpool2d_maxpool2d14_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid45_i_mul24_maxpool2d_maxpool2d14_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_mul24_maxpool2d_vt_select_31(BITSELECT,21)@1
    i_mul24_maxpool2d_vt_select_31_b <= leftShiftStage0_uid45_i_mul24_maxpool2d_maxpool2d14_shift_x_q(31 downto 1);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_mul24_maxpool2d_vt_join(BITJOIN,20)@1
    i_mul24_maxpool2d_vt_join_q <= i_mul24_maxpool2d_vt_select_31_b & GND_q;

    -- leftShiftStage0Idx1Rng1_uid33_i_mul22_maxpool2d_maxpool2d13_shift_x(BITSELECT,32)@1
    leftShiftStage0Idx1Rng1_uid33_i_mul22_maxpool2d_maxpool2d13_shift_x_in <= bubble_select_maxpool2d_B1_merge_reg_aunroll_x_c(30 downto 0);
    leftShiftStage0Idx1Rng1_uid33_i_mul22_maxpool2d_maxpool2d13_shift_x_b <= leftShiftStage0Idx1Rng1_uid33_i_mul22_maxpool2d_maxpool2d13_shift_x_in(30 downto 0);

    -- leftShiftStage0Idx1_uid34_i_mul22_maxpool2d_maxpool2d13_shift_x(BITJOIN,33)@1
    leftShiftStage0Idx1_uid34_i_mul22_maxpool2d_maxpool2d13_shift_x_q <= leftShiftStage0Idx1Rng1_uid33_i_mul22_maxpool2d_maxpool2d13_shift_x_b & GND_q;

    -- leftShiftStage0_uid36_i_mul22_maxpool2d_maxpool2d13_shift_x(MUX,35)@1
    leftShiftStage0_uid36_i_mul22_maxpool2d_maxpool2d13_shift_x_s <= VCC_q;
    leftShiftStage0_uid36_i_mul22_maxpool2d_maxpool2d13_shift_x_combproc: PROCESS (leftShiftStage0_uid36_i_mul22_maxpool2d_maxpool2d13_shift_x_s, bubble_select_maxpool2d_B1_merge_reg_aunroll_x_c, leftShiftStage0Idx1_uid34_i_mul22_maxpool2d_maxpool2d13_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid36_i_mul22_maxpool2d_maxpool2d13_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid36_i_mul22_maxpool2d_maxpool2d13_shift_x_q <= bubble_select_maxpool2d_B1_merge_reg_aunroll_x_c;
            WHEN "1" => leftShiftStage0_uid36_i_mul22_maxpool2d_maxpool2d13_shift_x_q <= leftShiftStage0Idx1_uid34_i_mul22_maxpool2d_maxpool2d13_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid36_i_mul22_maxpool2d_maxpool2d13_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_mul22_maxpool2d_vt_select_31(BITSELECT,18)@1
    i_mul22_maxpool2d_vt_select_31_b <= leftShiftStage0_uid36_i_mul22_maxpool2d_maxpool2d13_shift_x_q(31 downto 1);

    -- i_mul22_maxpool2d_vt_join(BITJOIN,17)@1
    i_mul22_maxpool2d_vt_join_q <= i_mul22_maxpool2d_vt_select_31_b & GND_q;

    -- bubble_join_maxpool2d_B1_merge_reg_aunroll_x(BITJOIN,47)
    bubble_join_maxpool2d_B1_merge_reg_aunroll_x_q <= maxpool2d_B1_merge_reg_aunroll_x_out_data_out_4 & maxpool2d_B1_merge_reg_aunroll_x_out_data_out_3 & maxpool2d_B1_merge_reg_aunroll_x_out_data_out_2 & maxpool2d_B1_merge_reg_aunroll_x_out_data_out_1 & maxpool2d_B1_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_maxpool2d_B1_merge_reg_aunroll_x(BITSELECT,48)
    bubble_select_maxpool2d_B1_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B1_merge_reg_aunroll_x_q(63 downto 0));
    bubble_select_maxpool2d_B1_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B1_merge_reg_aunroll_x_q(95 downto 64));
    bubble_select_maxpool2d_B1_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B1_merge_reg_aunroll_x_q(159 downto 96));
    bubble_select_maxpool2d_B1_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B1_merge_reg_aunroll_x_q(191 downto 160));
    bubble_select_maxpool2d_B1_merge_reg_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B1_merge_reg_aunroll_x_q(255 downto 192));

    -- dupName_0_sync_out_x(GPOUT,3)@1
    out_c0_exe12 <= bubble_select_maxpool2d_B1_merge_reg_aunroll_x_f;
    out_i_010 <= bubble_select_maxpool2d_B1_merge_reg_aunroll_x_c;
    out_j_16 <= bubble_select_maxpool2d_B1_merge_reg_aunroll_x_e;
    out_mul22 <= i_mul22_maxpool2d_vt_join_q;
    out_mul24 <= i_mul24_maxpool2d_vt_join_q;
    out_output_im_addr_011 <= bubble_select_maxpool2d_B1_merge_reg_aunroll_x_b;
    out_output_im_addr_17 <= bubble_select_maxpool2d_B1_merge_reg_aunroll_x_d;
    out_valid_out <= SE_out_maxpool2d_B1_merge_reg_aunroll_x_V0;

    -- sync_out(GPOUT,27)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
