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

-- VHDL created from fc_function
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

entity fc_function is
    port (
        in_arg_filter_bias : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_sizex : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_sizey : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_start : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_fc0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc2_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_fc2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc2_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc3_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_fc3_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc3_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc3_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc5_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_fc5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc5_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_active_unnamed_fc5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc0_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_fc0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_fc0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_fc0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_fc2_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_fc2_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_fc2_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_fc2_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc2_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc2_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc2_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_fc3_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_fc3_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_fc3_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_fc3_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc3_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc3_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc3_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_fc5_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_fc5_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_fc5_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_fc5_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc5_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc5_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc5_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end fc_function;

architecture normal of fc_function is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_fc_B1_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_fc_B1_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_fc_B2_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_fc_B0 is
        port (
            in_filter_bias : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_global_id_0_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_lsu_unnamed_fc0_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_sizex : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_sizey : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_fc0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_idxprom : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc0 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_unnamed_fc0_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_fc0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_fc0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_fc0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_fc_B1 is
        port (
            in_c0_exe11_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe11_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_06_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_06_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_idxprom3_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_idxprom3_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_j_13_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_13_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_sizex : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_sizey : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_tmp_05_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_tmp_05_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_tmp_12_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_tmp_12_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_fc1_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_fc1_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_fc2_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_fc2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc2_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc3_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_fc3_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc3_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc3_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c1_exe2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_i_06_LC_OuterPHI : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_idxprom3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_j_13_LC_InnerPHI : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc1 : out std_logic_vector(31 downto 0);  -- Floating Point
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
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_fc_B2 is
        port (
            in_c1_exe14_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_idxprom2_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_lsu_unnamed_fc5_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_sizex : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc4_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_fc5_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_fc5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc5_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_fc5_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component loop_limiter_fc0 is
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


    signal bb_fc_B1_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B1_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B1_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B1_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B1_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_fc_B1_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_fc_B1_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B1_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B1_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B1_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B1_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B1_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B1_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B1_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_fc_B1_sr_1_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_fc_B1_sr_1_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B1_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B1_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B2_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_fc_B2_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B2_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B2_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B2_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_c_i32_0gr_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B0_out_c0_exe1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_fc_B0_out_idxprom : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_fc_B0_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B0_out_unnamed_fc0 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B0_out_unnamed_fc0_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_fc_B0_out_unnamed_fc0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_fc_B0_out_unnamed_fc0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B0_out_unnamed_fc0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B0_out_unnamed_fc0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B0_out_unnamed_fc0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B0_out_unnamed_fc0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_fc_B0_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B1_out_c0_exe11 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_fc_B1_out_c1_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B1_out_c1_exe2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B1_out_i_06_LC_OuterPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B1_out_idxprom3 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_fc_B1_out_j_13_LC_InnerPHI : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B1_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B1_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B1_out_unnamed_fc1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B1_out_unnamed_fc2_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_fc_B1_out_unnamed_fc2_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_fc_B1_out_unnamed_fc2_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B1_out_unnamed_fc2_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B1_out_unnamed_fc2_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B1_out_unnamed_fc2_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B1_out_unnamed_fc2_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_fc_B1_out_unnamed_fc3_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_fc_B1_out_unnamed_fc3_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_fc_B1_out_unnamed_fc3_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B1_out_unnamed_fc3_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B1_out_unnamed_fc3_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B1_out_unnamed_fc3_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B1_out_unnamed_fc3_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_fc_B1_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B1_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B2_out_lsu_unnamed_fc5_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B2_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B2_out_unnamed_fc5_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_fc_B2_out_unnamed_fc5_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_fc_B2_out_unnamed_fc5_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B2_out_unnamed_fc5_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B2_out_unnamed_fc5_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B2_out_unnamed_fc5_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B2_out_unnamed_fc5_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_fc_B2_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_fc0_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_fc0_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- loop_limiter_fc0(BLACKBOX,42)
    theloop_limiter_fc0 : loop_limiter_fc0
    PORT MAP (
        in_i_stall => bb_fc_B1_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_fc_B2_sr_0_aunroll_x_out_o_stall,
        in_i_valid => bb_fc_B0_out_valid_out_0,
        in_i_valid_exit => bb_fc_B1_out_valid_out_0,
        out_o_stall => loop_limiter_fc0_out_o_stall,
        out_o_valid => loop_limiter_fc0_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_fc_B0(BLACKBOX,6)
    thebb_fc_B0 : bb_fc_B0
    PORT MAP (
        in_filter_bias => in_arg_filter_bias,
        in_filter_weight => in_arg_filter_weight,
        in_flush => in_start,
        in_global_id_0_0 => in_arg_global_id_0,
        in_input_im => in_arg_input_im,
        in_lsu_unnamed_fc0_sts_stream_size => in_arg_local_size_0,
        in_output_im => in_arg_output_im,
        in_sizex => in_arg_sizex,
        in_sizey => in_arg_sizey,
        in_stall_in_0 => loop_limiter_fc0_out_o_stall,
        in_stream_reset => in_valid_in,
        in_unnamed_fc0_avm_readdata => in_unnamed_fc0_avm_readdata,
        in_unnamed_fc0_avm_readdatavalid => in_unnamed_fc0_avm_readdatavalid,
        in_unnamed_fc0_avm_waitrequest => in_unnamed_fc0_avm_waitrequest,
        in_unnamed_fc0_avm_writeack => in_unnamed_fc0_avm_writeack,
        in_valid_in_0 => in_valid_in,
        out_c0_exe1 => bb_fc_B0_out_c0_exe1,
        out_idxprom => bb_fc_B0_out_idxprom,
        out_stall_out_0 => bb_fc_B0_out_stall_out_0,
        out_unnamed_fc0 => bb_fc_B0_out_unnamed_fc0,
        out_unnamed_fc0_avm_address => bb_fc_B0_out_unnamed_fc0_avm_address,
        out_unnamed_fc0_avm_burstcount => bb_fc_B0_out_unnamed_fc0_avm_burstcount,
        out_unnamed_fc0_avm_byteenable => bb_fc_B0_out_unnamed_fc0_avm_byteenable,
        out_unnamed_fc0_avm_enable => bb_fc_B0_out_unnamed_fc0_avm_enable,
        out_unnamed_fc0_avm_read => bb_fc_B0_out_unnamed_fc0_avm_read,
        out_unnamed_fc0_avm_write => bb_fc_B0_out_unnamed_fc0_avm_write,
        out_unnamed_fc0_avm_writedata => bb_fc_B0_out_unnamed_fc0_avm_writedata,
        out_valid_out_0 => bb_fc_B0_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_c_i32_0gr_x(CONSTANT,5)
    dupName_0_c_i32_0gr_x_q <= "00000000000000000000000000000000";

    -- bb_fc_B1_sr_1_aunroll_x(BLACKBOX,3)
    thebb_fc_B1_sr_1_aunroll_x : bb_fc_B1_sr_1
    PORT MAP (
        in_i_data_0 => dupName_0_c_i32_0gr_x_q,
        in_i_data_1 => bb_fc_B0_out_unnamed_fc0,
        in_i_data_2 => dupName_0_c_i32_0gr_x_q,
        in_i_data_3 => bb_fc_B0_out_unnamed_fc0,
        in_i_data_4 => bb_fc_B0_out_c0_exe1,
        in_i_data_5 => bb_fc_B0_out_idxprom,
        in_i_data_6 => bb_fc_B0_out_unnamed_fc0,
        in_i_stall => bb_fc_B1_out_stall_out_1,
        in_i_valid => loop_limiter_fc0_out_o_valid,
        out_o_data_0 => bb_fc_B1_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_fc_B1_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_fc_B1_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_fc_B1_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_fc_B1_sr_1_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_fc_B1_sr_1_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_fc_B1_sr_1_aunroll_x_out_o_data_6,
        out_o_stall => bb_fc_B1_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_fc_B1_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_fc_B1_sr_0_aunroll_x(BLACKBOX,2)
    thebb_fc_B1_sr_0_aunroll_x : bb_fc_B1_sr_0
    PORT MAP (
        in_i_data_0 => bb_fc_B1_out_i_06_LC_OuterPHI,
        in_i_data_1 => bb_fc_B1_out_c1_exe2,
        in_i_data_2 => bb_fc_B1_out_j_13_LC_InnerPHI,
        in_i_data_3 => bb_fc_B1_out_c1_exe1,
        in_i_data_4 => bb_fc_B1_out_c0_exe11,
        in_i_data_5 => bb_fc_B1_out_idxprom3,
        in_i_data_6 => bb_fc_B1_out_unnamed_fc1,
        in_i_stall => bb_fc_B1_out_stall_out_0,
        in_i_valid => bb_fc_B1_out_valid_out_1,
        out_o_data_0 => bb_fc_B1_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_fc_B1_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_fc_B1_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_fc_B1_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_fc_B1_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_fc_B1_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_fc_B1_sr_0_aunroll_x_out_o_data_6,
        out_o_stall => bb_fc_B1_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_fc_B1_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_fc_B1(BLACKBOX,7)
    thebb_fc_B1 : bb_fc_B1
    PORT MAP (
        in_c0_exe11_0 => bb_fc_B1_sr_0_aunroll_x_out_o_data_4,
        in_c0_exe11_1 => bb_fc_B1_sr_1_aunroll_x_out_o_data_4,
        in_filter_weight => in_arg_filter_weight,
        in_flush => in_start,
        in_i_06_0 => bb_fc_B1_sr_0_aunroll_x_out_o_data_0,
        in_i_06_1 => bb_fc_B1_sr_1_aunroll_x_out_o_data_0,
        in_idxprom3_0 => bb_fc_B1_sr_0_aunroll_x_out_o_data_5,
        in_idxprom3_1 => bb_fc_B1_sr_1_aunroll_x_out_o_data_5,
        in_input_im => in_arg_input_im,
        in_j_13_0 => bb_fc_B1_sr_0_aunroll_x_out_o_data_2,
        in_j_13_1 => bb_fc_B1_sr_1_aunroll_x_out_o_data_2,
        in_output_im => in_arg_output_im,
        in_sizex => in_arg_sizex,
        in_sizey => in_arg_sizey,
        in_stall_in_0 => bb_fc_B2_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => bb_fc_B1_sr_0_aunroll_x_out_o_stall,
        in_tmp_05_0 => bb_fc_B1_sr_0_aunroll_x_out_o_data_1,
        in_tmp_05_1 => bb_fc_B1_sr_1_aunroll_x_out_o_data_1,
        in_tmp_12_0 => bb_fc_B1_sr_0_aunroll_x_out_o_data_3,
        in_tmp_12_1 => bb_fc_B1_sr_1_aunroll_x_out_o_data_3,
        in_unnamed_fc1_0 => bb_fc_B1_sr_0_aunroll_x_out_o_data_6,
        in_unnamed_fc1_1 => bb_fc_B1_sr_1_aunroll_x_out_o_data_6,
        in_unnamed_fc2_avm_readdata => in_unnamed_fc2_avm_readdata,
        in_unnamed_fc2_avm_readdatavalid => in_unnamed_fc2_avm_readdatavalid,
        in_unnamed_fc2_avm_waitrequest => in_unnamed_fc2_avm_waitrequest,
        in_unnamed_fc2_avm_writeack => in_unnamed_fc2_avm_writeack,
        in_unnamed_fc3_avm_readdata => in_unnamed_fc3_avm_readdata,
        in_unnamed_fc3_avm_readdatavalid => in_unnamed_fc3_avm_readdatavalid,
        in_unnamed_fc3_avm_waitrequest => in_unnamed_fc3_avm_waitrequest,
        in_unnamed_fc3_avm_writeack => in_unnamed_fc3_avm_writeack,
        in_valid_in_0 => bb_fc_B1_sr_0_aunroll_x_out_o_valid,
        in_valid_in_1 => bb_fc_B1_sr_1_aunroll_x_out_o_valid,
        out_c0_exe11 => bb_fc_B1_out_c0_exe11,
        out_c1_exe1 => bb_fc_B1_out_c1_exe1,
        out_c1_exe2 => bb_fc_B1_out_c1_exe2,
        out_i_06_LC_OuterPHI => bb_fc_B1_out_i_06_LC_OuterPHI,
        out_idxprom3 => bb_fc_B1_out_idxprom3,
        out_j_13_LC_InnerPHI => bb_fc_B1_out_j_13_LC_InnerPHI,
        out_stall_out_0 => bb_fc_B1_out_stall_out_0,
        out_stall_out_1 => bb_fc_B1_out_stall_out_1,
        out_unnamed_fc1 => bb_fc_B1_out_unnamed_fc1,
        out_unnamed_fc2_avm_address => bb_fc_B1_out_unnamed_fc2_avm_address,
        out_unnamed_fc2_avm_burstcount => bb_fc_B1_out_unnamed_fc2_avm_burstcount,
        out_unnamed_fc2_avm_byteenable => bb_fc_B1_out_unnamed_fc2_avm_byteenable,
        out_unnamed_fc2_avm_enable => bb_fc_B1_out_unnamed_fc2_avm_enable,
        out_unnamed_fc2_avm_read => bb_fc_B1_out_unnamed_fc2_avm_read,
        out_unnamed_fc2_avm_write => bb_fc_B1_out_unnamed_fc2_avm_write,
        out_unnamed_fc2_avm_writedata => bb_fc_B1_out_unnamed_fc2_avm_writedata,
        out_unnamed_fc3_avm_address => bb_fc_B1_out_unnamed_fc3_avm_address,
        out_unnamed_fc3_avm_burstcount => bb_fc_B1_out_unnamed_fc3_avm_burstcount,
        out_unnamed_fc3_avm_byteenable => bb_fc_B1_out_unnamed_fc3_avm_byteenable,
        out_unnamed_fc3_avm_enable => bb_fc_B1_out_unnamed_fc3_avm_enable,
        out_unnamed_fc3_avm_read => bb_fc_B1_out_unnamed_fc3_avm_read,
        out_unnamed_fc3_avm_write => bb_fc_B1_out_unnamed_fc3_avm_write,
        out_unnamed_fc3_avm_writedata => bb_fc_B1_out_unnamed_fc3_avm_writedata,
        out_valid_out_0 => bb_fc_B1_out_valid_out_0,
        out_valid_out_1 => bb_fc_B1_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- bb_fc_B2_sr_0_aunroll_x(BLACKBOX,4)
    thebb_fc_B2_sr_0_aunroll_x : bb_fc_B2_sr_0
    PORT MAP (
        in_i_data_0 => bb_fc_B1_out_idxprom3,
        in_i_data_1 => bb_fc_B1_out_unnamed_fc1,
        in_i_data_2 => bb_fc_B1_out_c1_exe1,
        in_i_stall => bb_fc_B2_out_stall_out_0,
        in_i_valid => bb_fc_B1_out_valid_out_0,
        out_o_data_0 => bb_fc_B2_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_fc_B2_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_fc_B2_sr_0_aunroll_x_out_o_data_2,
        out_o_stall => bb_fc_B2_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_fc_B2_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_fc_B2(BLACKBOX,8)
    thebb_fc_B2 : bb_fc_B2
    PORT MAP (
        in_c1_exe14_0 => bb_fc_B2_sr_0_aunroll_x_out_o_data_2,
        in_flush => in_start,
        in_idxprom2_0 => bb_fc_B2_sr_0_aunroll_x_out_o_data_0,
        in_lsu_unnamed_fc5_sts_stream_size => in_arg_local_size_0,
        in_output_im => in_arg_output_im,
        in_sizex => in_arg_sizex,
        in_stall_in_0 => in_stall_in,
        in_stream_reset => bb_fc_B1_out_valid_out_0,
        in_unnamed_fc4_0 => bb_fc_B2_sr_0_aunroll_x_out_o_data_1,
        in_unnamed_fc5_avm_readdata => in_unnamed_fc5_avm_readdata,
        in_unnamed_fc5_avm_readdatavalid => in_unnamed_fc5_avm_readdatavalid,
        in_unnamed_fc5_avm_waitrequest => in_unnamed_fc5_avm_waitrequest,
        in_unnamed_fc5_avm_writeack => in_unnamed_fc5_avm_writeack,
        in_valid_in_0 => bb_fc_B2_sr_0_aunroll_x_out_o_valid,
        out_lsu_unnamed_fc5_o_active => bb_fc_B2_out_lsu_unnamed_fc5_o_active,
        out_stall_out_0 => bb_fc_B2_out_stall_out_0,
        out_unnamed_fc5_avm_address => bb_fc_B2_out_unnamed_fc5_avm_address,
        out_unnamed_fc5_avm_burstcount => bb_fc_B2_out_unnamed_fc5_avm_burstcount,
        out_unnamed_fc5_avm_byteenable => bb_fc_B2_out_unnamed_fc5_avm_byteenable,
        out_unnamed_fc5_avm_enable => bb_fc_B2_out_unnamed_fc5_avm_enable,
        out_unnamed_fc5_avm_read => bb_fc_B2_out_unnamed_fc5_avm_read,
        out_unnamed_fc5_avm_write => bb_fc_B2_out_unnamed_fc5_avm_write,
        out_unnamed_fc5_avm_writedata => bb_fc_B2_out_unnamed_fc5_avm_writedata,
        out_valid_out_0 => bb_fc_B2_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_o_active_unnamed_fc5(GPOUT,43)
    out_o_active_unnamed_fc5 <= bb_fc_B2_out_lsu_unnamed_fc5_o_active;

    -- out_stall_out(GPOUT,44)
    out_stall_out <= bb_fc_B0_out_stall_out_0;

    -- out_unnamed_fc0_avm_address(GPOUT,45)
    out_unnamed_fc0_avm_address <= bb_fc_B0_out_unnamed_fc0_avm_address;

    -- out_unnamed_fc0_avm_burstcount(GPOUT,46)
    out_unnamed_fc0_avm_burstcount <= bb_fc_B0_out_unnamed_fc0_avm_burstcount;

    -- out_unnamed_fc0_avm_byteenable(GPOUT,47)
    out_unnamed_fc0_avm_byteenable <= bb_fc_B0_out_unnamed_fc0_avm_byteenable;

    -- out_unnamed_fc0_avm_enable(GPOUT,48)
    out_unnamed_fc0_avm_enable <= bb_fc_B0_out_unnamed_fc0_avm_enable;

    -- out_unnamed_fc0_avm_read(GPOUT,49)
    out_unnamed_fc0_avm_read <= bb_fc_B0_out_unnamed_fc0_avm_read;

    -- out_unnamed_fc0_avm_write(GPOUT,50)
    out_unnamed_fc0_avm_write <= bb_fc_B0_out_unnamed_fc0_avm_write;

    -- out_unnamed_fc0_avm_writedata(GPOUT,51)
    out_unnamed_fc0_avm_writedata <= bb_fc_B0_out_unnamed_fc0_avm_writedata;

    -- out_unnamed_fc2_avm_address(GPOUT,52)
    out_unnamed_fc2_avm_address <= bb_fc_B1_out_unnamed_fc2_avm_address;

    -- out_unnamed_fc2_avm_burstcount(GPOUT,53)
    out_unnamed_fc2_avm_burstcount <= bb_fc_B1_out_unnamed_fc2_avm_burstcount;

    -- out_unnamed_fc2_avm_byteenable(GPOUT,54)
    out_unnamed_fc2_avm_byteenable <= bb_fc_B1_out_unnamed_fc2_avm_byteenable;

    -- out_unnamed_fc2_avm_enable(GPOUT,55)
    out_unnamed_fc2_avm_enable <= bb_fc_B1_out_unnamed_fc2_avm_enable;

    -- out_unnamed_fc2_avm_read(GPOUT,56)
    out_unnamed_fc2_avm_read <= bb_fc_B1_out_unnamed_fc2_avm_read;

    -- out_unnamed_fc2_avm_write(GPOUT,57)
    out_unnamed_fc2_avm_write <= bb_fc_B1_out_unnamed_fc2_avm_write;

    -- out_unnamed_fc2_avm_writedata(GPOUT,58)
    out_unnamed_fc2_avm_writedata <= bb_fc_B1_out_unnamed_fc2_avm_writedata;

    -- out_unnamed_fc3_avm_address(GPOUT,59)
    out_unnamed_fc3_avm_address <= bb_fc_B1_out_unnamed_fc3_avm_address;

    -- out_unnamed_fc3_avm_burstcount(GPOUT,60)
    out_unnamed_fc3_avm_burstcount <= bb_fc_B1_out_unnamed_fc3_avm_burstcount;

    -- out_unnamed_fc3_avm_byteenable(GPOUT,61)
    out_unnamed_fc3_avm_byteenable <= bb_fc_B1_out_unnamed_fc3_avm_byteenable;

    -- out_unnamed_fc3_avm_enable(GPOUT,62)
    out_unnamed_fc3_avm_enable <= bb_fc_B1_out_unnamed_fc3_avm_enable;

    -- out_unnamed_fc3_avm_read(GPOUT,63)
    out_unnamed_fc3_avm_read <= bb_fc_B1_out_unnamed_fc3_avm_read;

    -- out_unnamed_fc3_avm_write(GPOUT,64)
    out_unnamed_fc3_avm_write <= bb_fc_B1_out_unnamed_fc3_avm_write;

    -- out_unnamed_fc3_avm_writedata(GPOUT,65)
    out_unnamed_fc3_avm_writedata <= bb_fc_B1_out_unnamed_fc3_avm_writedata;

    -- out_unnamed_fc5_avm_address(GPOUT,66)
    out_unnamed_fc5_avm_address <= bb_fc_B2_out_unnamed_fc5_avm_address;

    -- out_unnamed_fc5_avm_burstcount(GPOUT,67)
    out_unnamed_fc5_avm_burstcount <= bb_fc_B2_out_unnamed_fc5_avm_burstcount;

    -- out_unnamed_fc5_avm_byteenable(GPOUT,68)
    out_unnamed_fc5_avm_byteenable <= bb_fc_B2_out_unnamed_fc5_avm_byteenable;

    -- out_unnamed_fc5_avm_enable(GPOUT,69)
    out_unnamed_fc5_avm_enable <= bb_fc_B2_out_unnamed_fc5_avm_enable;

    -- out_unnamed_fc5_avm_read(GPOUT,70)
    out_unnamed_fc5_avm_read <= bb_fc_B2_out_unnamed_fc5_avm_read;

    -- out_unnamed_fc5_avm_write(GPOUT,71)
    out_unnamed_fc5_avm_write <= bb_fc_B2_out_unnamed_fc5_avm_write;

    -- out_unnamed_fc5_avm_writedata(GPOUT,72)
    out_unnamed_fc5_avm_writedata <= bb_fc_B2_out_unnamed_fc5_avm_writedata;

    -- out_valid_out(GPOUT,73)
    out_valid_out <= bb_fc_B2_out_valid_out_0;

END normal;
