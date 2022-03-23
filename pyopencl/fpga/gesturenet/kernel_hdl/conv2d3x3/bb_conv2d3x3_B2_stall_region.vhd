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

-- VHDL created from bb_conv2d3x3_B2_stall_region
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

entity bb_conv2d3x3_B2_stall_region is
    port (
        out_c0_exe10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe121212 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe7 : out std_logic_vector(2 downto 0);  -- ufix3
        out_c0_exe8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe9 : out std_logic_vector(31 downto 0);  -- ufix32
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
        out_output_im_addr_0227 : out std_logic_vector(63 downto 0);  -- ufix64
        out_output_im_addr_11411 : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_conv2d3x32 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_filter_weight_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_filter_weight_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_filter_weight_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_filter_weight_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_filter_weight_load_0_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_memcoalesce_filter_weight_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_filter_weight_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_filter_weight_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_filter_weight_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_memcoalesce_filter_weight_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_filter_weight_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe11 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe121212 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe121813 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe214 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe315 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe416 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe517 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe618 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe719 : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv : in std_logic_vector(2 downto 0);  -- ufix3
        in_i_0235 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_1159 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_210 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_37 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im_addr_0227 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_11411 : in std_logic_vector(63 downto 0);  -- ufix64
        in_tmp_36 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d3x32 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_memcoalesce_input_im_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_input_im_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_memcoalesce_input_im_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_memcoalesce_input_im_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_input_im_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_conv2d3x3_B2_stall_region;

architecture normal of bb_conv2d3x3_B2_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component conv2d3x3_B2_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_data_in_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_data_in_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_7 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_9 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_data_out_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_data_out_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_7 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_9 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_memcoalesce_filter_weight_load_0_conv2d3x385 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata_0 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_memcoalesce_input_im_load_0_conv2d3x382 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata_0 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3 is
        port (
            in_c0_eni11_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni11_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni11_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni11_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni11_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni11_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni11_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni11_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni11_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni11_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni11_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni11_11 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
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
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3x3 is
        port (
            in_c1_eni6_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni6_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni6_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni6_3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni6_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni6_5 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni6_6 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni6_7 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni6_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni6_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni6_10 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni6_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni6_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit229_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit229_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_filter_weight_sync_buffer_conv2d3x350 is
        port (
            in_buffer_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
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
































    component acl_valid_fifo_counter is
        generic (
            DEPTH : INTEGER := 0;
            ASYNC_RESET : INTEGER := 1;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            valid_out : out std_logic;
            stall_out : out std_logic;
            full : out std_logic
        );
    end component;




    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_add58_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul56_add124_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (2 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_idxprom60_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_readdata_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_readdata_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_readdata_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_readdata_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7 : STD_LOGIC_VECTOR (2 downto 0);
    signal i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3x3_aunroll_x_out_c1_exit229_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3x3_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3x3_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_add58_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add58_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add58_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add58_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_ptr_sum_conv2d3x3_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr_sum_conv2d3x3_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr_sum_conv2d3x3_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr_sum_conv2d3x3_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_mul56_add124_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul56_add124_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul56_add124_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul56_add124_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul57_add186_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul57_add186_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul57_add186_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul57_add186_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_syncbuf_filter_weight_sync_buffer_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_filter_weight_sync_buffer_conv2d3x3_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_filter_weight_sync_buffer_conv2d3x3_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_conv2d3x352_vt_const_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_unnamed_conv2d3x352_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_conv2d3x352_vt_select_31_b : STD_LOGIC_VECTOR (28 downto 0);
    signal i_unnamed_conv2d3x354_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_conv2d3x354_vt_select_31_b : STD_LOGIC_VECTOR (30 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal leftShiftStage0Idx1Pad2_uid104_i_unnamed_conv2d3x353_shift_x_q : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0Idx1Rng2_uid105_i_unnamed_conv2d3x353_shift_x_in : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage0Idx1Rng2_uid105_i_unnamed_conv2d3x353_shift_x_b : STD_LOGIC_VECTOR (29 downto 0);
    signal leftShiftStage0Idx1_uid106_i_unnamed_conv2d3x353_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid108_i_unnamed_conv2d3x353_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid108_i_unnamed_conv2d3x353_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1Idx1Rng1_uid110_i_unnamed_conv2d3x353_shift_x_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx1Rng1_uid110_i_unnamed_conv2d3x353_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage1Idx1_uid111_i_unnamed_conv2d3x353_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage1_uid113_i_unnamed_conv2d3x353_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage1_uid113_i_unnamed_conv2d3x353_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx1Rng1_uid119_i_unnamed_conv2d3x355_shift_x_in : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage0Idx1Rng1_uid119_i_unnamed_conv2d3x355_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal leftShiftStage0Idx1_uid120_i_unnamed_conv2d3x355_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0_uid122_i_unnamed_conv2d3x355_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid122_i_unnamed_conv2d3x355_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_data_in : STD_LOGIC_VECTOR (2 downto 0);
    signal redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_data_out : STD_LOGIC_VECTOR (2 downto 0);
    signal redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist32_bgTrunc_i_mul56_add124_conv2d3x3_sel_x_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (456 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (2 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_f : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_i : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_k : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_l : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_m : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_n : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_o : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_p : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_r : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_q : STD_LOGIC_VECTOR (137 downto 0);
    signal bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_d : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_e : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_f : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_g : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_h : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_i : STD_LOGIC_VECTOR (2 downto 0);
    signal bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_k : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_l : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_sfc_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3x3_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3x3_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (456 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_h : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_i : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_j : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_k : STD_LOGIC_VECTOR (2 downto 0);
    signal bubble_select_stall_entry_l : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_m : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_n : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_o : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_p : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_r : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_s : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_q : STD_LOGIC_VECTOR (2 downto 0);
    signal bubble_select_redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_b : STD_LOGIC_VECTOR (2 downto 0);
    signal bubble_join_redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and17 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and18 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and19 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and20 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and21 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and22 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and23 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and24 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_data_in : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_data_out : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_data_in : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_data_out : STD_LOGIC_VECTOR (127 downto 0);
    signal SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_D0 : STD_LOGIC_VECTOR (63 downto 0);

begin


    -- leftShiftStage1Idx1Rng1_uid110_i_unnamed_conv2d3x353_shift_x(BITSELECT,109)@1
    leftShiftStage1Idx1Rng1_uid110_i_unnamed_conv2d3x353_shift_x_in <= leftShiftStage0_uid108_i_unnamed_conv2d3x353_shift_x_q(30 downto 0);
    leftShiftStage1Idx1Rng1_uid110_i_unnamed_conv2d3x353_shift_x_b <= leftShiftStage1Idx1Rng1_uid110_i_unnamed_conv2d3x353_shift_x_in(30 downto 0);

    -- leftShiftStage1Idx1_uid111_i_unnamed_conv2d3x353_shift_x(BITJOIN,110)@1
    leftShiftStage1Idx1_uid111_i_unnamed_conv2d3x353_shift_x_q <= leftShiftStage1Idx1Rng1_uid110_i_unnamed_conv2d3x353_shift_x_b & GND_q;

    -- leftShiftStage0Idx1Rng2_uid105_i_unnamed_conv2d3x353_shift_x(BITSELECT,104)@1
    leftShiftStage0Idx1Rng2_uid105_i_unnamed_conv2d3x353_shift_x_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_b(29 downto 0);
    leftShiftStage0Idx1Rng2_uid105_i_unnamed_conv2d3x353_shift_x_b <= leftShiftStage0Idx1Rng2_uid105_i_unnamed_conv2d3x353_shift_x_in(29 downto 0);

    -- leftShiftStage0Idx1Pad2_uid104_i_unnamed_conv2d3x353_shift_x(CONSTANT,103)
    leftShiftStage0Idx1Pad2_uid104_i_unnamed_conv2d3x353_shift_x_q <= "00";

    -- leftShiftStage0Idx1_uid106_i_unnamed_conv2d3x353_shift_x(BITJOIN,105)@1
    leftShiftStage0Idx1_uid106_i_unnamed_conv2d3x353_shift_x_q <= leftShiftStage0Idx1Rng2_uid105_i_unnamed_conv2d3x353_shift_x_b & leftShiftStage0Idx1Pad2_uid104_i_unnamed_conv2d3x353_shift_x_q;

    -- leftShiftStage0_uid108_i_unnamed_conv2d3x353_shift_x(MUX,107)@1
    leftShiftStage0_uid108_i_unnamed_conv2d3x353_shift_x_s <= VCC_q;
    leftShiftStage0_uid108_i_unnamed_conv2d3x353_shift_x_combproc: PROCESS (leftShiftStage0_uid108_i_unnamed_conv2d3x353_shift_x_s, bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_b, leftShiftStage0Idx1_uid106_i_unnamed_conv2d3x353_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid108_i_unnamed_conv2d3x353_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid108_i_unnamed_conv2d3x353_shift_x_q <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_b;
            WHEN "1" => leftShiftStage0_uid108_i_unnamed_conv2d3x353_shift_x_q <= leftShiftStage0Idx1_uid106_i_unnamed_conv2d3x353_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid108_i_unnamed_conv2d3x353_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- leftShiftStage1_uid113_i_unnamed_conv2d3x353_shift_x(MUX,112)@1
    leftShiftStage1_uid113_i_unnamed_conv2d3x353_shift_x_s <= VCC_q;
    leftShiftStage1_uid113_i_unnamed_conv2d3x353_shift_x_combproc: PROCESS (leftShiftStage1_uid113_i_unnamed_conv2d3x353_shift_x_s, leftShiftStage0_uid108_i_unnamed_conv2d3x353_shift_x_q, leftShiftStage1Idx1_uid111_i_unnamed_conv2d3x353_shift_x_q)
    BEGIN
        CASE (leftShiftStage1_uid113_i_unnamed_conv2d3x353_shift_x_s) IS
            WHEN "0" => leftShiftStage1_uid113_i_unnamed_conv2d3x353_shift_x_q <= leftShiftStage0_uid108_i_unnamed_conv2d3x353_shift_x_q;
            WHEN "1" => leftShiftStage1_uid113_i_unnamed_conv2d3x353_shift_x_q <= leftShiftStage1Idx1_uid111_i_unnamed_conv2d3x353_shift_x_q;
            WHEN OTHERS => leftShiftStage1_uid113_i_unnamed_conv2d3x353_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_unnamed_conv2d3x352_vt_select_31(BITSELECT,70)@1
    i_unnamed_conv2d3x352_vt_select_31_b <= leftShiftStage1_uid113_i_unnamed_conv2d3x353_shift_x_q(31 downto 3);

    -- i_unnamed_conv2d3x352_vt_const_2(CONSTANT,68)
    i_unnamed_conv2d3x352_vt_const_2_q <= "000";

    -- i_unnamed_conv2d3x352_vt_join(BITJOIN,69)@1
    i_unnamed_conv2d3x352_vt_join_q <= i_unnamed_conv2d3x352_vt_select_31_b & i_unnamed_conv2d3x352_vt_const_2_q;

    -- i_mul56_add124_conv2d3x3(ADD,65)@1
    i_mul56_add124_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_b);
    i_mul56_add124_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & i_unnamed_conv2d3x352_vt_join_q);
    i_mul56_add124_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_mul56_add124_conv2d3x3_a) + UNSIGNED(i_mul56_add124_conv2d3x3_b));
    i_mul56_add124_conv2d3x3_q <= i_mul56_add124_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_mul56_add124_conv2d3x3_sel_x(BITSELECT,5)@1
    bgTrunc_i_mul56_add124_conv2d3x3_sel_x_b <= i_mul56_add124_conv2d3x3_q(31 downto 0);

    -- redist32_bgTrunc_i_mul56_add124_conv2d3x3_sel_x_b_1_0(REG,200)
    redist32_bgTrunc_i_mul56_add124_conv2d3x3_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist32_bgTrunc_i_mul56_add124_conv2d3x3_sel_x_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_backEN = "1") THEN
                redist32_bgTrunc_i_mul56_add124_conv2d3x3_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(bgTrunc_i_mul56_add124_conv2d3x3_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- leftShiftStage0Idx1Rng1_uid119_i_unnamed_conv2d3x355_shift_x(BITSELECT,118)@1
    leftShiftStage0Idx1Rng1_uid119_i_unnamed_conv2d3x355_shift_x_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_d(30 downto 0);
    leftShiftStage0Idx1Rng1_uid119_i_unnamed_conv2d3x355_shift_x_b <= leftShiftStage0Idx1Rng1_uid119_i_unnamed_conv2d3x355_shift_x_in(30 downto 0);

    -- leftShiftStage0Idx1_uid120_i_unnamed_conv2d3x355_shift_x(BITJOIN,119)@1
    leftShiftStage0Idx1_uid120_i_unnamed_conv2d3x355_shift_x_q <= leftShiftStage0Idx1Rng1_uid119_i_unnamed_conv2d3x355_shift_x_b & GND_q;

    -- leftShiftStage0_uid122_i_unnamed_conv2d3x355_shift_x(MUX,121)@1
    leftShiftStage0_uid122_i_unnamed_conv2d3x355_shift_x_s <= VCC_q;
    leftShiftStage0_uid122_i_unnamed_conv2d3x355_shift_x_combproc: PROCESS (leftShiftStage0_uid122_i_unnamed_conv2d3x355_shift_x_s, bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_d, leftShiftStage0Idx1_uid120_i_unnamed_conv2d3x355_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid122_i_unnamed_conv2d3x355_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid122_i_unnamed_conv2d3x355_shift_x_q <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_d;
            WHEN "1" => leftShiftStage0_uid122_i_unnamed_conv2d3x355_shift_x_q <= leftShiftStage0Idx1_uid120_i_unnamed_conv2d3x355_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid122_i_unnamed_conv2d3x355_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_unnamed_conv2d3x354_vt_select_31(BITSELECT,73)@1
    i_unnamed_conv2d3x354_vt_select_31_b <= leftShiftStage0_uid122_i_unnamed_conv2d3x355_shift_x_q(31 downto 1);

    -- i_unnamed_conv2d3x354_vt_join(BITJOIN,72)@1
    i_unnamed_conv2d3x354_vt_join_q <= i_unnamed_conv2d3x354_vt_select_31_b & GND_q;

    -- i_mul57_add186_conv2d3x3(ADD,66)@1
    i_mul57_add186_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_d);
    i_mul57_add186_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & i_unnamed_conv2d3x354_vt_join_q);
    i_mul57_add186_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_mul57_add186_conv2d3x3_a) + UNSIGNED(i_mul57_add186_conv2d3x3_b));
    i_mul57_add186_conv2d3x3_q <= i_mul57_add186_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_mul57_add186_conv2d3x3_sel_x(BITSELECT,6)@1
    bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b <= i_mul57_add186_conv2d3x3_q(31 downto 0);

    -- redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0(REG,199)
    redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_backEN = "1") THEN
                redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- i_add58_conv2d3x3(ADD,60)@2
    i_add58_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_q);
    i_add58_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & redist32_bgTrunc_i_mul56_add124_conv2d3x3_sel_x_b_1_0_q);
    i_add58_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add58_conv2d3x3_a) + UNSIGNED(i_add58_conv2d3x3_b));
    i_add58_conv2d3x3_q <= i_add58_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_add58_conv2d3x3_sel_x(BITSELECT,3)@2
    bgTrunc_i_add58_conv2d3x3_sel_x_b <= i_add58_conv2d3x3_q(31 downto 0);

    -- bubble_join_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo(BITJOIN,273)
    bubble_join_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_q <= redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_data_out;

    -- bubble_select_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo(BITSELECT,274)
    bubble_select_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_q(63 downto 0));

    -- bubble_join_redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo(BITJOIN,318)
    bubble_join_redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_q <= redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_data_out;

    -- bubble_select_redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo(BITSELECT,319)
    bubble_select_redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_q(31 downto 0));

    -- i_idxprom60_conv2d3x3_sel_x(BITSELECT,36)@13
    i_idxprom60_conv2d3x3_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(bubble_select_redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_b(31 downto 0)), 64)));

    -- i_add_ptr_sum_conv2d3x3(ADD,61)@13
    i_add_ptr_sum_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & i_idxprom60_conv2d3x3_sel_x_b);
    i_add_ptr_sum_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & bubble_select_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_b);
    i_add_ptr_sum_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_ptr_sum_conv2d3x3_a) + UNSIGNED(i_add_ptr_sum_conv2d3x3_b));
    i_add_ptr_sum_conv2d3x3_q <= i_add_ptr_sum_conv2d3x3_o(64 downto 0);

    -- bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x(BITSELECT,4)@13
    bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b <= i_add_ptr_sum_conv2d3x3_q(63 downto 0);

    -- SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x(STALLENABLE,332)
    -- Valid signal propagation
    SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_V0 <= SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_backStall <= bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_stall_out or not (SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_wireValid <= i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_valid;

    -- i_arrayidx61_conv2d3x3_conv2d3x384_mult_multconst_x(CONSTANT,30)
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0(REG,201)
    redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_backEN = "1") THEN
                redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_bs1_merged_bit_select(BITSELECT,132)@14
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_bs1_merged_bit_select_b <= redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_q(17 downto 0);
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_bs1_merged_bit_select_c <= redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_q(63 downto 54);
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_bs1_merged_bit_select_d <= redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_q(35 downto 18);
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_bs1_merged_bit_select_e <= redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_q(53 downto 36);

    -- i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im3_shift0(BITSHIFT,129)@14
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im3_shift0_qint <= i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im3_shift0_q <= i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_align_15(BITSHIFT,97)@14
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_align_15_q <= i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im6_shift0(BITSHIFT,130)@14
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im6_shift0_qint <= i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im6_shift0_q <= i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_align_14(BITSHIFT,96)@14
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_align_14_q <= i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_join_16(BITJOIN,98)@14
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_join_16_q <= i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_align_15_q & i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_align_14_q;

    -- i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im9_shift0(BITSHIFT,131)@14
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im9_shift0_qint <= i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im9_shift0_q <= i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_align_12(BITSHIFT,94)@14
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_align_12_q <= i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im0_shift0(BITSHIFT,128)@14
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im0_shift0_qint <= i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im0_shift0_q <= i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_join_13(BITJOIN,95)@14
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_join_13_q <= i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_im0_shift0_q);

    -- i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_result_add_0_0(ADD,99)@14
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_join_13_q);
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_join_16_q);
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_result_add_0_0_b));
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_result_add_0_0_q <= i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx61_conv2d3x3_conv2d3x384_mult_extender_x(BITJOIN,29)@14
    i_arrayidx61_conv2d3x3_conv2d3x384_mult_extender_x_q <= i_arrayidx61_conv2d3x3_conv2d3x384_mult_multconst_x_q & i_arrayidx61_conv2d3x3_conv2d3x384_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x(BITSELECT,31)@14
    i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b <= i_arrayidx61_conv2d3x3_conv2d3x384_mult_extender_x_q(63 downto 0);

    -- redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0(REG,182)
    redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_syncbuf_filter_weight_sync_buffer_conv2d3x3(BITJOIN,221)
    bubble_join_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_q <= i_syncbuf_filter_weight_sync_buffer_conv2d3x3_out_buffer_out;

    -- bubble_select_i_syncbuf_filter_weight_sync_buffer_conv2d3x3(BITSELECT,222)
    bubble_select_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_q(63 downto 0));

    -- i_arrayidx61_conv2d3x3_conv2d3x384_add_x(ADD,32)@15
    i_arrayidx61_conv2d3x3_conv2d3x384_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_b);
    i_arrayidx61_conv2d3x3_conv2d3x384_add_x_b <= STD_LOGIC_VECTOR("0" & redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_q);
    i_arrayidx61_conv2d3x3_conv2d3x384_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx61_conv2d3x3_conv2d3x384_add_x_a) + UNSIGNED(i_arrayidx61_conv2d3x3_conv2d3x384_add_x_b));
    i_arrayidx61_conv2d3x3_conv2d3x384_add_x_q <= i_arrayidx61_conv2d3x3_conv2d3x384_add_x_o(64 downto 0);

    -- i_arrayidx61_conv2d3x3_conv2d3x384_dupName_0_trunc_sel_x(BITSELECT,26)@15
    i_arrayidx61_conv2d3x3_conv2d3x384_dupName_0_trunc_sel_x_b <= i_arrayidx61_conv2d3x3_conv2d3x384_add_x_q(63 downto 0);

    -- i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x(BLACKBOX,37)@15
    -- in in_i_stall@20000000
    -- out out_o_readdata_0@141
    -- out out_o_readdata_1@141
    -- out out_o_readdata_2@141
    -- out out_o_readdata_3@141
    -- out out_memcoalesce_filter_weight_load_0_avm_address@20000000
    -- out out_memcoalesce_filter_weight_load_0_avm_burstcount@20000000
    -- out out_memcoalesce_filter_weight_load_0_avm_byteenable@20000000
    -- out out_memcoalesce_filter_weight_load_0_avm_enable@20000000
    -- out out_memcoalesce_filter_weight_load_0_avm_read@20000000
    -- out out_memcoalesce_filter_weight_load_0_avm_write@20000000
    -- out out_memcoalesce_filter_weight_load_0_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@141
    thei_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x : i_load_memcoalesce_filter_weight_load_0_conv2d3x385
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_arrayidx61_conv2d3x3_conv2d3x384_dupName_0_trunc_sel_x_b,
        in_i_predicate => bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_h,
        in_i_stall => SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_backStall,
        in_i_valid => SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_V0,
        in_memcoalesce_filter_weight_load_0_avm_readdata => in_memcoalesce_filter_weight_load_0_avm_readdata,
        in_memcoalesce_filter_weight_load_0_avm_readdatavalid => in_memcoalesce_filter_weight_load_0_avm_readdatavalid,
        in_memcoalesce_filter_weight_load_0_avm_waitrequest => in_memcoalesce_filter_weight_load_0_avm_waitrequest,
        in_memcoalesce_filter_weight_load_0_avm_writeack => in_memcoalesce_filter_weight_load_0_avm_writeack,
        out_o_readdata_0 => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_0,
        out_o_readdata_1 => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_1,
        out_o_readdata_2 => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_2,
        out_o_readdata_3 => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_3,
        out_memcoalesce_filter_weight_load_0_avm_address => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_address,
        out_memcoalesce_filter_weight_load_0_avm_burstcount => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_burstcount,
        out_memcoalesce_filter_weight_load_0_avm_byteenable => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_byteenable,
        out_memcoalesce_filter_weight_load_0_avm_enable => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_enable,
        out_memcoalesce_filter_weight_load_0_avm_read => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_read,
        out_memcoalesce_filter_weight_load_0_avm_write => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_write,
        out_memcoalesce_filter_weight_load_0_avm_writedata => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_writedata,
        out_o_stall => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_stall,
        out_o_valid => i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1(STALLENABLE,442)
    -- Valid signal propagation
    SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_V0 <= SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_backStall <= i_syncbuf_filter_weight_sync_buffer_conv2d3x3_out_stall_out or not (SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_wireValid <= bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_valid_out;

    -- i_syncbuf_filter_weight_sync_buffer_conv2d3x3(BLACKBOX,67)@15
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_filter_weight_sync_buffer_conv2d3x3 : i_syncbuf_filter_weight_sync_buffer_conv2d3x350
    PORT MAP (
        in_buffer_in => in_filter_weight,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_backStall,
        in_valid_in => SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_V0,
        out_buffer_out => i_syncbuf_filter_weight_sync_buffer_conv2d3x3_out_buffer_out,
        out_stall_out => i_syncbuf_filter_weight_sync_buffer_conv2d3x3_out_stall_out,
        out_valid_out => i_syncbuf_filter_weight_sync_buffer_conv2d3x3_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3(STALLENABLE,344)
    -- Valid signal propagation
    SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_V0 <= SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_backStall <= i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_stall or not (SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_and0 <= i_syncbuf_filter_weight_sync_buffer_conv2d3x3_out_valid_out;
    SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_and1 <= SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_V0 and SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_and0;
    SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_wireValid <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V0 and SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_and1;

    -- SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0(STALLENABLE,399)
    -- Valid signal propagation
    SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_V0 <= SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_s_tv_0 <= SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_backStall and SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_backEN <= not (SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_v_s_0 <= SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_backEN and SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_V0;
    -- Backward Stall generation
    SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_backStall <= not (SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_v_s_0);
    SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_R_v_0 <= SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_R_v_0 and SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_R_v_0 <= SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0(STALLENABLE,434)
    -- Valid signal propagation
    SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_V0 <= SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_s_tv_0 <= SE_redist14_i_arrayidx61_conv2d3x3_conv2d3x384_trunc_sel_x_b_1_0_backStall and SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_backEN <= not (SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_v_s_0 <= SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_backEN and SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_V;
    -- Backward Stall generation
    SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_backStall <= not (SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_backEN);
    SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_backEN = "0") THEN
                SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_R_v_0 <= SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_R_v_0 and SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_R_v_0 <= SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0(STALLREG,598)
    SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_r_valid <= (others => '0');
            SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_r_valid <= SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_backStall and (SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_r_valid or SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_i_valid);

            IF (SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_r_data0 <= STD_LOGIC_VECTOR(bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_i_valid <= SE_out_redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_V0;
    -- Stall signal propagation
    SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_backStall <= SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_r_valid or not (SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_i_valid);

    -- Valid
    SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_V <= SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_r_valid WHEN SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_r_valid = "1" ELSE SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_i_valid;

    SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_D0 <= SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_r_data0 WHEN SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_r_valid = "1" ELSE bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b;

    -- SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo(STALLENABLE,403)
    SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_fromReg0 <= (others => '0');
            SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_fromReg0 <= SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_toReg0;
            -- Succesor 1
            SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_fromReg1 <= SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_consumed0 <= (not (SE_out_redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_backStall) and SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_wireValid) or SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_fromReg0;
    SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_consumed1 <= (not (redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_stall_out) and SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_wireValid) or SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_fromReg1;
    -- Consuming
    SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_StallValid <= SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_backStall and SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_wireValid;
    SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_toReg0 <= SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_StallValid and SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_consumed0;
    SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_toReg1 <= SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_StallValid and SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_or0 <= SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_consumed0;
    SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_wireStall <= not (SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_consumed1 and SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_or0);
    SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_backStall <= SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_V0 <= SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_wireValid and not (SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_fromReg0);
    SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_V1 <= SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_wireValid and not (SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_wireValid <= redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_valid_out;

    -- SE_out_redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo(STALLENABLE,436)
    -- Valid signal propagation
    SE_out_redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_V0 <= SE_out_redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_backStall <= SR_SE_redist33_bgTrunc_i_add_ptr_sum_conv2d3x3_sel_x_b_1_0_backStall or not (SE_out_redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_and0 <= redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_valid_out;
    SE_out_redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_wireValid <= SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_V0 and SE_out_redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_and0;

    -- redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo(STALLFIFO,202)
    redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_valid_in <= SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_V0;
    redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_stall_in <= SE_out_redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_backStall;
    redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_data_in <= bgTrunc_i_add58_conv2d3x3_sel_x_b;
    redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_valid_in_bitsignaltemp <= redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_valid_in(0);
    redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_stall_in_bitsignaltemp <= redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_stall_in(0);
    redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_valid_out(0) <= redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_valid_out_bitsignaltemp;
    redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_stall_out(0) <= redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_stall_out_bitsignaltemp;
    theredist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 12,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_valid_in_bitsignaltemp,
        stall_in => redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_stall_in_bitsignaltemp,
        data_in => bgTrunc_i_add58_conv2d3x3_sel_x_b,
        valid_out => redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_valid_out_bitsignaltemp,
        stall_out => redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_stall_out_bitsignaltemp,
        data_out => redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0(STALLENABLE,432)
    -- Valid signal propagation
    SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_V0 <= SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_s_tv_0 <= redist34_bgTrunc_i_add58_conv2d3x3_sel_x_b_11_fifo_stall_out and SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_backEN <= not (SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_v_s_0 <= SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_backEN and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V17;
    -- Backward Stall generation
    SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_backStall <= not (SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_v_s_0);
    SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_backEN = "0") THEN
                SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_R_v_0 <= SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_R_v_0 and SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_R_v_0 <= SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo(STALLFIFO,184)
    redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V3;
    redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_stall_in <= SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_backStall;
    redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_f;
    redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_valid_in_bitsignaltemp <= redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_valid_in(0);
    redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_stall_in_bitsignaltemp <= redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_stall_in(0);
    redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_valid_out(0) <= redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_valid_out_bitsignaltemp;
    redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_stall_out(0) <= redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_stall_out_bitsignaltemp;
    theredist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 13,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_valid_in_bitsignaltemp,
        stall_in => redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_f,
        valid_out => redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_valid_out_bitsignaltemp,
        stall_out => redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_stall_out_bitsignaltemp,
        data_out => redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg(STALLFIFO,595)
    bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V0;
    bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_stall_in <= SE_out_bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_backStall;
    bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp <= bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_valid_in(0);
    bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp <= bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_stall_in(0);
    bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_valid_out(0) <= bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp;
    bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_stall_out(0) <= bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp;
    thebubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 15,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,349)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= conv2d3x3_B2_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,224)
    bubble_join_stall_entry_q <= in_unnamed_conv2d3x32 & in_tmp_36 & in_output_im_addr_11411 & in_output_im_addr_0227 & in_l_37 & in_k_210 & in_j_1159 & in_i_0235 & in_fpgaindvars_iv & in_c1_exe719 & in_c1_exe618 & in_c1_exe517 & in_c1_exe416 & in_c1_exe315 & in_c1_exe214 & in_c1_exe121813 & in_c0_exe121212 & in_c0_exe11;

    -- bubble_select_stall_entry(BITSELECT,225)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(95 downto 64));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(127 downto 96));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(128 downto 128));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(129 downto 129));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(130 downto 130));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(131 downto 131));
    bubble_select_stall_entry_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(132 downto 132));
    bubble_select_stall_entry_j <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(133 downto 133));
    bubble_select_stall_entry_k <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(136 downto 134));
    bubble_select_stall_entry_l <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(168 downto 137));
    bubble_select_stall_entry_m <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(200 downto 169));
    bubble_select_stall_entry_n <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(232 downto 201));
    bubble_select_stall_entry_o <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(264 downto 233));
    bubble_select_stall_entry_p <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(328 downto 265));
    bubble_select_stall_entry_q <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(392 downto 329));
    bubble_select_stall_entry_r <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(424 downto 393));
    bubble_select_stall_entry_s <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(456 downto 425));

    -- conv2d3x3_B2_merge_reg_aunroll_x(BLACKBOX,7)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_data_out_2@1
    -- out out_data_out_3@1
    -- out out_data_out_4@1
    -- out out_data_out_5@1
    -- out out_data_out_6@1
    -- out out_data_out_7@1
    -- out out_data_out_8@1
    -- out out_data_out_9@1
    -- out out_data_out_10@1
    -- out out_data_out_11@1
    -- out out_data_out_12@1
    -- out out_data_out_13@1
    -- out out_data_out_14@1
    -- out out_data_out_15@1
    -- out out_data_out_16@1
    -- out out_data_out_17@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    theconv2d3x3_B2_merge_reg_aunroll_x : conv2d3x3_B2_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_n,
        in_data_in_1 => bubble_select_stall_entry_k,
        in_data_in_2 => bubble_select_stall_entry_o,
        in_data_in_3 => bubble_select_stall_entry_r,
        in_data_in_4 => bubble_select_stall_entry_b,
        in_data_in_5 => bubble_select_stall_entry_s,
        in_data_in_6 => bubble_select_stall_entry_l,
        in_data_in_7 => bubble_select_stall_entry_p,
        in_data_in_8 => bubble_select_stall_entry_m,
        in_data_in_9 => bubble_select_stall_entry_q,
        in_data_in_10 => bubble_select_stall_entry_c,
        in_data_in_11 => bubble_select_stall_entry_d,
        in_data_in_12 => bubble_select_stall_entry_e,
        in_data_in_13 => bubble_select_stall_entry_f,
        in_data_in_14 => bubble_select_stall_entry_g,
        in_data_in_15 => bubble_select_stall_entry_h,
        in_data_in_16 => bubble_select_stall_entry_i,
        in_data_in_17 => bubble_select_stall_entry_j,
        in_stall_in => SE_out_conv2d3x3_B2_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3,
        out_data_out_4 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4,
        out_data_out_5 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5,
        out_data_out_6 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6,
        out_data_out_7 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7,
        out_data_out_8 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8,
        out_data_out_9 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9,
        out_data_out_10 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10,
        out_data_out_11 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11,
        out_data_out_12 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12,
        out_data_out_13 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13,
        out_data_out_14 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14,
        out_data_out_15 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15,
        out_data_out_16 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16,
        out_data_out_17 => conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17,
        out_stall_out => conv2d3x3_B2_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => conv2d3x3_B2_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_conv2d3x3_B2_merge_reg_aunroll_x(STALLENABLE,325)
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg1 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg2 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg3 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg4 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg5 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg6 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg7 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg8 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg9 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg10 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg11 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg12 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg13 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg14 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg15 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg16 <= (others => '0');
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg17 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg0 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg1 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg2 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg3 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg3;
            -- Succesor 4
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg4 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg4;
            -- Succesor 5
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg5 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg5;
            -- Succesor 6
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg6 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg6;
            -- Succesor 7
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg7 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg7;
            -- Succesor 8
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg8 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg8;
            -- Succesor 9
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg9 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg9;
            -- Succesor 10
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg10 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg10;
            -- Succesor 11
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg11 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg11;
            -- Succesor 12
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg12 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg12;
            -- Succesor 13
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg13 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg13;
            -- Succesor 14
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg14 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg14;
            -- Succesor 15
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg15 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg15;
            -- Succesor 16
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg16 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg16;
            -- Succesor 17
            SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg17 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg17;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed0 <= (not (bubble_out_conv2d3x3_B2_merge_reg_aunroll_x_1_reg_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg0;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed1 <= (not (i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_o_stall) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg1;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed2 <= (not (redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg2;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed3 <= (not (redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg3;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed4 <= (not (redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg4;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed5 <= (not (redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg5;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed6 <= (not (redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg6;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed7 <= (not (redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg7;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed8 <= (not (redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg8;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed9 <= (not (redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg9;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed10 <= (not (redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg10;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed11 <= (not (redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg11;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed12 <= (not (redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg12;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed13 <= (not (redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg13;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed14 <= (not (redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg14;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed15 <= (not (redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg15;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed16 <= (not (redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_stall_out) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg16;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed17 <= (not (SE_redist31_bgTrunc_i_mul57_add186_conv2d3x3_sel_x_b_1_0_backStall) and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg17;
    -- Consuming
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_backStall and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg0 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed0;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg1 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed1;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg2 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed2;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg3 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed3;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg4 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed4;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg5 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed5;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg6 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed6;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg7 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed7;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg8 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed8;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg9 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed9;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg10 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed10;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg11 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed11;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg12 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed12;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg13 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed13;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg14 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed14;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg15 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed15;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg16 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed16;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_toReg17 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed17;
    -- Backward Stall generation
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or0 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed0;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or1 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed1 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or0;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or2 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed2 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or1;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or3 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed3 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or2;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or4 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed4 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or3;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or5 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed5 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or4;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or6 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed6 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or5;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or7 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed7 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or6;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or8 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed8 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or7;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or9 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed9 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or8;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or10 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed10 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or9;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or11 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed11 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or10;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or12 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed12 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or11;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or13 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed13 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or12;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or14 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed14 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or13;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or15 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed15 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or14;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or16 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed16 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or15;
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireStall <= not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_consumed17 and SE_out_conv2d3x3_B2_merge_reg_aunroll_x_or16);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_backStall <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V0 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg0);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V1 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg1);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V2 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg2);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V3 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg3);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V4 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg4);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V5 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg5);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V6 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg6);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V7 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg7);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V8 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg8);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V9 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg9);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V10 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg10);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V11 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg11);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V12 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg12);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V13 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg13);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V14 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg14);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V15 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg15);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V16 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg16);
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V17 <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d3x3_B2_merge_reg_aunroll_x_fromReg17);
    -- Computing multiple Valid(s)
    SE_out_conv2d3x3_B2_merge_reg_aunroll_x_wireValid <= conv2d3x3_B2_merge_reg_aunroll_x_out_valid_out;

    -- bubble_join_conv2d3x3_B2_merge_reg_aunroll_x(BITJOIN,204)
    bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q <= conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_2 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_1 & conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_conv2d3x3_B2_merge_reg_aunroll_x(BITSELECT,205)
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(31 downto 0));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(34 downto 32));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(66 downto 35));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(98 downto 67));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(162 downto 99));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(194 downto 163));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(226 downto 195));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(290 downto 227));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(322 downto 291));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(386 downto 323));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(418 downto 387));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(450 downto 419));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_n <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(451 downto 451));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_o <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(452 downto 452));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_p <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(453 downto 453));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_q <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(454 downto 454));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_r <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(455 downto 455));
    bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_s <= STD_LOGIC_VECTOR(bubble_join_conv2d3x3_B2_merge_reg_aunroll_x_q(456 downto 456));

    -- i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x(BLACKBOX,39)@1
    -- in in_i_stall@20000000
    -- out out_c0_exit223_0@15
    -- out out_c0_exit223_1@15
    -- out out_c0_exit223_2@15
    -- out out_c0_exit223_3@15
    -- out out_c0_exit223_4@15
    -- out out_c0_exit223_5@15
    -- out out_c0_exit223_6@15
    -- out out_c0_exit223_7@15
    -- out out_c0_exit223_8@15
    -- out out_c0_exit223_9@15
    -- out out_c0_exit223_10@15
    -- out out_o_stall@20000000
    -- out out_o_valid@15
    thei_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x : i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3
    PORT MAP (
        in_c0_eni11_0 => GND_q,
        in_c0_eni11_1 => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_b,
        in_c0_eni11_2 => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_l,
        in_c0_eni11_3 => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_d,
        in_c0_eni11_4 => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_m,
        in_c0_eni11_5 => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_n,
        in_c0_eni11_6 => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_o,
        in_c0_eni11_7 => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_p,
        in_c0_eni11_8 => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_q,
        in_c0_eni11_9 => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_r,
        in_c0_eni11_10 => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_s,
        in_c0_eni11_11 => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_c,
        in_i_stall => SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_backStall,
        in_i_valid => SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V1,
        in_input_channels => in_input_channels,
        in_input_im => in_input_im,
        in_input_size => in_input_size,
        in_output_size => in_output_size,
        out_c0_exit223_0 => i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0,
        out_c0_exit223_1 => i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1,
        out_c0_exit223_2 => i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2,
        out_c0_exit223_3 => i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3,
        out_c0_exit223_4 => i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4,
        out_c0_exit223_5 => i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5,
        out_c0_exit223_6 => i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6,
        out_c0_exit223_7 => i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7,
        out_c0_exit223_8 => i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8,
        out_c0_exit223_9 => i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9,
        out_c0_exit223_10 => i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10,
        out_o_stall => i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x(BITJOIN,214)
    bubble_join_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_q <= i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10 & i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9 & i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8 & i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7 & i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6 & i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5 & i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4 & i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3 & i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2 & i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1 & i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0;

    -- bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x(BITSELECT,215)
    bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_q(0 downto 0));
    bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_q(1 downto 1));
    bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_q(2 downto 2));
    bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_q(66 downto 3));
    bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_q(67 downto 67));
    bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_q(68 downto 68));
    bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_q(69 downto 69));
    bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_q(72 downto 70));
    bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_q(104 downto 73));
    bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_q(136 downto 105));
    bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_q(137 downto 137));

    -- redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo(STALLFIFO,173)
    redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_valid_in <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V6;
    redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_stall_in <= SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_backStall;
    redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_data_in <= bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_f;
    redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_valid_in_bitsignaltemp <= redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_valid_in(0);
    redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_stall_in_bitsignaltemp <= redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_stall_in(0);
    redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_valid_out(0) <= redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_valid_out_bitsignaltemp;
    redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_stall_out(0) <= redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_stall_out_bitsignaltemp;
    theredist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 127,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_valid_in_bitsignaltemp,
        stall_in => redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_f,
        valid_out => redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_valid_out_bitsignaltemp,
        stall_out => redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_stall_out_bitsignaltemp,
        data_out => redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo(STALLFIFO,169)
    redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_valid_in <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V3;
    redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_stall_in <= SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_backStall;
    redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_data_in <= bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_c;
    redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_valid_in_bitsignaltemp <= redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_valid_in(0);
    redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_stall_in_bitsignaltemp <= redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_stall_in(0);
    redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_valid_out(0) <= redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_valid_out_bitsignaltemp;
    redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_stall_out(0) <= redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_stall_out_bitsignaltemp;
    theredist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 127,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_valid_in_bitsignaltemp,
        stall_in => redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_c,
        valid_out => redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_valid_out_bitsignaltemp,
        stall_out => redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_stall_out_bitsignaltemp,
        data_out => redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x(STALLENABLE,334)
    -- Valid signal propagation
    SE_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_V0 <= SE_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_backStall <= bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_stall_out or not (SE_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_wireValid <= i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_valid;

    -- i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x(BLACKBOX,38)@15
    -- in in_i_stall@20000000
    -- out out_o_readdata_0@141
    -- out out_o_readdata_1@141
    -- out out_o_readdata_2@141
    -- out out_o_readdata_3@141
    -- out out_memcoalesce_input_im_load_0_avm_address@20000000
    -- out out_memcoalesce_input_im_load_0_avm_burstcount@20000000
    -- out out_memcoalesce_input_im_load_0_avm_byteenable@20000000
    -- out out_memcoalesce_input_im_load_0_avm_enable@20000000
    -- out out_memcoalesce_input_im_load_0_avm_read@20000000
    -- out out_memcoalesce_input_im_load_0_avm_write@20000000
    -- out out_memcoalesce_input_im_load_0_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@141
    thei_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x : i_load_memcoalesce_input_im_load_0_conv2d3x382
    PORT MAP (
        in_flush => in_flush,
        in_i_address => bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_e,
        in_i_predicate => bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_h,
        in_i_stall => SE_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_backStall,
        in_i_valid => SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V1,
        in_memcoalesce_input_im_load_0_avm_readdata => in_memcoalesce_input_im_load_0_avm_readdata,
        in_memcoalesce_input_im_load_0_avm_readdatavalid => in_memcoalesce_input_im_load_0_avm_readdatavalid,
        in_memcoalesce_input_im_load_0_avm_waitrequest => in_memcoalesce_input_im_load_0_avm_waitrequest,
        in_memcoalesce_input_im_load_0_avm_writeack => in_memcoalesce_input_im_load_0_avm_writeack,
        out_o_readdata_0 => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_readdata_0,
        out_o_readdata_1 => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_readdata_1,
        out_o_readdata_2 => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_readdata_2,
        out_o_readdata_3 => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_readdata_3,
        out_memcoalesce_input_im_load_0_avm_address => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_address,
        out_memcoalesce_input_im_load_0_avm_burstcount => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_burstcount,
        out_memcoalesce_input_im_load_0_avm_byteenable => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_byteenable,
        out_memcoalesce_input_im_load_0_avm_enable => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_enable,
        out_memcoalesce_input_im_load_0_avm_read => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_read,
        out_memcoalesce_input_im_load_0_avm_write => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_write,
        out_memcoalesce_input_im_load_0_avm_writedata => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_writedata,
        out_o_stall => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_stall,
        out_o_valid => i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x(STALLENABLE,336)
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg0 <= (others => '0');
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg1 <= (others => '0');
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg2 <= (others => '0');
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg3 <= (others => '0');
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg4 <= (others => '0');
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg5 <= (others => '0');
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg6 <= (others => '0');
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg7 <= (others => '0');
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg8 <= (others => '0');
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg9 <= (others => '0');
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg10 <= (others => '0');
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg11 <= (others => '0');
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg12 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg0 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg1 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg2 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg3 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg3;
            -- Succesor 4
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg4 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg4;
            -- Succesor 5
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg5 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg5;
            -- Succesor 6
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg6 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg6;
            -- Succesor 7
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg7 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg7;
            -- Succesor 8
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg8 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg8;
            -- Succesor 9
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg9 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg9;
            -- Succesor 10
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg10 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg10;
            -- Succesor 11
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg11 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg11;
            -- Succesor 12
            SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg12 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg12;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed0 <= (not (SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d3x3_backStall) and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg0;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed1 <= (not (i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_stall) and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg1;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed2 <= (not (redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_stall_out) and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg2;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed3 <= (not (redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_stall_out) and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg3;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed4 <= (not (redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_stall_out) and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg4;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed5 <= (not (redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_stall_out) and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg5;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed6 <= (not (redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_stall_out) and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg6;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed7 <= (not (redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_stall_out) and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg7;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed8 <= (not (redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_stall_out) and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg8;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed9 <= (not (redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_stall_out) and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg9;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed10 <= (not (redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_stall_out) and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg10;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed11 <= (not (redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_stall_out) and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg11;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed12 <= (not (redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_stall_out) and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg12;
    -- Consuming
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_StallValid <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_backStall and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg0 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_StallValid and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed0;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg1 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_StallValid and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed1;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg2 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_StallValid and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed2;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg3 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_StallValid and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed3;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg4 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_StallValid and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed4;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg5 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_StallValid and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed5;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg6 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_StallValid and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed6;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg7 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_StallValid and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed7;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg8 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_StallValid and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed8;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg9 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_StallValid and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed9;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg10 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_StallValid and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed10;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg11 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_StallValid and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed11;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_toReg12 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_StallValid and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed12;
    -- Backward Stall generation
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or0 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed0;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or1 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed1 and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or0;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or2 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed2 and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or1;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or3 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed3 and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or2;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or4 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed4 and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or3;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or5 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed5 and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or4;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or6 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed6 and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or5;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or7 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed7 and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or6;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or8 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed8 and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or7;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or9 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed9 and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or8;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or10 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed10 and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or9;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or11 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed11 and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or10;
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireStall <= not (SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_consumed12 and SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_or11);
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_backStall <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V0 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg0);
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V1 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg1);
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V2 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg2);
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V3 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg3);
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V4 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg4);
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V5 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg5);
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V6 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg6);
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V7 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg7);
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V8 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg8);
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V9 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg9);
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V10 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg10);
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V11 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg11);
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V12 <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_fromReg12);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_wireValid <= i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_o_valid;

    -- redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo(STALLFIFO,175)
    redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_valid_in <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V7;
    redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_stall_in <= SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_backStall;
    redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_data_in <= bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_g;
    redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_valid_in_bitsignaltemp <= redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_valid_in(0);
    redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_stall_in_bitsignaltemp <= redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_stall_in(0);
    redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_valid_out(0) <= redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_valid_out_bitsignaltemp;
    redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_stall_out(0) <= redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_stall_out_bitsignaltemp;
    theredist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 127,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_valid_in_bitsignaltemp,
        stall_in => redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_g,
        valid_out => redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_valid_out_bitsignaltemp,
        stall_out => redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_stall_out_bitsignaltemp,
        data_out => redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo(STALLENABLE,386)
    SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_fromReg0 <= (others => '0');
            SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_fromReg0 <= SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_toReg0;
            -- Succesor 1
            SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_fromReg1 <= SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_consumed0 <= (not (SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall) and SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_wireValid) or SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_fromReg0;
    SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_consumed1 <= (not (redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_stall_out) and SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_wireValid) or SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_fromReg1;
    -- Consuming
    SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_StallValid <= SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_backStall and SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_wireValid;
    SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_toReg0 <= SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_StallValid and SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_consumed0;
    SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_toReg1 <= SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_StallValid and SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_or0 <= SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_consumed0;
    SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_wireStall <= not (SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_consumed1 and SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_or0);
    SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_backStall <= SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_V0 <= SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_wireValid and not (SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_fromReg0);
    SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_V1 <= SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_wireValid and not (SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_wireValid <= redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_valid_out;

    -- SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo(STALLENABLE,382)
    SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_fromReg0 <= (others => '0');
            SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_fromReg0 <= SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_toReg0;
            -- Succesor 1
            SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_fromReg1 <= SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_consumed0 <= (not (SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall) and SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_wireValid) or SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_fromReg0;
    SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_consumed1 <= (not (redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_stall_out) and SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_wireValid) or SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_fromReg1;
    -- Consuming
    SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_StallValid <= SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_backStall and SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_wireValid;
    SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_toReg0 <= SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_StallValid and SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_consumed0;
    SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_toReg1 <= SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_StallValid and SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_or0 <= SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_consumed0;
    SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_wireStall <= not (SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_consumed1 and SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_or0);
    SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_backStall <= SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_V0 <= SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_wireValid and not (SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_fromReg0);
    SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_V1 <= SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_wireValid and not (SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_wireValid <= redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_valid_out;

    -- SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo(STALLENABLE,374)
    SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_fromReg0 <= (others => '0');
            SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_fromReg0 <= SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_toReg0;
            -- Succesor 1
            SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_fromReg1 <= SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_consumed0 <= (not (SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall) and SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_wireValid) or SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_fromReg0;
    SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_consumed1 <= (not (redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_stall_out) and SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_wireValid) or SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_fromReg1;
    -- Consuming
    SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_StallValid <= SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_backStall and SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_wireValid;
    SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_toReg0 <= SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_StallValid and SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_consumed0;
    SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_toReg1 <= SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_StallValid and SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_or0 <= SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_consumed0;
    SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_wireStall <= not (SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_consumed1 and SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_or0);
    SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_backStall <= SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_V0 <= SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_wireValid and not (SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_fromReg0);
    SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_V1 <= SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_wireValid and not (SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_wireValid <= redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_valid_out;

    -- redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo(STALLFIFO,183)
    redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V2;
    redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_stall_in <= SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall;
    redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_e;
    redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_valid_in_bitsignaltemp <= redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_valid_in(0);
    redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_stall_in_bitsignaltemp <= redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_stall_in(0);
    redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_valid_out(0) <= redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_valid_out_bitsignaltemp;
    redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_stall_out(0) <= redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_stall_out_bitsignaltemp;
    theredist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 141,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_valid_in_bitsignaltemp,
        stall_in => redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_e,
        valid_out => redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_valid_out_bitsignaltemp,
        stall_out => redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_stall_out_bitsignaltemp,
        data_out => redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x(BITJOIN,208)
    bubble_join_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_q <= i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_3 & i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_2 & i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_1 & i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_o_readdata_0;

    -- bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg(STALLFIFO,596)
    bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_valid_in <= SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_V0;
    bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_stall_in <= SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall;
    bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_data_in <= bubble_join_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_q;
    bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_valid_in_bitsignaltemp <= bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_valid_in(0);
    bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_stall_in_bitsignaltemp <= bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_stall_in(0);
    bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_valid_out(0) <= bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_valid_out_bitsignaltemp;
    bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_stall_out(0) <= bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_stall_out_bitsignaltemp;
    thebubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg : acl_data_fifo
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 128,
        IMPL => "zl_reg"
    )
    PORT MAP (
        valid_in => bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_stall_in_bitsignaltemp,
        data_in => bubble_join_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_q,
        valid_out => bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_stall_out_bitsignaltemp,
        data_out => bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x(BITJOIN,211)
    bubble_join_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_q <= i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_readdata_3 & i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_readdata_2 & i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_readdata_1 & i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_o_readdata_0;

    -- bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg(STALLFIFO,597)
    bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_valid_in <= SE_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_V0;
    bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_stall_in <= SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall;
    bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_data_in <= bubble_join_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_q;
    bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_valid_in_bitsignaltemp <= bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_valid_in(0);
    bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_stall_in_bitsignaltemp <= bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_stall_in(0);
    bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_valid_out(0) <= bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_valid_out_bitsignaltemp;
    bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_stall_out(0) <= bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_stall_out_bitsignaltemp;
    thebubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg : acl_data_fifo
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 128,
        IMPL => "zl_reg"
    )
    PORT MAP (
        valid_in => bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_stall_in_bitsignaltemp,
        data_in => bubble_join_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_q,
        valid_out => bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_stall_out_bitsignaltemp,
        data_out => bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data(STALLENABLE,448)
    -- Valid signal propagation
    SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_V0 <= SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_backStall <= i_sfc_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3x3_aunroll_x_out_o_stall or not (SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and0 <= bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_valid_out;
    SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and1 <= bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_valid_out and SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and0;
    SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and2 <= redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_valid_out and SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and1;
    SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and3 <= SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_V0 and SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and2;
    SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and4 <= SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_V0 and SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and3;
    SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_wireValid <= SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_V0 and SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_and4;

    -- bubble_join_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo(BITJOIN,249)
    bubble_join_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_q <= redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_data_out;

    -- bubble_select_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo(BITSELECT,250)
    bubble_select_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_q(0 downto 0));

    -- bubble_join_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo(BITJOIN,243)
    bubble_join_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_q <= redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_data_out;

    -- bubble_select_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo(BITSELECT,244)
    bubble_select_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_q(0 downto 0));

    -- bubble_join_redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo(BITJOIN,270)
    bubble_join_redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_q <= redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_data_out;

    -- bubble_select_redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo(BITSELECT,271)
    bubble_select_redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_q(31 downto 0));

    -- bubble_join_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo(BITJOIN,231)
    bubble_join_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_q <= redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_data_out;

    -- bubble_select_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo(BITSELECT,232)
    bubble_select_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_q(0 downto 0));

    -- bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x(BITSELECT,209)
    bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_data_out(31 downto 0));
    bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_data_out(63 downto 32));
    bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_data_out(95 downto 64));
    bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_data_reg_data_out(127 downto 96));

    -- bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x(BITSELECT,212)
    bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_data_out(31 downto 0));
    bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_data_out(63 downto 32));
    bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_data_out(95 downto 64));
    bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_reg_data_out(127 downto 96));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3x3_aunroll_x(BLACKBOX,40)@141
    -- in in_i_stall@20000000
    -- out out_c1_exit229_0@197
    -- out out_c1_exit229_1@197
    -- out out_o_stall@20000000
    -- out out_o_valid@197
    thei_sfc_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3x3_aunroll_x : i_sfc_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3x3
    PORT MAP (
        in_c1_eni6_0 => GND_q,
        in_c1_eni6_1 => bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_b,
        in_c1_eni6_2 => bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_c,
        in_c1_eni6_3 => bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_d,
        in_c1_eni6_4 => bubble_select_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_e,
        in_c1_eni6_5 => bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_b,
        in_c1_eni6_6 => bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_c,
        in_c1_eni6_7 => bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_d,
        in_c1_eni6_8 => bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_e,
        in_c1_eni6_9 => bubble_select_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_b,
        in_c1_eni6_10 => bubble_select_redist15_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_3_140_fifo_b,
        in_c1_eni6_11 => bubble_select_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_b,
        in_c1_eni6_12 => bubble_select_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_b,
        in_i_stall => SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall,
        in_i_valid => SE_out_bubble_out_i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_data_V0,
        out_c1_exit229_1 => i_sfc_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3x3_aunroll_x_out_c1_exit229_1,
        out_o_stall => i_sfc_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3x3_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3x3_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo(STALLFIFO,168)
    redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_valid_in <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V2;
    redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_stall_in <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall;
    redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_data_in <= bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_b;
    redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_valid_in_bitsignaltemp <= redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_valid_in(0);
    redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_stall_in_bitsignaltemp <= redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_stall_in(0);
    redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_valid_out(0) <= redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_valid_out_bitsignaltemp;
    redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_stall_out(0) <= redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_stall_out_bitsignaltemp;
    theredist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 183,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_valid_in_bitsignaltemp,
        stall_in => redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_b,
        valid_out => redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_valid_out_bitsignaltemp,
        stall_out => redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_stall_out_bitsignaltemp,
        data_out => redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo(STALLFIFO,170)
    redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_valid_in <= SE_out_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_V1;
    redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_stall_in <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall;
    redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_data_in <= bubble_select_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_b;
    redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_valid_in_bitsignaltemp <= redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_valid_in(0);
    redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_stall_in_bitsignaltemp <= redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_stall_in(0);
    redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_valid_out(0) <= redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_valid_out_bitsignaltemp;
    redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_stall_out(0) <= redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_stall_out_bitsignaltemp;
    theredist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 57,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_valid_in_bitsignaltemp,
        stall_in => redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist1_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_126_fifo_b,
        valid_out => redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_valid_out_bitsignaltemp,
        stall_out => redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_stall_out_bitsignaltemp,
        data_out => redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo(STALLFIFO,171)
    redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_valid_in <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V4;
    redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_stall_in <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall;
    redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_data_in <= bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_d;
    redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_valid_in_bitsignaltemp <= redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_valid_in(0);
    redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_stall_in_bitsignaltemp <= redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_stall_in(0);
    redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_valid_out(0) <= redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_valid_out_bitsignaltemp;
    redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_stall_out(0) <= redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_stall_out_bitsignaltemp;
    theredist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 183,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_valid_in_bitsignaltemp,
        stall_in => redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_d,
        valid_out => redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_valid_out_bitsignaltemp,
        stall_out => redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_stall_out_bitsignaltemp,
        data_out => redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo(STALLFIFO,172)
    redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_valid_in <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V5;
    redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_stall_in <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall;
    redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_data_in <= bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_e;
    redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_valid_in_bitsignaltemp <= redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_valid_in(0);
    redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_stall_in_bitsignaltemp <= redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_stall_in(0);
    redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_valid_out(0) <= redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_valid_out_bitsignaltemp;
    redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_stall_out(0) <= redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_stall_out_bitsignaltemp;
    theredist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 183,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_valid_in_bitsignaltemp,
        stall_in => redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_e,
        valid_out => redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_valid_out_bitsignaltemp,
        stall_out => redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_stall_out_bitsignaltemp,
        data_out => redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo(STALLFIFO,174)
    redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_valid_in <= SE_out_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_V1;
    redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_stall_in <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall;
    redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_data_in <= bubble_select_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_b;
    redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_valid_in_bitsignaltemp <= redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_valid_in(0);
    redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_stall_in_bitsignaltemp <= redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_stall_in(0);
    redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_valid_out(0) <= redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_valid_out_bitsignaltemp;
    redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_stall_out(0) <= redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_stall_out_bitsignaltemp;
    theredist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 57,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_valid_in_bitsignaltemp,
        stall_in => redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist5_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_126_fifo_b,
        valid_out => redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_valid_out_bitsignaltemp,
        stall_out => redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_stall_out_bitsignaltemp,
        data_out => redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo(STALLFIFO,176)
    redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_valid_in <= SE_out_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_V1;
    redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_stall_in <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall;
    redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_data_in <= bubble_select_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_b;
    redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_valid_in_bitsignaltemp <= redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_valid_in(0);
    redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_stall_in_bitsignaltemp <= redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_stall_in(0);
    redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_valid_out(0) <= redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_valid_out_bitsignaltemp;
    redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_stall_out(0) <= redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_stall_out_bitsignaltemp;
    theredist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 57,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_valid_in_bitsignaltemp,
        stall_in => redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist7_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_126_fifo_b,
        valid_out => redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_valid_out_bitsignaltemp,
        stall_out => redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_stall_out_bitsignaltemp,
        data_out => redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo(STALLFIFO,177)
    redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_valid_in <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V8;
    redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_stall_in <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall;
    redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_data_in <= bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_h;
    redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_valid_in_bitsignaltemp <= redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_valid_in(0);
    redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_stall_in_bitsignaltemp <= redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_stall_in(0);
    redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_valid_out(0) <= redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_valid_out_bitsignaltemp;
    redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_stall_out(0) <= redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_stall_out_bitsignaltemp;
    theredist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 183,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_valid_in_bitsignaltemp,
        stall_in => redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_h,
        valid_out => redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_valid_out_bitsignaltemp,
        stall_out => redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_stall_out_bitsignaltemp,
        data_out => redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo(STALLFIFO,178)
    redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_valid_in <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V9;
    redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_stall_in <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall;
    redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_data_in <= bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_i;
    redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_valid_in_bitsignaltemp <= redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_valid_in(0);
    redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_stall_in_bitsignaltemp <= redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_stall_in(0);
    redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_valid_out(0) <= redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_valid_out_bitsignaltemp;
    redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_stall_out(0) <= redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_stall_out_bitsignaltemp;
    theredist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 183,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 3,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_valid_in_bitsignaltemp,
        stall_in => redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_i,
        valid_out => redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_valid_out_bitsignaltemp,
        stall_out => redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_stall_out_bitsignaltemp,
        data_out => redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo(STALLFIFO,179)
    redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_valid_in <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V10;
    redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_stall_in <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall;
    redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_data_in <= bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_j;
    redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_valid_in_bitsignaltemp <= redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_valid_in(0);
    redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_stall_in_bitsignaltemp <= redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_stall_in(0);
    redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_valid_out(0) <= redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_valid_out_bitsignaltemp;
    redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_stall_out(0) <= redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_stall_out_bitsignaltemp;
    theredist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 183,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_valid_in_bitsignaltemp,
        stall_in => redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_j,
        valid_out => redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_valid_out_bitsignaltemp,
        stall_out => redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_stall_out_bitsignaltemp,
        data_out => redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo(STALLFIFO,180)
    redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_valid_in <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V11;
    redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_stall_in <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall;
    redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_data_in <= bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_k;
    redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_valid_in_bitsignaltemp <= redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_valid_in(0);
    redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_stall_in_bitsignaltemp <= redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_stall_in(0);
    redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_valid_out(0) <= redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_valid_out_bitsignaltemp;
    redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_stall_out(0) <= redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_stall_out_bitsignaltemp;
    theredist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 183,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_valid_in_bitsignaltemp,
        stall_in => redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_k,
        valid_out => redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_valid_out_bitsignaltemp,
        stall_out => redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_stall_out_bitsignaltemp,
        data_out => redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo(STALLFIFO,181)
    redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_valid_in <= SE_out_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_V12;
    redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_stall_in <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall;
    redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_data_in <= bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_l;
    redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_valid_in_bitsignaltemp <= redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_valid_in(0);
    redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_stall_in_bitsignaltemp <= redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_stall_in(0);
    redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_valid_out(0) <= redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_valid_out_bitsignaltemp;
    redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_stall_out(0) <= redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_stall_out_bitsignaltemp;
    theredist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 183,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_valid_in_bitsignaltemp,
        stall_in => redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_l,
        valid_out => redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_valid_out_bitsignaltemp,
        stall_out => redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_stall_out_bitsignaltemp,
        data_out => redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo(STALLFIFO,185)
    redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_valid_in <= SE_out_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_V1;
    redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_stall_in <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall;
    redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_data_in <= bubble_select_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_b;
    redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_valid_in_bitsignaltemp <= redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_valid_in(0);
    redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_stall_in_bitsignaltemp <= redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_stall_in(0);
    redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_valid_out(0) <= redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_valid_out_bitsignaltemp;
    redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_stall_out(0) <= redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_stall_out_bitsignaltemp;
    theredist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 185,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_valid_in_bitsignaltemp,
        stall_in => redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist16_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_12_fifo_b,
        valid_out => redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_valid_out_bitsignaltemp,
        stall_out => redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_stall_out_bitsignaltemp,
        data_out => redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo(STALLFIFO,186)
    redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V4;
    redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_stall_in <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall;
    redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_g;
    redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_valid_in_bitsignaltemp <= redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_valid_in(0);
    redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_stall_in_bitsignaltemp <= redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_stall_in(0);
    redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_valid_out(0) <= redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_valid_out_bitsignaltemp;
    redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_stall_out(0) <= redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_stall_out_bitsignaltemp;
    theredist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 197,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_valid_in_bitsignaltemp,
        stall_in => redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_g,
        valid_out => redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_valid_out_bitsignaltemp,
        stall_out => redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_stall_out_bitsignaltemp,
        data_out => redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo(STALLFIFO,187)
    redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V5;
    redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_stall_in <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall;
    redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_h;
    redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_valid_in_bitsignaltemp <= redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_valid_in(0);
    redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_stall_in_bitsignaltemp <= redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_stall_in(0);
    redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_valid_out(0) <= redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_valid_out_bitsignaltemp;
    redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_stall_out(0) <= redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_stall_out_bitsignaltemp;
    theredist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 197,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_valid_in_bitsignaltemp,
        stall_in => redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_h,
        valid_out => redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_valid_out_bitsignaltemp,
        stall_out => redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_stall_out_bitsignaltemp,
        data_out => redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo(STALLFIFO,188)
    redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V6;
    redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_stall_in <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall;
    redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_i;
    redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_valid_in_bitsignaltemp <= redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_valid_in(0);
    redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_stall_in_bitsignaltemp <= redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_stall_in(0);
    redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_valid_out(0) <= redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_valid_out_bitsignaltemp;
    redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_stall_out(0) <= redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_stall_out_bitsignaltemp;
    theredist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 197,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_valid_in_bitsignaltemp,
        stall_in => redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_i,
        valid_out => redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_valid_out_bitsignaltemp,
        stall_out => redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_stall_out_bitsignaltemp,
        data_out => redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo(STALLFIFO,189)
    redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V7;
    redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_stall_in <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall;
    redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_j;
    redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_valid_in_bitsignaltemp <= redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_valid_in(0);
    redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_stall_in_bitsignaltemp <= redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_stall_in(0);
    redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_valid_out(0) <= redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_valid_out_bitsignaltemp;
    redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_stall_out(0) <= redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_stall_out_bitsignaltemp;
    theredist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 197,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_valid_in_bitsignaltemp,
        stall_in => redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_j,
        valid_out => redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_valid_out_bitsignaltemp,
        stall_out => redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_stall_out_bitsignaltemp,
        data_out => redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo(STALLFIFO,190)
    redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V8;
    redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_stall_in <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall;
    redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_k;
    redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_valid_in_bitsignaltemp <= redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_valid_in(0);
    redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_stall_in_bitsignaltemp <= redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_stall_in(0);
    redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_valid_out(0) <= redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_valid_out_bitsignaltemp;
    redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_stall_out(0) <= redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_stall_out_bitsignaltemp;
    theredist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 197,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_valid_in_bitsignaltemp,
        stall_in => redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_k,
        valid_out => redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_valid_out_bitsignaltemp,
        stall_out => redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_stall_out_bitsignaltemp,
        data_out => redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo(STALLFIFO,191)
    redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V9;
    redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_stall_in <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall;
    redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_l;
    redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_valid_in_bitsignaltemp <= redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_valid_in(0);
    redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_stall_in_bitsignaltemp <= redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_stall_in(0);
    redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_valid_out(0) <= redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_valid_out_bitsignaltemp;
    redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_stall_out(0) <= redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_stall_out_bitsignaltemp;
    theredist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 197,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_valid_in_bitsignaltemp,
        stall_in => redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_l,
        valid_out => redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_valid_out_bitsignaltemp,
        stall_out => redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_stall_out_bitsignaltemp,
        data_out => redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo(STALLFIFO,192)
    redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V10;
    redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_stall_in <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall;
    redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_m;
    redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_valid_in_bitsignaltemp <= redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_valid_in(0);
    redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_stall_in_bitsignaltemp <= redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_stall_in(0);
    redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_valid_out(0) <= redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_valid_out_bitsignaltemp;
    redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_stall_out(0) <= redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_stall_out_bitsignaltemp;
    theredist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 197,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_valid_in_bitsignaltemp,
        stall_in => redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_m,
        valid_out => redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_valid_out_bitsignaltemp,
        stall_out => redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_stall_out_bitsignaltemp,
        data_out => redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo(STALLFIFO,193)
    redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V11;
    redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_stall_in <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall;
    redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_n;
    redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_valid_in_bitsignaltemp <= redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_valid_in(0);
    redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_stall_in_bitsignaltemp <= redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_stall_in(0);
    redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_valid_out(0) <= redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_valid_out_bitsignaltemp;
    redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_stall_out(0) <= redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_stall_out_bitsignaltemp;
    theredist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 197,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_valid_in_bitsignaltemp,
        stall_in => redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_n,
        valid_out => redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_valid_out_bitsignaltemp,
        stall_out => redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_stall_out_bitsignaltemp,
        data_out => redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo(STALLFIFO,194)
    redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V12;
    redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_stall_in <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall;
    redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_o;
    redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_valid_in_bitsignaltemp <= redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_valid_in(0);
    redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_stall_in_bitsignaltemp <= redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_stall_in(0);
    redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_valid_out(0) <= redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_valid_out_bitsignaltemp;
    redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_stall_out(0) <= redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_stall_out_bitsignaltemp;
    theredist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 197,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_valid_in_bitsignaltemp,
        stall_in => redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_o,
        valid_out => redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_valid_out_bitsignaltemp,
        stall_out => redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_stall_out_bitsignaltemp,
        data_out => redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo(STALLFIFO,195)
    redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V13;
    redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_stall_in <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall;
    redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_p;
    redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_valid_in_bitsignaltemp <= redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_valid_in(0);
    redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_stall_in_bitsignaltemp <= redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_stall_in(0);
    redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_valid_out(0) <= redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_valid_out_bitsignaltemp;
    redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_stall_out(0) <= redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_stall_out_bitsignaltemp;
    theredist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 197,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_valid_in_bitsignaltemp,
        stall_in => redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_p,
        valid_out => redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_valid_out_bitsignaltemp,
        stall_out => redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_stall_out_bitsignaltemp,
        data_out => redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo(STALLFIFO,196)
    redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V14;
    redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_stall_in <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall;
    redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_q;
    redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_valid_in_bitsignaltemp <= redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_valid_in(0);
    redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_stall_in_bitsignaltemp <= redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_stall_in(0);
    redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_valid_out(0) <= redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_valid_out_bitsignaltemp;
    redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_stall_out(0) <= redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_stall_out_bitsignaltemp;
    theredist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 197,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_valid_in_bitsignaltemp,
        stall_in => redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_q,
        valid_out => redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_valid_out_bitsignaltemp,
        stall_out => redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_stall_out_bitsignaltemp,
        data_out => redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo(STALLFIFO,197)
    redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V15;
    redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_stall_in <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall;
    redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_r;
    redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_valid_in_bitsignaltemp <= redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_valid_in(0);
    redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_stall_in_bitsignaltemp <= redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_stall_in(0);
    redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_valid_out(0) <= redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_valid_out_bitsignaltemp;
    redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_stall_out(0) <= redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_stall_out_bitsignaltemp;
    theredist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 197,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_valid_in_bitsignaltemp,
        stall_in => redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_r,
        valid_out => redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_valid_out_bitsignaltemp,
        stall_out => redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_stall_out_bitsignaltemp,
        data_out => redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo(STALLFIFO,198)
    redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_valid_in <= SE_out_conv2d3x3_B2_merge_reg_aunroll_x_V16;
    redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_stall_in <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall;
    redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_data_in <= bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_s;
    redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_valid_in_bitsignaltemp <= redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_valid_in(0);
    redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_stall_in_bitsignaltemp <= redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_stall_in(0);
    redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_valid_out(0) <= redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_valid_out_bitsignaltemp;
    redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_stall_out(0) <= redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_stall_out_bitsignaltemp;
    theredist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 197,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_valid_in_bitsignaltemp,
        stall_in => redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d3x3_B2_merge_reg_aunroll_x_s,
        valid_out => redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_valid_out_bitsignaltemp,
        stall_out => redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_stall_out_bitsignaltemp,
        data_out => redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo(STALLENABLE,431)
    -- Valid signal propagation
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_V0 <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_backStall <= in_stall_in or not (SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and0 <= redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_valid_out;
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and1 <= redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_valid_out and SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and0;
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and2 <= redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_valid_out and SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and1;
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and3 <= redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_valid_out and SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and2;
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and4 <= redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_valid_out and SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and3;
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and5 <= redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_valid_out and SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and4;
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and6 <= redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_valid_out and SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and5;
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and7 <= redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_valid_out and SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and6;
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and8 <= redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_valid_out and SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and7;
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and9 <= redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_valid_out and SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and8;
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and10 <= redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_valid_out and SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and9;
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and11 <= redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_valid_out and SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and10;
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and12 <= redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_valid_out and SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and11;
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and13 <= redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_valid_out and SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and12;
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and14 <= redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_valid_out and SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and13;
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and15 <= redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_valid_out and SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and14;
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and16 <= redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_valid_out and SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and15;
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and17 <= redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_valid_out and SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and16;
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and18 <= redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_valid_out and SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and17;
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and19 <= redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_valid_out and SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and18;
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and20 <= redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_valid_out and SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and19;
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and21 <= redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_valid_out and SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and20;
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and22 <= redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_valid_out and SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and21;
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and23 <= redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_valid_out and SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and22;
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and24 <= redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_valid_out and SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and23;
    SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_wireValid <= i_sfc_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3x3_aunroll_x_out_o_valid and SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_and24;

    -- bubble_join_redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo(BITJOIN,279)
    bubble_join_redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_q <= redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_data_out;

    -- bubble_select_redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo(BITSELECT,280)
    bubble_select_redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_q(31 downto 0));

    -- bubble_join_redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo(BITJOIN,291)
    bubble_join_redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_q <= redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_data_out;

    -- bubble_select_redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo(BITSELECT,292)
    bubble_select_redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_q(63 downto 0));

    -- bubble_join_redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo(BITJOIN,285)
    bubble_join_redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_q <= redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_data_out;

    -- bubble_select_redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo(BITSELECT,286)
    bubble_select_redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_q(63 downto 0));

    -- bubble_join_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo(BITJOIN,288)
    bubble_join_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_q <= redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_data_out;

    -- bubble_select_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo(BITSELECT,289)
    bubble_select_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_q(31 downto 0));

    -- bubble_join_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo(BITJOIN,282)
    bubble_join_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_q <= redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_data_out;

    -- bubble_select_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo(BITSELECT,283)
    bubble_select_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_q(31 downto 0));

    -- bubble_join_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo(BITJOIN,315)
    bubble_join_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_q <= redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_data_out;

    -- bubble_select_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo(BITSELECT,316)
    bubble_select_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_q(0 downto 0));

    -- bubble_join_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo(BITJOIN,312)
    bubble_join_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_q <= redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_data_out;

    -- bubble_select_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo(BITSELECT,313)
    bubble_select_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_q(0 downto 0));

    -- bubble_join_redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo(BITJOIN,309)
    bubble_join_redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_q <= redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_data_out;

    -- bubble_select_redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo(BITSELECT,310)
    bubble_select_redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_q(0 downto 0));

    -- bubble_join_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo(BITJOIN,306)
    bubble_join_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_q <= redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_data_out;

    -- bubble_select_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo(BITSELECT,307)
    bubble_select_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_q(0 downto 0));

    -- bubble_join_redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo(BITJOIN,303)
    bubble_join_redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_q <= redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_data_out;

    -- bubble_select_redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo(BITSELECT,304)
    bubble_select_redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_q(0 downto 0));

    -- bubble_join_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo(BITJOIN,300)
    bubble_join_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_q <= redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_data_out;

    -- bubble_select_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo(BITSELECT,301)
    bubble_select_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_q(0 downto 0));

    -- bubble_join_i_sfc_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3x3_aunroll_x(BITJOIN,217)
    bubble_join_i_sfc_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3x3_aunroll_x_q <= i_sfc_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3x3_aunroll_x_out_c1_exit229_1;

    -- bubble_select_i_sfc_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3x3_aunroll_x(BITSELECT,218)
    bubble_select_i_sfc_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3x3_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3x3_aunroll_x_q(31 downto 0));

    -- bubble_join_redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo(BITJOIN,297)
    bubble_join_redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_q <= redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_data_out;

    -- bubble_select_redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo(BITSELECT,298)
    bubble_select_redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_q(31 downto 0));

    -- bubble_join_redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo(BITJOIN,255)
    bubble_join_redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_q <= redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_data_out;

    -- bubble_select_redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo(BITSELECT,256)
    bubble_select_redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_q(0 downto 0));

    -- bubble_join_redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo(BITJOIN,252)
    bubble_join_redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_q <= redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_data_out;

    -- bubble_select_redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo(BITSELECT,253)
    bubble_select_redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_q(0 downto 0));

    -- bubble_join_redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo(BITJOIN,246)
    bubble_join_redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_q <= redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_data_out;

    -- bubble_select_redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo(BITSELECT,247)
    bubble_select_redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_q(0 downto 0));

    -- bubble_join_redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo(BITJOIN,240)
    bubble_join_redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_q <= redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_data_out;

    -- bubble_select_redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo(BITSELECT,241)
    bubble_select_redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_q(63 downto 0));

    -- bubble_join_redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo(BITJOIN,237)
    bubble_join_redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_q <= redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_data_out;

    -- bubble_select_redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo(BITSELECT,238)
    bubble_select_redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_q(0 downto 0));

    -- bubble_join_redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo(BITJOIN,234)
    bubble_join_redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_q <= redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_data_out;

    -- bubble_select_redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo(BITSELECT,235)
    bubble_select_redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_q(0 downto 0));

    -- bubble_join_redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo(BITJOIN,228)
    bubble_join_redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_q <= redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_data_out;

    -- bubble_select_redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo(BITSELECT,229)
    bubble_select_redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_q(0 downto 0));

    -- bubble_join_redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo(BITJOIN,264)
    bubble_join_redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_q <= redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_data_out;

    -- bubble_select_redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo(BITSELECT,265)
    bubble_select_redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_q(31 downto 0));

    -- bubble_join_redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo(BITJOIN,261)
    bubble_join_redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_q <= redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_data_out;

    -- bubble_select_redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo(BITSELECT,262)
    bubble_select_redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_q(31 downto 0));

    -- bubble_join_redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo(BITJOIN,258)
    bubble_join_redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_q <= redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_data_out;

    -- bubble_select_redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo(BITSELECT,259)
    bubble_select_redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_q(2 downto 0));

    -- bubble_join_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo(BITJOIN,294)
    bubble_join_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_q <= redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_data_out;

    -- bubble_select_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo(BITSELECT,295)
    bubble_select_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_q(31 downto 0));

    -- bubble_join_redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo(BITJOIN,276)
    bubble_join_redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_q <= redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_data_out;

    -- bubble_select_redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo(BITSELECT,277)
    bubble_select_redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_q(63 downto 0));

    -- bubble_join_redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo(BITJOIN,267)
    bubble_join_redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_q <= redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_data_out;

    -- bubble_select_redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo(BITSELECT,268)
    bubble_select_redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_q(0 downto 0));

    -- dupName_0_sync_out_aunroll_x(GPOUT,2)@197
    out_c0_exe10 <= bubble_select_redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_b;
    out_c0_exe11 <= bubble_select_redist17_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_4_196_fifo_b;
    out_c0_exe121212 <= bubble_select_redist23_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_10_196_fifo_b;
    out_c0_exe7 <= bubble_select_redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_b;
    out_c0_exe8 <= bubble_select_redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_b;
    out_c0_exe9 <= bubble_select_redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_b;
    out_c0_exit223_0 <= bubble_select_redist0_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_0_182_fifo_b;
    out_c0_exit223_1 <= bubble_select_redist2_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_1_182_fifo_b;
    out_c0_exit223_2 <= bubble_select_redist3_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_2_182_fifo_b;
    out_c0_exit223_3 <= bubble_select_redist4_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_3_182_fifo_b;
    out_c0_exit223_4 <= bubble_select_redist6_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_4_182_fifo_b;
    out_c0_exit223_5 <= bubble_select_redist8_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_5_182_fifo_b;
    out_c0_exit223_6 <= bubble_select_redist9_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_6_182_fifo_b;
    out_c0_exit223_7 <= bubble_select_redist10_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_7_182_fifo_b;
    out_c0_exit223_8 <= bubble_select_redist11_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_8_182_fifo_b;
    out_c0_exit223_9 <= bubble_select_redist12_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_9_182_fifo_b;
    out_c0_exit223_10 <= bubble_select_redist13_i_sfc_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x3_aunroll_x_out_c0_exit223_10_182_fifo_b;
    out_c1_exe121813 <= bubble_select_redist24_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_11_196_fifo_b;
    out_c1_exe1230 <= bubble_select_i_sfc_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3x3_aunroll_x_b;
    out_c1_exe214 <= bubble_select_redist25_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_12_196_fifo_b;
    out_c1_exe315 <= bubble_select_redist26_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_13_196_fifo_b;
    out_c1_exe416 <= bubble_select_redist27_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_14_196_fifo_b;
    out_c1_exe517 <= bubble_select_redist28_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_15_196_fifo_b;
    out_c1_exe618 <= bubble_select_redist29_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_16_196_fifo_b;
    out_c1_exe719 <= bubble_select_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_b;
    out_i_0235 <= bubble_select_redist19_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_6_196_fifo_b;
    out_j_1159 <= bubble_select_redist21_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_8_196_fifo_b;
    out_output_im_addr_0227 <= bubble_select_redist20_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_7_196_fifo_b;
    out_output_im_addr_11411 <= bubble_select_redist22_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_9_196_fifo_b;
    out_unnamed_conv2d3x32 <= bubble_select_redist18_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_5_196_fifo_b;
    out_valid_out <= SE_out_redist30_conv2d3x3_B2_merge_reg_aunroll_x_out_data_out_17_196_fifo_V0;

    -- dupName_0_ext_sig_sync_out_x(GPOUT,9)
    out_memcoalesce_filter_weight_load_0_avm_address <= i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_address;
    out_memcoalesce_filter_weight_load_0_avm_enable <= i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_enable;
    out_memcoalesce_filter_weight_load_0_avm_read <= i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_read;
    out_memcoalesce_filter_weight_load_0_avm_write <= i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_write;
    out_memcoalesce_filter_weight_load_0_avm_writedata <= i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_writedata;
    out_memcoalesce_filter_weight_load_0_avm_byteenable <= i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_byteenable;
    out_memcoalesce_filter_weight_load_0_avm_burstcount <= i_load_memcoalesce_filter_weight_load_0_conv2d3x3_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_burstcount;

    -- ext_sig_sync_out(GPOUT,59)
    out_memcoalesce_input_im_load_0_avm_address <= i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_address;
    out_memcoalesce_input_im_load_0_avm_enable <= i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_enable;
    out_memcoalesce_input_im_load_0_avm_read <= i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_read;
    out_memcoalesce_input_im_load_0_avm_write <= i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_write;
    out_memcoalesce_input_im_load_0_avm_writedata <= i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_writedata;
    out_memcoalesce_input_im_load_0_avm_byteenable <= i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_byteenable;
    out_memcoalesce_input_im_load_0_avm_burstcount <= i_load_memcoalesce_input_im_load_0_conv2d3x3_aunroll_x_out_memcoalesce_input_im_load_0_avm_burstcount;

    -- sync_out(GPOUT,81)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
