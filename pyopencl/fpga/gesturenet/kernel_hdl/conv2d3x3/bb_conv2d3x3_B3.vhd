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

-- VHDL created from bb_conv2d3x3_B3
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

entity bb_conv2d3x3_B3 is
    port (
        in_c0_exit22320_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit22320_0_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit22320_0_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit22320_0_3 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exit22320_0_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit22320_0_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit22320_0_6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit22320_0_7 : in std_logic_vector(2 downto 0);  -- ufix3
        in_c0_exit22320_0_8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit22320_0_9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit22320_0_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe13_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe123021_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_0234_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_1158_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im_addr_0226_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_11410_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_pad : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stride : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_conv2d3x33_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d3x35_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d3x35_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x35_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x35_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe13 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe3256 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe4257 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe5258 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe6259 : out std_logic_vector(63 downto 0);  -- ufix64
        out_lsu_unnamed_conv2d3x35_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x33 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_unnamed_conv2d3x35_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_conv2d3x35_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_conv2d3x35_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d3x35_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x35_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x35_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x35_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_conv2d3x3_B3;

architecture normal of bb_conv2d3x3_B3 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component conv2d3x3_B3_merge is
        port (
            in_c0_exit22320_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit22320_0_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit22320_0_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit22320_0_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit22320_0_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit22320_0_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit22320_0_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit22320_0_7 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_c0_exit22320_0_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit22320_0_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit22320_0_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe13_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe123021_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_0234_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_1158_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im_addr_0226_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_11410_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x33_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit22320_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit22320_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit22320_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit22320_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit22320_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit22320_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit22320_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit22320_7 : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_c0_exit22320_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit22320_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit22320_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe13 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe123021 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_i_0234 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_1158 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_output_im_addr_0226 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_output_im_addr_11410 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x33 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d3x3_B3_stall_region is
        port (
            in_c0_exit22320_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit22320_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit22320_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit22320_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit22320_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit22320_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit22320_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit22320_7 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_c0_exit22320_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit22320_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit22320_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe13 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe123021 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_0234 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_1158 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im_addr_0226 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_11410 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x33 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d3x35_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x35_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x35_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x35_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe13 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe3256 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe4257 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe5258 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe6259 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe7260 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_conv2d3x35_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x33 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_unnamed_conv2d3x35_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x35_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x35_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x35_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x35_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x35_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x35_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component conv2d3x3_B3_branch is
        port (
            in_c0_exe13 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe3256 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe4257 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe5258 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe6259 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe7260 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x33 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe13 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe3256 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe4257 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe5258 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe6259 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x33 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_7 : STD_LOGIC_VECTOR (2 downto 0);
    signal conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B3_merge_aunroll_x_out_c0_exe13 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B3_merge_aunroll_x_out_c1_exe123021 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B3_merge_aunroll_x_out_i_0234 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B3_merge_aunroll_x_out_j_1158 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B3_merge_aunroll_x_out_output_im_addr_0226 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B3_merge_aunroll_x_out_output_im_addr_11410 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B3_merge_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B3_merge_aunroll_x_out_unnamed_conv2d3x33 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B3_merge_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_c0_exe13 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_c0_exe3256 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_c0_exe4257 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_c0_exe5258 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_c0_exe6259 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_c0_exe7260 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_lsu_unnamed_conv2d3x35_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x33 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x35_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x35_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x35_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x35_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x35_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x35_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x35_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d3x3_B3_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B3_branch_out_c0_exe13 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B3_branch_out_c0_exe3256 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B3_branch_out_c0_exe4257 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B3_branch_out_c0_exe5258 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B3_branch_out_c0_exe6259 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B3_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B3_branch_out_unnamed_conv2d3x33 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B3_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B3_branch_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- conv2d3x3_B3_merge_aunroll_x(BLACKBOX,2)
    theconv2d3x3_B3_merge_aunroll_x : conv2d3x3_B3_merge
    PORT MAP (
        in_c0_exit22320_0_0 => in_c0_exit22320_0_0,
        in_c0_exit22320_0_1 => in_c0_exit22320_0_1,
        in_c0_exit22320_0_2 => in_c0_exit22320_0_2,
        in_c0_exit22320_0_3 => in_c0_exit22320_0_3,
        in_c0_exit22320_0_4 => in_c0_exit22320_0_4,
        in_c0_exit22320_0_5 => in_c0_exit22320_0_5,
        in_c0_exit22320_0_6 => in_c0_exit22320_0_6,
        in_c0_exit22320_0_7 => in_c0_exit22320_0_7,
        in_c0_exit22320_0_8 => in_c0_exit22320_0_8,
        in_c0_exit22320_0_9 => in_c0_exit22320_0_9,
        in_c0_exit22320_0_10 => in_c0_exit22320_0_10,
        in_c0_exe13_0 => in_c0_exe13_0,
        in_c1_exe123021_0 => in_c1_exe123021_0,
        in_i_0234_0 => in_i_0234_0,
        in_j_1158_0 => in_j_1158_0,
        in_output_im_addr_0226_0 => in_output_im_addr_0226_0,
        in_output_im_addr_11410_0 => in_output_im_addr_11410_0,
        in_stall_in => bb_conv2d3x3_B3_stall_region_out_stall_out,
        in_unnamed_conv2d3x33_0 => in_unnamed_conv2d3x33_0,
        in_valid_in_0 => in_valid_in_0,
        out_c0_exit22320_0 => conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_0,
        out_c0_exit22320_1 => conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_1,
        out_c0_exit22320_2 => conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_2,
        out_c0_exit22320_3 => conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_3,
        out_c0_exit22320_4 => conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_4,
        out_c0_exit22320_5 => conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_5,
        out_c0_exit22320_6 => conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_6,
        out_c0_exit22320_7 => conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_7,
        out_c0_exit22320_8 => conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_8,
        out_c0_exit22320_9 => conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_9,
        out_c0_exit22320_10 => conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_10,
        out_c0_exe13 => conv2d3x3_B3_merge_aunroll_x_out_c0_exe13,
        out_c1_exe123021 => conv2d3x3_B3_merge_aunroll_x_out_c1_exe123021,
        out_i_0234 => conv2d3x3_B3_merge_aunroll_x_out_i_0234,
        out_j_1158 => conv2d3x3_B3_merge_aunroll_x_out_j_1158,
        out_output_im_addr_0226 => conv2d3x3_B3_merge_aunroll_x_out_output_im_addr_0226,
        out_output_im_addr_11410 => conv2d3x3_B3_merge_aunroll_x_out_output_im_addr_11410,
        out_stall_out_0 => conv2d3x3_B3_merge_aunroll_x_out_stall_out_0,
        out_unnamed_conv2d3x33 => conv2d3x3_B3_merge_aunroll_x_out_unnamed_conv2d3x33,
        out_valid_out => conv2d3x3_B3_merge_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d3x3_B3_stall_region(BLACKBOX,36)
    thebb_conv2d3x3_B3_stall_region : bb_conv2d3x3_B3_stall_region
    PORT MAP (
        in_c0_exit22320_0 => conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_0,
        in_c0_exit22320_1 => conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_1,
        in_c0_exit22320_2 => conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_2,
        in_c0_exit22320_3 => conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_3,
        in_c0_exit22320_4 => conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_4,
        in_c0_exit22320_5 => conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_5,
        in_c0_exit22320_6 => conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_6,
        in_c0_exit22320_7 => conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_7,
        in_c0_exit22320_8 => conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_8,
        in_c0_exit22320_9 => conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_9,
        in_c0_exit22320_10 => conv2d3x3_B3_merge_aunroll_x_out_c0_exit22320_10,
        in_c0_exe13 => conv2d3x3_B3_merge_aunroll_x_out_c0_exe13,
        in_c1_exe123021 => conv2d3x3_B3_merge_aunroll_x_out_c1_exe123021,
        in_flush => in_flush,
        in_i_0234 => conv2d3x3_B3_merge_aunroll_x_out_i_0234,
        in_input_channels => in_input_channels,
        in_j_1158 => conv2d3x3_B3_merge_aunroll_x_out_j_1158,
        in_output_im_addr_0226 => conv2d3x3_B3_merge_aunroll_x_out_output_im_addr_0226,
        in_output_im_addr_11410 => conv2d3x3_B3_merge_aunroll_x_out_output_im_addr_11410,
        in_output_size => in_output_size,
        in_stall_in => conv2d3x3_B3_branch_out_stall_out,
        in_unnamed_conv2d3x33 => conv2d3x3_B3_merge_aunroll_x_out_unnamed_conv2d3x33,
        in_unnamed_conv2d3x35_avm_readdata => in_unnamed_conv2d3x35_avm_readdata,
        in_unnamed_conv2d3x35_avm_readdatavalid => in_unnamed_conv2d3x35_avm_readdatavalid,
        in_unnamed_conv2d3x35_avm_waitrequest => in_unnamed_conv2d3x35_avm_waitrequest,
        in_unnamed_conv2d3x35_avm_writeack => in_unnamed_conv2d3x35_avm_writeack,
        in_valid_in => conv2d3x3_B3_merge_aunroll_x_out_valid_out,
        out_c0_exe13 => bb_conv2d3x3_B3_stall_region_out_c0_exe13,
        out_c0_exe3256 => bb_conv2d3x3_B3_stall_region_out_c0_exe3256,
        out_c0_exe4257 => bb_conv2d3x3_B3_stall_region_out_c0_exe4257,
        out_c0_exe5258 => bb_conv2d3x3_B3_stall_region_out_c0_exe5258,
        out_c0_exe6259 => bb_conv2d3x3_B3_stall_region_out_c0_exe6259,
        out_c0_exe7260 => bb_conv2d3x3_B3_stall_region_out_c0_exe7260,
        out_lsu_unnamed_conv2d3x35_o_active => bb_conv2d3x3_B3_stall_region_out_lsu_unnamed_conv2d3x35_o_active,
        out_stall_out => bb_conv2d3x3_B3_stall_region_out_stall_out,
        out_unnamed_conv2d3x33 => bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x33,
        out_unnamed_conv2d3x35_avm_address => bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x35_avm_address,
        out_unnamed_conv2d3x35_avm_burstcount => bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x35_avm_burstcount,
        out_unnamed_conv2d3x35_avm_byteenable => bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x35_avm_byteenable,
        out_unnamed_conv2d3x35_avm_enable => bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x35_avm_enable,
        out_unnamed_conv2d3x35_avm_read => bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x35_avm_read,
        out_unnamed_conv2d3x35_avm_write => bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x35_avm_write,
        out_unnamed_conv2d3x35_avm_writedata => bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x35_avm_writedata,
        out_valid_out => bb_conv2d3x3_B3_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- conv2d3x3_B3_branch(BLACKBOX,37)
    theconv2d3x3_B3_branch : conv2d3x3_B3_branch
    PORT MAP (
        in_c0_exe13 => bb_conv2d3x3_B3_stall_region_out_c0_exe13,
        in_c0_exe3256 => bb_conv2d3x3_B3_stall_region_out_c0_exe3256,
        in_c0_exe4257 => bb_conv2d3x3_B3_stall_region_out_c0_exe4257,
        in_c0_exe5258 => bb_conv2d3x3_B3_stall_region_out_c0_exe5258,
        in_c0_exe6259 => bb_conv2d3x3_B3_stall_region_out_c0_exe6259,
        in_c0_exe7260 => bb_conv2d3x3_B3_stall_region_out_c0_exe7260,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_unnamed_conv2d3x33 => bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x33,
        in_valid_in => bb_conv2d3x3_B3_stall_region_out_valid_out,
        out_c0_exe13 => conv2d3x3_B3_branch_out_c0_exe13,
        out_c0_exe3256 => conv2d3x3_B3_branch_out_c0_exe3256,
        out_c0_exe4257 => conv2d3x3_B3_branch_out_c0_exe4257,
        out_c0_exe5258 => conv2d3x3_B3_branch_out_c0_exe5258,
        out_c0_exe6259 => conv2d3x3_B3_branch_out_c0_exe6259,
        out_stall_out => conv2d3x3_B3_branch_out_stall_out,
        out_unnamed_conv2d3x33 => conv2d3x3_B3_branch_out_unnamed_conv2d3x33,
        out_valid_out_0 => conv2d3x3_B3_branch_out_valid_out_0,
        out_valid_out_1 => conv2d3x3_B3_branch_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exe13(GPOUT,38)
    out_c0_exe13 <= conv2d3x3_B3_branch_out_c0_exe13;

    -- out_c0_exe3256(GPOUT,39)
    out_c0_exe3256 <= conv2d3x3_B3_branch_out_c0_exe3256;

    -- out_c0_exe4257(GPOUT,40)
    out_c0_exe4257 <= conv2d3x3_B3_branch_out_c0_exe4257;

    -- out_c0_exe5258(GPOUT,41)
    out_c0_exe5258 <= conv2d3x3_B3_branch_out_c0_exe5258;

    -- out_c0_exe6259(GPOUT,42)
    out_c0_exe6259 <= conv2d3x3_B3_branch_out_c0_exe6259;

    -- out_lsu_unnamed_conv2d3x35_o_active(GPOUT,43)
    out_lsu_unnamed_conv2d3x35_o_active <= bb_conv2d3x3_B3_stall_region_out_lsu_unnamed_conv2d3x35_o_active;

    -- out_stall_out_0(GPOUT,44)
    out_stall_out_0 <= conv2d3x3_B3_merge_aunroll_x_out_stall_out_0;

    -- out_unnamed_conv2d3x33(GPOUT,45)
    out_unnamed_conv2d3x33 <= conv2d3x3_B3_branch_out_unnamed_conv2d3x33;

    -- out_unnamed_conv2d3x35_avm_address(GPOUT,46)
    out_unnamed_conv2d3x35_avm_address <= bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x35_avm_address;

    -- out_unnamed_conv2d3x35_avm_burstcount(GPOUT,47)
    out_unnamed_conv2d3x35_avm_burstcount <= bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x35_avm_burstcount;

    -- out_unnamed_conv2d3x35_avm_byteenable(GPOUT,48)
    out_unnamed_conv2d3x35_avm_byteenable <= bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x35_avm_byteenable;

    -- out_unnamed_conv2d3x35_avm_enable(GPOUT,49)
    out_unnamed_conv2d3x35_avm_enable <= bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x35_avm_enable;

    -- out_unnamed_conv2d3x35_avm_read(GPOUT,50)
    out_unnamed_conv2d3x35_avm_read <= bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x35_avm_read;

    -- out_unnamed_conv2d3x35_avm_write(GPOUT,51)
    out_unnamed_conv2d3x35_avm_write <= bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x35_avm_write;

    -- out_unnamed_conv2d3x35_avm_writedata(GPOUT,52)
    out_unnamed_conv2d3x35_avm_writedata <= bb_conv2d3x3_B3_stall_region_out_unnamed_conv2d3x35_avm_writedata;

    -- out_valid_out_0(GPOUT,53)
    out_valid_out_0 <= conv2d3x3_B3_branch_out_valid_out_0;

    -- out_valid_out_1(GPOUT,54)
    out_valid_out_1 <= conv2d3x3_B3_branch_out_valid_out_1;

END normal;
