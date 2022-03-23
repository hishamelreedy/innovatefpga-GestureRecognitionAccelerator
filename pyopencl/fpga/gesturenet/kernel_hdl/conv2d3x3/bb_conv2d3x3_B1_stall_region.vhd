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

-- VHDL created from bb_conv2d3x3_B1_stall_region
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

entity bb_conv2d3x3_B1_stall_region is
    port (
        in_pad : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe12 : in std_logic_vector(63 downto 0);  -- ufix64
        in_i_023 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_115 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im_addr_022 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_114 : in std_logic_vector(63 downto 0);  -- ufix64
        in_unnamed_conv2d3x31 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe12 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe1212 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe1218 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_i_023 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_115 : out std_logic_vector(31 downto 0);  -- ufix32
        out_output_im_addr_022 : out std_logic_vector(63 downto 0);  -- ufix64
        out_output_im_addr_114 : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_conv2d3x31 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stride : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_conv2d3x3_B1_stall_region;

architecture normal of bb_conv2d3x3_B1_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component conv2d3x3_B1_merge_reg is
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


    component i_sfc_c0_for_cond12_preheader_lr_ph_conv2d3x3_c0_enter208_conv2d3x3 is
        port (
            in_c0_eni1207_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni1207_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pad : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stride : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit211_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit211_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3 is
        port (
            in_c1_eni1213_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni1213_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pad : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stride : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit217_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit217_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit217_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit217_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit217_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit217_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit217_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit217_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component acl_data_fifo is
        generic (
            DEPTH : INTEGER := 0;
            DATA_WIDTH : INTEGER := 32;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0;
            IMPL : STRING := "ram"
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            data_in : in std_logic_vector(DATA_WIDTH - 1 downto 0);
            valid_out : out std_logic;
            stall_out : out std_logic;
            data_out : out std_logic_vector(DATA_WIDTH - 1 downto 0);
            full : out std_logic;
            almost_full : out std_logic
        );
    end component;






    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B1_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B1_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond12_preheader_lr_ph_conv2d3x3_c0_enter208_conv2d3x3_aunroll_x_out_c0_exit211_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond12_preheader_lr_ph_conv2d3x3_c0_enter208_conv2d3x3_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond12_preheader_lr_ph_conv2d3x3_c0_enter208_conv2d3x3_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_c1_exit217_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_c1_exit217_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_c1_exit217_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_c1_exit217_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_c1_exit217_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_c1_exit217_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_c1_exit217_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_conv2d3x3_B1_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (287 downto 0);
    signal bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_f : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_sfc_c0_for_cond12_preheader_lr_ph_conv2d3x3_c0_enter208_conv2d3x3_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond12_preheader_lr_ph_conv2d3x3_c0_enter208_conv2d3x3_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_q : STD_LOGIC_VECTOR (37 downto 0);
    signal bubble_select_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_d : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_e : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_f : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_g : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_h : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (287 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_D0 : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3(STALLENABLE,87)
    -- Valid signal propagation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_V0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_R_v_0;
    -- Stall signal propagation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_s_tv_0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_backStall and SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_R_v_0;
    -- Backward Enable generation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_backEN <= not (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_v_s_0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_backEN and SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_V;
    -- Backward Stall generation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_backStall <= not (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_backEN);
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_backEN = "0") THEN
                SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_R_v_0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_R_v_0 and SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_s_tv_0;
            ELSE
                SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_R_v_0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1(STALLENABLE,85)
    -- Valid signal propagation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_V0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_R_v_0;
    -- Stall signal propagation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_s_tv_0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_backStall and SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_R_v_0;
    -- Backward Enable generation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_backEN <= not (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_v_s_0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_backEN and SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_V;
    -- Backward Stall generation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_backStall <= not (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_backEN);
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_backEN = "0") THEN
                SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_R_v_0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_R_v_0 and SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_s_tv_0;
            ELSE
                SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_R_v_0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1(STALLENABLE,83)
    -- Valid signal propagation
    SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V0 <= SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_0;
    SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V1 <= SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_1;
    -- Stall signal propagation
    SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_backStall and SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_0;
    SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_1 <= i_sfc_c0_for_cond12_preheader_lr_ph_conv2d3x3_c0_enter208_conv2d3x3_aunroll_x_out_o_stall and SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_1;
    -- Backward Enable generation
    SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_or0 <= SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_0;
    SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN <= not (SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_1 or SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_or0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_v_s_0 <= SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN and SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V;
    -- Backward Stall generation
    SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backStall <= not (SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN);
    SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_0 <= (others => '0');
            SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN = "0") THEN
                SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_0 <= SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_0 and SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_0;
            ELSE
                SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_0 <= SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_v_s_0;
            END IF;

            IF (SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN = "0") THEN
                SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_1 <= SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_1 and SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_1;
            ELSE
                SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_1 <= SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_stall_entry(STALLENABLE,80)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= conv2d3x3_B1_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- SE_out_conv2d3x3_B1_merge_reg_aunroll_x(STALLENABLE,75)
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg1 <= (others => '0');
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg2 <= (others => '0');
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg3 <= (others => '0');
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg4 <= (others => '0');
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg5 <= (others => '0');
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg6 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg0 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg1 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg2 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg3 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg3;
            -- Succesor 4
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg4 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg4;
            -- Succesor 5
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg5 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg5;
            -- Succesor 6
            SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg6 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg6;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed0 <= (not (SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_backStall) and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg0;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed1 <= (not (i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_o_stall) and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg1;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed2 <= (not (redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_stall_out) and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg2;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed3 <= (not (redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_stall_out) and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg3;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed4 <= (not (redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_stall_out) and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg4;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed5 <= (not (redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_stall_out) and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg5;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed6 <= (not (redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_stall_out) and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg6;
    -- Consuming
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_StallValid <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_backStall and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg0 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed0;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg1 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed1;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg2 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed2;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg3 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed3;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg4 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed4;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg5 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed5;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_toReg6 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed6;
    -- Backward Stall generation
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or0 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed0;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or1 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed1 and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or0;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or2 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed2 and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or1;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or3 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed3 and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or2;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or4 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed4 and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or3;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or5 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed5 and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or4;
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireStall <= not (SE_out_conv2d3x3_B1_merge_reg_aunroll_x_consumed6 and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_or5);
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_backStall <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V0 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg0);
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V1 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg1);
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V2 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg2);
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V3 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg3);
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V4 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg4);
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V5 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg5);
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V6 <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B1_merge_reg_aunroll_x_fromReg6);
    -- Computing multiple Valid(s)
    SE_out_conv2d3x3_B1_merge_reg_aunroll_x_wireValid <= conv2d3x3_B1_merge_reg_aunroll_x_out_valid_out;

    -- bubble_join_stall_entry(BITJOIN,56)
    bubble_join_stall_entry_q <= in_unnamed_conv2d3x31 & in_output_im_addr_114 & in_output_im_addr_022 & in_j_115 & in_i_023 & in_c0_exe12;

    -- bubble_select_stall_entry(BITSELECT,57)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(95 downto 64));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(127 downto 96));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(191 downto 128));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(255 downto 192));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(287 downto 256));

    -- conv2d3x3_B1_merge_reg_aunroll_x(BLACKBOX,2)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_data_out_2@1
    -- out out_data_out_3@1
    -- out out_data_out_4@1
    -- out out_data_out_5@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    theconv2d3x3_B1_merge_reg_aunroll_x : conv2d3x3_B1_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_c,
        in_data_in_1 => bubble_select_stall_entry_e,
        in_data_in_2 => bubble_select_stall_entry_d,
        in_data_in_3 => bubble_select_stall_entry_f,
        in_data_in_4 => bubble_select_stall_entry_b,
        in_data_in_5 => bubble_select_stall_entry_g,
        in_stall_in => SE_out_conv2d3x3_B1_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3,
        out_data_out_4 => conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4,
        out_data_out_5 => conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5,
        out_stall_out => conv2d3x3_B1_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => conv2d3x3_B1_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_conv2d3x3_B1_merge_reg_aunroll_x(BITJOIN,45)
    bubble_join_conv2d3x3_B1_merge_reg_aunroll_x_q <= conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5 & conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4 & conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3 & conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2 & conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1 & conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_conv2d3x3_B1_merge_reg_aunroll_x(BITSELECT,46)
    bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B1_merge_reg_aunroll_x_q(31 downto 0));
    bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B1_merge_reg_aunroll_x_q(95 downto 32));
    bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B1_merge_reg_aunroll_x_q(127 downto 96));
    bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B1_merge_reg_aunroll_x_q(191 downto 128));
    bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B1_merge_reg_aunroll_x_q(255 downto 192));
    bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B1_merge_reg_aunroll_x_q(287 downto 256));

    -- redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0(REG,30)
    redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_backEN = "1") THEN
                redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_q <= STD_LOGIC_VECTOR(bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0(STALLENABLE,82)
    -- Valid signal propagation
    SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_V0 <= SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0;
    -- Stall signal propagation
    SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_s_tv_0 <= SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backStall and SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0;
    -- Backward Enable generation
    SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_backEN <= not (SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_v_s_0 <= SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_backEN and SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V0;
    -- Backward Stall generation
    SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_backStall <= not (SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_v_s_0);
    SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_backEN = "0") THEN
                SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0 <= SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0 and SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_s_tv_0;
            ELSE
                SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0 <= SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1(STALLREG,143)
    SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid <= (others => '0');
            SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid <= SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backStall and (SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid or SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_i_valid);

            IF (SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_data0 <= STD_LOGIC_VECTOR(redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_i_valid <= SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_V0;
    -- Stall signal propagation
    SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backStall <= SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid or not (SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_i_valid);

    -- Valid
    SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V <= SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid WHEN SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid = "1" ELSE SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_i_valid;

    SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_D0 <= SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_data0 WHEN SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid = "1" ELSE redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_0_q;

    -- redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1(REG,31)
    redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN = "1") THEN
                redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_q <= STD_LOGIC_VECTOR(SR_SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0(REG,32)
    redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_backEN = "1") THEN
                redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_q <= STD_LOGIC_VECTOR(redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0(STALLENABLE,84)
    -- Valid signal propagation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_V0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_R_v_0;
    -- Stall signal propagation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_s_tv_0 <= SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_backStall and SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_R_v_0;
    -- Backward Enable generation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_backEN <= not (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_v_s_0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_backEN and SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V0;
    -- Backward Stall generation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_backStall <= not (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_v_s_0);
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_backEN = "0") THEN
                SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_R_v_0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_R_v_0 and SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_s_tv_0;
            ELSE
                SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_R_v_0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1(STALLREG,144)
    SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_r_valid <= (others => '0');
            SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_r_valid <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_backStall and (SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_r_valid or SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_i_valid);

            IF (SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_r_data0 <= STD_LOGIC_VECTOR(redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_i_valid <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_V0;
    -- Stall signal propagation
    SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_backStall <= SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_r_valid or not (SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_i_valid);

    -- Valid
    SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_V <= SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_r_valid WHEN SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_r_valid = "1" ELSE SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_i_valid;

    SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_D0 <= SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_r_data0 WHEN SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_r_valid = "1" ELSE redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_0_q;

    -- redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1(REG,33)
    redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_backEN = "1") THEN
                redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_q <= STD_LOGIC_VECTOR(SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2(REG,34)
    redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_backEN = "1") THEN
                redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_q <= STD_LOGIC_VECTOR(redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2(STALLENABLE,86)
    -- Valid signal propagation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_V0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_R_v_0;
    -- Stall signal propagation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_s_tv_0 <= SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_backStall and SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_R_v_0;
    -- Backward Enable generation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_backEN <= not (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_v_s_0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_backEN and SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_1_V0;
    -- Backward Stall generation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_backStall <= not (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_v_s_0);
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_backEN = "0") THEN
                SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_R_v_0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_R_v_0 and SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_s_tv_0;
            ELSE
                SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_R_v_0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3(STALLREG,145)
    SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_r_valid <= (others => '0');
            SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_r_valid <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_backStall and (SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_r_valid or SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_i_valid);

            IF (SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_r_data0 <= STD_LOGIC_VECTOR(redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_i_valid <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_V0;
    -- Stall signal propagation
    SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_backStall <= SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_r_valid or not (SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_i_valid);

    -- Valid
    SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_V <= SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_r_valid WHEN SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_r_valid = "1" ELSE SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_i_valid;

    SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_D0 <= SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_r_data0 WHEN SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_r_valid = "1" ELSE redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_2_q;

    -- redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3(REG,35)
    redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_backEN = "1") THEN
                redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_q <= STD_LOGIC_VECTOR(SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4(REG,36)
    redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_backEN = "1") THEN
                redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_q <= STD_LOGIC_VECTOR(redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_q);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4(STALLENABLE,88)
    -- Valid signal propagation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_V0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_R_v_0;
    -- Stall signal propagation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_s_tv_0 <= SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_backStall and SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_R_v_0;
    -- Backward Enable generation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_backEN <= not (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_v_s_0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_backEN and SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_3_V0;
    -- Backward Stall generation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_backStall <= not (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_v_s_0);
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_backEN = "0") THEN
                SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_R_v_0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_R_v_0 and SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_s_tv_0;
            ELSE
                SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_R_v_0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5(STALLREG,146)
    SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_r_valid <= (others => '0');
            SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_r_valid <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_backStall and (SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_r_valid or SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_i_valid);

            IF (SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_r_data0 <= STD_LOGIC_VECTOR(redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_i_valid <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_V0;
    -- Stall signal propagation
    SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_backStall <= SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_r_valid or not (SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_i_valid);

    -- Valid
    SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_V <= SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_r_valid WHEN SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_r_valid = "1" ELSE SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_i_valid;

    SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_D0 <= SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_r_data0 WHEN SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_r_valid = "1" ELSE redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_4_q;

    -- SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5(STALLENABLE,89)
    -- Valid signal propagation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_V0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_R_v_0;
    -- Stall signal propagation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_s_tv_0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_backStall and SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_R_v_0;
    -- Backward Enable generation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_backEN <= not (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_v_s_0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_backEN and SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_V;
    -- Backward Stall generation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_backStall <= not (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_backEN);
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_backEN = "0") THEN
                SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_R_v_0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_R_v_0 and SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_s_tv_0;
            ELSE
                SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_R_v_0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6(STALLENABLE,90)
    -- Valid signal propagation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_V0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_R_v_0;
    -- Stall signal propagation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_s_tv_0 <= SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_backStall and SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_R_v_0;
    -- Backward Enable generation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_backEN <= not (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_v_s_0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_backEN and SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_V0;
    -- Backward Stall generation
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_backStall <= not (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_v_s_0);
    SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_backEN = "0") THEN
                SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_R_v_0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_R_v_0 and SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_s_tv_0;
            ELSE
                SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_R_v_0 <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c0_for_cond12_preheader_lr_ph_conv2d3x3_c0_enter208_conv2d3x3_aunroll_x(BLACKBOX,11)@3
    -- in in_i_stall@20000000
    -- out out_c0_exit211_0@10
    -- out out_c0_exit211_1@10
    -- out out_o_stall@20000000
    -- out out_o_valid@10
    thei_sfc_c0_for_cond12_preheader_lr_ph_conv2d3x3_c0_enter208_conv2d3x3_aunroll_x : i_sfc_c0_for_cond12_preheader_lr_ph_conv2d3x3_c0_enter208_conv2d3x3
    PORT MAP (
        in_c0_eni1207_0 => GND_q,
        in_c0_eni1207_1 => redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_q,
        in_i_stall => SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_backStall,
        in_i_valid => SE_redist0_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V1,
        in_pad => in_pad,
        in_stride => in_stride,
        out_c0_exit211_1 => i_sfc_c0_for_cond12_preheader_lr_ph_conv2d3x3_c0_enter208_conv2d3x3_aunroll_x_out_c0_exit211_1,
        out_o_stall => i_sfc_c0_for_cond12_preheader_lr_ph_conv2d3x3_c0_enter208_conv2d3x3_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_cond12_preheader_lr_ph_conv2d3x3_c0_enter208_conv2d3x3_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x(BLACKBOX,12)@1
    -- in in_i_stall@20000000
    -- out out_c1_exit217_0@10
    -- out out_c1_exit217_1@10
    -- out out_c1_exit217_2@10
    -- out out_c1_exit217_3@10
    -- out out_c1_exit217_4@10
    -- out out_c1_exit217_5@10
    -- out out_c1_exit217_6@10
    -- out out_c1_exit217_7@10
    -- out out_o_stall@20000000
    -- out out_o_valid@10
    thei_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x : i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3
    PORT MAP (
        in_c1_eni1213_0 => GND_q,
        in_c1_eni1213_1 => bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_d,
        in_i_stall => SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_backStall,
        in_i_valid => SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V1,
        in_input_size => in_input_size,
        in_pad => in_pad,
        in_stride => in_stride,
        out_c1_exit217_1 => i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_c1_exit217_1,
        out_c1_exit217_2 => i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_c1_exit217_2,
        out_c1_exit217_3 => i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_c1_exit217_3,
        out_c1_exit217_4 => i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_c1_exit217_4,
        out_c1_exit217_5 => i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_c1_exit217_5,
        out_c1_exit217_6 => i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_c1_exit217_6,
        out_c1_exit217_7 => i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_c1_exit217_7,
        out_o_stall => i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo(STALLFIFO,39)
    redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_valid_in <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V2;
    redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_stall_in <= SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_backStall;
    redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_data_in <= bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_c;
    redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_valid_in_bitsignaltemp <= redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_valid_in(0);
    redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_stall_in_bitsignaltemp <= redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_stall_in(0);
    redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_valid_out(0) <= redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_valid_out_bitsignaltemp;
    redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_stall_out(0) <= redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_stall_out_bitsignaltemp;
    theredist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 10,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_valid_in_bitsignaltemp,
        stall_in => redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_c,
        valid_out => redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_valid_out_bitsignaltemp,
        stall_out => redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_stall_out_bitsignaltemp,
        data_out => redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo(STALLFIFO,40)
    redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_valid_in <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V3;
    redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_stall_in <= SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_backStall;
    redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_data_in <= bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_d;
    redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_valid_in_bitsignaltemp <= redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_valid_in(0);
    redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_stall_in_bitsignaltemp <= redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_stall_in(0);
    redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_valid_out(0) <= redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_valid_out_bitsignaltemp;
    redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_stall_out(0) <= redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_stall_out_bitsignaltemp;
    theredist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 10,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_valid_in_bitsignaltemp,
        stall_in => redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_d,
        valid_out => redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_valid_out_bitsignaltemp,
        stall_out => redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_stall_out_bitsignaltemp,
        data_out => redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo(STALLFIFO,41)
    redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_valid_in <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V4;
    redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_stall_in <= SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_backStall;
    redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_data_in <= bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_e;
    redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_valid_in_bitsignaltemp <= redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_valid_in(0);
    redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_stall_in_bitsignaltemp <= redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_stall_in(0);
    redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_valid_out(0) <= redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_valid_out_bitsignaltemp;
    redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_stall_out(0) <= redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_stall_out_bitsignaltemp;
    theredist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 10,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_valid_in_bitsignaltemp,
        stall_in => redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_e,
        valid_out => redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_valid_out_bitsignaltemp,
        stall_out => redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_stall_out_bitsignaltemp,
        data_out => redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo(STALLFIFO,42)
    redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_valid_in <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V5;
    redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_stall_in <= SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_backStall;
    redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_data_in <= bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_f;
    redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_valid_in_bitsignaltemp <= redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_valid_in(0);
    redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_stall_in_bitsignaltemp <= redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_stall_in(0);
    redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_valid_out(0) <= redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_valid_out_bitsignaltemp;
    redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_stall_out(0) <= redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_stall_out_bitsignaltemp;
    theredist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 10,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_valid_in_bitsignaltemp,
        stall_in => redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_f,
        valid_out => redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_valid_out_bitsignaltemp,
        stall_out => redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_stall_out_bitsignaltemp,
        data_out => redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo(STALLFIFO,43)
    redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_valid_in <= SE_out_conv2d3x3_B1_merge_reg_aunroll_x_V6;
    redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_stall_in <= SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_backStall;
    redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_data_in <= bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_g;
    redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_valid_in_bitsignaltemp <= redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_valid_in(0);
    redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_stall_in_bitsignaltemp <= redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_stall_in(0);
    redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_valid_out(0) <= redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_valid_out_bitsignaltemp;
    redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_stall_out(0) <= redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_stall_out_bitsignaltemp;
    theredist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 10,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_valid_in_bitsignaltemp,
        stall_in => redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B1_merge_reg_aunroll_x_g,
        valid_out => redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_valid_out_bitsignaltemp,
        stall_out => redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_stall_out_bitsignaltemp,
        data_out => redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo(STALLENABLE,100)
    -- Valid signal propagation
    SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_V0 <= SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_backStall <= in_stall_in or not (SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_and0 <= redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_valid_out;
    SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_and1 <= redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_valid_out and SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_and0;
    SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_and2 <= redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_valid_out and SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_and1;
    SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_and3 <= redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_valid_out and SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_and2;
    SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_and4 <= redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_valid_out and SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_and3;
    SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_and5 <= i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_o_valid and SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_and4;
    SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_and6 <= i_sfc_c0_for_cond12_preheader_lr_ph_conv2d3x3_c0_enter208_conv2d3x3_aunroll_x_out_o_valid and SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_and5;
    SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_wireValid <= SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_V0 and SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_and6;

    -- bubble_join_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo(BITJOIN,72)
    bubble_join_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_q <= redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_data_out;

    -- bubble_select_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo(BITSELECT,73)
    bubble_select_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_q(31 downto 0));

    -- bubble_join_redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo(BITJOIN,66)
    bubble_join_redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_q <= redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_data_out;

    -- bubble_select_redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo(BITSELECT,67)
    bubble_select_redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_q(63 downto 0));

    -- bubble_join_redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo(BITJOIN,60)
    bubble_join_redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_q <= redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_data_out;

    -- bubble_select_redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo(BITSELECT,61)
    bubble_select_redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_q(63 downto 0));

    -- bubble_join_redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo(BITJOIN,63)
    bubble_join_redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_q <= redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_data_out;

    -- bubble_select_redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo(BITSELECT,64)
    bubble_select_redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_q(31 downto 0));

    -- redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5(REG,37)
    redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_backEN = "1") THEN
                redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_q <= STD_LOGIC_VECTOR(SR_SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6(REG,38)
    redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_backEN = "1") THEN
                redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_q <= STD_LOGIC_VECTOR(redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_5_q);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x(BITJOIN,52)
    bubble_join_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_q <= i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_c1_exit217_7 & i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_c1_exit217_6 & i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_c1_exit217_5 & i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_c1_exit217_4 & i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_c1_exit217_3 & i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_c1_exit217_2 & i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_out_c1_exit217_1;

    -- bubble_select_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x(BITSELECT,53)
    bubble_select_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_q(31 downto 0));
    bubble_select_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_q(32 downto 32));
    bubble_select_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_q(33 downto 33));
    bubble_select_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_q(34 downto 34));
    bubble_select_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_q(35 downto 35));
    bubble_select_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_q(36 downto 36));
    bubble_select_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_q(37 downto 37));

    -- bubble_join_i_sfc_c0_for_cond12_preheader_lr_ph_conv2d3x3_c0_enter208_conv2d3x3_aunroll_x(BITJOIN,48)
    bubble_join_i_sfc_c0_for_cond12_preheader_lr_ph_conv2d3x3_c0_enter208_conv2d3x3_aunroll_x_q <= i_sfc_c0_for_cond12_preheader_lr_ph_conv2d3x3_c0_enter208_conv2d3x3_aunroll_x_out_c0_exit211_1;

    -- bubble_select_i_sfc_c0_for_cond12_preheader_lr_ph_conv2d3x3_c0_enter208_conv2d3x3_aunroll_x(BITSELECT,49)
    bubble_select_i_sfc_c0_for_cond12_preheader_lr_ph_conv2d3x3_c0_enter208_conv2d3x3_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond12_preheader_lr_ph_conv2d3x3_c0_enter208_conv2d3x3_aunroll_x_q(31 downto 0));

    -- bubble_join_redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo(BITJOIN,69)
    bubble_join_redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_q <= redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_data_out;

    -- bubble_select_redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo(BITSELECT,70)
    bubble_select_redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_q(63 downto 0));

    -- dupName_0_sync_out_x(GPOUT,7)@10
    out_c0_exe12 <= bubble_select_redist5_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_4_9_fifo_b;
    out_c0_exe1212 <= bubble_select_i_sfc_c0_for_cond12_preheader_lr_ph_conv2d3x3_c0_enter208_conv2d3x3_aunroll_x_b;
    out_c1_exe1218 <= bubble_select_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_b;
    out_c1_exe2 <= bubble_select_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_c;
    out_c1_exe3 <= bubble_select_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_d;
    out_c1_exe4 <= bubble_select_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_e;
    out_c1_exe5 <= bubble_select_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_f;
    out_c1_exe6 <= bubble_select_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_g;
    out_c1_exe7 <= bubble_select_i_sfc_c1_for_cond12_preheader_lr_ph_conv2d3x3_c1_enter214_conv2d3x3_aunroll_x_h;
    out_i_023 <= redist1_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_0_9_6_q;
    out_j_115 <= bubble_select_redist3_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_2_9_fifo_b;
    out_output_im_addr_022 <= bubble_select_redist2_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_1_9_fifo_b;
    out_output_im_addr_114 <= bubble_select_redist4_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_3_9_fifo_b;
    out_unnamed_conv2d3x31 <= bubble_select_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_b;
    out_valid_out <= SE_out_redist6_conv2d3x3_B1_merge_reg_aunroll_x_out_data_out_5_9_fifo_V0;

    -- sync_out(GPOUT,22)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
