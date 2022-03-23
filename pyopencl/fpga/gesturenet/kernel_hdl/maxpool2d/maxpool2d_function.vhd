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

-- VHDL created from maxpool2d_function
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

entity maxpool2d_function is
    port (
        in_arg_global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_output_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_memcoalesce_input_im_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_input_im_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_start : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_maxpool2d1_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_maxpool2d1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_maxpool2d1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_maxpool2d1_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_memcoalesce_input_im_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_memcoalesce_input_im_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_input_im_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_o_active_unnamed_maxpool2d1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_maxpool2d1_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_maxpool2d1_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_maxpool2d1_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_maxpool2d1_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_maxpool2d1_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_maxpool2d1_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_maxpool2d1_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end maxpool2d_function;

architecture normal of maxpool2d_function is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_maxpool2d_B1_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_maxpool2d_B1_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_maxpool2d_B2_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_maxpool2d_B2_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_maxpool2d_B3_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_maxpool2d_B4_sr_0 is
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


    component bb_maxpool2d_B0 is
        port (
            in_global_id_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_maxpool2d_B1 is
        port (
            in_c0_exe12_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe12_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_010_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_010_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_16_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_16_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im_addr_011_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_011_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_17_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_17_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_i_010 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_mul22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_mul24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_output_im_addr_011 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_output_im_addr_17 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_maxpool2d_B2 is
        port (
            in_c0_exe11_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe11_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_0 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_1 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_i_0107_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_0107_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_1611_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_1611_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_24_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_24_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_mul2212_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul2212_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul2413_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul2413_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im_addr_0115_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_0115_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_179_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_179_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_tmp_23_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_tmp_23_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe117 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_cmp9_phi_decision18_xor_RM : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_fpgaindvars_iv_next : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_i_0107 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_inc30 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_1611 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_mul2212 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_mul2413 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_output_im_addr_0115 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_output_im_addr_179 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_maxpool2d_B3 is
        port (
            in_c0_exe13_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe11715_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_cmp9_phi_decision18_xor_RM14_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_0106_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_1610_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im_addr_0114_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_178_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_maxpool2d1_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_maxpool2d1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_maxpool2d1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_maxpool2d1_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe13 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_i_010_LC_OuterPHI : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_16_LC_InnerPHI : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_lsu_unnamed_maxpool2d1_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_output_im_addr_011_LC_OuterPHI : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_output_im_addr_17_LC_InnerPHI : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_maxpool2d_B4 is
        port (
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component loop_limiter_maxpool2d0 is
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


    component loop_limiter_maxpool2d1 is
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
    signal bb_maxpool2d_B1_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B1_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B1_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B1_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B1_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B1_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B1_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B1_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B1_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B1_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B1_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B1_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B1_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B1_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (2 downto 0);
    signal bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B2_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (2 downto 0);
    signal bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B2_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B3_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B3_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B3_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B3_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B3_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B3_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B3_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B3_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B3_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B4_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B4_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_c_i32_0gr_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B0_out_c0_exe1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B0_out_c1_exe1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B0_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B0_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B1_out_c0_exe12 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B1_out_i_010 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B1_out_j_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B1_out_mul22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B1_out_mul24 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B1_out_output_im_addr_011 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B1_out_output_im_addr_17 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B1_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B1_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B1_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B2_out_c0_exe11 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B2_out_c1_exe117 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_out_cmp9_phi_decision18_xor_RM : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B2_out_fpgaindvars_iv_next : STD_LOGIC_VECTOR (2 downto 0);
    signal bb_maxpool2d_B2_out_i_0107 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_out_inc30 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_out_j_1611 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_out_memcoalesce_input_im_load_0_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_maxpool2d_B2_out_memcoalesce_input_im_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_maxpool2d_B2_out_memcoalesce_input_im_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_out_memcoalesce_input_im_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B2_out_memcoalesce_input_im_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B2_out_memcoalesce_input_im_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B2_out_memcoalesce_input_im_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_maxpool2d_B2_out_mul2212 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_out_mul2413 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_out_output_im_addr_0115 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B2_out_output_im_addr_179 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B2_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B2_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B2_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B2_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B3_out_c0_exe13 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B3_out_i_010_LC_OuterPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B3_out_j_16_LC_InnerPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B3_out_lsu_unnamed_maxpool2d1_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B3_out_output_im_addr_011_LC_OuterPHI : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B3_out_output_im_addr_17_LC_InnerPHI : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B3_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B3_out_unnamed_maxpool2d1_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_maxpool2d_B3_out_unnamed_maxpool2d1_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_maxpool2d_B3_out_unnamed_maxpool2d1_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B3_out_unnamed_maxpool2d1_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B3_out_unnamed_maxpool2d1_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B3_out_unnamed_maxpool2d1_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B3_out_unnamed_maxpool2d1_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_maxpool2d_B3_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B3_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B4_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B4_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal c_float_0_000000e_00_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i3_1gr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal loop_limiter_maxpool2d0_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_maxpool2d0_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_maxpool2d1_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_maxpool2d1_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- loop_limiter_maxpool2d1(BLACKBOX,42)
    theloop_limiter_maxpool2d1 : loop_limiter_maxpool2d1
    PORT MAP (
        in_i_stall => bb_maxpool2d_B2_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_maxpool2d_B3_sr_0_aunroll_x_out_o_stall,
        in_i_valid => bb_maxpool2d_B1_out_valid_out_0,
        in_i_valid_exit => bb_maxpool2d_B2_out_valid_out_0,
        out_o_stall => loop_limiter_maxpool2d1_out_o_stall,
        out_o_valid => loop_limiter_maxpool2d1_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- loop_limiter_maxpool2d0(BLACKBOX,41)
    theloop_limiter_maxpool2d0 : loop_limiter_maxpool2d0
    PORT MAP (
        in_i_stall => bb_maxpool2d_B1_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_maxpool2d_B4_sr_0_aunroll_x_out_o_stall,
        in_i_valid => bb_maxpool2d_B0_out_valid_out_0,
        in_i_valid_exit => bb_maxpool2d_B3_out_valid_out_0,
        out_o_stall => loop_limiter_maxpool2d0_out_o_stall,
        out_o_valid => loop_limiter_maxpool2d0_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_c_i32_0gr_x(CONSTANT,8)
    dupName_0_c_i32_0gr_x_q <= "00000000000000000000000000000000";

    -- bb_maxpool2d_B0(BLACKBOX,10)
    thebb_maxpool2d_B0 : bb_maxpool2d_B0
    PORT MAP (
        in_global_id_0_0 => in_arg_global_id_0,
        in_input_im => in_arg_input_im,
        in_input_size => in_arg_input_size,
        in_output_im => in_arg_output_im,
        in_output_size => in_arg_output_size,
        in_stall_in_0 => loop_limiter_maxpool2d0_out_o_stall,
        in_valid_in_0 => in_valid_in,
        out_c0_exe1 => bb_maxpool2d_B0_out_c0_exe1,
        out_c1_exe1 => bb_maxpool2d_B0_out_c1_exe1,
        out_stall_out_0 => bb_maxpool2d_B0_out_stall_out_0,
        out_valid_out_0 => bb_maxpool2d_B0_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_maxpool2d_B1_sr_1_aunroll_x(BLACKBOX,3)
    thebb_maxpool2d_B1_sr_1_aunroll_x : bb_maxpool2d_B1_sr_1
    PORT MAP (
        in_i_data_0 => bb_maxpool2d_B0_out_c1_exe1,
        in_i_data_1 => dupName_0_c_i32_0gr_x_q,
        in_i_data_2 => bb_maxpool2d_B0_out_c1_exe1,
        in_i_data_3 => dupName_0_c_i32_0gr_x_q,
        in_i_data_4 => bb_maxpool2d_B0_out_c0_exe1,
        in_i_stall => bb_maxpool2d_B1_out_stall_out_1,
        in_i_valid => loop_limiter_maxpool2d0_out_o_valid,
        out_o_data_0 => bb_maxpool2d_B1_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_maxpool2d_B1_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_maxpool2d_B1_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_maxpool2d_B1_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_maxpool2d_B1_sr_1_aunroll_x_out_o_data_4,
        out_o_stall => bb_maxpool2d_B1_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_maxpool2d_B1_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_maxpool2d_B1(BLACKBOX,11)
    thebb_maxpool2d_B1 : bb_maxpool2d_B1
    PORT MAP (
        in_c0_exe12_0 => bb_maxpool2d_B1_sr_0_aunroll_x_out_o_data_4,
        in_c0_exe12_1 => bb_maxpool2d_B1_sr_1_aunroll_x_out_o_data_4,
        in_i_010_0 => bb_maxpool2d_B1_sr_0_aunroll_x_out_o_data_1,
        in_i_010_1 => bb_maxpool2d_B1_sr_1_aunroll_x_out_o_data_1,
        in_input_im => in_arg_input_im,
        in_input_size => in_arg_input_size,
        in_j_16_0 => bb_maxpool2d_B1_sr_0_aunroll_x_out_o_data_3,
        in_j_16_1 => bb_maxpool2d_B1_sr_1_aunroll_x_out_o_data_3,
        in_output_im_addr_011_0 => bb_maxpool2d_B1_sr_0_aunroll_x_out_o_data_0,
        in_output_im_addr_011_1 => bb_maxpool2d_B1_sr_1_aunroll_x_out_o_data_0,
        in_output_im_addr_17_0 => bb_maxpool2d_B1_sr_0_aunroll_x_out_o_data_2,
        in_output_im_addr_17_1 => bb_maxpool2d_B1_sr_1_aunroll_x_out_o_data_2,
        in_output_size => in_arg_output_size,
        in_stall_in_0 => loop_limiter_maxpool2d1_out_o_stall,
        in_valid_in_0 => bb_maxpool2d_B1_sr_0_aunroll_x_out_o_valid,
        in_valid_in_1 => bb_maxpool2d_B1_sr_1_aunroll_x_out_o_valid,
        out_c0_exe12 => bb_maxpool2d_B1_out_c0_exe12,
        out_i_010 => bb_maxpool2d_B1_out_i_010,
        out_j_16 => bb_maxpool2d_B1_out_j_16,
        out_mul22 => bb_maxpool2d_B1_out_mul22,
        out_mul24 => bb_maxpool2d_B1_out_mul24,
        out_output_im_addr_011 => bb_maxpool2d_B1_out_output_im_addr_011,
        out_output_im_addr_17 => bb_maxpool2d_B1_out_output_im_addr_17,
        out_stall_out_0 => bb_maxpool2d_B1_out_stall_out_0,
        out_stall_out_1 => bb_maxpool2d_B1_out_stall_out_1,
        out_valid_out_0 => bb_maxpool2d_B1_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_maxpool2d_B1_sr_0_aunroll_x(BLACKBOX,2)
    thebb_maxpool2d_B1_sr_0_aunroll_x : bb_maxpool2d_B1_sr_0
    PORT MAP (
        in_i_data_0 => bb_maxpool2d_B3_out_output_im_addr_011_LC_OuterPHI,
        in_i_data_1 => bb_maxpool2d_B3_out_i_010_LC_OuterPHI,
        in_i_data_2 => bb_maxpool2d_B3_out_output_im_addr_17_LC_InnerPHI,
        in_i_data_3 => bb_maxpool2d_B3_out_j_16_LC_InnerPHI,
        in_i_data_4 => bb_maxpool2d_B3_out_c0_exe13,
        in_i_stall => bb_maxpool2d_B1_out_stall_out_0,
        in_i_valid => bb_maxpool2d_B3_out_valid_out_1,
        out_o_data_0 => bb_maxpool2d_B1_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_maxpool2d_B1_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_maxpool2d_B1_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_maxpool2d_B1_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_maxpool2d_B1_sr_0_aunroll_x_out_o_data_4,
        out_o_stall => bb_maxpool2d_B1_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_maxpool2d_B1_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_maxpool2d_B4(BLACKBOX,14)
    thebb_maxpool2d_B4 : bb_maxpool2d_B4
    PORT MAP (
        in_stall_in_0 => in_stall_in,
        in_valid_in_0 => bb_maxpool2d_B4_sr_0_aunroll_x_out_o_valid,
        out_stall_out_0 => bb_maxpool2d_B4_out_stall_out_0,
        out_valid_out_0 => bb_maxpool2d_B4_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- bb_maxpool2d_B4_sr_0_aunroll_x(BLACKBOX,7)
    thebb_maxpool2d_B4_sr_0_aunroll_x : bb_maxpool2d_B4_sr_0
    PORT MAP (
        in_i_data_0 => GND_q,
        in_i_stall => bb_maxpool2d_B4_out_stall_out_0,
        in_i_valid => bb_maxpool2d_B3_out_valid_out_0,
        out_o_stall => bb_maxpool2d_B4_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_maxpool2d_B4_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_maxpool2d_B3(BLACKBOX,13)
    thebb_maxpool2d_B3 : bb_maxpool2d_B3
    PORT MAP (
        in_c0_exe13_0 => bb_maxpool2d_B3_sr_0_aunroll_x_out_o_data_0,
        in_c1_exe11715_0 => bb_maxpool2d_B3_sr_0_aunroll_x_out_o_data_6,
        in_cmp9_phi_decision18_xor_RM14_0 => bb_maxpool2d_B3_sr_0_aunroll_x_out_o_data_5,
        in_flush => in_start,
        in_i_0106_0 => bb_maxpool2d_B3_sr_0_aunroll_x_out_o_data_2,
        in_input_im => in_arg_input_im,
        in_input_size => in_arg_input_size,
        in_j_1610_0 => bb_maxpool2d_B3_sr_0_aunroll_x_out_o_data_4,
        in_output_im_addr_0114_0 => bb_maxpool2d_B3_sr_0_aunroll_x_out_o_data_1,
        in_output_im_addr_178_0 => bb_maxpool2d_B3_sr_0_aunroll_x_out_o_data_3,
        in_output_size => in_arg_output_size,
        in_stall_in_0 => bb_maxpool2d_B4_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => bb_maxpool2d_B1_sr_0_aunroll_x_out_o_stall,
        in_unnamed_maxpool2d1_avm_readdata => in_unnamed_maxpool2d1_avm_readdata,
        in_unnamed_maxpool2d1_avm_readdatavalid => in_unnamed_maxpool2d1_avm_readdatavalid,
        in_unnamed_maxpool2d1_avm_waitrequest => in_unnamed_maxpool2d1_avm_waitrequest,
        in_unnamed_maxpool2d1_avm_writeack => in_unnamed_maxpool2d1_avm_writeack,
        in_valid_in_0 => bb_maxpool2d_B3_sr_0_aunroll_x_out_o_valid,
        out_c0_exe13 => bb_maxpool2d_B3_out_c0_exe13,
        out_i_010_LC_OuterPHI => bb_maxpool2d_B3_out_i_010_LC_OuterPHI,
        out_j_16_LC_InnerPHI => bb_maxpool2d_B3_out_j_16_LC_InnerPHI,
        out_lsu_unnamed_maxpool2d1_o_active => bb_maxpool2d_B3_out_lsu_unnamed_maxpool2d1_o_active,
        out_output_im_addr_011_LC_OuterPHI => bb_maxpool2d_B3_out_output_im_addr_011_LC_OuterPHI,
        out_output_im_addr_17_LC_InnerPHI => bb_maxpool2d_B3_out_output_im_addr_17_LC_InnerPHI,
        out_stall_out_0 => bb_maxpool2d_B3_out_stall_out_0,
        out_unnamed_maxpool2d1_avm_address => bb_maxpool2d_B3_out_unnamed_maxpool2d1_avm_address,
        out_unnamed_maxpool2d1_avm_burstcount => bb_maxpool2d_B3_out_unnamed_maxpool2d1_avm_burstcount,
        out_unnamed_maxpool2d1_avm_byteenable => bb_maxpool2d_B3_out_unnamed_maxpool2d1_avm_byteenable,
        out_unnamed_maxpool2d1_avm_enable => bb_maxpool2d_B3_out_unnamed_maxpool2d1_avm_enable,
        out_unnamed_maxpool2d1_avm_read => bb_maxpool2d_B3_out_unnamed_maxpool2d1_avm_read,
        out_unnamed_maxpool2d1_avm_write => bb_maxpool2d_B3_out_unnamed_maxpool2d1_avm_write,
        out_unnamed_maxpool2d1_avm_writedata => bb_maxpool2d_B3_out_unnamed_maxpool2d1_avm_writedata,
        out_valid_out_0 => bb_maxpool2d_B3_out_valid_out_0,
        out_valid_out_1 => bb_maxpool2d_B3_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- bb_maxpool2d_B3_sr_0_aunroll_x(BLACKBOX,6)
    thebb_maxpool2d_B3_sr_0_aunroll_x : bb_maxpool2d_B3_sr_0
    PORT MAP (
        in_i_data_0 => bb_maxpool2d_B2_out_c0_exe11,
        in_i_data_1 => bb_maxpool2d_B2_out_output_im_addr_0115,
        in_i_data_2 => bb_maxpool2d_B2_out_i_0107,
        in_i_data_3 => bb_maxpool2d_B2_out_output_im_addr_179,
        in_i_data_4 => bb_maxpool2d_B2_out_j_1611,
        in_i_data_5 => bb_maxpool2d_B2_out_cmp9_phi_decision18_xor_RM,
        in_i_data_6 => bb_maxpool2d_B2_out_c1_exe117,
        in_i_stall => bb_maxpool2d_B3_out_stall_out_0,
        in_i_valid => bb_maxpool2d_B2_out_valid_out_0,
        out_o_data_0 => bb_maxpool2d_B3_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_maxpool2d_B3_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_maxpool2d_B3_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_maxpool2d_B3_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_maxpool2d_B3_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_maxpool2d_B3_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_maxpool2d_B3_sr_0_aunroll_x_out_o_data_6,
        out_o_stall => bb_maxpool2d_B3_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_maxpool2d_B3_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- c_float_0_000000e_00(FLOATCONSTANT,15)
    c_float_0_000000e_00_q <= "00000000000000000000000000000000";

    -- c_i3_1gr(CONSTANT,18)
    c_i3_1gr_q <= "001";

    -- bb_maxpool2d_B2_sr_1_aunroll_x(BLACKBOX,5)
    thebb_maxpool2d_B2_sr_1_aunroll_x : bb_maxpool2d_B2_sr_1
    PORT MAP (
        in_i_data_0 => c_i3_1gr_q,
        in_i_data_1 => dupName_0_c_i32_0gr_x_q,
        in_i_data_2 => c_float_0_000000e_00_q,
        in_i_data_3 => bb_maxpool2d_B1_out_c0_exe12,
        in_i_data_4 => bb_maxpool2d_B1_out_output_im_addr_011,
        in_i_data_5 => bb_maxpool2d_B1_out_i_010,
        in_i_data_6 => bb_maxpool2d_B1_out_output_im_addr_17,
        in_i_data_7 => bb_maxpool2d_B1_out_j_16,
        in_i_data_8 => bb_maxpool2d_B1_out_mul22,
        in_i_data_9 => bb_maxpool2d_B1_out_mul24,
        in_i_stall => bb_maxpool2d_B2_out_stall_out_1,
        in_i_valid => loop_limiter_maxpool2d1_out_o_valid,
        out_o_data_0 => bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_9,
        out_o_stall => bb_maxpool2d_B2_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_maxpool2d_B2_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_maxpool2d_B2_sr_0_aunroll_x(BLACKBOX,4)
    thebb_maxpool2d_B2_sr_0_aunroll_x : bb_maxpool2d_B2_sr_0
    PORT MAP (
        in_i_data_0 => bb_maxpool2d_B2_out_fpgaindvars_iv_next,
        in_i_data_1 => bb_maxpool2d_B2_out_inc30,
        in_i_data_2 => bb_maxpool2d_B2_out_c1_exe117,
        in_i_data_3 => bb_maxpool2d_B2_out_c0_exe11,
        in_i_data_4 => bb_maxpool2d_B2_out_output_im_addr_0115,
        in_i_data_5 => bb_maxpool2d_B2_out_i_0107,
        in_i_data_6 => bb_maxpool2d_B2_out_output_im_addr_179,
        in_i_data_7 => bb_maxpool2d_B2_out_j_1611,
        in_i_data_8 => bb_maxpool2d_B2_out_mul2212,
        in_i_data_9 => bb_maxpool2d_B2_out_mul2413,
        in_i_stall => bb_maxpool2d_B2_out_stall_out_0,
        in_i_valid => bb_maxpool2d_B2_out_valid_out_1,
        out_o_data_0 => bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_9,
        out_o_stall => bb_maxpool2d_B2_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_maxpool2d_B2_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_maxpool2d_B2(BLACKBOX,12)
    thebb_maxpool2d_B2 : bb_maxpool2d_B2
    PORT MAP (
        in_c0_exe11_0 => bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_3,
        in_c0_exe11_1 => bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_3,
        in_flush => in_start,
        in_fpgaindvars_iv_0 => bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_0,
        in_fpgaindvars_iv_1 => bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_0,
        in_i_0107_0 => bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_5,
        in_i_0107_1 => bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_5,
        in_input_im => in_arg_input_im,
        in_input_size => in_arg_input_size,
        in_j_1611_0 => bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_7,
        in_j_1611_1 => bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_7,
        in_k_24_0 => bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_1,
        in_k_24_1 => bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_1,
        in_memcoalesce_input_im_load_0_avm_readdata => in_memcoalesce_input_im_load_0_avm_readdata,
        in_memcoalesce_input_im_load_0_avm_readdatavalid => in_memcoalesce_input_im_load_0_avm_readdatavalid,
        in_memcoalesce_input_im_load_0_avm_waitrequest => in_memcoalesce_input_im_load_0_avm_waitrequest,
        in_memcoalesce_input_im_load_0_avm_writeack => in_memcoalesce_input_im_load_0_avm_writeack,
        in_mul2212_0 => bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_8,
        in_mul2212_1 => bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_8,
        in_mul2413_0 => bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_9,
        in_mul2413_1 => bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_9,
        in_output_im_addr_0115_0 => bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_4,
        in_output_im_addr_0115_1 => bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_4,
        in_output_im_addr_179_0 => bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_6,
        in_output_im_addr_179_1 => bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_6,
        in_output_size => in_arg_output_size,
        in_stall_in_0 => bb_maxpool2d_B3_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => bb_maxpool2d_B2_sr_0_aunroll_x_out_o_stall,
        in_tmp_23_0 => bb_maxpool2d_B2_sr_0_aunroll_x_out_o_data_2,
        in_tmp_23_1 => bb_maxpool2d_B2_sr_1_aunroll_x_out_o_data_2,
        in_valid_in_0 => bb_maxpool2d_B2_sr_0_aunroll_x_out_o_valid,
        in_valid_in_1 => bb_maxpool2d_B2_sr_1_aunroll_x_out_o_valid,
        out_c0_exe11 => bb_maxpool2d_B2_out_c0_exe11,
        out_c1_exe117 => bb_maxpool2d_B2_out_c1_exe117,
        out_cmp9_phi_decision18_xor_RM => bb_maxpool2d_B2_out_cmp9_phi_decision18_xor_RM,
        out_fpgaindvars_iv_next => bb_maxpool2d_B2_out_fpgaindvars_iv_next,
        out_i_0107 => bb_maxpool2d_B2_out_i_0107,
        out_inc30 => bb_maxpool2d_B2_out_inc30,
        out_j_1611 => bb_maxpool2d_B2_out_j_1611,
        out_memcoalesce_input_im_load_0_avm_address => bb_maxpool2d_B2_out_memcoalesce_input_im_load_0_avm_address,
        out_memcoalesce_input_im_load_0_avm_burstcount => bb_maxpool2d_B2_out_memcoalesce_input_im_load_0_avm_burstcount,
        out_memcoalesce_input_im_load_0_avm_byteenable => bb_maxpool2d_B2_out_memcoalesce_input_im_load_0_avm_byteenable,
        out_memcoalesce_input_im_load_0_avm_enable => bb_maxpool2d_B2_out_memcoalesce_input_im_load_0_avm_enable,
        out_memcoalesce_input_im_load_0_avm_read => bb_maxpool2d_B2_out_memcoalesce_input_im_load_0_avm_read,
        out_memcoalesce_input_im_load_0_avm_write => bb_maxpool2d_B2_out_memcoalesce_input_im_load_0_avm_write,
        out_memcoalesce_input_im_load_0_avm_writedata => bb_maxpool2d_B2_out_memcoalesce_input_im_load_0_avm_writedata,
        out_mul2212 => bb_maxpool2d_B2_out_mul2212,
        out_mul2413 => bb_maxpool2d_B2_out_mul2413,
        out_output_im_addr_0115 => bb_maxpool2d_B2_out_output_im_addr_0115,
        out_output_im_addr_179 => bb_maxpool2d_B2_out_output_im_addr_179,
        out_stall_out_0 => bb_maxpool2d_B2_out_stall_out_0,
        out_stall_out_1 => bb_maxpool2d_B2_out_stall_out_1,
        out_valid_out_0 => bb_maxpool2d_B2_out_valid_out_0,
        out_valid_out_1 => bb_maxpool2d_B2_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_memcoalesce_input_im_load_0_avm_address(GPOUT,43)
    out_memcoalesce_input_im_load_0_avm_address <= bb_maxpool2d_B2_out_memcoalesce_input_im_load_0_avm_address;

    -- out_memcoalesce_input_im_load_0_avm_burstcount(GPOUT,44)
    out_memcoalesce_input_im_load_0_avm_burstcount <= bb_maxpool2d_B2_out_memcoalesce_input_im_load_0_avm_burstcount;

    -- out_memcoalesce_input_im_load_0_avm_byteenable(GPOUT,45)
    out_memcoalesce_input_im_load_0_avm_byteenable <= bb_maxpool2d_B2_out_memcoalesce_input_im_load_0_avm_byteenable;

    -- out_memcoalesce_input_im_load_0_avm_enable(GPOUT,46)
    out_memcoalesce_input_im_load_0_avm_enable <= bb_maxpool2d_B2_out_memcoalesce_input_im_load_0_avm_enable;

    -- out_memcoalesce_input_im_load_0_avm_read(GPOUT,47)
    out_memcoalesce_input_im_load_0_avm_read <= bb_maxpool2d_B2_out_memcoalesce_input_im_load_0_avm_read;

    -- out_memcoalesce_input_im_load_0_avm_write(GPOUT,48)
    out_memcoalesce_input_im_load_0_avm_write <= bb_maxpool2d_B2_out_memcoalesce_input_im_load_0_avm_write;

    -- out_memcoalesce_input_im_load_0_avm_writedata(GPOUT,49)
    out_memcoalesce_input_im_load_0_avm_writedata <= bb_maxpool2d_B2_out_memcoalesce_input_im_load_0_avm_writedata;

    -- out_o_active_unnamed_maxpool2d1(GPOUT,50)
    out_o_active_unnamed_maxpool2d1 <= bb_maxpool2d_B3_out_lsu_unnamed_maxpool2d1_o_active;

    -- out_stall_out(GPOUT,51)
    out_stall_out <= bb_maxpool2d_B0_out_stall_out_0;

    -- out_unnamed_maxpool2d1_avm_address(GPOUT,52)
    out_unnamed_maxpool2d1_avm_address <= bb_maxpool2d_B3_out_unnamed_maxpool2d1_avm_address;

    -- out_unnamed_maxpool2d1_avm_burstcount(GPOUT,53)
    out_unnamed_maxpool2d1_avm_burstcount <= bb_maxpool2d_B3_out_unnamed_maxpool2d1_avm_burstcount;

    -- out_unnamed_maxpool2d1_avm_byteenable(GPOUT,54)
    out_unnamed_maxpool2d1_avm_byteenable <= bb_maxpool2d_B3_out_unnamed_maxpool2d1_avm_byteenable;

    -- out_unnamed_maxpool2d1_avm_enable(GPOUT,55)
    out_unnamed_maxpool2d1_avm_enable <= bb_maxpool2d_B3_out_unnamed_maxpool2d1_avm_enable;

    -- out_unnamed_maxpool2d1_avm_read(GPOUT,56)
    out_unnamed_maxpool2d1_avm_read <= bb_maxpool2d_B3_out_unnamed_maxpool2d1_avm_read;

    -- out_unnamed_maxpool2d1_avm_write(GPOUT,57)
    out_unnamed_maxpool2d1_avm_write <= bb_maxpool2d_B3_out_unnamed_maxpool2d1_avm_write;

    -- out_unnamed_maxpool2d1_avm_writedata(GPOUT,58)
    out_unnamed_maxpool2d1_avm_writedata <= bb_maxpool2d_B3_out_unnamed_maxpool2d1_avm_writedata;

    -- out_valid_out(GPOUT,59)
    out_valid_out <= bb_maxpool2d_B4_out_valid_out_0;

END normal;
