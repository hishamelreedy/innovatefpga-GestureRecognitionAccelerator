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

-- VHDL created from conv2d3x3_function
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

entity conv2d3x3_function is
    port (
        in_arg_filter_bias : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_output_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_pad : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_start_channel : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_stride : in std_logic_vector(31 downto 0);  -- ufix32
        in_memcoalesce_filter_weight_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_filter_weight_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_filter_weight_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_filter_weight_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_input_im_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_start : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x30_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d3x30_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x30_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x30_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x35_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d3x35_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x35_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x35_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
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
        out_o_active_unnamed_conv2d3x35 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x30_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_conv2d3x30_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_conv2d3x30_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d3x30_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x30_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x30_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x30_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_conv2d3x35_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_conv2d3x35_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_conv2d3x35_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d3x35_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x35_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x35_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x35_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end conv2d3x3_function;

architecture normal of conv2d3x3_function is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_conv2d3x3_B1_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d3x3_B1_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d3x3_B2 is
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
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_0 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_1 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_i_0235_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_0235_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_1159_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_1159_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_210_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_210_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_37_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_l_37_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_output_im_addr_0227_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_0227_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_11411_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_11411_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pad : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stride : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_tmp_36_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_tmp_36_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d3x32_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d3x32_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x32 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d3x3_B2_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d3x3_B2_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d3x3_B3 is
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
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_0234_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_1158_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im_addr_0226_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_11410_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pad : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stride : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x33_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d3x35_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x35_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x35_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x35_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe13 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe3256 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe4257 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe5258 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe6259 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_lsu_unnamed_conv2d3x35_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x33 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_unnamed_conv2d3x35_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x35_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x35_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x35_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x35_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x35_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x35_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d3x3_B3_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_13 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_i_data_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_17 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_13 : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_o_data_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_17 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d3x3_B4_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d3x3_B0 is
        port (
            in_filter_bias : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_global_id_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_lsu_unnamed_conv2d3x30_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pad : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_start_channel : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stride : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x30_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x30_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x30_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x30_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_unnamed_conv2d3x30_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x30_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d3x3_B1 is
        port (
            in_c0_exe12_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe12_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_023_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_023_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_115_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_115_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im_addr_022_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_022_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_114_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_114_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pad : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stride : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x31_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d3x31_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe1212 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe1218 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_i_023 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_115 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_output_im_addr_022 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_output_im_addr_114 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x31 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d3x3_B4 is
        port (
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component loop_limiter_conv2d3x30 is
        port (
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component loop_limiter_conv2d3x31 is
        port (
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_7 : STD_LOGIC_VECTOR (2 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_c0_exe11 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_c0_exe121212 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_c0_exe7 : STD_LOGIC_VECTOR (2 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_c0_exe8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_c0_exe9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_c1_exe121813 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_c1_exe1230 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_c1_exe214 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_c1_exe315 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_c1_exe416 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_c1_exe517 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_c1_exe618 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_c1_exe719 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_i_0235 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_j_1159 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_input_im_load_0_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_input_im_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_input_im_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_input_im_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_input_im_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_input_im_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_input_im_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_output_im_addr_0227 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_output_im_addr_11411 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_unnamed_conv2d3x32 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_aunroll_x_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (2 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (2 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_aunroll_x_out_c0_exe13 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B3_aunroll_x_out_c0_exe3256 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_aunroll_x_out_c0_exe4257 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B3_aunroll_x_out_c0_exe5258 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_aunroll_x_out_c0_exe6259 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B3_aunroll_x_out_lsu_unnamed_conv2d3x35_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_aunroll_x_out_unnamed_conv2d3x33 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_aunroll_x_out_unnamed_conv2d3x35_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_conv2d3x3_B3_aunroll_x_out_unnamed_conv2d3x35_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d3x3_B3_aunroll_x_out_unnamed_conv2d3x35_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_aunroll_x_out_unnamed_conv2d3x35_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_aunroll_x_out_unnamed_conv2d3x35_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_aunroll_x_out_unnamed_conv2d3x35_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_aunroll_x_out_unnamed_conv2d3x35_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d3x3_B3_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_aunroll_x_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (2 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B4_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B4_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_c_i32_0gr_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B0_out_c0_exe1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B0_out_c1_exe1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B0_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B0_out_unnamed_conv2d3x30 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d3x3_B0_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_c0_exe12 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B1_out_c0_exe1212 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_out_c1_exe1218 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_out_c1_exe2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_c1_exe3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_c1_exe4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_c1_exe5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_c1_exe6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_c1_exe7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_i_023 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_out_j_115 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_out_output_im_addr_022 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B1_out_output_im_addr_114 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d3x3_B1_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B1_out_unnamed_conv2d3x31 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d3x3_B1_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B4_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d3x3_B4_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i3_1gr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal loop_limiter_conv2d3x30_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_conv2d3x30_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_conv2d3x31_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_conv2d3x31_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- loop_limiter_conv2d3x31(BLACKBOX,56)
    theloop_limiter_conv2d3x31 : loop_limiter_conv2d3x31
    PORT MAP (
        in_i_stall => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_stall,
        in_i_valid => bb_conv2d3x3_B1_out_valid_out_0,
        in_i_valid_exit => bb_conv2d3x3_B2_aunroll_x_out_valid_out_0,
        out_o_stall => loop_limiter_conv2d3x31_out_o_stall,
        out_o_valid => loop_limiter_conv2d3x31_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- loop_limiter_conv2d3x30(BLACKBOX,55)
    theloop_limiter_conv2d3x30 : loop_limiter_conv2d3x30
    PORT MAP (
        in_i_stall => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_conv2d3x3_B4_sr_0_aunroll_x_out_o_stall,
        in_i_valid => bb_conv2d3x3_B0_out_valid_out_0,
        in_i_valid_exit => bb_conv2d3x3_B3_aunroll_x_out_valid_out_0,
        out_o_stall => loop_limiter_conv2d3x30_out_o_stall,
        out_o_valid => loop_limiter_conv2d3x30_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d3x3_B0(BLACKBOX,13)
    thebb_conv2d3x3_B0 : bb_conv2d3x3_B0
    PORT MAP (
        in_filter_bias => in_arg_filter_bias,
        in_filter_weight => in_arg_filter_weight,
        in_flush => in_start,
        in_global_id_0_0 => in_arg_global_id_0,
        in_input_channels => in_arg_input_channels,
        in_input_im => in_arg_input_im,
        in_input_size => in_arg_input_size,
        in_lsu_unnamed_conv2d3x30_sts_stream_size => in_arg_local_size_0,
        in_output_im => in_arg_output_im,
        in_output_size => in_arg_output_size,
        in_pad => in_arg_pad,
        in_stall_in_0 => loop_limiter_conv2d3x30_out_o_stall,
        in_start_channel => in_arg_start_channel,
        in_stream_reset => in_valid_in,
        in_stride => in_arg_stride,
        in_unnamed_conv2d3x30_avm_readdata => in_unnamed_conv2d3x30_avm_readdata,
        in_unnamed_conv2d3x30_avm_readdatavalid => in_unnamed_conv2d3x30_avm_readdatavalid,
        in_unnamed_conv2d3x30_avm_waitrequest => in_unnamed_conv2d3x30_avm_waitrequest,
        in_unnamed_conv2d3x30_avm_writeack => in_unnamed_conv2d3x30_avm_writeack,
        in_valid_in_0 => in_valid_in,
        out_c0_exe1 => bb_conv2d3x3_B0_out_c0_exe1,
        out_c1_exe1 => bb_conv2d3x3_B0_out_c1_exe1,
        out_stall_out_0 => bb_conv2d3x3_B0_out_stall_out_0,
        out_unnamed_conv2d3x30 => bb_conv2d3x3_B0_out_unnamed_conv2d3x30,
        out_unnamed_conv2d3x30_avm_address => bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_address,
        out_unnamed_conv2d3x30_avm_burstcount => bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_burstcount,
        out_unnamed_conv2d3x30_avm_byteenable => bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_byteenable,
        out_unnamed_conv2d3x30_avm_enable => bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_enable,
        out_unnamed_conv2d3x30_avm_read => bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_read,
        out_unnamed_conv2d3x30_avm_write => bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_write,
        out_unnamed_conv2d3x30_avm_writedata => bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_writedata,
        out_valid_out_0 => bb_conv2d3x3_B0_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_c_i32_0gr_x(CONSTANT,10)
    dupName_0_c_i32_0gr_x_q <= "00000000000000000000000000000000";

    -- bb_conv2d3x3_B1_sr_1_aunroll_x(BLACKBOX,3)
    thebb_conv2d3x3_B1_sr_1_aunroll_x : bb_conv2d3x3_B1_sr_1
    PORT MAP (
        in_i_data_0 => dupName_0_c_i32_0gr_x_q,
        in_i_data_1 => bb_conv2d3x3_B0_out_c1_exe1,
        in_i_data_2 => dupName_0_c_i32_0gr_x_q,
        in_i_data_3 => bb_conv2d3x3_B0_out_c1_exe1,
        in_i_data_4 => bb_conv2d3x3_B0_out_c0_exe1,
        in_i_data_5 => bb_conv2d3x3_B0_out_unnamed_conv2d3x30,
        in_i_stall => bb_conv2d3x3_B1_out_stall_out_1,
        in_i_valid => loop_limiter_conv2d3x30_out_o_valid,
        out_o_data_0 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_5,
        out_o_stall => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d3x3_B1(BLACKBOX,14)
    thebb_conv2d3x3_B1 : bb_conv2d3x3_B1
    PORT MAP (
        in_c0_exe12_0 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_4,
        in_c0_exe12_1 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_4,
        in_filter_weight => in_arg_filter_weight,
        in_i_023_0 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_0,
        in_i_023_1 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_0,
        in_input_channels => in_arg_input_channels,
        in_input_im => in_arg_input_im,
        in_input_size => in_arg_input_size,
        in_j_115_0 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_2,
        in_j_115_1 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_2,
        in_output_im_addr_022_0 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_1,
        in_output_im_addr_022_1 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_1,
        in_output_im_addr_114_0 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_3,
        in_output_im_addr_114_1 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_3,
        in_output_size => in_arg_output_size,
        in_pad => in_arg_pad,
        in_stall_in_0 => loop_limiter_conv2d3x31_out_o_stall,
        in_stride => in_arg_stride,
        in_unnamed_conv2d3x31_0 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_5,
        in_unnamed_conv2d3x31_1 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_data_5,
        in_valid_in_0 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_valid,
        in_valid_in_1 => bb_conv2d3x3_B1_sr_1_aunroll_x_out_o_valid,
        out_c0_exe12 => bb_conv2d3x3_B1_out_c0_exe12,
        out_c0_exe1212 => bb_conv2d3x3_B1_out_c0_exe1212,
        out_c1_exe1218 => bb_conv2d3x3_B1_out_c1_exe1218,
        out_c1_exe2 => bb_conv2d3x3_B1_out_c1_exe2,
        out_c1_exe3 => bb_conv2d3x3_B1_out_c1_exe3,
        out_c1_exe4 => bb_conv2d3x3_B1_out_c1_exe4,
        out_c1_exe5 => bb_conv2d3x3_B1_out_c1_exe5,
        out_c1_exe6 => bb_conv2d3x3_B1_out_c1_exe6,
        out_c1_exe7 => bb_conv2d3x3_B1_out_c1_exe7,
        out_i_023 => bb_conv2d3x3_B1_out_i_023,
        out_j_115 => bb_conv2d3x3_B1_out_j_115,
        out_output_im_addr_022 => bb_conv2d3x3_B1_out_output_im_addr_022,
        out_output_im_addr_114 => bb_conv2d3x3_B1_out_output_im_addr_114,
        out_stall_out_0 => bb_conv2d3x3_B1_out_stall_out_0,
        out_stall_out_1 => bb_conv2d3x3_B1_out_stall_out_1,
        out_unnamed_conv2d3x31 => bb_conv2d3x3_B1_out_unnamed_conv2d3x31,
        out_valid_out_0 => bb_conv2d3x3_B1_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d3x3_B1_sr_0_aunroll_x(BLACKBOX,2)
    thebb_conv2d3x3_B1_sr_0_aunroll_x : bb_conv2d3x3_B1_sr_0
    PORT MAP (
        in_i_data_0 => bb_conv2d3x3_B3_aunroll_x_out_c0_exe5258,
        in_i_data_1 => bb_conv2d3x3_B3_aunroll_x_out_c0_exe6259,
        in_i_data_2 => bb_conv2d3x3_B3_aunroll_x_out_c0_exe3256,
        in_i_data_3 => bb_conv2d3x3_B3_aunroll_x_out_c0_exe4257,
        in_i_data_4 => bb_conv2d3x3_B3_aunroll_x_out_c0_exe13,
        in_i_data_5 => bb_conv2d3x3_B3_aunroll_x_out_unnamed_conv2d3x33,
        in_i_stall => bb_conv2d3x3_B1_out_stall_out_0,
        in_i_valid => bb_conv2d3x3_B3_aunroll_x_out_valid_out_1,
        out_o_data_0 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_data_5,
        out_o_stall => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d3x3_B4(BLACKBOX,15)
    thebb_conv2d3x3_B4 : bb_conv2d3x3_B4
    PORT MAP (
        in_stall_in_0 => in_stall_in,
        in_valid_in_0 => bb_conv2d3x3_B4_sr_0_aunroll_x_out_o_valid,
        out_stall_out_0 => bb_conv2d3x3_B4_out_stall_out_0,
        out_valid_out_0 => bb_conv2d3x3_B4_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- bb_conv2d3x3_B4_sr_0_aunroll_x(BLACKBOX,9)
    thebb_conv2d3x3_B4_sr_0_aunroll_x : bb_conv2d3x3_B4_sr_0
    PORT MAP (
        in_i_data_0 => GND_q,
        in_i_stall => bb_conv2d3x3_B4_out_stall_out_0,
        in_i_valid => bb_conv2d3x3_B3_aunroll_x_out_valid_out_0,
        out_o_stall => bb_conv2d3x3_B4_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_conv2d3x3_B4_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d3x3_B3_aunroll_x(BLACKBOX,7)
    thebb_conv2d3x3_B3_aunroll_x : bb_conv2d3x3_B3
    PORT MAP (
        in_c0_exit22320_0_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_6,
        in_c0_exit22320_0_1 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_7,
        in_c0_exit22320_0_2 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_8,
        in_c0_exit22320_0_3 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_9,
        in_c0_exit22320_0_4 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_10,
        in_c0_exit22320_0_5 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_11,
        in_c0_exit22320_0_6 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_12,
        in_c0_exit22320_0_7 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_13,
        in_c0_exit22320_0_8 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_14,
        in_c0_exit22320_0_9 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_15,
        in_c0_exit22320_0_10 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_16,
        in_c0_exe13_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_0,
        in_c1_exe123021_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_17,
        in_filter_weight => in_arg_filter_weight,
        in_flush => in_start,
        in_i_0234_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_2,
        in_input_channels => in_arg_input_channels,
        in_input_im => in_arg_input_im,
        in_input_size => in_arg_input_size,
        in_j_1158_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_4,
        in_output_im_addr_0226_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_3,
        in_output_im_addr_11410_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_5,
        in_output_size => in_arg_output_size,
        in_pad => in_arg_pad,
        in_stall_in_0 => bb_conv2d3x3_B4_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => bb_conv2d3x3_B1_sr_0_aunroll_x_out_o_stall,
        in_stride => in_arg_stride,
        in_unnamed_conv2d3x33_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_1,
        in_unnamed_conv2d3x35_avm_readdata => in_unnamed_conv2d3x35_avm_readdata,
        in_unnamed_conv2d3x35_avm_readdatavalid => in_unnamed_conv2d3x35_avm_readdatavalid,
        in_unnamed_conv2d3x35_avm_waitrequest => in_unnamed_conv2d3x35_avm_waitrequest,
        in_unnamed_conv2d3x35_avm_writeack => in_unnamed_conv2d3x35_avm_writeack,
        in_valid_in_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_valid,
        out_c0_exe13 => bb_conv2d3x3_B3_aunroll_x_out_c0_exe13,
        out_c0_exe3256 => bb_conv2d3x3_B3_aunroll_x_out_c0_exe3256,
        out_c0_exe4257 => bb_conv2d3x3_B3_aunroll_x_out_c0_exe4257,
        out_c0_exe5258 => bb_conv2d3x3_B3_aunroll_x_out_c0_exe5258,
        out_c0_exe6259 => bb_conv2d3x3_B3_aunroll_x_out_c0_exe6259,
        out_lsu_unnamed_conv2d3x35_o_active => bb_conv2d3x3_B3_aunroll_x_out_lsu_unnamed_conv2d3x35_o_active,
        out_stall_out_0 => bb_conv2d3x3_B3_aunroll_x_out_stall_out_0,
        out_unnamed_conv2d3x33 => bb_conv2d3x3_B3_aunroll_x_out_unnamed_conv2d3x33,
        out_unnamed_conv2d3x35_avm_address => bb_conv2d3x3_B3_aunroll_x_out_unnamed_conv2d3x35_avm_address,
        out_unnamed_conv2d3x35_avm_burstcount => bb_conv2d3x3_B3_aunroll_x_out_unnamed_conv2d3x35_avm_burstcount,
        out_unnamed_conv2d3x35_avm_byteenable => bb_conv2d3x3_B3_aunroll_x_out_unnamed_conv2d3x35_avm_byteenable,
        out_unnamed_conv2d3x35_avm_enable => bb_conv2d3x3_B3_aunroll_x_out_unnamed_conv2d3x35_avm_enable,
        out_unnamed_conv2d3x35_avm_read => bb_conv2d3x3_B3_aunroll_x_out_unnamed_conv2d3x35_avm_read,
        out_unnamed_conv2d3x35_avm_write => bb_conv2d3x3_B3_aunroll_x_out_unnamed_conv2d3x35_avm_write,
        out_unnamed_conv2d3x35_avm_writedata => bb_conv2d3x3_B3_aunroll_x_out_unnamed_conv2d3x35_avm_writedata,
        out_valid_out_0 => bb_conv2d3x3_B3_aunroll_x_out_valid_out_0,
        out_valid_out_1 => bb_conv2d3x3_B3_aunroll_x_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d3x3_B3_sr_0_aunroll_x(BLACKBOX,8)
    thebb_conv2d3x3_B3_sr_0_aunroll_x : bb_conv2d3x3_B3_sr_0
    PORT MAP (
        in_i_data_0 => bb_conv2d3x3_B2_aunroll_x_out_c0_exe11,
        in_i_data_1 => bb_conv2d3x3_B2_aunroll_x_out_unnamed_conv2d3x32,
        in_i_data_2 => bb_conv2d3x3_B2_aunroll_x_out_i_0235,
        in_i_data_3 => bb_conv2d3x3_B2_aunroll_x_out_output_im_addr_0227,
        in_i_data_4 => bb_conv2d3x3_B2_aunroll_x_out_j_1159,
        in_i_data_5 => bb_conv2d3x3_B2_aunroll_x_out_output_im_addr_11411,
        in_i_data_6 => bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_0,
        in_i_data_7 => bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_1,
        in_i_data_8 => bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_2,
        in_i_data_9 => bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_3,
        in_i_data_10 => bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_4,
        in_i_data_11 => bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_5,
        in_i_data_12 => bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_6,
        in_i_data_13 => bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_7,
        in_i_data_14 => bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_8,
        in_i_data_15 => bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_9,
        in_i_data_16 => bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_10,
        in_i_data_17 => bb_conv2d3x3_B2_aunroll_x_out_c1_exe1230,
        in_i_stall => bb_conv2d3x3_B3_aunroll_x_out_stall_out_0,
        in_i_valid => bb_conv2d3x3_B2_aunroll_x_out_valid_out_0,
        out_o_data_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_data_17,
        out_o_stall => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- c_i3_1gr(CONSTANT,18)
    c_i3_1gr_q <= "001";

    -- bb_conv2d3x3_B2_sr_1_aunroll_x(BLACKBOX,6)
    thebb_conv2d3x3_B2_sr_1_aunroll_x : bb_conv2d3x3_B2_sr_1
    PORT MAP (
        in_i_data_0 => dupName_0_c_i32_0gr_x_q,
        in_i_data_1 => c_i3_1gr_q,
        in_i_data_2 => dupName_0_c_i32_0gr_x_q,
        in_i_data_3 => bb_conv2d3x3_B1_out_unnamed_conv2d3x31,
        in_i_data_4 => bb_conv2d3x3_B1_out_c0_exe12,
        in_i_data_5 => bb_conv2d3x3_B1_out_unnamed_conv2d3x31,
        in_i_data_6 => bb_conv2d3x3_B1_out_i_023,
        in_i_data_7 => bb_conv2d3x3_B1_out_output_im_addr_022,
        in_i_data_8 => bb_conv2d3x3_B1_out_j_115,
        in_i_data_9 => bb_conv2d3x3_B1_out_output_im_addr_114,
        in_i_data_10 => bb_conv2d3x3_B1_out_c0_exe1212,
        in_i_data_11 => bb_conv2d3x3_B1_out_c1_exe1218,
        in_i_data_12 => bb_conv2d3x3_B1_out_c1_exe2,
        in_i_data_13 => bb_conv2d3x3_B1_out_c1_exe3,
        in_i_data_14 => bb_conv2d3x3_B1_out_c1_exe4,
        in_i_data_15 => bb_conv2d3x3_B1_out_c1_exe5,
        in_i_data_16 => bb_conv2d3x3_B1_out_c1_exe6,
        in_i_data_17 => bb_conv2d3x3_B1_out_c1_exe7,
        in_i_stall => bb_conv2d3x3_B2_aunroll_x_out_stall_out_1,
        in_i_valid => loop_limiter_conv2d3x31_out_o_valid,
        out_o_data_0 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_17,
        out_o_stall => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d3x3_B2_sr_0_aunroll_x(BLACKBOX,5)
    thebb_conv2d3x3_B2_sr_0_aunroll_x : bb_conv2d3x3_B2_sr_0
    PORT MAP (
        in_i_data_0 => bb_conv2d3x3_B2_aunroll_x_out_c0_exe9,
        in_i_data_1 => bb_conv2d3x3_B2_aunroll_x_out_c0_exe7,
        in_i_data_2 => bb_conv2d3x3_B2_aunroll_x_out_c0_exe8,
        in_i_data_3 => bb_conv2d3x3_B2_aunroll_x_out_c1_exe1230,
        in_i_data_4 => bb_conv2d3x3_B2_aunroll_x_out_c0_exe11,
        in_i_data_5 => bb_conv2d3x3_B2_aunroll_x_out_unnamed_conv2d3x32,
        in_i_data_6 => bb_conv2d3x3_B2_aunroll_x_out_i_0235,
        in_i_data_7 => bb_conv2d3x3_B2_aunroll_x_out_output_im_addr_0227,
        in_i_data_8 => bb_conv2d3x3_B2_aunroll_x_out_j_1159,
        in_i_data_9 => bb_conv2d3x3_B2_aunroll_x_out_output_im_addr_11411,
        in_i_data_10 => bb_conv2d3x3_B2_aunroll_x_out_c0_exe121212,
        in_i_data_11 => bb_conv2d3x3_B2_aunroll_x_out_c1_exe121813,
        in_i_data_12 => bb_conv2d3x3_B2_aunroll_x_out_c1_exe214,
        in_i_data_13 => bb_conv2d3x3_B2_aunroll_x_out_c1_exe315,
        in_i_data_14 => bb_conv2d3x3_B2_aunroll_x_out_c1_exe416,
        in_i_data_15 => bb_conv2d3x3_B2_aunroll_x_out_c1_exe517,
        in_i_data_16 => bb_conv2d3x3_B2_aunroll_x_out_c1_exe618,
        in_i_data_17 => bb_conv2d3x3_B2_aunroll_x_out_c1_exe719,
        in_i_stall => bb_conv2d3x3_B2_aunroll_x_out_stall_out_0,
        in_i_valid => bb_conv2d3x3_B2_aunroll_x_out_valid_out_1,
        out_o_data_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_17,
        out_o_stall => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d3x3_B2_aunroll_x(BLACKBOX,4)
    thebb_conv2d3x3_B2_aunroll_x : bb_conv2d3x3_B2
    PORT MAP (
        in_c0_exe11_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_4,
        in_c0_exe11_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_4,
        in_c0_exe121212_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_10,
        in_c0_exe121212_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_10,
        in_c1_exe121813_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_11,
        in_c1_exe121813_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_11,
        in_c1_exe214_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_12,
        in_c1_exe214_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_12,
        in_c1_exe315_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_13,
        in_c1_exe315_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_13,
        in_c1_exe416_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_14,
        in_c1_exe416_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_14,
        in_c1_exe517_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_15,
        in_c1_exe517_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_15,
        in_c1_exe618_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_16,
        in_c1_exe618_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_16,
        in_c1_exe719_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_17,
        in_c1_exe719_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_17,
        in_filter_weight => in_arg_filter_weight,
        in_flush => in_start,
        in_fpgaindvars_iv_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_1,
        in_fpgaindvars_iv_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_1,
        in_i_0235_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_6,
        in_i_0235_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_6,
        in_input_channels => in_arg_input_channels,
        in_input_im => in_arg_input_im,
        in_input_size => in_arg_input_size,
        in_j_1159_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_8,
        in_j_1159_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_8,
        in_k_210_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_0,
        in_k_210_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_0,
        in_l_37_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_2,
        in_l_37_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_2,
        in_memcoalesce_filter_weight_load_0_avm_readdata => in_memcoalesce_filter_weight_load_0_avm_readdata,
        in_memcoalesce_filter_weight_load_0_avm_readdatavalid => in_memcoalesce_filter_weight_load_0_avm_readdatavalid,
        in_memcoalesce_filter_weight_load_0_avm_waitrequest => in_memcoalesce_filter_weight_load_0_avm_waitrequest,
        in_memcoalesce_filter_weight_load_0_avm_writeack => in_memcoalesce_filter_weight_load_0_avm_writeack,
        in_memcoalesce_input_im_load_0_avm_readdata => in_memcoalesce_input_im_load_0_avm_readdata,
        in_memcoalesce_input_im_load_0_avm_readdatavalid => in_memcoalesce_input_im_load_0_avm_readdatavalid,
        in_memcoalesce_input_im_load_0_avm_waitrequest => in_memcoalesce_input_im_load_0_avm_waitrequest,
        in_memcoalesce_input_im_load_0_avm_writeack => in_memcoalesce_input_im_load_0_avm_writeack,
        in_output_im_addr_0227_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_7,
        in_output_im_addr_0227_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_7,
        in_output_im_addr_11411_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_9,
        in_output_im_addr_11411_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_9,
        in_output_size => in_arg_output_size,
        in_pad => in_arg_pad,
        in_stall_in_0 => bb_conv2d3x3_B3_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_stall,
        in_stride => in_arg_stride,
        in_tmp_36_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_3,
        in_tmp_36_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_3,
        in_unnamed_conv2d3x32_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_data_5,
        in_unnamed_conv2d3x32_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_data_5,
        in_valid_in_0 => bb_conv2d3x3_B2_sr_0_aunroll_x_out_o_valid,
        in_valid_in_1 => bb_conv2d3x3_B2_sr_1_aunroll_x_out_o_valid,
        out_c0_exit223_0 => bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_0,
        out_c0_exit223_1 => bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_1,
        out_c0_exit223_2 => bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_2,
        out_c0_exit223_3 => bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_3,
        out_c0_exit223_4 => bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_4,
        out_c0_exit223_5 => bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_5,
        out_c0_exit223_6 => bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_6,
        out_c0_exit223_7 => bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_7,
        out_c0_exit223_8 => bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_8,
        out_c0_exit223_9 => bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_9,
        out_c0_exit223_10 => bb_conv2d3x3_B2_aunroll_x_out_c0_exit223_10,
        out_c0_exe11 => bb_conv2d3x3_B2_aunroll_x_out_c0_exe11,
        out_c0_exe121212 => bb_conv2d3x3_B2_aunroll_x_out_c0_exe121212,
        out_c0_exe7 => bb_conv2d3x3_B2_aunroll_x_out_c0_exe7,
        out_c0_exe8 => bb_conv2d3x3_B2_aunroll_x_out_c0_exe8,
        out_c0_exe9 => bb_conv2d3x3_B2_aunroll_x_out_c0_exe9,
        out_c1_exe121813 => bb_conv2d3x3_B2_aunroll_x_out_c1_exe121813,
        out_c1_exe1230 => bb_conv2d3x3_B2_aunroll_x_out_c1_exe1230,
        out_c1_exe214 => bb_conv2d3x3_B2_aunroll_x_out_c1_exe214,
        out_c1_exe315 => bb_conv2d3x3_B2_aunroll_x_out_c1_exe315,
        out_c1_exe416 => bb_conv2d3x3_B2_aunroll_x_out_c1_exe416,
        out_c1_exe517 => bb_conv2d3x3_B2_aunroll_x_out_c1_exe517,
        out_c1_exe618 => bb_conv2d3x3_B2_aunroll_x_out_c1_exe618,
        out_c1_exe719 => bb_conv2d3x3_B2_aunroll_x_out_c1_exe719,
        out_i_0235 => bb_conv2d3x3_B2_aunroll_x_out_i_0235,
        out_j_1159 => bb_conv2d3x3_B2_aunroll_x_out_j_1159,
        out_memcoalesce_filter_weight_load_0_avm_address => bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_address,
        out_memcoalesce_filter_weight_load_0_avm_burstcount => bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_burstcount,
        out_memcoalesce_filter_weight_load_0_avm_byteenable => bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_byteenable,
        out_memcoalesce_filter_weight_load_0_avm_enable => bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_enable,
        out_memcoalesce_filter_weight_load_0_avm_read => bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_read,
        out_memcoalesce_filter_weight_load_0_avm_write => bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_write,
        out_memcoalesce_filter_weight_load_0_avm_writedata => bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_writedata,
        out_memcoalesce_input_im_load_0_avm_address => bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_input_im_load_0_avm_address,
        out_memcoalesce_input_im_load_0_avm_burstcount => bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_input_im_load_0_avm_burstcount,
        out_memcoalesce_input_im_load_0_avm_byteenable => bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_input_im_load_0_avm_byteenable,
        out_memcoalesce_input_im_load_0_avm_enable => bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_input_im_load_0_avm_enable,
        out_memcoalesce_input_im_load_0_avm_read => bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_input_im_load_0_avm_read,
        out_memcoalesce_input_im_load_0_avm_write => bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_input_im_load_0_avm_write,
        out_memcoalesce_input_im_load_0_avm_writedata => bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_input_im_load_0_avm_writedata,
        out_output_im_addr_0227 => bb_conv2d3x3_B2_aunroll_x_out_output_im_addr_0227,
        out_output_im_addr_11411 => bb_conv2d3x3_B2_aunroll_x_out_output_im_addr_11411,
        out_stall_out_0 => bb_conv2d3x3_B2_aunroll_x_out_stall_out_0,
        out_stall_out_1 => bb_conv2d3x3_B2_aunroll_x_out_stall_out_1,
        out_unnamed_conv2d3x32 => bb_conv2d3x3_B2_aunroll_x_out_unnamed_conv2d3x32,
        out_valid_out_0 => bb_conv2d3x3_B2_aunroll_x_out_valid_out_0,
        out_valid_out_1 => bb_conv2d3x3_B2_aunroll_x_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_memcoalesce_filter_weight_load_0_avm_address(GPOUT,57)
    out_memcoalesce_filter_weight_load_0_avm_address <= bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_address;

    -- out_memcoalesce_filter_weight_load_0_avm_burstcount(GPOUT,58)
    out_memcoalesce_filter_weight_load_0_avm_burstcount <= bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_burstcount;

    -- out_memcoalesce_filter_weight_load_0_avm_byteenable(GPOUT,59)
    out_memcoalesce_filter_weight_load_0_avm_byteenable <= bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_byteenable;

    -- out_memcoalesce_filter_weight_load_0_avm_enable(GPOUT,60)
    out_memcoalesce_filter_weight_load_0_avm_enable <= bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_enable;

    -- out_memcoalesce_filter_weight_load_0_avm_read(GPOUT,61)
    out_memcoalesce_filter_weight_load_0_avm_read <= bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_read;

    -- out_memcoalesce_filter_weight_load_0_avm_write(GPOUT,62)
    out_memcoalesce_filter_weight_load_0_avm_write <= bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_write;

    -- out_memcoalesce_filter_weight_load_0_avm_writedata(GPOUT,63)
    out_memcoalesce_filter_weight_load_0_avm_writedata <= bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_writedata;

    -- out_memcoalesce_input_im_load_0_avm_address(GPOUT,64)
    out_memcoalesce_input_im_load_0_avm_address <= bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_input_im_load_0_avm_address;

    -- out_memcoalesce_input_im_load_0_avm_burstcount(GPOUT,65)
    out_memcoalesce_input_im_load_0_avm_burstcount <= bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_input_im_load_0_avm_burstcount;

    -- out_memcoalesce_input_im_load_0_avm_byteenable(GPOUT,66)
    out_memcoalesce_input_im_load_0_avm_byteenable <= bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_input_im_load_0_avm_byteenable;

    -- out_memcoalesce_input_im_load_0_avm_enable(GPOUT,67)
    out_memcoalesce_input_im_load_0_avm_enable <= bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_input_im_load_0_avm_enable;

    -- out_memcoalesce_input_im_load_0_avm_read(GPOUT,68)
    out_memcoalesce_input_im_load_0_avm_read <= bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_input_im_load_0_avm_read;

    -- out_memcoalesce_input_im_load_0_avm_write(GPOUT,69)
    out_memcoalesce_input_im_load_0_avm_write <= bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_input_im_load_0_avm_write;

    -- out_memcoalesce_input_im_load_0_avm_writedata(GPOUT,70)
    out_memcoalesce_input_im_load_0_avm_writedata <= bb_conv2d3x3_B2_aunroll_x_out_memcoalesce_input_im_load_0_avm_writedata;

    -- out_o_active_unnamed_conv2d3x35(GPOUT,71)
    out_o_active_unnamed_conv2d3x35 <= bb_conv2d3x3_B3_aunroll_x_out_lsu_unnamed_conv2d3x35_o_active;

    -- out_stall_out(GPOUT,72)
    out_stall_out <= bb_conv2d3x3_B0_out_stall_out_0;

    -- out_unnamed_conv2d3x30_avm_address(GPOUT,73)
    out_unnamed_conv2d3x30_avm_address <= bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_address;

    -- out_unnamed_conv2d3x30_avm_burstcount(GPOUT,74)
    out_unnamed_conv2d3x30_avm_burstcount <= bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_burstcount;

    -- out_unnamed_conv2d3x30_avm_byteenable(GPOUT,75)
    out_unnamed_conv2d3x30_avm_byteenable <= bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_byteenable;

    -- out_unnamed_conv2d3x30_avm_enable(GPOUT,76)
    out_unnamed_conv2d3x30_avm_enable <= bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_enable;

    -- out_unnamed_conv2d3x30_avm_read(GPOUT,77)
    out_unnamed_conv2d3x30_avm_read <= bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_read;

    -- out_unnamed_conv2d3x30_avm_write(GPOUT,78)
    out_unnamed_conv2d3x30_avm_write <= bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_write;

    -- out_unnamed_conv2d3x30_avm_writedata(GPOUT,79)
    out_unnamed_conv2d3x30_avm_writedata <= bb_conv2d3x3_B0_out_unnamed_conv2d3x30_avm_writedata;

    -- out_unnamed_conv2d3x35_avm_address(GPOUT,80)
    out_unnamed_conv2d3x35_avm_address <= bb_conv2d3x3_B3_aunroll_x_out_unnamed_conv2d3x35_avm_address;

    -- out_unnamed_conv2d3x35_avm_burstcount(GPOUT,81)
    out_unnamed_conv2d3x35_avm_burstcount <= bb_conv2d3x3_B3_aunroll_x_out_unnamed_conv2d3x35_avm_burstcount;

    -- out_unnamed_conv2d3x35_avm_byteenable(GPOUT,82)
    out_unnamed_conv2d3x35_avm_byteenable <= bb_conv2d3x3_B3_aunroll_x_out_unnamed_conv2d3x35_avm_byteenable;

    -- out_unnamed_conv2d3x35_avm_enable(GPOUT,83)
    out_unnamed_conv2d3x35_avm_enable <= bb_conv2d3x3_B3_aunroll_x_out_unnamed_conv2d3x35_avm_enable;

    -- out_unnamed_conv2d3x35_avm_read(GPOUT,84)
    out_unnamed_conv2d3x35_avm_read <= bb_conv2d3x3_B3_aunroll_x_out_unnamed_conv2d3x35_avm_read;

    -- out_unnamed_conv2d3x35_avm_write(GPOUT,85)
    out_unnamed_conv2d3x35_avm_write <= bb_conv2d3x3_B3_aunroll_x_out_unnamed_conv2d3x35_avm_write;

    -- out_unnamed_conv2d3x35_avm_writedata(GPOUT,86)
    out_unnamed_conv2d3x35_avm_writedata <= bb_conv2d3x3_B3_aunroll_x_out_unnamed_conv2d3x35_avm_writedata;

    -- out_valid_out(GPOUT,87)
    out_valid_out <= bb_conv2d3x3_B4_out_valid_out_0;

END normal;
