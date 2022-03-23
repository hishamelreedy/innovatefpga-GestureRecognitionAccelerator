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

-- VHDL created from conv2d1x1_function_wrapper
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

entity conv2d1x1_function_wrapper is
    port (
        avm_memcoalesce_filter_weight_load_0_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_memcoalesce_filter_weight_load_0_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_filter_weight_load_0_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_filter_weight_load_0_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x10_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_conv2d1x10_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x10_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x10_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x13_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_conv2d1x13_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x13_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x13_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x14_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_conv2d1x14_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x14_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x14_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x15_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_conv2d1x15_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x15_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x15_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x17_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_conv2d1x17_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x17_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x17_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        clock2x : in std_logic_vector(0 downto 0);  -- ufix1
        global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_2 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        kernel_arguments : in std_logic_vector(351 downto 0);  -- ufix352
        kernel_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        kernel_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        local_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        local_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        local_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        local_router_hang : in std_logic_vector(0 downto 0);  -- ufix1
        local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        local_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        local_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_0 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_1 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_2 : in std_logic_vector(31 downto 0);  -- ufix32
        stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        start : in std_logic_vector(0 downto 0);  -- ufix1
        valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        work_dim : in std_logic_vector(31 downto 0);  -- ufix32
        workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        avm_memcoalesce_filter_weight_load_0_address : out std_logic_vector(30 downto 0);  -- ufix31
        avm_memcoalesce_filter_weight_load_0_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_memcoalesce_filter_weight_load_0_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memcoalesce_filter_weight_load_0_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_filter_weight_load_0_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_filter_weight_load_0_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_filter_weight_load_0_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_conv2d1x10_address : out std_logic_vector(30 downto 0);  -- ufix31
        avm_unnamed_conv2d1x10_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_conv2d1x10_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_conv2d1x10_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x10_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x10_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x10_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_conv2d1x13_address : out std_logic_vector(30 downto 0);  -- ufix31
        avm_unnamed_conv2d1x13_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_conv2d1x13_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_conv2d1x13_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x13_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x13_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x13_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_conv2d1x14_address : out std_logic_vector(30 downto 0);  -- ufix31
        avm_unnamed_conv2d1x14_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_conv2d1x14_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_conv2d1x14_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x14_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x14_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x14_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_conv2d1x15_address : out std_logic_vector(30 downto 0);  -- ufix31
        avm_unnamed_conv2d1x15_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_conv2d1x15_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_conv2d1x15_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x15_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x15_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x15_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_conv2d1x17_address : out std_logic_vector(30 downto 0);  -- ufix31
        avm_unnamed_conv2d1x17_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_conv2d1x17_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_conv2d1x17_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x17_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x17_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_conv2d1x17_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        clock2x_output : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_lsu_active : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_write_pending : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end conv2d1x1_function_wrapper;

architecture normal of conv2d1x1_function_wrapper is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_clock2x_holder is
        port (
            clock2x : in std_logic;
            myout : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component conv2d1x1_function is
        port (
            in_arg_filter_bias : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_global_id_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_input_size_x : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_input_size_y : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_start : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x10_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x10_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x10_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x10_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            in_unnamed_conv2d1x17_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x17_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x17_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x17_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_filter_weight_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_o_active_unnamed_conv2d1x17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x10_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
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
            out_unnamed_conv2d1x17_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_1_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_2_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_3_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_4_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_5_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x_bitsignaltemp : std_logic;
    signal acl_clock2x_dummy_consumer_myout : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_myout_bitsignaltemp : std_logic;
    signal arg_filter_bias_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_filter_weight_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_input_channels_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_input_im_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_input_size_x_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_input_size_y_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_output_im_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_function_out_memcoalesce_filter_weight_load_0_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal conv2d1x1_function_out_memcoalesce_filter_weight_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal conv2d1x1_function_out_memcoalesce_filter_weight_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_function_out_memcoalesce_filter_weight_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_function_out_memcoalesce_filter_weight_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_function_out_memcoalesce_filter_weight_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_function_out_memcoalesce_filter_weight_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal conv2d1x1_function_out_o_active_unnamed_conv2d1x17 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_function_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x10_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x10_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x10_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x10_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x10_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x10_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x10_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x13_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x13_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x13_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x13_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x13_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x13_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x13_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x14_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x14_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x14_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x14_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x14_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x14_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x14_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x15_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x15_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x15_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x15_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x15_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x15_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x15_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x17_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x17_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x17_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x17_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x17_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x17_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_function_out_unnamed_conv2d1x17_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal conv2d1x1_function_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- arg_output_im_select(BITSELECT,15)
    arg_output_im_select_b <= kernel_arguments(351 downto 288);

    -- dupName_5_ip_dsdk_adapt_cast_x(BITSELECT,7)
    dupName_5_ip_dsdk_adapt_cast_x_b <= arg_output_im_select_b(63 downto 0);

    -- arg_input_size_y_select(BITSELECT,14)
    arg_input_size_y_select_b <= kernel_arguments(95 downto 64);

    -- dupName_1_ip_dsdk_adapt_cast_x(BITSELECT,3)
    dupName_1_ip_dsdk_adapt_cast_x_b <= arg_input_size_y_select_b(31 downto 0);

    -- arg_input_size_x_select(BITSELECT,13)
    arg_input_size_x_select_b <= kernel_arguments(63 downto 32);

    -- dupName_0_ip_dsdk_adapt_cast_x(BITSELECT,2)
    dupName_0_ip_dsdk_adapt_cast_x_b <= arg_input_size_x_select_b(31 downto 0);

    -- arg_input_im_select(BITSELECT,12)
    arg_input_im_select_b <= kernel_arguments(159 downto 96);

    -- dupName_2_ip_dsdk_adapt_cast_x(BITSELECT,4)
    dupName_2_ip_dsdk_adapt_cast_x_b <= arg_input_im_select_b(63 downto 0);

    -- arg_input_channels_select(BITSELECT,11)
    arg_input_channels_select_b <= kernel_arguments(31 downto 0);

    -- ip_dsdk_adapt_cast(BITSELECT,73)
    ip_dsdk_adapt_cast_b <= arg_input_channels_select_b(31 downto 0);

    -- arg_filter_weight_select(BITSELECT,10)
    arg_filter_weight_select_b <= kernel_arguments(223 downto 160);

    -- dupName_3_ip_dsdk_adapt_cast_x(BITSELECT,5)
    dupName_3_ip_dsdk_adapt_cast_x_b <= arg_filter_weight_select_b(63 downto 0);

    -- arg_filter_bias_select(BITSELECT,9)
    arg_filter_bias_select_b <= kernel_arguments(287 downto 224);

    -- dupName_4_ip_dsdk_adapt_cast_x(BITSELECT,6)
    dupName_4_ip_dsdk_adapt_cast_x_b <= arg_filter_bias_select_b(63 downto 0);

    -- conv2d1x1_function(BLACKBOX,17)
    theconv2d1x1_function : conv2d1x1_function
    PORT MAP (
        in_arg_filter_bias => dupName_4_ip_dsdk_adapt_cast_x_b,
        in_arg_filter_weight => dupName_3_ip_dsdk_adapt_cast_x_b,
        in_arg_global_id_0 => global_id_0,
        in_arg_global_size_0 => global_size_0,
        in_arg_global_size_1 => global_size_1,
        in_arg_global_size_2 => global_size_2,
        in_arg_input_channels => ip_dsdk_adapt_cast_b,
        in_arg_input_im => dupName_2_ip_dsdk_adapt_cast_x_b,
        in_arg_input_size_x => dupName_0_ip_dsdk_adapt_cast_x_b,
        in_arg_input_size_y => dupName_1_ip_dsdk_adapt_cast_x_b,
        in_arg_local_size_0 => local_size_0,
        in_arg_local_size_1 => local_size_1,
        in_arg_local_size_2 => local_size_2,
        in_arg_output_im => dupName_5_ip_dsdk_adapt_cast_x_b,
        in_memcoalesce_filter_weight_load_0_avm_readdata => avm_memcoalesce_filter_weight_load_0_readdata,
        in_memcoalesce_filter_weight_load_0_avm_readdatavalid => avm_memcoalesce_filter_weight_load_0_readdatavalid,
        in_memcoalesce_filter_weight_load_0_avm_waitrequest => avm_memcoalesce_filter_weight_load_0_waitrequest,
        in_memcoalesce_filter_weight_load_0_avm_writeack => avm_memcoalesce_filter_weight_load_0_writeack,
        in_stall_in => GND_q,
        in_start => start,
        in_unnamed_conv2d1x10_avm_readdata => avm_unnamed_conv2d1x10_readdata,
        in_unnamed_conv2d1x10_avm_readdatavalid => avm_unnamed_conv2d1x10_readdatavalid,
        in_unnamed_conv2d1x10_avm_waitrequest => avm_unnamed_conv2d1x10_waitrequest,
        in_unnamed_conv2d1x10_avm_writeack => avm_unnamed_conv2d1x10_writeack,
        in_unnamed_conv2d1x13_avm_readdata => avm_unnamed_conv2d1x13_readdata,
        in_unnamed_conv2d1x13_avm_readdatavalid => avm_unnamed_conv2d1x13_readdatavalid,
        in_unnamed_conv2d1x13_avm_waitrequest => avm_unnamed_conv2d1x13_waitrequest,
        in_unnamed_conv2d1x13_avm_writeack => avm_unnamed_conv2d1x13_writeack,
        in_unnamed_conv2d1x14_avm_readdata => avm_unnamed_conv2d1x14_readdata,
        in_unnamed_conv2d1x14_avm_readdatavalid => avm_unnamed_conv2d1x14_readdatavalid,
        in_unnamed_conv2d1x14_avm_waitrequest => avm_unnamed_conv2d1x14_waitrequest,
        in_unnamed_conv2d1x14_avm_writeack => avm_unnamed_conv2d1x14_writeack,
        in_unnamed_conv2d1x15_avm_readdata => avm_unnamed_conv2d1x15_readdata,
        in_unnamed_conv2d1x15_avm_readdatavalid => avm_unnamed_conv2d1x15_readdatavalid,
        in_unnamed_conv2d1x15_avm_waitrequest => avm_unnamed_conv2d1x15_waitrequest,
        in_unnamed_conv2d1x15_avm_writeack => avm_unnamed_conv2d1x15_writeack,
        in_unnamed_conv2d1x17_avm_readdata => avm_unnamed_conv2d1x17_readdata,
        in_unnamed_conv2d1x17_avm_readdatavalid => avm_unnamed_conv2d1x17_readdatavalid,
        in_unnamed_conv2d1x17_avm_waitrequest => avm_unnamed_conv2d1x17_waitrequest,
        in_unnamed_conv2d1x17_avm_writeack => avm_unnamed_conv2d1x17_writeack,
        in_valid_in => kernel_valid_in,
        out_memcoalesce_filter_weight_load_0_avm_address => conv2d1x1_function_out_memcoalesce_filter_weight_load_0_avm_address,
        out_memcoalesce_filter_weight_load_0_avm_burstcount => conv2d1x1_function_out_memcoalesce_filter_weight_load_0_avm_burstcount,
        out_memcoalesce_filter_weight_load_0_avm_byteenable => conv2d1x1_function_out_memcoalesce_filter_weight_load_0_avm_byteenable,
        out_memcoalesce_filter_weight_load_0_avm_enable => conv2d1x1_function_out_memcoalesce_filter_weight_load_0_avm_enable,
        out_memcoalesce_filter_weight_load_0_avm_read => conv2d1x1_function_out_memcoalesce_filter_weight_load_0_avm_read,
        out_memcoalesce_filter_weight_load_0_avm_write => conv2d1x1_function_out_memcoalesce_filter_weight_load_0_avm_write,
        out_memcoalesce_filter_weight_load_0_avm_writedata => conv2d1x1_function_out_memcoalesce_filter_weight_load_0_avm_writedata,
        out_o_active_unnamed_conv2d1x17 => conv2d1x1_function_out_o_active_unnamed_conv2d1x17,
        out_stall_out => conv2d1x1_function_out_stall_out,
        out_unnamed_conv2d1x10_avm_address => conv2d1x1_function_out_unnamed_conv2d1x10_avm_address,
        out_unnamed_conv2d1x10_avm_burstcount => conv2d1x1_function_out_unnamed_conv2d1x10_avm_burstcount,
        out_unnamed_conv2d1x10_avm_byteenable => conv2d1x1_function_out_unnamed_conv2d1x10_avm_byteenable,
        out_unnamed_conv2d1x10_avm_enable => conv2d1x1_function_out_unnamed_conv2d1x10_avm_enable,
        out_unnamed_conv2d1x10_avm_read => conv2d1x1_function_out_unnamed_conv2d1x10_avm_read,
        out_unnamed_conv2d1x10_avm_write => conv2d1x1_function_out_unnamed_conv2d1x10_avm_write,
        out_unnamed_conv2d1x10_avm_writedata => conv2d1x1_function_out_unnamed_conv2d1x10_avm_writedata,
        out_unnamed_conv2d1x13_avm_address => conv2d1x1_function_out_unnamed_conv2d1x13_avm_address,
        out_unnamed_conv2d1x13_avm_burstcount => conv2d1x1_function_out_unnamed_conv2d1x13_avm_burstcount,
        out_unnamed_conv2d1x13_avm_byteenable => conv2d1x1_function_out_unnamed_conv2d1x13_avm_byteenable,
        out_unnamed_conv2d1x13_avm_enable => conv2d1x1_function_out_unnamed_conv2d1x13_avm_enable,
        out_unnamed_conv2d1x13_avm_read => conv2d1x1_function_out_unnamed_conv2d1x13_avm_read,
        out_unnamed_conv2d1x13_avm_write => conv2d1x1_function_out_unnamed_conv2d1x13_avm_write,
        out_unnamed_conv2d1x13_avm_writedata => conv2d1x1_function_out_unnamed_conv2d1x13_avm_writedata,
        out_unnamed_conv2d1x14_avm_address => conv2d1x1_function_out_unnamed_conv2d1x14_avm_address,
        out_unnamed_conv2d1x14_avm_burstcount => conv2d1x1_function_out_unnamed_conv2d1x14_avm_burstcount,
        out_unnamed_conv2d1x14_avm_byteenable => conv2d1x1_function_out_unnamed_conv2d1x14_avm_byteenable,
        out_unnamed_conv2d1x14_avm_enable => conv2d1x1_function_out_unnamed_conv2d1x14_avm_enable,
        out_unnamed_conv2d1x14_avm_read => conv2d1x1_function_out_unnamed_conv2d1x14_avm_read,
        out_unnamed_conv2d1x14_avm_write => conv2d1x1_function_out_unnamed_conv2d1x14_avm_write,
        out_unnamed_conv2d1x14_avm_writedata => conv2d1x1_function_out_unnamed_conv2d1x14_avm_writedata,
        out_unnamed_conv2d1x15_avm_address => conv2d1x1_function_out_unnamed_conv2d1x15_avm_address,
        out_unnamed_conv2d1x15_avm_burstcount => conv2d1x1_function_out_unnamed_conv2d1x15_avm_burstcount,
        out_unnamed_conv2d1x15_avm_byteenable => conv2d1x1_function_out_unnamed_conv2d1x15_avm_byteenable,
        out_unnamed_conv2d1x15_avm_enable => conv2d1x1_function_out_unnamed_conv2d1x15_avm_enable,
        out_unnamed_conv2d1x15_avm_read => conv2d1x1_function_out_unnamed_conv2d1x15_avm_read,
        out_unnamed_conv2d1x15_avm_write => conv2d1x1_function_out_unnamed_conv2d1x15_avm_write,
        out_unnamed_conv2d1x15_avm_writedata => conv2d1x1_function_out_unnamed_conv2d1x15_avm_writedata,
        out_unnamed_conv2d1x17_avm_address => conv2d1x1_function_out_unnamed_conv2d1x17_avm_address,
        out_unnamed_conv2d1x17_avm_burstcount => conv2d1x1_function_out_unnamed_conv2d1x17_avm_burstcount,
        out_unnamed_conv2d1x17_avm_byteenable => conv2d1x1_function_out_unnamed_conv2d1x17_avm_byteenable,
        out_unnamed_conv2d1x17_avm_enable => conv2d1x1_function_out_unnamed_conv2d1x17_avm_enable,
        out_unnamed_conv2d1x17_avm_read => conv2d1x1_function_out_unnamed_conv2d1x17_avm_read,
        out_unnamed_conv2d1x17_avm_write => conv2d1x1_function_out_unnamed_conv2d1x17_avm_write,
        out_unnamed_conv2d1x17_avm_writedata => conv2d1x1_function_out_unnamed_conv2d1x17_avm_writedata,
        out_valid_out => conv2d1x1_function_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- avm_memcoalesce_filter_weight_load_0_address(GPOUT,74)
    avm_memcoalesce_filter_weight_load_0_address <= conv2d1x1_function_out_memcoalesce_filter_weight_load_0_avm_address;

    -- avm_memcoalesce_filter_weight_load_0_burstcount(GPOUT,75)
    avm_memcoalesce_filter_weight_load_0_burstcount <= conv2d1x1_function_out_memcoalesce_filter_weight_load_0_avm_burstcount;

    -- avm_memcoalesce_filter_weight_load_0_byteenable(GPOUT,76)
    avm_memcoalesce_filter_weight_load_0_byteenable <= conv2d1x1_function_out_memcoalesce_filter_weight_load_0_avm_byteenable;

    -- avm_memcoalesce_filter_weight_load_0_enable(GPOUT,77)
    avm_memcoalesce_filter_weight_load_0_enable <= conv2d1x1_function_out_memcoalesce_filter_weight_load_0_avm_enable;

    -- avm_memcoalesce_filter_weight_load_0_read(GPOUT,78)
    avm_memcoalesce_filter_weight_load_0_read <= conv2d1x1_function_out_memcoalesce_filter_weight_load_0_avm_read;

    -- avm_memcoalesce_filter_weight_load_0_write(GPOUT,79)
    avm_memcoalesce_filter_weight_load_0_write <= conv2d1x1_function_out_memcoalesce_filter_weight_load_0_avm_write;

    -- avm_memcoalesce_filter_weight_load_0_writedata(GPOUT,80)
    avm_memcoalesce_filter_weight_load_0_writedata <= conv2d1x1_function_out_memcoalesce_filter_weight_load_0_avm_writedata;

    -- avm_unnamed_conv2d1x10_address(GPOUT,81)
    avm_unnamed_conv2d1x10_address <= conv2d1x1_function_out_unnamed_conv2d1x10_avm_address;

    -- avm_unnamed_conv2d1x10_burstcount(GPOUT,82)
    avm_unnamed_conv2d1x10_burstcount <= conv2d1x1_function_out_unnamed_conv2d1x10_avm_burstcount;

    -- avm_unnamed_conv2d1x10_byteenable(GPOUT,83)
    avm_unnamed_conv2d1x10_byteenable <= conv2d1x1_function_out_unnamed_conv2d1x10_avm_byteenable;

    -- avm_unnamed_conv2d1x10_enable(GPOUT,84)
    avm_unnamed_conv2d1x10_enable <= conv2d1x1_function_out_unnamed_conv2d1x10_avm_enable;

    -- avm_unnamed_conv2d1x10_read(GPOUT,85)
    avm_unnamed_conv2d1x10_read <= conv2d1x1_function_out_unnamed_conv2d1x10_avm_read;

    -- avm_unnamed_conv2d1x10_write(GPOUT,86)
    avm_unnamed_conv2d1x10_write <= conv2d1x1_function_out_unnamed_conv2d1x10_avm_write;

    -- avm_unnamed_conv2d1x10_writedata(GPOUT,87)
    avm_unnamed_conv2d1x10_writedata <= conv2d1x1_function_out_unnamed_conv2d1x10_avm_writedata;

    -- avm_unnamed_conv2d1x13_address(GPOUT,88)
    avm_unnamed_conv2d1x13_address <= conv2d1x1_function_out_unnamed_conv2d1x13_avm_address;

    -- avm_unnamed_conv2d1x13_burstcount(GPOUT,89)
    avm_unnamed_conv2d1x13_burstcount <= conv2d1x1_function_out_unnamed_conv2d1x13_avm_burstcount;

    -- avm_unnamed_conv2d1x13_byteenable(GPOUT,90)
    avm_unnamed_conv2d1x13_byteenable <= conv2d1x1_function_out_unnamed_conv2d1x13_avm_byteenable;

    -- avm_unnamed_conv2d1x13_enable(GPOUT,91)
    avm_unnamed_conv2d1x13_enable <= conv2d1x1_function_out_unnamed_conv2d1x13_avm_enable;

    -- avm_unnamed_conv2d1x13_read(GPOUT,92)
    avm_unnamed_conv2d1x13_read <= conv2d1x1_function_out_unnamed_conv2d1x13_avm_read;

    -- avm_unnamed_conv2d1x13_write(GPOUT,93)
    avm_unnamed_conv2d1x13_write <= conv2d1x1_function_out_unnamed_conv2d1x13_avm_write;

    -- avm_unnamed_conv2d1x13_writedata(GPOUT,94)
    avm_unnamed_conv2d1x13_writedata <= conv2d1x1_function_out_unnamed_conv2d1x13_avm_writedata;

    -- avm_unnamed_conv2d1x14_address(GPOUT,95)
    avm_unnamed_conv2d1x14_address <= conv2d1x1_function_out_unnamed_conv2d1x14_avm_address;

    -- avm_unnamed_conv2d1x14_burstcount(GPOUT,96)
    avm_unnamed_conv2d1x14_burstcount <= conv2d1x1_function_out_unnamed_conv2d1x14_avm_burstcount;

    -- avm_unnamed_conv2d1x14_byteenable(GPOUT,97)
    avm_unnamed_conv2d1x14_byteenable <= conv2d1x1_function_out_unnamed_conv2d1x14_avm_byteenable;

    -- avm_unnamed_conv2d1x14_enable(GPOUT,98)
    avm_unnamed_conv2d1x14_enable <= conv2d1x1_function_out_unnamed_conv2d1x14_avm_enable;

    -- avm_unnamed_conv2d1x14_read(GPOUT,99)
    avm_unnamed_conv2d1x14_read <= conv2d1x1_function_out_unnamed_conv2d1x14_avm_read;

    -- avm_unnamed_conv2d1x14_write(GPOUT,100)
    avm_unnamed_conv2d1x14_write <= conv2d1x1_function_out_unnamed_conv2d1x14_avm_write;

    -- avm_unnamed_conv2d1x14_writedata(GPOUT,101)
    avm_unnamed_conv2d1x14_writedata <= conv2d1x1_function_out_unnamed_conv2d1x14_avm_writedata;

    -- avm_unnamed_conv2d1x15_address(GPOUT,102)
    avm_unnamed_conv2d1x15_address <= conv2d1x1_function_out_unnamed_conv2d1x15_avm_address;

    -- avm_unnamed_conv2d1x15_burstcount(GPOUT,103)
    avm_unnamed_conv2d1x15_burstcount <= conv2d1x1_function_out_unnamed_conv2d1x15_avm_burstcount;

    -- avm_unnamed_conv2d1x15_byteenable(GPOUT,104)
    avm_unnamed_conv2d1x15_byteenable <= conv2d1x1_function_out_unnamed_conv2d1x15_avm_byteenable;

    -- avm_unnamed_conv2d1x15_enable(GPOUT,105)
    avm_unnamed_conv2d1x15_enable <= conv2d1x1_function_out_unnamed_conv2d1x15_avm_enable;

    -- avm_unnamed_conv2d1x15_read(GPOUT,106)
    avm_unnamed_conv2d1x15_read <= conv2d1x1_function_out_unnamed_conv2d1x15_avm_read;

    -- avm_unnamed_conv2d1x15_write(GPOUT,107)
    avm_unnamed_conv2d1x15_write <= conv2d1x1_function_out_unnamed_conv2d1x15_avm_write;

    -- avm_unnamed_conv2d1x15_writedata(GPOUT,108)
    avm_unnamed_conv2d1x15_writedata <= conv2d1x1_function_out_unnamed_conv2d1x15_avm_writedata;

    -- avm_unnamed_conv2d1x17_address(GPOUT,109)
    avm_unnamed_conv2d1x17_address <= conv2d1x1_function_out_unnamed_conv2d1x17_avm_address;

    -- avm_unnamed_conv2d1x17_burstcount(GPOUT,110)
    avm_unnamed_conv2d1x17_burstcount <= conv2d1x1_function_out_unnamed_conv2d1x17_avm_burstcount;

    -- avm_unnamed_conv2d1x17_byteenable(GPOUT,111)
    avm_unnamed_conv2d1x17_byteenable <= conv2d1x1_function_out_unnamed_conv2d1x17_avm_byteenable;

    -- avm_unnamed_conv2d1x17_enable(GPOUT,112)
    avm_unnamed_conv2d1x17_enable <= conv2d1x1_function_out_unnamed_conv2d1x17_avm_enable;

    -- avm_unnamed_conv2d1x17_read(GPOUT,113)
    avm_unnamed_conv2d1x17_read <= conv2d1x1_function_out_unnamed_conv2d1x17_avm_read;

    -- avm_unnamed_conv2d1x17_write(GPOUT,114)
    avm_unnamed_conv2d1x17_write <= conv2d1x1_function_out_unnamed_conv2d1x17_avm_write;

    -- avm_unnamed_conv2d1x17_writedata(GPOUT,115)
    avm_unnamed_conv2d1x17_writedata <= conv2d1x1_function_out_unnamed_conv2d1x17_avm_writedata;

    -- acl_clock2x_dummy_consumer(EXTIFACE,8)
    acl_clock2x_dummy_consumer_clock2x <= clock2x;
    acl_clock2x_dummy_consumer_clock2x_bitsignaltemp <= acl_clock2x_dummy_consumer_clock2x(0);
    acl_clock2x_dummy_consumer_myout(0) <= acl_clock2x_dummy_consumer_myout_bitsignaltemp;
    theacl_clock2x_dummy_consumer : acl_clock2x_holder
    PORT MAP (
        clock2x => acl_clock2x_dummy_consumer_clock2x_bitsignaltemp,
        myout => acl_clock2x_dummy_consumer_myout_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- clock2x_output(GPOUT,116)
    clock2x_output <= acl_clock2x_dummy_consumer_myout;

    -- has_a_lsu_active(GPOUT,117)
    has_a_lsu_active <= conv2d1x1_function_out_o_active_unnamed_conv2d1x17;

    -- has_a_write_pending(GPOUT,118)
    has_a_write_pending <= conv2d1x1_function_out_o_active_unnamed_conv2d1x17;

    -- kernel_stall_out(GPOUT,119)
    kernel_stall_out <= conv2d1x1_function_out_stall_out;

    -- kernel_valid_out(GPOUT,120)
    kernel_valid_out <= conv2d1x1_function_out_valid_out;

END normal;
