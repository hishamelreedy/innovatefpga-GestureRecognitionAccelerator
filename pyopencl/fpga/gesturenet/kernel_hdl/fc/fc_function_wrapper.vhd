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

-- VHDL created from fc_function_wrapper
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

entity fc_function_wrapper is
    port (
        avm_unnamed_fc0_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_fc0_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_fc0_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_fc0_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_fc2_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_fc2_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_fc2_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_fc2_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_fc3_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_fc3_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_fc3_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_fc3_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_fc5_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_fc5_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_fc5_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_fc5_writeack : in std_logic_vector(0 downto 0);  -- ufix1
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
        kernel_arguments : in std_logic_vector(319 downto 0);  -- ufix320
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
        avm_unnamed_fc0_address : out std_logic_vector(30 downto 0);  -- ufix31
        avm_unnamed_fc0_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_fc0_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_fc0_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_fc0_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_fc0_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_fc0_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_fc2_address : out std_logic_vector(30 downto 0);  -- ufix31
        avm_unnamed_fc2_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_fc2_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_fc2_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_fc2_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_fc2_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_fc2_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_fc3_address : out std_logic_vector(30 downto 0);  -- ufix31
        avm_unnamed_fc3_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_fc3_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_fc3_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_fc3_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_fc3_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_fc3_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_fc5_address : out std_logic_vector(30 downto 0);  -- ufix31
        avm_unnamed_fc5_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_fc5_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_fc5_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_fc5_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_fc5_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_fc5_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        clock2x_output : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_lsu_active : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_write_pending : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end fc_function_wrapper;

architecture normal of fc_function_wrapper is

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


    component fc_function is
        port (
            in_arg_filter_bias : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_global_id_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_sizex : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_sizey : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_start : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_fc0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc2_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_fc2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc2_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc3_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_fc3_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc3_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc3_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc5_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_fc5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc5_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_active_unnamed_fc5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc0_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_fc0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_fc0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_fc0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
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
            out_unnamed_fc5_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_1_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_2_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_3_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_4_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x_bitsignaltemp : std_logic;
    signal acl_clock2x_dummy_consumer_myout : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_myout_bitsignaltemp : std_logic;
    signal arg_filter_bias_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_filter_weight_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_input_im_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_output_im_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_sizex_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_sizey_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_function_out_o_active_unnamed_fc5 : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_function_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_function_out_unnamed_fc0_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal fc_function_out_unnamed_fc0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal fc_function_out_unnamed_fc0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_function_out_unnamed_fc0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_function_out_unnamed_fc0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_function_out_unnamed_fc0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_function_out_unnamed_fc0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal fc_function_out_unnamed_fc2_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal fc_function_out_unnamed_fc2_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal fc_function_out_unnamed_fc2_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_function_out_unnamed_fc2_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_function_out_unnamed_fc2_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_function_out_unnamed_fc2_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_function_out_unnamed_fc2_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal fc_function_out_unnamed_fc3_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal fc_function_out_unnamed_fc3_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal fc_function_out_unnamed_fc3_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_function_out_unnamed_fc3_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_function_out_unnamed_fc3_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_function_out_unnamed_fc3_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_function_out_unnamed_fc3_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal fc_function_out_unnamed_fc5_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal fc_function_out_unnamed_fc5_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal fc_function_out_unnamed_fc5_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_function_out_unnamed_fc5_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_function_out_unnamed_fc5_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_function_out_unnamed_fc5_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_function_out_unnamed_fc5_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal fc_function_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- arg_sizey_select(BITSELECT,13)
    arg_sizey_select_b <= kernel_arguments(63 downto 32);

    -- dupName_0_ip_dsdk_adapt_cast_x(BITSELECT,2)
    dupName_0_ip_dsdk_adapt_cast_x_b <= arg_sizey_select_b(31 downto 0);

    -- arg_sizex_select(BITSELECT,12)
    arg_sizex_select_b <= kernel_arguments(31 downto 0);

    -- ip_dsdk_adapt_cast(BITSELECT,63)
    ip_dsdk_adapt_cast_b <= arg_sizex_select_b(31 downto 0);

    -- arg_output_im_select(BITSELECT,11)
    arg_output_im_select_b <= kernel_arguments(319 downto 256);

    -- dupName_4_ip_dsdk_adapt_cast_x(BITSELECT,6)
    dupName_4_ip_dsdk_adapt_cast_x_b <= arg_output_im_select_b(63 downto 0);

    -- arg_input_im_select(BITSELECT,10)
    arg_input_im_select_b <= kernel_arguments(127 downto 64);

    -- dupName_1_ip_dsdk_adapt_cast_x(BITSELECT,3)
    dupName_1_ip_dsdk_adapt_cast_x_b <= arg_input_im_select_b(63 downto 0);

    -- arg_filter_weight_select(BITSELECT,9)
    arg_filter_weight_select_b <= kernel_arguments(191 downto 128);

    -- dupName_2_ip_dsdk_adapt_cast_x(BITSELECT,4)
    dupName_2_ip_dsdk_adapt_cast_x_b <= arg_filter_weight_select_b(63 downto 0);

    -- arg_filter_bias_select(BITSELECT,8)
    arg_filter_bias_select_b <= kernel_arguments(255 downto 192);

    -- dupName_3_ip_dsdk_adapt_cast_x(BITSELECT,5)
    dupName_3_ip_dsdk_adapt_cast_x_b <= arg_filter_bias_select_b(63 downto 0);

    -- fc_function(BLACKBOX,15)
    thefc_function : fc_function
    PORT MAP (
        in_arg_filter_bias => dupName_3_ip_dsdk_adapt_cast_x_b,
        in_arg_filter_weight => dupName_2_ip_dsdk_adapt_cast_x_b,
        in_arg_global_id_0 => global_id_0,
        in_arg_global_size_0 => global_size_0,
        in_arg_global_size_1 => global_size_1,
        in_arg_global_size_2 => global_size_2,
        in_arg_input_im => dupName_1_ip_dsdk_adapt_cast_x_b,
        in_arg_local_size_0 => local_size_0,
        in_arg_local_size_1 => local_size_1,
        in_arg_local_size_2 => local_size_2,
        in_arg_output_im => dupName_4_ip_dsdk_adapt_cast_x_b,
        in_arg_sizex => ip_dsdk_adapt_cast_b,
        in_arg_sizey => dupName_0_ip_dsdk_adapt_cast_x_b,
        in_stall_in => GND_q,
        in_start => start,
        in_unnamed_fc0_avm_readdata => avm_unnamed_fc0_readdata,
        in_unnamed_fc0_avm_readdatavalid => avm_unnamed_fc0_readdatavalid,
        in_unnamed_fc0_avm_waitrequest => avm_unnamed_fc0_waitrequest,
        in_unnamed_fc0_avm_writeack => avm_unnamed_fc0_writeack,
        in_unnamed_fc2_avm_readdata => avm_unnamed_fc2_readdata,
        in_unnamed_fc2_avm_readdatavalid => avm_unnamed_fc2_readdatavalid,
        in_unnamed_fc2_avm_waitrequest => avm_unnamed_fc2_waitrequest,
        in_unnamed_fc2_avm_writeack => avm_unnamed_fc2_writeack,
        in_unnamed_fc3_avm_readdata => avm_unnamed_fc3_readdata,
        in_unnamed_fc3_avm_readdatavalid => avm_unnamed_fc3_readdatavalid,
        in_unnamed_fc3_avm_waitrequest => avm_unnamed_fc3_waitrequest,
        in_unnamed_fc3_avm_writeack => avm_unnamed_fc3_writeack,
        in_unnamed_fc5_avm_readdata => avm_unnamed_fc5_readdata,
        in_unnamed_fc5_avm_readdatavalid => avm_unnamed_fc5_readdatavalid,
        in_unnamed_fc5_avm_waitrequest => avm_unnamed_fc5_waitrequest,
        in_unnamed_fc5_avm_writeack => avm_unnamed_fc5_writeack,
        in_valid_in => kernel_valid_in,
        out_o_active_unnamed_fc5 => fc_function_out_o_active_unnamed_fc5,
        out_stall_out => fc_function_out_stall_out,
        out_unnamed_fc0_avm_address => fc_function_out_unnamed_fc0_avm_address,
        out_unnamed_fc0_avm_burstcount => fc_function_out_unnamed_fc0_avm_burstcount,
        out_unnamed_fc0_avm_byteenable => fc_function_out_unnamed_fc0_avm_byteenable,
        out_unnamed_fc0_avm_enable => fc_function_out_unnamed_fc0_avm_enable,
        out_unnamed_fc0_avm_read => fc_function_out_unnamed_fc0_avm_read,
        out_unnamed_fc0_avm_write => fc_function_out_unnamed_fc0_avm_write,
        out_unnamed_fc0_avm_writedata => fc_function_out_unnamed_fc0_avm_writedata,
        out_unnamed_fc2_avm_address => fc_function_out_unnamed_fc2_avm_address,
        out_unnamed_fc2_avm_burstcount => fc_function_out_unnamed_fc2_avm_burstcount,
        out_unnamed_fc2_avm_byteenable => fc_function_out_unnamed_fc2_avm_byteenable,
        out_unnamed_fc2_avm_enable => fc_function_out_unnamed_fc2_avm_enable,
        out_unnamed_fc2_avm_read => fc_function_out_unnamed_fc2_avm_read,
        out_unnamed_fc2_avm_write => fc_function_out_unnamed_fc2_avm_write,
        out_unnamed_fc2_avm_writedata => fc_function_out_unnamed_fc2_avm_writedata,
        out_unnamed_fc3_avm_address => fc_function_out_unnamed_fc3_avm_address,
        out_unnamed_fc3_avm_burstcount => fc_function_out_unnamed_fc3_avm_burstcount,
        out_unnamed_fc3_avm_byteenable => fc_function_out_unnamed_fc3_avm_byteenable,
        out_unnamed_fc3_avm_enable => fc_function_out_unnamed_fc3_avm_enable,
        out_unnamed_fc3_avm_read => fc_function_out_unnamed_fc3_avm_read,
        out_unnamed_fc3_avm_write => fc_function_out_unnamed_fc3_avm_write,
        out_unnamed_fc3_avm_writedata => fc_function_out_unnamed_fc3_avm_writedata,
        out_unnamed_fc5_avm_address => fc_function_out_unnamed_fc5_avm_address,
        out_unnamed_fc5_avm_burstcount => fc_function_out_unnamed_fc5_avm_burstcount,
        out_unnamed_fc5_avm_byteenable => fc_function_out_unnamed_fc5_avm_byteenable,
        out_unnamed_fc5_avm_enable => fc_function_out_unnamed_fc5_avm_enable,
        out_unnamed_fc5_avm_read => fc_function_out_unnamed_fc5_avm_read,
        out_unnamed_fc5_avm_write => fc_function_out_unnamed_fc5_avm_write,
        out_unnamed_fc5_avm_writedata => fc_function_out_unnamed_fc5_avm_writedata,
        out_valid_out => fc_function_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- avm_unnamed_fc0_address(GPOUT,64)
    avm_unnamed_fc0_address <= fc_function_out_unnamed_fc0_avm_address;

    -- avm_unnamed_fc0_burstcount(GPOUT,65)
    avm_unnamed_fc0_burstcount <= fc_function_out_unnamed_fc0_avm_burstcount;

    -- avm_unnamed_fc0_byteenable(GPOUT,66)
    avm_unnamed_fc0_byteenable <= fc_function_out_unnamed_fc0_avm_byteenable;

    -- avm_unnamed_fc0_enable(GPOUT,67)
    avm_unnamed_fc0_enable <= fc_function_out_unnamed_fc0_avm_enable;

    -- avm_unnamed_fc0_read(GPOUT,68)
    avm_unnamed_fc0_read <= fc_function_out_unnamed_fc0_avm_read;

    -- avm_unnamed_fc0_write(GPOUT,69)
    avm_unnamed_fc0_write <= fc_function_out_unnamed_fc0_avm_write;

    -- avm_unnamed_fc0_writedata(GPOUT,70)
    avm_unnamed_fc0_writedata <= fc_function_out_unnamed_fc0_avm_writedata;

    -- avm_unnamed_fc2_address(GPOUT,71)
    avm_unnamed_fc2_address <= fc_function_out_unnamed_fc2_avm_address;

    -- avm_unnamed_fc2_burstcount(GPOUT,72)
    avm_unnamed_fc2_burstcount <= fc_function_out_unnamed_fc2_avm_burstcount;

    -- avm_unnamed_fc2_byteenable(GPOUT,73)
    avm_unnamed_fc2_byteenable <= fc_function_out_unnamed_fc2_avm_byteenable;

    -- avm_unnamed_fc2_enable(GPOUT,74)
    avm_unnamed_fc2_enable <= fc_function_out_unnamed_fc2_avm_enable;

    -- avm_unnamed_fc2_read(GPOUT,75)
    avm_unnamed_fc2_read <= fc_function_out_unnamed_fc2_avm_read;

    -- avm_unnamed_fc2_write(GPOUT,76)
    avm_unnamed_fc2_write <= fc_function_out_unnamed_fc2_avm_write;

    -- avm_unnamed_fc2_writedata(GPOUT,77)
    avm_unnamed_fc2_writedata <= fc_function_out_unnamed_fc2_avm_writedata;

    -- avm_unnamed_fc3_address(GPOUT,78)
    avm_unnamed_fc3_address <= fc_function_out_unnamed_fc3_avm_address;

    -- avm_unnamed_fc3_burstcount(GPOUT,79)
    avm_unnamed_fc3_burstcount <= fc_function_out_unnamed_fc3_avm_burstcount;

    -- avm_unnamed_fc3_byteenable(GPOUT,80)
    avm_unnamed_fc3_byteenable <= fc_function_out_unnamed_fc3_avm_byteenable;

    -- avm_unnamed_fc3_enable(GPOUT,81)
    avm_unnamed_fc3_enable <= fc_function_out_unnamed_fc3_avm_enable;

    -- avm_unnamed_fc3_read(GPOUT,82)
    avm_unnamed_fc3_read <= fc_function_out_unnamed_fc3_avm_read;

    -- avm_unnamed_fc3_write(GPOUT,83)
    avm_unnamed_fc3_write <= fc_function_out_unnamed_fc3_avm_write;

    -- avm_unnamed_fc3_writedata(GPOUT,84)
    avm_unnamed_fc3_writedata <= fc_function_out_unnamed_fc3_avm_writedata;

    -- avm_unnamed_fc5_address(GPOUT,85)
    avm_unnamed_fc5_address <= fc_function_out_unnamed_fc5_avm_address;

    -- avm_unnamed_fc5_burstcount(GPOUT,86)
    avm_unnamed_fc5_burstcount <= fc_function_out_unnamed_fc5_avm_burstcount;

    -- avm_unnamed_fc5_byteenable(GPOUT,87)
    avm_unnamed_fc5_byteenable <= fc_function_out_unnamed_fc5_avm_byteenable;

    -- avm_unnamed_fc5_enable(GPOUT,88)
    avm_unnamed_fc5_enable <= fc_function_out_unnamed_fc5_avm_enable;

    -- avm_unnamed_fc5_read(GPOUT,89)
    avm_unnamed_fc5_read <= fc_function_out_unnamed_fc5_avm_read;

    -- avm_unnamed_fc5_write(GPOUT,90)
    avm_unnamed_fc5_write <= fc_function_out_unnamed_fc5_avm_write;

    -- avm_unnamed_fc5_writedata(GPOUT,91)
    avm_unnamed_fc5_writedata <= fc_function_out_unnamed_fc5_avm_writedata;

    -- acl_clock2x_dummy_consumer(EXTIFACE,7)
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

    -- clock2x_output(GPOUT,92)
    clock2x_output <= acl_clock2x_dummy_consumer_myout;

    -- has_a_lsu_active(GPOUT,93)
    has_a_lsu_active <= fc_function_out_o_active_unnamed_fc5;

    -- has_a_write_pending(GPOUT,94)
    has_a_write_pending <= fc_function_out_o_active_unnamed_fc5;

    -- kernel_stall_out(GPOUT,95)
    kernel_stall_out <= fc_function_out_stall_out;

    -- kernel_valid_out(GPOUT,96)
    kernel_valid_out <= fc_function_out_valid_out;

END normal;
