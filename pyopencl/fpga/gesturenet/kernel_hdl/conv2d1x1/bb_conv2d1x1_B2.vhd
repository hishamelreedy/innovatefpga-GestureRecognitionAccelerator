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

-- VHDL created from bb_conv2d1x1_B2
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

entity bb_conv2d1x1_B2 is
    port (
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
        out_c2_exit_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exit_1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c2_exit_2 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c2_exit_3 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c0_exe11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe134 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe3 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_i_0115 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_179 : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_filter_weight_load_0_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_memcoalesce_filter_weight_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_memcoalesce_filter_weight_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_filter_weight_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_filter_weight_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_filter_weight_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_filter_weight_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_output_im_addr_0107 : out std_logic_vector(63 downto 0);  -- ufix64
        out_output_im_addr_1611 : out std_logic_vector(63 downto 0);  -- ufix64
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x12 : out std_logic_vector(31 downto 0);  -- float32_m23
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
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe11_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe11_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_0115_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_0115_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size_x : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_size_y : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_179_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_179_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_24_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_24_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_memcoalesce_filter_weight_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_filter_weight_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_filter_weight_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_filter_weight_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_output_im_addr_0107_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_0107_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_1611_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_1611_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_tmp_23_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_tmp_23_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d1x12_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d1x12_1 : in std_logic_vector(31 downto 0);  -- float32_m23
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
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_conv2d1x1_B2;

architecture normal of bb_conv2d1x1_B2 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component conv2d1x1_B2_branch is
        port (
            in_c1_exit33_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit33_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit33_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit33_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit33_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit33_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit33_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit33_7 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exit33_8 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exit33_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exit33_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exit_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c2_exit_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c2_exit_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c2_exit_3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_exe11 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe134 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c2_exe3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_0115 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_179 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im_addr_0107 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_1611 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x12 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_output_im_addr_0107 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_output_im_addr_1611 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x12 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_conv2d1x1_B2_stall_region is
        port (
            in_c0_exe11 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_0115 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size_x : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_size_y : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_179 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_filter_weight_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_output_im_addr_0107 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_1611 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_tmp_23 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d1x12 : in std_logic_vector(31 downto 0);  -- Floating Point
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
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_c1_exe10 : out std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component conv2d1x1_B2_merge is
        port (
            in_c0_exe11_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe11_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_0115_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_0115_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_179_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_179_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_24_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_24_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im_addr_0107_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_0107_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_1611_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_1611_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_tmp_23_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_tmp_23_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d1x12_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d1x12_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_i_0115 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_179 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_k_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_output_im_addr_0107 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_output_im_addr_1611 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_tmp_23 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_unnamed_conv2d1x12 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_7 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_8 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_c2_exit_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_c2_exit_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_c2_exit_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_c2_exit_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_c0_exe11 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_c1_exe134 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_c1_exe9 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_c2_exe3 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_i_0115 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_j_179 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_output_im_addr_0107 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_output_im_addr_1611 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_unnamed_conv2d1x12 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_branch_aunroll_x_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_c1_exit33_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_c1_exit33_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_c1_exit33_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_c1_exit33_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_c1_exit33_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_c1_exit33_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_c1_exit33_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_c1_exit33_7 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_c1_exit33_8 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_c1_exit33_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_c1_exit33_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_c2_exit_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_c2_exit_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_c2_exit_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_c2_exit_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_c0_exe11 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_c1_exe10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_c1_exe134 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_c1_exe9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_c2_exe3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_i_0115 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_j_179 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_output_im_addr_0107 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_output_im_addr_1611 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x12 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x13_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x13_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x13_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x13_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x13_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x13_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x13_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_conv2d1x1_B2_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_merge_out_c0_exe11 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B2_merge_out_i_0115 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_merge_out_j_179 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_merge_out_k_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_merge_out_output_im_addr_0107 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B2_merge_out_output_im_addr_1611 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv2d1x1_B2_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_merge_out_tmp_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_merge_out_unnamed_conv2d1x12 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- conv2d1x1_B2_merge(BLACKBOX,60)
    theconv2d1x1_B2_merge : conv2d1x1_B2_merge
    PORT MAP (
        in_c0_exe11_0 => in_c0_exe11_0,
        in_c0_exe11_1 => in_c0_exe11_1,
        in_i_0115_0 => in_i_0115_0,
        in_i_0115_1 => in_i_0115_1,
        in_j_179_0 => in_j_179_0,
        in_j_179_1 => in_j_179_1,
        in_k_24_0 => in_k_24_0,
        in_k_24_1 => in_k_24_1,
        in_output_im_addr_0107_0 => in_output_im_addr_0107_0,
        in_output_im_addr_0107_1 => in_output_im_addr_0107_1,
        in_output_im_addr_1611_0 => in_output_im_addr_1611_0,
        in_output_im_addr_1611_1 => in_output_im_addr_1611_1,
        in_stall_in => bb_conv2d1x1_B2_stall_region_out_stall_out,
        in_tmp_23_0 => in_tmp_23_0,
        in_tmp_23_1 => in_tmp_23_1,
        in_unnamed_conv2d1x12_0 => in_unnamed_conv2d1x12_0,
        in_unnamed_conv2d1x12_1 => in_unnamed_conv2d1x12_1,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_c0_exe11 => conv2d1x1_B2_merge_out_c0_exe11,
        out_i_0115 => conv2d1x1_B2_merge_out_i_0115,
        out_j_179 => conv2d1x1_B2_merge_out_j_179,
        out_k_24 => conv2d1x1_B2_merge_out_k_24,
        out_output_im_addr_0107 => conv2d1x1_B2_merge_out_output_im_addr_0107,
        out_output_im_addr_1611 => conv2d1x1_B2_merge_out_output_im_addr_1611,
        out_stall_out_0 => conv2d1x1_B2_merge_out_stall_out_0,
        out_stall_out_1 => conv2d1x1_B2_merge_out_stall_out_1,
        out_tmp_23 => conv2d1x1_B2_merge_out_tmp_23,
        out_unnamed_conv2d1x12 => conv2d1x1_B2_merge_out_unnamed_conv2d1x12,
        out_valid_out => conv2d1x1_B2_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_conv2d1x1_B2_stall_region(BLACKBOX,59)
    thebb_conv2d1x1_B2_stall_region : bb_conv2d1x1_B2_stall_region
    PORT MAP (
        in_c0_exe11 => conv2d1x1_B2_merge_out_c0_exe11,
        in_filter_weight => in_filter_weight,
        in_flush => in_flush,
        in_i_0115 => conv2d1x1_B2_merge_out_i_0115,
        in_input_channels => in_input_channels,
        in_input_im => in_input_im,
        in_input_size_x => in_input_size_x,
        in_input_size_y => in_input_size_y,
        in_j_179 => conv2d1x1_B2_merge_out_j_179,
        in_k_24 => conv2d1x1_B2_merge_out_k_24,
        in_memcoalesce_filter_weight_load_0_avm_readdata => in_memcoalesce_filter_weight_load_0_avm_readdata,
        in_memcoalesce_filter_weight_load_0_avm_readdatavalid => in_memcoalesce_filter_weight_load_0_avm_readdatavalid,
        in_memcoalesce_filter_weight_load_0_avm_waitrequest => in_memcoalesce_filter_weight_load_0_avm_waitrequest,
        in_memcoalesce_filter_weight_load_0_avm_writeack => in_memcoalesce_filter_weight_load_0_avm_writeack,
        in_output_im_addr_0107 => conv2d1x1_B2_merge_out_output_im_addr_0107,
        in_output_im_addr_1611 => conv2d1x1_B2_merge_out_output_im_addr_1611,
        in_stall_in => conv2d1x1_B2_branch_aunroll_x_out_stall_out,
        in_tmp_23 => conv2d1x1_B2_merge_out_tmp_23,
        in_unnamed_conv2d1x12 => conv2d1x1_B2_merge_out_unnamed_conv2d1x12,
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
        in_valid_in => conv2d1x1_B2_merge_out_valid_out,
        out_c1_exit33_0 => bb_conv2d1x1_B2_stall_region_out_c1_exit33_0,
        out_c1_exit33_1 => bb_conv2d1x1_B2_stall_region_out_c1_exit33_1,
        out_c1_exit33_2 => bb_conv2d1x1_B2_stall_region_out_c1_exit33_2,
        out_c1_exit33_3 => bb_conv2d1x1_B2_stall_region_out_c1_exit33_3,
        out_c1_exit33_4 => bb_conv2d1x1_B2_stall_region_out_c1_exit33_4,
        out_c1_exit33_5 => bb_conv2d1x1_B2_stall_region_out_c1_exit33_5,
        out_c1_exit33_6 => bb_conv2d1x1_B2_stall_region_out_c1_exit33_6,
        out_c1_exit33_7 => bb_conv2d1x1_B2_stall_region_out_c1_exit33_7,
        out_c1_exit33_8 => bb_conv2d1x1_B2_stall_region_out_c1_exit33_8,
        out_c1_exit33_9 => bb_conv2d1x1_B2_stall_region_out_c1_exit33_9,
        out_c1_exit33_10 => bb_conv2d1x1_B2_stall_region_out_c1_exit33_10,
        out_c2_exit_0 => bb_conv2d1x1_B2_stall_region_out_c2_exit_0,
        out_c2_exit_1 => bb_conv2d1x1_B2_stall_region_out_c2_exit_1,
        out_c2_exit_2 => bb_conv2d1x1_B2_stall_region_out_c2_exit_2,
        out_c2_exit_3 => bb_conv2d1x1_B2_stall_region_out_c2_exit_3,
        out_c0_exe11 => bb_conv2d1x1_B2_stall_region_out_c0_exe11,
        out_c1_exe10 => bb_conv2d1x1_B2_stall_region_out_c1_exe10,
        out_c1_exe134 => bb_conv2d1x1_B2_stall_region_out_c1_exe134,
        out_c1_exe9 => bb_conv2d1x1_B2_stall_region_out_c1_exe9,
        out_c2_exe3 => bb_conv2d1x1_B2_stall_region_out_c2_exe3,
        out_i_0115 => bb_conv2d1x1_B2_stall_region_out_i_0115,
        out_j_179 => bb_conv2d1x1_B2_stall_region_out_j_179,
        out_memcoalesce_filter_weight_load_0_avm_address => bb_conv2d1x1_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_address,
        out_memcoalesce_filter_weight_load_0_avm_burstcount => bb_conv2d1x1_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_burstcount,
        out_memcoalesce_filter_weight_load_0_avm_byteenable => bb_conv2d1x1_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_byteenable,
        out_memcoalesce_filter_weight_load_0_avm_enable => bb_conv2d1x1_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_enable,
        out_memcoalesce_filter_weight_load_0_avm_read => bb_conv2d1x1_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_read,
        out_memcoalesce_filter_weight_load_0_avm_write => bb_conv2d1x1_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_write,
        out_memcoalesce_filter_weight_load_0_avm_writedata => bb_conv2d1x1_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_writedata,
        out_output_im_addr_0107 => bb_conv2d1x1_B2_stall_region_out_output_im_addr_0107,
        out_output_im_addr_1611 => bb_conv2d1x1_B2_stall_region_out_output_im_addr_1611,
        out_stall_out => bb_conv2d1x1_B2_stall_region_out_stall_out,
        out_unnamed_conv2d1x12 => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x12,
        out_unnamed_conv2d1x13_avm_address => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x13_avm_address,
        out_unnamed_conv2d1x13_avm_burstcount => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x13_avm_burstcount,
        out_unnamed_conv2d1x13_avm_byteenable => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x13_avm_byteenable,
        out_unnamed_conv2d1x13_avm_enable => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x13_avm_enable,
        out_unnamed_conv2d1x13_avm_read => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x13_avm_read,
        out_unnamed_conv2d1x13_avm_write => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x13_avm_write,
        out_unnamed_conv2d1x13_avm_writedata => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x13_avm_writedata,
        out_unnamed_conv2d1x14_avm_address => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_address,
        out_unnamed_conv2d1x14_avm_burstcount => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_burstcount,
        out_unnamed_conv2d1x14_avm_byteenable => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_byteenable,
        out_unnamed_conv2d1x14_avm_enable => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_enable,
        out_unnamed_conv2d1x14_avm_read => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_read,
        out_unnamed_conv2d1x14_avm_write => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_write,
        out_unnamed_conv2d1x14_avm_writedata => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_writedata,
        out_unnamed_conv2d1x15_avm_address => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_address,
        out_unnamed_conv2d1x15_avm_burstcount => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_burstcount,
        out_unnamed_conv2d1x15_avm_byteenable => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_byteenable,
        out_unnamed_conv2d1x15_avm_enable => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_enable,
        out_unnamed_conv2d1x15_avm_read => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_read,
        out_unnamed_conv2d1x15_avm_write => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_write,
        out_unnamed_conv2d1x15_avm_writedata => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_writedata,
        out_valid_out => bb_conv2d1x1_B2_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- conv2d1x1_B2_branch_aunroll_x(BLACKBOX,2)
    theconv2d1x1_B2_branch_aunroll_x : conv2d1x1_B2_branch
    PORT MAP (
        in_c1_exit33_0 => bb_conv2d1x1_B2_stall_region_out_c1_exit33_0,
        in_c1_exit33_1 => bb_conv2d1x1_B2_stall_region_out_c1_exit33_1,
        in_c1_exit33_2 => bb_conv2d1x1_B2_stall_region_out_c1_exit33_2,
        in_c1_exit33_3 => bb_conv2d1x1_B2_stall_region_out_c1_exit33_3,
        in_c1_exit33_4 => bb_conv2d1x1_B2_stall_region_out_c1_exit33_4,
        in_c1_exit33_5 => bb_conv2d1x1_B2_stall_region_out_c1_exit33_5,
        in_c1_exit33_6 => bb_conv2d1x1_B2_stall_region_out_c1_exit33_6,
        in_c1_exit33_7 => bb_conv2d1x1_B2_stall_region_out_c1_exit33_7,
        in_c1_exit33_8 => bb_conv2d1x1_B2_stall_region_out_c1_exit33_8,
        in_c1_exit33_9 => bb_conv2d1x1_B2_stall_region_out_c1_exit33_9,
        in_c1_exit33_10 => bb_conv2d1x1_B2_stall_region_out_c1_exit33_10,
        in_c2_exit_0 => bb_conv2d1x1_B2_stall_region_out_c2_exit_0,
        in_c2_exit_1 => bb_conv2d1x1_B2_stall_region_out_c2_exit_1,
        in_c2_exit_2 => bb_conv2d1x1_B2_stall_region_out_c2_exit_2,
        in_c2_exit_3 => bb_conv2d1x1_B2_stall_region_out_c2_exit_3,
        in_c0_exe11 => bb_conv2d1x1_B2_stall_region_out_c0_exe11,
        in_c1_exe10 => bb_conv2d1x1_B2_stall_region_out_c1_exe10,
        in_c1_exe134 => bb_conv2d1x1_B2_stall_region_out_c1_exe134,
        in_c1_exe9 => bb_conv2d1x1_B2_stall_region_out_c1_exe9,
        in_c2_exe3 => bb_conv2d1x1_B2_stall_region_out_c2_exe3,
        in_i_0115 => bb_conv2d1x1_B2_stall_region_out_i_0115,
        in_j_179 => bb_conv2d1x1_B2_stall_region_out_j_179,
        in_output_im_addr_0107 => bb_conv2d1x1_B2_stall_region_out_output_im_addr_0107,
        in_output_im_addr_1611 => bb_conv2d1x1_B2_stall_region_out_output_im_addr_1611,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_unnamed_conv2d1x12 => bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x12,
        in_valid_in => bb_conv2d1x1_B2_stall_region_out_valid_out,
        out_c1_exit33_0 => conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_0,
        out_c1_exit33_1 => conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_1,
        out_c1_exit33_2 => conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_2,
        out_c1_exit33_3 => conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_3,
        out_c1_exit33_4 => conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_4,
        out_c1_exit33_5 => conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_5,
        out_c1_exit33_6 => conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_6,
        out_c1_exit33_7 => conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_7,
        out_c1_exit33_8 => conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_8,
        out_c1_exit33_9 => conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_9,
        out_c1_exit33_10 => conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_10,
        out_c2_exit_0 => conv2d1x1_B2_branch_aunroll_x_out_c2_exit_0,
        out_c2_exit_1 => conv2d1x1_B2_branch_aunroll_x_out_c2_exit_1,
        out_c2_exit_2 => conv2d1x1_B2_branch_aunroll_x_out_c2_exit_2,
        out_c2_exit_3 => conv2d1x1_B2_branch_aunroll_x_out_c2_exit_3,
        out_c0_exe11 => conv2d1x1_B2_branch_aunroll_x_out_c0_exe11,
        out_c1_exe134 => conv2d1x1_B2_branch_aunroll_x_out_c1_exe134,
        out_c1_exe9 => conv2d1x1_B2_branch_aunroll_x_out_c1_exe9,
        out_c2_exe3 => conv2d1x1_B2_branch_aunroll_x_out_c2_exe3,
        out_i_0115 => conv2d1x1_B2_branch_aunroll_x_out_i_0115,
        out_j_179 => conv2d1x1_B2_branch_aunroll_x_out_j_179,
        out_output_im_addr_0107 => conv2d1x1_B2_branch_aunroll_x_out_output_im_addr_0107,
        out_output_im_addr_1611 => conv2d1x1_B2_branch_aunroll_x_out_output_im_addr_1611,
        out_stall_out => conv2d1x1_B2_branch_aunroll_x_out_stall_out,
        out_unnamed_conv2d1x12 => conv2d1x1_B2_branch_aunroll_x_out_unnamed_conv2d1x12,
        out_valid_out_0 => conv2d1x1_B2_branch_aunroll_x_out_valid_out_0,
        out_valid_out_1 => conv2d1x1_B2_branch_aunroll_x_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_c1_exit33_0(GPOUT,3)
    out_c1_exit33_0 <= conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_0;

    -- out_c1_exit33_1(GPOUT,4)
    out_c1_exit33_1 <= conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_1;

    -- out_c1_exit33_2(GPOUT,5)
    out_c1_exit33_2 <= conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_2;

    -- out_c1_exit33_3(GPOUT,6)
    out_c1_exit33_3 <= conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_3;

    -- out_c1_exit33_4(GPOUT,7)
    out_c1_exit33_4 <= conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_4;

    -- out_c1_exit33_5(GPOUT,8)
    out_c1_exit33_5 <= conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_5;

    -- out_c1_exit33_6(GPOUT,9)
    out_c1_exit33_6 <= conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_6;

    -- out_c1_exit33_7(GPOUT,10)
    out_c1_exit33_7 <= conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_7;

    -- out_c1_exit33_8(GPOUT,11)
    out_c1_exit33_8 <= conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_8;

    -- out_c1_exit33_9(GPOUT,12)
    out_c1_exit33_9 <= conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_9;

    -- out_c1_exit33_10(GPOUT,13)
    out_c1_exit33_10 <= conv2d1x1_B2_branch_aunroll_x_out_c1_exit33_10;

    -- out_c2_exit_0(GPOUT,14)
    out_c2_exit_0 <= conv2d1x1_B2_branch_aunroll_x_out_c2_exit_0;

    -- out_c2_exit_1(GPOUT,15)
    out_c2_exit_1 <= conv2d1x1_B2_branch_aunroll_x_out_c2_exit_1;

    -- out_c2_exit_2(GPOUT,16)
    out_c2_exit_2 <= conv2d1x1_B2_branch_aunroll_x_out_c2_exit_2;

    -- out_c2_exit_3(GPOUT,17)
    out_c2_exit_3 <= conv2d1x1_B2_branch_aunroll_x_out_c2_exit_3;

    -- out_c0_exe11(GPOUT,18)
    out_c0_exe11 <= conv2d1x1_B2_branch_aunroll_x_out_c0_exe11;

    -- out_c1_exe134(GPOUT,19)
    out_c1_exe134 <= conv2d1x1_B2_branch_aunroll_x_out_c1_exe134;

    -- out_c1_exe9(GPOUT,20)
    out_c1_exe9 <= conv2d1x1_B2_branch_aunroll_x_out_c1_exe9;

    -- out_c2_exe3(GPOUT,21)
    out_c2_exe3 <= conv2d1x1_B2_branch_aunroll_x_out_c2_exe3;

    -- out_i_0115(GPOUT,22)
    out_i_0115 <= conv2d1x1_B2_branch_aunroll_x_out_i_0115;

    -- out_j_179(GPOUT,23)
    out_j_179 <= conv2d1x1_B2_branch_aunroll_x_out_j_179;

    -- out_memcoalesce_filter_weight_load_0_avm_address(GPOUT,24)
    out_memcoalesce_filter_weight_load_0_avm_address <= bb_conv2d1x1_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_address;

    -- out_memcoalesce_filter_weight_load_0_avm_burstcount(GPOUT,25)
    out_memcoalesce_filter_weight_load_0_avm_burstcount <= bb_conv2d1x1_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_burstcount;

    -- out_memcoalesce_filter_weight_load_0_avm_byteenable(GPOUT,26)
    out_memcoalesce_filter_weight_load_0_avm_byteenable <= bb_conv2d1x1_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_byteenable;

    -- out_memcoalesce_filter_weight_load_0_avm_enable(GPOUT,27)
    out_memcoalesce_filter_weight_load_0_avm_enable <= bb_conv2d1x1_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_enable;

    -- out_memcoalesce_filter_weight_load_0_avm_read(GPOUT,28)
    out_memcoalesce_filter_weight_load_0_avm_read <= bb_conv2d1x1_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_read;

    -- out_memcoalesce_filter_weight_load_0_avm_write(GPOUT,29)
    out_memcoalesce_filter_weight_load_0_avm_write <= bb_conv2d1x1_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_write;

    -- out_memcoalesce_filter_weight_load_0_avm_writedata(GPOUT,30)
    out_memcoalesce_filter_weight_load_0_avm_writedata <= bb_conv2d1x1_B2_stall_region_out_memcoalesce_filter_weight_load_0_avm_writedata;

    -- out_output_im_addr_0107(GPOUT,31)
    out_output_im_addr_0107 <= conv2d1x1_B2_branch_aunroll_x_out_output_im_addr_0107;

    -- out_output_im_addr_1611(GPOUT,32)
    out_output_im_addr_1611 <= conv2d1x1_B2_branch_aunroll_x_out_output_im_addr_1611;

    -- out_stall_out_0(GPOUT,33)
    out_stall_out_0 <= conv2d1x1_B2_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,34)
    out_stall_out_1 <= conv2d1x1_B2_merge_out_stall_out_1;

    -- out_unnamed_conv2d1x12(GPOUT,35)
    out_unnamed_conv2d1x12 <= conv2d1x1_B2_branch_aunroll_x_out_unnamed_conv2d1x12;

    -- out_unnamed_conv2d1x13_avm_address(GPOUT,36)
    out_unnamed_conv2d1x13_avm_address <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x13_avm_address;

    -- out_unnamed_conv2d1x13_avm_burstcount(GPOUT,37)
    out_unnamed_conv2d1x13_avm_burstcount <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x13_avm_burstcount;

    -- out_unnamed_conv2d1x13_avm_byteenable(GPOUT,38)
    out_unnamed_conv2d1x13_avm_byteenable <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x13_avm_byteenable;

    -- out_unnamed_conv2d1x13_avm_enable(GPOUT,39)
    out_unnamed_conv2d1x13_avm_enable <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x13_avm_enable;

    -- out_unnamed_conv2d1x13_avm_read(GPOUT,40)
    out_unnamed_conv2d1x13_avm_read <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x13_avm_read;

    -- out_unnamed_conv2d1x13_avm_write(GPOUT,41)
    out_unnamed_conv2d1x13_avm_write <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x13_avm_write;

    -- out_unnamed_conv2d1x13_avm_writedata(GPOUT,42)
    out_unnamed_conv2d1x13_avm_writedata <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x13_avm_writedata;

    -- out_unnamed_conv2d1x14_avm_address(GPOUT,43)
    out_unnamed_conv2d1x14_avm_address <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_address;

    -- out_unnamed_conv2d1x14_avm_burstcount(GPOUT,44)
    out_unnamed_conv2d1x14_avm_burstcount <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_burstcount;

    -- out_unnamed_conv2d1x14_avm_byteenable(GPOUT,45)
    out_unnamed_conv2d1x14_avm_byteenable <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_byteenable;

    -- out_unnamed_conv2d1x14_avm_enable(GPOUT,46)
    out_unnamed_conv2d1x14_avm_enable <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_enable;

    -- out_unnamed_conv2d1x14_avm_read(GPOUT,47)
    out_unnamed_conv2d1x14_avm_read <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_read;

    -- out_unnamed_conv2d1x14_avm_write(GPOUT,48)
    out_unnamed_conv2d1x14_avm_write <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_write;

    -- out_unnamed_conv2d1x14_avm_writedata(GPOUT,49)
    out_unnamed_conv2d1x14_avm_writedata <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x14_avm_writedata;

    -- out_unnamed_conv2d1x15_avm_address(GPOUT,50)
    out_unnamed_conv2d1x15_avm_address <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_address;

    -- out_unnamed_conv2d1x15_avm_burstcount(GPOUT,51)
    out_unnamed_conv2d1x15_avm_burstcount <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_burstcount;

    -- out_unnamed_conv2d1x15_avm_byteenable(GPOUT,52)
    out_unnamed_conv2d1x15_avm_byteenable <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_byteenable;

    -- out_unnamed_conv2d1x15_avm_enable(GPOUT,53)
    out_unnamed_conv2d1x15_avm_enable <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_enable;

    -- out_unnamed_conv2d1x15_avm_read(GPOUT,54)
    out_unnamed_conv2d1x15_avm_read <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_read;

    -- out_unnamed_conv2d1x15_avm_write(GPOUT,55)
    out_unnamed_conv2d1x15_avm_write <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_write;

    -- out_unnamed_conv2d1x15_avm_writedata(GPOUT,56)
    out_unnamed_conv2d1x15_avm_writedata <= bb_conv2d1x1_B2_stall_region_out_unnamed_conv2d1x15_avm_writedata;

    -- out_valid_out_0(GPOUT,57)
    out_valid_out_0 <= conv2d1x1_B2_branch_aunroll_x_out_valid_out_0;

    -- out_valid_out_1(GPOUT,58)
    out_valid_out_1 <= conv2d1x1_B2_branch_aunroll_x_out_valid_out_1;

END normal;
