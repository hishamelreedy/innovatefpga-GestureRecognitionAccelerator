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

-- VHDL created from bb_avgpool2d_B1
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

entity bb_avgpool2d_B1 is
    port (
        in_c0_exe12_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe12_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe23_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe23_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe35_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe35_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe46_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe46_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv_in_0 : in std_logic_vector(32 downto 0);  -- ufix33
        in_fpgaindvars_iv_in_1 : in std_logic_vector(32 downto 0);  -- ufix33
        in_global_id_09_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_09_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_03_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_03_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_tmp_02_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_tmp_02_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_avgpool2d0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_avgpool2d0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_avgpool2d0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_avgpool2d0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe17 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c0_exe23 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe35 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe46 : out std_logic_vector(0 downto 0);  -- ufix1
        out_fpgaindvars_iv : out std_logic_vector(32 downto 0);  -- ufix33
        out_global_id_09 : out std_logic_vector(31 downto 0);  -- ufix32
        out_inc : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_avgpool2d0_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_avgpool2d0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_avgpool2d0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_avgpool2d0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_avgpool2d0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_avgpool2d0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_avgpool2d0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_avgpool2d_B1;

architecture normal of bb_avgpool2d_B1 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component avgpool2d_B1_branch is
        port (
            in_c0_exe12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe17 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_exe23 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe35 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe46 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_exitcond_GUARD : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_global_id_09 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_inc : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe17 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c0_exe23 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe35 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe46 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_fpgaindvars_iv : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_global_id_09 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_inc : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component avgpool2d_B1_merge is
        port (
            in_c0_exe12_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe12_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe23_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe23_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe35_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe35_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe46_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe46_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_in_0 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_in_1 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_global_id_09_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_global_id_09_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_03_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_03_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_tmp_02_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_tmp_02_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe23 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe35 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe46 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_fpgaindvars_iv_in : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_global_id_09 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_i_03 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_tmp_02 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_avgpool2d_B1_stall_region is
        port (
            in_c0_exe12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe23 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe35 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe46 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_in : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_global_id_09 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_03 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_tmp_02 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_avgpool2d0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_avgpool2d0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_avgpool2d0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_avgpool2d0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe17 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c0_exe23 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe35 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe46 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exitcond_GUARD : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_fpgaindvars_iv : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_global_id_09 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_inc : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d0_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal avgpool2d_B1_branch_out_c0_exe12 : STD_LOGIC_VECTOR (31 downto 0);
    signal avgpool2d_B1_branch_out_c0_exe17 : STD_LOGIC_VECTOR (31 downto 0);
    signal avgpool2d_B1_branch_out_c0_exe23 : STD_LOGIC_VECTOR (63 downto 0);
    signal avgpool2d_B1_branch_out_c0_exe35 : STD_LOGIC_VECTOR (0 downto 0);
    signal avgpool2d_B1_branch_out_c0_exe46 : STD_LOGIC_VECTOR (0 downto 0);
    signal avgpool2d_B1_branch_out_fpgaindvars_iv : STD_LOGIC_VECTOR (32 downto 0);
    signal avgpool2d_B1_branch_out_global_id_09 : STD_LOGIC_VECTOR (31 downto 0);
    signal avgpool2d_B1_branch_out_inc : STD_LOGIC_VECTOR (31 downto 0);
    signal avgpool2d_B1_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal avgpool2d_B1_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal avgpool2d_B1_branch_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal avgpool2d_B1_merge_out_c0_exe12 : STD_LOGIC_VECTOR (31 downto 0);
    signal avgpool2d_B1_merge_out_c0_exe23 : STD_LOGIC_VECTOR (63 downto 0);
    signal avgpool2d_B1_merge_out_c0_exe35 : STD_LOGIC_VECTOR (0 downto 0);
    signal avgpool2d_B1_merge_out_c0_exe46 : STD_LOGIC_VECTOR (0 downto 0);
    signal avgpool2d_B1_merge_out_fpgaindvars_iv_in : STD_LOGIC_VECTOR (32 downto 0);
    signal avgpool2d_B1_merge_out_global_id_09 : STD_LOGIC_VECTOR (31 downto 0);
    signal avgpool2d_B1_merge_out_i_03 : STD_LOGIC_VECTOR (31 downto 0);
    signal avgpool2d_B1_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal avgpool2d_B1_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal avgpool2d_B1_merge_out_tmp_02 : STD_LOGIC_VECTOR (31 downto 0);
    signal avgpool2d_B1_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B1_stall_region_out_c0_exe12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_avgpool2d_B1_stall_region_out_c0_exe17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_avgpool2d_B1_stall_region_out_c0_exe23 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_avgpool2d_B1_stall_region_out_c0_exe35 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B1_stall_region_out_c0_exe46 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B1_stall_region_out_exitcond_GUARD : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B1_stall_region_out_fpgaindvars_iv : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_avgpool2d_B1_stall_region_out_global_id_09 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_avgpool2d_B1_stall_region_out_inc : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_avgpool2d_B1_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B1_stall_region_out_unnamed_avgpool2d0_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_avgpool2d_B1_stall_region_out_unnamed_avgpool2d0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_avgpool2d_B1_stall_region_out_unnamed_avgpool2d0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_avgpool2d_B1_stall_region_out_unnamed_avgpool2d0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B1_stall_region_out_unnamed_avgpool2d0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B1_stall_region_out_unnamed_avgpool2d0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_avgpool2d_B1_stall_region_out_unnamed_avgpool2d0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_avgpool2d_B1_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- avgpool2d_B1_merge(BLACKBOX,3)
    theavgpool2d_B1_merge : avgpool2d_B1_merge
    PORT MAP (
        in_c0_exe12_0 => in_c0_exe12_0,
        in_c0_exe12_1 => in_c0_exe12_1,
        in_c0_exe23_0 => in_c0_exe23_0,
        in_c0_exe23_1 => in_c0_exe23_1,
        in_c0_exe35_0 => in_c0_exe35_0,
        in_c0_exe35_1 => in_c0_exe35_1,
        in_c0_exe46_0 => in_c0_exe46_0,
        in_c0_exe46_1 => in_c0_exe46_1,
        in_fpgaindvars_iv_in_0 => in_fpgaindvars_iv_in_0,
        in_fpgaindvars_iv_in_1 => in_fpgaindvars_iv_in_1,
        in_global_id_09_0 => in_global_id_09_0,
        in_global_id_09_1 => in_global_id_09_1,
        in_i_03_0 => in_i_03_0,
        in_i_03_1 => in_i_03_1,
        in_stall_in => bb_avgpool2d_B1_stall_region_out_stall_out,
        in_tmp_02_0 => in_tmp_02_0,
        in_tmp_02_1 => in_tmp_02_1,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_c0_exe12 => avgpool2d_B1_merge_out_c0_exe12,
        out_c0_exe23 => avgpool2d_B1_merge_out_c0_exe23,
        out_c0_exe35 => avgpool2d_B1_merge_out_c0_exe35,
        out_c0_exe46 => avgpool2d_B1_merge_out_c0_exe46,
        out_fpgaindvars_iv_in => avgpool2d_B1_merge_out_fpgaindvars_iv_in,
        out_global_id_09 => avgpool2d_B1_merge_out_global_id_09,
        out_i_03 => avgpool2d_B1_merge_out_i_03,
        out_stall_out_0 => avgpool2d_B1_merge_out_stall_out_0,
        out_stall_out_1 => avgpool2d_B1_merge_out_stall_out_1,
        out_tmp_02 => avgpool2d_B1_merge_out_tmp_02,
        out_valid_out => avgpool2d_B1_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_avgpool2d_B1_stall_region(BLACKBOX,4)
    thebb_avgpool2d_B1_stall_region : bb_avgpool2d_B1_stall_region
    PORT MAP (
        in_c0_exe12 => avgpool2d_B1_merge_out_c0_exe12,
        in_c0_exe23 => avgpool2d_B1_merge_out_c0_exe23,
        in_c0_exe35 => avgpool2d_B1_merge_out_c0_exe35,
        in_c0_exe46 => avgpool2d_B1_merge_out_c0_exe46,
        in_flush => in_flush,
        in_fpgaindvars_iv_in => avgpool2d_B1_merge_out_fpgaindvars_iv_in,
        in_global_id_09 => avgpool2d_B1_merge_out_global_id_09,
        in_i_03 => avgpool2d_B1_merge_out_i_03,
        in_input_im => in_input_im,
        in_stall_in => avgpool2d_B1_branch_out_stall_out,
        in_tmp_02 => avgpool2d_B1_merge_out_tmp_02,
        in_unnamed_avgpool2d0_avm_readdata => in_unnamed_avgpool2d0_avm_readdata,
        in_unnamed_avgpool2d0_avm_readdatavalid => in_unnamed_avgpool2d0_avm_readdatavalid,
        in_unnamed_avgpool2d0_avm_waitrequest => in_unnamed_avgpool2d0_avm_waitrequest,
        in_unnamed_avgpool2d0_avm_writeack => in_unnamed_avgpool2d0_avm_writeack,
        in_valid_in => avgpool2d_B1_merge_out_valid_out,
        out_c0_exe12 => bb_avgpool2d_B1_stall_region_out_c0_exe12,
        out_c0_exe17 => bb_avgpool2d_B1_stall_region_out_c0_exe17,
        out_c0_exe23 => bb_avgpool2d_B1_stall_region_out_c0_exe23,
        out_c0_exe35 => bb_avgpool2d_B1_stall_region_out_c0_exe35,
        out_c0_exe46 => bb_avgpool2d_B1_stall_region_out_c0_exe46,
        out_exitcond_GUARD => bb_avgpool2d_B1_stall_region_out_exitcond_GUARD,
        out_fpgaindvars_iv => bb_avgpool2d_B1_stall_region_out_fpgaindvars_iv,
        out_global_id_09 => bb_avgpool2d_B1_stall_region_out_global_id_09,
        out_inc => bb_avgpool2d_B1_stall_region_out_inc,
        out_stall_out => bb_avgpool2d_B1_stall_region_out_stall_out,
        out_unnamed_avgpool2d0_avm_address => bb_avgpool2d_B1_stall_region_out_unnamed_avgpool2d0_avm_address,
        out_unnamed_avgpool2d0_avm_burstcount => bb_avgpool2d_B1_stall_region_out_unnamed_avgpool2d0_avm_burstcount,
        out_unnamed_avgpool2d0_avm_byteenable => bb_avgpool2d_B1_stall_region_out_unnamed_avgpool2d0_avm_byteenable,
        out_unnamed_avgpool2d0_avm_enable => bb_avgpool2d_B1_stall_region_out_unnamed_avgpool2d0_avm_enable,
        out_unnamed_avgpool2d0_avm_read => bb_avgpool2d_B1_stall_region_out_unnamed_avgpool2d0_avm_read,
        out_unnamed_avgpool2d0_avm_write => bb_avgpool2d_B1_stall_region_out_unnamed_avgpool2d0_avm_write,
        out_unnamed_avgpool2d0_avm_writedata => bb_avgpool2d_B1_stall_region_out_unnamed_avgpool2d0_avm_writedata,
        out_valid_out => bb_avgpool2d_B1_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- avgpool2d_B1_branch(BLACKBOX,2)
    theavgpool2d_B1_branch : avgpool2d_B1_branch
    PORT MAP (
        in_c0_exe12 => bb_avgpool2d_B1_stall_region_out_c0_exe12,
        in_c0_exe17 => bb_avgpool2d_B1_stall_region_out_c0_exe17,
        in_c0_exe23 => bb_avgpool2d_B1_stall_region_out_c0_exe23,
        in_c0_exe35 => bb_avgpool2d_B1_stall_region_out_c0_exe35,
        in_c0_exe46 => bb_avgpool2d_B1_stall_region_out_c0_exe46,
        in_exitcond_GUARD => bb_avgpool2d_B1_stall_region_out_exitcond_GUARD,
        in_fpgaindvars_iv => bb_avgpool2d_B1_stall_region_out_fpgaindvars_iv,
        in_global_id_09 => bb_avgpool2d_B1_stall_region_out_global_id_09,
        in_inc => bb_avgpool2d_B1_stall_region_out_inc,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_valid_in => bb_avgpool2d_B1_stall_region_out_valid_out,
        out_c0_exe12 => avgpool2d_B1_branch_out_c0_exe12,
        out_c0_exe17 => avgpool2d_B1_branch_out_c0_exe17,
        out_c0_exe23 => avgpool2d_B1_branch_out_c0_exe23,
        out_c0_exe35 => avgpool2d_B1_branch_out_c0_exe35,
        out_c0_exe46 => avgpool2d_B1_branch_out_c0_exe46,
        out_fpgaindvars_iv => avgpool2d_B1_branch_out_fpgaindvars_iv,
        out_global_id_09 => avgpool2d_B1_branch_out_global_id_09,
        out_inc => avgpool2d_B1_branch_out_inc,
        out_stall_out => avgpool2d_B1_branch_out_stall_out,
        out_valid_out_0 => avgpool2d_B1_branch_out_valid_out_0,
        out_valid_out_1 => avgpool2d_B1_branch_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exe12(GPOUT,32)
    out_c0_exe12 <= avgpool2d_B1_branch_out_c0_exe12;

    -- out_c0_exe17(GPOUT,33)
    out_c0_exe17 <= avgpool2d_B1_branch_out_c0_exe17;

    -- out_c0_exe23(GPOUT,34)
    out_c0_exe23 <= avgpool2d_B1_branch_out_c0_exe23;

    -- out_c0_exe35(GPOUT,35)
    out_c0_exe35 <= avgpool2d_B1_branch_out_c0_exe35;

    -- out_c0_exe46(GPOUT,36)
    out_c0_exe46 <= avgpool2d_B1_branch_out_c0_exe46;

    -- out_fpgaindvars_iv(GPOUT,37)
    out_fpgaindvars_iv <= avgpool2d_B1_branch_out_fpgaindvars_iv;

    -- out_global_id_09(GPOUT,38)
    out_global_id_09 <= avgpool2d_B1_branch_out_global_id_09;

    -- out_inc(GPOUT,39)
    out_inc <= avgpool2d_B1_branch_out_inc;

    -- out_stall_out_0(GPOUT,40)
    out_stall_out_0 <= avgpool2d_B1_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,41)
    out_stall_out_1 <= avgpool2d_B1_merge_out_stall_out_1;

    -- out_unnamed_avgpool2d0_avm_address(GPOUT,42)
    out_unnamed_avgpool2d0_avm_address <= bb_avgpool2d_B1_stall_region_out_unnamed_avgpool2d0_avm_address;

    -- out_unnamed_avgpool2d0_avm_burstcount(GPOUT,43)
    out_unnamed_avgpool2d0_avm_burstcount <= bb_avgpool2d_B1_stall_region_out_unnamed_avgpool2d0_avm_burstcount;

    -- out_unnamed_avgpool2d0_avm_byteenable(GPOUT,44)
    out_unnamed_avgpool2d0_avm_byteenable <= bb_avgpool2d_B1_stall_region_out_unnamed_avgpool2d0_avm_byteenable;

    -- out_unnamed_avgpool2d0_avm_enable(GPOUT,45)
    out_unnamed_avgpool2d0_avm_enable <= bb_avgpool2d_B1_stall_region_out_unnamed_avgpool2d0_avm_enable;

    -- out_unnamed_avgpool2d0_avm_read(GPOUT,46)
    out_unnamed_avgpool2d0_avm_read <= bb_avgpool2d_B1_stall_region_out_unnamed_avgpool2d0_avm_read;

    -- out_unnamed_avgpool2d0_avm_write(GPOUT,47)
    out_unnamed_avgpool2d0_avm_write <= bb_avgpool2d_B1_stall_region_out_unnamed_avgpool2d0_avm_write;

    -- out_unnamed_avgpool2d0_avm_writedata(GPOUT,48)
    out_unnamed_avgpool2d0_avm_writedata <= bb_avgpool2d_B1_stall_region_out_unnamed_avgpool2d0_avm_writedata;

    -- out_valid_out_0(GPOUT,49)
    out_valid_out_0 <= avgpool2d_B1_branch_out_valid_out_0;

    -- out_valid_out_1(GPOUT,50)
    out_valid_out_1 <= avgpool2d_B1_branch_out_valid_out_1;

END normal;
