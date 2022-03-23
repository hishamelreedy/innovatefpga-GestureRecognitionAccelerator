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

-- VHDL created from bb_conv2d1x1_B1_stall_region
-- VHDL created on Sat Mar 12 13:30:06 2022


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

entity bb_conv2d1x1_B1_stall_region is
    port (
        in_c0_exe12 : in std_logic_vector(63 downto 0);  -- ufix64
        in_i_011 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_17 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im_addr_010 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_16 : in std_logic_vector(63 downto 0);  -- ufix64
        in_unnamed_conv2d1x11 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe12 : out std_logic_vector(63 downto 0);  -- ufix64
        out_i_011 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_17 : out std_logic_vector(31 downto 0);  -- ufix32
        out_output_im_addr_010 : out std_logic_vector(63 downto 0);  -- ufix64
        out_output_im_addr_16 : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_conv2d1x11 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_conv2d1x1_B1_stall_region;

architecture normal of bb_conv2d1x1_B1_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component conv2d1x1_B1_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B1_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B1_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_conv2d1x1_B1_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (287 downto 0);
    signal bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_f : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (287 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_conv2d1x1_B1_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B1_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B1_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_stall_entry(STALLENABLE,22)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= conv2d1x1_B1_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,17)
    bubble_join_stall_entry_q <= in_unnamed_conv2d1x11 & in_output_im_addr_16 & in_output_im_addr_010 & in_j_17 & in_i_011 & in_c0_exe12;

    -- bubble_select_stall_entry(BITSELECT,18)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(95 downto 64));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(127 downto 96));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(191 downto 128));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(255 downto 192));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(287 downto 256));

    -- conv2d1x1_B1_merge_reg_aunroll_x(BLACKBOX,2)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_data_out_2@1
    -- out out_data_out_3@1
    -- out out_data_out_4@1
    -- out out_data_out_5@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    theconv2d1x1_B1_merge_reg_aunroll_x : conv2d1x1_B1_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_c,
        in_data_in_1 => bubble_select_stall_entry_e,
        in_data_in_2 => bubble_select_stall_entry_d,
        in_data_in_3 => bubble_select_stall_entry_f,
        in_data_in_4 => bubble_select_stall_entry_b,
        in_data_in_5 => bubble_select_stall_entry_g,
        in_stall_in => SE_out_conv2d1x1_B1_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_3,
        out_data_out_4 => conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_4,
        out_data_out_5 => conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_5,
        out_stall_out => conv2d1x1_B1_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => conv2d1x1_B1_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_conv2d1x1_B1_merge_reg_aunroll_x(STALLENABLE,21)
    -- Valid signal propagation
    SE_out_conv2d1x1_B1_merge_reg_aunroll_x_V0 <= SE_out_conv2d1x1_B1_merge_reg_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_conv2d1x1_B1_merge_reg_aunroll_x_backStall <= in_stall_in or not (SE_out_conv2d1x1_B1_merge_reg_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_conv2d1x1_B1_merge_reg_aunroll_x_wireValid <= conv2d1x1_B1_merge_reg_aunroll_x_out_valid_out;

    -- bubble_join_conv2d1x1_B1_merge_reg_aunroll_x(BITJOIN,14)
    bubble_join_conv2d1x1_B1_merge_reg_aunroll_x_q <= conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_5 & conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_4 & conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_3 & conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_2 & conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_1 & conv2d1x1_B1_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_conv2d1x1_B1_merge_reg_aunroll_x(BITSELECT,15)
    bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B1_merge_reg_aunroll_x_q(31 downto 0));
    bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B1_merge_reg_aunroll_x_q(95 downto 32));
    bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B1_merge_reg_aunroll_x_q(127 downto 96));
    bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B1_merge_reg_aunroll_x_q(191 downto 128));
    bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B1_merge_reg_aunroll_x_q(255 downto 192));
    bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B1_merge_reg_aunroll_x_q(287 downto 256));

    -- dupName_0_sync_out_x(GPOUT,4)@1
    out_c0_exe12 <= bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_f;
    out_i_011 <= bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_b;
    out_j_17 <= bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_d;
    out_output_im_addr_010 <= bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_c;
    out_output_im_addr_16 <= bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_e;
    out_unnamed_conv2d1x11 <= bubble_select_conv2d1x1_B1_merge_reg_aunroll_x_g;
    out_valid_out <= SE_out_conv2d1x1_B1_merge_reg_aunroll_x_V0;

    -- sync_out(GPOUT,12)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
