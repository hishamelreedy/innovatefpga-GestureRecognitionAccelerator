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

-- VHDL created from conv2d1x1_B4_merge
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

entity conv2d1x1_B4_merge is
    port (
        in_c1_exit3312_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit3312_0_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit3312_0_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit3312_0_3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit3312_0_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit3312_0_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit3312_0_6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit3312_0_7 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exit3312_0_8 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exit3312_0_9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit3312_0_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exit14_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exit14_0_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c2_exit14_0_2 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c2_exit14_0_3 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_exe13_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe13413_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe315_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_i_0114_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_178_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im_addr_0106_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_1610_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x16_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit3312_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit3312_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit3312_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit3312_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit3312_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit3312_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit3312_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit3312_7 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exit3312_8 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exit3312_9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit3312_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exit14_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exit14_1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c2_exit14_2 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c2_exit14_3 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c0_exe13 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe13413 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exe315 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_i_0114 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_178 : out std_logic_vector(31 downto 0);  -- ufix32
        out_output_im_addr_0106 : out std_logic_vector(63 downto 0);  -- ufix64
        out_output_im_addr_1610 : out std_logic_vector(63 downto 0);  -- ufix64
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x16 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end conv2d1x1_B4_merge;

architecture normal of conv2d1x1_B4_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_c1_exit3312_0(GPOUT,27)
    out_c1_exit3312_0 <= in_c1_exit3312_0_0;

    -- out_c1_exit3312_1(GPOUT,28)
    out_c1_exit3312_1 <= in_c1_exit3312_0_1;

    -- out_c1_exit3312_2(GPOUT,29)
    out_c1_exit3312_2 <= in_c1_exit3312_0_2;

    -- out_c1_exit3312_3(GPOUT,30)
    out_c1_exit3312_3 <= in_c1_exit3312_0_3;

    -- out_c1_exit3312_4(GPOUT,31)
    out_c1_exit3312_4 <= in_c1_exit3312_0_4;

    -- out_c1_exit3312_5(GPOUT,32)
    out_c1_exit3312_5 <= in_c1_exit3312_0_5;

    -- out_c1_exit3312_6(GPOUT,33)
    out_c1_exit3312_6 <= in_c1_exit3312_0_6;

    -- out_c1_exit3312_7(GPOUT,34)
    out_c1_exit3312_7 <= in_c1_exit3312_0_7;

    -- out_c1_exit3312_8(GPOUT,35)
    out_c1_exit3312_8 <= in_c1_exit3312_0_8;

    -- out_c1_exit3312_9(GPOUT,36)
    out_c1_exit3312_9 <= in_c1_exit3312_0_9;

    -- out_c1_exit3312_10(GPOUT,37)
    out_c1_exit3312_10 <= in_c1_exit3312_0_10;

    -- out_c2_exit14_0(GPOUT,38)
    out_c2_exit14_0 <= in_c2_exit14_0_0;

    -- out_c2_exit14_1(GPOUT,39)
    out_c2_exit14_1 <= in_c2_exit14_0_1;

    -- out_c2_exit14_2(GPOUT,40)
    out_c2_exit14_2 <= in_c2_exit14_0_2;

    -- out_c2_exit14_3(GPOUT,41)
    out_c2_exit14_3 <= in_c2_exit14_0_3;

    -- out_c0_exe13(GPOUT,42)
    out_c0_exe13 <= in_c0_exe13_0;

    -- out_c1_exe13413(GPOUT,43)
    out_c1_exe13413 <= in_c1_exe13413_0;

    -- out_c2_exe315(GPOUT,44)
    out_c2_exe315 <= in_c2_exe315_0;

    -- out_i_0114(GPOUT,45)
    out_i_0114 <= in_i_0114_0;

    -- out_j_178(GPOUT,46)
    out_j_178 <= in_j_178_0;

    -- out_output_im_addr_0106(GPOUT,47)
    out_output_im_addr_0106 <= in_output_im_addr_0106_0;

    -- out_output_im_addr_1610(GPOUT,48)
    out_output_im_addr_1610 <= in_output_im_addr_1610_0;

    -- stall_out(LOGICAL,52)
    stall_out_q <= in_valid_in_0 and in_stall_in;

    -- out_stall_out_0(GPOUT,49)
    out_stall_out_0 <= stall_out_q;

    -- out_unnamed_conv2d1x16(GPOUT,50)
    out_unnamed_conv2d1x16 <= in_unnamed_conv2d1x16_0;

    -- out_valid_out(GPOUT,51)
    out_valid_out <= in_valid_in_0;

END normal;
