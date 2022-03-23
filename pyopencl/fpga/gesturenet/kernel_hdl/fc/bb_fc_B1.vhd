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

-- VHDL created from bb_fc_B1
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

entity bb_fc_B1 is
    port (
        in_c0_exe11_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe11_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_06_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_06_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_idxprom3_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_idxprom3_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_j_13_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_13_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_sizex : in std_logic_vector(31 downto 0);  -- ufix32
        in_sizey : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_tmp_05_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_tmp_05_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_tmp_12_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_tmp_12_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_fc1_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_fc1_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_fc2_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_fc2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc2_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc3_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_fc3_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc3_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc3_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c1_exe2 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_i_06_LC_OuterPHI : out std_logic_vector(31 downto 0);  -- ufix32
        out_idxprom3 : out std_logic_vector(63 downto 0);  -- ufix64
        out_j_13_LC_InnerPHI : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_unnamed_fc2_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_fc2_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_fc2_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_fc2_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc2_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc2_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc2_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_fc3_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_fc3_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_fc3_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_fc3_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc3_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc3_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc3_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_fc_B1;

architecture normal of bb_fc_B1 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_fc_B1_stall_region is
        port (
            in_c0_exe11 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_06 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_idxprom3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_j_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_sizex : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_sizey : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_tmp_05 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_tmp_12 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_fc1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_fc2_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_fc2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc2_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc3_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_fc3_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc3_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc3_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c1_exe2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_for_end20_loopexit_loopexit_LC_COND : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_i_06_LC_OuterPHI : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_idxprom3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_j_13_LC_InnerPHI : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_unnamed_fc2_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_fc2_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_fc2_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_fc2_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc2_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc2_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc2_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_unnamed_fc3_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_fc3_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_fc3_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_fc3_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc3_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc3_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc3_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component fc_B1_branch is
        port (
            in_c0_exe11 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_exe2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_for_end20_loopexit_loopexit_LC_COND : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_06_LC_OuterPHI : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_idxprom3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_j_13_LC_InnerPHI : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c1_exe2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_i_06_LC_OuterPHI : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_idxprom3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_j_13_LC_InnerPHI : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component fc_B1_merge is
        port (
            in_c0_exe11_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe11_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_06_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_06_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_idxprom3_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_idxprom3_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_j_13_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_13_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_tmp_05_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_tmp_05_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_tmp_12_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_tmp_12_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_fc1_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_fc1_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_i_06 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_idxprom3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_j_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_tmp_05 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_tmp_12 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_unnamed_fc1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_fc_B1_stall_region_out_c0_exe11 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_fc_B1_stall_region_out_c1_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B1_stall_region_out_c1_exe2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B1_stall_region_out_for_end20_loopexit_loopexit_LC_COND : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B1_stall_region_out_i_06_LC_OuterPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B1_stall_region_out_idxprom3 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_fc_B1_stall_region_out_j_13_LC_InnerPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B1_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B1_stall_region_out_unnamed_fc1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B1_stall_region_out_unnamed_fc2_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_fc_B1_stall_region_out_unnamed_fc2_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_fc_B1_stall_region_out_unnamed_fc2_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B1_stall_region_out_unnamed_fc2_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B1_stall_region_out_unnamed_fc2_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B1_stall_region_out_unnamed_fc2_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B1_stall_region_out_unnamed_fc2_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_fc_B1_stall_region_out_unnamed_fc3_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_fc_B1_stall_region_out_unnamed_fc3_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_fc_B1_stall_region_out_unnamed_fc3_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B1_stall_region_out_unnamed_fc3_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B1_stall_region_out_unnamed_fc3_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B1_stall_region_out_unnamed_fc3_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B1_stall_region_out_unnamed_fc3_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_fc_B1_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_B1_branch_out_c0_exe11 : STD_LOGIC_VECTOR (63 downto 0);
    signal fc_B1_branch_out_c1_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_B1_branch_out_c1_exe2 : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_B1_branch_out_i_06_LC_OuterPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_B1_branch_out_idxprom3 : STD_LOGIC_VECTOR (63 downto 0);
    signal fc_B1_branch_out_j_13_LC_InnerPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_B1_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_B1_branch_out_unnamed_fc1 : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_B1_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_B1_branch_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_B1_merge_out_c0_exe11 : STD_LOGIC_VECTOR (63 downto 0);
    signal fc_B1_merge_out_i_06 : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_B1_merge_out_idxprom3 : STD_LOGIC_VECTOR (63 downto 0);
    signal fc_B1_merge_out_j_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_B1_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_B1_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_B1_merge_out_tmp_05 : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_B1_merge_out_tmp_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_B1_merge_out_unnamed_fc1 : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_B1_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- fc_B1_merge(BLACKBOX,4)
    thefc_B1_merge : fc_B1_merge
    PORT MAP (
        in_c0_exe11_0 => in_c0_exe11_0,
        in_c0_exe11_1 => in_c0_exe11_1,
        in_i_06_0 => in_i_06_0,
        in_i_06_1 => in_i_06_1,
        in_idxprom3_0 => in_idxprom3_0,
        in_idxprom3_1 => in_idxprom3_1,
        in_j_13_0 => in_j_13_0,
        in_j_13_1 => in_j_13_1,
        in_stall_in => bb_fc_B1_stall_region_out_stall_out,
        in_tmp_05_0 => in_tmp_05_0,
        in_tmp_05_1 => in_tmp_05_1,
        in_tmp_12_0 => in_tmp_12_0,
        in_tmp_12_1 => in_tmp_12_1,
        in_unnamed_fc1_0 => in_unnamed_fc1_0,
        in_unnamed_fc1_1 => in_unnamed_fc1_1,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_c0_exe11 => fc_B1_merge_out_c0_exe11,
        out_i_06 => fc_B1_merge_out_i_06,
        out_idxprom3 => fc_B1_merge_out_idxprom3,
        out_j_13 => fc_B1_merge_out_j_13,
        out_stall_out_0 => fc_B1_merge_out_stall_out_0,
        out_stall_out_1 => fc_B1_merge_out_stall_out_1,
        out_tmp_05 => fc_B1_merge_out_tmp_05,
        out_tmp_12 => fc_B1_merge_out_tmp_12,
        out_unnamed_fc1 => fc_B1_merge_out_unnamed_fc1,
        out_valid_out => fc_B1_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_fc_B1_stall_region(BLACKBOX,2)
    thebb_fc_B1_stall_region : bb_fc_B1_stall_region
    PORT MAP (
        in_c0_exe11 => fc_B1_merge_out_c0_exe11,
        in_filter_weight => in_filter_weight,
        in_flush => in_flush,
        in_i_06 => fc_B1_merge_out_i_06,
        in_idxprom3 => fc_B1_merge_out_idxprom3,
        in_input_im => in_input_im,
        in_j_13 => fc_B1_merge_out_j_13,
        in_sizex => in_sizex,
        in_sizey => in_sizey,
        in_stall_in => fc_B1_branch_out_stall_out,
        in_tmp_05 => fc_B1_merge_out_tmp_05,
        in_tmp_12 => fc_B1_merge_out_tmp_12,
        in_unnamed_fc1 => fc_B1_merge_out_unnamed_fc1,
        in_unnamed_fc2_avm_readdata => in_unnamed_fc2_avm_readdata,
        in_unnamed_fc2_avm_readdatavalid => in_unnamed_fc2_avm_readdatavalid,
        in_unnamed_fc2_avm_waitrequest => in_unnamed_fc2_avm_waitrequest,
        in_unnamed_fc2_avm_writeack => in_unnamed_fc2_avm_writeack,
        in_unnamed_fc3_avm_readdata => in_unnamed_fc3_avm_readdata,
        in_unnamed_fc3_avm_readdatavalid => in_unnamed_fc3_avm_readdatavalid,
        in_unnamed_fc3_avm_waitrequest => in_unnamed_fc3_avm_waitrequest,
        in_unnamed_fc3_avm_writeack => in_unnamed_fc3_avm_writeack,
        in_valid_in => fc_B1_merge_out_valid_out,
        out_c0_exe11 => bb_fc_B1_stall_region_out_c0_exe11,
        out_c1_exe1 => bb_fc_B1_stall_region_out_c1_exe1,
        out_c1_exe2 => bb_fc_B1_stall_region_out_c1_exe2,
        out_for_end20_loopexit_loopexit_LC_COND => bb_fc_B1_stall_region_out_for_end20_loopexit_loopexit_LC_COND,
        out_i_06_LC_OuterPHI => bb_fc_B1_stall_region_out_i_06_LC_OuterPHI,
        out_idxprom3 => bb_fc_B1_stall_region_out_idxprom3,
        out_j_13_LC_InnerPHI => bb_fc_B1_stall_region_out_j_13_LC_InnerPHI,
        out_stall_out => bb_fc_B1_stall_region_out_stall_out,
        out_unnamed_fc1 => bb_fc_B1_stall_region_out_unnamed_fc1,
        out_unnamed_fc2_avm_address => bb_fc_B1_stall_region_out_unnamed_fc2_avm_address,
        out_unnamed_fc2_avm_burstcount => bb_fc_B1_stall_region_out_unnamed_fc2_avm_burstcount,
        out_unnamed_fc2_avm_byteenable => bb_fc_B1_stall_region_out_unnamed_fc2_avm_byteenable,
        out_unnamed_fc2_avm_enable => bb_fc_B1_stall_region_out_unnamed_fc2_avm_enable,
        out_unnamed_fc2_avm_read => bb_fc_B1_stall_region_out_unnamed_fc2_avm_read,
        out_unnamed_fc2_avm_write => bb_fc_B1_stall_region_out_unnamed_fc2_avm_write,
        out_unnamed_fc2_avm_writedata => bb_fc_B1_stall_region_out_unnamed_fc2_avm_writedata,
        out_unnamed_fc3_avm_address => bb_fc_B1_stall_region_out_unnamed_fc3_avm_address,
        out_unnamed_fc3_avm_burstcount => bb_fc_B1_stall_region_out_unnamed_fc3_avm_burstcount,
        out_unnamed_fc3_avm_byteenable => bb_fc_B1_stall_region_out_unnamed_fc3_avm_byteenable,
        out_unnamed_fc3_avm_enable => bb_fc_B1_stall_region_out_unnamed_fc3_avm_enable,
        out_unnamed_fc3_avm_read => bb_fc_B1_stall_region_out_unnamed_fc3_avm_read,
        out_unnamed_fc3_avm_write => bb_fc_B1_stall_region_out_unnamed_fc3_avm_write,
        out_unnamed_fc3_avm_writedata => bb_fc_B1_stall_region_out_unnamed_fc3_avm_writedata,
        out_valid_out => bb_fc_B1_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- fc_B1_branch(BLACKBOX,3)
    thefc_B1_branch : fc_B1_branch
    PORT MAP (
        in_c0_exe11 => bb_fc_B1_stall_region_out_c0_exe11,
        in_c1_exe1 => bb_fc_B1_stall_region_out_c1_exe1,
        in_c1_exe2 => bb_fc_B1_stall_region_out_c1_exe2,
        in_for_end20_loopexit_loopexit_LC_COND => bb_fc_B1_stall_region_out_for_end20_loopexit_loopexit_LC_COND,
        in_i_06_LC_OuterPHI => bb_fc_B1_stall_region_out_i_06_LC_OuterPHI,
        in_idxprom3 => bb_fc_B1_stall_region_out_idxprom3,
        in_j_13_LC_InnerPHI => bb_fc_B1_stall_region_out_j_13_LC_InnerPHI,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_unnamed_fc1 => bb_fc_B1_stall_region_out_unnamed_fc1,
        in_valid_in => bb_fc_B1_stall_region_out_valid_out,
        out_c0_exe11 => fc_B1_branch_out_c0_exe11,
        out_c1_exe1 => fc_B1_branch_out_c1_exe1,
        out_c1_exe2 => fc_B1_branch_out_c1_exe2,
        out_i_06_LC_OuterPHI => fc_B1_branch_out_i_06_LC_OuterPHI,
        out_idxprom3 => fc_B1_branch_out_idxprom3,
        out_j_13_LC_InnerPHI => fc_B1_branch_out_j_13_LC_InnerPHI,
        out_stall_out => fc_B1_branch_out_stall_out,
        out_unnamed_fc1 => fc_B1_branch_out_unnamed_fc1,
        out_valid_out_0 => fc_B1_branch_out_valid_out_0,
        out_valid_out_1 => fc_B1_branch_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exe11(GPOUT,37)
    out_c0_exe11 <= fc_B1_branch_out_c0_exe11;

    -- out_c1_exe1(GPOUT,38)
    out_c1_exe1 <= fc_B1_branch_out_c1_exe1;

    -- out_c1_exe2(GPOUT,39)
    out_c1_exe2 <= fc_B1_branch_out_c1_exe2;

    -- out_i_06_LC_OuterPHI(GPOUT,40)
    out_i_06_LC_OuterPHI <= fc_B1_branch_out_i_06_LC_OuterPHI;

    -- out_idxprom3(GPOUT,41)
    out_idxprom3 <= fc_B1_branch_out_idxprom3;

    -- out_j_13_LC_InnerPHI(GPOUT,42)
    out_j_13_LC_InnerPHI <= fc_B1_branch_out_j_13_LC_InnerPHI;

    -- out_stall_out_0(GPOUT,43)
    out_stall_out_0 <= fc_B1_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,44)
    out_stall_out_1 <= fc_B1_merge_out_stall_out_1;

    -- out_unnamed_fc1(GPOUT,45)
    out_unnamed_fc1 <= fc_B1_branch_out_unnamed_fc1;

    -- out_unnamed_fc2_avm_address(GPOUT,46)
    out_unnamed_fc2_avm_address <= bb_fc_B1_stall_region_out_unnamed_fc2_avm_address;

    -- out_unnamed_fc2_avm_burstcount(GPOUT,47)
    out_unnamed_fc2_avm_burstcount <= bb_fc_B1_stall_region_out_unnamed_fc2_avm_burstcount;

    -- out_unnamed_fc2_avm_byteenable(GPOUT,48)
    out_unnamed_fc2_avm_byteenable <= bb_fc_B1_stall_region_out_unnamed_fc2_avm_byteenable;

    -- out_unnamed_fc2_avm_enable(GPOUT,49)
    out_unnamed_fc2_avm_enable <= bb_fc_B1_stall_region_out_unnamed_fc2_avm_enable;

    -- out_unnamed_fc2_avm_read(GPOUT,50)
    out_unnamed_fc2_avm_read <= bb_fc_B1_stall_region_out_unnamed_fc2_avm_read;

    -- out_unnamed_fc2_avm_write(GPOUT,51)
    out_unnamed_fc2_avm_write <= bb_fc_B1_stall_region_out_unnamed_fc2_avm_write;

    -- out_unnamed_fc2_avm_writedata(GPOUT,52)
    out_unnamed_fc2_avm_writedata <= bb_fc_B1_stall_region_out_unnamed_fc2_avm_writedata;

    -- out_unnamed_fc3_avm_address(GPOUT,53)
    out_unnamed_fc3_avm_address <= bb_fc_B1_stall_region_out_unnamed_fc3_avm_address;

    -- out_unnamed_fc3_avm_burstcount(GPOUT,54)
    out_unnamed_fc3_avm_burstcount <= bb_fc_B1_stall_region_out_unnamed_fc3_avm_burstcount;

    -- out_unnamed_fc3_avm_byteenable(GPOUT,55)
    out_unnamed_fc3_avm_byteenable <= bb_fc_B1_stall_region_out_unnamed_fc3_avm_byteenable;

    -- out_unnamed_fc3_avm_enable(GPOUT,56)
    out_unnamed_fc3_avm_enable <= bb_fc_B1_stall_region_out_unnamed_fc3_avm_enable;

    -- out_unnamed_fc3_avm_read(GPOUT,57)
    out_unnamed_fc3_avm_read <= bb_fc_B1_stall_region_out_unnamed_fc3_avm_read;

    -- out_unnamed_fc3_avm_write(GPOUT,58)
    out_unnamed_fc3_avm_write <= bb_fc_B1_stall_region_out_unnamed_fc3_avm_write;

    -- out_unnamed_fc3_avm_writedata(GPOUT,59)
    out_unnamed_fc3_avm_writedata <= bb_fc_B1_stall_region_out_unnamed_fc3_avm_writedata;

    -- out_valid_out_0(GPOUT,60)
    out_valid_out_0 <= fc_B1_branch_out_valid_out_0;

    -- out_valid_out_1(GPOUT,61)
    out_valid_out_1 <= fc_B1_branch_out_valid_out_1;

END normal;
