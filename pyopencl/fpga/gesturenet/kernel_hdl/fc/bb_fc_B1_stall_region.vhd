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

-- VHDL created from bb_fc_B1_stall_region
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

entity bb_fc_B1_stall_region is
    port (
        in_unnamed_fc3_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_fc3_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc3_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc3_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc3_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_fc3_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc3_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc3_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc3_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_fc3_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_fc3_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe11 : in std_logic_vector(63 downto 0);  -- ufix64
        in_i_06 : in std_logic_vector(31 downto 0);  -- ufix32
        in_idxprom3 : in std_logic_vector(63 downto 0);  -- ufix64
        in_j_13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_tmp_05 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_tmp_12 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_fc1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c1_exe2 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_for_end20_loopexit_loopexit_LC_COND : out std_logic_vector(0 downto 0);  -- ufix1
        out_i_06_LC_OuterPHI : out std_logic_vector(31 downto 0);  -- ufix32
        out_idxprom3 : out std_logic_vector(63 downto 0);  -- ufix64
        out_j_13_LC_InnerPHI : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_fc1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_sizex : in std_logic_vector(31 downto 0);  -- ufix32
        in_sizey : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_fc2_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_fc2_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc2_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_fc2_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc2_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc2_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc2_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_fc2_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_fc2_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_filter_weight : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_fc_B1_stall_region;

architecture normal of bb_fc_B1_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component fc_B1_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_data_in_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_data_in_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_6 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_data_out_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_data_out_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_6 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc is
        port (
            in_c0_eni3_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni3_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni3_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_filter_weight : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_sizex : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit11_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit11_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit11_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc is
        port (
            in_c1_eni6_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni6_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni6_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni6_3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni6_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni6_5 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni6_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c1_exit_2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_fc2_fc36 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc2_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_fc2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc2_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc2_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_fc2_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_fc2_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_fc2_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc2_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc2_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc2_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_fc3_fc38 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc3_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_fc3_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc3_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc3_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc3_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_fc3_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_fc3_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_fc3_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc3_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc3_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc3_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_sizex_sync_buffer3_fc18 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_sizex_sync_buffer_fc14 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_sizey_sync_buffer5_fc16 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_sizey_sync_buffer6_fc12 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
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
    signal bgTrunc_i_inc19_fc_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_inc_fc_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_B1_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_B1_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_B1_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_B1_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_B1_merge_reg_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal fc_B1_merge_reg_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (63 downto 0);
    signal fc_B1_merge_reg_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_B1_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_B1_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x_out_c0_exit11_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x_out_c0_exit11_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x_out_c1_exit_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x_out_c1_exit_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_cmp4_phi_decision15_xor_or_rm_fc_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp4_phi_decision15_xor_rm_fc_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp4_phi_decision15_xor_rm_fc_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp4_phi_decision15_xor_rm_fc_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp4_phi_decision15_xor_rm_fc_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp61_neg_rm_fc_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp61_rm_fc_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp61_rm_fc_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp61_rm_fc_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp61_rm_fc_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond8_fc_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond8_fc_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond_fc_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond_fc_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond_guard_fc_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_for_end20_loopexit_loopexit_lc_cond_fc_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_for_end20_loopexit_loopexit_lc_cond_fc_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_i_06_lc_outerphi_fc_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_i_06_lc_outerphi_fc_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_inc19_fc_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc19_fc_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc19_fc_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc19_fc_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_fc_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_fc_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_fc_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_fc_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_j_13_lc_innerphi_fc_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_j_13_lc_innerphi_fc_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_fc2_fc_out_o_readdata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_fc2_fc_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_fc2_fc_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_fc2_fc_out_unnamed_fc2_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal i_load_unnamed_fc2_fc_out_unnamed_fc2_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_unnamed_fc2_fc_out_unnamed_fc2_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_fc2_fc_out_unnamed_fc2_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_fc2_fc_out_unnamed_fc2_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_fc2_fc_out_unnamed_fc2_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_fc2_fc_out_unnamed_fc2_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_load_unnamed_fc3_fc_out_o_readdata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_fc3_fc_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_fc3_fc_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_fc3_fc_out_unnamed_fc3_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal i_load_unnamed_fc3_fc_out_unnamed_fc3_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_unnamed_fc3_fc_out_unnamed_fc3_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_fc3_fc_out_unnamed_fc3_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_fc3_fc_out_unnamed_fc3_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_fc3_fc_out_unnamed_fc3_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_fc3_fc_out_unnamed_fc3_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_muxopt_fc_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_sizex_sync_buffer3_fc_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_sizex_sync_buffer3_fc_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_sizex_sync_buffer3_fc_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_sizex_sync_buffer_fc_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_sizex_sync_buffer_fc_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_sizex_sync_buffer_fc_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_sizey_sync_buffer5_fc_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_sizey_sync_buffer5_fc_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_sizey_sync_buffer5_fc_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_sizey_sync_buffer6_fc_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_sizey_sync_buffer6_fc_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_sizey_sync_buffer6_fc_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_fc35_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_fc35_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_fc40_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_unnamed_fc40_q_168_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_unnamed_fc40_q_168_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist0_i_unnamed_fc40_q_168_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_unnamed_fc40_q_168_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist0_i_unnamed_fc40_q_168_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_unnamed_fc40_q_168_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_unnamed_fc40_q_168_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist0_i_unnamed_fc40_q_168_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_unnamed_fc40_q_168_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist0_i_unnamed_fc40_q_168_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_unnamed_fc35_q_167_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_unnamed_fc35_q_167_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist1_i_unnamed_fc35_q_167_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_unnamed_fc35_q_167_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist1_i_unnamed_fc35_q_167_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_unnamed_fc35_q_167_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_unnamed_fc35_q_167_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist1_i_unnamed_fc35_q_167_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_unnamed_fc35_q_167_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist1_i_unnamed_fc35_q_167_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_j_13_lc_innerphi_fc_q_26_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_j_13_lc_innerphi_fc_q_26_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist2_i_j_13_lc_innerphi_fc_q_26_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_j_13_lc_innerphi_fc_q_26_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist2_i_j_13_lc_innerphi_fc_q_26_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_j_13_lc_innerphi_fc_q_26_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_j_13_lc_innerphi_fc_q_26_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist2_i_j_13_lc_innerphi_fc_q_26_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_j_13_lc_innerphi_fc_q_26_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist2_i_j_13_lc_innerphi_fc_q_26_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_i_i_06_lc_outerphi_fc_q_194_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_i_06_lc_outerphi_fc_q_194_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist3_i_i_06_lc_outerphi_fc_q_194_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_i_06_lc_outerphi_fc_q_194_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist3_i_i_06_lc_outerphi_fc_q_194_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_i_i_06_lc_outerphi_fc_q_194_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_i_06_lc_outerphi_fc_q_194_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist3_i_i_06_lc_outerphi_fc_q_194_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_i_06_lc_outerphi_fc_q_194_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist3_i_i_06_lc_outerphi_fc_q_194_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_cmp61_rm_fc_c_169_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_cmp61_rm_fc_c_169_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist5_i_cmp61_rm_fc_c_169_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_cmp61_rm_fc_c_169_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist5_i_cmp61_rm_fc_c_169_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_cmp61_rm_fc_c_169_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_cmp61_rm_fc_c_169_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist5_i_cmp61_rm_fc_c_169_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_cmp61_rm_fc_c_169_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist5_i_cmp61_rm_fc_c_169_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_bgTrunc_i_inc19_fc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_fc_B1_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (287 downto 0);
    signal bubble_select_fc_B1_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_fc_B1_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_fc_B1_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_fc_B1_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_fc_B1_merge_reg_aunroll_x_f : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_fc_B1_merge_reg_aunroll_x_g : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_fc_B1_merge_reg_aunroll_x_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_select_i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_unnamed_fc2_fc_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_fc2_fc_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_unnamed_fc3_fc_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_fc3_fc_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_sizex_sync_buffer3_fc_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_sizex_sync_buffer3_fc_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_sizex_sync_buffer_fc_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_sizex_sync_buffer_fc_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_sizey_sync_buffer5_fc_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_sizey_sync_buffer5_fc_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_sizey_sync_buffer6_fc_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_sizey_sync_buffer6_fc_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (287 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist0_i_unnamed_fc40_q_168_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist0_i_unnamed_fc40_q_168_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist1_i_unnamed_fc35_q_167_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist1_i_unnamed_fc35_q_167_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist2_i_j_13_lc_innerphi_fc_q_26_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist2_i_j_13_lc_innerphi_fc_q_26_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist3_i_i_06_lc_outerphi_fc_q_194_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist3_i_i_06_lc_outerphi_fc_q_194_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist5_i_cmp61_rm_fc_c_169_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist5_i_cmp61_rm_fc_c_169_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_toReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_fromReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_consumed8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_toReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_fromReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_consumed9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_toReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_fromReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_consumed10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_toReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_fromReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_consumed11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_or7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_or8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_or9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_or10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_V8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_V9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_V10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_fc_B1_merge_reg_aunroll_x_V11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_or_rm_fc_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_or_rm_fc_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_or_rm_fc_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_or_rm_fc_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_or_rm_fc_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_or_rm_fc_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_or_rm_fc_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_or_rm_fc_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_or_rm_fc_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_or_rm_fc_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_or_rm_fc_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_or_rm_fc_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_or_rm_fc_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_rm_fc_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_rm_fc_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_rm_fc_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_rm_fc_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_rm_fc_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_rm_fc_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_rm_fc_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_rm_fc_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_rm_fc_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_rm_fc_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_rm_fc_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_rm_fc_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_rm_fc_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp4_phi_decision15_xor_rm_fc_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp61_rm_fc_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp61_rm_fc_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp61_rm_fc_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp61_rm_fc_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp61_rm_fc_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp61_rm_fc_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp61_rm_fc_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp61_rm_fc_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp61_rm_fc_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp61_rm_fc_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp61_rm_fc_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp61_rm_fc_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp61_rm_fc_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp61_rm_fc_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond8_fc_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond8_fc_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond8_fc_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond8_fc_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond8_fc_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond8_fc_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_fc_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_fc_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_fc_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_fc_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_fc_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_fc_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_guard_fc_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_guard_fc_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_guard_fc_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_guard_fc_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_guard_fc_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_guard_fc_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_guard_fc_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_guard_fc_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_guard_fc_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_guard_fc_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_guard_fc_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_guard_fc_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_guard_fc_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_guard_fc_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond_guard_fc_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_for_end20_loopexit_loopexit_lc_cond_fc_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_for_end20_loopexit_loopexit_lc_cond_fc_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_for_end20_loopexit_loopexit_lc_cond_fc_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_for_end20_loopexit_loopexit_lc_cond_fc_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_for_end20_loopexit_loopexit_lc_cond_fc_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_for_end20_loopexit_loopexit_lc_cond_fc_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_i_06_lc_outerphi_fc_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_i_06_lc_outerphi_fc_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_i_06_lc_outerphi_fc_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_i_06_lc_outerphi_fc_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_i_06_lc_outerphi_fc_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_i_06_lc_outerphi_fc_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_j_13_lc_innerphi_fc_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_j_13_lc_innerphi_fc_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_j_13_lc_innerphi_fc_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_j_13_lc_innerphi_fc_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_j_13_lc_innerphi_fc_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_j_13_lc_innerphi_fc_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_sizex_sync_buffer3_fc_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_sizex_sync_buffer3_fc_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_sizex_sync_buffer3_fc_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_sizex_sync_buffer3_fc_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_sizex_sync_buffer3_fc_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_sizex_sync_buffer3_fc_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_sizex_sync_buffer3_fc_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_sizex_sync_buffer3_fc_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_sizex_sync_buffer3_fc_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_sizex_sync_buffer3_fc_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_sizex_sync_buffer3_fc_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_sizex_sync_buffer3_fc_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_sizex_sync_buffer3_fc_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_sizex_sync_buffer_fc_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_sizex_sync_buffer_fc_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_sizex_sync_buffer_fc_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_sizey_sync_buffer5_fc_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_sizey_sync_buffer5_fc_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_sizey_sync_buffer5_fc_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_sizey_sync_buffer6_fc_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_sizey_sync_buffer6_fc_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_sizey_sync_buffer6_fc_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_fc35_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_fc35_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_fc35_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_fc35_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_fc35_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_fc35_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_fc35_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_unnamed_fc40_q_168_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_unnamed_fc40_q_168_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_unnamed_fc40_q_168_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_unnamed_fc40_q_168_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_unnamed_fc40_q_168_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_unnamed_fc40_q_168_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_unnamed_fc40_q_168_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_unnamed_fc40_q_168_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_unnamed_fc40_q_168_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_unnamed_fc40_q_168_fifo_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_unnamed_fc40_q_168_fifo_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_unnamed_fc40_q_168_fifo_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_unnamed_fc40_q_168_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_unnamed_fc40_q_168_fifo_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_unnamed_fc40_q_168_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_unnamed_fc40_q_168_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_unnamed_fc40_q_168_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_unnamed_fc40_q_168_fifo_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_unnamed_fc35_q_167_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_unnamed_fc35_q_167_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_unnamed_fc35_q_167_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_2_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_3_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_4_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_fc_B1_merge_reg_aunroll_x_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_fc_B1_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_fc_B1_merge_reg_aunroll_x_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_fc_B1_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_fc_B1_merge_reg_aunroll_x_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_fc_B1_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_fc_B1_merge_reg_aunroll_x_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_fc_B1_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_fc_B1_merge_reg_aunroll_x_2_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_fc_B1_merge_reg_aunroll_x_2_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_fc_B1_merge_reg_aunroll_x_2_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_fc_B1_merge_reg_aunroll_x_2_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_fc_B1_merge_reg_aunroll_x_2_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_fc_B1_merge_reg_aunroll_x_2_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_fc_B1_merge_reg_aunroll_x_2_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_fc_B1_merge_reg_aunroll_x_2_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_fc_B1_merge_reg_aunroll_x_3_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_fc_B1_merge_reg_aunroll_x_3_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_fc_B1_merge_reg_aunroll_x_3_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_fc_B1_merge_reg_aunroll_x_3_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_fc_B1_merge_reg_aunroll_x_3_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_fc_B1_merge_reg_aunroll_x_3_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_fc_B1_merge_reg_aunroll_x_3_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_fc_B1_merge_reg_aunroll_x_3_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_fc_B1_merge_reg_aunroll_x_4_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_fc_B1_merge_reg_aunroll_x_4_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_fc_B1_merge_reg_aunroll_x_4_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_fc_B1_merge_reg_aunroll_x_4_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_fc_B1_merge_reg_aunroll_x_4_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_fc_B1_merge_reg_aunroll_x_4_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_fc_B1_merge_reg_aunroll_x_4_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_fc_B1_merge_reg_aunroll_x_4_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg_stall_out_bitsignaltemp : std_logic;
    signal SR_SE_i_cmp61_rm_fc_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp61_rm_fc_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp61_rm_fc_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_cmp61_rm_fc_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp61_rm_fc_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp61_rm_fc_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond_fc_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond_fc_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond_fc_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond_fc_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond_fc_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond_fc_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond_fc_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond_fc_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond_fc_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_cmp4_phi_decision15_xor_rm_fc_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp4_phi_decision15_xor_rm_fc_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp4_phi_decision15_xor_rm_fc_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_cmp4_phi_decision15_xor_rm_fc_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp4_phi_decision15_xor_rm_fc_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp4_phi_decision15_xor_rm_fc_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond8_fc_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond8_fc_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond8_fc_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond8_fc_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond8_fc_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond8_fc_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond8_fc_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond8_fc_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond8_fc_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_06_lc_outerphi_fc_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_06_lc_outerphi_fc_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_06_lc_outerphi_fc_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_06_lc_outerphi_fc_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_06_lc_outerphi_fc_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_i_06_lc_outerphi_fc_r_data2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_i_06_lc_outerphi_fc_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_06_lc_outerphi_fc_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_06_lc_outerphi_fc_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_06_lc_outerphi_fc_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_i_06_lc_outerphi_fc_D2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_j_13_lc_innerphi_fc_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_j_13_lc_innerphi_fc_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_j_13_lc_innerphi_fc_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_j_13_lc_innerphi_fc_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_j_13_lc_innerphi_fc_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_j_13_lc_innerphi_fc_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_j_13_lc_innerphi_fc_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_j_13_lc_innerphi_fc_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_j_13_lc_innerphi_fc_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_data2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_data3 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_D2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_D3 : STD_LOGIC_VECTOR (63 downto 0);

begin


    -- i_load_unnamed_fc2_fc(BLACKBOX,53)@11
    -- in in_i_stall@20000000
    -- out out_o_readdata@179
    -- out out_o_stall@20000000
    -- out out_o_valid@179
    -- out out_unnamed_fc2_avm_address@20000000
    -- out out_unnamed_fc2_avm_burstcount@20000000
    -- out out_unnamed_fc2_avm_byteenable@20000000
    -- out out_unnamed_fc2_avm_enable@20000000
    -- out out_unnamed_fc2_avm_read@20000000
    -- out out_unnamed_fc2_avm_write@20000000
    -- out out_unnamed_fc2_avm_writedata@20000000
    thei_load_unnamed_fc2_fc : i_load_unnamed_fc2_fc36
    PORT MAP (
        in_flush => in_flush,
        in_i_address => SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_D0,
        in_i_predicate => SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_D1,
        in_i_stall => SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_backStall,
        in_i_valid => SE_i_cmp4_phi_decision15_xor_or_rm_fc_V0,
        in_unnamed_fc2_avm_readdata => in_unnamed_fc2_avm_readdata,
        in_unnamed_fc2_avm_readdatavalid => in_unnamed_fc2_avm_readdatavalid,
        in_unnamed_fc2_avm_waitrequest => in_unnamed_fc2_avm_waitrequest,
        in_unnamed_fc2_avm_writeack => in_unnamed_fc2_avm_writeack,
        out_o_readdata => i_load_unnamed_fc2_fc_out_o_readdata,
        out_o_stall => i_load_unnamed_fc2_fc_out_o_stall,
        out_o_valid => i_load_unnamed_fc2_fc_out_o_valid,
        out_unnamed_fc2_avm_address => i_load_unnamed_fc2_fc_out_unnamed_fc2_avm_address,
        out_unnamed_fc2_avm_burstcount => i_load_unnamed_fc2_fc_out_unnamed_fc2_avm_burstcount,
        out_unnamed_fc2_avm_byteenable => i_load_unnamed_fc2_fc_out_unnamed_fc2_avm_byteenable,
        out_unnamed_fc2_avm_enable => i_load_unnamed_fc2_fc_out_unnamed_fc2_avm_enable,
        out_unnamed_fc2_avm_read => i_load_unnamed_fc2_fc_out_unnamed_fc2_avm_read,
        out_unnamed_fc2_avm_write => i_load_unnamed_fc2_fc_out_unnamed_fc2_avm_write,
        out_unnamed_fc2_avm_writedata => i_load_unnamed_fc2_fc_out_unnamed_fc2_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- SE_i_cmp4_phi_decision15_xor_or_rm_fc(STALLENABLE,202)
    SE_i_cmp4_phi_decision15_xor_or_rm_fc_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_cmp4_phi_decision15_xor_or_rm_fc_fromReg0 <= (others => '0');
            SE_i_cmp4_phi_decision15_xor_or_rm_fc_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_i_cmp4_phi_decision15_xor_or_rm_fc_fromReg0 <= SE_i_cmp4_phi_decision15_xor_or_rm_fc_toReg0;
            -- Succesor 1
            SE_i_cmp4_phi_decision15_xor_or_rm_fc_fromReg1 <= SE_i_cmp4_phi_decision15_xor_or_rm_fc_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_i_cmp4_phi_decision15_xor_or_rm_fc_consumed0 <= (not (i_load_unnamed_fc2_fc_out_o_stall) and SE_i_cmp4_phi_decision15_xor_or_rm_fc_wireValid) or SE_i_cmp4_phi_decision15_xor_or_rm_fc_fromReg0;
    SE_i_cmp4_phi_decision15_xor_or_rm_fc_consumed1 <= (not (i_load_unnamed_fc3_fc_out_o_stall) and SE_i_cmp4_phi_decision15_xor_or_rm_fc_wireValid) or SE_i_cmp4_phi_decision15_xor_or_rm_fc_fromReg1;
    -- Consuming
    SE_i_cmp4_phi_decision15_xor_or_rm_fc_StallValid <= SE_i_cmp4_phi_decision15_xor_or_rm_fc_backStall and SE_i_cmp4_phi_decision15_xor_or_rm_fc_wireValid;
    SE_i_cmp4_phi_decision15_xor_or_rm_fc_toReg0 <= SE_i_cmp4_phi_decision15_xor_or_rm_fc_StallValid and SE_i_cmp4_phi_decision15_xor_or_rm_fc_consumed0;
    SE_i_cmp4_phi_decision15_xor_or_rm_fc_toReg1 <= SE_i_cmp4_phi_decision15_xor_or_rm_fc_StallValid and SE_i_cmp4_phi_decision15_xor_or_rm_fc_consumed1;
    -- Backward Stall generation
    SE_i_cmp4_phi_decision15_xor_or_rm_fc_or0 <= SE_i_cmp4_phi_decision15_xor_or_rm_fc_consumed0;
    SE_i_cmp4_phi_decision15_xor_or_rm_fc_wireStall <= not (SE_i_cmp4_phi_decision15_xor_or_rm_fc_consumed1 and SE_i_cmp4_phi_decision15_xor_or_rm_fc_or0);
    SE_i_cmp4_phi_decision15_xor_or_rm_fc_backStall <= SE_i_cmp4_phi_decision15_xor_or_rm_fc_wireStall;
    -- Valid signal propagation
    SE_i_cmp4_phi_decision15_xor_or_rm_fc_V0 <= SE_i_cmp4_phi_decision15_xor_or_rm_fc_wireValid and not (SE_i_cmp4_phi_decision15_xor_or_rm_fc_fromReg0);
    SE_i_cmp4_phi_decision15_xor_or_rm_fc_V1 <= SE_i_cmp4_phi_decision15_xor_or_rm_fc_wireValid and not (SE_i_cmp4_phi_decision15_xor_or_rm_fc_fromReg1);
    -- Computing multiple Valid(s)
    SE_i_cmp4_phi_decision15_xor_or_rm_fc_wireValid <= SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_V;

    -- c_i32_0gr(CONSTANT,35)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- c_i32_1gr(CONSTANT,36)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- SE_stall_entry(STALLENABLE,229)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= fc_B1_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,149)
    bubble_join_stall_entry_q <= in_unnamed_fc1 & in_tmp_12 & in_tmp_05 & in_j_13 & in_idxprom3 & in_i_06 & in_c0_exe11;

    -- bubble_select_stall_entry(BITSELECT,150)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(95 downto 64));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(159 downto 96));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(191 downto 160));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(223 downto 192));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(255 downto 224));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(287 downto 256));

    -- fc_B1_merge_reg_aunroll_x(BLACKBOX,28)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_data_out_2@1
    -- out out_data_out_3@1
    -- out out_data_out_4@1
    -- out out_data_out_5@1
    -- out out_data_out_6@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thefc_B1_merge_reg_aunroll_x : fc_B1_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_c,
        in_data_in_1 => bubble_select_stall_entry_f,
        in_data_in_2 => bubble_select_stall_entry_e,
        in_data_in_3 => bubble_select_stall_entry_g,
        in_data_in_4 => bubble_select_stall_entry_b,
        in_data_in_5 => bubble_select_stall_entry_d,
        in_data_in_6 => bubble_select_stall_entry_h,
        in_stall_in => SE_out_fc_B1_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => fc_B1_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => fc_B1_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => fc_B1_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => fc_B1_merge_reg_aunroll_x_out_data_out_3,
        out_data_out_4 => fc_B1_merge_reg_aunroll_x_out_data_out_4,
        out_data_out_5 => fc_B1_merge_reg_aunroll_x_out_data_out_5,
        out_data_out_6 => fc_B1_merge_reg_aunroll_x_out_data_out_6,
        out_stall_out => fc_B1_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => fc_B1_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_fc_B1_merge_reg_aunroll_x(BITJOIN,116)
    bubble_join_fc_B1_merge_reg_aunroll_x_q <= fc_B1_merge_reg_aunroll_x_out_data_out_6 & fc_B1_merge_reg_aunroll_x_out_data_out_5 & fc_B1_merge_reg_aunroll_x_out_data_out_4 & fc_B1_merge_reg_aunroll_x_out_data_out_3 & fc_B1_merge_reg_aunroll_x_out_data_out_2 & fc_B1_merge_reg_aunroll_x_out_data_out_1 & fc_B1_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_fc_B1_merge_reg_aunroll_x(BITSELECT,117)
    bubble_select_fc_B1_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_fc_B1_merge_reg_aunroll_x_q(31 downto 0));
    bubble_select_fc_B1_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_fc_B1_merge_reg_aunroll_x_q(63 downto 32));
    bubble_select_fc_B1_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_fc_B1_merge_reg_aunroll_x_q(95 downto 64));
    bubble_select_fc_B1_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_fc_B1_merge_reg_aunroll_x_q(127 downto 96));
    bubble_select_fc_B1_merge_reg_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_fc_B1_merge_reg_aunroll_x_q(191 downto 128));
    bubble_select_fc_B1_merge_reg_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_fc_B1_merge_reg_aunroll_x_q(255 downto 192));
    bubble_select_fc_B1_merge_reg_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_fc_B1_merge_reg_aunroll_x_q(287 downto 256));

    -- SE_out_redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo(STALLENABLE,250)
    -- Valid signal propagation
    SE_out_redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_V0 <= SE_out_redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_backStall <= SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_backStall or not (SE_out_redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_wireValid <= redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_valid_out;

    -- SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_4(STALLENABLE,274)
    -- Valid signal propagation
    SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_4_V0 <= SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_4_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_4_backStall <= i_syncbuf_sizex_sync_buffer3_fc_out_stall_out or not (SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_4_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_4_wireValid <= bubble_out_fc_B1_merge_reg_aunroll_x_4_reg_valid_out;

    -- i_syncbuf_sizex_sync_buffer3_fc(BLACKBOX,56)@11
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_sizex_sync_buffer3_fc : i_syncbuf_sizex_sync_buffer3_fc18
    PORT MAP (
        in_buffer_in => in_sizex,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_sizex_sync_buffer3_fc_backStall,
        in_valid_in => SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_4_V0,
        out_buffer_out => i_syncbuf_sizex_sync_buffer3_fc_out_buffer_out,
        out_stall_out => i_syncbuf_sizex_sync_buffer3_fc_out_stall_out,
        out_valid_out => i_syncbuf_sizex_sync_buffer3_fc_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_syncbuf_sizex_sync_buffer3_fc(BITJOIN,136)
    bubble_join_i_syncbuf_sizex_sync_buffer3_fc_q <= i_syncbuf_sizex_sync_buffer3_fc_out_buffer_out;

    -- bubble_select_i_syncbuf_sizex_sync_buffer3_fc(BITSELECT,137)
    bubble_select_i_syncbuf_sizex_sync_buffer3_fc_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_sizex_sync_buffer3_fc_q(31 downto 0));

    -- bubble_join_redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo(BITJOIN,171)
    bubble_join_redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_q <= redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_data_out;

    -- bubble_select_redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo(BITSELECT,172)
    bubble_select_redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_q(31 downto 0));

    -- i_inc19_fc(ADD,50)@10
    i_inc19_fc_a <= STD_LOGIC_VECTOR("0" & bubble_select_redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_b);
    i_inc19_fc_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc19_fc_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc19_fc_a) + UNSIGNED(i_inc19_fc_b));
    i_inc19_fc_q <= i_inc19_fc_o(32 downto 0);

    -- bgTrunc_i_inc19_fc_sel_x(BITSELECT,2)@10
    bgTrunc_i_inc19_fc_sel_x_b <= i_inc19_fc_q(31 downto 0);

    -- redist17_bgTrunc_i_inc19_fc_sel_x_b_1_0(REG,114)
    redist17_bgTrunc_i_inc19_fc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist17_bgTrunc_i_inc19_fc_sel_x_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_backEN = "1") THEN
                redist17_bgTrunc_i_inc19_fc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(bgTrunc_i_inc19_fc_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- SE_out_i_syncbuf_sizex_sync_buffer3_fc(STALLENABLE,220)
    SE_out_i_syncbuf_sizex_sync_buffer3_fc_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_syncbuf_sizex_sync_buffer3_fc_fromReg0 <= (others => '0');
            SE_out_i_syncbuf_sizex_sync_buffer3_fc_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_syncbuf_sizex_sync_buffer3_fc_fromReg0 <= SE_out_i_syncbuf_sizex_sync_buffer3_fc_toReg0;
            -- Succesor 1
            SE_out_i_syncbuf_sizex_sync_buffer3_fc_fromReg1 <= SE_out_i_syncbuf_sizex_sync_buffer3_fc_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_syncbuf_sizex_sync_buffer3_fc_consumed0 <= (not (bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg_stall_out) and SE_out_i_syncbuf_sizex_sync_buffer3_fc_wireValid) or SE_out_i_syncbuf_sizex_sync_buffer3_fc_fromReg0;
    SE_out_i_syncbuf_sizex_sync_buffer3_fc_consumed1 <= (not (SR_SE_i_exitcond8_fc_backStall) and SE_out_i_syncbuf_sizex_sync_buffer3_fc_wireValid) or SE_out_i_syncbuf_sizex_sync_buffer3_fc_fromReg1;
    -- Consuming
    SE_out_i_syncbuf_sizex_sync_buffer3_fc_StallValid <= SE_out_i_syncbuf_sizex_sync_buffer3_fc_backStall and SE_out_i_syncbuf_sizex_sync_buffer3_fc_wireValid;
    SE_out_i_syncbuf_sizex_sync_buffer3_fc_toReg0 <= SE_out_i_syncbuf_sizex_sync_buffer3_fc_StallValid and SE_out_i_syncbuf_sizex_sync_buffer3_fc_consumed0;
    SE_out_i_syncbuf_sizex_sync_buffer3_fc_toReg1 <= SE_out_i_syncbuf_sizex_sync_buffer3_fc_StallValid and SE_out_i_syncbuf_sizex_sync_buffer3_fc_consumed1;
    -- Backward Stall generation
    SE_out_i_syncbuf_sizex_sync_buffer3_fc_or0 <= SE_out_i_syncbuf_sizex_sync_buffer3_fc_consumed0;
    SE_out_i_syncbuf_sizex_sync_buffer3_fc_wireStall <= not (SE_out_i_syncbuf_sizex_sync_buffer3_fc_consumed1 and SE_out_i_syncbuf_sizex_sync_buffer3_fc_or0);
    SE_out_i_syncbuf_sizex_sync_buffer3_fc_backStall <= SE_out_i_syncbuf_sizex_sync_buffer3_fc_wireStall;
    -- Valid signal propagation
    SE_out_i_syncbuf_sizex_sync_buffer3_fc_V0 <= SE_out_i_syncbuf_sizex_sync_buffer3_fc_wireValid and not (SE_out_i_syncbuf_sizex_sync_buffer3_fc_fromReg0);
    SE_out_i_syncbuf_sizex_sync_buffer3_fc_V1 <= SE_out_i_syncbuf_sizex_sync_buffer3_fc_wireValid and not (SE_out_i_syncbuf_sizex_sync_buffer3_fc_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_sizex_sync_buffer3_fc_wireValid <= i_syncbuf_sizex_sync_buffer3_fc_out_valid_out;

    -- SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_2(STALLENABLE,270)
    -- Valid signal propagation
    SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_2_V0 <= SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_2_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_2_backStall <= i_syncbuf_sizex_sync_buffer_fc_out_stall_out or not (SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_2_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_2_wireValid <= bubble_out_fc_B1_merge_reg_aunroll_x_2_reg_valid_out;

    -- i_syncbuf_sizex_sync_buffer_fc(BLACKBOX,57)@10
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_sizex_sync_buffer_fc : i_syncbuf_sizex_sync_buffer_fc14
    PORT MAP (
        in_buffer_in => in_sizex,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_sizex_sync_buffer_fc_backStall,
        in_valid_in => SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_2_V0,
        out_buffer_out => i_syncbuf_sizex_sync_buffer_fc_out_buffer_out,
        out_stall_out => i_syncbuf_sizex_sync_buffer_fc_out_stall_out,
        out_valid_out => i_syncbuf_sizex_sync_buffer_fc_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_syncbuf_sizex_sync_buffer_fc(BITJOIN,140)
    bubble_join_i_syncbuf_sizex_sync_buffer_fc_q <= i_syncbuf_sizex_sync_buffer_fc_out_buffer_out;

    -- bubble_select_i_syncbuf_sizex_sync_buffer_fc(BITSELECT,141)
    bubble_select_i_syncbuf_sizex_sync_buffer_fc_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_sizex_sync_buffer_fc_q(31 downto 0));

    -- SE_out_i_syncbuf_sizex_sync_buffer_fc(STALLENABLE,222)
    -- Valid signal propagation
    SE_out_i_syncbuf_sizex_sync_buffer_fc_V0 <= SE_out_i_syncbuf_sizex_sync_buffer_fc_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_sizex_sync_buffer_fc_backStall <= SR_SE_i_cmp4_phi_decision15_xor_rm_fc_backStall or not (SE_out_i_syncbuf_sizex_sync_buffer_fc_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_sizex_sync_buffer_fc_wireValid <= i_syncbuf_sizex_sync_buffer_fc_out_valid_out;

    -- SR_SE_i_cmp4_phi_decision15_xor_rm_fc(STALLREG,380)
    SR_SE_i_cmp4_phi_decision15_xor_rm_fc_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_cmp4_phi_decision15_xor_rm_fc_r_valid <= (others => '0');
            SR_SE_i_cmp4_phi_decision15_xor_rm_fc_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_cmp4_phi_decision15_xor_rm_fc_r_valid <= SE_i_cmp4_phi_decision15_xor_rm_fc_backStall and (SR_SE_i_cmp4_phi_decision15_xor_rm_fc_r_valid or SR_SE_i_cmp4_phi_decision15_xor_rm_fc_i_valid);

            IF (SR_SE_i_cmp4_phi_decision15_xor_rm_fc_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_cmp4_phi_decision15_xor_rm_fc_r_data0 <= STD_LOGIC_VECTOR(bubble_select_i_syncbuf_sizex_sync_buffer_fc_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_cmp4_phi_decision15_xor_rm_fc_i_valid <= SE_out_i_syncbuf_sizex_sync_buffer_fc_V0;
    -- Stall signal propagation
    SR_SE_i_cmp4_phi_decision15_xor_rm_fc_backStall <= SR_SE_i_cmp4_phi_decision15_xor_rm_fc_r_valid or not (SR_SE_i_cmp4_phi_decision15_xor_rm_fc_i_valid);

    -- Valid
    SR_SE_i_cmp4_phi_decision15_xor_rm_fc_V <= SR_SE_i_cmp4_phi_decision15_xor_rm_fc_r_valid WHEN SR_SE_i_cmp4_phi_decision15_xor_rm_fc_r_valid = "1" ELSE SR_SE_i_cmp4_phi_decision15_xor_rm_fc_i_valid;

    SR_SE_i_cmp4_phi_decision15_xor_rm_fc_D0 <= SR_SE_i_cmp4_phi_decision15_xor_rm_fc_r_data0 WHEN SR_SE_i_cmp4_phi_decision15_xor_rm_fc_r_valid = "1" ELSE bubble_select_i_syncbuf_sizex_sync_buffer_fc_b;

    -- i_cmp4_phi_decision15_xor_rm_fc(COMPARE,42)@10 + 1
    i_cmp4_phi_decision15_xor_rm_fc_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => SR_SE_i_cmp4_phi_decision15_xor_rm_fc_D0(31)) & SR_SE_i_cmp4_phi_decision15_xor_rm_fc_D0));
    i_cmp4_phi_decision15_xor_rm_fc_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_1gr_q(31)) & c_i32_1gr_q));
    i_cmp4_phi_decision15_xor_rm_fc_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp4_phi_decision15_xor_rm_fc_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp4_phi_decision15_xor_rm_fc_backEN = "1") THEN
                i_cmp4_phi_decision15_xor_rm_fc_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp4_phi_decision15_xor_rm_fc_a) - SIGNED(i_cmp4_phi_decision15_xor_rm_fc_b));
            END IF;
        END IF;
    END PROCESS;
    i_cmp4_phi_decision15_xor_rm_fc_c(0) <= i_cmp4_phi_decision15_xor_rm_fc_o(33);

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_1(STALLENABLE,268)
    -- Valid signal propagation
    SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_1_V0 <= SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_1_backStall <= i_syncbuf_sizey_sync_buffer6_fc_out_stall_out or not (SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_1_wireValid <= bubble_out_fc_B1_merge_reg_aunroll_x_1_reg_valid_out;

    -- i_syncbuf_sizey_sync_buffer6_fc(BLACKBOX,59)@10
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_sizey_sync_buffer6_fc : i_syncbuf_sizey_sync_buffer6_fc12
    PORT MAP (
        in_buffer_in => in_sizey,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_sizey_sync_buffer6_fc_backStall,
        in_valid_in => SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_1_V0,
        out_buffer_out => i_syncbuf_sizey_sync_buffer6_fc_out_buffer_out,
        out_stall_out => i_syncbuf_sizey_sync_buffer6_fc_out_stall_out,
        out_valid_out => i_syncbuf_sizey_sync_buffer6_fc_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_syncbuf_sizey_sync_buffer6_fc(BITJOIN,146)
    bubble_join_i_syncbuf_sizey_sync_buffer6_fc_q <= i_syncbuf_sizey_sync_buffer6_fc_out_buffer_out;

    -- bubble_select_i_syncbuf_sizey_sync_buffer6_fc(BITSELECT,147)
    bubble_select_i_syncbuf_sizey_sync_buffer6_fc_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_sizey_sync_buffer6_fc_q(31 downto 0));

    -- SE_out_i_syncbuf_sizey_sync_buffer6_fc(STALLENABLE,226)
    -- Valid signal propagation
    SE_out_i_syncbuf_sizey_sync_buffer6_fc_V0 <= SE_out_i_syncbuf_sizey_sync_buffer6_fc_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_sizey_sync_buffer6_fc_backStall <= SR_SE_i_cmp61_rm_fc_backStall or not (SE_out_i_syncbuf_sizey_sync_buffer6_fc_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_sizey_sync_buffer6_fc_wireValid <= i_syncbuf_sizey_sync_buffer6_fc_out_valid_out;

    -- SR_SE_i_cmp61_rm_fc(STALLREG,378)
    SR_SE_i_cmp61_rm_fc_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_cmp61_rm_fc_r_valid <= (others => '0');
            SR_SE_i_cmp61_rm_fc_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_cmp61_rm_fc_r_valid <= SE_i_cmp61_rm_fc_backStall and (SR_SE_i_cmp61_rm_fc_r_valid or SR_SE_i_cmp61_rm_fc_i_valid);

            IF (SR_SE_i_cmp61_rm_fc_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_cmp61_rm_fc_r_data0 <= STD_LOGIC_VECTOR(bubble_select_i_syncbuf_sizey_sync_buffer6_fc_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_cmp61_rm_fc_i_valid <= SE_out_i_syncbuf_sizey_sync_buffer6_fc_V0;
    -- Stall signal propagation
    SR_SE_i_cmp61_rm_fc_backStall <= SR_SE_i_cmp61_rm_fc_r_valid or not (SR_SE_i_cmp61_rm_fc_i_valid);

    -- Valid
    SR_SE_i_cmp61_rm_fc_V <= SR_SE_i_cmp61_rm_fc_r_valid WHEN SR_SE_i_cmp61_rm_fc_r_valid = "1" ELSE SR_SE_i_cmp61_rm_fc_i_valid;

    SR_SE_i_cmp61_rm_fc_D0 <= SR_SE_i_cmp61_rm_fc_r_data0 WHEN SR_SE_i_cmp61_rm_fc_r_valid = "1" ELSE bubble_select_i_syncbuf_sizey_sync_buffer6_fc_b;

    -- i_cmp61_rm_fc(COMPARE,44)@10 + 1
    i_cmp61_rm_fc_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_0gr_q(31)) & c_i32_0gr_q));
    i_cmp61_rm_fc_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => SR_SE_i_cmp61_rm_fc_D0(31)) & SR_SE_i_cmp61_rm_fc_D0));
    i_cmp61_rm_fc_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp61_rm_fc_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp61_rm_fc_backEN = "1") THEN
                i_cmp61_rm_fc_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp61_rm_fc_a) - SIGNED(i_cmp61_rm_fc_b));
            END IF;
        END IF;
    END PROCESS;
    i_cmp61_rm_fc_c(0) <= i_cmp61_rm_fc_o(33);

    -- i_cmp61_neg_rm_fc(LOGICAL,43)@11
    i_cmp61_neg_rm_fc_q <= i_cmp61_rm_fc_c xor VCC_q;

    -- SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_3(STALLENABLE,272)
    -- Valid signal propagation
    SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_3_V0 <= SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_3_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_3_backStall <= i_syncbuf_sizey_sync_buffer5_fc_out_stall_out or not (SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_3_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_3_wireValid <= bubble_out_fc_B1_merge_reg_aunroll_x_3_reg_valid_out;

    -- i_syncbuf_sizey_sync_buffer5_fc(BLACKBOX,58)@10
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_sizey_sync_buffer5_fc : i_syncbuf_sizey_sync_buffer5_fc16
    PORT MAP (
        in_buffer_in => in_sizey,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_sizey_sync_buffer5_fc_backStall,
        in_valid_in => SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_3_V0,
        out_buffer_out => i_syncbuf_sizey_sync_buffer5_fc_out_buffer_out,
        out_stall_out => i_syncbuf_sizey_sync_buffer5_fc_out_stall_out,
        out_valid_out => i_syncbuf_sizey_sync_buffer5_fc_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_syncbuf_sizey_sync_buffer5_fc(BITJOIN,143)
    bubble_join_i_syncbuf_sizey_sync_buffer5_fc_q <= i_syncbuf_sizey_sync_buffer5_fc_out_buffer_out;

    -- bubble_select_i_syncbuf_sizey_sync_buffer5_fc(BITSELECT,144)
    bubble_select_i_syncbuf_sizey_sync_buffer5_fc_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_sizey_sync_buffer5_fc_q(31 downto 0));

    -- SE_out_i_syncbuf_sizey_sync_buffer5_fc(STALLENABLE,224)
    -- Valid signal propagation
    SE_out_i_syncbuf_sizey_sync_buffer5_fc_V0 <= SE_out_i_syncbuf_sizey_sync_buffer5_fc_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_sizey_sync_buffer5_fc_backStall <= SR_SE_i_exitcond_fc_backStall or not (SE_out_i_syncbuf_sizey_sync_buffer5_fc_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_sizey_sync_buffer5_fc_wireValid <= i_syncbuf_sizey_sync_buffer5_fc_out_valid_out;

    -- SR_SE_i_exitcond_fc(STALLREG,379)
    SR_SE_i_exitcond_fc_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_exitcond_fc_r_valid <= (others => '0');
            SR_SE_i_exitcond_fc_r_data0 <= (others => '-');
            SR_SE_i_exitcond_fc_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_exitcond_fc_r_valid <= SE_i_exitcond_fc_backStall and (SR_SE_i_exitcond_fc_r_valid or SR_SE_i_exitcond_fc_i_valid);

            IF (SR_SE_i_exitcond_fc_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_exitcond_fc_r_data0 <= STD_LOGIC_VECTOR(redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_q);
                SR_SE_i_exitcond_fc_r_data1 <= STD_LOGIC_VECTOR(bubble_select_i_syncbuf_sizey_sync_buffer5_fc_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_exitcond_fc_and0 <= SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_V0;
    SR_SE_i_exitcond_fc_i_valid <= SE_out_i_syncbuf_sizey_sync_buffer5_fc_V0 and SR_SE_i_exitcond_fc_and0;
    -- Stall signal propagation
    SR_SE_i_exitcond_fc_backStall <= SR_SE_i_exitcond_fc_r_valid or not (SR_SE_i_exitcond_fc_i_valid);

    -- Valid
    SR_SE_i_exitcond_fc_V <= SR_SE_i_exitcond_fc_r_valid WHEN SR_SE_i_exitcond_fc_r_valid = "1" ELSE SR_SE_i_exitcond_fc_i_valid;

    -- Data0
    SR_SE_i_exitcond_fc_D0 <= SR_SE_i_exitcond_fc_r_data0 WHEN SR_SE_i_exitcond_fc_r_valid = "1" ELSE redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_q;
    -- Data1
    SR_SE_i_exitcond_fc_D1 <= SR_SE_i_exitcond_fc_r_data1 WHEN SR_SE_i_exitcond_fc_r_valid = "1" ELSE bubble_select_i_syncbuf_sizey_sync_buffer5_fc_b;

    -- i_exitcond_fc(LOGICAL,46)@10 + 1
    i_exitcond_fc_qi <= "1" WHEN SR_SE_i_exitcond_fc_D0 = SR_SE_i_exitcond_fc_D1 ELSE "0";
    i_exitcond_fc_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_exitcond_fc_qi, xout => i_exitcond_fc_q, ena => SE_i_exitcond_fc_backEN(0), clk => clock, aclr => resetn );

    -- i_exitcond_guard_fc(LOGICAL,47)@11
    i_exitcond_guard_fc_q <= i_exitcond_fc_q or i_cmp61_neg_rm_fc_q;

    -- i_unnamed_fc40(LOGICAL,61)@11
    i_unnamed_fc40_q <= i_exitcond_guard_fc_q or i_cmp4_phi_decision15_xor_rm_fc_c;

    -- redist0_i_unnamed_fc40_q_168_fifo(STALLFIFO,97)
    redist0_i_unnamed_fc40_q_168_fifo_valid_in <= SE_i_exitcond_guard_fc_V1;
    redist0_i_unnamed_fc40_q_168_fifo_stall_in <= SE_out_redist0_i_unnamed_fc40_q_168_fifo_backStall;
    redist0_i_unnamed_fc40_q_168_fifo_data_in <= i_unnamed_fc40_q;
    redist0_i_unnamed_fc40_q_168_fifo_valid_in_bitsignaltemp <= redist0_i_unnamed_fc40_q_168_fifo_valid_in(0);
    redist0_i_unnamed_fc40_q_168_fifo_stall_in_bitsignaltemp <= redist0_i_unnamed_fc40_q_168_fifo_stall_in(0);
    redist0_i_unnamed_fc40_q_168_fifo_valid_out(0) <= redist0_i_unnamed_fc40_q_168_fifo_valid_out_bitsignaltemp;
    redist0_i_unnamed_fc40_q_168_fifo_stall_out(0) <= redist0_i_unnamed_fc40_q_168_fifo_stall_out_bitsignaltemp;
    theredist0_i_unnamed_fc40_q_168_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 169,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist0_i_unnamed_fc40_q_168_fifo_valid_in_bitsignaltemp,
        stall_in => redist0_i_unnamed_fc40_q_168_fifo_stall_in_bitsignaltemp,
        data_in => i_unnamed_fc40_q,
        valid_out => redist0_i_unnamed_fc40_q_168_fifo_valid_out_bitsignaltemp,
        stall_out => redist0_i_unnamed_fc40_q_168_fifo_stall_out_bitsignaltemp,
        data_out => redist0_i_unnamed_fc40_q_168_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_i_exitcond_fc(STALLENABLE,207)
    -- Valid signal propagation
    SE_i_exitcond_fc_V0 <= SE_i_exitcond_fc_R_v_0;
    -- Stall signal propagation
    SE_i_exitcond_fc_s_tv_0 <= SE_i_exitcond_guard_fc_backStall and SE_i_exitcond_fc_R_v_0;
    -- Backward Enable generation
    SE_i_exitcond_fc_backEN <= not (SE_i_exitcond_fc_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_exitcond_fc_v_s_0 <= SE_i_exitcond_fc_backEN and SR_SE_i_exitcond_fc_V;
    -- Backward Stall generation
    SE_i_exitcond_fc_backStall <= not (SE_i_exitcond_fc_backEN);
    SE_i_exitcond_fc_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_exitcond_fc_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_exitcond_fc_backEN = "0") THEN
                SE_i_exitcond_fc_R_v_0 <= SE_i_exitcond_fc_R_v_0 and SE_i_exitcond_fc_s_tv_0;
            ELSE
                SE_i_exitcond_fc_R_v_0 <= SE_i_exitcond_fc_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_cmp61_rm_fc(STALLENABLE,205)
    -- Valid signal propagation
    SE_i_cmp61_rm_fc_V0 <= SE_i_cmp61_rm_fc_R_v_0;
    SE_i_cmp61_rm_fc_V1 <= SE_i_cmp61_rm_fc_R_v_1;
    SE_i_cmp61_rm_fc_V2 <= SE_i_cmp61_rm_fc_R_v_2;
    -- Stall signal propagation
    SE_i_cmp61_rm_fc_s_tv_0 <= SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_backStall and SE_i_cmp61_rm_fc_R_v_0;
    SE_i_cmp61_rm_fc_s_tv_1 <= SE_i_exitcond_guard_fc_backStall and SE_i_cmp61_rm_fc_R_v_1;
    SE_i_cmp61_rm_fc_s_tv_2 <= redist5_i_cmp61_rm_fc_c_169_fifo_stall_out and SE_i_cmp61_rm_fc_R_v_2;
    -- Backward Enable generation
    SE_i_cmp61_rm_fc_or0 <= SE_i_cmp61_rm_fc_s_tv_0;
    SE_i_cmp61_rm_fc_or1 <= SE_i_cmp61_rm_fc_s_tv_1 or SE_i_cmp61_rm_fc_or0;
    SE_i_cmp61_rm_fc_backEN <= not (SE_i_cmp61_rm_fc_s_tv_2 or SE_i_cmp61_rm_fc_or1);
    -- Determine whether to write valid data into the first register stage
    SE_i_cmp61_rm_fc_v_s_0 <= SE_i_cmp61_rm_fc_backEN and SR_SE_i_cmp61_rm_fc_V;
    -- Backward Stall generation
    SE_i_cmp61_rm_fc_backStall <= not (SE_i_cmp61_rm_fc_backEN);
    SE_i_cmp61_rm_fc_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_cmp61_rm_fc_R_v_0 <= (others => '0');
            SE_i_cmp61_rm_fc_R_v_1 <= (others => '0');
            SE_i_cmp61_rm_fc_R_v_2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp61_rm_fc_backEN = "0") THEN
                SE_i_cmp61_rm_fc_R_v_0 <= SE_i_cmp61_rm_fc_R_v_0 and SE_i_cmp61_rm_fc_s_tv_0;
            ELSE
                SE_i_cmp61_rm_fc_R_v_0 <= SE_i_cmp61_rm_fc_v_s_0;
            END IF;

            IF (SE_i_cmp61_rm_fc_backEN = "0") THEN
                SE_i_cmp61_rm_fc_R_v_1 <= SE_i_cmp61_rm_fc_R_v_1 and SE_i_cmp61_rm_fc_s_tv_1;
            ELSE
                SE_i_cmp61_rm_fc_R_v_1 <= SE_i_cmp61_rm_fc_v_s_0;
            END IF;

            IF (SE_i_cmp61_rm_fc_backEN = "0") THEN
                SE_i_cmp61_rm_fc_R_v_2 <= SE_i_cmp61_rm_fc_R_v_2 and SE_i_cmp61_rm_fc_s_tv_2;
            ELSE
                SE_i_cmp61_rm_fc_R_v_2 <= SE_i_cmp61_rm_fc_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_exitcond_guard_fc(STALLENABLE,208)
    SE_i_exitcond_guard_fc_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_exitcond_guard_fc_fromReg0 <= (others => '0');
            SE_i_exitcond_guard_fc_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_i_exitcond_guard_fc_fromReg0 <= SE_i_exitcond_guard_fc_toReg0;
            -- Succesor 1
            SE_i_exitcond_guard_fc_fromReg1 <= SE_i_exitcond_guard_fc_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_i_exitcond_guard_fc_consumed0 <= (not (SR_SE_i_i_06_lc_outerphi_fc_backStall) and SE_i_exitcond_guard_fc_wireValid) or SE_i_exitcond_guard_fc_fromReg0;
    SE_i_exitcond_guard_fc_consumed1 <= (not (redist0_i_unnamed_fc40_q_168_fifo_stall_out) and SE_i_exitcond_guard_fc_wireValid) or SE_i_exitcond_guard_fc_fromReg1;
    -- Consuming
    SE_i_exitcond_guard_fc_StallValid <= SE_i_exitcond_guard_fc_backStall and SE_i_exitcond_guard_fc_wireValid;
    SE_i_exitcond_guard_fc_toReg0 <= SE_i_exitcond_guard_fc_StallValid and SE_i_exitcond_guard_fc_consumed0;
    SE_i_exitcond_guard_fc_toReg1 <= SE_i_exitcond_guard_fc_StallValid and SE_i_exitcond_guard_fc_consumed1;
    -- Backward Stall generation
    SE_i_exitcond_guard_fc_or0 <= SE_i_exitcond_guard_fc_consumed0;
    SE_i_exitcond_guard_fc_wireStall <= not (SE_i_exitcond_guard_fc_consumed1 and SE_i_exitcond_guard_fc_or0);
    SE_i_exitcond_guard_fc_backStall <= SE_i_exitcond_guard_fc_wireStall;
    -- Valid signal propagation
    SE_i_exitcond_guard_fc_V0 <= SE_i_exitcond_guard_fc_wireValid and not (SE_i_exitcond_guard_fc_fromReg0);
    SE_i_exitcond_guard_fc_V1 <= SE_i_exitcond_guard_fc_wireValid and not (SE_i_exitcond_guard_fc_fromReg1);
    -- Computing multiple Valid(s)
    SE_i_exitcond_guard_fc_and0 <= SE_i_cmp61_rm_fc_V1;
    SE_i_exitcond_guard_fc_and1 <= SE_i_exitcond_fc_V0 and SE_i_exitcond_guard_fc_and0;
    SE_i_exitcond_guard_fc_wireValid <= SE_i_cmp4_phi_decision15_xor_rm_fc_V1 and SE_i_exitcond_guard_fc_and1;

    -- SE_i_cmp4_phi_decision15_xor_rm_fc(STALLENABLE,203)
    -- Valid signal propagation
    SE_i_cmp4_phi_decision15_xor_rm_fc_V0 <= SE_i_cmp4_phi_decision15_xor_rm_fc_R_v_0;
    SE_i_cmp4_phi_decision15_xor_rm_fc_V1 <= SE_i_cmp4_phi_decision15_xor_rm_fc_R_v_1;
    SE_i_cmp4_phi_decision15_xor_rm_fc_V2 <= SE_i_cmp4_phi_decision15_xor_rm_fc_R_v_2;
    -- Stall signal propagation
    SE_i_cmp4_phi_decision15_xor_rm_fc_s_tv_0 <= SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_backStall and SE_i_cmp4_phi_decision15_xor_rm_fc_R_v_0;
    SE_i_cmp4_phi_decision15_xor_rm_fc_s_tv_1 <= SE_i_exitcond_guard_fc_backStall and SE_i_cmp4_phi_decision15_xor_rm_fc_R_v_1;
    SE_i_cmp4_phi_decision15_xor_rm_fc_s_tv_2 <= SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_backStall and SE_i_cmp4_phi_decision15_xor_rm_fc_R_v_2;
    -- Backward Enable generation
    SE_i_cmp4_phi_decision15_xor_rm_fc_or0 <= SE_i_cmp4_phi_decision15_xor_rm_fc_s_tv_0;
    SE_i_cmp4_phi_decision15_xor_rm_fc_or1 <= SE_i_cmp4_phi_decision15_xor_rm_fc_s_tv_1 or SE_i_cmp4_phi_decision15_xor_rm_fc_or0;
    SE_i_cmp4_phi_decision15_xor_rm_fc_backEN <= not (SE_i_cmp4_phi_decision15_xor_rm_fc_s_tv_2 or SE_i_cmp4_phi_decision15_xor_rm_fc_or1);
    -- Determine whether to write valid data into the first register stage
    SE_i_cmp4_phi_decision15_xor_rm_fc_v_s_0 <= SE_i_cmp4_phi_decision15_xor_rm_fc_backEN and SR_SE_i_cmp4_phi_decision15_xor_rm_fc_V;
    -- Backward Stall generation
    SE_i_cmp4_phi_decision15_xor_rm_fc_backStall <= not (SE_i_cmp4_phi_decision15_xor_rm_fc_backEN);
    SE_i_cmp4_phi_decision15_xor_rm_fc_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_cmp4_phi_decision15_xor_rm_fc_R_v_0 <= (others => '0');
            SE_i_cmp4_phi_decision15_xor_rm_fc_R_v_1 <= (others => '0');
            SE_i_cmp4_phi_decision15_xor_rm_fc_R_v_2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp4_phi_decision15_xor_rm_fc_backEN = "0") THEN
                SE_i_cmp4_phi_decision15_xor_rm_fc_R_v_0 <= SE_i_cmp4_phi_decision15_xor_rm_fc_R_v_0 and SE_i_cmp4_phi_decision15_xor_rm_fc_s_tv_0;
            ELSE
                SE_i_cmp4_phi_decision15_xor_rm_fc_R_v_0 <= SE_i_cmp4_phi_decision15_xor_rm_fc_v_s_0;
            END IF;

            IF (SE_i_cmp4_phi_decision15_xor_rm_fc_backEN = "0") THEN
                SE_i_cmp4_phi_decision15_xor_rm_fc_R_v_1 <= SE_i_cmp4_phi_decision15_xor_rm_fc_R_v_1 and SE_i_cmp4_phi_decision15_xor_rm_fc_s_tv_1;
            ELSE
                SE_i_cmp4_phi_decision15_xor_rm_fc_R_v_1 <= SE_i_cmp4_phi_decision15_xor_rm_fc_v_s_0;
            END IF;

            IF (SE_i_cmp4_phi_decision15_xor_rm_fc_backEN = "0") THEN
                SE_i_cmp4_phi_decision15_xor_rm_fc_R_v_2 <= SE_i_cmp4_phi_decision15_xor_rm_fc_R_v_2 and SE_i_cmp4_phi_decision15_xor_rm_fc_s_tv_2;
            ELSE
                SE_i_cmp4_phi_decision15_xor_rm_fc_R_v_2 <= SE_i_cmp4_phi_decision15_xor_rm_fc_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0(STALLREG,382)
    SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_r_valid <= (others => '0');
            SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_r_valid <= SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_backStall and (SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_r_valid or SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_i_valid);

            IF (SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_r_data0 <= STD_LOGIC_VECTOR(i_cmp4_phi_decision15_xor_rm_fc_c);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_i_valid <= SE_i_cmp4_phi_decision15_xor_rm_fc_V2;
    -- Stall signal propagation
    SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_backStall <= SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_r_valid or not (SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_i_valid);

    -- Valid
    SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_V <= SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_r_valid WHEN SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_r_valid = "1" ELSE SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_i_valid;

    SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_D0 <= SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_r_data0 WHEN SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_r_valid = "1" ELSE i_cmp4_phi_decision15_xor_rm_fc_c;

    -- redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0(REG,103)
    redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_backEN = "1") THEN
                redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_q <= STD_LOGIC_VECTOR(SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- i_exitcond8_fc(LOGICAL,45)@11 + 1
    i_exitcond8_fc_qi <= "1" WHEN SR_SE_i_exitcond8_fc_D0 = SR_SE_i_exitcond8_fc_D1 ELSE "0";
    i_exitcond8_fc_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_exitcond8_fc_qi, xout => i_exitcond8_fc_q, ena => SE_i_exitcond8_fc_backEN(0), clk => clock, aclr => resetn );

    -- i_unnamed_fc35(LOGICAL,60)@12 + 1
    i_unnamed_fc35_qi <= i_exitcond8_fc_q or redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_q;
    i_unnamed_fc35_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_fc35_qi, xout => i_unnamed_fc35_q, ena => SE_i_unnamed_fc35_backEN(0), clk => clock, aclr => resetn );

    -- bubble_join_redist1_i_unnamed_fc35_q_167_fifo(BITJOIN,156)
    bubble_join_redist1_i_unnamed_fc35_q_167_fifo_q <= redist1_i_unnamed_fc35_q_167_fifo_data_out;

    -- bubble_select_redist1_i_unnamed_fc35_q_167_fifo(BITSELECT,157)
    bubble_select_redist1_i_unnamed_fc35_q_167_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist1_i_unnamed_fc35_q_167_fifo_q(0 downto 0));

    -- SE_i_for_end20_loopexit_loopexit_lc_cond_fc(STALLENABLE,209)
    -- Valid signal propagation
    SE_i_for_end20_loopexit_loopexit_lc_cond_fc_V0 <= SE_i_for_end20_loopexit_loopexit_lc_cond_fc_R_v_0;
    -- Stall signal propagation
    SE_i_for_end20_loopexit_loopexit_lc_cond_fc_s_tv_0 <= redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_stall_out and SE_i_for_end20_loopexit_loopexit_lc_cond_fc_R_v_0;
    -- Backward Enable generation
    SE_i_for_end20_loopexit_loopexit_lc_cond_fc_backEN <= not (SE_i_for_end20_loopexit_loopexit_lc_cond_fc_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_for_end20_loopexit_loopexit_lc_cond_fc_v_s_0 <= SE_i_for_end20_loopexit_loopexit_lc_cond_fc_backEN and SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_V;
    -- Backward Stall generation
    SE_i_for_end20_loopexit_loopexit_lc_cond_fc_backStall <= not (SE_i_for_end20_loopexit_loopexit_lc_cond_fc_backEN);
    SE_i_for_end20_loopexit_loopexit_lc_cond_fc_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_for_end20_loopexit_loopexit_lc_cond_fc_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_for_end20_loopexit_loopexit_lc_cond_fc_backEN = "0") THEN
                SE_i_for_end20_loopexit_loopexit_lc_cond_fc_R_v_0 <= SE_i_for_end20_loopexit_loopexit_lc_cond_fc_R_v_0 and SE_i_for_end20_loopexit_loopexit_lc_cond_fc_s_tv_0;
            ELSE
                SE_i_for_end20_loopexit_loopexit_lc_cond_fc_R_v_0 <= SE_i_for_end20_loopexit_loopexit_lc_cond_fc_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc(STALLREG,383)
    SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_r_valid <= (others => '0');
            SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_r_data0 <= (others => '-');
            SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_r_valid <= SE_i_for_end20_loopexit_loopexit_lc_cond_fc_backStall and (SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_r_valid or SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_i_valid);

            IF (SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_r_data0 <= bubble_select_redist0_i_unnamed_fc40_q_168_fifo_b;
                SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_r_data1 <= bubble_select_redist1_i_unnamed_fc35_q_167_fifo_b;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_and0 <= SE_out_redist0_i_unnamed_fc40_q_168_fifo_V0;
    SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_i_valid <= SE_out_redist1_i_unnamed_fc35_q_167_fifo_V0 and SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_and0;
    -- Stall signal propagation
    SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_backStall <= SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_r_valid or not (SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_i_valid);

    -- Valid
    SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_V <= SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_r_valid WHEN SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_r_valid = "1" ELSE SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_i_valid;

    -- Data0
    SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_D0 <= SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_r_data0 WHEN SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_r_valid = "1" ELSE bubble_select_redist0_i_unnamed_fc40_q_168_fifo_b;
    -- Data1
    SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_D1 <= SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_r_data1 WHEN SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_r_valid = "1" ELSE bubble_select_redist1_i_unnamed_fc35_q_167_fifo_b;

    -- SE_out_redist1_i_unnamed_fc35_q_167_fifo(STALLENABLE,234)
    -- Valid signal propagation
    SE_out_redist1_i_unnamed_fc35_q_167_fifo_V0 <= SE_out_redist1_i_unnamed_fc35_q_167_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist1_i_unnamed_fc35_q_167_fifo_backStall <= SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_backStall or not (SE_out_redist1_i_unnamed_fc35_q_167_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist1_i_unnamed_fc35_q_167_fifo_wireValid <= redist1_i_unnamed_fc35_q_167_fifo_valid_out;

    -- redist1_i_unnamed_fc35_q_167_fifo(STALLFIFO,98)
    redist1_i_unnamed_fc35_q_167_fifo_valid_in <= SE_i_unnamed_fc35_V0;
    redist1_i_unnamed_fc35_q_167_fifo_stall_in <= SE_out_redist1_i_unnamed_fc35_q_167_fifo_backStall;
    redist1_i_unnamed_fc35_q_167_fifo_data_in <= i_unnamed_fc35_q;
    redist1_i_unnamed_fc35_q_167_fifo_valid_in_bitsignaltemp <= redist1_i_unnamed_fc35_q_167_fifo_valid_in(0);
    redist1_i_unnamed_fc35_q_167_fifo_stall_in_bitsignaltemp <= redist1_i_unnamed_fc35_q_167_fifo_stall_in(0);
    redist1_i_unnamed_fc35_q_167_fifo_valid_out(0) <= redist1_i_unnamed_fc35_q_167_fifo_valid_out_bitsignaltemp;
    redist1_i_unnamed_fc35_q_167_fifo_stall_out(0) <= redist1_i_unnamed_fc35_q_167_fifo_stall_out_bitsignaltemp;
    theredist1_i_unnamed_fc35_q_167_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 167,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist1_i_unnamed_fc35_q_167_fifo_valid_in_bitsignaltemp,
        stall_in => redist1_i_unnamed_fc35_q_167_fifo_stall_in_bitsignaltemp,
        data_in => i_unnamed_fc35_q,
        valid_out => redist1_i_unnamed_fc35_q_167_fifo_valid_out_bitsignaltemp,
        stall_out => redist1_i_unnamed_fc35_q_167_fifo_stall_out_bitsignaltemp,
        data_out => redist1_i_unnamed_fc35_q_167_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0(STALLENABLE,243)
    -- Valid signal propagation
    SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_V0 <= SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_R_v_0;
    -- Stall signal propagation
    SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_s_tv_0 <= SE_i_unnamed_fc35_backStall and SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_R_v_0;
    -- Backward Enable generation
    SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_backEN <= not (SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_v_s_0 <= SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_backEN and SR_SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_V;
    -- Backward Stall generation
    SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_backStall <= not (SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_backEN);
    SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_backEN = "0") THEN
                SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_R_v_0 <= SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_R_v_0 and SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_s_tv_0;
            ELSE
                SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_R_v_0 <= SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_unnamed_fc35(STALLENABLE,227)
    -- Valid signal propagation
    SE_i_unnamed_fc35_V0 <= SE_i_unnamed_fc35_R_v_0;
    -- Stall signal propagation
    SE_i_unnamed_fc35_s_tv_0 <= redist1_i_unnamed_fc35_q_167_fifo_stall_out and SE_i_unnamed_fc35_R_v_0;
    -- Backward Enable generation
    SE_i_unnamed_fc35_backEN <= not (SE_i_unnamed_fc35_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_unnamed_fc35_and0 <= SE_i_exitcond8_fc_V0 and SE_i_unnamed_fc35_backEN;
    SE_i_unnamed_fc35_v_s_0 <= SE_redist6_i_cmp4_phi_decision15_xor_rm_fc_c_2_0_V0 and SE_i_unnamed_fc35_and0;
    -- Backward Stall generation
    SE_i_unnamed_fc35_backStall <= not (SE_i_unnamed_fc35_v_s_0);
    SE_i_unnamed_fc35_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_unnamed_fc35_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_unnamed_fc35_backEN = "0") THEN
                SE_i_unnamed_fc35_R_v_0 <= SE_i_unnamed_fc35_R_v_0 and SE_i_unnamed_fc35_s_tv_0;
            ELSE
                SE_i_unnamed_fc35_R_v_0 <= SE_i_unnamed_fc35_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_exitcond8_fc(STALLENABLE,206)
    -- Valid signal propagation
    SE_i_exitcond8_fc_V0 <= SE_i_exitcond8_fc_R_v_0;
    -- Stall signal propagation
    SE_i_exitcond8_fc_s_tv_0 <= SE_i_unnamed_fc35_backStall and SE_i_exitcond8_fc_R_v_0;
    -- Backward Enable generation
    SE_i_exitcond8_fc_backEN <= not (SE_i_exitcond8_fc_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_exitcond8_fc_v_s_0 <= SE_i_exitcond8_fc_backEN and SR_SE_i_exitcond8_fc_V;
    -- Backward Stall generation
    SE_i_exitcond8_fc_backStall <= not (SE_i_exitcond8_fc_backEN);
    SE_i_exitcond8_fc_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_exitcond8_fc_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_exitcond8_fc_backEN = "0") THEN
                SE_i_exitcond8_fc_R_v_0 <= SE_i_exitcond8_fc_R_v_0 and SE_i_exitcond8_fc_s_tv_0;
            ELSE
                SE_i_exitcond8_fc_R_v_0 <= SE_i_exitcond8_fc_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_i_exitcond8_fc(STALLREG,381)
    SR_SE_i_exitcond8_fc_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_exitcond8_fc_r_valid <= (others => '0');
            SR_SE_i_exitcond8_fc_r_data0 <= (others => '-');
            SR_SE_i_exitcond8_fc_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_exitcond8_fc_r_valid <= SE_i_exitcond8_fc_backStall and (SR_SE_i_exitcond8_fc_r_valid or SR_SE_i_exitcond8_fc_i_valid);

            IF (SR_SE_i_exitcond8_fc_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_exitcond8_fc_r_data0 <= STD_LOGIC_VECTOR(redist17_bgTrunc_i_inc19_fc_sel_x_b_1_0_q);
                SR_SE_i_exitcond8_fc_r_data1 <= STD_LOGIC_VECTOR(bubble_select_i_syncbuf_sizex_sync_buffer3_fc_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_exitcond8_fc_and0 <= SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_V1;
    SR_SE_i_exitcond8_fc_i_valid <= SE_out_i_syncbuf_sizex_sync_buffer3_fc_V1 and SR_SE_i_exitcond8_fc_and0;
    -- Stall signal propagation
    SR_SE_i_exitcond8_fc_backStall <= SR_SE_i_exitcond8_fc_r_valid or not (SR_SE_i_exitcond8_fc_i_valid);

    -- Valid
    SR_SE_i_exitcond8_fc_V <= SR_SE_i_exitcond8_fc_r_valid WHEN SR_SE_i_exitcond8_fc_r_valid = "1" ELSE SR_SE_i_exitcond8_fc_i_valid;

    -- Data0
    SR_SE_i_exitcond8_fc_D0 <= SR_SE_i_exitcond8_fc_r_data0 WHEN SR_SE_i_exitcond8_fc_r_valid = "1" ELSE redist17_bgTrunc_i_inc19_fc_sel_x_b_1_0_q;
    -- Data1
    SR_SE_i_exitcond8_fc_D1 <= SR_SE_i_exitcond8_fc_r_data1 WHEN SR_SE_i_exitcond8_fc_r_valid = "1" ELSE bubble_select_i_syncbuf_sizex_sync_buffer3_fc_b;

    -- redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0(REG,105)
    redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_backEN = "1") THEN
                redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_q <= STD_LOGIC_VECTOR(bubble_select_redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_b);
            END IF;
        END IF;
    END PROCESS;

    -- SE_i_i_06_lc_outerphi_fc(STALLENABLE,210)
    -- Valid signal propagation
    SE_i_i_06_lc_outerphi_fc_V0 <= SE_i_i_06_lc_outerphi_fc_R_v_0;
    -- Stall signal propagation
    SE_i_i_06_lc_outerphi_fc_s_tv_0 <= redist3_i_i_06_lc_outerphi_fc_q_194_fifo_stall_out and SE_i_i_06_lc_outerphi_fc_R_v_0;
    -- Backward Enable generation
    SE_i_i_06_lc_outerphi_fc_backEN <= not (SE_i_i_06_lc_outerphi_fc_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_i_06_lc_outerphi_fc_v_s_0 <= SE_i_i_06_lc_outerphi_fc_backEN and SR_SE_i_i_06_lc_outerphi_fc_V;
    -- Backward Stall generation
    SE_i_i_06_lc_outerphi_fc_backStall <= not (SE_i_i_06_lc_outerphi_fc_backEN);
    SE_i_i_06_lc_outerphi_fc_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_i_06_lc_outerphi_fc_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_i_06_lc_outerphi_fc_backEN = "0") THEN
                SE_i_i_06_lc_outerphi_fc_R_v_0 <= SE_i_i_06_lc_outerphi_fc_R_v_0 and SE_i_i_06_lc_outerphi_fc_s_tv_0;
            ELSE
                SE_i_i_06_lc_outerphi_fc_R_v_0 <= SE_i_i_06_lc_outerphi_fc_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_i_i_06_lc_outerphi_fc(STALLREG,384)
    SR_SE_i_i_06_lc_outerphi_fc_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_i_06_lc_outerphi_fc_r_valid <= (others => '0');
            SR_SE_i_i_06_lc_outerphi_fc_r_data0 <= (others => '-');
            SR_SE_i_i_06_lc_outerphi_fc_r_data1 <= (others => '-');
            SR_SE_i_i_06_lc_outerphi_fc_r_data2 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_i_06_lc_outerphi_fc_r_valid <= SE_i_i_06_lc_outerphi_fc_backStall and (SR_SE_i_i_06_lc_outerphi_fc_r_valid or SR_SE_i_i_06_lc_outerphi_fc_i_valid);

            IF (SR_SE_i_i_06_lc_outerphi_fc_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_i_06_lc_outerphi_fc_r_data0 <= i_unnamed_fc40_q;
                SR_SE_i_i_06_lc_outerphi_fc_r_data1 <= redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_q;
                SR_SE_i_i_06_lc_outerphi_fc_r_data2 <= redist17_bgTrunc_i_inc19_fc_sel_x_b_1_0_q;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_i_06_lc_outerphi_fc_and0 <= SE_i_exitcond_guard_fc_V0;
    SR_SE_i_i_06_lc_outerphi_fc_i_valid <= SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_V0 and SR_SE_i_i_06_lc_outerphi_fc_and0;
    -- Stall signal propagation
    SR_SE_i_i_06_lc_outerphi_fc_backStall <= SR_SE_i_i_06_lc_outerphi_fc_r_valid or not (SR_SE_i_i_06_lc_outerphi_fc_i_valid);

    -- Valid
    SR_SE_i_i_06_lc_outerphi_fc_V <= SR_SE_i_i_06_lc_outerphi_fc_r_valid WHEN SR_SE_i_i_06_lc_outerphi_fc_r_valid = "1" ELSE SR_SE_i_i_06_lc_outerphi_fc_i_valid;

    -- Data0
    SR_SE_i_i_06_lc_outerphi_fc_D0 <= SR_SE_i_i_06_lc_outerphi_fc_r_data0 WHEN SR_SE_i_i_06_lc_outerphi_fc_r_valid = "1" ELSE i_unnamed_fc40_q;
    -- Data1
    SR_SE_i_i_06_lc_outerphi_fc_D1 <= SR_SE_i_i_06_lc_outerphi_fc_r_data1 WHEN SR_SE_i_i_06_lc_outerphi_fc_r_valid = "1" ELSE redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_q;
    -- Data2
    SR_SE_i_i_06_lc_outerphi_fc_D2 <= SR_SE_i_i_06_lc_outerphi_fc_r_data2 WHEN SR_SE_i_i_06_lc_outerphi_fc_r_valid = "1" ELSE redist17_bgTrunc_i_inc19_fc_sel_x_b_1_0_q;

    -- SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0(STALLENABLE,246)
    -- Valid signal propagation
    SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_V0 <= SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_R_v_0;
    SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_V1 <= SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_R_v_1;
    -- Stall signal propagation
    SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_s_tv_0 <= SR_SE_i_i_06_lc_outerphi_fc_backStall and SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_R_v_0;
    SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_s_tv_1 <= SR_SE_i_exitcond8_fc_backStall and SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_R_v_1;
    -- Backward Enable generation
    SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_or0 <= SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_s_tv_0;
    SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_backEN <= not (SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_s_tv_1 or SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_or0);
    -- Determine whether to write valid data into the first register stage
    SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_v_s_0 <= SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_backEN and SE_out_redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_V0;
    -- Backward Stall generation
    SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_backStall <= not (SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_v_s_0);
    SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_R_v_0 <= (others => '0');
            SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_backEN = "0") THEN
                SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_R_v_0 <= SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_R_v_0 and SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_s_tv_0;
            ELSE
                SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_R_v_0 <= SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_v_s_0;
            END IF;

            IF (SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_backEN = "0") THEN
                SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_R_v_1 <= SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_R_v_1 and SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_s_tv_1;
            ELSE
                SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_R_v_1 <= SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_out_redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo(STALLENABLE,245)
    -- Valid signal propagation
    SE_out_redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_V0 <= SE_out_redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_backStall <= SE_redist8_fc_B1_merge_reg_aunroll_x_out_data_out_0_10_0_backStall or not (SE_out_redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_wireValid <= redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_valid_out;

    -- redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo(STALLFIFO,104)
    redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_valid_in <= SE_out_fc_B1_merge_reg_aunroll_x_V5;
    redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_stall_in <= SE_out_redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_backStall;
    redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_data_in <= bubble_select_fc_B1_merge_reg_aunroll_x_b;
    redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_valid_in_bitsignaltemp <= redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_valid_in(0);
    redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_stall_in_bitsignaltemp <= redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_stall_in(0);
    redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_valid_out(0) <= redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_valid_out_bitsignaltemp;
    redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_stall_out(0) <= redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_stall_out_bitsignaltemp;
    theredist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 10,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_valid_in_bitsignaltemp,
        stall_in => redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_fc_B1_merge_reg_aunroll_x_b,
        valid_out => redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_valid_out_bitsignaltemp,
        stall_out => redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_stall_out_bitsignaltemp,
        data_out => redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x(BLACKBOX,29)@1
    -- in in_i_stall@20000000
    -- out out_c0_exit11_0@11
    -- out out_c0_exit11_1@11
    -- out out_c0_exit11_2@11
    -- out out_o_stall@20000000
    -- out out_o_valid@11
    thei_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x : i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc
    PORT MAP (
        in_c0_eni3_0 => GND_q,
        in_c0_eni3_1 => bubble_select_fc_B1_merge_reg_aunroll_x_b,
        in_c0_eni3_2 => bubble_select_fc_B1_merge_reg_aunroll_x_d,
        in_c0_eni3_3 => bubble_select_fc_B1_merge_reg_aunroll_x_f,
        in_filter_weight => in_filter_weight,
        in_i_stall => SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_backStall,
        in_i_valid => SE_out_fc_B1_merge_reg_aunroll_x_V4,
        in_input_im => in_input_im,
        in_sizex => in_sizex,
        out_c0_exit11_1 => i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x_out_c0_exit11_1,
        out_c0_exit11_2 => i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x_out_c0_exit11_2,
        out_o_stall => i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_fc_B1_merge_reg_aunroll_x_4_reg(STALLFIFO,376)
    bubble_out_fc_B1_merge_reg_aunroll_x_4_reg_valid_in <= SE_out_fc_B1_merge_reg_aunroll_x_V3;
    bubble_out_fc_B1_merge_reg_aunroll_x_4_reg_stall_in <= SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_4_backStall;
    bubble_out_fc_B1_merge_reg_aunroll_x_4_reg_valid_in_bitsignaltemp <= bubble_out_fc_B1_merge_reg_aunroll_x_4_reg_valid_in(0);
    bubble_out_fc_B1_merge_reg_aunroll_x_4_reg_stall_in_bitsignaltemp <= bubble_out_fc_B1_merge_reg_aunroll_x_4_reg_stall_in(0);
    bubble_out_fc_B1_merge_reg_aunroll_x_4_reg_valid_out(0) <= bubble_out_fc_B1_merge_reg_aunroll_x_4_reg_valid_out_bitsignaltemp;
    bubble_out_fc_B1_merge_reg_aunroll_x_4_reg_stall_out(0) <= bubble_out_fc_B1_merge_reg_aunroll_x_4_reg_stall_out_bitsignaltemp;
    thebubble_out_fc_B1_merge_reg_aunroll_x_4_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 11,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_fc_B1_merge_reg_aunroll_x_4_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_fc_B1_merge_reg_aunroll_x_4_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_fc_B1_merge_reg_aunroll_x_4_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_fc_B1_merge_reg_aunroll_x_4_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_fc_B1_merge_reg_aunroll_x_3_reg(STALLFIFO,375)
    bubble_out_fc_B1_merge_reg_aunroll_x_3_reg_valid_in <= SE_out_fc_B1_merge_reg_aunroll_x_V2;
    bubble_out_fc_B1_merge_reg_aunroll_x_3_reg_stall_in <= SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_3_backStall;
    bubble_out_fc_B1_merge_reg_aunroll_x_3_reg_valid_in_bitsignaltemp <= bubble_out_fc_B1_merge_reg_aunroll_x_3_reg_valid_in(0);
    bubble_out_fc_B1_merge_reg_aunroll_x_3_reg_stall_in_bitsignaltemp <= bubble_out_fc_B1_merge_reg_aunroll_x_3_reg_stall_in(0);
    bubble_out_fc_B1_merge_reg_aunroll_x_3_reg_valid_out(0) <= bubble_out_fc_B1_merge_reg_aunroll_x_3_reg_valid_out_bitsignaltemp;
    bubble_out_fc_B1_merge_reg_aunroll_x_3_reg_stall_out(0) <= bubble_out_fc_B1_merge_reg_aunroll_x_3_reg_stall_out_bitsignaltemp;
    thebubble_out_fc_B1_merge_reg_aunroll_x_3_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 10,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_fc_B1_merge_reg_aunroll_x_3_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_fc_B1_merge_reg_aunroll_x_3_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_fc_B1_merge_reg_aunroll_x_3_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_fc_B1_merge_reg_aunroll_x_3_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_fc_B1_merge_reg_aunroll_x_2_reg(STALLFIFO,374)
    bubble_out_fc_B1_merge_reg_aunroll_x_2_reg_valid_in <= SE_out_fc_B1_merge_reg_aunroll_x_V1;
    bubble_out_fc_B1_merge_reg_aunroll_x_2_reg_stall_in <= SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_2_backStall;
    bubble_out_fc_B1_merge_reg_aunroll_x_2_reg_valid_in_bitsignaltemp <= bubble_out_fc_B1_merge_reg_aunroll_x_2_reg_valid_in(0);
    bubble_out_fc_B1_merge_reg_aunroll_x_2_reg_stall_in_bitsignaltemp <= bubble_out_fc_B1_merge_reg_aunroll_x_2_reg_stall_in(0);
    bubble_out_fc_B1_merge_reg_aunroll_x_2_reg_valid_out(0) <= bubble_out_fc_B1_merge_reg_aunroll_x_2_reg_valid_out_bitsignaltemp;
    bubble_out_fc_B1_merge_reg_aunroll_x_2_reg_stall_out(0) <= bubble_out_fc_B1_merge_reg_aunroll_x_2_reg_stall_out_bitsignaltemp;
    thebubble_out_fc_B1_merge_reg_aunroll_x_2_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 10,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_fc_B1_merge_reg_aunroll_x_2_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_fc_B1_merge_reg_aunroll_x_2_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_fc_B1_merge_reg_aunroll_x_2_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_fc_B1_merge_reg_aunroll_x_2_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_fc_B1_merge_reg_aunroll_x_1_reg(STALLFIFO,373)
    bubble_out_fc_B1_merge_reg_aunroll_x_1_reg_valid_in <= SE_out_fc_B1_merge_reg_aunroll_x_V0;
    bubble_out_fc_B1_merge_reg_aunroll_x_1_reg_stall_in <= SE_out_bubble_out_fc_B1_merge_reg_aunroll_x_1_backStall;
    bubble_out_fc_B1_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp <= bubble_out_fc_B1_merge_reg_aunroll_x_1_reg_valid_in(0);
    bubble_out_fc_B1_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp <= bubble_out_fc_B1_merge_reg_aunroll_x_1_reg_stall_in(0);
    bubble_out_fc_B1_merge_reg_aunroll_x_1_reg_valid_out(0) <= bubble_out_fc_B1_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp;
    bubble_out_fc_B1_merge_reg_aunroll_x_1_reg_stall_out(0) <= bubble_out_fc_B1_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp;
    thebubble_out_fc_B1_merge_reg_aunroll_x_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 10,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_fc_B1_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_fc_B1_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_fc_B1_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_fc_B1_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_fc_B1_merge_reg_aunroll_x(STALLENABLE,197)
    SE_out_fc_B1_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_fc_B1_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_fc_B1_merge_reg_aunroll_x_fromReg1 <= (others => '0');
            SE_out_fc_B1_merge_reg_aunroll_x_fromReg2 <= (others => '0');
            SE_out_fc_B1_merge_reg_aunroll_x_fromReg3 <= (others => '0');
            SE_out_fc_B1_merge_reg_aunroll_x_fromReg4 <= (others => '0');
            SE_out_fc_B1_merge_reg_aunroll_x_fromReg5 <= (others => '0');
            SE_out_fc_B1_merge_reg_aunroll_x_fromReg6 <= (others => '0');
            SE_out_fc_B1_merge_reg_aunroll_x_fromReg7 <= (others => '0');
            SE_out_fc_B1_merge_reg_aunroll_x_fromReg8 <= (others => '0');
            SE_out_fc_B1_merge_reg_aunroll_x_fromReg9 <= (others => '0');
            SE_out_fc_B1_merge_reg_aunroll_x_fromReg10 <= (others => '0');
            SE_out_fc_B1_merge_reg_aunroll_x_fromReg11 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_fc_B1_merge_reg_aunroll_x_fromReg0 <= SE_out_fc_B1_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_fc_B1_merge_reg_aunroll_x_fromReg1 <= SE_out_fc_B1_merge_reg_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_fc_B1_merge_reg_aunroll_x_fromReg2 <= SE_out_fc_B1_merge_reg_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_fc_B1_merge_reg_aunroll_x_fromReg3 <= SE_out_fc_B1_merge_reg_aunroll_x_toReg3;
            -- Succesor 4
            SE_out_fc_B1_merge_reg_aunroll_x_fromReg4 <= SE_out_fc_B1_merge_reg_aunroll_x_toReg4;
            -- Succesor 5
            SE_out_fc_B1_merge_reg_aunroll_x_fromReg5 <= SE_out_fc_B1_merge_reg_aunroll_x_toReg5;
            -- Succesor 6
            SE_out_fc_B1_merge_reg_aunroll_x_fromReg6 <= SE_out_fc_B1_merge_reg_aunroll_x_toReg6;
            -- Succesor 7
            SE_out_fc_B1_merge_reg_aunroll_x_fromReg7 <= SE_out_fc_B1_merge_reg_aunroll_x_toReg7;
            -- Succesor 8
            SE_out_fc_B1_merge_reg_aunroll_x_fromReg8 <= SE_out_fc_B1_merge_reg_aunroll_x_toReg8;
            -- Succesor 9
            SE_out_fc_B1_merge_reg_aunroll_x_fromReg9 <= SE_out_fc_B1_merge_reg_aunroll_x_toReg9;
            -- Succesor 10
            SE_out_fc_B1_merge_reg_aunroll_x_fromReg10 <= SE_out_fc_B1_merge_reg_aunroll_x_toReg10;
            -- Succesor 11
            SE_out_fc_B1_merge_reg_aunroll_x_fromReg11 <= SE_out_fc_B1_merge_reg_aunroll_x_toReg11;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_fc_B1_merge_reg_aunroll_x_consumed0 <= (not (bubble_out_fc_B1_merge_reg_aunroll_x_1_reg_stall_out) and SE_out_fc_B1_merge_reg_aunroll_x_wireValid) or SE_out_fc_B1_merge_reg_aunroll_x_fromReg0;
    SE_out_fc_B1_merge_reg_aunroll_x_consumed1 <= (not (bubble_out_fc_B1_merge_reg_aunroll_x_2_reg_stall_out) and SE_out_fc_B1_merge_reg_aunroll_x_wireValid) or SE_out_fc_B1_merge_reg_aunroll_x_fromReg1;
    SE_out_fc_B1_merge_reg_aunroll_x_consumed2 <= (not (bubble_out_fc_B1_merge_reg_aunroll_x_3_reg_stall_out) and SE_out_fc_B1_merge_reg_aunroll_x_wireValid) or SE_out_fc_B1_merge_reg_aunroll_x_fromReg2;
    SE_out_fc_B1_merge_reg_aunroll_x_consumed3 <= (not (bubble_out_fc_B1_merge_reg_aunroll_x_4_reg_stall_out) and SE_out_fc_B1_merge_reg_aunroll_x_wireValid) or SE_out_fc_B1_merge_reg_aunroll_x_fromReg3;
    SE_out_fc_B1_merge_reg_aunroll_x_consumed4 <= (not (i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x_out_o_stall) and SE_out_fc_B1_merge_reg_aunroll_x_wireValid) or SE_out_fc_B1_merge_reg_aunroll_x_fromReg4;
    SE_out_fc_B1_merge_reg_aunroll_x_consumed5 <= (not (redist7_fc_B1_merge_reg_aunroll_x_out_data_out_0_9_fifo_stall_out) and SE_out_fc_B1_merge_reg_aunroll_x_wireValid) or SE_out_fc_B1_merge_reg_aunroll_x_fromReg5;
    SE_out_fc_B1_merge_reg_aunroll_x_consumed6 <= (not (redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_stall_out) and SE_out_fc_B1_merge_reg_aunroll_x_wireValid) or SE_out_fc_B1_merge_reg_aunroll_x_fromReg6;
    SE_out_fc_B1_merge_reg_aunroll_x_consumed7 <= (not (redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_stall_out) and SE_out_fc_B1_merge_reg_aunroll_x_wireValid) or SE_out_fc_B1_merge_reg_aunroll_x_fromReg7;
    SE_out_fc_B1_merge_reg_aunroll_x_consumed8 <= (not (redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_stall_out) and SE_out_fc_B1_merge_reg_aunroll_x_wireValid) or SE_out_fc_B1_merge_reg_aunroll_x_fromReg8;
    SE_out_fc_B1_merge_reg_aunroll_x_consumed9 <= (not (redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_stall_out) and SE_out_fc_B1_merge_reg_aunroll_x_wireValid) or SE_out_fc_B1_merge_reg_aunroll_x_fromReg9;
    SE_out_fc_B1_merge_reg_aunroll_x_consumed10 <= (not (redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_stall_out) and SE_out_fc_B1_merge_reg_aunroll_x_wireValid) or SE_out_fc_B1_merge_reg_aunroll_x_fromReg10;
    SE_out_fc_B1_merge_reg_aunroll_x_consumed11 <= (not (redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_stall_out) and SE_out_fc_B1_merge_reg_aunroll_x_wireValid) or SE_out_fc_B1_merge_reg_aunroll_x_fromReg11;
    -- Consuming
    SE_out_fc_B1_merge_reg_aunroll_x_StallValid <= SE_out_fc_B1_merge_reg_aunroll_x_backStall and SE_out_fc_B1_merge_reg_aunroll_x_wireValid;
    SE_out_fc_B1_merge_reg_aunroll_x_toReg0 <= SE_out_fc_B1_merge_reg_aunroll_x_StallValid and SE_out_fc_B1_merge_reg_aunroll_x_consumed0;
    SE_out_fc_B1_merge_reg_aunroll_x_toReg1 <= SE_out_fc_B1_merge_reg_aunroll_x_StallValid and SE_out_fc_B1_merge_reg_aunroll_x_consumed1;
    SE_out_fc_B1_merge_reg_aunroll_x_toReg2 <= SE_out_fc_B1_merge_reg_aunroll_x_StallValid and SE_out_fc_B1_merge_reg_aunroll_x_consumed2;
    SE_out_fc_B1_merge_reg_aunroll_x_toReg3 <= SE_out_fc_B1_merge_reg_aunroll_x_StallValid and SE_out_fc_B1_merge_reg_aunroll_x_consumed3;
    SE_out_fc_B1_merge_reg_aunroll_x_toReg4 <= SE_out_fc_B1_merge_reg_aunroll_x_StallValid and SE_out_fc_B1_merge_reg_aunroll_x_consumed4;
    SE_out_fc_B1_merge_reg_aunroll_x_toReg5 <= SE_out_fc_B1_merge_reg_aunroll_x_StallValid and SE_out_fc_B1_merge_reg_aunroll_x_consumed5;
    SE_out_fc_B1_merge_reg_aunroll_x_toReg6 <= SE_out_fc_B1_merge_reg_aunroll_x_StallValid and SE_out_fc_B1_merge_reg_aunroll_x_consumed6;
    SE_out_fc_B1_merge_reg_aunroll_x_toReg7 <= SE_out_fc_B1_merge_reg_aunroll_x_StallValid and SE_out_fc_B1_merge_reg_aunroll_x_consumed7;
    SE_out_fc_B1_merge_reg_aunroll_x_toReg8 <= SE_out_fc_B1_merge_reg_aunroll_x_StallValid and SE_out_fc_B1_merge_reg_aunroll_x_consumed8;
    SE_out_fc_B1_merge_reg_aunroll_x_toReg9 <= SE_out_fc_B1_merge_reg_aunroll_x_StallValid and SE_out_fc_B1_merge_reg_aunroll_x_consumed9;
    SE_out_fc_B1_merge_reg_aunroll_x_toReg10 <= SE_out_fc_B1_merge_reg_aunroll_x_StallValid and SE_out_fc_B1_merge_reg_aunroll_x_consumed10;
    SE_out_fc_B1_merge_reg_aunroll_x_toReg11 <= SE_out_fc_B1_merge_reg_aunroll_x_StallValid and SE_out_fc_B1_merge_reg_aunroll_x_consumed11;
    -- Backward Stall generation
    SE_out_fc_B1_merge_reg_aunroll_x_or0 <= SE_out_fc_B1_merge_reg_aunroll_x_consumed0;
    SE_out_fc_B1_merge_reg_aunroll_x_or1 <= SE_out_fc_B1_merge_reg_aunroll_x_consumed1 and SE_out_fc_B1_merge_reg_aunroll_x_or0;
    SE_out_fc_B1_merge_reg_aunroll_x_or2 <= SE_out_fc_B1_merge_reg_aunroll_x_consumed2 and SE_out_fc_B1_merge_reg_aunroll_x_or1;
    SE_out_fc_B1_merge_reg_aunroll_x_or3 <= SE_out_fc_B1_merge_reg_aunroll_x_consumed3 and SE_out_fc_B1_merge_reg_aunroll_x_or2;
    SE_out_fc_B1_merge_reg_aunroll_x_or4 <= SE_out_fc_B1_merge_reg_aunroll_x_consumed4 and SE_out_fc_B1_merge_reg_aunroll_x_or3;
    SE_out_fc_B1_merge_reg_aunroll_x_or5 <= SE_out_fc_B1_merge_reg_aunroll_x_consumed5 and SE_out_fc_B1_merge_reg_aunroll_x_or4;
    SE_out_fc_B1_merge_reg_aunroll_x_or6 <= SE_out_fc_B1_merge_reg_aunroll_x_consumed6 and SE_out_fc_B1_merge_reg_aunroll_x_or5;
    SE_out_fc_B1_merge_reg_aunroll_x_or7 <= SE_out_fc_B1_merge_reg_aunroll_x_consumed7 and SE_out_fc_B1_merge_reg_aunroll_x_or6;
    SE_out_fc_B1_merge_reg_aunroll_x_or8 <= SE_out_fc_B1_merge_reg_aunroll_x_consumed8 and SE_out_fc_B1_merge_reg_aunroll_x_or7;
    SE_out_fc_B1_merge_reg_aunroll_x_or9 <= SE_out_fc_B1_merge_reg_aunroll_x_consumed9 and SE_out_fc_B1_merge_reg_aunroll_x_or8;
    SE_out_fc_B1_merge_reg_aunroll_x_or10 <= SE_out_fc_B1_merge_reg_aunroll_x_consumed10 and SE_out_fc_B1_merge_reg_aunroll_x_or9;
    SE_out_fc_B1_merge_reg_aunroll_x_wireStall <= not (SE_out_fc_B1_merge_reg_aunroll_x_consumed11 and SE_out_fc_B1_merge_reg_aunroll_x_or10);
    SE_out_fc_B1_merge_reg_aunroll_x_backStall <= SE_out_fc_B1_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_fc_B1_merge_reg_aunroll_x_V0 <= SE_out_fc_B1_merge_reg_aunroll_x_wireValid and not (SE_out_fc_B1_merge_reg_aunroll_x_fromReg0);
    SE_out_fc_B1_merge_reg_aunroll_x_V1 <= SE_out_fc_B1_merge_reg_aunroll_x_wireValid and not (SE_out_fc_B1_merge_reg_aunroll_x_fromReg1);
    SE_out_fc_B1_merge_reg_aunroll_x_V2 <= SE_out_fc_B1_merge_reg_aunroll_x_wireValid and not (SE_out_fc_B1_merge_reg_aunroll_x_fromReg2);
    SE_out_fc_B1_merge_reg_aunroll_x_V3 <= SE_out_fc_B1_merge_reg_aunroll_x_wireValid and not (SE_out_fc_B1_merge_reg_aunroll_x_fromReg3);
    SE_out_fc_B1_merge_reg_aunroll_x_V4 <= SE_out_fc_B1_merge_reg_aunroll_x_wireValid and not (SE_out_fc_B1_merge_reg_aunroll_x_fromReg4);
    SE_out_fc_B1_merge_reg_aunroll_x_V5 <= SE_out_fc_B1_merge_reg_aunroll_x_wireValid and not (SE_out_fc_B1_merge_reg_aunroll_x_fromReg5);
    SE_out_fc_B1_merge_reg_aunroll_x_V6 <= SE_out_fc_B1_merge_reg_aunroll_x_wireValid and not (SE_out_fc_B1_merge_reg_aunroll_x_fromReg6);
    SE_out_fc_B1_merge_reg_aunroll_x_V7 <= SE_out_fc_B1_merge_reg_aunroll_x_wireValid and not (SE_out_fc_B1_merge_reg_aunroll_x_fromReg7);
    SE_out_fc_B1_merge_reg_aunroll_x_V8 <= SE_out_fc_B1_merge_reg_aunroll_x_wireValid and not (SE_out_fc_B1_merge_reg_aunroll_x_fromReg8);
    SE_out_fc_B1_merge_reg_aunroll_x_V9 <= SE_out_fc_B1_merge_reg_aunroll_x_wireValid and not (SE_out_fc_B1_merge_reg_aunroll_x_fromReg9);
    SE_out_fc_B1_merge_reg_aunroll_x_V10 <= SE_out_fc_B1_merge_reg_aunroll_x_wireValid and not (SE_out_fc_B1_merge_reg_aunroll_x_fromReg10);
    SE_out_fc_B1_merge_reg_aunroll_x_V11 <= SE_out_fc_B1_merge_reg_aunroll_x_wireValid and not (SE_out_fc_B1_merge_reg_aunroll_x_fromReg11);
    -- Computing multiple Valid(s)
    SE_out_fc_B1_merge_reg_aunroll_x_wireValid <= fc_B1_merge_reg_aunroll_x_out_valid_out;

    -- redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo(STALLFIFO,107)
    redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_valid_in <= SE_out_fc_B1_merge_reg_aunroll_x_V7;
    redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_stall_in <= SE_out_redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_backStall;
    redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_data_in <= bubble_select_fc_B1_merge_reg_aunroll_x_d;
    redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_valid_in_bitsignaltemp <= redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_valid_in(0);
    redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_stall_in_bitsignaltemp <= redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_stall_in(0);
    redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_valid_out(0) <= redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_valid_out_bitsignaltemp;
    redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_stall_out(0) <= redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_stall_out_bitsignaltemp;
    theredist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 9,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_valid_in_bitsignaltemp,
        stall_in => redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_fc_B1_merge_reg_aunroll_x_d,
        valid_out => redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_valid_out_bitsignaltemp,
        stall_out => redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_stall_out_bitsignaltemp,
        data_out => redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo(BITJOIN,177)
    bubble_join_redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_q <= redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_data_out;

    -- bubble_select_redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo(BITSELECT,178)
    bubble_select_redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_q(31 downto 0));

    -- i_inc_fc(ADD,51)@9
    i_inc_fc_a <= STD_LOGIC_VECTOR("0" & bubble_select_redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_b);
    i_inc_fc_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc_fc_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc_fc_a) + UNSIGNED(i_inc_fc_b));
    i_inc_fc_q <= i_inc_fc_o(32 downto 0);

    -- bgTrunc_i_inc_fc_sel_x(BITSELECT,3)@9
    bgTrunc_i_inc_fc_sel_x_b <= i_inc_fc_q(31 downto 0);

    -- redist15_bgTrunc_i_inc_fc_sel_x_b_1_0(REG,112)
    redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_backEN = "1") THEN
                redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(bgTrunc_i_inc_fc_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0(STALLENABLE,259)
    -- Valid signal propagation
    SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_V0 <= SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_R_v_0;
    SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_V1 <= SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_R_v_1;
    -- Stall signal propagation
    SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_s_tv_0 <= SR_SE_i_exitcond_fc_backStall and SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_R_v_0;
    SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_s_tv_1 <= redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_stall_out and SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_R_v_1;
    -- Backward Enable generation
    SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_or0 <= SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_s_tv_0;
    SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_backEN <= not (SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_s_tv_1 or SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_or0);
    -- Determine whether to write valid data into the first register stage
    SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_v_s_0 <= SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_backEN and SE_out_redist10_fc_B1_merge_reg_aunroll_x_out_data_out_2_8_fifo_V0;
    -- Backward Stall generation
    SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_backStall <= not (SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_v_s_0);
    SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_R_v_0 <= (others => '0');
            SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_R_v_0 <= SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_R_v_0 and SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_R_v_0 <= SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_R_v_1 <= SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_R_v_1 and SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_s_tv_1;
            ELSE
                SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_R_v_1 <= SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo(STALLFIFO,113)
    redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_valid_in <= SE_redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_V1;
    redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_stall_in <= SE_out_redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_backStall;
    redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_data_in <= redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_q;
    redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_valid_in_bitsignaltemp <= redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_valid_in(0);
    redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_stall_in_bitsignaltemp <= redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_stall_in(0);
    redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_valid_out(0) <= redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_valid_out_bitsignaltemp;
    redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_stall_out(0) <= redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_stall_out_bitsignaltemp;
    theredist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 170,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_valid_in_bitsignaltemp,
        stall_in => redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_stall_in_bitsignaltemp,
        data_in => redist15_bgTrunc_i_inc_fc_sel_x_b_1_0_q,
        valid_out => redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_valid_out_bitsignaltemp,
        stall_out => redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_stall_out_bitsignaltemp,
        data_out => redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo(BITJOIN,192)
    bubble_join_redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_q <= redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_data_out;

    -- bubble_select_redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo(BITSELECT,193)
    bubble_select_redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_q(31 downto 0));

    -- bubble_join_redist0_i_unnamed_fc40_q_168_fifo(BITJOIN,153)
    bubble_join_redist0_i_unnamed_fc40_q_168_fifo_q <= redist0_i_unnamed_fc40_q_168_fifo_data_out;

    -- bubble_select_redist0_i_unnamed_fc40_q_168_fifo(BITSELECT,154)
    bubble_select_redist0_i_unnamed_fc40_q_168_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist0_i_unnamed_fc40_q_168_fifo_q(0 downto 0));

    -- SE_out_redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo(STALLENABLE,261)
    -- Valid signal propagation
    SE_out_redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_V0 <= SE_out_redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_backStall <= SR_SE_i_j_13_lc_innerphi_fc_backStall or not (SE_out_redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_wireValid <= redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_valid_out;

    -- SR_SE_i_j_13_lc_innerphi_fc(STALLREG,385)
    SR_SE_i_j_13_lc_innerphi_fc_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_j_13_lc_innerphi_fc_r_valid <= (others => '0');
            SR_SE_i_j_13_lc_innerphi_fc_r_data0 <= (others => '-');
            SR_SE_i_j_13_lc_innerphi_fc_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_j_13_lc_innerphi_fc_r_valid <= SE_i_j_13_lc_innerphi_fc_backStall and (SR_SE_i_j_13_lc_innerphi_fc_r_valid or SR_SE_i_j_13_lc_innerphi_fc_i_valid);

            IF (SR_SE_i_j_13_lc_innerphi_fc_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_j_13_lc_innerphi_fc_r_data0 <= bubble_select_redist0_i_unnamed_fc40_q_168_fifo_b;
                SR_SE_i_j_13_lc_innerphi_fc_r_data1 <= bubble_select_redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_b;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_j_13_lc_innerphi_fc_and0 <= SE_out_redist0_i_unnamed_fc40_q_168_fifo_V1;
    SR_SE_i_j_13_lc_innerphi_fc_i_valid <= SE_out_redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_V0 and SR_SE_i_j_13_lc_innerphi_fc_and0;
    -- Stall signal propagation
    SR_SE_i_j_13_lc_innerphi_fc_backStall <= SR_SE_i_j_13_lc_innerphi_fc_r_valid or not (SR_SE_i_j_13_lc_innerphi_fc_i_valid);

    -- Valid
    SR_SE_i_j_13_lc_innerphi_fc_V <= SR_SE_i_j_13_lc_innerphi_fc_r_valid WHEN SR_SE_i_j_13_lc_innerphi_fc_r_valid = "1" ELSE SR_SE_i_j_13_lc_innerphi_fc_i_valid;

    -- Data0
    SR_SE_i_j_13_lc_innerphi_fc_D0 <= SR_SE_i_j_13_lc_innerphi_fc_r_data0 WHEN SR_SE_i_j_13_lc_innerphi_fc_r_valid = "1" ELSE bubble_select_redist0_i_unnamed_fc40_q_168_fifo_b;
    -- Data1
    SR_SE_i_j_13_lc_innerphi_fc_D1 <= SR_SE_i_j_13_lc_innerphi_fc_r_data1 WHEN SR_SE_i_j_13_lc_innerphi_fc_r_valid = "1" ELSE bubble_select_redist16_bgTrunc_i_inc_fc_sel_x_b_170_fifo_b;

    -- i_j_13_lc_innerphi_fc(MUX,52)@179 + 1
    i_j_13_lc_innerphi_fc_s <= SR_SE_i_j_13_lc_innerphi_fc_D0;
    i_j_13_lc_innerphi_fc_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_j_13_lc_innerphi_fc_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_j_13_lc_innerphi_fc_backEN = "1") THEN
                CASE (i_j_13_lc_innerphi_fc_s) IS
                    WHEN "0" => i_j_13_lc_innerphi_fc_q <= SR_SE_i_j_13_lc_innerphi_fc_D1;
                    WHEN "1" => i_j_13_lc_innerphi_fc_q <= c_i32_0gr_q;
                    WHEN OTHERS => i_j_13_lc_innerphi_fc_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- SE_i_j_13_lc_innerphi_fc(STALLENABLE,213)
    -- Valid signal propagation
    SE_i_j_13_lc_innerphi_fc_V0 <= SE_i_j_13_lc_innerphi_fc_R_v_0;
    -- Stall signal propagation
    SE_i_j_13_lc_innerphi_fc_s_tv_0 <= redist2_i_j_13_lc_innerphi_fc_q_26_fifo_stall_out and SE_i_j_13_lc_innerphi_fc_R_v_0;
    -- Backward Enable generation
    SE_i_j_13_lc_innerphi_fc_backEN <= not (SE_i_j_13_lc_innerphi_fc_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_j_13_lc_innerphi_fc_v_s_0 <= SE_i_j_13_lc_innerphi_fc_backEN and SR_SE_i_j_13_lc_innerphi_fc_V;
    -- Backward Stall generation
    SE_i_j_13_lc_innerphi_fc_backStall <= not (SE_i_j_13_lc_innerphi_fc_backEN);
    SE_i_j_13_lc_innerphi_fc_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_j_13_lc_innerphi_fc_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_j_13_lc_innerphi_fc_backEN = "0") THEN
                SE_i_j_13_lc_innerphi_fc_R_v_0 <= SE_i_j_13_lc_innerphi_fc_R_v_0 and SE_i_j_13_lc_innerphi_fc_s_tv_0;
            ELSE
                SE_i_j_13_lc_innerphi_fc_R_v_0 <= SE_i_j_13_lc_innerphi_fc_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- redist2_i_j_13_lc_innerphi_fc_q_26_fifo(STALLFIFO,99)
    redist2_i_j_13_lc_innerphi_fc_q_26_fifo_valid_in <= SE_i_j_13_lc_innerphi_fc_V0;
    redist2_i_j_13_lc_innerphi_fc_q_26_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_backStall;
    redist2_i_j_13_lc_innerphi_fc_q_26_fifo_data_in <= i_j_13_lc_innerphi_fc_q;
    redist2_i_j_13_lc_innerphi_fc_q_26_fifo_valid_in_bitsignaltemp <= redist2_i_j_13_lc_innerphi_fc_q_26_fifo_valid_in(0);
    redist2_i_j_13_lc_innerphi_fc_q_26_fifo_stall_in_bitsignaltemp <= redist2_i_j_13_lc_innerphi_fc_q_26_fifo_stall_in(0);
    redist2_i_j_13_lc_innerphi_fc_q_26_fifo_valid_out(0) <= redist2_i_j_13_lc_innerphi_fc_q_26_fifo_valid_out_bitsignaltemp;
    redist2_i_j_13_lc_innerphi_fc_q_26_fifo_stall_out(0) <= redist2_i_j_13_lc_innerphi_fc_q_26_fifo_stall_out_bitsignaltemp;
    theredist2_i_j_13_lc_innerphi_fc_q_26_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 26,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist2_i_j_13_lc_innerphi_fc_q_26_fifo_valid_in_bitsignaltemp,
        stall_in => redist2_i_j_13_lc_innerphi_fc_q_26_fifo_stall_in_bitsignaltemp,
        data_in => i_j_13_lc_innerphi_fc_q,
        valid_out => redist2_i_j_13_lc_innerphi_fc_q_26_fifo_valid_out_bitsignaltemp,
        stall_out => redist2_i_j_13_lc_innerphi_fc_q_26_fifo_stall_out_bitsignaltemp,
        data_out => redist2_i_j_13_lc_innerphi_fc_q_26_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- i_i_06_lc_outerphi_fc(MUX,49)@11 + 1
    i_i_06_lc_outerphi_fc_s <= SR_SE_i_i_06_lc_outerphi_fc_D0;
    i_i_06_lc_outerphi_fc_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_i_06_lc_outerphi_fc_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_i_06_lc_outerphi_fc_backEN = "1") THEN
                CASE (i_i_06_lc_outerphi_fc_s) IS
                    WHEN "0" => i_i_06_lc_outerphi_fc_q <= SR_SE_i_i_06_lc_outerphi_fc_D1;
                    WHEN "1" => i_i_06_lc_outerphi_fc_q <= SR_SE_i_i_06_lc_outerphi_fc_D2;
                    WHEN OTHERS => i_i_06_lc_outerphi_fc_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- redist3_i_i_06_lc_outerphi_fc_q_194_fifo(STALLFIFO,100)
    redist3_i_i_06_lc_outerphi_fc_q_194_fifo_valid_in <= SE_i_i_06_lc_outerphi_fc_V0;
    redist3_i_i_06_lc_outerphi_fc_q_194_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_backStall;
    redist3_i_i_06_lc_outerphi_fc_q_194_fifo_data_in <= i_i_06_lc_outerphi_fc_q;
    redist3_i_i_06_lc_outerphi_fc_q_194_fifo_valid_in_bitsignaltemp <= redist3_i_i_06_lc_outerphi_fc_q_194_fifo_valid_in(0);
    redist3_i_i_06_lc_outerphi_fc_q_194_fifo_stall_in_bitsignaltemp <= redist3_i_i_06_lc_outerphi_fc_q_194_fifo_stall_in(0);
    redist3_i_i_06_lc_outerphi_fc_q_194_fifo_valid_out(0) <= redist3_i_i_06_lc_outerphi_fc_q_194_fifo_valid_out_bitsignaltemp;
    redist3_i_i_06_lc_outerphi_fc_q_194_fifo_stall_out(0) <= redist3_i_i_06_lc_outerphi_fc_q_194_fifo_stall_out_bitsignaltemp;
    theredist3_i_i_06_lc_outerphi_fc_q_194_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 194,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist3_i_i_06_lc_outerphi_fc_q_194_fifo_valid_in_bitsignaltemp,
        stall_in => redist3_i_i_06_lc_outerphi_fc_q_194_fifo_stall_in_bitsignaltemp,
        data_in => i_i_06_lc_outerphi_fc_q,
        valid_out => redist3_i_i_06_lc_outerphi_fc_q_194_fifo_valid_out_bitsignaltemp,
        stall_out => redist3_i_i_06_lc_outerphi_fc_q_194_fifo_stall_out_bitsignaltemp,
        data_out => redist3_i_i_06_lc_outerphi_fc_q_194_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- i_for_end20_loopexit_loopexit_lc_cond_fc(LOGICAL,48)@179 + 1
    i_for_end20_loopexit_loopexit_lc_cond_fc_qi <= SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_D0 and SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_D1;
    i_for_end20_loopexit_loopexit_lc_cond_fc_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_for_end20_loopexit_loopexit_lc_cond_fc_qi, xout => i_for_end20_loopexit_loopexit_lc_cond_fc_q, ena => SE_i_for_end20_loopexit_loopexit_lc_cond_fc_backEN(0), clk => clock, aclr => resetn );

    -- redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo(STALLFIFO,101)
    redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_valid_in <= SE_i_for_end20_loopexit_loopexit_lc_cond_fc_V0;
    redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_backStall;
    redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_data_in <= i_for_end20_loopexit_loopexit_lc_cond_fc_q;
    redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_valid_in_bitsignaltemp <= redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_valid_in(0);
    redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_stall_in_bitsignaltemp <= redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_stall_in(0);
    redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_valid_out(0) <= redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_valid_out_bitsignaltemp;
    redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_stall_out(0) <= redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_stall_out_bitsignaltemp;
    theredist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 26,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_valid_in_bitsignaltemp,
        stall_in => redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_stall_in_bitsignaltemp,
        data_in => i_for_end20_loopexit_loopexit_lc_cond_fc_q,
        valid_out => redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_valid_out_bitsignaltemp,
        stall_out => redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_stall_out_bitsignaltemp,
        data_out => redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo(STALLFIFO,109)
    redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_valid_in <= SE_out_fc_B1_merge_reg_aunroll_x_V9;
    redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_backStall;
    redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_data_in <= bubble_select_fc_B1_merge_reg_aunroll_x_f;
    redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_valid_in_bitsignaltemp <= redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_valid_in(0);
    redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_stall_in_bitsignaltemp <= redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_stall_in(0);
    redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_valid_out(0) <= redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_valid_out_bitsignaltemp;
    redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_stall_out(0) <= redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_stall_out_bitsignaltemp;
    theredist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 205,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_valid_in_bitsignaltemp,
        stall_in => redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_fc_B1_merge_reg_aunroll_x_f,
        valid_out => redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_valid_out_bitsignaltemp,
        stall_out => redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_stall_out_bitsignaltemp,
        data_out => redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo(STALLFIFO,110)
    redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_valid_in <= SE_out_fc_B1_merge_reg_aunroll_x_V10;
    redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_backStall;
    redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_data_in <= bubble_select_fc_B1_merge_reg_aunroll_x_g;
    redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_valid_in_bitsignaltemp <= redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_valid_in(0);
    redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_stall_in_bitsignaltemp <= redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_stall_in(0);
    redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_valid_out(0) <= redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_valid_out_bitsignaltemp;
    redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_stall_out(0) <= redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_stall_out_bitsignaltemp;
    theredist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 205,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_valid_in_bitsignaltemp,
        stall_in => redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_fc_B1_merge_reg_aunroll_x_g,
        valid_out => redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_valid_out_bitsignaltemp,
        stall_out => redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_stall_out_bitsignaltemp,
        data_out => redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo(STALLFIFO,111)
    redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_valid_in <= SE_out_fc_B1_merge_reg_aunroll_x_V11;
    redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_backStall;
    redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_data_in <= bubble_select_fc_B1_merge_reg_aunroll_x_h;
    redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_valid_in_bitsignaltemp <= redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_valid_in(0);
    redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_stall_in_bitsignaltemp <= redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_stall_in(0);
    redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_valid_out(0) <= redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_valid_out_bitsignaltemp;
    redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_stall_out(0) <= redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_stall_out_bitsignaltemp;
    theredist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 205,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_valid_in_bitsignaltemp,
        stall_in => redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_fc_B1_merge_reg_aunroll_x_h,
        valid_out => redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_valid_out_bitsignaltemp,
        stall_out => redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_stall_out_bitsignaltemp,
        data_out => redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg(STALLFIFO,377)
    bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg_valid_in <= SE_out_i_syncbuf_sizex_sync_buffer3_fc_V0;
    bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg_stall_in <= SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_backStall;
    bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg_valid_in_bitsignaltemp <= bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg_valid_in(0);
    bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg_stall_in_bitsignaltemp <= bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg_stall_in(0);
    bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg_valid_out(0) <= bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg_valid_out_bitsignaltemp;
    bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg_stall_out(0) <= bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg_stall_out_bitsignaltemp;
    thebubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 195,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1(STALLENABLE,298)
    -- Valid signal propagation
    SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_V0 <= SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_backStall <= in_stall_in or not (SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_and0 <= bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_reg_valid_out;
    SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_and1 <= redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_valid_out and SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_and0;
    SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_and2 <= redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_valid_out and SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_and1;
    SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_and3 <= redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_valid_out and SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_and2;
    SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_and4 <= redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_valid_out and SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_and3;
    SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_and5 <= redist3_i_i_06_lc_outerphi_fc_q_194_fifo_valid_out and SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_and4;
    SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_and6 <= redist2_i_j_13_lc_innerphi_fc_q_26_fifo_valid_out and SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_and5;
    SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_wireValid <= i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x_out_o_valid and SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_and6;

    -- i_muxopt_fc(LOGICAL,55)@179
    i_muxopt_fc_q <= bubble_select_redist5_i_cmp61_rm_fc_c_169_fifo_b and bubble_select_redist0_i_unnamed_fc40_q_168_fifo_b;

    -- bubble_join_redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo(BITJOIN,174)
    bubble_join_redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_q <= redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_data_out;

    -- bubble_select_redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo(BITSELECT,175)
    bubble_select_redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_q(31 downto 0));

    -- bubble_join_redist5_i_cmp61_rm_fc_c_169_fifo(BITJOIN,168)
    bubble_join_redist5_i_cmp61_rm_fc_c_169_fifo_q <= redist5_i_cmp61_rm_fc_c_169_fifo_data_out;

    -- bubble_select_redist5_i_cmp61_rm_fc_c_169_fifo(BITSELECT,169)
    bubble_select_redist5_i_cmp61_rm_fc_c_169_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist5_i_cmp61_rm_fc_c_169_fifo_q(0 downto 0));

    -- bubble_join_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo(BITJOIN,180)
    bubble_join_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_q <= redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_data_out;

    -- bubble_select_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo(BITSELECT,181)
    bubble_select_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_q(31 downto 0));

    -- bubble_join_i_load_unnamed_fc3_fc(BITJOIN,133)
    bubble_join_i_load_unnamed_fc3_fc_q <= i_load_unnamed_fc3_fc_out_o_readdata;

    -- bubble_select_i_load_unnamed_fc3_fc(BITSELECT,134)
    bubble_select_i_load_unnamed_fc3_fc_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_fc3_fc_q(31 downto 0));

    -- bubble_join_i_load_unnamed_fc2_fc(BITJOIN,130)
    bubble_join_i_load_unnamed_fc2_fc_q <= i_load_unnamed_fc2_fc_out_o_readdata;

    -- bubble_select_i_load_unnamed_fc2_fc(BITSELECT,131)
    bubble_select_i_load_unnamed_fc2_fc_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_fc2_fc_q(31 downto 0));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x(BLACKBOX,30)@179
    -- in in_i_stall@20000000
    -- out out_c1_exit_0@205
    -- out out_c1_exit_1@205
    -- out out_c1_exit_2@205
    -- out out_o_stall@20000000
    -- out out_o_valid@205
    thei_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x : i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc
    PORT MAP (
        in_c1_eni6_0 => GND_q,
        in_c1_eni6_1 => bubble_select_i_load_unnamed_fc2_fc_b,
        in_c1_eni6_2 => bubble_select_i_load_unnamed_fc3_fc_b,
        in_c1_eni6_3 => bubble_select_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_b,
        in_c1_eni6_4 => bubble_select_redist5_i_cmp61_rm_fc_c_169_fifo_b,
        in_c1_eni6_5 => bubble_select_redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_b,
        in_c1_eni6_6 => i_muxopt_fc_q,
        in_i_stall => SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_backStall,
        in_i_valid => SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_V0,
        out_c1_exit_1 => i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x_out_c1_exit_1,
        out_c1_exit_2 => i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x_out_c1_exit_2,
        out_o_stall => i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist0_i_unnamed_fc40_q_168_fifo(STALLENABLE,232)
    SE_out_redist0_i_unnamed_fc40_q_168_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist0_i_unnamed_fc40_q_168_fifo_fromReg0 <= (others => '0');
            SE_out_redist0_i_unnamed_fc40_q_168_fifo_fromReg1 <= (others => '0');
            SE_out_redist0_i_unnamed_fc40_q_168_fifo_fromReg2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist0_i_unnamed_fc40_q_168_fifo_fromReg0 <= SE_out_redist0_i_unnamed_fc40_q_168_fifo_toReg0;
            -- Succesor 1
            SE_out_redist0_i_unnamed_fc40_q_168_fifo_fromReg1 <= SE_out_redist0_i_unnamed_fc40_q_168_fifo_toReg1;
            -- Succesor 2
            SE_out_redist0_i_unnamed_fc40_q_168_fifo_fromReg2 <= SE_out_redist0_i_unnamed_fc40_q_168_fifo_toReg2;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist0_i_unnamed_fc40_q_168_fifo_consumed0 <= (not (SR_SE_i_for_end20_loopexit_loopexit_lc_cond_fc_backStall) and SE_out_redist0_i_unnamed_fc40_q_168_fifo_wireValid) or SE_out_redist0_i_unnamed_fc40_q_168_fifo_fromReg0;
    SE_out_redist0_i_unnamed_fc40_q_168_fifo_consumed1 <= (not (SR_SE_i_j_13_lc_innerphi_fc_backStall) and SE_out_redist0_i_unnamed_fc40_q_168_fifo_wireValid) or SE_out_redist0_i_unnamed_fc40_q_168_fifo_fromReg1;
    SE_out_redist0_i_unnamed_fc40_q_168_fifo_consumed2 <= (not (SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_backStall) and SE_out_redist0_i_unnamed_fc40_q_168_fifo_wireValid) or SE_out_redist0_i_unnamed_fc40_q_168_fifo_fromReg2;
    -- Consuming
    SE_out_redist0_i_unnamed_fc40_q_168_fifo_StallValid <= SE_out_redist0_i_unnamed_fc40_q_168_fifo_backStall and SE_out_redist0_i_unnamed_fc40_q_168_fifo_wireValid;
    SE_out_redist0_i_unnamed_fc40_q_168_fifo_toReg0 <= SE_out_redist0_i_unnamed_fc40_q_168_fifo_StallValid and SE_out_redist0_i_unnamed_fc40_q_168_fifo_consumed0;
    SE_out_redist0_i_unnamed_fc40_q_168_fifo_toReg1 <= SE_out_redist0_i_unnamed_fc40_q_168_fifo_StallValid and SE_out_redist0_i_unnamed_fc40_q_168_fifo_consumed1;
    SE_out_redist0_i_unnamed_fc40_q_168_fifo_toReg2 <= SE_out_redist0_i_unnamed_fc40_q_168_fifo_StallValid and SE_out_redist0_i_unnamed_fc40_q_168_fifo_consumed2;
    -- Backward Stall generation
    SE_out_redist0_i_unnamed_fc40_q_168_fifo_or0 <= SE_out_redist0_i_unnamed_fc40_q_168_fifo_consumed0;
    SE_out_redist0_i_unnamed_fc40_q_168_fifo_or1 <= SE_out_redist0_i_unnamed_fc40_q_168_fifo_consumed1 and SE_out_redist0_i_unnamed_fc40_q_168_fifo_or0;
    SE_out_redist0_i_unnamed_fc40_q_168_fifo_wireStall <= not (SE_out_redist0_i_unnamed_fc40_q_168_fifo_consumed2 and SE_out_redist0_i_unnamed_fc40_q_168_fifo_or1);
    SE_out_redist0_i_unnamed_fc40_q_168_fifo_backStall <= SE_out_redist0_i_unnamed_fc40_q_168_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist0_i_unnamed_fc40_q_168_fifo_V0 <= SE_out_redist0_i_unnamed_fc40_q_168_fifo_wireValid and not (SE_out_redist0_i_unnamed_fc40_q_168_fifo_fromReg0);
    SE_out_redist0_i_unnamed_fc40_q_168_fifo_V1 <= SE_out_redist0_i_unnamed_fc40_q_168_fifo_wireValid and not (SE_out_redist0_i_unnamed_fc40_q_168_fifo_fromReg1);
    SE_out_redist0_i_unnamed_fc40_q_168_fifo_V2 <= SE_out_redist0_i_unnamed_fc40_q_168_fifo_wireValid and not (SE_out_redist0_i_unnamed_fc40_q_168_fifo_fromReg2);
    -- Computing multiple Valid(s)
    SE_out_redist0_i_unnamed_fc40_q_168_fifo_wireValid <= redist0_i_unnamed_fc40_q_168_fifo_valid_out;

    -- redist5_i_cmp61_rm_fc_c_169_fifo(STALLFIFO,102)
    redist5_i_cmp61_rm_fc_c_169_fifo_valid_in <= SE_i_cmp61_rm_fc_V2;
    redist5_i_cmp61_rm_fc_c_169_fifo_stall_in <= SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_backStall;
    redist5_i_cmp61_rm_fc_c_169_fifo_data_in <= i_cmp61_rm_fc_c;
    redist5_i_cmp61_rm_fc_c_169_fifo_valid_in_bitsignaltemp <= redist5_i_cmp61_rm_fc_c_169_fifo_valid_in(0);
    redist5_i_cmp61_rm_fc_c_169_fifo_stall_in_bitsignaltemp <= redist5_i_cmp61_rm_fc_c_169_fifo_stall_in(0);
    redist5_i_cmp61_rm_fc_c_169_fifo_valid_out(0) <= redist5_i_cmp61_rm_fc_c_169_fifo_valid_out_bitsignaltemp;
    redist5_i_cmp61_rm_fc_c_169_fifo_stall_out(0) <= redist5_i_cmp61_rm_fc_c_169_fifo_stall_out_bitsignaltemp;
    theredist5_i_cmp61_rm_fc_c_169_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 169,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist5_i_cmp61_rm_fc_c_169_fifo_valid_in_bitsignaltemp,
        stall_in => redist5_i_cmp61_rm_fc_c_169_fifo_stall_in_bitsignaltemp,
        data_in => i_cmp61_rm_fc_c,
        valid_out => redist5_i_cmp61_rm_fc_c_169_fifo_valid_out_bitsignaltemp,
        stall_out => redist5_i_cmp61_rm_fc_c_169_fifo_stall_out_bitsignaltemp,
        data_out => redist5_i_cmp61_rm_fc_c_169_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo(STALLFIFO,106)
    redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_valid_in <= SE_out_fc_B1_merge_reg_aunroll_x_V6;
    redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_stall_in <= SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_backStall;
    redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_data_in <= bubble_select_fc_B1_merge_reg_aunroll_x_c;
    redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_valid_in_bitsignaltemp <= redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_valid_in(0);
    redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_stall_in_bitsignaltemp <= redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_stall_in(0);
    redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_valid_out(0) <= redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_valid_out_bitsignaltemp;
    redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_stall_out(0) <= redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_stall_out_bitsignaltemp;
    theredist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 179,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_valid_in_bitsignaltemp,
        stall_in => redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_fc_B1_merge_reg_aunroll_x_c,
        valid_out => redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_valid_out_bitsignaltemp,
        stall_out => redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_stall_out_bitsignaltemp,
        data_out => redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo(STALLFIFO,108)
    redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_valid_in <= SE_out_fc_B1_merge_reg_aunroll_x_V8;
    redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_stall_in <= SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_backStall;
    redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_data_in <= bubble_select_fc_B1_merge_reg_aunroll_x_e;
    redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_valid_in_bitsignaltemp <= redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_valid_in(0);
    redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_stall_in_bitsignaltemp <= redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_stall_in(0);
    redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_valid_out(0) <= redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_valid_out_bitsignaltemp;
    redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_stall_out(0) <= redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_stall_out_bitsignaltemp;
    theredist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 179,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_valid_in_bitsignaltemp,
        stall_in => redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_fc_B1_merge_reg_aunroll_x_e,
        valid_out => redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_valid_out_bitsignaltemp,
        stall_out => redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_stall_out_bitsignaltemp,
        data_out => redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo(STALLENABLE,252)
    -- Valid signal propagation
    SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_V0 <= SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_backStall <= i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x_out_o_stall or not (SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_and0 <= redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_valid_out;
    SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_and1 <= redist9_fc_B1_merge_reg_aunroll_x_out_data_out_1_178_fifo_valid_out and SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_and0;
    SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_and2 <= redist5_i_cmp61_rm_fc_c_169_fifo_valid_out and SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_and1;
    SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_and3 <= i_load_unnamed_fc3_fc_out_o_valid and SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_and2;
    SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_and4 <= i_load_unnamed_fc2_fc_out_o_valid and SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_and3;
    SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_wireValid <= SE_out_redist0_i_unnamed_fc40_q_168_fifo_V2 and SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_and4;

    -- i_cmp4_phi_decision15_xor_or_rm_fc(LOGICAL,41)@11
    i_cmp4_phi_decision15_xor_or_rm_fc_q <= i_cmp4_phi_decision15_xor_rm_fc_c or i_cmp61_neg_rm_fc_q;

    -- bubble_join_i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x(BITJOIN,123)
    bubble_join_i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x_q <= i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x_out_c0_exit11_2 & i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x_out_c0_exit11_1;

    -- bubble_select_i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x(BITSELECT,124)
    bubble_select_i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x_q(63 downto 0));
    bubble_select_i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x_q(127 downto 64));

    -- SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc(STALLREG,386)
    SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_valid <= (others => '0');
            SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_data0 <= (others => '-');
            SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_data1 <= (others => '-');
            SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_data2 <= (others => '-');
            SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_data3 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_valid <= SE_i_cmp4_phi_decision15_xor_or_rm_fc_backStall and (SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_valid or SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_i_valid);

            IF (SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_data0 <= bubble_select_i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x_b;
                SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_data1 <= i_cmp4_phi_decision15_xor_or_rm_fc_q;
                SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_data2 <= i_cmp4_phi_decision15_xor_or_rm_fc_q;
                SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_data3 <= bubble_select_i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x_c;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_and0 <= SE_i_cmp4_phi_decision15_xor_rm_fc_V0;
    SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_and1 <= SE_i_cmp61_rm_fc_V0 and SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_and0;
    SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_i_valid <= i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x_out_o_valid and SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_and1;
    -- Stall signal propagation
    SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_backStall <= SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_valid or not (SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_i_valid);

    -- Valid
    SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_V <= SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_valid WHEN SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_valid = "1" ELSE SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_i_valid;

    -- Data0
    SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_D0 <= SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_data0 WHEN SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_valid = "1" ELSE bubble_select_i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x_b;
    -- Data1
    SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_D1 <= SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_data1 WHEN SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_valid = "1" ELSE i_cmp4_phi_decision15_xor_or_rm_fc_q;
    -- Data2
    SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_D2 <= SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_data2 WHEN SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_valid = "1" ELSE i_cmp4_phi_decision15_xor_or_rm_fc_q;
    -- Data3
    SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_D3 <= SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_data3 WHEN SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_r_valid = "1" ELSE bubble_select_i_sfc_c0_for_cond5_preheader_fc_c0_enter8_fc_aunroll_x_c;

    -- i_load_unnamed_fc3_fc(BLACKBOX,54)@11
    -- in in_i_stall@20000000
    -- out out_o_readdata@179
    -- out out_o_stall@20000000
    -- out out_o_valid@179
    -- out out_unnamed_fc3_avm_address@20000000
    -- out out_unnamed_fc3_avm_burstcount@20000000
    -- out out_unnamed_fc3_avm_byteenable@20000000
    -- out out_unnamed_fc3_avm_enable@20000000
    -- out out_unnamed_fc3_avm_read@20000000
    -- out out_unnamed_fc3_avm_write@20000000
    -- out out_unnamed_fc3_avm_writedata@20000000
    thei_load_unnamed_fc3_fc : i_load_unnamed_fc3_fc38
    PORT MAP (
        in_flush => in_flush,
        in_i_address => SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_D3,
        in_i_predicate => SR_SE_i_cmp4_phi_decision15_xor_or_rm_fc_D2,
        in_i_stall => SE_out_redist11_fc_B1_merge_reg_aunroll_x_out_data_out_3_178_fifo_backStall,
        in_i_valid => SE_i_cmp4_phi_decision15_xor_or_rm_fc_V1,
        in_unnamed_fc3_avm_readdata => in_unnamed_fc3_avm_readdata,
        in_unnamed_fc3_avm_readdatavalid => in_unnamed_fc3_avm_readdatavalid,
        in_unnamed_fc3_avm_waitrequest => in_unnamed_fc3_avm_waitrequest,
        in_unnamed_fc3_avm_writeack => in_unnamed_fc3_avm_writeack,
        out_o_readdata => i_load_unnamed_fc3_fc_out_o_readdata,
        out_o_stall => i_load_unnamed_fc3_fc_out_o_stall,
        out_o_valid => i_load_unnamed_fc3_fc_out_o_valid,
        out_unnamed_fc3_avm_address => i_load_unnamed_fc3_fc_out_unnamed_fc3_avm_address,
        out_unnamed_fc3_avm_burstcount => i_load_unnamed_fc3_fc_out_unnamed_fc3_avm_burstcount,
        out_unnamed_fc3_avm_byteenable => i_load_unnamed_fc3_fc_out_unnamed_fc3_avm_byteenable,
        out_unnamed_fc3_avm_enable => i_load_unnamed_fc3_fc_out_unnamed_fc3_avm_enable,
        out_unnamed_fc3_avm_read => i_load_unnamed_fc3_fc_out_unnamed_fc3_avm_read,
        out_unnamed_fc3_avm_write => i_load_unnamed_fc3_fc_out_unnamed_fc3_avm_write,
        out_unnamed_fc3_avm_writedata => i_load_unnamed_fc3_fc_out_unnamed_fc3_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,5)
    out_unnamed_fc3_avm_address <= i_load_unnamed_fc3_fc_out_unnamed_fc3_avm_address;
    out_unnamed_fc3_avm_enable <= i_load_unnamed_fc3_fc_out_unnamed_fc3_avm_enable;
    out_unnamed_fc3_avm_read <= i_load_unnamed_fc3_fc_out_unnamed_fc3_avm_read;
    out_unnamed_fc3_avm_write <= i_load_unnamed_fc3_fc_out_unnamed_fc3_avm_write;
    out_unnamed_fc3_avm_writedata <= i_load_unnamed_fc3_fc_out_unnamed_fc3_avm_writedata;
    out_unnamed_fc3_avm_byteenable <= i_load_unnamed_fc3_fc_out_unnamed_fc3_avm_byteenable;
    out_unnamed_fc3_avm_burstcount <= i_load_unnamed_fc3_fc_out_unnamed_fc3_avm_burstcount;

    -- bubble_join_redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo(BITJOIN,189)
    bubble_join_redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_q <= redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_data_out;

    -- bubble_select_redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo(BITSELECT,190)
    bubble_select_redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_q(31 downto 0));

    -- bubble_join_redist2_i_j_13_lc_innerphi_fc_q_26_fifo(BITJOIN,159)
    bubble_join_redist2_i_j_13_lc_innerphi_fc_q_26_fifo_q <= redist2_i_j_13_lc_innerphi_fc_q_26_fifo_data_out;

    -- bubble_select_redist2_i_j_13_lc_innerphi_fc_q_26_fifo(BITSELECT,160)
    bubble_select_redist2_i_j_13_lc_innerphi_fc_q_26_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist2_i_j_13_lc_innerphi_fc_q_26_fifo_q(31 downto 0));

    -- bubble_join_redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo(BITJOIN,186)
    bubble_join_redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_q <= redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_data_out;

    -- bubble_select_redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo(BITSELECT,187)
    bubble_select_redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_q(63 downto 0));

    -- bubble_join_redist3_i_i_06_lc_outerphi_fc_q_194_fifo(BITJOIN,162)
    bubble_join_redist3_i_i_06_lc_outerphi_fc_q_194_fifo_q <= redist3_i_i_06_lc_outerphi_fc_q_194_fifo_data_out;

    -- bubble_select_redist3_i_i_06_lc_outerphi_fc_q_194_fifo(BITSELECT,163)
    bubble_select_redist3_i_i_06_lc_outerphi_fc_q_194_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist3_i_i_06_lc_outerphi_fc_q_194_fifo_q(31 downto 0));

    -- bubble_join_redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo(BITJOIN,165)
    bubble_join_redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_q <= redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_data_out;

    -- bubble_select_redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo(BITSELECT,166)
    bubble_select_redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_q(0 downto 0));

    -- bubble_join_i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x(BITJOIN,126)
    bubble_join_i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x_q <= i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x_out_c1_exit_2 & i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x_out_c1_exit_1;

    -- bubble_select_i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x(BITSELECT,127)
    bubble_select_i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x_q(31 downto 0));
    bubble_select_i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x_q(63 downto 32));

    -- bubble_join_redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo(BITJOIN,183)
    bubble_join_redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_q <= redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_data_out;

    -- bubble_select_redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo(BITSELECT,184)
    bubble_select_redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_q(63 downto 0));

    -- dupName_0_sync_out_x(GPOUT,10)@205
    out_c0_exe11 <= bubble_select_redist12_fc_B1_merge_reg_aunroll_x_out_data_out_4_204_fifo_b;
    out_c1_exe1 <= bubble_select_i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x_b;
    out_c1_exe2 <= bubble_select_i_sfc_c1_for_cond5_preheader_fc_c1_enter_fc_aunroll_x_c;
    out_for_end20_loopexit_loopexit_LC_COND <= bubble_select_redist4_i_for_end20_loopexit_loopexit_lc_cond_fc_q_26_fifo_b;
    out_i_06_LC_OuterPHI <= bubble_select_redist3_i_i_06_lc_outerphi_fc_q_194_fifo_b;
    out_idxprom3 <= bubble_select_redist13_fc_B1_merge_reg_aunroll_x_out_data_out_5_204_fifo_b;
    out_j_13_LC_InnerPHI <= bubble_select_redist2_i_j_13_lc_innerphi_fc_q_26_fifo_b;
    out_unnamed_fc1 <= bubble_select_redist14_fc_B1_merge_reg_aunroll_x_out_data_out_6_204_fifo_b;
    out_valid_out <= SE_out_bubble_out_i_syncbuf_sizex_sync_buffer3_fc_1_V0;

    -- ext_sig_sync_out(GPOUT,40)
    out_unnamed_fc2_avm_address <= i_load_unnamed_fc2_fc_out_unnamed_fc2_avm_address;
    out_unnamed_fc2_avm_enable <= i_load_unnamed_fc2_fc_out_unnamed_fc2_avm_enable;
    out_unnamed_fc2_avm_read <= i_load_unnamed_fc2_fc_out_unnamed_fc2_avm_read;
    out_unnamed_fc2_avm_write <= i_load_unnamed_fc2_fc_out_unnamed_fc2_avm_write;
    out_unnamed_fc2_avm_writedata <= i_load_unnamed_fc2_fc_out_unnamed_fc2_avm_writedata;
    out_unnamed_fc2_avm_byteenable <= i_load_unnamed_fc2_fc_out_unnamed_fc2_avm_byteenable;
    out_unnamed_fc2_avm_burstcount <= i_load_unnamed_fc2_fc_out_unnamed_fc2_avm_burstcount;

    -- sync_out(GPOUT,76)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
