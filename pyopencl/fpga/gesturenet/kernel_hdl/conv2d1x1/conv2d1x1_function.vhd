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

-- VHDL created from conv2d1x1_function
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

entity conv2d1x1_function is
    port (
        in_arg_filter_bias : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_input_size_x : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_input_size_y : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_memcoalesce_filter_weight_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_filter_weight_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_filter_weight_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_filter_weight_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_start : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x10_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x10_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x10_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x10_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x13_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x13_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x13_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x13_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x14_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x14_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x14_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x14_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x15_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x15_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x15_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x15_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x17_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x17_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x17_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x17_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_filter_weight_load_0_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_memcoalesce_filter_weight_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_memcoalesce_filter_weight_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_filter_weight_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_filter_weight_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_filter_weight_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_filter_weight_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_o_active_unnamed_conv2d1x17 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x10_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_conv2d1x10_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_conv2d1x10_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x10_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x10_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x10_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x10_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_conv2d1x13_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_conv2d1x13_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_conv2d1x13_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x13_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x13_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x13_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x13_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_conv2d1x14_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_conv2d1x14_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_conv2d1x14_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x14_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x14_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x14_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x14_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_conv2d1x15_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_conv2d1x15_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_conv2d1x15_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x15_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x15_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x15_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x15_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_conv2d1x17_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_conv2d1x17_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_conv2d1x17_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x17_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x17_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x17_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x17_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end conv2d1x1_function;

architecture normal of conv2d1x1_function is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_conv2d1x1_B1_sr_0 is
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


    component bb_conv2d1x1_B1_sr_1 is
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


    component bb_conv2d1x1_B2 is
        port (
            in_c0_exe11_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe11_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_0115_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_0115_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size_x : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_size_y : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_179_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_179_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_24_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_24_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_output_im_addr_0107_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_0107_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_1611_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_1611_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_tmp_23_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_tmp_23_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d1x12_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d1x12_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d1x13_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x13_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x13_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x13_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x14_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x14_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x14_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x14_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x15_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x15_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x15_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x15_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_c2_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c2_exit_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c2_exit_2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c2_exit_3 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c0_exe11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe134 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c2_exe3 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_i_0115 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_179 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_output_im_addr_0107 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_output_im_addr_1611 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x12 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_unnamed_conv2d1x13_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x13_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x13_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x13_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x13_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x13_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x13_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x14_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x15_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d1x1_B2_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d1x1_B2_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d1x1_B3_sr_0 is
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


    component bb_conv2d1x1_B4 is
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
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_0114_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size_x : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_size_y : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_178_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im_addr_0106_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_1610_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x16_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d1x17_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x17_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x17_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x17_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe13 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_i_011_LC_OuterPHI : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_17_LC_InnerPHI : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_lsu_unnamed_conv2d1x17_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_output_im_addr_010_LC_OuterPHI : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_output_im_addr_16_LC_InnerPHI : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x16 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_unnamed_conv2d1x17_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d1x1_B4_sr_0 is
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
            in_i_data_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_13 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_14 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_18 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_19 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_20 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_21 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_22 : in std_logic_vector(31 downto 0);  -- Floating Point
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
            out_o_data_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_13 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_14 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_18 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_19 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_20 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_21 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_22 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d1x1_B0 is
        port (
            in_filter_bias : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_global_id_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size_x : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_size_y : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_lsu_unnamed_conv2d1x10_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x10_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x10_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x10_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x10_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_unnamed_conv2d1x10_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d1x1_B1 is
        port (
            in_c0_exe12_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe12_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_011_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_011_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size_x : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_size_y : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_17_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_17_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im_addr_010_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_010_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_16_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_16_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x11_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d1x11_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_i_011 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_output_im_addr_010 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_output_im_addr_16 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x11 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d1x1_B3 is
        port (
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component loop_limiter_conv2d1x10 is
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


    component loop_limiter_conv2d1x11 is
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
    signal bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_7 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_8 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_c2_exit_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_c2_exit_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_c2_exit_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_c2_exit_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_c0_exe11 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_c1_exe134 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_c1_exe9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_c2_exe3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_i_0115 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_j_179 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_output_im_addr_0107 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_output_im_addr_1611 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x13_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x13_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x13_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x13_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x13_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x13_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x13_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x14_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x14_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x14_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x14_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x14_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x14_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x14_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x15_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x15_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x15_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x15_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x15_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x15_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x15_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_aunroll_x_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_aunroll_x_out_c0_exe13 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B4_aunroll_x_out_i_011_LC_OuterPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B4_aunroll_x_out_j_17_LC_InnerPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B4_aunroll_x_out_lsu_unnamed_conv2d1x17_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_aunroll_x_out_output_im_addr_010_LC_OuterPHI : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B4_aunroll_x_out_output_im_addr_16_LC_InnerPHI : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B4_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_aunroll_x_out_unnamed_conv2d1x16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B4_aunroll_x_out_unnamed_conv2d1x17_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_conv2d1x1_B4_aunroll_x_out_unnamed_conv2d1x17_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d1x1_B4_aunroll_x_out_unnamed_conv2d1x17_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B4_aunroll_x_out_unnamed_conv2d1x17_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_aunroll_x_out_unnamed_conv2d1x17_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_aunroll_x_out_unnamed_conv2d1x17_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_aunroll_x_out_unnamed_conv2d1x17_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d1x1_B4_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_aunroll_x_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_c_i32_0gr_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B0_out_c0_exe1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B0_out_c1_exe1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B0_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B0_out_unnamed_conv2d1x10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d1x1_B0_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B1_out_c0_exe12 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B1_out_i_011 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_out_j_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_out_output_im_addr_010 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B1_out_output_im_addr_16 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B1_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B1_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B1_out_unnamed_conv2d1x11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B1_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B3_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B3_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_conv2d1x10_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_conv2d1x10_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_conv2d1x11_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_conv2d1x11_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- loop_limiter_conv2d1x11(BLACKBOX,59)
    theloop_limiter_conv2d1x11 : loop_limiter_conv2d1x11
    PORT MAP (
        in_i_stall => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_stall,
        in_i_valid => bb_conv2d1x1_B1_out_valid_out_0,
        in_i_valid_exit => bb_conv2d1x1_B2_aunroll_x_out_valid_out_0,
        out_o_stall => loop_limiter_conv2d1x11_out_o_stall,
        out_o_valid => loop_limiter_conv2d1x11_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- loop_limiter_conv2d1x10(BLACKBOX,58)
    theloop_limiter_conv2d1x10 : loop_limiter_conv2d1x10
    PORT MAP (
        in_i_stall => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_stall,
        in_i_valid => bb_conv2d1x1_B0_out_valid_out_0,
        in_i_valid_exit => bb_conv2d1x1_B4_aunroll_x_out_valid_out_0,
        out_o_stall => loop_limiter_conv2d1x10_out_o_stall,
        out_o_valid => loop_limiter_conv2d1x10_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d1x1_B0(BLACKBOX,12)
    thebb_conv2d1x1_B0 : bb_conv2d1x1_B0
    PORT MAP (
        in_filter_bias => in_arg_filter_bias,
        in_filter_weight => in_arg_filter_weight,
        in_flush => in_start,
        in_global_id_0_0 => in_arg_global_id_0,
        in_input_channels => in_arg_input_channels,
        in_input_im => in_arg_input_im,
        in_input_size_x => in_arg_input_size_x,
        in_input_size_y => in_arg_input_size_y,
        in_lsu_unnamed_conv2d1x10_sts_stream_size => in_arg_local_size_0,
        in_output_im => in_arg_output_im,
        in_stall_in_0 => loop_limiter_conv2d1x10_out_o_stall,
        in_stream_reset => in_valid_in,
        in_unnamed_conv2d1x10_avm_readdata => in_unnamed_conv2d1x10_avm_readdata,
        in_unnamed_conv2d1x10_avm_readdatavalid => in_unnamed_conv2d1x10_avm_readdatavalid,
        in_unnamed_conv2d1x10_avm_waitrequest => in_unnamed_conv2d1x10_avm_waitrequest,
        in_unnamed_conv2d1x10_avm_writeack => in_unnamed_conv2d1x10_avm_writeack,
        in_valid_in_0 => in_valid_in,
        out_c0_exe1 => bb_conv2d1x1_B0_out_c0_exe1,
        out_c1_exe1 => bb_conv2d1x1_B0_out_c1_exe1,
        out_stall_out_0 => bb_conv2d1x1_B0_out_stall_out_0,
        out_unnamed_conv2d1x10 => bb_conv2d1x1_B0_out_unnamed_conv2d1x10,
        out_unnamed_conv2d1x10_avm_address => bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_address,
        out_unnamed_conv2d1x10_avm_burstcount => bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_burstcount,
        out_unnamed_conv2d1x10_avm_byteenable => bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_byteenable,
        out_unnamed_conv2d1x10_avm_enable => bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_enable,
        out_unnamed_conv2d1x10_avm_read => bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_read,
        out_unnamed_conv2d1x10_avm_write => bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_write,
        out_unnamed_conv2d1x10_avm_writedata => bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_writedata,
        out_valid_out_0 => bb_conv2d1x1_B0_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_c_i32_0gr_x(CONSTANT,10)
    dupName_0_c_i32_0gr_x_q <= "00000000000000000000000000000000";

    -- bb_conv2d1x1_B1_sr_1_aunroll_x(BLACKBOX,3)
    thebb_conv2d1x1_B1_sr_1_aunroll_x : bb_conv2d1x1_B1_sr_1
    PORT MAP (
        in_i_data_0 => dupName_0_c_i32_0gr_x_q,
        in_i_data_1 => bb_conv2d1x1_B0_out_c1_exe1,
        in_i_data_2 => dupName_0_c_i32_0gr_x_q,
        in_i_data_3 => bb_conv2d1x1_B0_out_c1_exe1,
        in_i_data_4 => bb_conv2d1x1_B0_out_c0_exe1,
        in_i_data_5 => bb_conv2d1x1_B0_out_unnamed_conv2d1x10,
        in_i_stall => bb_conv2d1x1_B1_out_stall_out_1,
        in_i_valid => loop_limiter_conv2d1x10_out_o_valid,
        out_o_data_0 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_5,
        out_o_stall => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d1x1_B1(BLACKBOX,13)
    thebb_conv2d1x1_B1 : bb_conv2d1x1_B1
    PORT MAP (
        in_c0_exe12_0 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_4,
        in_c0_exe12_1 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_4,
        in_filter_weight => in_arg_filter_weight,
        in_i_011_0 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_0,
        in_i_011_1 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_0,
        in_input_channels => in_arg_input_channels,
        in_input_im => in_arg_input_im,
        in_input_size_x => in_arg_input_size_x,
        in_input_size_y => in_arg_input_size_y,
        in_j_17_0 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_2,
        in_j_17_1 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_2,
        in_output_im_addr_010_0 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_1,
        in_output_im_addr_010_1 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_1,
        in_output_im_addr_16_0 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_3,
        in_output_im_addr_16_1 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_3,
        in_stall_in_0 => loop_limiter_conv2d1x11_out_o_stall,
        in_unnamed_conv2d1x11_0 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_5,
        in_unnamed_conv2d1x11_1 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_data_5,
        in_valid_in_0 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_valid,
        in_valid_in_1 => bb_conv2d1x1_B1_sr_1_aunroll_x_out_o_valid,
        out_c0_exe12 => bb_conv2d1x1_B1_out_c0_exe12,
        out_i_011 => bb_conv2d1x1_B1_out_i_011,
        out_j_17 => bb_conv2d1x1_B1_out_j_17,
        out_output_im_addr_010 => bb_conv2d1x1_B1_out_output_im_addr_010,
        out_output_im_addr_16 => bb_conv2d1x1_B1_out_output_im_addr_16,
        out_stall_out_0 => bb_conv2d1x1_B1_out_stall_out_0,
        out_stall_out_1 => bb_conv2d1x1_B1_out_stall_out_1,
        out_unnamed_conv2d1x11 => bb_conv2d1x1_B1_out_unnamed_conv2d1x11,
        out_valid_out_0 => bb_conv2d1x1_B1_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d1x1_B1_sr_0_aunroll_x(BLACKBOX,2)
    thebb_conv2d1x1_B1_sr_0_aunroll_x : bb_conv2d1x1_B1_sr_0
    PORT MAP (
        in_i_data_0 => bb_conv2d1x1_B4_aunroll_x_out_i_011_LC_OuterPHI,
        in_i_data_1 => bb_conv2d1x1_B4_aunroll_x_out_output_im_addr_010_LC_OuterPHI,
        in_i_data_2 => bb_conv2d1x1_B4_aunroll_x_out_j_17_LC_InnerPHI,
        in_i_data_3 => bb_conv2d1x1_B4_aunroll_x_out_output_im_addr_16_LC_InnerPHI,
        in_i_data_4 => bb_conv2d1x1_B4_aunroll_x_out_c0_exe13,
        in_i_data_5 => bb_conv2d1x1_B4_aunroll_x_out_unnamed_conv2d1x16,
        in_i_stall => bb_conv2d1x1_B1_out_stall_out_0,
        in_i_valid => bb_conv2d1x1_B4_aunroll_x_out_valid_out_1,
        out_o_data_0 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_data_5,
        out_o_stall => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d1x1_B3(BLACKBOX,14)
    thebb_conv2d1x1_B3 : bb_conv2d1x1_B3
    PORT MAP (
        in_stall_in_0 => in_stall_in,
        in_valid_in_0 => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_valid,
        out_stall_out_0 => bb_conv2d1x1_B3_out_stall_out_0,
        out_valid_out_0 => bb_conv2d1x1_B3_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- bb_conv2d1x1_B3_sr_0_aunroll_x(BLACKBOX,7)
    thebb_conv2d1x1_B3_sr_0_aunroll_x : bb_conv2d1x1_B3_sr_0
    PORT MAP (
        in_i_data_0 => GND_q,
        in_i_stall => bb_conv2d1x1_B3_out_stall_out_0,
        in_i_valid => bb_conv2d1x1_B4_aunroll_x_out_valid_out_0,
        out_o_stall => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d1x1_B4_aunroll_x(BLACKBOX,8)
    thebb_conv2d1x1_B4_aunroll_x : bb_conv2d1x1_B4
    PORT MAP (
        in_c1_exit3312_0_0 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_6,
        in_c1_exit3312_0_1 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_7,
        in_c1_exit3312_0_2 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_8,
        in_c1_exit3312_0_3 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_9,
        in_c1_exit3312_0_4 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_10,
        in_c1_exit3312_0_5 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_11,
        in_c1_exit3312_0_6 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_12,
        in_c1_exit3312_0_7 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_13,
        in_c1_exit3312_0_8 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_14,
        in_c1_exit3312_0_9 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_15,
        in_c1_exit3312_0_10 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_16,
        in_c2_exit14_0_0 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_18,
        in_c2_exit14_0_1 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_19,
        in_c2_exit14_0_2 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_20,
        in_c2_exit14_0_3 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_21,
        in_c0_exe13_0 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_0,
        in_c1_exe13413_0 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_17,
        in_c2_exe315_0 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_22,
        in_filter_weight => in_arg_filter_weight,
        in_flush => in_start,
        in_i_0114_0 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_2,
        in_input_channels => in_arg_input_channels,
        in_input_im => in_arg_input_im,
        in_input_size_x => in_arg_input_size_x,
        in_input_size_y => in_arg_input_size_y,
        in_j_178_0 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_4,
        in_output_im_addr_0106_0 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_3,
        in_output_im_addr_1610_0 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_5,
        in_stall_in_0 => bb_conv2d1x1_B3_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => bb_conv2d1x1_B1_sr_0_aunroll_x_out_o_stall,
        in_unnamed_conv2d1x16_0 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_1,
        in_unnamed_conv2d1x17_avm_readdata => in_unnamed_conv2d1x17_avm_readdata,
        in_unnamed_conv2d1x17_avm_readdatavalid => in_unnamed_conv2d1x17_avm_readdatavalid,
        in_unnamed_conv2d1x17_avm_waitrequest => in_unnamed_conv2d1x17_avm_waitrequest,
        in_unnamed_conv2d1x17_avm_writeack => in_unnamed_conv2d1x17_avm_writeack,
        in_valid_in_0 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_valid,
        out_c0_exe13 => bb_conv2d1x1_B4_aunroll_x_out_c0_exe13,
        out_i_011_LC_OuterPHI => bb_conv2d1x1_B4_aunroll_x_out_i_011_LC_OuterPHI,
        out_j_17_LC_InnerPHI => bb_conv2d1x1_B4_aunroll_x_out_j_17_LC_InnerPHI,
        out_lsu_unnamed_conv2d1x17_o_active => bb_conv2d1x1_B4_aunroll_x_out_lsu_unnamed_conv2d1x17_o_active,
        out_output_im_addr_010_LC_OuterPHI => bb_conv2d1x1_B4_aunroll_x_out_output_im_addr_010_LC_OuterPHI,
        out_output_im_addr_16_LC_InnerPHI => bb_conv2d1x1_B4_aunroll_x_out_output_im_addr_16_LC_InnerPHI,
        out_stall_out_0 => bb_conv2d1x1_B4_aunroll_x_out_stall_out_0,
        out_unnamed_conv2d1x16 => bb_conv2d1x1_B4_aunroll_x_out_unnamed_conv2d1x16,
        out_unnamed_conv2d1x17_avm_address => bb_conv2d1x1_B4_aunroll_x_out_unnamed_conv2d1x17_avm_address,
        out_unnamed_conv2d1x17_avm_burstcount => bb_conv2d1x1_B4_aunroll_x_out_unnamed_conv2d1x17_avm_burstcount,
        out_unnamed_conv2d1x17_avm_byteenable => bb_conv2d1x1_B4_aunroll_x_out_unnamed_conv2d1x17_avm_byteenable,
        out_unnamed_conv2d1x17_avm_enable => bb_conv2d1x1_B4_aunroll_x_out_unnamed_conv2d1x17_avm_enable,
        out_unnamed_conv2d1x17_avm_read => bb_conv2d1x1_B4_aunroll_x_out_unnamed_conv2d1x17_avm_read,
        out_unnamed_conv2d1x17_avm_write => bb_conv2d1x1_B4_aunroll_x_out_unnamed_conv2d1x17_avm_write,
        out_unnamed_conv2d1x17_avm_writedata => bb_conv2d1x1_B4_aunroll_x_out_unnamed_conv2d1x17_avm_writedata,
        out_valid_out_0 => bb_conv2d1x1_B4_aunroll_x_out_valid_out_0,
        out_valid_out_1 => bb_conv2d1x1_B4_aunroll_x_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d1x1_B4_sr_0_aunroll_x(BLACKBOX,9)
    thebb_conv2d1x1_B4_sr_0_aunroll_x : bb_conv2d1x1_B4_sr_0
    PORT MAP (
        in_i_data_0 => bb_conv2d1x1_B2_aunroll_x_out_c0_exe11,
        in_i_data_1 => bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x12,
        in_i_data_2 => bb_conv2d1x1_B2_aunroll_x_out_i_0115,
        in_i_data_3 => bb_conv2d1x1_B2_aunroll_x_out_output_im_addr_0107,
        in_i_data_4 => bb_conv2d1x1_B2_aunroll_x_out_j_179,
        in_i_data_5 => bb_conv2d1x1_B2_aunroll_x_out_output_im_addr_1611,
        in_i_data_6 => bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_0,
        in_i_data_7 => bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_1,
        in_i_data_8 => bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_2,
        in_i_data_9 => bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_3,
        in_i_data_10 => bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_4,
        in_i_data_11 => bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_5,
        in_i_data_12 => bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_6,
        in_i_data_13 => bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_7,
        in_i_data_14 => bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_8,
        in_i_data_15 => bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_9,
        in_i_data_16 => bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_10,
        in_i_data_17 => bb_conv2d1x1_B2_aunroll_x_out_c1_exe134,
        in_i_data_18 => bb_conv2d1x1_B2_aunroll_x_out_c2_exit_0,
        in_i_data_19 => bb_conv2d1x1_B2_aunroll_x_out_c2_exit_1,
        in_i_data_20 => bb_conv2d1x1_B2_aunroll_x_out_c2_exit_2,
        in_i_data_21 => bb_conv2d1x1_B2_aunroll_x_out_c2_exit_3,
        in_i_data_22 => bb_conv2d1x1_B2_aunroll_x_out_c2_exe3,
        in_i_stall => bb_conv2d1x1_B4_aunroll_x_out_stall_out_0,
        in_i_valid => bb_conv2d1x1_B2_aunroll_x_out_valid_out_0,
        out_o_data_0 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_17,
        out_o_data_18 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_18,
        out_o_data_19 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_19,
        out_o_data_20 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_20,
        out_o_data_21 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_21,
        out_o_data_22 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_data_22,
        out_o_stall => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d1x1_B2_sr_1_aunroll_x(BLACKBOX,6)
    thebb_conv2d1x1_B2_sr_1_aunroll_x : bb_conv2d1x1_B2_sr_1
    PORT MAP (
        in_i_data_0 => dupName_0_c_i32_0gr_x_q,
        in_i_data_1 => bb_conv2d1x1_B1_out_unnamed_conv2d1x11,
        in_i_data_2 => bb_conv2d1x1_B1_out_c0_exe12,
        in_i_data_3 => bb_conv2d1x1_B1_out_unnamed_conv2d1x11,
        in_i_data_4 => bb_conv2d1x1_B1_out_i_011,
        in_i_data_5 => bb_conv2d1x1_B1_out_output_im_addr_010,
        in_i_data_6 => bb_conv2d1x1_B1_out_j_17,
        in_i_data_7 => bb_conv2d1x1_B1_out_output_im_addr_16,
        in_i_stall => bb_conv2d1x1_B2_aunroll_x_out_stall_out_1,
        in_i_valid => loop_limiter_conv2d1x11_out_o_valid,
        out_o_data_0 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_7,
        out_o_stall => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d1x1_B2_sr_0_aunroll_x(BLACKBOX,5)
    thebb_conv2d1x1_B2_sr_0_aunroll_x : bb_conv2d1x1_B2_sr_0
    PORT MAP (
        in_i_data_0 => bb_conv2d1x1_B2_aunroll_x_out_c1_exe9,
        in_i_data_1 => bb_conv2d1x1_B2_aunroll_x_out_c2_exe3,
        in_i_data_2 => bb_conv2d1x1_B2_aunroll_x_out_c0_exe11,
        in_i_data_3 => bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x12,
        in_i_data_4 => bb_conv2d1x1_B2_aunroll_x_out_i_0115,
        in_i_data_5 => bb_conv2d1x1_B2_aunroll_x_out_output_im_addr_0107,
        in_i_data_6 => bb_conv2d1x1_B2_aunroll_x_out_j_179,
        in_i_data_7 => bb_conv2d1x1_B2_aunroll_x_out_output_im_addr_1611,
        in_i_stall => bb_conv2d1x1_B2_aunroll_x_out_stall_out_0,
        in_i_valid => bb_conv2d1x1_B2_aunroll_x_out_valid_out_1,
        out_o_data_0 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_7,
        out_o_stall => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d1x1_B2_aunroll_x(BLACKBOX,4)
    thebb_conv2d1x1_B2_aunroll_x : bb_conv2d1x1_B2
    PORT MAP (
        in_c0_exe11_0 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_2,
        in_c0_exe11_1 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_2,
        in_filter_weight => in_arg_filter_weight,
        in_flush => in_start,
        in_i_0115_0 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_4,
        in_i_0115_1 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_4,
        in_input_channels => in_arg_input_channels,
        in_input_im => in_arg_input_im,
        in_input_size_x => in_arg_input_size_x,
        in_input_size_y => in_arg_input_size_y,
        in_j_179_0 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_6,
        in_j_179_1 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_6,
        in_k_24_0 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_0,
        in_k_24_1 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_0,
        in_memcoalesce_filter_weight_load_0_avm_readdata => in_memcoalesce_filter_weight_load_0_avm_readdata,
        in_memcoalesce_filter_weight_load_0_avm_readdatavalid => in_memcoalesce_filter_weight_load_0_avm_readdatavalid,
        in_memcoalesce_filter_weight_load_0_avm_waitrequest => in_memcoalesce_filter_weight_load_0_avm_waitrequest,
        in_memcoalesce_filter_weight_load_0_avm_writeack => in_memcoalesce_filter_weight_load_0_avm_writeack,
        in_output_im_addr_0107_0 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_5,
        in_output_im_addr_0107_1 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_5,
        in_output_im_addr_1611_0 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_7,
        in_output_im_addr_1611_1 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_7,
        in_stall_in_0 => bb_conv2d1x1_B4_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_stall,
        in_tmp_23_0 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_1,
        in_tmp_23_1 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_1,
        in_unnamed_conv2d1x12_0 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_data_3,
        in_unnamed_conv2d1x12_1 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_data_3,
        in_unnamed_conv2d1x13_avm_readdata => in_unnamed_conv2d1x13_avm_readdata,
        in_unnamed_conv2d1x13_avm_readdatavalid => in_unnamed_conv2d1x13_avm_readdatavalid,
        in_unnamed_conv2d1x13_avm_waitrequest => in_unnamed_conv2d1x13_avm_waitrequest,
        in_unnamed_conv2d1x13_avm_writeack => in_unnamed_conv2d1x13_avm_writeack,
        in_unnamed_conv2d1x14_avm_readdata => in_unnamed_conv2d1x14_avm_readdata,
        in_unnamed_conv2d1x14_avm_readdatavalid => in_unnamed_conv2d1x14_avm_readdatavalid,
        in_unnamed_conv2d1x14_avm_waitrequest => in_unnamed_conv2d1x14_avm_waitrequest,
        in_unnamed_conv2d1x14_avm_writeack => in_unnamed_conv2d1x14_avm_writeack,
        in_unnamed_conv2d1x15_avm_readdata => in_unnamed_conv2d1x15_avm_readdata,
        in_unnamed_conv2d1x15_avm_readdatavalid => in_unnamed_conv2d1x15_avm_readdatavalid,
        in_unnamed_conv2d1x15_avm_waitrequest => in_unnamed_conv2d1x15_avm_waitrequest,
        in_unnamed_conv2d1x15_avm_writeack => in_unnamed_conv2d1x15_avm_writeack,
        in_valid_in_0 => bb_conv2d1x1_B2_sr_0_aunroll_x_out_o_valid,
        in_valid_in_1 => bb_conv2d1x1_B2_sr_1_aunroll_x_out_o_valid,
        out_c1_exit33_0 => bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_0,
        out_c1_exit33_1 => bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_1,
        out_c1_exit33_2 => bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_2,
        out_c1_exit33_3 => bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_3,
        out_c1_exit33_4 => bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_4,
        out_c1_exit33_5 => bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_5,
        out_c1_exit33_6 => bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_6,
        out_c1_exit33_7 => bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_7,
        out_c1_exit33_8 => bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_8,
        out_c1_exit33_9 => bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_9,
        out_c1_exit33_10 => bb_conv2d1x1_B2_aunroll_x_out_c1_exit33_10,
        out_c2_exit_0 => bb_conv2d1x1_B2_aunroll_x_out_c2_exit_0,
        out_c2_exit_1 => bb_conv2d1x1_B2_aunroll_x_out_c2_exit_1,
        out_c2_exit_2 => bb_conv2d1x1_B2_aunroll_x_out_c2_exit_2,
        out_c2_exit_3 => bb_conv2d1x1_B2_aunroll_x_out_c2_exit_3,
        out_c0_exe11 => bb_conv2d1x1_B2_aunroll_x_out_c0_exe11,
        out_c1_exe134 => bb_conv2d1x1_B2_aunroll_x_out_c1_exe134,
        out_c1_exe9 => bb_conv2d1x1_B2_aunroll_x_out_c1_exe9,
        out_c2_exe3 => bb_conv2d1x1_B2_aunroll_x_out_c2_exe3,
        out_i_0115 => bb_conv2d1x1_B2_aunroll_x_out_i_0115,
        out_j_179 => bb_conv2d1x1_B2_aunroll_x_out_j_179,
        out_memcoalesce_filter_weight_load_0_avm_address => bb_conv2d1x1_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_address,
        out_memcoalesce_filter_weight_load_0_avm_burstcount => bb_conv2d1x1_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_burstcount,
        out_memcoalesce_filter_weight_load_0_avm_byteenable => bb_conv2d1x1_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_byteenable,
        out_memcoalesce_filter_weight_load_0_avm_enable => bb_conv2d1x1_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_enable,
        out_memcoalesce_filter_weight_load_0_avm_read => bb_conv2d1x1_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_read,
        out_memcoalesce_filter_weight_load_0_avm_write => bb_conv2d1x1_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_write,
        out_memcoalesce_filter_weight_load_0_avm_writedata => bb_conv2d1x1_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_writedata,
        out_output_im_addr_0107 => bb_conv2d1x1_B2_aunroll_x_out_output_im_addr_0107,
        out_output_im_addr_1611 => bb_conv2d1x1_B2_aunroll_x_out_output_im_addr_1611,
        out_stall_out_0 => bb_conv2d1x1_B2_aunroll_x_out_stall_out_0,
        out_stall_out_1 => bb_conv2d1x1_B2_aunroll_x_out_stall_out_1,
        out_unnamed_conv2d1x12 => bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x12,
        out_unnamed_conv2d1x13_avm_address => bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x13_avm_address,
        out_unnamed_conv2d1x13_avm_burstcount => bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x13_avm_burstcount,
        out_unnamed_conv2d1x13_avm_byteenable => bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x13_avm_byteenable,
        out_unnamed_conv2d1x13_avm_enable => bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x13_avm_enable,
        out_unnamed_conv2d1x13_avm_read => bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x13_avm_read,
        out_unnamed_conv2d1x13_avm_write => bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x13_avm_write,
        out_unnamed_conv2d1x13_avm_writedata => bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x13_avm_writedata,
        out_unnamed_conv2d1x14_avm_address => bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x14_avm_address,
        out_unnamed_conv2d1x14_avm_burstcount => bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x14_avm_burstcount,
        out_unnamed_conv2d1x14_avm_byteenable => bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x14_avm_byteenable,
        out_unnamed_conv2d1x14_avm_enable => bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x14_avm_enable,
        out_unnamed_conv2d1x14_avm_read => bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x14_avm_read,
        out_unnamed_conv2d1x14_avm_write => bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x14_avm_write,
        out_unnamed_conv2d1x14_avm_writedata => bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x14_avm_writedata,
        out_unnamed_conv2d1x15_avm_address => bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x15_avm_address,
        out_unnamed_conv2d1x15_avm_burstcount => bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x15_avm_burstcount,
        out_unnamed_conv2d1x15_avm_byteenable => bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x15_avm_byteenable,
        out_unnamed_conv2d1x15_avm_enable => bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x15_avm_enable,
        out_unnamed_conv2d1x15_avm_read => bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x15_avm_read,
        out_unnamed_conv2d1x15_avm_write => bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x15_avm_write,
        out_unnamed_conv2d1x15_avm_writedata => bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x15_avm_writedata,
        out_valid_out_0 => bb_conv2d1x1_B2_aunroll_x_out_valid_out_0,
        out_valid_out_1 => bb_conv2d1x1_B2_aunroll_x_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_memcoalesce_filter_weight_load_0_avm_address(GPOUT,60)
    out_memcoalesce_filter_weight_load_0_avm_address <= bb_conv2d1x1_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_address;

    -- out_memcoalesce_filter_weight_load_0_avm_burstcount(GPOUT,61)
    out_memcoalesce_filter_weight_load_0_avm_burstcount <= bb_conv2d1x1_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_burstcount;

    -- out_memcoalesce_filter_weight_load_0_avm_byteenable(GPOUT,62)
    out_memcoalesce_filter_weight_load_0_avm_byteenable <= bb_conv2d1x1_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_byteenable;

    -- out_memcoalesce_filter_weight_load_0_avm_enable(GPOUT,63)
    out_memcoalesce_filter_weight_load_0_avm_enable <= bb_conv2d1x1_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_enable;

    -- out_memcoalesce_filter_weight_load_0_avm_read(GPOUT,64)
    out_memcoalesce_filter_weight_load_0_avm_read <= bb_conv2d1x1_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_read;

    -- out_memcoalesce_filter_weight_load_0_avm_write(GPOUT,65)
    out_memcoalesce_filter_weight_load_0_avm_write <= bb_conv2d1x1_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_write;

    -- out_memcoalesce_filter_weight_load_0_avm_writedata(GPOUT,66)
    out_memcoalesce_filter_weight_load_0_avm_writedata <= bb_conv2d1x1_B2_aunroll_x_out_memcoalesce_filter_weight_load_0_avm_writedata;

    -- out_o_active_unnamed_conv2d1x17(GPOUT,67)
    out_o_active_unnamed_conv2d1x17 <= bb_conv2d1x1_B4_aunroll_x_out_lsu_unnamed_conv2d1x17_o_active;

    -- out_stall_out(GPOUT,68)
    out_stall_out <= bb_conv2d1x1_B0_out_stall_out_0;

    -- out_unnamed_conv2d1x10_avm_address(GPOUT,69)
    out_unnamed_conv2d1x10_avm_address <= bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_address;

    -- out_unnamed_conv2d1x10_avm_burstcount(GPOUT,70)
    out_unnamed_conv2d1x10_avm_burstcount <= bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_burstcount;

    -- out_unnamed_conv2d1x10_avm_byteenable(GPOUT,71)
    out_unnamed_conv2d1x10_avm_byteenable <= bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_byteenable;

    -- out_unnamed_conv2d1x10_avm_enable(GPOUT,72)
    out_unnamed_conv2d1x10_avm_enable <= bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_enable;

    -- out_unnamed_conv2d1x10_avm_read(GPOUT,73)
    out_unnamed_conv2d1x10_avm_read <= bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_read;

    -- out_unnamed_conv2d1x10_avm_write(GPOUT,74)
    out_unnamed_conv2d1x10_avm_write <= bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_write;

    -- out_unnamed_conv2d1x10_avm_writedata(GPOUT,75)
    out_unnamed_conv2d1x10_avm_writedata <= bb_conv2d1x1_B0_out_unnamed_conv2d1x10_avm_writedata;

    -- out_unnamed_conv2d1x13_avm_address(GPOUT,76)
    out_unnamed_conv2d1x13_avm_address <= bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x13_avm_address;

    -- out_unnamed_conv2d1x13_avm_burstcount(GPOUT,77)
    out_unnamed_conv2d1x13_avm_burstcount <= bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x13_avm_burstcount;

    -- out_unnamed_conv2d1x13_avm_byteenable(GPOUT,78)
    out_unnamed_conv2d1x13_avm_byteenable <= bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x13_avm_byteenable;

    -- out_unnamed_conv2d1x13_avm_enable(GPOUT,79)
    out_unnamed_conv2d1x13_avm_enable <= bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x13_avm_enable;

    -- out_unnamed_conv2d1x13_avm_read(GPOUT,80)
    out_unnamed_conv2d1x13_avm_read <= bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x13_avm_read;

    -- out_unnamed_conv2d1x13_avm_write(GPOUT,81)
    out_unnamed_conv2d1x13_avm_write <= bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x13_avm_write;

    -- out_unnamed_conv2d1x13_avm_writedata(GPOUT,82)
    out_unnamed_conv2d1x13_avm_writedata <= bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x13_avm_writedata;

    -- out_unnamed_conv2d1x14_avm_address(GPOUT,83)
    out_unnamed_conv2d1x14_avm_address <= bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x14_avm_address;

    -- out_unnamed_conv2d1x14_avm_burstcount(GPOUT,84)
    out_unnamed_conv2d1x14_avm_burstcount <= bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x14_avm_burstcount;

    -- out_unnamed_conv2d1x14_avm_byteenable(GPOUT,85)
    out_unnamed_conv2d1x14_avm_byteenable <= bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x14_avm_byteenable;

    -- out_unnamed_conv2d1x14_avm_enable(GPOUT,86)
    out_unnamed_conv2d1x14_avm_enable <= bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x14_avm_enable;

    -- out_unnamed_conv2d1x14_avm_read(GPOUT,87)
    out_unnamed_conv2d1x14_avm_read <= bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x14_avm_read;

    -- out_unnamed_conv2d1x14_avm_write(GPOUT,88)
    out_unnamed_conv2d1x14_avm_write <= bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x14_avm_write;

    -- out_unnamed_conv2d1x14_avm_writedata(GPOUT,89)
    out_unnamed_conv2d1x14_avm_writedata <= bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x14_avm_writedata;

    -- out_unnamed_conv2d1x15_avm_address(GPOUT,90)
    out_unnamed_conv2d1x15_avm_address <= bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x15_avm_address;

    -- out_unnamed_conv2d1x15_avm_burstcount(GPOUT,91)
    out_unnamed_conv2d1x15_avm_burstcount <= bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x15_avm_burstcount;

    -- out_unnamed_conv2d1x15_avm_byteenable(GPOUT,92)
    out_unnamed_conv2d1x15_avm_byteenable <= bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x15_avm_byteenable;

    -- out_unnamed_conv2d1x15_avm_enable(GPOUT,93)
    out_unnamed_conv2d1x15_avm_enable <= bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x15_avm_enable;

    -- out_unnamed_conv2d1x15_avm_read(GPOUT,94)
    out_unnamed_conv2d1x15_avm_read <= bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x15_avm_read;

    -- out_unnamed_conv2d1x15_avm_write(GPOUT,95)
    out_unnamed_conv2d1x15_avm_write <= bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x15_avm_write;

    -- out_unnamed_conv2d1x15_avm_writedata(GPOUT,96)
    out_unnamed_conv2d1x15_avm_writedata <= bb_conv2d1x1_B2_aunroll_x_out_unnamed_conv2d1x15_avm_writedata;

    -- out_unnamed_conv2d1x17_avm_address(GPOUT,97)
    out_unnamed_conv2d1x17_avm_address <= bb_conv2d1x1_B4_aunroll_x_out_unnamed_conv2d1x17_avm_address;

    -- out_unnamed_conv2d1x17_avm_burstcount(GPOUT,98)
    out_unnamed_conv2d1x17_avm_burstcount <= bb_conv2d1x1_B4_aunroll_x_out_unnamed_conv2d1x17_avm_burstcount;

    -- out_unnamed_conv2d1x17_avm_byteenable(GPOUT,99)
    out_unnamed_conv2d1x17_avm_byteenable <= bb_conv2d1x1_B4_aunroll_x_out_unnamed_conv2d1x17_avm_byteenable;

    -- out_unnamed_conv2d1x17_avm_enable(GPOUT,100)
    out_unnamed_conv2d1x17_avm_enable <= bb_conv2d1x1_B4_aunroll_x_out_unnamed_conv2d1x17_avm_enable;

    -- out_unnamed_conv2d1x17_avm_read(GPOUT,101)
    out_unnamed_conv2d1x17_avm_read <= bb_conv2d1x1_B4_aunroll_x_out_unnamed_conv2d1x17_avm_read;

    -- out_unnamed_conv2d1x17_avm_write(GPOUT,102)
    out_unnamed_conv2d1x17_avm_write <= bb_conv2d1x1_B4_aunroll_x_out_unnamed_conv2d1x17_avm_write;

    -- out_unnamed_conv2d1x17_avm_writedata(GPOUT,103)
    out_unnamed_conv2d1x17_avm_writedata <= bb_conv2d1x1_B4_aunroll_x_out_unnamed_conv2d1x17_avm_writedata;

    -- out_valid_out(GPOUT,104)
    out_valid_out <= bb_conv2d1x1_B3_out_valid_out_0;

END normal;
