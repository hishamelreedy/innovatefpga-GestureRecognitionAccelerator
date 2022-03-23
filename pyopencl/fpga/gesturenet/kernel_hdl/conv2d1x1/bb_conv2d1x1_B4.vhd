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

-- VHDL created from bb_conv2d1x1_B4
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

entity bb_conv2d1x1_B4 is
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
        in_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_0114_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size_x : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_size_y : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_178_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im_addr_0106_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_1610_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x16_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d1x17_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x17_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x17_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x17_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe13 : out std_logic_vector(63 downto 0);  -- ufix64
        out_i_011_LC_OuterPHI : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_17_LC_InnerPHI : out std_logic_vector(31 downto 0);  -- ufix32
        out_lsu_unnamed_conv2d1x17_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        out_output_im_addr_010_LC_OuterPHI : out std_logic_vector(63 downto 0);  -- ufix64
        out_output_im_addr_16_LC_InnerPHI : out std_logic_vector(63 downto 0);  -- ufix64
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x16 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_unnamed_conv2d1x17_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_conv2d1x17_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_conv2d1x17_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x17_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x17_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x17_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x17_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_conv2d1x1_B4;

architecture normal of bb_conv2d1x1_B4 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component conv2d1x1_B4_merge is
        port (
            in_c1_exit3312_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit3312_0_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit3312_0_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit3312_0_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit3312_0_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit3312_0_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit3312_0_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit3312_0_7 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exit3312_0_8 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exit3312_0_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit3312_0_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exit14_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exit14_0_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c2_exit14_0_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c2_exit14_0_3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_exe13_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe13413_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe315_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_0114_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_178_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im_addr_0106_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_1610_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x16_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit3312_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit3312_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit3312_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit3312_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit3312_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit3312_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit3312_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit3312_7 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exit3312_8 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exit3312_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit3312_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exit14_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exit14_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c2_exit14_2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c2_exit14_3 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c0_exe13 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe13413 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exe315 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_i_0114 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_178 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_output_im_addr_0106 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_output_im_addr_1610 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x16 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d1x1_B4_stall_region is
        port (
            in_c1_exit3312_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit3312_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit3312_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit3312_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit3312_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit3312_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit3312_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit3312_7 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exit3312_8 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exit3312_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit3312_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exit14_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exit14_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c2_exit14_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c2_exit14_3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_exe13 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe13413 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exe315 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_0114 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_size_x : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_size_y : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_178 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im_addr_0106 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_1610 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x16 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d1x17_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x17_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x17_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x17_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe13 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_for_end35_loopexit_loopexit_LC_COND : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_i_011_LC_OuterPHI : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_17_LC_InnerPHI : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_lsu_unnamed_conv2d1x17_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_output_im_addr_010_LC_OuterPHI : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_output_im_addr_16_LC_InnerPHI : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x16 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_unnamed_conv2d1x17_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component conv2d1x1_B4_branch is
        port (
            in_c0_exe13 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_for_end35_loopexit_loopexit_LC_COND : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_011_LC_OuterPHI : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_17_LC_InnerPHI : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im_addr_010_LC_OuterPHI : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_16_LC_InnerPHI : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x16 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe13 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_i_011_LC_OuterPHI : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_17_LC_InnerPHI : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_output_im_addr_010_LC_OuterPHI : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_output_im_addr_16_LC_InnerPHI : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x16 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_7 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_8 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B4_merge_aunroll_x_out_c2_exit14_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B4_merge_aunroll_x_out_c2_exit14_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B4_merge_aunroll_x_out_c2_exit14_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B4_merge_aunroll_x_out_c2_exit14_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B4_merge_aunroll_x_out_c0_exe13 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B4_merge_aunroll_x_out_c1_exe13413 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B4_merge_aunroll_x_out_c2_exe315 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B4_merge_aunroll_x_out_i_0114 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B4_merge_aunroll_x_out_j_178 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B4_merge_aunroll_x_out_output_im_addr_0106 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B4_merge_aunroll_x_out_output_im_addr_1610 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B4_merge_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B4_merge_aunroll_x_out_unnamed_conv2d1x16 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B4_merge_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_stall_region_out_c0_exe13 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B4_stall_region_out_for_end35_loopexit_loopexit_LC_COND : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_stall_region_out_i_011_LC_OuterPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B4_stall_region_out_j_17_LC_InnerPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B4_stall_region_out_lsu_unnamed_conv2d1x17_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_stall_region_out_output_im_addr_010_LC_OuterPHI : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B4_stall_region_out_output_im_addr_16_LC_InnerPHI : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B4_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_stall_region_out_unnamed_conv2d1x16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B4_stall_region_out_unnamed_conv2d1x17_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_conv2d1x1_B4_stall_region_out_unnamed_conv2d1x17_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d1x1_B4_stall_region_out_unnamed_conv2d1x17_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B4_stall_region_out_unnamed_conv2d1x17_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_stall_region_out_unnamed_conv2d1x17_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_stall_region_out_unnamed_conv2d1x17_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_stall_region_out_unnamed_conv2d1x17_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d1x1_B4_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B4_branch_out_c0_exe13 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B4_branch_out_i_011_LC_OuterPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B4_branch_out_j_17_LC_InnerPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B4_branch_out_output_im_addr_010_LC_OuterPHI : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B4_branch_out_output_im_addr_16_LC_InnerPHI : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B4_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B4_branch_out_unnamed_conv2d1x16 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B4_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B4_branch_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- conv2d1x1_B4_merge_aunroll_x(BLACKBOX,2)
    theconv2d1x1_B4_merge_aunroll_x : conv2d1x1_B4_merge
    PORT MAP (
        in_c1_exit3312_0_0 => in_c1_exit3312_0_0,
        in_c1_exit3312_0_1 => in_c1_exit3312_0_1,
        in_c1_exit3312_0_2 => in_c1_exit3312_0_2,
        in_c1_exit3312_0_3 => in_c1_exit3312_0_3,
        in_c1_exit3312_0_4 => in_c1_exit3312_0_4,
        in_c1_exit3312_0_5 => in_c1_exit3312_0_5,
        in_c1_exit3312_0_6 => in_c1_exit3312_0_6,
        in_c1_exit3312_0_7 => in_c1_exit3312_0_7,
        in_c1_exit3312_0_8 => in_c1_exit3312_0_8,
        in_c1_exit3312_0_9 => in_c1_exit3312_0_9,
        in_c1_exit3312_0_10 => in_c1_exit3312_0_10,
        in_c2_exit14_0_0 => in_c2_exit14_0_0,
        in_c2_exit14_0_1 => in_c2_exit14_0_1,
        in_c2_exit14_0_2 => in_c2_exit14_0_2,
        in_c2_exit14_0_3 => in_c2_exit14_0_3,
        in_c0_exe13_0 => in_c0_exe13_0,
        in_c1_exe13413_0 => in_c1_exe13413_0,
        in_c2_exe315_0 => in_c2_exe315_0,
        in_i_0114_0 => in_i_0114_0,
        in_j_178_0 => in_j_178_0,
        in_output_im_addr_0106_0 => in_output_im_addr_0106_0,
        in_output_im_addr_1610_0 => in_output_im_addr_1610_0,
        in_stall_in => bb_conv2d1x1_B4_stall_region_out_stall_out,
        in_unnamed_conv2d1x16_0 => in_unnamed_conv2d1x16_0,
        in_valid_in_0 => in_valid_in_0,
        out_c1_exit3312_0 => conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_0,
        out_c1_exit3312_1 => conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_1,
        out_c1_exit3312_2 => conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_2,
        out_c1_exit3312_3 => conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_3,
        out_c1_exit3312_4 => conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_4,
        out_c1_exit3312_5 => conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_5,
        out_c1_exit3312_6 => conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_6,
        out_c1_exit3312_7 => conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_7,
        out_c1_exit3312_8 => conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_8,
        out_c1_exit3312_9 => conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_9,
        out_c1_exit3312_10 => conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_10,
        out_c2_exit14_0 => conv2d1x1_B4_merge_aunroll_x_out_c2_exit14_0,
        out_c2_exit14_1 => conv2d1x1_B4_merge_aunroll_x_out_c2_exit14_1,
        out_c2_exit14_2 => conv2d1x1_B4_merge_aunroll_x_out_c2_exit14_2,
        out_c2_exit14_3 => conv2d1x1_B4_merge_aunroll_x_out_c2_exit14_3,
        out_c0_exe13 => conv2d1x1_B4_merge_aunroll_x_out_c0_exe13,
        out_c1_exe13413 => conv2d1x1_B4_merge_aunroll_x_out_c1_exe13413,
        out_c2_exe315 => conv2d1x1_B4_merge_aunroll_x_out_c2_exe315,
        out_i_0114 => conv2d1x1_B4_merge_aunroll_x_out_i_0114,
        out_j_178 => conv2d1x1_B4_merge_aunroll_x_out_j_178,
        out_output_im_addr_0106 => conv2d1x1_B4_merge_aunroll_x_out_output_im_addr_0106,
        out_output_im_addr_1610 => conv2d1x1_B4_merge_aunroll_x_out_output_im_addr_1610,
        out_stall_out_0 => conv2d1x1_B4_merge_aunroll_x_out_stall_out_0,
        out_unnamed_conv2d1x16 => conv2d1x1_B4_merge_aunroll_x_out_unnamed_conv2d1x16,
        out_valid_out => conv2d1x1_B4_merge_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d1x1_B4_stall_region(BLACKBOX,39)
    thebb_conv2d1x1_B4_stall_region : bb_conv2d1x1_B4_stall_region
    PORT MAP (
        in_c1_exit3312_0 => conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_0,
        in_c1_exit3312_1 => conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_1,
        in_c1_exit3312_2 => conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_2,
        in_c1_exit3312_3 => conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_3,
        in_c1_exit3312_4 => conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_4,
        in_c1_exit3312_5 => conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_5,
        in_c1_exit3312_6 => conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_6,
        in_c1_exit3312_7 => conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_7,
        in_c1_exit3312_8 => conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_8,
        in_c1_exit3312_9 => conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_9,
        in_c1_exit3312_10 => conv2d1x1_B4_merge_aunroll_x_out_c1_exit3312_10,
        in_c2_exit14_0 => conv2d1x1_B4_merge_aunroll_x_out_c2_exit14_0,
        in_c2_exit14_1 => conv2d1x1_B4_merge_aunroll_x_out_c2_exit14_1,
        in_c2_exit14_2 => conv2d1x1_B4_merge_aunroll_x_out_c2_exit14_2,
        in_c2_exit14_3 => conv2d1x1_B4_merge_aunroll_x_out_c2_exit14_3,
        in_c0_exe13 => conv2d1x1_B4_merge_aunroll_x_out_c0_exe13,
        in_c1_exe13413 => conv2d1x1_B4_merge_aunroll_x_out_c1_exe13413,
        in_c2_exe315 => conv2d1x1_B4_merge_aunroll_x_out_c2_exe315,
        in_flush => in_flush,
        in_i_0114 => conv2d1x1_B4_merge_aunroll_x_out_i_0114,
        in_input_channels => in_input_channels,
        in_input_size_x => in_input_size_x,
        in_input_size_y => in_input_size_y,
        in_j_178 => conv2d1x1_B4_merge_aunroll_x_out_j_178,
        in_output_im_addr_0106 => conv2d1x1_B4_merge_aunroll_x_out_output_im_addr_0106,
        in_output_im_addr_1610 => conv2d1x1_B4_merge_aunroll_x_out_output_im_addr_1610,
        in_stall_in => conv2d1x1_B4_branch_out_stall_out,
        in_unnamed_conv2d1x16 => conv2d1x1_B4_merge_aunroll_x_out_unnamed_conv2d1x16,
        in_unnamed_conv2d1x17_avm_readdata => in_unnamed_conv2d1x17_avm_readdata,
        in_unnamed_conv2d1x17_avm_readdatavalid => in_unnamed_conv2d1x17_avm_readdatavalid,
        in_unnamed_conv2d1x17_avm_waitrequest => in_unnamed_conv2d1x17_avm_waitrequest,
        in_unnamed_conv2d1x17_avm_writeack => in_unnamed_conv2d1x17_avm_writeack,
        in_valid_in => conv2d1x1_B4_merge_aunroll_x_out_valid_out,
        out_c0_exe13 => bb_conv2d1x1_B4_stall_region_out_c0_exe13,
        out_for_end35_loopexit_loopexit_LC_COND => bb_conv2d1x1_B4_stall_region_out_for_end35_loopexit_loopexit_LC_COND,
        out_i_011_LC_OuterPHI => bb_conv2d1x1_B4_stall_region_out_i_011_LC_OuterPHI,
        out_j_17_LC_InnerPHI => bb_conv2d1x1_B4_stall_region_out_j_17_LC_InnerPHI,
        out_lsu_unnamed_conv2d1x17_o_active => bb_conv2d1x1_B4_stall_region_out_lsu_unnamed_conv2d1x17_o_active,
        out_output_im_addr_010_LC_OuterPHI => bb_conv2d1x1_B4_stall_region_out_output_im_addr_010_LC_OuterPHI,
        out_output_im_addr_16_LC_InnerPHI => bb_conv2d1x1_B4_stall_region_out_output_im_addr_16_LC_InnerPHI,
        out_stall_out => bb_conv2d1x1_B4_stall_region_out_stall_out,
        out_unnamed_conv2d1x16 => bb_conv2d1x1_B4_stall_region_out_unnamed_conv2d1x16,
        out_unnamed_conv2d1x17_avm_address => bb_conv2d1x1_B4_stall_region_out_unnamed_conv2d1x17_avm_address,
        out_unnamed_conv2d1x17_avm_burstcount => bb_conv2d1x1_B4_stall_region_out_unnamed_conv2d1x17_avm_burstcount,
        out_unnamed_conv2d1x17_avm_byteenable => bb_conv2d1x1_B4_stall_region_out_unnamed_conv2d1x17_avm_byteenable,
        out_unnamed_conv2d1x17_avm_enable => bb_conv2d1x1_B4_stall_region_out_unnamed_conv2d1x17_avm_enable,
        out_unnamed_conv2d1x17_avm_read => bb_conv2d1x1_B4_stall_region_out_unnamed_conv2d1x17_avm_read,
        out_unnamed_conv2d1x17_avm_write => bb_conv2d1x1_B4_stall_region_out_unnamed_conv2d1x17_avm_write,
        out_unnamed_conv2d1x17_avm_writedata => bb_conv2d1x1_B4_stall_region_out_unnamed_conv2d1x17_avm_writedata,
        out_valid_out => bb_conv2d1x1_B4_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- conv2d1x1_B4_branch(BLACKBOX,40)
    theconv2d1x1_B4_branch : conv2d1x1_B4_branch
    PORT MAP (
        in_c0_exe13 => bb_conv2d1x1_B4_stall_region_out_c0_exe13,
        in_for_end35_loopexit_loopexit_LC_COND => bb_conv2d1x1_B4_stall_region_out_for_end35_loopexit_loopexit_LC_COND,
        in_i_011_LC_OuterPHI => bb_conv2d1x1_B4_stall_region_out_i_011_LC_OuterPHI,
        in_j_17_LC_InnerPHI => bb_conv2d1x1_B4_stall_region_out_j_17_LC_InnerPHI,
        in_output_im_addr_010_LC_OuterPHI => bb_conv2d1x1_B4_stall_region_out_output_im_addr_010_LC_OuterPHI,
        in_output_im_addr_16_LC_InnerPHI => bb_conv2d1x1_B4_stall_region_out_output_im_addr_16_LC_InnerPHI,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_unnamed_conv2d1x16 => bb_conv2d1x1_B4_stall_region_out_unnamed_conv2d1x16,
        in_valid_in => bb_conv2d1x1_B4_stall_region_out_valid_out,
        out_c0_exe13 => conv2d1x1_B4_branch_out_c0_exe13,
        out_i_011_LC_OuterPHI => conv2d1x1_B4_branch_out_i_011_LC_OuterPHI,
        out_j_17_LC_InnerPHI => conv2d1x1_B4_branch_out_j_17_LC_InnerPHI,
        out_output_im_addr_010_LC_OuterPHI => conv2d1x1_B4_branch_out_output_im_addr_010_LC_OuterPHI,
        out_output_im_addr_16_LC_InnerPHI => conv2d1x1_B4_branch_out_output_im_addr_16_LC_InnerPHI,
        out_stall_out => conv2d1x1_B4_branch_out_stall_out,
        out_unnamed_conv2d1x16 => conv2d1x1_B4_branch_out_unnamed_conv2d1x16,
        out_valid_out_0 => conv2d1x1_B4_branch_out_valid_out_0,
        out_valid_out_1 => conv2d1x1_B4_branch_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exe13(GPOUT,41)
    out_c0_exe13 <= conv2d1x1_B4_branch_out_c0_exe13;

    -- out_i_011_LC_OuterPHI(GPOUT,42)
    out_i_011_LC_OuterPHI <= conv2d1x1_B4_branch_out_i_011_LC_OuterPHI;

    -- out_j_17_LC_InnerPHI(GPOUT,43)
    out_j_17_LC_InnerPHI <= conv2d1x1_B4_branch_out_j_17_LC_InnerPHI;

    -- out_lsu_unnamed_conv2d1x17_o_active(GPOUT,44)
    out_lsu_unnamed_conv2d1x17_o_active <= bb_conv2d1x1_B4_stall_region_out_lsu_unnamed_conv2d1x17_o_active;

    -- out_output_im_addr_010_LC_OuterPHI(GPOUT,45)
    out_output_im_addr_010_LC_OuterPHI <= conv2d1x1_B4_branch_out_output_im_addr_010_LC_OuterPHI;

    -- out_output_im_addr_16_LC_InnerPHI(GPOUT,46)
    out_output_im_addr_16_LC_InnerPHI <= conv2d1x1_B4_branch_out_output_im_addr_16_LC_InnerPHI;

    -- out_stall_out_0(GPOUT,47)
    out_stall_out_0 <= conv2d1x1_B4_merge_aunroll_x_out_stall_out_0;

    -- out_unnamed_conv2d1x16(GPOUT,48)
    out_unnamed_conv2d1x16 <= conv2d1x1_B4_branch_out_unnamed_conv2d1x16;

    -- out_unnamed_conv2d1x17_avm_address(GPOUT,49)
    out_unnamed_conv2d1x17_avm_address <= bb_conv2d1x1_B4_stall_region_out_unnamed_conv2d1x17_avm_address;

    -- out_unnamed_conv2d1x17_avm_burstcount(GPOUT,50)
    out_unnamed_conv2d1x17_avm_burstcount <= bb_conv2d1x1_B4_stall_region_out_unnamed_conv2d1x17_avm_burstcount;

    -- out_unnamed_conv2d1x17_avm_byteenable(GPOUT,51)
    out_unnamed_conv2d1x17_avm_byteenable <= bb_conv2d1x1_B4_stall_region_out_unnamed_conv2d1x17_avm_byteenable;

    -- out_unnamed_conv2d1x17_avm_enable(GPOUT,52)
    out_unnamed_conv2d1x17_avm_enable <= bb_conv2d1x1_B4_stall_region_out_unnamed_conv2d1x17_avm_enable;

    -- out_unnamed_conv2d1x17_avm_read(GPOUT,53)
    out_unnamed_conv2d1x17_avm_read <= bb_conv2d1x1_B4_stall_region_out_unnamed_conv2d1x17_avm_read;

    -- out_unnamed_conv2d1x17_avm_write(GPOUT,54)
    out_unnamed_conv2d1x17_avm_write <= bb_conv2d1x1_B4_stall_region_out_unnamed_conv2d1x17_avm_write;

    -- out_unnamed_conv2d1x17_avm_writedata(GPOUT,55)
    out_unnamed_conv2d1x17_avm_writedata <= bb_conv2d1x1_B4_stall_region_out_unnamed_conv2d1x17_avm_writedata;

    -- out_valid_out_0(GPOUT,56)
    out_valid_out_0 <= conv2d1x1_B4_branch_out_valid_out_0;

    -- out_valid_out_1(GPOUT,57)
    out_valid_out_1 <= conv2d1x1_B4_branch_out_valid_out_1;

END normal;
