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

-- VHDL created from bb_maxpool2d_B2_stall_region
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

entity bb_maxpool2d_B2_stall_region is
    port (
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe11 : in std_logic_vector(63 downto 0);  -- ufix64
        in_fpgaindvars_iv : in std_logic_vector(2 downto 0);  -- ufix3
        in_i_0107 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_1611 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_24 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul2212 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul2413 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im_addr_0115 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_179 : in std_logic_vector(63 downto 0);  -- ufix64
        in_tmp_23 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe117 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_cmp9_phi_decision18_xor_RM : out std_logic_vector(0 downto 0);  -- ufix1
        out_fpgaindvars_iv_next : out std_logic_vector(2 downto 0);  -- ufix3
        out_i_0107 : out std_logic_vector(31 downto 0);  -- ufix32
        out_inc30 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_1611 : out std_logic_vector(31 downto 0);  -- ufix32
        out_mul2212 : out std_logic_vector(31 downto 0);  -- ufix32
        out_mul2413 : out std_logic_vector(31 downto 0);  -- ufix32
        out_output_im_addr_0115 : out std_logic_vector(63 downto 0);  -- ufix64
        out_output_im_addr_179 : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_maxpool2d0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
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
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_maxpool2d_B2_stall_region;

architecture normal of bb_maxpool2d_B2_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_load_memcoalesce_input_im_load_0_maxpool2d27 is
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


    component i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d is
        port (
            in_c0_eni4_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni4_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni4_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni4_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni4_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit10_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit10_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter13_maxpool2d is
        port (
            in_c1_eni2_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni2_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni2_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni2_3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c1_eni2_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni2_5 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit16_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit16_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component maxpool2d_B2_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_data_in_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_6 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_data_out_3 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_6 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_output_size_sync_buffer4_maxpool2d15 is
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













    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_fpgaindvars_iv_next_maxpool2d_sel_x_b : STD_LOGIC_VECTOR (2 downto 0);
    signal bgTrunc_i_inc30_maxpool2d_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_o_readdata_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_o_readdata_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_o_readdata_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_o_readdata_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_memcoalesce_input_im_load_0_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_memcoalesce_input_im_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_memcoalesce_input_im_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_memcoalesce_input_im_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_memcoalesce_input_im_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_memcoalesce_input_im_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_memcoalesce_input_im_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_out_c0_exit10_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter13_maxpool2d_aunroll_x_out_c1_exit16_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter13_maxpool2d_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter13_maxpool2d_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (2 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B2_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i3_1gr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_cmp9_phi_decision18_xor_rm_maxpool2d_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp9_phi_decision18_xor_rm_maxpool2d_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp9_phi_decision18_xor_rm_maxpool2d_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp9_phi_decision18_xor_rm_maxpool2d_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_fpgaindvars_iv_next_maxpool2d_a : STD_LOGIC_VECTOR (3 downto 0);
    signal i_fpgaindvars_iv_next_maxpool2d_b : STD_LOGIC_VECTOR (3 downto 0);
    signal i_fpgaindvars_iv_next_maxpool2d_o : STD_LOGIC_VECTOR (3 downto 0);
    signal i_fpgaindvars_iv_next_maxpool2d_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_inc30_maxpool2d_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc30_maxpool2d_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc30_maxpool2d_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc30_maxpool2d_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_syncbuf_output_size_sync_buffer4_maxpool2d_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_output_size_sync_buffer4_maxpool2d_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_output_size_sync_buffer4_maxpool2d_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_maxpool2d29_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond_maxpool2d_cmp_sign_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_data_in : STD_LOGIC_VECTOR (2 downto 0);
    signal redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_data_out : STD_LOGIC_VECTOR (2 downto 0);
    signal redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_select_i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter13_maxpool2d_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter13_maxpool2d_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (386 downto 0);
    signal bubble_select_maxpool2d_B2_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (2 downto 0);
    signal bubble_select_maxpool2d_B2_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_maxpool2d_B2_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_maxpool2d_B2_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_maxpool2d_B2_merge_reg_aunroll_x_f : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_maxpool2d_B2_merge_reg_aunroll_x_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_maxpool2d_B2_merge_reg_aunroll_x_h : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_maxpool2d_B2_merge_reg_aunroll_x_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_maxpool2d_B2_merge_reg_aunroll_x_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_maxpool2d_B2_merge_reg_aunroll_x_k : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_output_size_sync_buffer4_maxpool2d_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_output_size_sync_buffer4_maxpool2d_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (386 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (2 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_i : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_j : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_k : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_q : STD_LOGIC_VECTOR (2 downto 0);
    signal bubble_select_redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_b : STD_LOGIC_VECTOR (2 downto 0);
    signal bubble_join_redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_or7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_or8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_or9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_or10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B2_merge_reg_aunroll_x_V11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_D1 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x(STALLENABLE,138)
    -- Valid signal propagation
    SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_V0 <= SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_backStall <= i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_o_stall or not (SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_wireValid <= SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_V;

    -- c_i32_1gr(CONSTANT,24)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- SE_stall_entry(STALLENABLE,149)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= maxpool2d_B2_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,94)
    bubble_join_stall_entry_q <= in_tmp_23 & in_output_im_addr_179 & in_output_im_addr_0115 & in_mul2413 & in_mul2212 & in_k_24 & in_j_1611 & in_i_0107 & in_fpgaindvars_iv & in_c0_exe11;

    -- bubble_select_stall_entry(BITSELECT,95)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(66 downto 64));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(98 downto 67));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(130 downto 99));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(162 downto 131));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(194 downto 163));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(226 downto 195));
    bubble_select_stall_entry_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(290 downto 227));
    bubble_select_stall_entry_j <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(354 downto 291));
    bubble_select_stall_entry_k <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(386 downto 355));

    -- maxpool2d_B2_merge_reg_aunroll_x(BLACKBOX,20)@0
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
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    themaxpool2d_B2_merge_reg_aunroll_x : maxpool2d_B2_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_c,
        in_data_in_1 => bubble_select_stall_entry_f,
        in_data_in_2 => bubble_select_stall_entry_k,
        in_data_in_3 => bubble_select_stall_entry_b,
        in_data_in_4 => bubble_select_stall_entry_i,
        in_data_in_5 => bubble_select_stall_entry_d,
        in_data_in_6 => bubble_select_stall_entry_j,
        in_data_in_7 => bubble_select_stall_entry_e,
        in_data_in_8 => bubble_select_stall_entry_g,
        in_data_in_9 => bubble_select_stall_entry_h,
        in_stall_in => SE_out_maxpool2d_B2_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3,
        out_data_out_4 => maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4,
        out_data_out_5 => maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5,
        out_data_out_6 => maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6,
        out_data_out_7 => maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7,
        out_data_out_8 => maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8,
        out_data_out_9 => maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9,
        out_stall_out => maxpool2d_B2_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => maxpool2d_B2_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_maxpool2d_B2_merge_reg_aunroll_x(STALLENABLE,142)
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg1 <= (others => '0');
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg2 <= (others => '0');
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg3 <= (others => '0');
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg4 <= (others => '0');
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg5 <= (others => '0');
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg6 <= (others => '0');
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg7 <= (others => '0');
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg8 <= (others => '0');
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg9 <= (others => '0');
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg10 <= (others => '0');
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg11 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg0 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg1 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg2 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg3 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg3;
            -- Succesor 4
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg4 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg4;
            -- Succesor 5
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg5 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg5;
            -- Succesor 6
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg6 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg6;
            -- Succesor 7
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg7 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg7;
            -- Succesor 8
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg8 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg8;
            -- Succesor 9
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg9 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg9;
            -- Succesor 10
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg10 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg10;
            -- Succesor 11
            SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg11 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg11;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed0 <= (not (i_syncbuf_output_size_sync_buffer4_maxpool2d_out_stall_out) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg0;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed1 <= (not (i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_out_o_stall) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg1;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed2 <= (not (redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_stall_out) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg2;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed3 <= (not (redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_stall_out) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg3;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed4 <= (not (redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_stall_out) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg4;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed5 <= (not (redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_stall_out) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg5;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed6 <= (not (redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_stall_out) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg6;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed7 <= (not (redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_stall_out) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg7;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed8 <= (not (redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_stall_out) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg8;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed9 <= (not (redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_stall_out) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg9;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed10 <= (not (redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_stall_out) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg10;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed11 <= (not (redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_stall_out) and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg11;
    -- Consuming
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_backStall and SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg0 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed0;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg1 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed1;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg2 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed2;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg3 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed3;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg4 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed4;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg5 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed5;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg6 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed6;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg7 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed7;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg8 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed8;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg9 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed9;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg10 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed10;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_toReg11 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed11;
    -- Backward Stall generation
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_or0 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed0;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_or1 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed1 and SE_out_maxpool2d_B2_merge_reg_aunroll_x_or0;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_or2 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed2 and SE_out_maxpool2d_B2_merge_reg_aunroll_x_or1;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_or3 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed3 and SE_out_maxpool2d_B2_merge_reg_aunroll_x_or2;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_or4 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed4 and SE_out_maxpool2d_B2_merge_reg_aunroll_x_or3;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_or5 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed5 and SE_out_maxpool2d_B2_merge_reg_aunroll_x_or4;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_or6 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed6 and SE_out_maxpool2d_B2_merge_reg_aunroll_x_or5;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_or7 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed7 and SE_out_maxpool2d_B2_merge_reg_aunroll_x_or6;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_or8 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed8 and SE_out_maxpool2d_B2_merge_reg_aunroll_x_or7;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_or9 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed9 and SE_out_maxpool2d_B2_merge_reg_aunroll_x_or8;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_or10 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed10 and SE_out_maxpool2d_B2_merge_reg_aunroll_x_or9;
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireStall <= not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_consumed11 and SE_out_maxpool2d_B2_merge_reg_aunroll_x_or10);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_backStall <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V0 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg0);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V1 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg1);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V2 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg2);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V3 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg3);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V4 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg4);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V5 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg5);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V6 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg6);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V7 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg7);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V8 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg8);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V9 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg9);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V10 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg10);
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_V11 <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B2_merge_reg_aunroll_x_fromReg11);
    -- Computing multiple Valid(s)
    SE_out_maxpool2d_B2_merge_reg_aunroll_x_wireValid <= maxpool2d_B2_merge_reg_aunroll_x_out_valid_out;

    -- SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d(STALLENABLE,147)
    -- Valid signal propagation
    SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_V0 <= SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_backStall <= SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_backStall or not (SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_wireValid <= i_syncbuf_output_size_sync_buffer4_maxpool2d_out_valid_out;

    -- i_syncbuf_output_size_sync_buffer4_maxpool2d(BLACKBOX,35)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_output_size_sync_buffer4_maxpool2d : i_syncbuf_output_size_sync_buffer4_maxpool2d15
    PORT MAP (
        in_buffer_in => in_output_size,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_backStall,
        in_valid_in => SE_out_maxpool2d_B2_merge_reg_aunroll_x_V0,
        out_buffer_out => i_syncbuf_output_size_sync_buffer4_maxpool2d_out_buffer_out,
        out_stall_out => i_syncbuf_output_size_sync_buffer4_maxpool2d_out_stall_out,
        out_valid_out => i_syncbuf_output_size_sync_buffer4_maxpool2d_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_syncbuf_output_size_sync_buffer4_maxpool2d(BITJOIN,91)
    bubble_join_i_syncbuf_output_size_sync_buffer4_maxpool2d_q <= i_syncbuf_output_size_sync_buffer4_maxpool2d_out_buffer_out;

    -- bubble_select_i_syncbuf_output_size_sync_buffer4_maxpool2d(BITSELECT,92)
    bubble_select_i_syncbuf_output_size_sync_buffer4_maxpool2d_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_output_size_sync_buffer4_maxpool2d_q(31 downto 0));

    -- i_cmp9_phi_decision18_xor_rm_maxpool2d(COMPARE,31)@1 + 1
    i_cmp9_phi_decision18_xor_rm_maxpool2d_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => bubble_select_i_syncbuf_output_size_sync_buffer4_maxpool2d_b(31)) & bubble_select_i_syncbuf_output_size_sync_buffer4_maxpool2d_b));
    i_cmp9_phi_decision18_xor_rm_maxpool2d_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_1gr_q(31)) & c_i32_1gr_q));
    i_cmp9_phi_decision18_xor_rm_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp9_phi_decision18_xor_rm_maxpool2d_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_backEN = "1") THEN
                i_cmp9_phi_decision18_xor_rm_maxpool2d_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp9_phi_decision18_xor_rm_maxpool2d_a) - SIGNED(i_cmp9_phi_decision18_xor_rm_maxpool2d_b));
            END IF;
        END IF;
    END PROCESS;
    i_cmp9_phi_decision18_xor_rm_maxpool2d_c(0) <= i_cmp9_phi_decision18_xor_rm_maxpool2d_o(33);

    -- SE_i_cmp9_phi_decision18_xor_rm_maxpool2d(STALLENABLE,143)
    -- Valid signal propagation
    SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_V0 <= SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_R_v_0;
    -- Stall signal propagation
    SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_s_tv_0 <= redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_stall_out and SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_R_v_0;
    -- Backward Enable generation
    SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_backEN <= not (SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_v_s_0 <= SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_backEN and SE_out_i_syncbuf_output_size_sync_buffer4_maxpool2d_V0;
    -- Backward Stall generation
    SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_backStall <= not (SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_v_s_0);
    SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_backEN = "0") THEN
                SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_R_v_0 <= SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_R_v_0 and SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_s_tv_0;
            ELSE
                SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_R_v_0 <= SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo(STALLFIFO,64)
    redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_valid_in <= SE_i_cmp9_phi_decision18_xor_rm_maxpool2d_V0;
    redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_stall_in <= SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_backStall;
    redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_data_in <= i_cmp9_phi_decision18_xor_rm_maxpool2d_c;
    redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_valid_in_bitsignaltemp <= redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_valid_in(0);
    redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_stall_in_bitsignaltemp <= redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_stall_in(0);
    redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_valid_out(0) <= redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_valid_out_bitsignaltemp;
    redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_stall_out(0) <= redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_stall_out_bitsignaltemp;
    theredist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 11,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_valid_in_bitsignaltemp,
        stall_in => redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_stall_in_bitsignaltemp,
        data_in => i_cmp9_phi_decision18_xor_rm_maxpool2d_c,
        valid_out => redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_valid_out_bitsignaltemp,
        stall_out => redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_stall_out_bitsignaltemp,
        data_out => redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo(BITJOIN,98)
    bubble_join_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_q <= redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_data_out;

    -- bubble_select_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo(BITSELECT,99)
    bubble_select_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_q(0 downto 0));

    -- bubble_join_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x(BITJOIN,80)
    bubble_join_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_q <= i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_out_c0_exit10_1;

    -- bubble_select_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x(BITSELECT,81)
    bubble_select_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_q(63 downto 0));

    -- SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo(STALLENABLE,153)
    SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_fromReg0 <= (others => '0');
            SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_fromReg0 <= SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_toReg0;
            -- Succesor 1
            SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_fromReg1 <= SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_consumed0 <= (not (SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_backStall) and SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_wireValid) or SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_fromReg0;
    SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_consumed1 <= (not (redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_stall_out) and SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_wireValid) or SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_fromReg1;
    -- Consuming
    SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_StallValid <= SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_backStall and SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_wireValid;
    SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_toReg0 <= SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_StallValid and SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_consumed0;
    SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_toReg1 <= SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_StallValid and SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_or0 <= SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_consumed0;
    SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_wireStall <= not (SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_consumed1 and SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_or0);
    SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_backStall <= SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_V0 <= SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_wireValid and not (SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_fromReg0);
    SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_V1 <= SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_wireValid and not (SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_wireValid <= redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_valid_out;

    -- bubble_join_maxpool2d_B2_merge_reg_aunroll_x(BITJOIN,87)
    bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q <= maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9 & maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8 & maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7 & maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6 & maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5 & maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4 & maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3 & maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2 & maxpool2d_B2_merge_reg_aunroll_x_out_data_out_1 & maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_maxpool2d_B2_merge_reg_aunroll_x(BITSELECT,88)
    bubble_select_maxpool2d_B2_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q(2 downto 0));
    bubble_select_maxpool2d_B2_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q(34 downto 3));
    bubble_select_maxpool2d_B2_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q(66 downto 35));
    bubble_select_maxpool2d_B2_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q(130 downto 67));
    bubble_select_maxpool2d_B2_merge_reg_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q(194 downto 131));
    bubble_select_maxpool2d_B2_merge_reg_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q(226 downto 195));
    bubble_select_maxpool2d_B2_merge_reg_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q(290 downto 227));
    bubble_select_maxpool2d_B2_merge_reg_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q(322 downto 291));
    bubble_select_maxpool2d_B2_merge_reg_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q(354 downto 323));
    bubble_select_maxpool2d_B2_merge_reg_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B2_merge_reg_aunroll_x_q(386 downto 355));

    -- i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x(BLACKBOX,18)@1
    -- in in_i_stall@20000000
    -- out out_c0_exit10_0@12
    -- out out_c0_exit10_1@12
    -- out out_o_stall@20000000
    -- out out_o_valid@12
    thei_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x : i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d
    PORT MAP (
        in_c0_eni4_0 => GND_q,
        in_c0_eni4_1 => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_c,
        in_c0_eni4_2 => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_j,
        in_c0_eni4_3 => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_k,
        in_c0_eni4_4 => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_e,
        in_i_stall => SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_backStall,
        in_i_valid => SE_out_maxpool2d_B2_merge_reg_aunroll_x_V1,
        in_input_im => in_input_im,
        in_input_size => in_input_size,
        out_c0_exit10_1 => i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_out_c0_exit10_1,
        out_o_stall => i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x(STALLREG,254)
    SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_r_valid <= (others => '0');
            SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_r_data0 <= (others => '-');
            SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_r_valid <= SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_backStall and (SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_r_valid or SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_i_valid);

            IF (SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_r_valid = "0") THEN
                -- Data(s)
                SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_r_data0 <= bubble_select_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_b;
                SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_r_data1 <= bubble_select_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_b;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_and0 <= i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_out_o_valid;
    SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_i_valid <= SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_V0 and SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_and0;
    -- Stall signal propagation
    SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_backStall <= SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_r_valid or not (SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_i_valid);

    -- Valid
    SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_V <= SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_r_valid WHEN SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_r_valid = "1" ELSE SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_i_valid;

    -- Data0
    SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_D0 <= SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_r_data0 WHEN SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_r_valid = "1" ELSE bubble_select_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_b;
    -- Data1
    SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_D1 <= SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_r_data1 WHEN SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_r_valid = "1" ELSE bubble_select_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_b;

    -- i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x(BLACKBOX,17)@12
    -- in in_i_stall@20000000
    -- out out_o_readdata_0@132
    -- out out_o_readdata_1@132
    -- out out_o_readdata_2@132
    -- out out_o_readdata_3@132
    -- out out_memcoalesce_input_im_load_0_avm_address@20000000
    -- out out_memcoalesce_input_im_load_0_avm_burstcount@20000000
    -- out out_memcoalesce_input_im_load_0_avm_byteenable@20000000
    -- out out_memcoalesce_input_im_load_0_avm_enable@20000000
    -- out out_memcoalesce_input_im_load_0_avm_read@20000000
    -- out out_memcoalesce_input_im_load_0_avm_write@20000000
    -- out out_memcoalesce_input_im_load_0_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@132
    thei_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x : i_load_memcoalesce_input_im_load_0_maxpool2d27
    PORT MAP (
        in_flush => in_flush,
        in_i_address => SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_D0,
        in_i_predicate => SR_SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_D1,
        in_i_stall => SE_out_redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_backStall,
        in_i_valid => SE_out_i_sfc_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d_aunroll_x_V0,
        in_memcoalesce_input_im_load_0_avm_readdata => in_memcoalesce_input_im_load_0_avm_readdata,
        in_memcoalesce_input_im_load_0_avm_readdatavalid => in_memcoalesce_input_im_load_0_avm_readdatavalid,
        in_memcoalesce_input_im_load_0_avm_waitrequest => in_memcoalesce_input_im_load_0_avm_waitrequest,
        in_memcoalesce_input_im_load_0_avm_writeack => in_memcoalesce_input_im_load_0_avm_writeack,
        out_o_readdata_0 => i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_o_readdata_0,
        out_o_readdata_1 => i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_o_readdata_1,
        out_o_readdata_2 => i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_o_readdata_2,
        out_o_readdata_3 => i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_o_readdata_3,
        out_memcoalesce_input_im_load_0_avm_address => i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_memcoalesce_input_im_load_0_avm_address,
        out_memcoalesce_input_im_load_0_avm_burstcount => i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_memcoalesce_input_im_load_0_avm_burstcount,
        out_memcoalesce_input_im_load_0_avm_byteenable => i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_memcoalesce_input_im_load_0_avm_byteenable,
        out_memcoalesce_input_im_load_0_avm_enable => i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_memcoalesce_input_im_load_0_avm_enable,
        out_memcoalesce_input_im_load_0_avm_read => i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_memcoalesce_input_im_load_0_avm_read,
        out_memcoalesce_input_im_load_0_avm_write => i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_memcoalesce_input_im_load_0_avm_write,
        out_memcoalesce_input_im_load_0_avm_writedata => i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_memcoalesce_input_im_load_0_avm_writedata,
        out_o_stall => i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_o_stall,
        out_o_valid => i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo(STALLFIFO,67)
    redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_valid_in <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_V3;
    redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_stall_in <= SE_out_redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_backStall;
    redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_data_in <= bubble_select_maxpool2d_B2_merge_reg_aunroll_x_d;
    redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_valid_in_bitsignaltemp <= redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_valid_in(0);
    redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_stall_in_bitsignaltemp <= redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_stall_in(0);
    redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_valid_out(0) <= redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_valid_out_bitsignaltemp;
    redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_stall_out(0) <= redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_stall_out_bitsignaltemp;
    theredist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 132,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_valid_in_bitsignaltemp,
        stall_in => redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_d,
        valid_out => redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_valid_out_bitsignaltemp,
        stall_out => redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_stall_out_bitsignaltemp,
        data_out => redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo(STALLENABLE,159)
    -- Valid signal propagation
    SE_out_redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_V0 <= SE_out_redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_backStall <= i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter13_maxpool2d_aunroll_x_out_o_stall or not (SE_out_redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_and0 <= redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_valid_out;
    SE_out_redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_wireValid <= i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_o_valid and SE_out_redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_and0;

    -- bubble_join_redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo(BITJOIN,107)
    bubble_join_redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_q <= redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_data_out;

    -- bubble_select_redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo(BITSELECT,108)
    bubble_select_redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_q(31 downto 0));

    -- bubble_join_i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x(BITJOIN,77)
    bubble_join_i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_q <= i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_o_readdata_3 & i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_o_readdata_2 & i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_o_readdata_1 & i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_o_readdata_0;

    -- bubble_select_i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x(BITSELECT,78)
    bubble_select_i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_q(31 downto 0));
    bubble_select_i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_q(63 downto 32));
    bubble_select_i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_q(95 downto 64));
    bubble_select_i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_q(127 downto 96));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter13_maxpool2d_aunroll_x(BLACKBOX,19)@132
    -- in in_i_stall@20000000
    -- out out_c1_exit16_0@140
    -- out out_c1_exit16_1@140
    -- out out_o_stall@20000000
    -- out out_o_valid@140
    thei_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter13_maxpool2d_aunroll_x : i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter13_maxpool2d
    PORT MAP (
        in_c1_eni2_0 => GND_q,
        in_c1_eni2_1 => bubble_select_i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_b,
        in_c1_eni2_2 => bubble_select_i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_c,
        in_c1_eni2_3 => bubble_select_i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_d,
        in_c1_eni2_4 => bubble_select_i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_e,
        in_c1_eni2_5 => bubble_select_redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_b,
        in_i_stall => SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_backStall,
        in_i_valid => SE_out_redist3_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_2_131_fifo_V0,
        out_c1_exit16_1 => i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter13_maxpool2d_aunroll_x_out_c1_exit16_1,
        out_o_stall => i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter13_maxpool2d_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter13_maxpool2d_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo(STALLFIFO,65)
    redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_valid_in <= SE_out_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_V1;
    redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_stall_in <= SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_backStall;
    redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_data_in <= bubble_select_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_b;
    redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_valid_in_bitsignaltemp <= redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_valid_in(0);
    redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_stall_in_bitsignaltemp <= redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_stall_in(0);
    redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_valid_out(0) <= redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_valid_out_bitsignaltemp;
    redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_stall_out(0) <= redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_stall_out_bitsignaltemp;
    theredist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 129,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_valid_in_bitsignaltemp,
        stall_in => redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist0_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_11_fifo_b,
        valid_out => redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_valid_out_bitsignaltemp,
        stall_out => redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_stall_out_bitsignaltemp,
        data_out => redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo(STALLFIFO,66)
    redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_valid_in <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_V2;
    redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_stall_in <= SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_backStall;
    redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_data_in <= bubble_select_maxpool2d_B2_merge_reg_aunroll_x_b;
    redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_valid_in_bitsignaltemp <= redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_valid_in(0);
    redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_stall_in_bitsignaltemp <= redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_stall_in(0);
    redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_valid_out(0) <= redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_valid_out_bitsignaltemp;
    redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_stall_out(0) <= redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_stall_out_bitsignaltemp;
    theredist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 140,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 3,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_valid_in_bitsignaltemp,
        stall_in => redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_b,
        valid_out => redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_valid_out_bitsignaltemp,
        stall_out => redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_stall_out_bitsignaltemp,
        data_out => redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo(STALLFIFO,68)
    redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_valid_in <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_V4;
    redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_stall_in <= SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_backStall;
    redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_data_in <= bubble_select_maxpool2d_B2_merge_reg_aunroll_x_e;
    redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_valid_in_bitsignaltemp <= redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_valid_in(0);
    redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_stall_in_bitsignaltemp <= redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_stall_in(0);
    redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_valid_out(0) <= redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_valid_out_bitsignaltemp;
    redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_stall_out(0) <= redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_stall_out_bitsignaltemp;
    theredist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 140,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_valid_in_bitsignaltemp,
        stall_in => redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_e,
        valid_out => redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_valid_out_bitsignaltemp,
        stall_out => redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_stall_out_bitsignaltemp,
        data_out => redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo(STALLFIFO,69)
    redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_valid_in <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_V5;
    redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_stall_in <= SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_backStall;
    redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_data_in <= bubble_select_maxpool2d_B2_merge_reg_aunroll_x_f;
    redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_valid_in_bitsignaltemp <= redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_valid_in(0);
    redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_stall_in_bitsignaltemp <= redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_stall_in(0);
    redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_valid_out(0) <= redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_valid_out_bitsignaltemp;
    redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_stall_out(0) <= redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_stall_out_bitsignaltemp;
    theredist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 140,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_valid_in_bitsignaltemp,
        stall_in => redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_f,
        valid_out => redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_valid_out_bitsignaltemp,
        stall_out => redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_stall_out_bitsignaltemp,
        data_out => redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo(STALLFIFO,70)
    redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_valid_in <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_V6;
    redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_stall_in <= SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_backStall;
    redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_data_in <= bubble_select_maxpool2d_B2_merge_reg_aunroll_x_g;
    redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_valid_in_bitsignaltemp <= redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_valid_in(0);
    redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_stall_in_bitsignaltemp <= redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_stall_in(0);
    redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_valid_out(0) <= redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_valid_out_bitsignaltemp;
    redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_stall_out(0) <= redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_stall_out_bitsignaltemp;
    theredist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 140,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_valid_in_bitsignaltemp,
        stall_in => redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_g,
        valid_out => redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_valid_out_bitsignaltemp,
        stall_out => redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_stall_out_bitsignaltemp,
        data_out => redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo(STALLFIFO,71)
    redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_valid_in <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_V7;
    redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_stall_in <= SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_backStall;
    redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_data_in <= bubble_select_maxpool2d_B2_merge_reg_aunroll_x_h;
    redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_valid_in_bitsignaltemp <= redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_valid_in(0);
    redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_stall_in_bitsignaltemp <= redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_stall_in(0);
    redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_valid_out(0) <= redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_valid_out_bitsignaltemp;
    redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_stall_out(0) <= redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_stall_out_bitsignaltemp;
    theredist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 140,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_valid_in_bitsignaltemp,
        stall_in => redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_h,
        valid_out => redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_valid_out_bitsignaltemp,
        stall_out => redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_stall_out_bitsignaltemp,
        data_out => redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo(STALLFIFO,72)
    redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_valid_in <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_V8;
    redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_stall_in <= SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_backStall;
    redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_data_in <= bubble_select_maxpool2d_B2_merge_reg_aunroll_x_i;
    redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_valid_in_bitsignaltemp <= redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_valid_in(0);
    redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_stall_in_bitsignaltemp <= redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_stall_in(0);
    redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_valid_out(0) <= redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_valid_out_bitsignaltemp;
    redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_stall_out(0) <= redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_stall_out_bitsignaltemp;
    theredist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 140,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_valid_in_bitsignaltemp,
        stall_in => redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_i,
        valid_out => redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_valid_out_bitsignaltemp,
        stall_out => redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_stall_out_bitsignaltemp,
        data_out => redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo(STALLFIFO,73)
    redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_valid_in <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_V9;
    redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_stall_in <= SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_backStall;
    redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_data_in <= bubble_select_maxpool2d_B2_merge_reg_aunroll_x_j;
    redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_valid_in_bitsignaltemp <= redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_valid_in(0);
    redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_stall_in_bitsignaltemp <= redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_stall_in(0);
    redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_valid_out(0) <= redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_valid_out_bitsignaltemp;
    redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_stall_out(0) <= redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_stall_out_bitsignaltemp;
    theredist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 140,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_valid_in_bitsignaltemp,
        stall_in => redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_j,
        valid_out => redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_valid_out_bitsignaltemp,
        stall_out => redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_stall_out_bitsignaltemp,
        data_out => redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo(STALLFIFO,74)
    redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_valid_in <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_V10;
    redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_stall_in <= SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_backStall;
    redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_data_in <= bubble_select_maxpool2d_B2_merge_reg_aunroll_x_k;
    redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_valid_in_bitsignaltemp <= redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_valid_in(0);
    redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_stall_in_bitsignaltemp <= redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_stall_in(0);
    redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_valid_out(0) <= redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_valid_out_bitsignaltemp;
    redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_stall_out(0) <= redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_stall_out_bitsignaltemp;
    theredist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 140,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_valid_in_bitsignaltemp,
        stall_in => redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_maxpool2d_B2_merge_reg_aunroll_x_k,
        valid_out => redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_valid_out_bitsignaltemp,
        stall_out => redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_stall_out_bitsignaltemp,
        data_out => redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- i_inc30_maxpool2d(ADD,34)@1
    i_inc30_maxpool2d_a <= STD_LOGIC_VECTOR("0" & bubble_select_maxpool2d_B2_merge_reg_aunroll_x_c);
    i_inc30_maxpool2d_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc30_maxpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc30_maxpool2d_a) + UNSIGNED(i_inc30_maxpool2d_b));
    i_inc30_maxpool2d_q <= i_inc30_maxpool2d_o(32 downto 0);

    -- bgTrunc_i_inc30_maxpool2d_sel_x(BITSELECT,3)@1
    bgTrunc_i_inc30_maxpool2d_sel_x_b <= i_inc30_maxpool2d_q(31 downto 0);

    -- redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo(STALLFIFO,75)
    redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_valid_in <= SE_out_maxpool2d_B2_merge_reg_aunroll_x_V11;
    redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_stall_in <= SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_backStall;
    redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_data_in <= bgTrunc_i_inc30_maxpool2d_sel_x_b;
    redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_valid_in_bitsignaltemp <= redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_valid_in(0);
    redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_stall_in_bitsignaltemp <= redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_stall_in(0);
    redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_valid_out(0) <= redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_valid_out_bitsignaltemp;
    redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_stall_out(0) <= redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_stall_out_bitsignaltemp;
    theredist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 140,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_valid_in_bitsignaltemp,
        stall_in => redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_stall_in_bitsignaltemp,
        data_in => bgTrunc_i_inc30_maxpool2d_sel_x_b,
        valid_out => redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_valid_out_bitsignaltemp,
        stall_out => redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_stall_out_bitsignaltemp,
        data_out => redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo(STALLENABLE,175)
    -- Valid signal propagation
    SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_V0 <= SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_backStall <= in_stall_in or not (SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and0 <= redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_valid_out;
    SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and1 <= redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_valid_out and SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and0;
    SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and2 <= redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_valid_out and SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and1;
    SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and3 <= redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_valid_out and SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and2;
    SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and4 <= redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_valid_out and SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and3;
    SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and5 <= redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_valid_out and SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and4;
    SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and6 <= redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_valid_out and SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and5;
    SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and7 <= redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_valid_out and SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and6;
    SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and8 <= redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_valid_out and SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and7;
    SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and9 <= redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_valid_out and SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and8;
    SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_wireValid <= i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter13_maxpool2d_aunroll_x_out_o_valid and SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_and9;

    -- bubble_join_redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo(BITJOIN,104)
    bubble_join_redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_q <= redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_data_out;

    -- bubble_select_redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo(BITSELECT,105)
    bubble_select_redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_q(2 downto 0));

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- i_exitcond_maxpool2d_cmp_sign(LOGICAL,50)@140
    i_exitcond_maxpool2d_cmp_sign_q <= STD_LOGIC_VECTOR(bubble_select_redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_b(2 downto 2));

    -- i_unnamed_maxpool2d29(LOGICAL,36)@140
    i_unnamed_maxpool2d29_q <= i_exitcond_maxpool2d_cmp_sign_q or bubble_select_redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_b;

    -- bubble_join_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo(BITJOIN,119)
    bubble_join_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_q <= redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_data_out;

    -- bubble_select_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo(BITSELECT,120)
    bubble_select_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_q(63 downto 0));

    -- bubble_join_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo(BITJOIN,113)
    bubble_join_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_q <= redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_data_out;

    -- bubble_select_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo(BITSELECT,114)
    bubble_select_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_q(63 downto 0));

    -- bubble_join_redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo(BITJOIN,128)
    bubble_join_redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_q <= redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_data_out;

    -- bubble_select_redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo(BITSELECT,129)
    bubble_select_redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_q(31 downto 0));

    -- bubble_join_redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo(BITJOIN,125)
    bubble_join_redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_q <= redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_data_out;

    -- bubble_select_redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo(BITSELECT,126)
    bubble_select_redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_q(31 downto 0));

    -- bubble_join_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo(BITJOIN,122)
    bubble_join_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_q <= redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_data_out;

    -- bubble_select_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo(BITSELECT,123)
    bubble_select_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_q(31 downto 0));

    -- bubble_join_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo(BITJOIN,131)
    bubble_join_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_q <= redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_data_out;

    -- bubble_select_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo(BITSELECT,132)
    bubble_select_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_q(31 downto 0));

    -- bubble_join_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo(BITJOIN,116)
    bubble_join_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_q <= redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_data_out;

    -- bubble_select_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo(BITSELECT,117)
    bubble_select_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_q(31 downto 0));

    -- c_i3_1gr(CONSTANT,26)
    c_i3_1gr_q <= "111";

    -- i_fpgaindvars_iv_next_maxpool2d(ADD,33)@140
    i_fpgaindvars_iv_next_maxpool2d_a <= STD_LOGIC_VECTOR("0" & bubble_select_redist2_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_0_139_fifo_b);
    i_fpgaindvars_iv_next_maxpool2d_b <= STD_LOGIC_VECTOR("0" & c_i3_1gr_q);
    i_fpgaindvars_iv_next_maxpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(i_fpgaindvars_iv_next_maxpool2d_a) + UNSIGNED(i_fpgaindvars_iv_next_maxpool2d_b));
    i_fpgaindvars_iv_next_maxpool2d_q <= i_fpgaindvars_iv_next_maxpool2d_o(3 downto 0);

    -- bgTrunc_i_fpgaindvars_iv_next_maxpool2d_sel_x(BITSELECT,2)@140
    bgTrunc_i_fpgaindvars_iv_next_maxpool2d_sel_x_b <= i_fpgaindvars_iv_next_maxpool2d_q(2 downto 0);

    -- bubble_join_redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo(BITJOIN,101)
    bubble_join_redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_q <= redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_data_out;

    -- bubble_select_redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo(BITSELECT,102)
    bubble_select_redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_q(0 downto 0));

    -- bubble_join_i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter13_maxpool2d_aunroll_x(BITJOIN,83)
    bubble_join_i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter13_maxpool2d_aunroll_x_q <= i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter13_maxpool2d_aunroll_x_out_c1_exit16_1;

    -- bubble_select_i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter13_maxpool2d_aunroll_x(BITSELECT,84)
    bubble_select_i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter13_maxpool2d_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter13_maxpool2d_aunroll_x_q(31 downto 0));

    -- bubble_join_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo(BITJOIN,110)
    bubble_join_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_q <= redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_data_out;

    -- bubble_select_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo(BITSELECT,111)
    bubble_select_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_q(63 downto 0));

    -- dupName_0_sync_out_x(GPOUT,8)@140
    out_c0_exe11 <= bubble_select_redist4_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_3_139_fifo_b;
    out_c1_exe117 <= bubble_select_i_sfc_c1_for_cond17_preheader_maxpool2d_c1_enter13_maxpool2d_aunroll_x_b;
    out_cmp9_phi_decision18_xor_RM <= bubble_select_redist1_i_cmp9_phi_decision18_xor_rm_maxpool2d_c_139_fifo_b;
    out_fpgaindvars_iv_next <= bgTrunc_i_fpgaindvars_iv_next_maxpool2d_sel_x_b;
    out_i_0107 <= bubble_select_redist6_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_5_139_fifo_b;
    out_inc30 <= bubble_select_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_b;
    out_j_1611 <= bubble_select_redist8_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_7_139_fifo_b;
    out_mul2212 <= bubble_select_redist9_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_8_139_fifo_b;
    out_mul2413 <= bubble_select_redist10_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_9_139_fifo_b;
    out_output_im_addr_0115 <= bubble_select_redist5_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_4_139_fifo_b;
    out_output_im_addr_179 <= bubble_select_redist7_maxpool2d_B2_merge_reg_aunroll_x_out_data_out_6_139_fifo_b;
    out_unnamed_maxpool2d0 <= i_unnamed_maxpool2d29_q;
    out_valid_out <= SE_out_redist11_bgTrunc_i_inc30_maxpool2d_sel_x_b_139_fifo_V0;

    -- ext_sig_sync_out(GPOUT,30)
    out_memcoalesce_input_im_load_0_avm_address <= i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_memcoalesce_input_im_load_0_avm_address;
    out_memcoalesce_input_im_load_0_avm_enable <= i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_memcoalesce_input_im_load_0_avm_enable;
    out_memcoalesce_input_im_load_0_avm_read <= i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_memcoalesce_input_im_load_0_avm_read;
    out_memcoalesce_input_im_load_0_avm_write <= i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_memcoalesce_input_im_load_0_avm_write;
    out_memcoalesce_input_im_load_0_avm_writedata <= i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_memcoalesce_input_im_load_0_avm_writedata;
    out_memcoalesce_input_im_load_0_avm_byteenable <= i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_memcoalesce_input_im_load_0_avm_byteenable;
    out_memcoalesce_input_im_load_0_avm_burstcount <= i_load_memcoalesce_input_im_load_0_maxpool2d_aunroll_x_out_memcoalesce_input_im_load_0_avm_burstcount;

    -- sync_out(GPOUT,47)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
