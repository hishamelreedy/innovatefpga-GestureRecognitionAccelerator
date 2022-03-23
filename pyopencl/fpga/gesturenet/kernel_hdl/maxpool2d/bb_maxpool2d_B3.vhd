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

-- VHDL created from bb_maxpool2d_B3
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

entity bb_maxpool2d_B3 is
    port (
        in_c0_exe13_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe11715_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_cmp9_phi_decision18_xor_RM14_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_0106_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_1610_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im_addr_0114_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_178_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_maxpool2d1_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_maxpool2d1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_maxpool2d1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_maxpool2d1_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe13 : out std_logic_vector(63 downto 0);  -- ufix64
        out_i_010_LC_OuterPHI : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_16_LC_InnerPHI : out std_logic_vector(31 downto 0);  -- ufix32
        out_lsu_unnamed_maxpool2d1_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        out_output_im_addr_011_LC_OuterPHI : out std_logic_vector(63 downto 0);  -- ufix64
        out_output_im_addr_17_LC_InnerPHI : out std_logic_vector(63 downto 0);  -- ufix64
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_maxpool2d1_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_maxpool2d1_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_maxpool2d1_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_maxpool2d1_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_maxpool2d1_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_maxpool2d1_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_maxpool2d1_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_maxpool2d_B3;

architecture normal of bb_maxpool2d_B3 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_maxpool2d_B3_stall_region is
        port (
            in_c0_exe13 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe11715 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_cmp9_phi_decision18_xor_RM14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_0106 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_1610 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im_addr_0114 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_178 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_maxpool2d1_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_maxpool2d1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_maxpool2d1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_maxpool2d1_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe13 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_for_end37_loopexit_loopexit_LC_COND : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_i_010_LC_OuterPHI : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_16_LC_InnerPHI : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_lsu_unnamed_maxpool2d1_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_output_im_addr_011_LC_OuterPHI : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_output_im_addr_17_LC_InnerPHI : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component maxpool2d_B3_branch is
        port (
            in_c0_exe13 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_for_end37_loopexit_loopexit_LC_COND : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_010_LC_OuterPHI : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_16_LC_InnerPHI : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im_addr_011_LC_OuterPHI : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_17_LC_InnerPHI : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe13 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_i_010_LC_OuterPHI : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_16_LC_InnerPHI : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_output_im_addr_011_LC_OuterPHI : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_output_im_addr_17_LC_InnerPHI : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component maxpool2d_B3_merge is
        port (
            in_c0_exe13_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe11715_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_cmp9_phi_decision18_xor_RM14_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_0106_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_1610_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im_addr_0114_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_178_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe13 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe11715 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_cmp9_phi_decision18_xor_RM14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_i_0106 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_1610 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_output_im_addr_0114 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_output_im_addr_178 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_maxpool2d_B3_stall_region_out_c0_exe13 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B3_stall_region_out_for_end37_loopexit_loopexit_LC_COND : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B3_stall_region_out_i_010_LC_OuterPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B3_stall_region_out_j_16_LC_InnerPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B3_stall_region_out_lsu_unnamed_maxpool2d1_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B3_stall_region_out_output_im_addr_011_LC_OuterPHI : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B3_stall_region_out_output_im_addr_17_LC_InnerPHI : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B3_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B3_stall_region_out_unnamed_maxpool2d1_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_maxpool2d_B3_stall_region_out_unnamed_maxpool2d1_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_maxpool2d_B3_stall_region_out_unnamed_maxpool2d1_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B3_stall_region_out_unnamed_maxpool2d1_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B3_stall_region_out_unnamed_maxpool2d1_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B3_stall_region_out_unnamed_maxpool2d1_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B3_stall_region_out_unnamed_maxpool2d1_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_maxpool2d_B3_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B3_branch_out_c0_exe13 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B3_branch_out_i_010_LC_OuterPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B3_branch_out_j_16_LC_InnerPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B3_branch_out_output_im_addr_011_LC_OuterPHI : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B3_branch_out_output_im_addr_17_LC_InnerPHI : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B3_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B3_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B3_branch_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B3_merge_out_c0_exe13 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B3_merge_out_c1_exe11715 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B3_merge_out_cmp9_phi_decision18_xor_RM14 : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B3_merge_out_i_0106 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B3_merge_out_j_1610 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B3_merge_out_output_im_addr_0114 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B3_merge_out_output_im_addr_178 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B3_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B3_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- maxpool2d_B3_merge(BLACKBOX,22)
    themaxpool2d_B3_merge : maxpool2d_B3_merge
    PORT MAP (
        in_c0_exe13_0 => in_c0_exe13_0,
        in_c1_exe11715_0 => in_c1_exe11715_0,
        in_cmp9_phi_decision18_xor_RM14_0 => in_cmp9_phi_decision18_xor_RM14_0,
        in_i_0106_0 => in_i_0106_0,
        in_j_1610_0 => in_j_1610_0,
        in_output_im_addr_0114_0 => in_output_im_addr_0114_0,
        in_output_im_addr_178_0 => in_output_im_addr_178_0,
        in_stall_in => bb_maxpool2d_B3_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_c0_exe13 => maxpool2d_B3_merge_out_c0_exe13,
        out_c1_exe11715 => maxpool2d_B3_merge_out_c1_exe11715,
        out_cmp9_phi_decision18_xor_RM14 => maxpool2d_B3_merge_out_cmp9_phi_decision18_xor_RM14,
        out_i_0106 => maxpool2d_B3_merge_out_i_0106,
        out_j_1610 => maxpool2d_B3_merge_out_j_1610,
        out_output_im_addr_0114 => maxpool2d_B3_merge_out_output_im_addr_0114,
        out_output_im_addr_178 => maxpool2d_B3_merge_out_output_im_addr_178,
        out_stall_out_0 => maxpool2d_B3_merge_out_stall_out_0,
        out_valid_out => maxpool2d_B3_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_maxpool2d_B3_stall_region(BLACKBOX,2)
    thebb_maxpool2d_B3_stall_region : bb_maxpool2d_B3_stall_region
    PORT MAP (
        in_c0_exe13 => maxpool2d_B3_merge_out_c0_exe13,
        in_c1_exe11715 => maxpool2d_B3_merge_out_c1_exe11715,
        in_cmp9_phi_decision18_xor_RM14 => maxpool2d_B3_merge_out_cmp9_phi_decision18_xor_RM14,
        in_flush => in_flush,
        in_i_0106 => maxpool2d_B3_merge_out_i_0106,
        in_j_1610 => maxpool2d_B3_merge_out_j_1610,
        in_output_im_addr_0114 => maxpool2d_B3_merge_out_output_im_addr_0114,
        in_output_im_addr_178 => maxpool2d_B3_merge_out_output_im_addr_178,
        in_output_size => in_output_size,
        in_stall_in => maxpool2d_B3_branch_out_stall_out,
        in_unnamed_maxpool2d1_avm_readdata => in_unnamed_maxpool2d1_avm_readdata,
        in_unnamed_maxpool2d1_avm_readdatavalid => in_unnamed_maxpool2d1_avm_readdatavalid,
        in_unnamed_maxpool2d1_avm_waitrequest => in_unnamed_maxpool2d1_avm_waitrequest,
        in_unnamed_maxpool2d1_avm_writeack => in_unnamed_maxpool2d1_avm_writeack,
        in_valid_in => maxpool2d_B3_merge_out_valid_out,
        out_c0_exe13 => bb_maxpool2d_B3_stall_region_out_c0_exe13,
        out_for_end37_loopexit_loopexit_LC_COND => bb_maxpool2d_B3_stall_region_out_for_end37_loopexit_loopexit_LC_COND,
        out_i_010_LC_OuterPHI => bb_maxpool2d_B3_stall_region_out_i_010_LC_OuterPHI,
        out_j_16_LC_InnerPHI => bb_maxpool2d_B3_stall_region_out_j_16_LC_InnerPHI,
        out_lsu_unnamed_maxpool2d1_o_active => bb_maxpool2d_B3_stall_region_out_lsu_unnamed_maxpool2d1_o_active,
        out_output_im_addr_011_LC_OuterPHI => bb_maxpool2d_B3_stall_region_out_output_im_addr_011_LC_OuterPHI,
        out_output_im_addr_17_LC_InnerPHI => bb_maxpool2d_B3_stall_region_out_output_im_addr_17_LC_InnerPHI,
        out_stall_out => bb_maxpool2d_B3_stall_region_out_stall_out,
        out_unnamed_maxpool2d1_avm_address => bb_maxpool2d_B3_stall_region_out_unnamed_maxpool2d1_avm_address,
        out_unnamed_maxpool2d1_avm_burstcount => bb_maxpool2d_B3_stall_region_out_unnamed_maxpool2d1_avm_burstcount,
        out_unnamed_maxpool2d1_avm_byteenable => bb_maxpool2d_B3_stall_region_out_unnamed_maxpool2d1_avm_byteenable,
        out_unnamed_maxpool2d1_avm_enable => bb_maxpool2d_B3_stall_region_out_unnamed_maxpool2d1_avm_enable,
        out_unnamed_maxpool2d1_avm_read => bb_maxpool2d_B3_stall_region_out_unnamed_maxpool2d1_avm_read,
        out_unnamed_maxpool2d1_avm_write => bb_maxpool2d_B3_stall_region_out_unnamed_maxpool2d1_avm_write,
        out_unnamed_maxpool2d1_avm_writedata => bb_maxpool2d_B3_stall_region_out_unnamed_maxpool2d1_avm_writedata,
        out_valid_out => bb_maxpool2d_B3_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- maxpool2d_B3_branch(BLACKBOX,21)
    themaxpool2d_B3_branch : maxpool2d_B3_branch
    PORT MAP (
        in_c0_exe13 => bb_maxpool2d_B3_stall_region_out_c0_exe13,
        in_for_end37_loopexit_loopexit_LC_COND => bb_maxpool2d_B3_stall_region_out_for_end37_loopexit_loopexit_LC_COND,
        in_i_010_LC_OuterPHI => bb_maxpool2d_B3_stall_region_out_i_010_LC_OuterPHI,
        in_j_16_LC_InnerPHI => bb_maxpool2d_B3_stall_region_out_j_16_LC_InnerPHI,
        in_output_im_addr_011_LC_OuterPHI => bb_maxpool2d_B3_stall_region_out_output_im_addr_011_LC_OuterPHI,
        in_output_im_addr_17_LC_InnerPHI => bb_maxpool2d_B3_stall_region_out_output_im_addr_17_LC_InnerPHI,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_valid_in => bb_maxpool2d_B3_stall_region_out_valid_out,
        out_c0_exe13 => maxpool2d_B3_branch_out_c0_exe13,
        out_i_010_LC_OuterPHI => maxpool2d_B3_branch_out_i_010_LC_OuterPHI,
        out_j_16_LC_InnerPHI => maxpool2d_B3_branch_out_j_16_LC_InnerPHI,
        out_output_im_addr_011_LC_OuterPHI => maxpool2d_B3_branch_out_output_im_addr_011_LC_OuterPHI,
        out_output_im_addr_17_LC_InnerPHI => maxpool2d_B3_branch_out_output_im_addr_17_LC_InnerPHI,
        out_stall_out => maxpool2d_B3_branch_out_stall_out,
        out_valid_out_0 => maxpool2d_B3_branch_out_valid_out_0,
        out_valid_out_1 => maxpool2d_B3_branch_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exe13(GPOUT,23)
    out_c0_exe13 <= maxpool2d_B3_branch_out_c0_exe13;

    -- out_i_010_LC_OuterPHI(GPOUT,24)
    out_i_010_LC_OuterPHI <= maxpool2d_B3_branch_out_i_010_LC_OuterPHI;

    -- out_j_16_LC_InnerPHI(GPOUT,25)
    out_j_16_LC_InnerPHI <= maxpool2d_B3_branch_out_j_16_LC_InnerPHI;

    -- out_lsu_unnamed_maxpool2d1_o_active(GPOUT,26)
    out_lsu_unnamed_maxpool2d1_o_active <= bb_maxpool2d_B3_stall_region_out_lsu_unnamed_maxpool2d1_o_active;

    -- out_output_im_addr_011_LC_OuterPHI(GPOUT,27)
    out_output_im_addr_011_LC_OuterPHI <= maxpool2d_B3_branch_out_output_im_addr_011_LC_OuterPHI;

    -- out_output_im_addr_17_LC_InnerPHI(GPOUT,28)
    out_output_im_addr_17_LC_InnerPHI <= maxpool2d_B3_branch_out_output_im_addr_17_LC_InnerPHI;

    -- out_stall_out_0(GPOUT,29)
    out_stall_out_0 <= maxpool2d_B3_merge_out_stall_out_0;

    -- out_unnamed_maxpool2d1_avm_address(GPOUT,30)
    out_unnamed_maxpool2d1_avm_address <= bb_maxpool2d_B3_stall_region_out_unnamed_maxpool2d1_avm_address;

    -- out_unnamed_maxpool2d1_avm_burstcount(GPOUT,31)
    out_unnamed_maxpool2d1_avm_burstcount <= bb_maxpool2d_B3_stall_region_out_unnamed_maxpool2d1_avm_burstcount;

    -- out_unnamed_maxpool2d1_avm_byteenable(GPOUT,32)
    out_unnamed_maxpool2d1_avm_byteenable <= bb_maxpool2d_B3_stall_region_out_unnamed_maxpool2d1_avm_byteenable;

    -- out_unnamed_maxpool2d1_avm_enable(GPOUT,33)
    out_unnamed_maxpool2d1_avm_enable <= bb_maxpool2d_B3_stall_region_out_unnamed_maxpool2d1_avm_enable;

    -- out_unnamed_maxpool2d1_avm_read(GPOUT,34)
    out_unnamed_maxpool2d1_avm_read <= bb_maxpool2d_B3_stall_region_out_unnamed_maxpool2d1_avm_read;

    -- out_unnamed_maxpool2d1_avm_write(GPOUT,35)
    out_unnamed_maxpool2d1_avm_write <= bb_maxpool2d_B3_stall_region_out_unnamed_maxpool2d1_avm_write;

    -- out_unnamed_maxpool2d1_avm_writedata(GPOUT,36)
    out_unnamed_maxpool2d1_avm_writedata <= bb_maxpool2d_B3_stall_region_out_unnamed_maxpool2d1_avm_writedata;

    -- out_valid_out_0(GPOUT,37)
    out_valid_out_0 <= maxpool2d_B3_branch_out_valid_out_0;

    -- out_valid_out_1(GPOUT,38)
    out_valid_out_1 <= maxpool2d_B3_branch_out_valid_out_1;

END normal;
