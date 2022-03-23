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

-- VHDL created from bb_conv2d1x1_B2_stall_region
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

entity bb_conv2d1x1_B2_stall_region is
    port (
        out_c0_exe11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe134 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit33_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit33_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit33_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit33_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit33_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit33_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit33_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit33_7 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exit33_8 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exit33_9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit33_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exe3 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c2_exit_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exit_1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c2_exit_2 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c2_exit_3 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_i_0115 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_179 : out std_logic_vector(31 downto 0);  -- ufix32
        out_output_im_addr_0107 : out std_logic_vector(63 downto 0);  -- ufix64
        out_output_im_addr_1611 : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_conv2d1x12 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x14_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x14_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x14_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x14_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x14_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_conv2d1x14_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x14_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x14_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x14_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_conv2d1x14_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x14_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe11 : in std_logic_vector(63 downto 0);  -- ufix64
        in_i_0115 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_179 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_24 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im_addr_0107 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_1611 : in std_logic_vector(63 downto 0);  -- ufix64
        in_tmp_23 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d1x12 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x15_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x15_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x15_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x15_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x15_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_conv2d1x15_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x15_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x15_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x15_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_conv2d1x15_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x15_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
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
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size_x : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_size_y : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_conv2d1x13_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x13_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x13_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x13_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x13_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_conv2d1x13_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x13_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x13_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x13_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_conv2d1x13_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x13_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_conv2d1x1_B2_stall_region;

architecture normal of bb_conv2d1x1_B2_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component conv2d1x1_B2_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_data_in_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_data_in_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_7 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_data_out_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_data_out_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_7 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_memcoalesce_filter_weight_load_0_conv2d1x174 is
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


    component i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1 is
        port (
            in_c0_eni3_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni3_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size_x : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_size_y : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit27_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit27_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1 is
        port (
            in_c1_eni3_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni3_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni3_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni3_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size_x : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_size_y : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit33_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit33_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit33_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit33_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit33_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit33_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit33_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit33_7 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exit33_8 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exit33_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit33_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1 is
        port (
            in_c2_eni5_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_eni5_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c2_eni5_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c2_eni5_3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c2_eni5_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_eni5_5 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c2_eni5_6 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c2_eni5_7 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c2_eni5_8 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exit_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c2_exit_2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c2_exit_3 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_conv2d1x13_conv2d1x167 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x13_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x13_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x13_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x13_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x13_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x13_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x13_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x13_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x13_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x13_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x13_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_conv2d1x14_conv2d1x169 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x14_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x14_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x14_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x14_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_conv2d1x15_conv2d1x171 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x15_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x15_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x15_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x15_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_filter_weight_sync_buffer_conv2d1x120 is
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
    signal bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B2_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_idxprom21_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_o_readdata_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_o_readdata_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_o_readdata_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_o_readdata_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_out_c0_exit27_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_c2_exit_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_c2_exit_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_c2_exit_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_c2_exit_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_add_ptr_sum_conv2d1x1_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr_sum_conv2d1x1_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr_sum_conv2d1x1_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr_sum_conv2d1x1_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_load_unnamed_conv2d1x13_conv2d1x1_out_o_readdata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_conv2d1x13_conv2d1x1_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x13_conv2d1x1_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x13_conv2d1x1_out_unnamed_conv2d1x13_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal i_load_unnamed_conv2d1x13_conv2d1x1_out_unnamed_conv2d1x13_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_unnamed_conv2d1x13_conv2d1x1_out_unnamed_conv2d1x13_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_conv2d1x13_conv2d1x1_out_unnamed_conv2d1x13_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x13_conv2d1x1_out_unnamed_conv2d1x13_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x13_conv2d1x1_out_unnamed_conv2d1x13_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x13_conv2d1x1_out_unnamed_conv2d1x13_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_load_unnamed_conv2d1x14_conv2d1x1_out_o_readdata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_conv2d1x14_conv2d1x1_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x14_conv2d1x1_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_load_unnamed_conv2d1x15_conv2d1x1_out_o_readdata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_conv2d1x15_conv2d1x1_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x15_conv2d1x1_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_syncbuf_filter_weight_sync_buffer_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_filter_weight_sync_buffer_conv2d1x1_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_filter_weight_sync_buffer_conv2d1x1_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_2_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_2_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_conv2d1x1_B2_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (351 downto 0);
    signal bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_g : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_i : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_q : STD_LOGIC_VECTOR (167 downto 0);
    signal bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_d : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_e : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_f : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_g : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_h : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_i : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_j : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_k : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_l : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_q : STD_LOGIC_VECTOR (96 downto 0);
    signal bubble_select_i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_unnamed_conv2d1x13_conv2d1x1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_conv2d1x13_conv2d1x1_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_unnamed_conv2d1x14_conv2d1x1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_conv2d1x14_conv2d1x1_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_unnamed_conv2d1x15_conv2d1x1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_conv2d1x15_conv2d1x1_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (351 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_s_tv_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_data_in : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_data_out : STD_LOGIC_VECTOR (127 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_r_data2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_D2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_r_data2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_D2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_r_data2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_D2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_data2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_data3 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_data4 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_D2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_D3 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_D4 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_data2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_data3 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_data4 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_D2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_D3 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_D4 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_D0 : STD_LOGIC_VECTOR (63 downto 0);

begin


    -- SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1(STALLENABLE,318)
    -- Valid signal propagation
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_V0 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_R_v_0;
    -- Stall signal propagation
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_s_tv_0 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_backStall and SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_R_v_0;
    -- Backward Enable generation
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_backEN <= not (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_v_s_0 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_backEN and SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_V;
    -- Backward Stall generation
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_backStall <= not (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_backEN);
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_backEN = "0") THEN
                SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_R_v_0 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_R_v_0 and SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_s_tv_0;
            ELSE
                SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_R_v_0 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_join_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo(BITJOIN,255)
    bubble_join_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_q <= redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_data_out;

    -- bubble_select_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo(BITSELECT,256)
    bubble_select_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_q(63 downto 0));

    -- bubble_join_redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo(BITJOIN,249)
    bubble_join_redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_q <= redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_data_out;

    -- bubble_select_redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo(BITSELECT,250)
    bubble_select_redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_q(31 downto 0));

    -- i_idxprom21_conv2d1x1_sel_x(BITSELECT,43)@14
    i_idxprom21_conv2d1x1_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(bubble_select_redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_b(31 downto 0)), 64)));

    -- i_add_ptr_sum_conv2d1x1(ADD,54)@14
    i_add_ptr_sum_conv2d1x1_a <= STD_LOGIC_VECTOR("0" & i_idxprom21_conv2d1x1_sel_x_b);
    i_add_ptr_sum_conv2d1x1_b <= STD_LOGIC_VECTOR("0" & bubble_select_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_b);
    i_add_ptr_sum_conv2d1x1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_ptr_sum_conv2d1x1_a) + UNSIGNED(i_add_ptr_sum_conv2d1x1_b));
    i_add_ptr_sum_conv2d1x1_q <= i_add_ptr_sum_conv2d1x1_o(64 downto 0);

    -- bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x(BITSELECT,3)@14
    bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b <= i_add_ptr_sum_conv2d1x1_q(63 downto 0);

    -- SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x(STALLENABLE,284)
    -- Valid signal propagation
    SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_V0 <= SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_backStall <= bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_stall_out or not (SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_wireValid <= i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_o_valid;

    -- i_arrayidx22_conv2d1x1_conv2d1x173_mult_multconst_x(CONSTANT,37)
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0(REG,181)
    redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_backEN = "1") THEN
                redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select(BITSELECT,94)@15
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select_b <= redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_q(17 downto 0);
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select_c <= redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_q(63 downto 54);
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select_d <= redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_q(35 downto 18);
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select_e <= redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_q(53 downto 36);

    -- i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im3_shift0(BITSHIFT,91)@15
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im3_shift0_qint <= i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im3_shift0_q <= i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_align_15(BITSHIFT,85)@15
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_align_15_q <= i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im6_shift0(BITSHIFT,92)@15
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im6_shift0_qint <= i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im6_shift0_q <= i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_align_14(BITSHIFT,84)@15
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_align_14_q <= i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_join_16(BITJOIN,86)@15
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_join_16_q <= i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_align_15_q & i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_align_14_q;

    -- i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im9_shift0(BITSHIFT,93)@15
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im9_shift0_qint <= i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im9_shift0_q <= i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_align_12(BITSHIFT,82)@15
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_align_12_q <= i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im0_shift0(BITSHIFT,90)@15
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im0_shift0_qint <= i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im0_shift0_q <= i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_join_13(BITJOIN,83)@15
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_join_13_q <= i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_im0_shift0_q);

    -- i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_result_add_0_0(ADD,87)@15
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_join_13_q);
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_join_16_q);
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_result_add_0_0_b));
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_result_add_0_0_q <= i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx22_conv2d1x1_conv2d1x173_mult_extender_x(BITJOIN,36)@15
    i_arrayidx22_conv2d1x1_conv2d1x173_mult_extender_x_q <= i_arrayidx22_conv2d1x1_conv2d1x173_mult_multconst_x_q & i_arrayidx22_conv2d1x1_conv2d1x173_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x(BITSELECT,38)@15
    i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b <= i_arrayidx22_conv2d1x1_conv2d1x173_mult_extender_x_q(63 downto 0);

    -- redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0(REG,156)
    redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_syncbuf_filter_weight_sync_buffer_conv2d1x1(BITJOIN,209)
    bubble_join_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_q <= i_syncbuf_filter_weight_sync_buffer_conv2d1x1_out_buffer_out;

    -- bubble_select_i_syncbuf_filter_weight_sync_buffer_conv2d1x1(BITSELECT,210)
    bubble_select_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_q(63 downto 0));

    -- i_arrayidx22_conv2d1x1_conv2d1x173_add_x(ADD,39)@16
    i_arrayidx22_conv2d1x1_conv2d1x173_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_b);
    i_arrayidx22_conv2d1x1_conv2d1x173_add_x_b <= STD_LOGIC_VECTOR("0" & redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_q);
    i_arrayidx22_conv2d1x1_conv2d1x173_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx22_conv2d1x1_conv2d1x173_add_x_a) + UNSIGNED(i_arrayidx22_conv2d1x1_conv2d1x173_add_x_b));
    i_arrayidx22_conv2d1x1_conv2d1x173_add_x_q <= i_arrayidx22_conv2d1x1_conv2d1x173_add_x_o(64 downto 0);

    -- i_arrayidx22_conv2d1x1_conv2d1x173_dupName_0_trunc_sel_x(BITSELECT,33)@16
    i_arrayidx22_conv2d1x1_conv2d1x173_dupName_0_trunc_sel_x_b <= i_arrayidx22_conv2d1x1_conv2d1x173_add_x_q(63 downto 0);

    -- i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x(BLACKBOX,44)@16
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
    thei_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x : i_load_memcoalesce_filter_weight_load_0_conv2d1x174
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_arrayidx22_conv2d1x1_conv2d1x173_dupName_0_trunc_sel_x_b,
        in_i_predicate => bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_d,
        in_i_stall => SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_backStall,
        in_i_valid => SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_V0,
        in_memcoalesce_filter_weight_load_0_avm_readdata => in_memcoalesce_filter_weight_load_0_avm_readdata,
        in_memcoalesce_filter_weight_load_0_avm_readdatavalid => in_memcoalesce_filter_weight_load_0_avm_readdatavalid,
        in_memcoalesce_filter_weight_load_0_avm_waitrequest => in_memcoalesce_filter_weight_load_0_avm_waitrequest,
        in_memcoalesce_filter_weight_load_0_avm_writeack => in_memcoalesce_filter_weight_load_0_avm_writeack,
        out_o_readdata_0 => i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_o_readdata_0,
        out_o_readdata_1 => i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_o_readdata_1,
        out_o_readdata_2 => i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_o_readdata_2,
        out_o_readdata_3 => i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_o_readdata_3,
        out_memcoalesce_filter_weight_load_0_avm_address => i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_address,
        out_memcoalesce_filter_weight_load_0_avm_burstcount => i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_burstcount,
        out_memcoalesce_filter_weight_load_0_avm_byteenable => i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_byteenable,
        out_memcoalesce_filter_weight_load_0_avm_enable => i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_enable,
        out_memcoalesce_filter_weight_load_0_avm_read => i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_read,
        out_memcoalesce_filter_weight_load_0_avm_write => i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_write,
        out_memcoalesce_filter_weight_load_0_avm_writedata => i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_writedata,
        out_o_stall => i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_o_stall,
        out_o_valid => i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1(STALLENABLE,395)
    -- Valid signal propagation
    SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_V0 <= SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_backStall <= i_syncbuf_filter_weight_sync_buffer_conv2d1x1_out_stall_out or not (SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_wireValid <= bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg_valid_out;

    -- i_syncbuf_filter_weight_sync_buffer_conv2d1x1(BLACKBOX,61)@16
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_filter_weight_sync_buffer_conv2d1x1 : i_syncbuf_filter_weight_sync_buffer_conv2d1x120
    PORT MAP (
        in_buffer_in => in_filter_weight,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_backStall,
        in_valid_in => SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_V0,
        out_buffer_out => i_syncbuf_filter_weight_sync_buffer_conv2d1x1_out_buffer_out,
        out_stall_out => i_syncbuf_filter_weight_sync_buffer_conv2d1x1_out_stall_out,
        out_valid_out => i_syncbuf_filter_weight_sync_buffer_conv2d1x1_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1(STALLENABLE,299)
    -- Valid signal propagation
    SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_V0 <= SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_backStall <= i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_o_stall or not (SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_and0 <= i_syncbuf_filter_weight_sync_buffer_conv2d1x1_out_valid_out;
    SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_and1 <= SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_V0 and SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_and0;
    SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_wireValid <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_V0 and SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_and1;

    -- SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0(STALLENABLE,355)
    -- Valid signal propagation
    SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_V0 <= SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_s_tv_0 <= SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_backStall and SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_backEN <= not (SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_v_s_0 <= SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_backEN and SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_V0;
    -- Backward Stall generation
    SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_backStall <= not (SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_v_s_0);
    SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_R_v_0 <= SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_R_v_0 and SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_R_v_0 <= SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0(STALLENABLE,389)
    -- Valid signal propagation
    SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_V0 <= SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_s_tv_0 <= SE_redist16_i_arrayidx22_conv2d1x1_conv2d1x173_trunc_sel_x_b_1_0_backStall and SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_backEN <= not (SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_v_s_0 <= SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_backEN and SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_V;
    -- Backward Stall generation
    SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_backStall <= not (SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_backEN);
    SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_backEN = "0") THEN
                SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_R_v_0 <= SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_R_v_0 and SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_R_v_0 <= SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0(STALLREG,523)
    SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_r_valid <= (others => '0');
            SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_r_valid <= SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_backStall and (SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_r_valid or SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_i_valid);

            IF (SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_r_data0 <= STD_LOGIC_VECTOR(bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_i_valid <= SE_out_redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_V0;
    -- Stall signal propagation
    SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_backStall <= SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_r_valid or not (SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_i_valid);

    -- Valid
    SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_V <= SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_r_valid WHEN SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_r_valid = "1" ELSE SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_i_valid;

    SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_D0 <= SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_r_data0 WHEN SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_r_valid = "1" ELSE bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b;

    -- SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1(STALLENABLE,357)
    -- Valid signal propagation
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_V0 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_R_v_0;
    -- Stall signal propagation
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_s_tv_0 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_backStall and SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_R_v_0;
    -- Backward Enable generation
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_backEN <= not (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_v_s_0 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_backEN and SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_V;
    -- Backward Stall generation
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_backStall <= not (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_backEN);
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_backEN = "0") THEN
                SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_R_v_0 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_R_v_0 and SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_s_tv_0;
            ELSE
                SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_R_v_0 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_0(REG,174)
    redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_backEN = "1") THEN
                redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_0_q <= STD_LOGIC_VECTOR(bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_h);
            END IF;
        END IF;
    END PROCESS;

    -- redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_0(REG,167)
    redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_backEN = "1") THEN
                redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_0_q <= STD_LOGIC_VECTOR(bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_f);
            END IF;
        END IF;
    END PROCESS;

    -- redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0(REG,157)
    redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_backEN = "1") THEN
                redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_q <= STD_LOGIC_VECTOR(bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1(STALLREG,518)
    SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_r_valid <= (others => '0');
            SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_r_data0 <= (others => '-');
            SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_r_data1 <= (others => '-');
            SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_r_data2 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_r_valid <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_backStall and (SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_r_valid or SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_i_valid);

            IF (SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_r_data0 <= STD_LOGIC_VECTOR(redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_q);
                SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_r_data1 <= STD_LOGIC_VECTOR(redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_0_q);
                SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_r_data2 <= STD_LOGIC_VECTOR(redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_0_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_i_valid <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_V0;
    -- Stall signal propagation
    SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_backStall <= SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_r_valid or not (SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_i_valid);

    -- Valid
    SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_V <= SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_r_valid WHEN SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_r_valid = "1" ELSE SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_i_valid;

    -- Data0
    SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_D0 <= SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_r_data0 WHEN SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_r_valid = "1" ELSE redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_q;
    -- Data1
    SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_D1 <= SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_r_data1 WHEN SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_r_valid = "1" ELSE redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_0_q;
    -- Data2
    SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_D2 <= SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_r_data2 WHEN SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_r_valid = "1" ELSE redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_0_q;

    -- redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_1(REG,175)
    redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_backEN = "1") THEN
                redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_1_q <= STD_LOGIC_VECTOR(SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_D2);
            END IF;
        END IF;
    END PROCESS;

    -- redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_2(REG,176)
    redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_backEN = "1") THEN
                redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_2_q <= STD_LOGIC_VECTOR(redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_1(REG,168)
    redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_backEN = "1") THEN
                redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_1_q <= STD_LOGIC_VECTOR(SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_2(REG,169)
    redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_backEN = "1") THEN
                redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_2_q <= STD_LOGIC_VECTOR(redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1(REG,158)
    redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_backEN = "1") THEN
                redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_q <= STD_LOGIC_VECTOR(SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2(REG,159)
    redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_backEN = "1") THEN
                redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_q <= STD_LOGIC_VECTOR(redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2(STALLENABLE,358)
    -- Valid signal propagation
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_V0 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_R_v_0;
    -- Stall signal propagation
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_s_tv_0 <= SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_backStall and SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_R_v_0;
    -- Backward Enable generation
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_backEN <= not (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_v_s_0 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_backEN and SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_V0;
    -- Backward Stall generation
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_backStall <= not (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_v_s_0);
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_backEN = "0") THEN
                SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_R_v_0 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_R_v_0 and SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_s_tv_0;
            ELSE
                SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_R_v_0 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3(STALLREG,519)
    SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_r_valid <= (others => '0');
            SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_r_data0 <= (others => '-');
            SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_r_data1 <= (others => '-');
            SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_r_data2 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_r_valid <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_backStall and (SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_r_valid or SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_i_valid);

            IF (SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_r_data0 <= STD_LOGIC_VECTOR(redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_q);
                SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_r_data1 <= STD_LOGIC_VECTOR(redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_2_q);
                SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_r_data2 <= STD_LOGIC_VECTOR(redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_2_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_i_valid <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_V0;
    -- Stall signal propagation
    SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_backStall <= SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_r_valid or not (SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_i_valid);

    -- Valid
    SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_V <= SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_r_valid WHEN SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_r_valid = "1" ELSE SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_i_valid;

    -- Data0
    SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_D0 <= SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_r_data0 WHEN SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_r_valid = "1" ELSE redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_2_q;
    -- Data1
    SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_D1 <= SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_r_data1 WHEN SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_r_valid = "1" ELSE redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_2_q;
    -- Data2
    SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_D2 <= SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_r_data2 WHEN SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_r_valid = "1" ELSE redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_2_q;

    -- redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_3(REG,177)
    redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_backEN = "1") THEN
                redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_3_q <= STD_LOGIC_VECTOR(SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_D2);
            END IF;
        END IF;
    END PROCESS;

    -- redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_3(REG,170)
    redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_backEN = "1") THEN
                redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_3_q <= STD_LOGIC_VECTOR(SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3(REG,160)
    redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_backEN = "1") THEN
                redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_q <= STD_LOGIC_VECTOR(SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_D0);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3(STALLENABLE,359)
    -- Valid signal propagation
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_V0 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_R_v_0;
    -- Stall signal propagation
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_s_tv_0 <= SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_backStall and SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_R_v_0;
    -- Backward Enable generation
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_backEN <= not (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_v_s_0 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_backEN and SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_V;
    -- Backward Stall generation
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_backStall <= not (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_backEN);
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_backEN = "0") THEN
                SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_R_v_0 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_R_v_0 and SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_s_tv_0;
            ELSE
                SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_R_v_0 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4(STALLREG,520)
    SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_r_valid <= (others => '0');
            SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_r_data0 <= (others => '-');
            SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_r_data1 <= (others => '-');
            SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_r_data2 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_r_valid <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_backStall and (SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_r_valid or SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_i_valid);

            IF (SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_r_data0 <= STD_LOGIC_VECTOR(redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_q);
                SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_r_data1 <= STD_LOGIC_VECTOR(redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_3_q);
                SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_r_data2 <= STD_LOGIC_VECTOR(redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_3_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_i_valid <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_V0;
    -- Stall signal propagation
    SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_backStall <= SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_r_valid or not (SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_i_valid);

    -- Valid
    SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_V <= SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_r_valid WHEN SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_r_valid = "1" ELSE SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_i_valid;

    -- Data0
    SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_D0 <= SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_r_data0 WHEN SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_r_valid = "1" ELSE redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_3_q;
    -- Data1
    SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_D1 <= SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_r_data1 WHEN SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_r_valid = "1" ELSE redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_3_q;
    -- Data2
    SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_D2 <= SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_r_data2 WHEN SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_r_valid = "1" ELSE redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_3_q;

    -- redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4(REG,161)
    redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_backEN = "1") THEN
                redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_q <= STD_LOGIC_VECTOR(SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_D0);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4(STALLENABLE,360)
    -- Valid signal propagation
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_V0 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_0;
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_V1 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_1;
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_V2 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_2;
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_V3 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_3;
    -- Stall signal propagation
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_s_tv_0 <= redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_stall_out and SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_0;
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_s_tv_1 <= redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_stall_out and SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_1;
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_s_tv_2 <= redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_stall_out and SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_2;
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_s_tv_3 <= i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_out_o_stall and SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_3;
    -- Backward Enable generation
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_or0 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_s_tv_0;
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_or1 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_s_tv_1 or SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_or0;
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_or2 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_s_tv_2 or SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_or1;
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_backEN <= not (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_s_tv_3 or SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_or2);
    -- Determine whether to write valid data into the first register stage
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_v_s_0 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_backEN and SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_V;
    -- Backward Stall generation
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_backStall <= not (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_backEN);
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_0 <= (others => '0');
            SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_1 <= (others => '0');
            SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_2 <= (others => '0');
            SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_3 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_backEN = "0") THEN
                SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_0 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_0 and SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_s_tv_0;
            ELSE
                SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_0 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_v_s_0;
            END IF;

            IF (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_backEN = "0") THEN
                SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_1 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_1 and SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_s_tv_1;
            ELSE
                SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_1 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_v_s_0;
            END IF;

            IF (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_backEN = "0") THEN
                SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_2 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_2 and SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_s_tv_2;
            ELSE
                SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_2 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_v_s_0;
            END IF;

            IF (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_backEN = "0") THEN
                SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_3 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_3 and SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_s_tv_3;
            ELSE
                SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_R_v_3 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo(STALLFIFO,162)
    redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_valid_in <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_V0;
    redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_stall_in <= SE_out_redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_backStall;
    redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_data_in <= redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_q;
    redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_valid_in_bitsignaltemp <= redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_valid_in(0);
    redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_stall_in_bitsignaltemp <= redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_stall_in(0);
    redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_valid_out(0) <= redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_valid_out_bitsignaltemp;
    redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_stall_out(0) <= redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_stall_out_bitsignaltemp;
    theredist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 9,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_valid_in_bitsignaltemp,
        stall_in => redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_stall_in_bitsignaltemp,
        data_in => redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_q,
        valid_out => redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_valid_out_bitsignaltemp,
        stall_out => redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_stall_out_bitsignaltemp,
        data_out => redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo(STALLENABLE,362)
    -- Valid signal propagation
    SE_out_redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_V0 <= SE_out_redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_backStall <= SR_SE_redist29_bgTrunc_i_add_ptr_sum_conv2d1x1_sel_x_b_1_0_backStall or not (SE_out_redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_and0 <= redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_valid_out;
    SE_out_redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_wireValid <= SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_V0 and SE_out_redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_and0;

    -- SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo(STALLENABLE,366)
    SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_fromReg0 <= (others => '0');
            SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_fromReg0 <= SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_toReg0;
            -- Succesor 1
            SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_fromReg1 <= SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_consumed0 <= (not (SE_out_redist18_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_13_fifo_backStall) and SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_wireValid) or SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_fromReg0;
    SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_consumed1 <= (not (redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_stall_out) and SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_wireValid) or SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_fromReg1;
    -- Consuming
    SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_StallValid <= SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_backStall and SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_wireValid;
    SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_toReg0 <= SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_StallValid and SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_consumed0;
    SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_toReg1 <= SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_StallValid and SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_or0 <= SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_consumed0;
    SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_wireStall <= not (SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_consumed1 and SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_or0);
    SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_backStall <= SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_V0 <= SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_wireValid and not (SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_fromReg0);
    SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_V1 <= SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_wireValid and not (SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_wireValid <= redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_valid_out;

    -- redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo(STALLFIFO,164)
    redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_valid_in <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V4;
    redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_stall_in <= SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_backStall;
    redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_data_in <= bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_d;
    redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_valid_in_bitsignaltemp <= redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_valid_in(0);
    redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_stall_in_bitsignaltemp <= redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_stall_in(0);
    redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_valid_out(0) <= redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_valid_out_bitsignaltemp;
    redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_stall_out(0) <= redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_stall_out_bitsignaltemp;
    theredist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 14,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_valid_in_bitsignaltemp,
        stall_in => redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_d,
        valid_out => redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_valid_out_bitsignaltemp,
        stall_out => redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_stall_out_bitsignaltemp,
        data_out => redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0(STALLENABLE,356)
    -- Valid signal propagation
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_V0 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_R_v_0;
    -- Stall signal propagation
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_s_tv_0 <= SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_1_backStall and SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_R_v_0;
    -- Backward Enable generation
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_backEN <= not (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_v_s_0 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_backEN and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V1;
    -- Backward Stall generation
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_backStall <= not (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_v_s_0);
    SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_backEN = "0") THEN
                SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_R_v_0 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_R_v_0 and SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_s_tv_0;
            ELSE
                SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_R_v_0 <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg(STALLFIFO,516)
    bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg_valid_in <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V0;
    bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg_stall_in <= SE_out_bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_backStall;
    bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp <= bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg_valid_in(0);
    bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp <= bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg_stall_in(0);
    bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg_valid_out(0) <= bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp;
    bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg_stall_out(0) <= bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp;
    thebubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 16,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,300)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= conv2d1x1_B2_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,212)
    bubble_join_stall_entry_q <= in_unnamed_conv2d1x12 & in_tmp_23 & in_output_im_addr_1611 & in_output_im_addr_0107 & in_k_24 & in_j_179 & in_i_0115 & in_c0_exe11;

    -- bubble_select_stall_entry(BITSELECT,213)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(95 downto 64));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(127 downto 96));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(159 downto 128));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(223 downto 160));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(287 downto 224));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(319 downto 288));
    bubble_select_stall_entry_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(351 downto 320));

    -- conv2d1x1_B2_merge_reg_aunroll_x(BLACKBOX,4)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_data_out_2@1
    -- out out_data_out_3@1
    -- out out_data_out_4@1
    -- out out_data_out_5@1
    -- out out_data_out_6@1
    -- out out_data_out_7@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    theconv2d1x1_B2_merge_reg_aunroll_x : conv2d1x1_B2_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_e,
        in_data_in_1 => bubble_select_stall_entry_h,
        in_data_in_2 => bubble_select_stall_entry_b,
        in_data_in_3 => bubble_select_stall_entry_i,
        in_data_in_4 => bubble_select_stall_entry_c,
        in_data_in_5 => bubble_select_stall_entry_f,
        in_data_in_6 => bubble_select_stall_entry_d,
        in_data_in_7 => bubble_select_stall_entry_g,
        in_stall_in => SE_out_conv2d1x1_B2_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3,
        out_data_out_4 => conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4,
        out_data_out_5 => conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5,
        out_data_out_6 => conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6,
        out_data_out_7 => conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7,
        out_stall_out => conv2d1x1_B2_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => conv2d1x1_B2_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_conv2d1x1_B2_merge_reg_aunroll_x(STALLENABLE,277)
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg1 <= (others => '0');
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg2 <= (others => '0');
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg3 <= (others => '0');
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg4 <= (others => '0');
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg5 <= (others => '0');
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg6 <= (others => '0');
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg7 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg0 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg1 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg2 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg3 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg3;
            -- Succesor 4
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg4 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg4;
            -- Succesor 5
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg5 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg5;
            -- Succesor 6
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg6 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg6;
            -- Succesor 7
            SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg7 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg7;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed0 <= (not (bubble_out_conv2d1x1_B2_merge_reg_aunroll_x_1_reg_stall_out) and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg0;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed1 <= (not (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_0_backStall) and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg1;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed2 <= (not (i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_o_stall) and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg2;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed3 <= (not (redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_stall_out) and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg3;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed4 <= (not (redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_stall_out) and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg4;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed5 <= (not (redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_stall_out) and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg5;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed6 <= (not (redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_stall_out) and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg6;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed7 <= (not (redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_stall_out) and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid) or SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg7;
    -- Consuming
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_StallValid <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_backStall and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg0 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed0;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg1 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed1;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg2 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed2;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg3 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed3;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg4 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed4;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg5 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed5;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg6 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed6;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_toReg7 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_StallValid and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed7;
    -- Backward Stall generation
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or0 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed0;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or1 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed1 and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or0;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or2 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed2 and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or1;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or3 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed3 and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or2;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or4 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed4 and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or3;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or5 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed5 and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or4;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or6 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed6 and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or5;
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireStall <= not (SE_out_conv2d1x1_B2_merge_reg_aunroll_x_consumed7 and SE_out_conv2d1x1_B2_merge_reg_aunroll_x_or6);
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_backStall <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V0 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg0);
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V1 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg1);
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V2 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg2);
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V3 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg3);
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V4 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg4);
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V5 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg5);
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V6 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg6);
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V7 <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid and not (SE_out_conv2d1x1_B2_merge_reg_aunroll_x_fromReg7);
    -- Computing multiple Valid(s)
    SE_out_conv2d1x1_B2_merge_reg_aunroll_x_wireValid <= conv2d1x1_B2_merge_reg_aunroll_x_out_valid_out;

    -- SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x(STALLENABLE,288)
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg0 <= (others => '0');
            SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg1 <= (others => '0');
            SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg2 <= (others => '0');
            SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg3 <= (others => '0');
            SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg4 <= (others => '0');
            SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg5 <= (others => '0');
            SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg6 <= (others => '0');
            SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg7 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg0 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg1 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg2 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg3 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_toReg3;
            -- Succesor 4
            SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg4 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_toReg4;
            -- Succesor 5
            SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg5 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_toReg5;
            -- Succesor 6
            SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg6 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_toReg6;
            -- Succesor 7
            SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg7 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_toReg7;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed0 <= (not (SE_out_i_syncbuf_filter_weight_sync_buffer_conv2d1x1_backStall) and SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_wireValid) or SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg0;
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed1 <= (not (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_backStall) and SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_wireValid) or SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg1;
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed2 <= (not (redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_stall_out) and SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_wireValid) or SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg2;
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed3 <= (not (redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_stall_out) and SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_wireValid) or SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg3;
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed4 <= (not (redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_stall_out) and SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_wireValid) or SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg4;
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed5 <= (not (redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_stall_out) and SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_wireValid) or SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg5;
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed6 <= (not (redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_stall_out) and SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_wireValid) or SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg6;
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed7 <= (not (redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_stall_out) and SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_wireValid) or SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg7;
    -- Consuming
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_StallValid <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_backStall and SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_wireValid;
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_toReg0 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_StallValid and SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed0;
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_toReg1 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_StallValid and SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed1;
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_toReg2 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_StallValid and SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed2;
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_toReg3 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_StallValid and SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed3;
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_toReg4 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_StallValid and SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed4;
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_toReg5 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_StallValid and SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed5;
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_toReg6 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_StallValid and SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed6;
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_toReg7 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_StallValid and SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed7;
    -- Backward Stall generation
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_or0 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed0;
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_or1 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed1 and SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_or0;
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_or2 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed2 and SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_or1;
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_or3 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed3 and SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_or2;
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_or4 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed4 and SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_or3;
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_or5 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed5 and SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_or4;
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_or6 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed6 and SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_or5;
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_wireStall <= not (SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_consumed7 and SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_or6);
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_backStall <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_V0 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_wireValid and not (SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg0);
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_V1 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_wireValid and not (SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg1);
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_V2 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_wireValid and not (SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg2);
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_V3 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_wireValid and not (SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg3);
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_V4 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_wireValid and not (SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg4);
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_V5 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_wireValid and not (SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg5);
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_V6 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_wireValid and not (SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg6);
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_V7 <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_wireValid and not (SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_fromReg7);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_wireValid <= i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_o_valid;

    -- bubble_join_conv2d1x1_B2_merge_reg_aunroll_x(BITJOIN,183)
    bubble_join_conv2d1x1_B2_merge_reg_aunroll_x_q <= conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7 & conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6 & conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5 & conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4 & conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3 & conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2 & conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1 & conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_conv2d1x1_B2_merge_reg_aunroll_x(BITSELECT,184)
    bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B2_merge_reg_aunroll_x_q(31 downto 0));
    bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B2_merge_reg_aunroll_x_q(63 downto 32));
    bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B2_merge_reg_aunroll_x_q(127 downto 64));
    bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B2_merge_reg_aunroll_x_q(159 downto 128));
    bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B2_merge_reg_aunroll_x_q(191 downto 160));
    bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B2_merge_reg_aunroll_x_q(255 downto 192));
    bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B2_merge_reg_aunroll_x_q(287 downto 256));
    bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_conv2d1x1_B2_merge_reg_aunroll_x_q(351 downto 288));

    -- i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x(BLACKBOX,46)@1
    -- in in_i_stall@20000000
    -- out out_c1_exit33_0@16
    -- out out_c1_exit33_1@16
    -- out out_c1_exit33_2@16
    -- out out_c1_exit33_3@16
    -- out out_c1_exit33_4@16
    -- out out_c1_exit33_5@16
    -- out out_c1_exit33_6@16
    -- out out_c1_exit33_7@16
    -- out out_c1_exit33_8@16
    -- out out_c1_exit33_9@16
    -- out out_c1_exit33_10@16
    -- out out_o_stall@20000000
    -- out out_o_valid@16
    thei_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x : i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1
    PORT MAP (
        in_c1_eni3_0 => GND_q,
        in_c1_eni3_1 => bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_b,
        in_c1_eni3_2 => bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_f,
        in_c1_eni3_3 => bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_h,
        in_i_stall => SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_backStall,
        in_i_valid => SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V2,
        in_input_channels => in_input_channels,
        in_input_im => in_input_im,
        in_input_size_x => in_input_size_x,
        in_input_size_y => in_input_size_y,
        out_c1_exit33_0 => i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0,
        out_c1_exit33_1 => i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1,
        out_c1_exit33_2 => i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2,
        out_c1_exit33_3 => i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3,
        out_c1_exit33_4 => i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4,
        out_c1_exit33_5 => i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5,
        out_c1_exit33_6 => i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6,
        out_c1_exit33_7 => i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7,
        out_c1_exit33_8 => i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8,
        out_c1_exit33_9 => i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9,
        out_c1_exit33_10 => i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10,
        out_o_stall => i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x(BITJOIN,193)
    bubble_join_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_q <= i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10 & i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9 & i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8 & i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7 & i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6 & i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5 & i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4 & i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3 & i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2 & i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1 & i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0;

    -- bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x(BITSELECT,194)
    bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_q(0 downto 0));
    bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_q(1 downto 1));
    bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_q(2 downto 2));
    bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_q(3 downto 3));
    bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_q(4 downto 4));
    bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_q(5 downto 5));
    bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_q(6 downto 6));
    bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_q(70 downto 7));
    bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_q(134 downto 71));
    bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_q(166 downto 135));
    bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_q(167 downto 167));

    -- redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_0(REG,149)
    redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_backEN = "1") THEN
                redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_0_q <= STD_LOGIC_VECTOR(bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_j);
            END IF;
        END IF;
    END PROCESS;

    -- redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_0(REG,144)
    redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_backEN = "1") THEN
                redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_0_q <= STD_LOGIC_VECTOR(bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_i);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_0(REG,139)
    redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_backEN = "1") THEN
                redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_0_q <= STD_LOGIC_VECTOR(bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_h);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_0(REG,133)
    redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_backEN = "1") THEN
                redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_0_q <= STD_LOGIC_VECTOR(bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_f);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0(REG,127)
    redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_backEN = "1") THEN
                redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_q <= STD_LOGIC_VECTOR(bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_d);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0(STALLENABLE,317)
    -- Valid signal propagation
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_V0 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_R_v_0;
    -- Stall signal propagation
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_s_tv_0 <= SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_backStall and SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_R_v_0;
    -- Backward Enable generation
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_backEN <= not (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_v_s_0 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_backEN and SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_V1;
    -- Backward Stall generation
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_backStall <= not (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_v_s_0);
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_backEN = "0") THEN
                SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_R_v_0 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_R_v_0 and SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_s_tv_0;
            ELSE
                SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_R_v_0 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1(STALLREG,521)
    SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_valid <= (others => '0');
            SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_data0 <= (others => '-');
            SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_data1 <= (others => '-');
            SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_data2 <= (others => '-');
            SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_data3 <= (others => '-');
            SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_data4 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_valid <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_backStall and (SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_valid or SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_i_valid);

            IF (SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_data0 <= STD_LOGIC_VECTOR(redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_q);
                SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_data1 <= STD_LOGIC_VECTOR(redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_0_q);
                SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_data2 <= STD_LOGIC_VECTOR(redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_0_q);
                SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_data3 <= STD_LOGIC_VECTOR(redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_0_q);
                SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_data4 <= STD_LOGIC_VECTOR(redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_0_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_i_valid <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_V0;
    -- Stall signal propagation
    SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_backStall <= SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_valid or not (SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_i_valid);

    -- Valid
    SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_V <= SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_valid WHEN SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_valid = "1" ELSE SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_i_valid;

    -- Data0
    SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_D0 <= SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_data0 WHEN SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_valid = "1" ELSE redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_0_q;
    -- Data1
    SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_D1 <= SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_data1 WHEN SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_valid = "1" ELSE redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_0_q;
    -- Data2
    SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_D2 <= SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_data2 WHEN SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_valid = "1" ELSE redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_0_q;
    -- Data3
    SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_D3 <= SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_data3 WHEN SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_valid = "1" ELSE redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_0_q;
    -- Data4
    SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_D4 <= SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_data4 WHEN SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_r_valid = "1" ELSE redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_0_q;

    -- redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_1(REG,150)
    redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_backEN = "1") THEN
                redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_1_q <= STD_LOGIC_VECTOR(SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_D4);
            END IF;
        END IF;
    END PROCESS;

    -- redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_2(REG,151)
    redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_2_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_backEN = "1") THEN
                redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_2_q <= STD_LOGIC_VECTOR(redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_1(REG,145)
    redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_backEN = "1") THEN
                redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_1_q <= STD_LOGIC_VECTOR(SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_D3);
            END IF;
        END IF;
    END PROCESS;

    -- redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_2(REG,146)
    redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_2_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_backEN = "1") THEN
                redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_2_q <= STD_LOGIC_VECTOR(redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_1(REG,140)
    redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_backEN = "1") THEN
                redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_1_q <= STD_LOGIC_VECTOR(SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_D2);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_2(REG,141)
    redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_backEN = "1") THEN
                redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_2_q <= STD_LOGIC_VECTOR(redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_1(REG,134)
    redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_backEN = "1") THEN
                redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_1_q <= STD_LOGIC_VECTOR(SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_2(REG,135)
    redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_backEN = "1") THEN
                redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_2_q <= STD_LOGIC_VECTOR(redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1(REG,128)
    redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_backEN = "1") THEN
                redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_q <= STD_LOGIC_VECTOR(SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2(REG,129)
    redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_backEN = "1") THEN
                redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_q <= STD_LOGIC_VECTOR(redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2(STALLENABLE,319)
    -- Valid signal propagation
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_V0 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_R_v_0;
    -- Stall signal propagation
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_s_tv_0 <= SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_backStall and SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_R_v_0;
    -- Backward Enable generation
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_backEN <= not (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_v_s_0 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_backEN and SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_1_V0;
    -- Backward Stall generation
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_backStall <= not (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_v_s_0);
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_backEN = "0") THEN
                SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_R_v_0 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_R_v_0 and SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_s_tv_0;
            ELSE
                SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_R_v_0 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3(STALLREG,522)
    SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_valid <= (others => '0');
            SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_data0 <= (others => '-');
            SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_data1 <= (others => '-');
            SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_data2 <= (others => '-');
            SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_data3 <= (others => '-');
            SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_data4 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_valid <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_backStall and (SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_valid or SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_i_valid);

            IF (SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_data0 <= STD_LOGIC_VECTOR(redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_q);
                SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_data1 <= STD_LOGIC_VECTOR(redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_2_q);
                SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_data2 <= STD_LOGIC_VECTOR(redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_2_q);
                SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_data3 <= STD_LOGIC_VECTOR(redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_2_q);
                SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_data4 <= STD_LOGIC_VECTOR(redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_2_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_i_valid <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_V0;
    -- Stall signal propagation
    SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_backStall <= SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_valid or not (SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_i_valid);

    -- Valid
    SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V <= SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_valid WHEN SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_valid = "1" ELSE SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_i_valid;

    -- Data0
    SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_D0 <= SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_data0 WHEN SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_valid = "1" ELSE redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_2_q;
    -- Data1
    SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_D1 <= SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_data1 WHEN SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_valid = "1" ELSE redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_2_q;
    -- Data2
    SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_D2 <= SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_data2 WHEN SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_valid = "1" ELSE redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_2_q;
    -- Data3
    SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_D3 <= SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_data3 WHEN SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_valid = "1" ELSE redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_2_q;
    -- Data4
    SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_D4 <= SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_data4 WHEN SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_r_valid = "1" ELSE redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_2_q;

    -- SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3(STALLENABLE,320)
    -- Valid signal propagation
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V0 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_0;
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V1 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_1;
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V2 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_2;
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V3 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_3;
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V4 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_4;
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V5 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_5;
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V6 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_6;
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V7 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_7;
    -- Stall signal propagation
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_0 <= SE_out_i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_backStall and SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_0;
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_1 <= redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_stall_out and SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_1;
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_2 <= redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_stall_out and SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_2;
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_3 <= redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_stall_out and SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_3;
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_4 <= redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_stall_out and SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_4;
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_5 <= redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_stall_out and SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_5;
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_6 <= i_load_unnamed_conv2d1x14_conv2d1x1_out_o_stall and SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_6;
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_7 <= i_load_unnamed_conv2d1x15_conv2d1x1_out_o_stall and SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_7;
    -- Backward Enable generation
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_or0 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_0;
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_or1 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_1 or SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_or0;
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_or2 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_2 or SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_or1;
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_or3 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_3 or SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_or2;
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_or4 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_4 or SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_or3;
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_or5 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_5 or SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_or4;
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_or6 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_6 or SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_or5;
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_backEN <= not (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_7 or SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_or6);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_v_s_0 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_backEN and SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V;
    -- Backward Stall generation
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_backStall <= not (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_backEN);
    SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_0 <= (others => '0');
            SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_1 <= (others => '0');
            SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_2 <= (others => '0');
            SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_3 <= (others => '0');
            SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_4 <= (others => '0');
            SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_5 <= (others => '0');
            SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_6 <= (others => '0');
            SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_7 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_backEN = "0") THEN
                SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_0 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_0 and SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_0;
            ELSE
                SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_0 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_v_s_0;
            END IF;

            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_backEN = "0") THEN
                SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_1 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_1 and SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_1;
            ELSE
                SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_1 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_v_s_0;
            END IF;

            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_backEN = "0") THEN
                SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_2 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_2 and SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_2;
            ELSE
                SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_2 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_v_s_0;
            END IF;

            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_backEN = "0") THEN
                SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_3 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_3 and SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_3;
            ELSE
                SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_3 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_v_s_0;
            END IF;

            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_backEN = "0") THEN
                SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_4 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_4 and SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_4;
            ELSE
                SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_4 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_v_s_0;
            END IF;

            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_backEN = "0") THEN
                SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_5 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_5 and SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_5;
            ELSE
                SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_5 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_v_s_0;
            END IF;

            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_backEN = "0") THEN
                SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_6 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_6 and SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_6;
            ELSE
                SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_6 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_v_s_0;
            END IF;

            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_backEN = "0") THEN
                SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_7 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_7 and SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_s_tv_7;
            ELSE
                SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_R_v_7 <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_4(REG,178)
    redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_4_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_backEN = "1") THEN
                redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_4_q <= STD_LOGIC_VECTOR(SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_D2);
            END IF;
        END IF;
    END PROCESS;

    -- redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_4(REG,171)
    redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_4_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_backEN = "1") THEN
                redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_4_q <= STD_LOGIC_VECTOR(SR_SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_D1);
            END IF;
        END IF;
    END PROCESS;

    -- i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x(BLACKBOX,45)@6
    -- in in_i_stall@20000000
    -- out out_c0_exit27_0@20
    -- out out_c0_exit27_1@20
    -- out out_o_stall@20000000
    -- out out_o_valid@20
    thei_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x : i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1
    PORT MAP (
        in_c0_eni3_0 => GND_q,
        in_c0_eni3_1 => redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_q,
        in_c0_eni3_2 => redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_4_q,
        in_c0_eni3_3 => redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_4_q,
        in_i_stall => SE_out_i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_backStall,
        in_i_valid => SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_V3,
        in_input_im => in_input_im,
        in_input_size_x => in_input_size_x,
        in_input_size_y => in_input_size_y,
        out_c0_exit27_1 => i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_out_c0_exit27_1,
        out_o_stall => i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x(STALLENABLE,286)
    -- Valid signal propagation
    SE_out_i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_V0 <= SE_out_i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_backStall <= i_load_unnamed_conv2d1x13_conv2d1x1_out_o_stall or not (SE_out_i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_and0 <= i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_out_o_valid;
    SE_out_i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_wireValid <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V0 and SE_out_i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_and0;

    -- redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3(REG,130)
    redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_backEN = "1") THEN
                redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_q <= STD_LOGIC_VECTOR(SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_D0);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x(BITJOIN,190)
    bubble_join_i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_q <= i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_out_c0_exit27_1;

    -- bubble_select_i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x(BITSELECT,191)
    bubble_select_i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_q(63 downto 0));

    -- i_load_unnamed_conv2d1x13_conv2d1x1(BLACKBOX,57)@20
    -- in in_i_stall@20000000
    -- out out_o_readdata@141
    -- out out_o_stall@20000000
    -- out out_o_valid@141
    -- out out_unnamed_conv2d1x13_avm_address@20000000
    -- out out_unnamed_conv2d1x13_avm_burstcount@20000000
    -- out out_unnamed_conv2d1x13_avm_byteenable@20000000
    -- out out_unnamed_conv2d1x13_avm_enable@20000000
    -- out out_unnamed_conv2d1x13_avm_read@20000000
    -- out out_unnamed_conv2d1x13_avm_write@20000000
    -- out out_unnamed_conv2d1x13_avm_writedata@20000000
    thei_load_unnamed_conv2d1x13_conv2d1x1 : i_load_unnamed_conv2d1x13_conv2d1x167
    PORT MAP (
        in_flush => in_flush,
        in_i_address => bubble_select_i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_b,
        in_i_predicate => redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_q,
        in_i_stall => SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_backStall,
        in_i_valid => SE_out_i_sfc_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x1_aunroll_x_V0,
        in_unnamed_conv2d1x13_avm_readdata => in_unnamed_conv2d1x13_avm_readdata,
        in_unnamed_conv2d1x13_avm_readdatavalid => in_unnamed_conv2d1x13_avm_readdatavalid,
        in_unnamed_conv2d1x13_avm_waitrequest => in_unnamed_conv2d1x13_avm_waitrequest,
        in_unnamed_conv2d1x13_avm_writeack => in_unnamed_conv2d1x13_avm_writeack,
        out_o_readdata => i_load_unnamed_conv2d1x13_conv2d1x1_out_o_readdata,
        out_o_stall => i_load_unnamed_conv2d1x13_conv2d1x1_out_o_stall,
        out_o_valid => i_load_unnamed_conv2d1x13_conv2d1x1_out_o_valid,
        out_unnamed_conv2d1x13_avm_address => i_load_unnamed_conv2d1x13_conv2d1x1_out_unnamed_conv2d1x13_avm_address,
        out_unnamed_conv2d1x13_avm_burstcount => i_load_unnamed_conv2d1x13_conv2d1x1_out_unnamed_conv2d1x13_avm_burstcount,
        out_unnamed_conv2d1x13_avm_byteenable => i_load_unnamed_conv2d1x13_conv2d1x1_out_unnamed_conv2d1x13_avm_byteenable,
        out_unnamed_conv2d1x13_avm_enable => i_load_unnamed_conv2d1x13_conv2d1x1_out_unnamed_conv2d1x13_avm_enable,
        out_unnamed_conv2d1x13_avm_read => i_load_unnamed_conv2d1x13_conv2d1x1_out_unnamed_conv2d1x13_avm_read,
        out_unnamed_conv2d1x13_avm_write => i_load_unnamed_conv2d1x13_conv2d1x1_out_unnamed_conv2d1x13_avm_write,
        out_unnamed_conv2d1x13_avm_writedata => i_load_unnamed_conv2d1x13_conv2d1x1_out_unnamed_conv2d1x13_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_3(REG,136)
    redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_backEN = "1") THEN
                redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_3_q <= STD_LOGIC_VECTOR(SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_3(REG,147)
    redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_3_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_backEN = "1") THEN
                redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_3_q <= STD_LOGIC_VECTOR(SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_D3);
            END IF;
        END IF;
    END PROCESS;

    -- i_load_unnamed_conv2d1x14_conv2d1x1(BLACKBOX,58)@20
    -- in in_i_stall@20000000
    -- out out_o_readdata@141
    -- out out_o_stall@20000000
    -- out out_o_valid@141
    -- out out_unnamed_conv2d1x14_avm_address@20000000
    -- out out_unnamed_conv2d1x14_avm_burstcount@20000000
    -- out out_unnamed_conv2d1x14_avm_byteenable@20000000
    -- out out_unnamed_conv2d1x14_avm_enable@20000000
    -- out out_unnamed_conv2d1x14_avm_read@20000000
    -- out out_unnamed_conv2d1x14_avm_write@20000000
    -- out out_unnamed_conv2d1x14_avm_writedata@20000000
    thei_load_unnamed_conv2d1x14_conv2d1x1 : i_load_unnamed_conv2d1x14_conv2d1x169
    PORT MAP (
        in_flush => in_flush,
        in_i_address => redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_3_q,
        in_i_predicate => redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_3_q,
        in_i_stall => SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_backStall,
        in_i_valid => SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V6,
        in_unnamed_conv2d1x14_avm_readdata => in_unnamed_conv2d1x14_avm_readdata,
        in_unnamed_conv2d1x14_avm_readdatavalid => in_unnamed_conv2d1x14_avm_readdatavalid,
        in_unnamed_conv2d1x14_avm_waitrequest => in_unnamed_conv2d1x14_avm_waitrequest,
        in_unnamed_conv2d1x14_avm_writeack => in_unnamed_conv2d1x14_avm_writeack,
        out_o_readdata => i_load_unnamed_conv2d1x14_conv2d1x1_out_o_readdata,
        out_o_stall => i_load_unnamed_conv2d1x14_conv2d1x1_out_o_stall,
        out_o_valid => i_load_unnamed_conv2d1x14_conv2d1x1_out_o_valid,
        out_unnamed_conv2d1x14_avm_address => i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_address,
        out_unnamed_conv2d1x14_avm_burstcount => i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_burstcount,
        out_unnamed_conv2d1x14_avm_byteenable => i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_byteenable,
        out_unnamed_conv2d1x14_avm_enable => i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_enable,
        out_unnamed_conv2d1x14_avm_read => i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_read,
        out_unnamed_conv2d1x14_avm_write => i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_write,
        out_unnamed_conv2d1x14_avm_writedata => i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_3(REG,142)
    redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_backEN = "1") THEN
                redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_3_q <= STD_LOGIC_VECTOR(SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_D2);
            END IF;
        END IF;
    END PROCESS;

    -- redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_3(REG,152)
    redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_3_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_backEN = "1") THEN
                redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_3_q <= STD_LOGIC_VECTOR(SR_SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_D4);
            END IF;
        END IF;
    END PROCESS;

    -- i_load_unnamed_conv2d1x15_conv2d1x1(BLACKBOX,59)@20
    -- in in_i_stall@20000000
    -- out out_o_readdata@141
    -- out out_o_stall@20000000
    -- out out_o_valid@141
    -- out out_unnamed_conv2d1x15_avm_address@20000000
    -- out out_unnamed_conv2d1x15_avm_burstcount@20000000
    -- out out_unnamed_conv2d1x15_avm_byteenable@20000000
    -- out out_unnamed_conv2d1x15_avm_enable@20000000
    -- out out_unnamed_conv2d1x15_avm_read@20000000
    -- out out_unnamed_conv2d1x15_avm_write@20000000
    -- out out_unnamed_conv2d1x15_avm_writedata@20000000
    thei_load_unnamed_conv2d1x15_conv2d1x1 : i_load_unnamed_conv2d1x15_conv2d1x171
    PORT MAP (
        in_flush => in_flush,
        in_i_address => redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_3_q,
        in_i_predicate => redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_3_q,
        in_i_stall => SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_backStall,
        in_i_valid => SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V7,
        in_unnamed_conv2d1x15_avm_readdata => in_unnamed_conv2d1x15_avm_readdata,
        in_unnamed_conv2d1x15_avm_readdatavalid => in_unnamed_conv2d1x15_avm_readdatavalid,
        in_unnamed_conv2d1x15_avm_waitrequest => in_unnamed_conv2d1x15_avm_waitrequest,
        in_unnamed_conv2d1x15_avm_writeack => in_unnamed_conv2d1x15_avm_writeack,
        out_o_readdata => i_load_unnamed_conv2d1x15_conv2d1x1_out_o_readdata,
        out_o_stall => i_load_unnamed_conv2d1x15_conv2d1x1_out_o_stall,
        out_o_valid => i_load_unnamed_conv2d1x15_conv2d1x1_out_o_valid,
        out_unnamed_conv2d1x15_avm_address => i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_address,
        out_unnamed_conv2d1x15_avm_burstcount => i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_burstcount,
        out_unnamed_conv2d1x15_avm_byteenable => i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_byteenable,
        out_unnamed_conv2d1x15_avm_enable => i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_enable,
        out_unnamed_conv2d1x15_avm_read => i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_read,
        out_unnamed_conv2d1x15_avm_write => i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_write,
        out_unnamed_conv2d1x15_avm_writedata => i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo(STALLFIFO,163)
    redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_valid_in <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V3;
    redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_stall_in <= SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_backStall;
    redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_data_in <= bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_c;
    redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_valid_in_bitsignaltemp <= redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_valid_in(0);
    redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_stall_in_bitsignaltemp <= redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_stall_in(0);
    redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_valid_out(0) <= redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_valid_out_bitsignaltemp;
    redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_stall_out(0) <= redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_stall_out_bitsignaltemp;
    theredist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 141,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_valid_in_bitsignaltemp,
        stall_in => redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_c,
        valid_out => redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_valid_out_bitsignaltemp,
        stall_out => redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_stall_out_bitsignaltemp,
        data_out => redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x(BITJOIN,187)
    bubble_join_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_q <= i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_o_readdata_3 & i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_o_readdata_2 & i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_o_readdata_1 & i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_o_readdata_0;

    -- bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg(STALLFIFO,517)
    bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_valid_in <= SE_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_V0;
    bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_stall_in <= SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_backStall;
    bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_data_in <= bubble_join_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_q;
    bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_valid_in_bitsignaltemp <= bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_valid_in(0);
    bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_stall_in_bitsignaltemp <= bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_stall_in(0);
    bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_valid_out(0) <= bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_valid_out_bitsignaltemp;
    bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_stall_out(0) <= bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_stall_out_bitsignaltemp;
    thebubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg : acl_data_fifo
    GENERIC MAP (
        DEPTH => 1,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 1,
        DATA_WIDTH => 128,
        IMPL => "zl_reg"
    )
    PORT MAP (
        valid_in => bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_stall_in_bitsignaltemp,
        data_in => bubble_join_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_q,
        valid_out => bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_stall_out_bitsignaltemp,
        data_out => bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data(STALLENABLE,397)
    -- Valid signal propagation
    SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_V0 <= SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_backStall <= i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_o_stall or not (SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_and0 <= bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_valid_out;
    SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_and1 <= redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_valid_out and SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_and0;
    SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_and2 <= i_load_unnamed_conv2d1x15_conv2d1x1_out_o_valid and SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_and1;
    SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_and3 <= i_load_unnamed_conv2d1x14_conv2d1x1_out_o_valid and SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_and2;
    SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_wireValid <= i_load_unnamed_conv2d1x13_conv2d1x1_out_o_valid and SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_and3;

    -- bubble_join_i_load_unnamed_conv2d1x15_conv2d1x1(BITJOIN,206)
    bubble_join_i_load_unnamed_conv2d1x15_conv2d1x1_q <= i_load_unnamed_conv2d1x15_conv2d1x1_out_o_readdata;

    -- bubble_select_i_load_unnamed_conv2d1x15_conv2d1x1(BITSELECT,207)
    bubble_select_i_load_unnamed_conv2d1x15_conv2d1x1_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_conv2d1x15_conv2d1x1_q(31 downto 0));

    -- bubble_join_i_load_unnamed_conv2d1x14_conv2d1x1(BITJOIN,203)
    bubble_join_i_load_unnamed_conv2d1x14_conv2d1x1_q <= i_load_unnamed_conv2d1x14_conv2d1x1_out_o_readdata;

    -- bubble_select_i_load_unnamed_conv2d1x14_conv2d1x1(BITSELECT,204)
    bubble_select_i_load_unnamed_conv2d1x14_conv2d1x1_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_conv2d1x14_conv2d1x1_q(31 downto 0));

    -- bubble_join_redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo(BITJOIN,252)
    bubble_join_redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_q <= redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_data_out;

    -- bubble_select_redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo(BITSELECT,253)
    bubble_select_redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_q(31 downto 0));

    -- bubble_join_i_load_unnamed_conv2d1x13_conv2d1x1(BITJOIN,200)
    bubble_join_i_load_unnamed_conv2d1x13_conv2d1x1_q <= i_load_unnamed_conv2d1x13_conv2d1x1_out_o_readdata;

    -- bubble_select_i_load_unnamed_conv2d1x13_conv2d1x1(BITSELECT,201)
    bubble_select_i_load_unnamed_conv2d1x13_conv2d1x1_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_conv2d1x13_conv2d1x1_q(31 downto 0));

    -- bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x(BITSELECT,188)
    bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_data_out(31 downto 0));
    bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_data_out(63 downto 32));
    bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_data_out(95 downto 64));
    bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_reg_data_out(127 downto 96));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x(BLACKBOX,47)@141
    -- in in_i_stall@20000000
    -- out out_c2_exit_0@196
    -- out out_c2_exit_1@196
    -- out out_c2_exit_2@196
    -- out out_c2_exit_3@196
    -- out out_o_stall@20000000
    -- out out_o_valid@196
    thei_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x : i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1
    PORT MAP (
        in_c2_eni5_0 => GND_q,
        in_c2_eni5_1 => bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_b,
        in_c2_eni5_2 => bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_c,
        in_c2_eni5_3 => bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_d,
        in_c2_eni5_4 => bubble_select_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_e,
        in_c2_eni5_5 => bubble_select_i_load_unnamed_conv2d1x13_conv2d1x1_b,
        in_c2_eni5_6 => bubble_select_redist19_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_1_140_fifo_b,
        in_c2_eni5_7 => bubble_select_i_load_unnamed_conv2d1x14_conv2d1x1_b,
        in_c2_eni5_8 => bubble_select_i_load_unnamed_conv2d1x15_conv2d1x1_b,
        in_i_stall => SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_backStall,
        in_i_valid => SE_out_bubble_out_i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_data_V0,
        out_c2_exit_0 => i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_c2_exit_0,
        out_c2_exit_1 => i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_c2_exit_1,
        out_c2_exit_2 => i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_c2_exit_2,
        out_c2_exit_3 => i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_c2_exit_3,
        out_o_stall => i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo(STALLFIFO,125)
    redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_valid_in <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_V2;
    redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_stall_in <= SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_backStall;
    redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_data_in <= bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_b;
    redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_valid_in_bitsignaltemp <= redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_valid_in(0);
    redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_stall_in_bitsignaltemp <= redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_stall_in(0);
    redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_valid_out(0) <= redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_valid_out_bitsignaltemp;
    redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_stall_out(0) <= redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_stall_out_bitsignaltemp;
    theredist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 181,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_valid_in_bitsignaltemp,
        stall_in => redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_b,
        valid_out => redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_valid_out_bitsignaltemp,
        stall_out => redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_stall_out_bitsignaltemp,
        data_out => redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo(STALLFIFO,126)
    redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_valid_in <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_V3;
    redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_stall_in <= SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_backStall;
    redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_data_in <= bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_c;
    redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_valid_in_bitsignaltemp <= redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_valid_in(0);
    redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_stall_in_bitsignaltemp <= redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_stall_in(0);
    redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_valid_out(0) <= redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_valid_out_bitsignaltemp;
    redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_stall_out(0) <= redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_stall_out_bitsignaltemp;
    theredist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 181,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_valid_in_bitsignaltemp,
        stall_in => redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_c,
        valid_out => redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_valid_out_bitsignaltemp,
        stall_out => redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_stall_out_bitsignaltemp,
        data_out => redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo(STALLFIFO,131)
    redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_valid_in <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V1;
    redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_stall_in <= SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_backStall;
    redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_data_in <= redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_q;
    redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_valid_in_bitsignaltemp <= redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_valid_in(0);
    redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_stall_in_bitsignaltemp <= redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_stall_in(0);
    redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_valid_out(0) <= redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_valid_out_bitsignaltemp;
    redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_stall_out(0) <= redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_stall_out_bitsignaltemp;
    theredist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 177,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_valid_in_bitsignaltemp,
        stall_in => redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_stall_in_bitsignaltemp,
        data_in => redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_q,
        valid_out => redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_valid_out_bitsignaltemp,
        stall_out => redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_stall_out_bitsignaltemp,
        data_out => redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo(STALLFIFO,132)
    redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_valid_in <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_V4;
    redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_stall_in <= SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_backStall;
    redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_data_in <= bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_e;
    redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_valid_in_bitsignaltemp <= redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_valid_in(0);
    redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_stall_in_bitsignaltemp <= redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_stall_in(0);
    redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_valid_out(0) <= redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_valid_out_bitsignaltemp;
    redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_stall_out(0) <= redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_stall_out_bitsignaltemp;
    theredist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 181,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_valid_in_bitsignaltemp,
        stall_in => redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_e,
        valid_out => redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_valid_out_bitsignaltemp,
        stall_out => redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_stall_out_bitsignaltemp,
        data_out => redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo(STALLFIFO,137)
    redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_valid_in <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V2;
    redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_stall_in <= SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_backStall;
    redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_data_in <= redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_3_q;
    redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_valid_in_bitsignaltemp <= redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_valid_in(0);
    redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_stall_in_bitsignaltemp <= redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_stall_in(0);
    redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_valid_out(0) <= redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_valid_out_bitsignaltemp;
    redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_stall_out(0) <= redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_stall_out_bitsignaltemp;
    theredist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 177,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_valid_in_bitsignaltemp,
        stall_in => redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_stall_in_bitsignaltemp,
        data_in => redist5_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_4_3_q,
        valid_out => redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_valid_out_bitsignaltemp,
        stall_out => redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_stall_out_bitsignaltemp,
        data_out => redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo(STALLFIFO,138)
    redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_valid_in <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_V5;
    redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_stall_in <= SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_backStall;
    redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_data_in <= bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_g;
    redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_valid_in_bitsignaltemp <= redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_valid_in(0);
    redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_stall_in_bitsignaltemp <= redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_stall_in(0);
    redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_valid_out(0) <= redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_valid_out_bitsignaltemp;
    redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_stall_out(0) <= redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_stall_out_bitsignaltemp;
    theredist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 181,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_valid_in_bitsignaltemp,
        stall_in => redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_g,
        valid_out => redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_valid_out_bitsignaltemp,
        stall_out => redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_stall_out_bitsignaltemp,
        data_out => redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo(STALLFIFO,143)
    redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_valid_in <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V3;
    redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_stall_in <= SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_backStall;
    redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_data_in <= redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_3_q;
    redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_valid_in_bitsignaltemp <= redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_valid_in(0);
    redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_stall_in_bitsignaltemp <= redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_stall_in(0);
    redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_valid_out(0) <= redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_valid_out_bitsignaltemp;
    redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_stall_out(0) <= redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_stall_out_bitsignaltemp;
    theredist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 177,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_valid_in_bitsignaltemp,
        stall_in => redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_stall_in_bitsignaltemp,
        data_in => redist8_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_4_3_q,
        valid_out => redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_valid_out_bitsignaltemp,
        stall_out => redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_stall_out_bitsignaltemp,
        data_out => redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo(STALLFIFO,148)
    redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_valid_in <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V4;
    redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_stall_in <= SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_backStall;
    redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_data_in <= redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_3_q;
    redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_valid_in_bitsignaltemp <= redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_valid_in(0);
    redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_stall_in_bitsignaltemp <= redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_stall_in(0);
    redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_valid_out(0) <= redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_valid_out_bitsignaltemp;
    redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_stall_out(0) <= redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_stall_out_bitsignaltemp;
    theredist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 177,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_valid_in_bitsignaltemp,
        stall_in => redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_stall_in_bitsignaltemp,
        data_in => redist10_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_4_3_q,
        valid_out => redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_valid_out_bitsignaltemp,
        stall_out => redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_stall_out_bitsignaltemp,
        data_out => redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo(STALLFIFO,153)
    redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_valid_in <= SE_redist2_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_4_3_V5;
    redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_stall_in <= SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_backStall;
    redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_data_in <= redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_3_q;
    redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_valid_in_bitsignaltemp <= redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_valid_in(0);
    redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_stall_in_bitsignaltemp <= redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_stall_in(0);
    redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_valid_out(0) <= redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_valid_out_bitsignaltemp;
    redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_stall_out(0) <= redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_stall_out_bitsignaltemp;
    theredist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 177,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_valid_in_bitsignaltemp,
        stall_in => redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_stall_in_bitsignaltemp,
        data_in => redist12_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_4_3_q,
        valid_out => redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_valid_out_bitsignaltemp,
        stall_out => redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_stall_out_bitsignaltemp,
        data_out => redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo(STALLFIFO,154)
    redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_valid_in <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_V6;
    redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_stall_in <= SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_backStall;
    redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_data_in <= bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_k;
    redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_valid_in_bitsignaltemp <= redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_valid_in(0);
    redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_stall_in_bitsignaltemp <= redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_stall_in(0);
    redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_valid_out(0) <= redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_valid_out_bitsignaltemp;
    redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_stall_out(0) <= redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_stall_out_bitsignaltemp;
    theredist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 181,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_valid_in_bitsignaltemp,
        stall_in => redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_k,
        valid_out => redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_valid_out_bitsignaltemp,
        stall_out => redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_stall_out_bitsignaltemp,
        data_out => redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo(STALLFIFO,155)
    redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_valid_in <= SE_out_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_V7;
    redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_stall_in <= SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_backStall;
    redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_data_in <= bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_l;
    redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_valid_in_bitsignaltemp <= redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_valid_in(0);
    redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_stall_in_bitsignaltemp <= redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_stall_in(0);
    redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_valid_out(0) <= redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_valid_out_bitsignaltemp;
    redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_stall_out(0) <= redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_stall_out_bitsignaltemp;
    theredist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 181,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_valid_in_bitsignaltemp,
        stall_in => redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_l,
        valid_out => redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_valid_out_bitsignaltemp,
        stall_out => redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_stall_out_bitsignaltemp,
        data_out => redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo(STALLFIFO,165)
    redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_valid_in <= SE_out_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_V1;
    redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_stall_in <= SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_backStall;
    redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_data_in <= bubble_select_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_b;
    redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_valid_in_bitsignaltemp <= redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_valid_in(0);
    redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_stall_in_bitsignaltemp <= redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_stall_in(0);
    redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_valid_out(0) <= redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_valid_out_bitsignaltemp;
    redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_stall_out(0) <= redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_stall_out_bitsignaltemp;
    theredist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 183,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_valid_in_bitsignaltemp,
        stall_in => redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist20_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_13_fifo_b,
        valid_out => redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_valid_out_bitsignaltemp,
        stall_out => redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_stall_out_bitsignaltemp,
        data_out => redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo(STALLFIFO,166)
    redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_valid_in <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V5;
    redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_stall_in <= SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_backStall;
    redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_data_in <= bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_e;
    redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_valid_in_bitsignaltemp <= redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_valid_in(0);
    redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_stall_in_bitsignaltemp <= redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_stall_in(0);
    redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_valid_out(0) <= redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_valid_out_bitsignaltemp;
    redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_stall_out(0) <= redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_stall_out_bitsignaltemp;
    theredist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 196,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_valid_in_bitsignaltemp,
        stall_in => redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_e,
        valid_out => redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_valid_out_bitsignaltemp,
        stall_out => redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_stall_out_bitsignaltemp,
        data_out => redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo(STALLFIFO,172)
    redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_valid_in <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_V1;
    redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_stall_in <= SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_backStall;
    redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_data_in <= redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_4_q;
    redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_valid_in_bitsignaltemp <= redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_valid_in(0);
    redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_stall_in_bitsignaltemp <= redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_stall_in(0);
    redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_valid_out(0) <= redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_valid_out_bitsignaltemp;
    redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_stall_out(0) <= redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_stall_out_bitsignaltemp;
    theredist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 191,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_valid_in_bitsignaltemp,
        stall_in => redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_stall_in_bitsignaltemp,
        data_in => redist23_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_5_4_q,
        valid_out => redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_valid_out_bitsignaltemp,
        stall_out => redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_stall_out_bitsignaltemp,
        data_out => redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo(STALLFIFO,173)
    redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_valid_in <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V6;
    redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_stall_in <= SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_backStall;
    redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_data_in <= bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_g;
    redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_valid_in_bitsignaltemp <= redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_valid_in(0);
    redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_stall_in_bitsignaltemp <= redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_stall_in(0);
    redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_valid_out(0) <= redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_valid_out_bitsignaltemp;
    redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_stall_out(0) <= redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_stall_out_bitsignaltemp;
    theredist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 196,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_valid_in_bitsignaltemp,
        stall_in => redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_g,
        valid_out => redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_valid_out_bitsignaltemp,
        stall_out => redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_stall_out_bitsignaltemp,
        data_out => redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo(STALLFIFO,179)
    redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_valid_in <= SE_redist17_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_0_5_4_V2;
    redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_stall_in <= SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_backStall;
    redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_data_in <= redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_4_q;
    redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_valid_in_bitsignaltemp <= redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_valid_in(0);
    redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_stall_in_bitsignaltemp <= redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_stall_in(0);
    redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_valid_out(0) <= redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_valid_out_bitsignaltemp;
    redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_stall_out(0) <= redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_stall_out_bitsignaltemp;
    theredist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 191,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_valid_in_bitsignaltemp,
        stall_in => redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_stall_in_bitsignaltemp,
        data_in => redist26_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_5_4_q,
        valid_out => redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_valid_out_bitsignaltemp,
        stall_out => redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_stall_out_bitsignaltemp,
        data_out => redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo(STALLFIFO,180)
    redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_valid_in <= SE_out_conv2d1x1_B2_merge_reg_aunroll_x_V7;
    redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_stall_in <= SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_backStall;
    redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_data_in <= bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_i;
    redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_valid_in_bitsignaltemp <= redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_valid_in(0);
    redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_stall_in_bitsignaltemp <= redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_stall_in(0);
    redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_valid_out(0) <= redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_valid_out_bitsignaltemp;
    redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_stall_out(0) <= redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_stall_out_bitsignaltemp;
    theredist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 196,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_valid_in_bitsignaltemp,
        stall_in => redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_conv2d1x1_B2_merge_reg_aunroll_x_i,
        valid_out => redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_valid_out_bitsignaltemp,
        stall_out => redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_stall_out_bitsignaltemp,
        data_out => redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo(STALLENABLE,388)
    -- Valid signal propagation
    SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_V0 <= SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_backStall <= in_stall_in or not (SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and0 <= redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_valid_out;
    SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and1 <= redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_valid_out and SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and0;
    SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and2 <= redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_valid_out and SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and1;
    SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and3 <= redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_valid_out and SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and2;
    SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and4 <= redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_valid_out and SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and3;
    SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and5 <= redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_valid_out and SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and4;
    SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and6 <= redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_valid_out and SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and5;
    SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and7 <= redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_valid_out and SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and6;
    SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and8 <= redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_valid_out and SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and7;
    SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and9 <= redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_valid_out and SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and8;
    SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and10 <= redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_valid_out and SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and9;
    SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and11 <= redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_valid_out and SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and10;
    SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and12 <= redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_valid_out and SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and11;
    SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and13 <= redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_valid_out and SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and12;
    SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and14 <= redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_valid_out and SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and13;
    SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and15 <= redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_valid_out and SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and14;
    SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and16 <= redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_valid_out and SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and15;
    SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_wireValid <= i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_o_valid and SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_and16;

    -- bubble_join_redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo(BITJOIN,261)
    bubble_join_redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_q <= redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_data_out;

    -- bubble_select_redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo(BITSELECT,262)
    bubble_select_redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_q(31 downto 0));

    -- bubble_join_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo(BITJOIN,273)
    bubble_join_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_q <= redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_data_out;

    -- bubble_select_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo(BITSELECT,274)
    bubble_select_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_q(63 downto 0));

    -- bubble_join_redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo(BITJOIN,267)
    bubble_join_redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_q <= redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_data_out;

    -- bubble_select_redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo(BITSELECT,268)
    bubble_select_redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_q(63 downto 0));

    -- bubble_join_redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo(BITJOIN,270)
    bubble_join_redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_q <= redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_data_out;

    -- bubble_select_redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo(BITSELECT,271)
    bubble_select_redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_q(31 downto 0));

    -- bubble_join_redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo(BITJOIN,264)
    bubble_join_redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_q <= redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_data_out;

    -- bubble_select_redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo(BITSELECT,265)
    bubble_select_redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_q(31 downto 0));

    -- bubble_join_i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x(BITJOIN,196)
    bubble_join_i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_q <= i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_c2_exit_3 & i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_c2_exit_2 & i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_c2_exit_1 & i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_out_c2_exit_0;

    -- bubble_select_i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x(BITSELECT,197)
    bubble_select_i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_q(0 downto 0));
    bubble_select_i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_q(32 downto 1));
    bubble_select_i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_q(64 downto 33));
    bubble_select_i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_q(96 downto 65));

    -- bubble_join_redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo(BITJOIN,240)
    bubble_join_redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_q <= redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_data_out;

    -- bubble_select_redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo(BITSELECT,241)
    bubble_select_redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_q(63 downto 0));

    -- bubble_join_redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo(BITJOIN,237)
    bubble_join_redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_q <= redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_data_out;

    -- bubble_select_redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo(BITSELECT,238)
    bubble_select_redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_q(63 downto 0));

    -- bubble_join_redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo(BITJOIN,234)
    bubble_join_redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_q <= redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_data_out;

    -- bubble_select_redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo(BITSELECT,235)
    bubble_select_redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_q(0 downto 0));

    -- bubble_join_redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo(BITJOIN,231)
    bubble_join_redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_q <= redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_data_out;

    -- bubble_select_redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo(BITSELECT,232)
    bubble_select_redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_q(0 downto 0));

    -- bubble_join_redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo(BITJOIN,228)
    bubble_join_redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_q <= redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_data_out;

    -- bubble_select_redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo(BITSELECT,229)
    bubble_select_redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_q(0 downto 0));

    -- bubble_join_redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo(BITJOIN,225)
    bubble_join_redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_q <= redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_data_out;

    -- bubble_select_redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo(BITSELECT,226)
    bubble_select_redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_q(0 downto 0));

    -- bubble_join_redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo(BITJOIN,222)
    bubble_join_redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_q <= redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_data_out;

    -- bubble_select_redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo(BITSELECT,223)
    bubble_select_redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_q(0 downto 0));

    -- bubble_join_redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo(BITJOIN,216)
    bubble_join_redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_q <= redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_data_out;

    -- bubble_select_redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo(BITSELECT,217)
    bubble_select_redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_q(0 downto 0));

    -- bubble_join_redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo(BITJOIN,243)
    bubble_join_redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_q <= redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_data_out;

    -- bubble_select_redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo(BITSELECT,244)
    bubble_select_redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_q(31 downto 0));

    -- bubble_join_redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo(BITJOIN,219)
    bubble_join_redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_q <= redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_data_out;

    -- bubble_select_redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo(BITSELECT,220)
    bubble_select_redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_q(0 downto 0));

    -- bubble_join_redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo(BITJOIN,246)
    bubble_join_redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_q <= redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_data_out;

    -- bubble_select_redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo(BITSELECT,247)
    bubble_select_redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_q(0 downto 0));

    -- bubble_join_redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo(BITJOIN,258)
    bubble_join_redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_q <= redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_data_out;

    -- bubble_select_redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo(BITSELECT,259)
    bubble_select_redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_q(63 downto 0));

    -- dupName_0_sync_out_aunroll_x(GPOUT,2)@196
    out_c0_exe11 <= bubble_select_redist21_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_2_195_fifo_b;
    out_c1_exe10 <= bubble_select_redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_b;
    out_c1_exe134 <= bubble_select_redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_b;
    out_c1_exe9 <= bubble_select_redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_b;
    out_c1_exit33_0 <= bubble_select_redist0_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_0_180_fifo_b;
    out_c1_exit33_1 <= bubble_select_redist1_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_1_180_fifo_b;
    out_c1_exit33_2 <= bubble_select_redist3_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_2_180_fifo_b;
    out_c1_exit33_3 <= bubble_select_redist4_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_3_180_fifo_b;
    out_c1_exit33_4 <= bubble_select_redist6_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_4_180_fifo_b;
    out_c1_exit33_5 <= bubble_select_redist7_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_5_180_fifo_b;
    out_c1_exit33_6 <= bubble_select_redist9_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_6_180_fifo_b;
    out_c1_exit33_7 <= bubble_select_redist11_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_7_180_fifo_b;
    out_c1_exit33_8 <= bubble_select_redist13_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_8_180_fifo_b;
    out_c1_exit33_9 <= bubble_select_redist14_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_9_180_fifo_b;
    out_c1_exit33_10 <= bubble_select_redist15_i_sfc_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x1_aunroll_x_out_c1_exit33_10_180_fifo_b;
    out_c2_exe3 <= bubble_select_i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_e;
    out_c2_exit_0 <= bubble_select_i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_b;
    out_c2_exit_1 <= bubble_select_i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_c;
    out_c2_exit_2 <= bubble_select_i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_d;
    out_c2_exit_3 <= bubble_select_i_sfc_c2_for_body14_conv2d1x1_c2_enter_conv2d1x1_aunroll_x_e;
    out_i_0115 <= bubble_select_redist24_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_4_195_fifo_b;
    out_j_179 <= bubble_select_redist27_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_6_195_fifo_b;
    out_output_im_addr_0107 <= bubble_select_redist25_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_5_195_fifo_b;
    out_output_im_addr_1611 <= bubble_select_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_b;
    out_unnamed_conv2d1x12 <= bubble_select_redist22_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_3_195_fifo_b;
    out_valid_out <= SE_out_redist28_conv2d1x1_B2_merge_reg_aunroll_x_out_data_out_7_195_fifo_V0;

    -- dupName_0_ext_sig_sync_out_x(GPOUT,6)
    out_unnamed_conv2d1x14_avm_address <= i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_address;
    out_unnamed_conv2d1x14_avm_enable <= i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_enable;
    out_unnamed_conv2d1x14_avm_read <= i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_read;
    out_unnamed_conv2d1x14_avm_write <= i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_write;
    out_unnamed_conv2d1x14_avm_writedata <= i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_writedata;
    out_unnamed_conv2d1x14_avm_byteenable <= i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_byteenable;
    out_unnamed_conv2d1x14_avm_burstcount <= i_load_unnamed_conv2d1x14_conv2d1x1_out_unnamed_conv2d1x14_avm_burstcount;

    -- dupName_1_ext_sig_sync_out_x(GPOUT,12)
    out_unnamed_conv2d1x15_avm_address <= i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_address;
    out_unnamed_conv2d1x15_avm_enable <= i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_enable;
    out_unnamed_conv2d1x15_avm_read <= i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_read;
    out_unnamed_conv2d1x15_avm_write <= i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_write;
    out_unnamed_conv2d1x15_avm_writedata <= i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_writedata;
    out_unnamed_conv2d1x15_avm_byteenable <= i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_byteenable;
    out_unnamed_conv2d1x15_avm_burstcount <= i_load_unnamed_conv2d1x15_conv2d1x1_out_unnamed_conv2d1x15_avm_burstcount;

    -- dupName_2_ext_sig_sync_out_x(GPOUT,17)
    out_memcoalesce_filter_weight_load_0_avm_address <= i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_address;
    out_memcoalesce_filter_weight_load_0_avm_enable <= i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_enable;
    out_memcoalesce_filter_weight_load_0_avm_read <= i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_read;
    out_memcoalesce_filter_weight_load_0_avm_write <= i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_write;
    out_memcoalesce_filter_weight_load_0_avm_writedata <= i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_writedata;
    out_memcoalesce_filter_weight_load_0_avm_byteenable <= i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_byteenable;
    out_memcoalesce_filter_weight_load_0_avm_burstcount <= i_load_memcoalesce_filter_weight_load_0_conv2d1x1_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_burstcount;

    -- ext_sig_sync_out(GPOUT,53)
    out_unnamed_conv2d1x13_avm_address <= i_load_unnamed_conv2d1x13_conv2d1x1_out_unnamed_conv2d1x13_avm_address;
    out_unnamed_conv2d1x13_avm_enable <= i_load_unnamed_conv2d1x13_conv2d1x1_out_unnamed_conv2d1x13_avm_enable;
    out_unnamed_conv2d1x13_avm_read <= i_load_unnamed_conv2d1x13_conv2d1x1_out_unnamed_conv2d1x13_avm_read;
    out_unnamed_conv2d1x13_avm_write <= i_load_unnamed_conv2d1x13_conv2d1x1_out_unnamed_conv2d1x13_avm_write;
    out_unnamed_conv2d1x13_avm_writedata <= i_load_unnamed_conv2d1x13_conv2d1x1_out_unnamed_conv2d1x13_avm_writedata;
    out_unnamed_conv2d1x13_avm_byteenable <= i_load_unnamed_conv2d1x13_conv2d1x1_out_unnamed_conv2d1x13_avm_byteenable;
    out_unnamed_conv2d1x13_avm_burstcount <= i_load_unnamed_conv2d1x13_conv2d1x1_out_unnamed_conv2d1x13_avm_burstcount;

    -- sync_out(GPOUT,69)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
