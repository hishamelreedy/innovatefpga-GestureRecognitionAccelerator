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

-- VHDL created from bb_conv2d3x3_B2
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

entity bb_conv2d3x3_B2 is
    port (
        out_c0_exit223_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit223_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit223_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit223_3 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit223_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit223_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit223_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit223_7 : out std_logic_vector(2 downto 0);  -- ufix3
        out_c0_exit223_8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit223_9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit223_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe121212 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe7 : out std_logic_vector(2 downto 0);  -- ufix3
        out_c0_exe8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe121813 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe1230 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c1_exe214 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe315 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe416 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe517 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe618 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe719 : out std_logic_vector(0 downto 0);  -- ufix1
        out_i_0235 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_1159 : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_filter_weight_load_0_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_memcoalesce_filter_weight_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_memcoalesce_filter_weight_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_filter_weight_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_filter_weight_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_filter_weight_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_filter_weight_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_memcoalesce_input_im_load_0_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_memcoalesce_input_im_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_memcoalesce_input_im_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_input_im_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_output_im_addr_0227 : out std_logic_vector(63 downto 0);  -- ufix64
        out_output_im_addr_11411 : out std_logic_vector(63 downto 0);  -- ufix64
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x32 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe11_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe11_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe121212_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe121212_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe121813_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe121813_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe214_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe214_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe315_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe315_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe416_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe416_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe517_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe517_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe618_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe618_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe719_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe719_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv_0 : in std_logic_vector(2 downto 0);  -- ufix3
        in_fpgaindvars_iv_1 : in std_logic_vector(2 downto 0);  -- ufix3
        in_i_0235_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_0235_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_1159_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_1159_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_210_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_210_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_37_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_37_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_memcoalesce_filter_weight_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_filter_weight_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_filter_weight_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_filter_weight_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_input_im_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_output_im_addr_0227_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_0227_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_11411_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_11411_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_pad : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stride : in std_logic_vector(31 downto 0);  -- ufix32
        in_tmp_36_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_tmp_36_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d3x32_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d3x32_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_conv2d3x3_B2;

architecture normal of bb_conv2d3x3_B2 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component conv2d3x3_B2_branch is
        port (
            in_c0_exit223_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit223_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit223_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit223_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit223_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit223_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit223_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit223_7 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_c0_exit223_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit223_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit223_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe11 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe121212 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe7 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_c0_exe8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe121813 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe1230 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_exe214 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe315 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe416 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe517 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe618 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe719 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_0235 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_1159 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im_addr_0227 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_11411 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x32 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit223_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit223_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit223_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit223_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit223_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit223_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit223_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit223_7 : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_c0_exit223_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit223_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit223_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe121212 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe7 : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_c0_exe8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe121813 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe1230 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c1_exe214 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe315 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe416 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe517 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe618 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe719 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_i_0235 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_1159 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_output_im_addr_0227 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_output_im_addr_11411 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x32 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d3x3_B2_stall_region is
        port (
            in_c0_exe11 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe121212 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe121813 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe214 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe315 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe416 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe517 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe618 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe719 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_i_0235 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_1159 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_210 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_37 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_output_im_addr_0227 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_11411 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_tmp_36 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d3x32 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit223_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit223_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit223_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit223_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit223_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit223_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit223_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit223_7 : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_c0_exit223_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit223_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit223_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe121212 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe7 : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_c0_exe8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe121813 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe1230 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c1_exe214 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe315 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe416 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe517 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe618 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe719 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_i_0235 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_1159 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_output_im_addr_0227 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_output_im_addr_11411 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x32 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component conv2d3x3_B2_merge is
        port (
            in_c0_exe11_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe11_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe121212_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe121212_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe121813_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe121813_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe214_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe214_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe315_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe315_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe416_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe416_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe517_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe517_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe618_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe618_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe719_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe719_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_0 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_1 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_i_0235_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_0235_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_1159_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_1159_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_210_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_210_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_37_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_37_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im_addr_0227_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_0227_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_11411_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_11411_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_tmp_36_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_tmp_36_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d3x32_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d3x32_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe121212 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe121813 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe214 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe315 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe416 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe517 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe618 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe719 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_fpgaindvars_iv : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_i_0235 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_1159 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_k_210 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_l_37 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_output_im_addr_0227 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_output_im_addr_11411 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_tmp_36 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_unnamed_conv2d3x32 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_7 : STD_LOGIC_VECTOR (2 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_c0_exe11 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_c0_exe121212 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_c0_exe7 : STD_LOGIC_VECTOR (2 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_c0_exe8 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_c0_exe9 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_c1_exe121813 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_c1_exe1230 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_c1_exe214 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_c1_exe315 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_c1_exe416 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_c1_exe517 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_c1_exe618 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_c1_exe719 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_i_0235 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_j_1159 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_output_im_addr_0227 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_output_im_addr_11411 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_unnamed_conv2d3x32 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_aunroll_x_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exit223_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exit223_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exit223_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exit223_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exit223_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exit223_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exit223_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exit223_7 : STD_LOGIC_VECTOR (2 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exit223_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exit223_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exit223_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exe10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exe11 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exe121212 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exe7 : STD_LOGIC_VECTOR (2 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exe8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c0_exe9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c1_exe121813 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c1_exe1230 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c1_exe214 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c1_exe315 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c1_exe416 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c1_exe517 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c1_exe618 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_c1_exe719 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_i_0235 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_j_1159 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_output_im_addr_0227 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_output_im_addr_11411 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_unnamed_conv2d3x32 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_c0_exe11 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B2_merge_out_c0_exe121212 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_out_c1_exe121813 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_out_c1_exe214 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_c1_exe315 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_c1_exe416 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_c1_exe517 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_c1_exe618 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_c1_exe719 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_fpgaindvars_iv : STD_LOGIC_VECTOR (2 downto 0);
    signal conv2d3x3_B2_merge_out_i_0235 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_out_j_1159 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_out_k_210 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_out_l_37 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_out_output_im_addr_0227 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B2_merge_out_output_im_addr_11411 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B2_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_out_tmp_36 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_out_unnamed_conv2d3x32 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- conv2d3x3_B2_merge(BLACKBOX,51)
    theconv2d3x3_B2_merge : conv2d3x3_B2_merge
    PORT MAP (
        in_c0_exe11_0 => in_c0_exe11_0,
        in_c0_exe11_1 => in_c0_exe11_1,
        in_c0_exe121212_0 => in_c0_exe121212_0,
        in_c0_exe121212_1 => in_c0_exe121212_1,
        in_c1_exe121813_0 => in_c1_exe121813_0,
        in_c1_exe121813_1 => in_c1_exe121813_1,
        in_c1_exe214_0 => in_c1_exe214_0,
        in_c1_exe214_1 => in_c1_exe214_1,
        in_c1_exe315_0 => in_c1_exe315_0,
        in_c1_exe315_1 => in_c1_exe315_1,
        in_c1_exe416_0 => in_c1_exe416_0,
        in_c1_exe416_1 => in_c1_exe416_1,
        in_c1_exe517_0 => in_c1_exe517_0,
        in_c1_exe517_1 => in_c1_exe517_1,
        in_c1_exe618_0 => in_c1_exe618_0,
        in_c1_exe618_1 => in_c1_exe618_1,
        in_c1_exe719_0 => in_c1_exe719_0,
        in_c1_exe719_1 => in_c1_exe719_1,
        in_fpgaindvars_iv_0 => in_fpgaindvars_iv_0,
        in_fpgaindvars_iv_1 => in_fpgaindvars_iv_1,
        in_i_0235_0 => in_i_0235_0,
        in_i_0235_1 => in_i_0235_1,
        in_j_1159_0 => in_j_1159_0,
        in_j_1159_1 => in_j_1159_1,
        in_k_210_0 => in_k_210_0,
        in_k_210_1 => in_k_210_1,
        in_l_37_0 => in_l_37_0,
        in_l_37_1 => in_l_37_1,
        in_output_im_addr_0227_0 => in_output_im_addr_0227_0,
        in_output_im_addr_0227_1 => in_output_im_addr_0227_1,
        in_output_im_addr_11411_0 => in_output_im_addr_11411_0,
        in_output_im_addr_11411_1 => in_output_im_addr_11411_1,
        in_stall_in => bb_conv2d3x3_B2_stall_region_out_stall_out,
        in_tmp_36_0 => in_tmp_36_0,
        in_tmp_36_1 => in_tmp_36_1,
        in_unnamed_conv2d3x32_0 => in_unnamed_conv2d3x32_0,
        in_unnamed_conv2d3x32_1 => in_unnamed_conv2d3x32_1,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_c0_exe11 => conv2d3x3_B2_merge_out_c0_exe11,
        out_c0_exe121212 => conv2d3x3_B2_merge_out_c0_exe121212,
        out_c1_exe121813 => conv2d3x3_B2_merge_out_c1_exe121813,
        out_c1_exe214 => conv2d3x3_B2_merge_out_c1_exe214,
        out_c1_exe315 => conv2d3x3_B2_merge_out_c1_exe315,
        out_c1_exe416 => conv2d3x3_B2_merge_out_c1_exe416,
        out_c1_exe517 => conv2d3x3_B2_merge_out_c1_exe517,
        out_c1_exe618 => conv2d3x3_B2_merge_out_c1_exe618,
        out_c1_exe719 => conv2d3x3_B2_merge_out_c1_exe719,
        out_fpgaindvars_iv => conv2d3x3_B2_merge_out_fpgaindvars_iv,
        out_i_0235 => conv2d3x3_B2_merge_out_i_0235,
        out_j_1159 => conv2d3x3_B2_merge_out_j_1159,
        out_k_210 => conv2d3x3_B2_merge_out_k_210,
        out_l_37 => conv2d3x3_B2_merge_out_l_37,
        out_output_im_addr_0227 => conv2d3x3_B2_merge_out_output_im_addr_0227,
        out_output_im_addr_11411 => conv2d3x3_B2_merge_out_output_im_addr_11411,
        out_stall_out_0 => conv2d3x3_B2_merge_out_stall_out_0,
        out_stall_out_1 => conv2d3x3_B2_merge_out_stall_out_1,
        out_tmp_36 => conv2d3x3_B2_merge_out_tmp_36,
        out_unnamed_conv2d3x32 => conv2d3x3_B2_merge_out_unnamed_conv2d3x32,
        out_valid_out => conv2d3x3_B2_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d3x3_B2_stall_region(BLACKBOX,50)
    thebb_conv2d3x3_B2_stall_region : bb_conv2d3x3_B2_stall_region
    PORT MAP (
        in_c0_exe11 => conv2d3x3_B2_merge_out_c0_exe11,
        in_c0_exe121212 => conv2d3x3_B2_merge_out_c0_exe121212,
        in_c1_exe121813 => conv2d3x3_B2_merge_out_c1_exe121813,
        in_c1_exe214 => conv2d3x3_B2_merge_out_c1_exe214,
        in_c1_exe315 => conv2d3x3_B2_merge_out_c1_exe315,
        in_c1_exe416 => conv2d3x3_B2_merge_out_c1_exe416,
        in_c1_exe517 => conv2d3x3_B2_merge_out_c1_exe517,
        in_c1_exe618 => conv2d3x3_B2_merge_out_c1_exe618,
        in_c1_exe719 => conv2d3x3_B2_merge_out_c1_exe719,
        in_filter_weight => in_filter_weight,
        in_flush => in_flush,
        in_fpgaindvars_iv => conv2d3x3_B2_merge_out_fpgaindvars_iv,
        in_i_0235 => conv2d3x3_B2_merge_out_i_0235,
        in_input_channels => in_input_channels,
        in_input_im => in_input_im,
        in_input_size => in_input_size,
        in_j_1159 => conv2d3x3_B2_merge_out_j_1159,
        in_k_210 => conv2d3x3_B2_merge_out_k_210,
        in_l_37 => conv2d3x3_B2_merge_out_l_37,
        in_memcoalesce_filter_weight_load_0_avm_readdata => in_memcoalesce_filter_weight_load_0_avm_readdata,
        in_memcoalesce_filter_weight_load_0_avm_readdatavalid => in_memcoalesce_filter_weight_load_0_avm_readdatavalid,
        in_memcoalesce_filter_weight_load_0_avm_waitrequest => in_memcoalesce_filter_weight_load_0_avm_waitrequest,
        in_memcoalesce_filter_weight_load_0_avm_writeack => in_memcoalesce_filter_weight_load_0_avm_writeack,
        in_memcoalesce_input_im_load_0_avm_readdata => in_memcoalesce_input_im_load_0_avm_readdata,
        in_memcoalesce_input_im_load_0_avm_readdatavalid => in_memcoalesce_input_im_load_0_avm_readdatavalid,
        in_memcoalesce_input_im_load_0_avm_waitrequest => in_memcoalesce_input_im_load_0_avm_waitrequest,
        in_memcoalesce_input_im_load_0_avm_writeack => in_memcoalesce_input_im_load_0_avm_writeack,
        in_output_im_addr_0227 => conv2d3x3_B2_merge_out_output_im_addr_0227,
        in_output_im_addr_11411 => conv2d3x3_B2_merge_out_output_im_addr_11411,
        in_output_size => in_output_size,
        in_stall_in => conv2d3x3_B2_branch_aunroll_x_out_stall_out,
        in_tmp_36 => conv2d3x3_B2_merge_out_tmp_36,
        in_unnamed_conv2d3x32 => conv2d3x3_B2_merge_out_unnamed_conv2d3x32,
        in_valid_in => conv2d3x3_B2_merge_out_valid_out,
        out_c0_exit223_0 => bb_conv2d3x3_B2_stall_region_out_c0_exit223_0,
        out_c0_exit223_1 => bb_conv2d3x3_B2_stall_region_out_c0_exit223_1,
        out_c0_exit223_2 => bb_conv2d3x3_B2_stall_region_out_c0_exit223_2,
        out_c0_exit223_3 => bb_conv2d3x3_B2_stall_region_out_c0_exit223_3,
        out_c0_exit223_4 => bb_conv2d3x3_B2_stall_region_out_c0_exit223_4,
        out_c0_exit223_5 => bb_conv2d3x3_B2_stall_region_out_c0_exit223_5,
        out_c0_exit223_6 => bb_conv2d3x3_B2_stall_region_out_c0_exit223_6,
        out_c0_exit223_7 => bb_conv2d3x3_B2_stall_region_out_c0_exit223_7,
        out_c0_exit223_8 => bb_conv2d3x3_B2_stall_region_out_c0_exit223_8,
        out_c0_exit223_9 => bb_conv2d3x3_B2_stall_region_out_c0_exit223_9,
        out_c0_exit223_10 => bb_conv2d3x3_B2_stall_region_out_c0_exit223_10,
        out_c0_exe10 => bb_conv2d3x3_B2_stall_region_out_c0_exe10,
        out_c0_exe11 => bb_conv2d3x3_B2_stall_region_out_c0_exe11,
        out_c0_exe121212 => bb_conv2d3x3_B2_stall_region_out_c0_exe121212,
        out_c0_exe7 => bb_conv2d3x3_B2_stall_region_out_c0_exe7,
        out_c0_exe8 => bb_conv2d3x3_B2_stall_region_out_c0_exe8,
        out_c0_exe9 => bb_conv2d3x3_B2_stall_region_out_c0_exe9,
        out_c1_exe121813 => bb_conv2d3x3_B2_stall_region_out_c1_exe121813,
        out_c1_exe1230 => bb_conv2d3x3_B2_stall_region_out_c1_exe1230,
        out_c1_exe214 => bb_conv2d3x3_B2_stall_region_out_c1_exe214,
        out_c1_exe315 => bb_conv2d3x3_B2_stall_region_out_c1_exe315,
        out_c1_exe416 => bb_conv2d3x3_B2_stall_region_out_c1_exe416,
        out_c1_exe517 => bb_conv2d3x3_B2_stall_region_out_c1_exe517,
        out_c1_exe618 => bb_conv2d3x3_B2_stall_region_out_c1_exe618,
        out_c1_exe719 => bb_conv2d3x3_B2_stall_region_out_c1_exe719,
        out_i_0235 => bb_conv2d3x3_B2_stall_region_out_i_0235,
        out_j_1159 => bb_conv2d3x3_B2_stall_region_out_j_1159,
        out_memcoalesce_filter_weight_load_0_avm_address => bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_address,
        out_memcoalesce_filter_weight_load_0_avm_burstcount => bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_burstcount,
        out_memcoalesce_filter_weight_load_0_avm_byteenable => bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_byteenable,
        out_memcoalesce_filter_weight_load_0_avm_enable => bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_enable,
        out_memcoalesce_filter_weight_load_0_avm_read => bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_read,
        out_memcoalesce_filter_weight_load_0_avm_write => bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_write,
        out_memcoalesce_filter_weight_load_0_avm_writedata => bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_writedata,
        out_memcoalesce_input_im_load_0_avm_address => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_address,
        out_memcoalesce_input_im_load_0_avm_burstcount => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_burstcount,
        out_memcoalesce_input_im_load_0_avm_byteenable => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_byteenable,
        out_memcoalesce_input_im_load_0_avm_enable => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_enable,
        out_memcoalesce_input_im_load_0_avm_read => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_read,
        out_memcoalesce_input_im_load_0_avm_write => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_write,
        out_memcoalesce_input_im_load_0_avm_writedata => bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_writedata,
        out_output_im_addr_0227 => bb_conv2d3x3_B2_stall_region_out_output_im_addr_0227,
        out_output_im_addr_11411 => bb_conv2d3x3_B2_stall_region_out_output_im_addr_11411,
        out_stall_out => bb_conv2d3x3_B2_stall_region_out_stall_out,
        out_unnamed_conv2d3x32 => bb_conv2d3x3_B2_stall_region_out_unnamed_conv2d3x32,
        out_valid_out => bb_conv2d3x3_B2_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- conv2d3x3_B2_branch_aunroll_x(BLACKBOX,2)
    theconv2d3x3_B2_branch_aunroll_x : conv2d3x3_B2_branch
    PORT MAP (
        in_c0_exit223_0 => bb_conv2d3x3_B2_stall_region_out_c0_exit223_0,
        in_c0_exit223_1 => bb_conv2d3x3_B2_stall_region_out_c0_exit223_1,
        in_c0_exit223_2 => bb_conv2d3x3_B2_stall_region_out_c0_exit223_2,
        in_c0_exit223_3 => bb_conv2d3x3_B2_stall_region_out_c0_exit223_3,
        in_c0_exit223_4 => bb_conv2d3x3_B2_stall_region_out_c0_exit223_4,
        in_c0_exit223_5 => bb_conv2d3x3_B2_stall_region_out_c0_exit223_5,
        in_c0_exit223_6 => bb_conv2d3x3_B2_stall_region_out_c0_exit223_6,
        in_c0_exit223_7 => bb_conv2d3x3_B2_stall_region_out_c0_exit223_7,
        in_c0_exit223_8 => bb_conv2d3x3_B2_stall_region_out_c0_exit223_8,
        in_c0_exit223_9 => bb_conv2d3x3_B2_stall_region_out_c0_exit223_9,
        in_c0_exit223_10 => bb_conv2d3x3_B2_stall_region_out_c0_exit223_10,
        in_c0_exe10 => bb_conv2d3x3_B2_stall_region_out_c0_exe10,
        in_c0_exe11 => bb_conv2d3x3_B2_stall_region_out_c0_exe11,
        in_c0_exe121212 => bb_conv2d3x3_B2_stall_region_out_c0_exe121212,
        in_c0_exe7 => bb_conv2d3x3_B2_stall_region_out_c0_exe7,
        in_c0_exe8 => bb_conv2d3x3_B2_stall_region_out_c0_exe8,
        in_c0_exe9 => bb_conv2d3x3_B2_stall_region_out_c0_exe9,
        in_c1_exe121813 => bb_conv2d3x3_B2_stall_region_out_c1_exe121813,
        in_c1_exe1230 => bb_conv2d3x3_B2_stall_region_out_c1_exe1230,
        in_c1_exe214 => bb_conv2d3x3_B2_stall_region_out_c1_exe214,
        in_c1_exe315 => bb_conv2d3x3_B2_stall_region_out_c1_exe315,
        in_c1_exe416 => bb_conv2d3x3_B2_stall_region_out_c1_exe416,
        in_c1_exe517 => bb_conv2d3x3_B2_stall_region_out_c1_exe517,
        in_c1_exe618 => bb_conv2d3x3_B2_stall_region_out_c1_exe618,
        in_c1_exe719 => bb_conv2d3x3_B2_stall_region_out_c1_exe719,
        in_i_0235 => bb_conv2d3x3_B2_stall_region_out_i_0235,
        in_j_1159 => bb_conv2d3x3_B2_stall_region_out_j_1159,
        in_output_im_addr_0227 => bb_conv2d3x3_B2_stall_region_out_output_im_addr_0227,
        in_output_im_addr_11411 => bb_conv2d3x3_B2_stall_region_out_output_im_addr_11411,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_unnamed_conv2d3x32 => bb_conv2d3x3_B2_stall_region_out_unnamed_conv2d3x32,
        in_valid_in => bb_conv2d3x3_B2_stall_region_out_valid_out,
        out_c0_exit223_0 => conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_0,
        out_c0_exit223_1 => conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_1,
        out_c0_exit223_2 => conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_2,
        out_c0_exit223_3 => conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_3,
        out_c0_exit223_4 => conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_4,
        out_c0_exit223_5 => conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_5,
        out_c0_exit223_6 => conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_6,
        out_c0_exit223_7 => conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_7,
        out_c0_exit223_8 => conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_8,
        out_c0_exit223_9 => conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_9,
        out_c0_exit223_10 => conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_10,
        out_c0_exe11 => conv2d3x3_B2_branch_aunroll_x_out_c0_exe11,
        out_c0_exe121212 => conv2d3x3_B2_branch_aunroll_x_out_c0_exe121212,
        out_c0_exe7 => conv2d3x3_B2_branch_aunroll_x_out_c0_exe7,
        out_c0_exe8 => conv2d3x3_B2_branch_aunroll_x_out_c0_exe8,
        out_c0_exe9 => conv2d3x3_B2_branch_aunroll_x_out_c0_exe9,
        out_c1_exe121813 => conv2d3x3_B2_branch_aunroll_x_out_c1_exe121813,
        out_c1_exe1230 => conv2d3x3_B2_branch_aunroll_x_out_c1_exe1230,
        out_c1_exe214 => conv2d3x3_B2_branch_aunroll_x_out_c1_exe214,
        out_c1_exe315 => conv2d3x3_B2_branch_aunroll_x_out_c1_exe315,
        out_c1_exe416 => conv2d3x3_B2_branch_aunroll_x_out_c1_exe416,
        out_c1_exe517 => conv2d3x3_B2_branch_aunroll_x_out_c1_exe517,
        out_c1_exe618 => conv2d3x3_B2_branch_aunroll_x_out_c1_exe618,
        out_c1_exe719 => conv2d3x3_B2_branch_aunroll_x_out_c1_exe719,
        out_i_0235 => conv2d3x3_B2_branch_aunroll_x_out_i_0235,
        out_j_1159 => conv2d3x3_B2_branch_aunroll_x_out_j_1159,
        out_output_im_addr_0227 => conv2d3x3_B2_branch_aunroll_x_out_output_im_addr_0227,
        out_output_im_addr_11411 => conv2d3x3_B2_branch_aunroll_x_out_output_im_addr_11411,
        out_stall_out => conv2d3x3_B2_branch_aunroll_x_out_stall_out,
        out_unnamed_conv2d3x32 => conv2d3x3_B2_branch_aunroll_x_out_unnamed_conv2d3x32,
        out_valid_out_0 => conv2d3x3_B2_branch_aunroll_x_out_valid_out_0,
        out_valid_out_1 => conv2d3x3_B2_branch_aunroll_x_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exit223_0(GPOUT,3)
    out_c0_exit223_0 <= conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_0;

    -- out_c0_exit223_1(GPOUT,4)
    out_c0_exit223_1 <= conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_1;

    -- out_c0_exit223_2(GPOUT,5)
    out_c0_exit223_2 <= conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_2;

    -- out_c0_exit223_3(GPOUT,6)
    out_c0_exit223_3 <= conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_3;

    -- out_c0_exit223_4(GPOUT,7)
    out_c0_exit223_4 <= conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_4;

    -- out_c0_exit223_5(GPOUT,8)
    out_c0_exit223_5 <= conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_5;

    -- out_c0_exit223_6(GPOUT,9)
    out_c0_exit223_6 <= conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_6;

    -- out_c0_exit223_7(GPOUT,10)
    out_c0_exit223_7 <= conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_7;

    -- out_c0_exit223_8(GPOUT,11)
    out_c0_exit223_8 <= conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_8;

    -- out_c0_exit223_9(GPOUT,12)
    out_c0_exit223_9 <= conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_9;

    -- out_c0_exit223_10(GPOUT,13)
    out_c0_exit223_10 <= conv2d3x3_B2_branch_aunroll_x_out_c0_exit223_10;

    -- out_c0_exe11(GPOUT,14)
    out_c0_exe11 <= conv2d3x3_B2_branch_aunroll_x_out_c0_exe11;

    -- out_c0_exe121212(GPOUT,15)
    out_c0_exe121212 <= conv2d3x3_B2_branch_aunroll_x_out_c0_exe121212;

    -- out_c0_exe7(GPOUT,16)
    out_c0_exe7 <= conv2d3x3_B2_branch_aunroll_x_out_c0_exe7;

    -- out_c0_exe8(GPOUT,17)
    out_c0_exe8 <= conv2d3x3_B2_branch_aunroll_x_out_c0_exe8;

    -- out_c0_exe9(GPOUT,18)
    out_c0_exe9 <= conv2d3x3_B2_branch_aunroll_x_out_c0_exe9;

    -- out_c1_exe121813(GPOUT,19)
    out_c1_exe121813 <= conv2d3x3_B2_branch_aunroll_x_out_c1_exe121813;

    -- out_c1_exe1230(GPOUT,20)
    out_c1_exe1230 <= conv2d3x3_B2_branch_aunroll_x_out_c1_exe1230;

    -- out_c1_exe214(GPOUT,21)
    out_c1_exe214 <= conv2d3x3_B2_branch_aunroll_x_out_c1_exe214;

    -- out_c1_exe315(GPOUT,22)
    out_c1_exe315 <= conv2d3x3_B2_branch_aunroll_x_out_c1_exe315;

    -- out_c1_exe416(GPOUT,23)
    out_c1_exe416 <= conv2d3x3_B2_branch_aunroll_x_out_c1_exe416;

    -- out_c1_exe517(GPOUT,24)
    out_c1_exe517 <= conv2d3x3_B2_branch_aunroll_x_out_c1_exe517;

    -- out_c1_exe618(GPOUT,25)
    out_c1_exe618 <= conv2d3x3_B2_branch_aunroll_x_out_c1_exe618;

    -- out_c1_exe719(GPOUT,26)
    out_c1_exe719 <= conv2d3x3_B2_branch_aunroll_x_out_c1_exe719;

    -- out_i_0235(GPOUT,27)
    out_i_0235 <= conv2d3x3_B2_branch_aunroll_x_out_i_0235;

    -- out_j_1159(GPOUT,28)
    out_j_1159 <= conv2d3x3_B2_branch_aunroll_x_out_j_1159;

    -- out_memcoalesce_filter_weight_load_0_avm_address(GPOUT,29)
    out_memcoalesce_filter_weight_load_0_avm_address <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_address;

    -- out_memcoalesce_filter_weight_load_0_avm_burstcount(GPOUT,30)
    out_memcoalesce_filter_weight_load_0_avm_burstcount <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_burstcount;

    -- out_memcoalesce_filter_weight_load_0_avm_byteenable(GPOUT,31)
    out_memcoalesce_filter_weight_load_0_avm_byteenable <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_byteenable;

    -- out_memcoalesce_filter_weight_load_0_avm_enable(GPOUT,32)
    out_memcoalesce_filter_weight_load_0_avm_enable <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_enable;

    -- out_memcoalesce_filter_weight_load_0_avm_read(GPOUT,33)
    out_memcoalesce_filter_weight_load_0_avm_read <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_read;

    -- out_memcoalesce_filter_weight_load_0_avm_write(GPOUT,34)
    out_memcoalesce_filter_weight_load_0_avm_write <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_write;

    -- out_memcoalesce_filter_weight_load_0_avm_writedata(GPOUT,35)
    out_memcoalesce_filter_weight_load_0_avm_writedata <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_writedata;

    -- out_memcoalesce_input_im_load_0_avm_address(GPOUT,36)
    out_memcoalesce_input_im_load_0_avm_address <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_address;

    -- out_memcoalesce_input_im_load_0_avm_burstcount(GPOUT,37)
    out_memcoalesce_input_im_load_0_avm_burstcount <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_burstcount;

    -- out_memcoalesce_input_im_load_0_avm_byteenable(GPOUT,38)
    out_memcoalesce_input_im_load_0_avm_byteenable <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_byteenable;

    -- out_memcoalesce_input_im_load_0_avm_enable(GPOUT,39)
    out_memcoalesce_input_im_load_0_avm_enable <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_enable;

    -- out_memcoalesce_input_im_load_0_avm_read(GPOUT,40)
    out_memcoalesce_input_im_load_0_avm_read <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_read;

    -- out_memcoalesce_input_im_load_0_avm_write(GPOUT,41)
    out_memcoalesce_input_im_load_0_avm_write <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_write;

    -- out_memcoalesce_input_im_load_0_avm_writedata(GPOUT,42)
    out_memcoalesce_input_im_load_0_avm_writedata <= bb_conv2d3x3_B2_stall_region_out_memcoalesce_input_im_load_0_avm_writedata;

    -- out_output_im_addr_0227(GPOUT,43)
    out_output_im_addr_0227 <= conv2d3x3_B2_branch_aunroll_x_out_output_im_addr_0227;

    -- out_output_im_addr_11411(GPOUT,44)
    out_output_im_addr_11411 <= conv2d3x3_B2_branch_aunroll_x_out_output_im_addr_11411;

    -- out_stall_out_0(GPOUT,45)
    out_stall_out_0 <= conv2d3x3_B2_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,46)
    out_stall_out_1 <= conv2d3x3_B2_merge_out_stall_out_1;

    -- out_unnamed_conv2d3x32(GPOUT,47)
    out_unnamed_conv2d3x32 <= conv2d3x3_B2_branch_aunroll_x_out_unnamed_conv2d3x32;

    -- out_valid_out_0(GPOUT,48)
    out_valid_out_0 <= conv2d3x3_B2_branch_aunroll_x_out_valid_out_0;

    -- out_valid_out_1(GPOUT,49)
    out_valid_out_1 <= conv2d3x3_B2_branch_aunroll_x_out_valid_out_1;

END normal;
