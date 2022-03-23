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

-- VHDL created from i_sfc_logic_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x356
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

entity i_sfc_logic_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x356 is
    port (
        in_c0_eni11_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni11_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni11_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni11_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni11_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni11_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni11_6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni11_7 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni11_8 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni11_9 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni11_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni11_11 : in std_logic_vector(2 downto 0);  -- ufix3
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_size : in std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi10_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi10_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi10_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi10_3 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi10_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi10_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi10_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi10_7 : out std_logic_vector(2 downto 0);  -- ufix3
        out_c0_exi10_8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi10_9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi10_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x356;

architecture normal of i_sfc_logic_c0_for_cond17_preheader_conv2d3x3_c0_enter220_conv2d3x356 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_syncbuf_input_channels_sync_buffer193_conv2d3x377 is
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


    component i_syncbuf_input_channels_sync_buffer_conv2d3x372 is
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


    component i_syncbuf_input_im_sync_buffer_conv2d3x366 is
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


    component i_syncbuf_input_size_sync_buffer196_conv2d3x358 is
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


    component i_syncbuf_input_size_sync_buffer197_conv2d3x364 is
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


    component i_syncbuf_input_size_sync_buffer_conv2d3x361 is
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


    component i_syncbuf_output_size_sync_buffer_conv2d3x369 is
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


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_add49_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add52_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_fpgaindvars_iv_next_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (2 downto 0);
    signal bgTrunc_i_inc65_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_inc68_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul43_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul443_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sub_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_c_i32_1gr_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_c_i3_1gr_x_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_idxprom54_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i3_1gr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_add52_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add52_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add52_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add52_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_cmp33_conv2d3x3_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp33_conv2d3x3_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp33_conv2d3x3_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp33_conv2d3x3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp35_conv2d3x3_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp35_conv2d3x3_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp35_conv2d3x3_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp35_conv2d3x3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond27_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond27_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_for_end69_loopexit_loopexit_lc_cond_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_fpgaindvars_iv_lc_innerphi_conv2d3x3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_fpgaindvars_iv_lc_innerphi_conv2d3x3_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_fpgaindvars_iv_next_conv2d3x3_a : STD_LOGIC_VECTOR (3 downto 0);
    signal i_fpgaindvars_iv_next_conv2d3x3_b : STD_LOGIC_VECTOR (3 downto 0);
    signal i_fpgaindvars_iv_next_conv2d3x3_o : STD_LOGIC_VECTOR (3 downto 0);
    signal i_fpgaindvars_iv_next_conv2d3x3_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_inc65_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc65_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc65_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc65_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc68_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc68_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc68_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc68_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_k_210_lc_outerphi_conv2d3x3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_k_210_lc_outerphi_conv2d3x3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_l_37_lc_innerphi_conv2d3x3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_l_37_lc_innerphi_conv2d3x3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul443_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul443_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul443_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_mul443_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_notlhs_conv2d3x3_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_notlhs_conv2d3x3_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_notlhs_conv2d3x3_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_notlhs_conv2d3x3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_notrhs_conv2d3x3_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_notrhs_conv2d3x3_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_notrhs_conv2d3x3_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_notrhs_conv2d3x3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond1_1_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond1_2_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond1_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond2_1_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond2_1_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond2_2_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond2_2_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond2_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond2_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phi_decision44_xor46_or189_demorgan_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phi_decision44_xor48_or190_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phi_decision44_xor48_or190_demorgan_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phi_decision44_xor_or_and_and_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phi_decision44_xor_rm_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sub_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sub_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_syncbuf_input_channels_sync_buffer193_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_channels_sync_buffer_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_im_sync_buffer_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_input_size_sync_buffer196_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_size_sync_buffer197_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_size_sync_buffer_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_output_size_sync_buffer_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_conv2d3x376_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_conv2d3x380_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal bgTrunc_i_add49_conv2d3x3_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_add49_conv2d3x3_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul43_conv2d3x3_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul43_conv2d3x3_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_add49_conv2d3x3_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_add49_conv2d3x3_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_add49_conv2d3x3_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_add49_conv2d3x3_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_add49_conv2d3x3_bjA5_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_add49_conv2d3x3_bs7_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_add49_conv2d3x3_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_add49_conv2d3x3_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_add49_conv2d3x3_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_add49_conv2d3x3_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_add49_conv2d3x3_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_add49_conv2d3x3_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_add49_conv2d3x3_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_add49_conv2d3x3_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_add49_conv2d3x3_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_mul43_conv2d3x3_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul43_conv2d3x3_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul43_conv2d3x3_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul43_conv2d3x3_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul43_conv2d3x3_bjA5_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul43_conv2d3x3_bs7_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul43_conv2d3x3_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul43_conv2d3x3_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul43_conv2d3x3_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul43_conv2d3x3_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul43_conv2d3x3_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul43_conv2d3x3_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul43_conv2d3x3_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul43_conv2d3x3_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul43_conv2d3x3_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_exitcond_conv2d3x3_cmp_sign_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_add49_conv2d3x3_im0_cma_reset : std_logic;
    type i_add49_conv2d3x3_im0_cma_a0type is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal i_add49_conv2d3x3_im0_cma_a0 : i_add49_conv2d3x3_im0_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of i_add49_conv2d3x3_im0_cma_a0 : signal is true;
    signal i_add49_conv2d3x3_im0_cma_c0 : i_add49_conv2d3x3_im0_cma_a0type(0 to 0);
    attribute preserve of i_add49_conv2d3x3_im0_cma_c0 : signal is true;
    type i_add49_conv2d3x3_im0_cma_ptype is array(NATURAL range <>) of UNSIGNED(35 downto 0);
    signal i_add49_conv2d3x3_im0_cma_p : i_add49_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_add49_conv2d3x3_im0_cma_u : i_add49_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_add49_conv2d3x3_im0_cma_w : i_add49_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_add49_conv2d3x3_im0_cma_x : i_add49_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_add49_conv2d3x3_im0_cma_y : i_add49_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_add49_conv2d3x3_im0_cma_s : i_add49_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_add49_conv2d3x3_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_add49_conv2d3x3_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_add49_conv2d3x3_im0_cma_ena0 : std_logic;
    signal i_add49_conv2d3x3_im0_cma_ena1 : std_logic;
    signal i_add49_conv2d3x3_im10_cma_reset : std_logic;
    type i_add49_conv2d3x3_im10_cma_a0type is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal i_add49_conv2d3x3_im10_cma_a0 : i_add49_conv2d3x3_im10_cma_a0type(0 to 0);
    attribute preserve of i_add49_conv2d3x3_im10_cma_a0 : signal is true;
    signal i_add49_conv2d3x3_im10_cma_c0 : i_add49_conv2d3x3_im10_cma_a0type(0 to 0);
    attribute preserve of i_add49_conv2d3x3_im10_cma_c0 : signal is true;
    type i_add49_conv2d3x3_im10_cma_ptype is array(NATURAL range <>) of UNSIGNED(27 downto 0);
    signal i_add49_conv2d3x3_im10_cma_p : i_add49_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_add49_conv2d3x3_im10_cma_u : i_add49_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_add49_conv2d3x3_im10_cma_w : i_add49_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_add49_conv2d3x3_im10_cma_x : i_add49_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_add49_conv2d3x3_im10_cma_y : i_add49_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_add49_conv2d3x3_im10_cma_s : i_add49_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_add49_conv2d3x3_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_add49_conv2d3x3_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_add49_conv2d3x3_im10_cma_ena0 : std_logic;
    signal i_add49_conv2d3x3_im10_cma_ena1 : std_logic;
    signal i_mul43_conv2d3x3_im0_cma_reset : std_logic;
    signal i_mul43_conv2d3x3_im0_cma_a0 : i_add49_conv2d3x3_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul43_conv2d3x3_im0_cma_a0 : signal is true;
    signal i_mul43_conv2d3x3_im0_cma_c0 : i_add49_conv2d3x3_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul43_conv2d3x3_im0_cma_c0 : signal is true;
    signal i_mul43_conv2d3x3_im0_cma_p : i_add49_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul43_conv2d3x3_im0_cma_u : i_add49_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul43_conv2d3x3_im0_cma_w : i_add49_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul43_conv2d3x3_im0_cma_x : i_add49_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul43_conv2d3x3_im0_cma_y : i_add49_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul43_conv2d3x3_im0_cma_s : i_add49_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul43_conv2d3x3_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul43_conv2d3x3_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul43_conv2d3x3_im0_cma_ena0 : std_logic;
    signal i_mul43_conv2d3x3_im0_cma_ena1 : std_logic;
    signal i_mul43_conv2d3x3_im10_cma_reset : std_logic;
    signal i_mul43_conv2d3x3_im10_cma_a0 : i_add49_conv2d3x3_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul43_conv2d3x3_im10_cma_a0 : signal is true;
    signal i_mul43_conv2d3x3_im10_cma_c0 : i_add49_conv2d3x3_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul43_conv2d3x3_im10_cma_c0 : signal is true;
    signal i_mul43_conv2d3x3_im10_cma_p : i_add49_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul43_conv2d3x3_im10_cma_u : i_add49_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul43_conv2d3x3_im10_cma_w : i_add49_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul43_conv2d3x3_im10_cma_x : i_add49_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul43_conv2d3x3_im10_cma_y : i_add49_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul43_conv2d3x3_im10_cma_s : i_add49_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul43_conv2d3x3_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul43_conv2d3x3_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul43_conv2d3x3_im10_cma_ena0 : std_logic;
    signal i_mul43_conv2d3x3_im10_cma_ena1 : std_logic;
    signal i_add49_conv2d3x3_ma3_cma_reset : std_logic;
    signal i_add49_conv2d3x3_ma3_cma_a0 : i_add49_conv2d3x3_im10_cma_a0type(0 to 1);
    attribute preserve of i_add49_conv2d3x3_ma3_cma_a0 : signal is true;
    type i_add49_conv2d3x3_ma3_cma_c0type is array(NATURAL range <>) of SIGNED(18 downto 0);
    signal i_add49_conv2d3x3_ma3_cma_c0 : i_add49_conv2d3x3_ma3_cma_c0type(0 to 1);
    attribute preserve of i_add49_conv2d3x3_ma3_cma_c0 : signal is true;
    type i_add49_conv2d3x3_ma3_cma_ltype is array(NATURAL range <>) of SIGNED(14 downto 0);
    signal i_add49_conv2d3x3_ma3_cma_l : i_add49_conv2d3x3_ma3_cma_ltype(0 to 1);
    type i_add49_conv2d3x3_ma3_cma_ptype is array(NATURAL range <>) of SIGNED(33 downto 0);
    signal i_add49_conv2d3x3_ma3_cma_p : i_add49_conv2d3x3_ma3_cma_ptype(0 to 1);
    type i_add49_conv2d3x3_ma3_cma_utype is array(NATURAL range <>) of SIGNED(34 downto 0);
    signal i_add49_conv2d3x3_ma3_cma_u : i_add49_conv2d3x3_ma3_cma_utype(0 to 1);
    signal i_add49_conv2d3x3_ma3_cma_w : i_add49_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_add49_conv2d3x3_ma3_cma_x : i_add49_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_add49_conv2d3x3_ma3_cma_y : i_add49_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_add49_conv2d3x3_ma3_cma_s : i_add49_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_add49_conv2d3x3_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_add49_conv2d3x3_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_add49_conv2d3x3_ma3_cma_ena0 : std_logic;
    signal i_add49_conv2d3x3_ma3_cma_ena1 : std_logic;
    signal i_mul43_conv2d3x3_ma3_cma_reset : std_logic;
    signal i_mul43_conv2d3x3_ma3_cma_a0 : i_add49_conv2d3x3_im10_cma_a0type(0 to 1);
    attribute preserve of i_mul43_conv2d3x3_ma3_cma_a0 : signal is true;
    signal i_mul43_conv2d3x3_ma3_cma_c0 : i_add49_conv2d3x3_ma3_cma_c0type(0 to 1);
    attribute preserve of i_mul43_conv2d3x3_ma3_cma_c0 : signal is true;
    signal i_mul43_conv2d3x3_ma3_cma_l : i_add49_conv2d3x3_ma3_cma_ltype(0 to 1);
    signal i_mul43_conv2d3x3_ma3_cma_p : i_add49_conv2d3x3_ma3_cma_ptype(0 to 1);
    signal i_mul43_conv2d3x3_ma3_cma_u : i_add49_conv2d3x3_ma3_cma_utype(0 to 1);
    signal i_mul43_conv2d3x3_ma3_cma_w : i_add49_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul43_conv2d3x3_ma3_cma_x : i_add49_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul43_conv2d3x3_ma3_cma_y : i_add49_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul43_conv2d3x3_ma3_cma_s : i_add49_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul43_conv2d3x3_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul43_conv2d3x3_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul43_conv2d3x3_ma3_cma_ena0 : std_logic;
    signal i_mul43_conv2d3x3_ma3_cma_ena1 : std_logic;
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul43_conv2d3x3_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul43_conv2d3x3_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal i_add49_conv2d3x3_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_add49_conv2d3x3_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal redist0_i_mul43_conv2d3x3_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist1_i_add49_conv2d3x3_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist2_i_mul43_conv2d3x3_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist3_i_mul43_conv2d3x3_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist4_i_add49_conv2d3x3_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist5_i_add49_conv2d3x3_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist6_i_unnamed_conv2d3x376_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_phi_decision44_xor_rm_conv2d3x3_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_or_cond2_conv2d3x3_q_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_or_cond2_2_conv2d3x3_q_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_or_cond2_1_conv2d3x3_q_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_notlhs_conv2d3x3_c_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_sync_in_aunroll_x_in_c0_eni11_1_10_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_sync_in_aunroll_x_in_c0_eni11_5_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_sync_in_aunroll_x_in_c0_eni11_6_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_sync_in_aunroll_x_in_c0_eni11_7_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_sync_in_aunroll_x_in_c0_eni11_8_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_sync_in_aunroll_x_in_c0_eni11_9_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_sync_in_aunroll_x_in_c0_eni11_10_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_sync_in_aunroll_x_in_c0_eni11_11_10_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist22_sync_in_aunroll_x_in_i_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_sync_in_aunroll_x_in_i_valid_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_sync_in_aunroll_x_in_i_valid_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_sync_in_aunroll_x_in_i_valid_10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_sync_in_aunroll_x_in_i_valid_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_i_arrayidx55_conv2d3x3_conv2d3x368_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist28_bgTrunc_i_sub_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist29_bgTrunc_i_sub_conv2d3x3_sel_x_b_4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist30_bgTrunc_i_mul443_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist31_bgTrunc_i_mul43_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist32_bgTrunc_i_inc68_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist34_bgTrunc_i_fpgaindvars_iv_next_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist35_bgTrunc_i_add52_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist36_bgTrunc_i_add49_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni11_1_9_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni11_1_9_mem_reset0 : std_logic;
    signal redist12_sync_in_aunroll_x_in_c0_eni11_1_9_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni11_1_9_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni11_1_9_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni11_1_9_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni11_1_9_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni11_1_9_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni11_1_9_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist12_sync_in_aunroll_x_in_c0_eni11_1_9_rdcnt_i : signal is true;
    signal redist12_sync_in_aunroll_x_in_c0_eni11_1_9_rdcnt_eq : std_logic;
    attribute preserve of redist12_sync_in_aunroll_x_in_c0_eni11_1_9_rdcnt_eq : signal is true;
    signal redist12_sync_in_aunroll_x_in_c0_eni11_1_9_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni11_1_9_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni11_1_9_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni11_1_9_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni11_1_9_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni11_1_9_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni11_1_9_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni11_1_9_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist12_sync_in_aunroll_x_in_c0_eni11_1_9_sticky_ena_q : signal is true;
    signal redist12_sync_in_aunroll_x_in_c0_eni11_1_9_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni11_4_9_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni11_4_9_mem_reset0 : std_logic;
    signal redist14_sync_in_aunroll_x_in_c0_eni11_4_9_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni11_4_9_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni11_4_9_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni11_4_9_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni11_4_9_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni11_4_9_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni11_4_9_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist14_sync_in_aunroll_x_in_c0_eni11_4_9_rdcnt_i : signal is true;
    signal redist14_sync_in_aunroll_x_in_c0_eni11_4_9_rdcnt_eq : std_logic;
    attribute preserve of redist14_sync_in_aunroll_x_in_c0_eni11_4_9_rdcnt_eq : signal is true;
    signal redist14_sync_in_aunroll_x_in_c0_eni11_4_9_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni11_4_9_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni11_4_9_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni11_4_9_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni11_4_9_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni11_4_9_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni11_4_9_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni11_4_9_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist14_sync_in_aunroll_x_in_c0_eni11_4_9_sticky_ena_q : signal is true;
    signal redist14_sync_in_aunroll_x_in_c0_eni11_4_9_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_bgTrunc_i_sub_conv2d3x3_sel_x_b_4_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_mem_reset0 : std_logic;
    signal redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_rdcnt_i : signal is true;
    signal redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_rdcnt_eq : std_logic;
    attribute preserve of redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_rdcnt_eq : signal is true;
    signal redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_sticky_ena_q : signal is true;
    signal redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist22_sync_in_aunroll_x_in_i_valid_1(DELAY,198)
    redist22_sync_in_aunroll_x_in_i_valid_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist22_sync_in_aunroll_x_in_i_valid_1_q, clk => clock, aclr => resetn );

    -- redist23_sync_in_aunroll_x_in_i_valid_5(DELAY,199)
    redist23_sync_in_aunroll_x_in_i_valid_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist22_sync_in_aunroll_x_in_i_valid_1_q, xout => redist23_sync_in_aunroll_x_in_i_valid_5_q, clk => clock, aclr => resetn );

    -- redist24_sync_in_aunroll_x_in_i_valid_9(DELAY,200)
    redist24_sync_in_aunroll_x_in_i_valid_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist23_sync_in_aunroll_x_in_i_valid_5_q, xout => redist24_sync_in_aunroll_x_in_i_valid_9_q, clk => clock, aclr => resetn );

    -- redist25_sync_in_aunroll_x_in_i_valid_10(DELAY,201)
    redist25_sync_in_aunroll_x_in_i_valid_10 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist24_sync_in_aunroll_x_in_i_valid_9_q, xout => redist25_sync_in_aunroll_x_in_i_valid_10_q, clk => clock, aclr => resetn );

    -- redist26_sync_in_aunroll_x_in_i_valid_11(DELAY,202)
    redist26_sync_in_aunroll_x_in_i_valid_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist25_sync_in_aunroll_x_in_i_valid_10_q, xout => redist26_sync_in_aunroll_x_in_i_valid_11_q, clk => clock, aclr => resetn );

    -- dupName_0_c_i32_1gr_x(CONSTANT,11)
    dupName_0_c_i32_1gr_x_q <= "00000000000000000000000000000001";

    -- i_syncbuf_output_size_sync_buffer_conv2d3x3(BLACKBOX,84)@0
    -- in in_i_dependence@10
    -- in in_valid_in@10
    -- out out_buffer_out@10
    -- out out_valid_out@10
    thei_syncbuf_output_size_sync_buffer_conv2d3x3 : i_syncbuf_output_size_sync_buffer_conv2d3x369
    PORT MAP (
        in_buffer_in => in_output_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist24_sync_in_aunroll_x_in_i_valid_9_q,
        out_buffer_out => i_syncbuf_output_size_sync_buffer_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_notlhs_conv2d3x3(COMPARE,63)@10 + 1
    i_notlhs_conv2d3x3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_output_size_sync_buffer_conv2d3x3_out_buffer_out(31)) & i_syncbuf_output_size_sync_buffer_conv2d3x3_out_buffer_out));
    i_notlhs_conv2d3x3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => dupName_0_c_i32_1gr_x_q(31)) & dupName_0_c_i32_1gr_x_q));
    i_notlhs_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_notlhs_conv2d3x3_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_notlhs_conv2d3x3_o <= STD_LOGIC_VECTOR(SIGNED(i_notlhs_conv2d3x3_a) - SIGNED(i_notlhs_conv2d3x3_b));
        END IF;
    END PROCESS;
    i_notlhs_conv2d3x3_c(0) <= i_notlhs_conv2d3x3_o(33);

    -- i_syncbuf_input_channels_sync_buffer_conv2d3x3(BLACKBOX,79)@0
    -- in in_i_dependence@10
    -- in in_valid_in@10
    -- out out_buffer_out@10
    -- out out_valid_out@10
    thei_syncbuf_input_channels_sync_buffer_conv2d3x3 : i_syncbuf_input_channels_sync_buffer_conv2d3x372
    PORT MAP (
        in_buffer_in => in_input_channels,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist24_sync_in_aunroll_x_in_i_valid_9_q,
        out_buffer_out => i_syncbuf_input_channels_sync_buffer_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_notrhs_conv2d3x3(COMPARE,64)@10 + 1
    i_notrhs_conv2d3x3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_input_channels_sync_buffer_conv2d3x3_out_buffer_out(31)) & i_syncbuf_input_channels_sync_buffer_conv2d3x3_out_buffer_out));
    i_notrhs_conv2d3x3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => dupName_0_c_i32_1gr_x_q(31)) & dupName_0_c_i32_1gr_x_q));
    i_notrhs_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_notrhs_conv2d3x3_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_notrhs_conv2d3x3_o <= STD_LOGIC_VECTOR(SIGNED(i_notrhs_conv2d3x3_a) - SIGNED(i_notrhs_conv2d3x3_b));
        END IF;
    END PROCESS;
    i_notrhs_conv2d3x3_c(0) <= i_notrhs_conv2d3x3_o(33);

    -- i_phi_decision44_xor_rm_conv2d3x3(LOGICAL,76)@11
    i_phi_decision44_xor_rm_conv2d3x3_q <= i_notrhs_conv2d3x3_c or i_notlhs_conv2d3x3_c;

    -- redist7_i_phi_decision44_xor_rm_conv2d3x3_q_1(DELAY,183)
    redist7_i_phi_decision44_xor_rm_conv2d3x3_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_phi_decision44_xor_rm_conv2d3x3_q, xout => redist7_i_phi_decision44_xor_rm_conv2d3x3_q_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_input_channels_sync_buffer193_conv2d3x3(BLACKBOX,78)@0
    -- in in_i_dependence@11
    -- in in_valid_in@11
    -- out out_buffer_out@11
    -- out out_valid_out@11
    thei_syncbuf_input_channels_sync_buffer193_conv2d3x3 : i_syncbuf_input_channels_sync_buffer193_conv2d3x377
    PORT MAP (
        in_buffer_in => in_input_channels,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist25_sync_in_aunroll_x_in_i_valid_10_q,
        out_buffer_out => i_syncbuf_input_channels_sync_buffer193_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- redist12_sync_in_aunroll_x_in_c0_eni11_1_9_notEnable(LOGICAL,220)
    redist12_sync_in_aunroll_x_in_c0_eni11_1_9_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist12_sync_in_aunroll_x_in_c0_eni11_1_9_nor(LOGICAL,221)
    redist12_sync_in_aunroll_x_in_c0_eni11_1_9_nor_q <= not (redist12_sync_in_aunroll_x_in_c0_eni11_1_9_notEnable_q or redist12_sync_in_aunroll_x_in_c0_eni11_1_9_sticky_ena_q);

    -- redist12_sync_in_aunroll_x_in_c0_eni11_1_9_mem_last(CONSTANT,217)
    redist12_sync_in_aunroll_x_in_c0_eni11_1_9_mem_last_q <= "0101";

    -- redist12_sync_in_aunroll_x_in_c0_eni11_1_9_cmp(LOGICAL,218)
    redist12_sync_in_aunroll_x_in_c0_eni11_1_9_cmp_b <= STD_LOGIC_VECTOR("0" & redist12_sync_in_aunroll_x_in_c0_eni11_1_9_rdcnt_q);
    redist12_sync_in_aunroll_x_in_c0_eni11_1_9_cmp_q <= "1" WHEN redist12_sync_in_aunroll_x_in_c0_eni11_1_9_mem_last_q = redist12_sync_in_aunroll_x_in_c0_eni11_1_9_cmp_b ELSE "0";

    -- redist12_sync_in_aunroll_x_in_c0_eni11_1_9_cmpReg(REG,219)
    redist12_sync_in_aunroll_x_in_c0_eni11_1_9_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_sync_in_aunroll_x_in_c0_eni11_1_9_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist12_sync_in_aunroll_x_in_c0_eni11_1_9_cmpReg_q <= STD_LOGIC_VECTOR(redist12_sync_in_aunroll_x_in_c0_eni11_1_9_cmp_q);
        END IF;
    END PROCESS;

    -- redist12_sync_in_aunroll_x_in_c0_eni11_1_9_sticky_ena(REG,222)
    redist12_sync_in_aunroll_x_in_c0_eni11_1_9_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_sync_in_aunroll_x_in_c0_eni11_1_9_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist12_sync_in_aunroll_x_in_c0_eni11_1_9_nor_q = "1") THEN
                redist12_sync_in_aunroll_x_in_c0_eni11_1_9_sticky_ena_q <= STD_LOGIC_VECTOR(redist12_sync_in_aunroll_x_in_c0_eni11_1_9_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist12_sync_in_aunroll_x_in_c0_eni11_1_9_enaAnd(LOGICAL,223)
    redist12_sync_in_aunroll_x_in_c0_eni11_1_9_enaAnd_q <= redist12_sync_in_aunroll_x_in_c0_eni11_1_9_sticky_ena_q and VCC_q;

    -- redist12_sync_in_aunroll_x_in_c0_eni11_1_9_rdcnt(COUNTER,215)
    -- low=0, high=6, step=1, init=0
    redist12_sync_in_aunroll_x_in_c0_eni11_1_9_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_sync_in_aunroll_x_in_c0_eni11_1_9_rdcnt_i <= TO_UNSIGNED(0, 3);
            redist12_sync_in_aunroll_x_in_c0_eni11_1_9_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist12_sync_in_aunroll_x_in_c0_eni11_1_9_rdcnt_i = TO_UNSIGNED(5, 3)) THEN
                redist12_sync_in_aunroll_x_in_c0_eni11_1_9_rdcnt_eq <= '1';
            ELSE
                redist12_sync_in_aunroll_x_in_c0_eni11_1_9_rdcnt_eq <= '0';
            END IF;
            IF (redist12_sync_in_aunroll_x_in_c0_eni11_1_9_rdcnt_eq = '1') THEN
                redist12_sync_in_aunroll_x_in_c0_eni11_1_9_rdcnt_i <= redist12_sync_in_aunroll_x_in_c0_eni11_1_9_rdcnt_i + 2;
            ELSE
                redist12_sync_in_aunroll_x_in_c0_eni11_1_9_rdcnt_i <= redist12_sync_in_aunroll_x_in_c0_eni11_1_9_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist12_sync_in_aunroll_x_in_c0_eni11_1_9_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist12_sync_in_aunroll_x_in_c0_eni11_1_9_rdcnt_i, 3)));

    -- redist12_sync_in_aunroll_x_in_c0_eni11_1_9_wraddr(REG,216)
    redist12_sync_in_aunroll_x_in_c0_eni11_1_9_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_sync_in_aunroll_x_in_c0_eni11_1_9_wraddr_q <= "110";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist12_sync_in_aunroll_x_in_c0_eni11_1_9_wraddr_q <= STD_LOGIC_VECTOR(redist12_sync_in_aunroll_x_in_c0_eni11_1_9_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist12_sync_in_aunroll_x_in_c0_eni11_1_9_mem(DUALMEM,214)
    redist12_sync_in_aunroll_x_in_c0_eni11_1_9_mem_ia <= STD_LOGIC_VECTOR(in_c0_eni11_1);
    redist12_sync_in_aunroll_x_in_c0_eni11_1_9_mem_aa <= redist12_sync_in_aunroll_x_in_c0_eni11_1_9_wraddr_q;
    redist12_sync_in_aunroll_x_in_c0_eni11_1_9_mem_ab <= redist12_sync_in_aunroll_x_in_c0_eni11_1_9_rdcnt_q;
    redist12_sync_in_aunroll_x_in_c0_eni11_1_9_mem_reset0 <= not (resetn);
    redist12_sync_in_aunroll_x_in_c0_eni11_1_9_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 7,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist12_sync_in_aunroll_x_in_c0_eni11_1_9_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist12_sync_in_aunroll_x_in_c0_eni11_1_9_mem_reset0,
        clock1 => clock,
        address_a => redist12_sync_in_aunroll_x_in_c0_eni11_1_9_mem_aa,
        data_a => redist12_sync_in_aunroll_x_in_c0_eni11_1_9_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist12_sync_in_aunroll_x_in_c0_eni11_1_9_mem_ab,
        q_b => redist12_sync_in_aunroll_x_in_c0_eni11_1_9_mem_iq
    );
    redist12_sync_in_aunroll_x_in_c0_eni11_1_9_mem_q <= redist12_sync_in_aunroll_x_in_c0_eni11_1_9_mem_iq(31 downto 0);

    -- redist12_sync_in_aunroll_x_in_c0_eni11_1_9_outputreg(DELAY,213)
    redist12_sync_in_aunroll_x_in_c0_eni11_1_9_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist12_sync_in_aunroll_x_in_c0_eni11_1_9_mem_q, xout => redist12_sync_in_aunroll_x_in_c0_eni11_1_9_outputreg_q, clk => clock, aclr => resetn );

    -- i_inc68_conv2d3x3(ADD,57)@10
    i_inc68_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & redist12_sync_in_aunroll_x_in_c0_eni11_1_9_outputreg_q);
    i_inc68_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_1gr_x_q);
    i_inc68_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc68_conv2d3x3_a) + UNSIGNED(i_inc68_conv2d3x3_b));
    i_inc68_conv2d3x3_q <= i_inc68_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_inc68_conv2d3x3_sel_x(BITSELECT,6)@10
    bgTrunc_i_inc68_conv2d3x3_sel_x_b <= i_inc68_conv2d3x3_q(31 downto 0);

    -- redist32_bgTrunc_i_inc68_conv2d3x3_sel_x_b_1(DELAY,208)
    redist32_bgTrunc_i_inc68_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_inc68_conv2d3x3_sel_x_b, xout => redist32_bgTrunc_i_inc68_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_exitcond27_conv2d3x3(LOGICAL,49)@11 + 1
    i_exitcond27_conv2d3x3_qi <= "1" WHEN redist32_bgTrunc_i_inc68_conv2d3x3_sel_x_b_1_q = i_syncbuf_input_channels_sync_buffer193_conv2d3x3_out_buffer_out ELSE "0";
    i_exitcond27_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_exitcond27_conv2d3x3_qi, xout => i_exitcond27_conv2d3x3_q, clk => clock, aclr => resetn );

    -- i_unnamed_conv2d3x380(LOGICAL,86)@12
    i_unnamed_conv2d3x380_q <= i_exitcond27_conv2d3x3_q or redist7_i_phi_decision44_xor_rm_conv2d3x3_q_1_q;

    -- redist21_sync_in_aunroll_x_in_c0_eni11_11_10(DELAY,197)
    redist21_sync_in_aunroll_x_in_c0_eni11_11_10 : dspba_delay
    GENERIC MAP ( width => 3, depth => 10, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni11_11, xout => redist21_sync_in_aunroll_x_in_c0_eni11_11_10_q, clk => clock, aclr => resetn );

    -- i_exitcond_conv2d3x3_cmp_sign(LOGICAL,165)@11
    i_exitcond_conv2d3x3_cmp_sign_q <= STD_LOGIC_VECTOR(redist21_sync_in_aunroll_x_in_c0_eni11_11_10_q(2 downto 2));

    -- i_unnamed_conv2d3x376(LOGICAL,85)@11
    i_unnamed_conv2d3x376_q <= i_exitcond_conv2d3x3_cmp_sign_q or i_phi_decision44_xor_rm_conv2d3x3_q;

    -- redist6_i_unnamed_conv2d3x376_q_1(DELAY,182)
    redist6_i_unnamed_conv2d3x376_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_conv2d3x376_q, xout => redist6_i_unnamed_conv2d3x376_q_1_q, clk => clock, aclr => resetn );

    -- i_for_end69_loopexit_loopexit_lc_cond_conv2d3x3(LOGICAL,51)@12
    i_for_end69_loopexit_loopexit_lc_cond_conv2d3x3_q <= redist6_i_unnamed_conv2d3x376_q_1_q and i_unnamed_conv2d3x380_q;

    -- redist13_sync_in_aunroll_x_in_c0_eni11_1_10(DELAY,189)
    redist13_sync_in_aunroll_x_in_c0_eni11_1_10 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist12_sync_in_aunroll_x_in_c0_eni11_1_9_outputreg_q, xout => redist13_sync_in_aunroll_x_in_c0_eni11_1_10_q, clk => clock, aclr => resetn );

    -- i_k_210_lc_outerphi_conv2d3x3(MUX,58)@11 + 1
    i_k_210_lc_outerphi_conv2d3x3_s <= i_unnamed_conv2d3x376_q;
    i_k_210_lc_outerphi_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_k_210_lc_outerphi_conv2d3x3_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_k_210_lc_outerphi_conv2d3x3_s) IS
                WHEN "0" => i_k_210_lc_outerphi_conv2d3x3_q <= redist13_sync_in_aunroll_x_in_c0_eni11_1_10_q;
                WHEN "1" => i_k_210_lc_outerphi_conv2d3x3_q <= redist32_bgTrunc_i_inc68_conv2d3x3_sel_x_b_1_q;
                WHEN OTHERS => i_k_210_lc_outerphi_conv2d3x3_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- c_i32_0gr(CONSTANT,41)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_notEnable(LOGICAL,243)
    redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_nor(LOGICAL,244)
    redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_nor_q <= not (redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_notEnable_q or redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_sticky_ena_q);

    -- redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_mem_last(CONSTANT,240)
    redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_mem_last_q <= "0111";

    -- redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_cmp(LOGICAL,241)
    redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_cmp_q <= "1" WHEN redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_mem_last_q = redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_rdcnt_q ELSE "0";

    -- redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_cmpReg(REG,242)
    redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_cmpReg_q <= STD_LOGIC_VECTOR(redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_cmp_q);
        END IF;
    END PROCESS;

    -- redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_sticky_ena(REG,245)
    redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_nor_q = "1") THEN
                redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_sticky_ena_q <= STD_LOGIC_VECTOR(redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_enaAnd(LOGICAL,246)
    redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_enaAnd_q <= redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_sticky_ena_q and VCC_q;

    -- redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_rdcnt(COUNTER,238)
    -- low=0, high=8, step=1, init=0
    redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_rdcnt_i = TO_UNSIGNED(7, 4)) THEN
                redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_rdcnt_eq <= '1';
            ELSE
                redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_rdcnt_eq <= '0';
            END IF;
            IF (redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_rdcnt_eq = '1') THEN
                redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_rdcnt_i <= redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_rdcnt_i + 8;
            ELSE
                redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_rdcnt_i <= redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_rdcnt_i, 4)));

    -- i_inc65_conv2d3x3(ADD,56)@1
    i_inc65_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & in_c0_eni11_3);
    i_inc65_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_1gr_x_q);
    i_inc65_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc65_conv2d3x3_a) + UNSIGNED(i_inc65_conv2d3x3_b));
    i_inc65_conv2d3x3_q <= i_inc65_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_inc65_conv2d3x3_sel_x(BITSELECT,5)@1
    bgTrunc_i_inc65_conv2d3x3_sel_x_b <= i_inc65_conv2d3x3_q(31 downto 0);

    -- redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_inputreg(DELAY,236)
    redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_inc65_conv2d3x3_sel_x_b, xout => redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_inputreg_q, clk => clock, aclr => resetn );

    -- redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_wraddr(REG,239)
    redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_wraddr_q <= "1000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_wraddr_q <= STD_LOGIC_VECTOR(redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_mem(DUALMEM,237)
    redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_mem_ia <= STD_LOGIC_VECTOR(redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_inputreg_q);
    redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_mem_aa <= redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_wraddr_q;
    redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_mem_ab <= redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_rdcnt_q;
    redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_mem_reset0 <= not (resetn);
    redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 4,
        numwords_a => 9,
        width_b => 32,
        widthad_b => 4,
        numwords_b => 9,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_mem_reset0,
        clock1 => clock,
        address_a => redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_mem_aa,
        data_a => redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_mem_ab,
        q_b => redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_mem_iq
    );
    redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_mem_q <= redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_mem_iq(31 downto 0);

    -- i_l_37_lc_innerphi_conv2d3x3(MUX,59)@12
    i_l_37_lc_innerphi_conv2d3x3_s <= redist6_i_unnamed_conv2d3x376_q_1_q;
    i_l_37_lc_innerphi_conv2d3x3_combproc: PROCESS (i_l_37_lc_innerphi_conv2d3x3_s, redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_mem_q, c_i32_0gr_q)
    BEGIN
        CASE (i_l_37_lc_innerphi_conv2d3x3_s) IS
            WHEN "0" => i_l_37_lc_innerphi_conv2d3x3_q <= redist33_bgTrunc_i_inc65_conv2d3x3_sel_x_b_11_mem_q;
            WHEN "1" => i_l_37_lc_innerphi_conv2d3x3_q <= c_i32_0gr_q;
            WHEN OTHERS => i_l_37_lc_innerphi_conv2d3x3_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- dupName_0_c_i3_1gr_x(CONSTANT,12)
    dupName_0_c_i3_1gr_x_q <= "001";

    -- c_i3_1gr(CONSTANT,44)
    c_i3_1gr_q <= "111";

    -- i_fpgaindvars_iv_next_conv2d3x3(ADD,53)@11
    i_fpgaindvars_iv_next_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & redist21_sync_in_aunroll_x_in_c0_eni11_11_10_q);
    i_fpgaindvars_iv_next_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & c_i3_1gr_q);
    i_fpgaindvars_iv_next_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_fpgaindvars_iv_next_conv2d3x3_a) + UNSIGNED(i_fpgaindvars_iv_next_conv2d3x3_b));
    i_fpgaindvars_iv_next_conv2d3x3_q <= i_fpgaindvars_iv_next_conv2d3x3_o(3 downto 0);

    -- bgTrunc_i_fpgaindvars_iv_next_conv2d3x3_sel_x(BITSELECT,4)@11
    bgTrunc_i_fpgaindvars_iv_next_conv2d3x3_sel_x_b <= i_fpgaindvars_iv_next_conv2d3x3_q(2 downto 0);

    -- redist34_bgTrunc_i_fpgaindvars_iv_next_conv2d3x3_sel_x_b_1(DELAY,210)
    redist34_bgTrunc_i_fpgaindvars_iv_next_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_fpgaindvars_iv_next_conv2d3x3_sel_x_b, xout => redist34_bgTrunc_i_fpgaindvars_iv_next_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_fpgaindvars_iv_lc_innerphi_conv2d3x3(MUX,52)@12
    i_fpgaindvars_iv_lc_innerphi_conv2d3x3_s <= redist6_i_unnamed_conv2d3x376_q_1_q;
    i_fpgaindvars_iv_lc_innerphi_conv2d3x3_combproc: PROCESS (i_fpgaindvars_iv_lc_innerphi_conv2d3x3_s, redist34_bgTrunc_i_fpgaindvars_iv_next_conv2d3x3_sel_x_b_1_q, dupName_0_c_i3_1gr_x_q)
    BEGIN
        CASE (i_fpgaindvars_iv_lc_innerphi_conv2d3x3_s) IS
            WHEN "0" => i_fpgaindvars_iv_lc_innerphi_conv2d3x3_q <= redist34_bgTrunc_i_fpgaindvars_iv_next_conv2d3x3_sel_x_b_1_q;
            WHEN "1" => i_fpgaindvars_iv_lc_innerphi_conv2d3x3_q <= dupName_0_c_i3_1gr_x_q;
            WHEN OTHERS => i_fpgaindvars_iv_lc_innerphi_conv2d3x3_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_phi_decision44_xor46_or189_demorgan_conv2d3x3(LOGICAL,72)@12
    i_phi_decision44_xor46_or189_demorgan_conv2d3x3_q <= redist8_i_or_cond2_conv2d3x3_q_9_q or redist10_i_or_cond2_1_conv2d3x3_q_9_q;

    -- i_phi_decision44_xor48_or190_demorgan_conv2d3x3(LOGICAL,74)@12
    i_phi_decision44_xor48_or190_demorgan_conv2d3x3_q <= i_phi_decision44_xor46_or189_demorgan_conv2d3x3_q or redist9_i_or_cond2_2_conv2d3x3_q_9_q;

    -- i_phi_decision44_xor48_or190_conv2d3x3(LOGICAL,73)@12
    i_phi_decision44_xor48_or190_conv2d3x3_q <= i_phi_decision44_xor48_or190_demorgan_conv2d3x3_q xor VCC_q;

    -- i_phi_decision44_xor_or_and_and_conv2d3x3(LOGICAL,75)@12
    i_phi_decision44_xor_or_and_and_conv2d3x3_q <= redist7_i_phi_decision44_xor_rm_conv2d3x3_q_1_q or i_phi_decision44_xor48_or190_conv2d3x3_q;

    -- redist20_sync_in_aunroll_x_in_c0_eni11_10_2(DELAY,196)
    redist20_sync_in_aunroll_x_in_c0_eni11_10_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni11_10, xout => redist20_sync_in_aunroll_x_in_c0_eni11_10_2_q, clk => clock, aclr => resetn );

    -- redist19_sync_in_aunroll_x_in_c0_eni11_9_2(DELAY,195)
    redist19_sync_in_aunroll_x_in_c0_eni11_9_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni11_9, xout => redist19_sync_in_aunroll_x_in_c0_eni11_9_2_q, clk => clock, aclr => resetn );

    -- i_syncbuf_input_size_sync_buffer_conv2d3x3(BLACKBOX,83)@0
    -- in in_i_dependence@2
    -- in in_valid_in@2
    -- out out_buffer_out@2
    -- out out_valid_out@2
    thei_syncbuf_input_size_sync_buffer_conv2d3x3 : i_syncbuf_input_size_sync_buffer_conv2d3x361
    PORT MAP (
        in_buffer_in => in_input_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist22_sync_in_aunroll_x_in_i_valid_1_q,
        out_buffer_out => i_syncbuf_input_size_sync_buffer_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_sub_conv2d3x3(ADD,77)@1
    i_sub_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & in_c0_eni11_2);
    i_sub_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & in_c0_eni11_3);
    i_sub_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sub_conv2d3x3_a) + UNSIGNED(i_sub_conv2d3x3_b));
    i_sub_conv2d3x3_q <= i_sub_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_sub_conv2d3x3_sel_x(BITSELECT,9)@1
    bgTrunc_i_sub_conv2d3x3_sel_x_b <= i_sub_conv2d3x3_q(31 downto 0);

    -- redist28_bgTrunc_i_sub_conv2d3x3_sel_x_b_1(DELAY,204)
    redist28_bgTrunc_i_sub_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_sub_conv2d3x3_sel_x_b, xout => redist28_bgTrunc_i_sub_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_cmp35_conv2d3x3(COMPARE,48)@2 + 1
    i_cmp35_conv2d3x3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist28_bgTrunc_i_sub_conv2d3x3_sel_x_b_1_q(31)) & redist28_bgTrunc_i_sub_conv2d3x3_sel_x_b_1_q));
    i_cmp35_conv2d3x3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_input_size_sync_buffer_conv2d3x3_out_buffer_out(31)) & i_syncbuf_input_size_sync_buffer_conv2d3x3_out_buffer_out));
    i_cmp35_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp35_conv2d3x3_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp35_conv2d3x3_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp35_conv2d3x3_a) - SIGNED(i_cmp35_conv2d3x3_b));
        END IF;
    END PROCESS;
    i_cmp35_conv2d3x3_c(0) <= i_cmp35_conv2d3x3_o(33);

    -- c_i32_1gr(CONSTANT,42)
    c_i32_1gr_q <= "11111111111111111111111111111111";

    -- i_cmp33_conv2d3x3(COMPARE,47)@2 + 1
    i_cmp33_conv2d3x3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_1gr_q(31)) & c_i32_1gr_q));
    i_cmp33_conv2d3x3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist28_bgTrunc_i_sub_conv2d3x3_sel_x_b_1_q(31)) & redist28_bgTrunc_i_sub_conv2d3x3_sel_x_b_1_q));
    i_cmp33_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp33_conv2d3x3_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp33_conv2d3x3_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp33_conv2d3x3_a) - SIGNED(i_cmp33_conv2d3x3_b));
        END IF;
    END PROCESS;
    i_cmp33_conv2d3x3_c(0) <= i_cmp33_conv2d3x3_o(33);

    -- i_or_cond_conv2d3x3(LOGICAL,71)@3
    i_or_cond_conv2d3x3_q <= i_cmp33_conv2d3x3_c and i_cmp35_conv2d3x3_c;

    -- i_or_cond1_2_conv2d3x3(LOGICAL,66)@3
    i_or_cond1_2_conv2d3x3_q <= i_or_cond_conv2d3x3_q and redist19_sync_in_aunroll_x_in_c0_eni11_9_2_q;

    -- i_or_cond2_2_conv2d3x3(LOGICAL,69)@3 + 1
    i_or_cond2_2_conv2d3x3_qi <= i_or_cond1_2_conv2d3x3_q and redist20_sync_in_aunroll_x_in_c0_eni11_10_2_q;
    i_or_cond2_2_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond2_2_conv2d3x3_qi, xout => i_or_cond2_2_conv2d3x3_q, clk => clock, aclr => resetn );

    -- redist9_i_or_cond2_2_conv2d3x3_q_9(DELAY,185)
    redist9_i_or_cond2_2_conv2d3x3_q_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond2_2_conv2d3x3_q, xout => redist9_i_or_cond2_2_conv2d3x3_q_9_q, clk => clock, aclr => resetn );

    -- redist18_sync_in_aunroll_x_in_c0_eni11_8_2(DELAY,194)
    redist18_sync_in_aunroll_x_in_c0_eni11_8_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni11_8, xout => redist18_sync_in_aunroll_x_in_c0_eni11_8_2_q, clk => clock, aclr => resetn );

    -- redist17_sync_in_aunroll_x_in_c0_eni11_7_2(DELAY,193)
    redist17_sync_in_aunroll_x_in_c0_eni11_7_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni11_7, xout => redist17_sync_in_aunroll_x_in_c0_eni11_7_2_q, clk => clock, aclr => resetn );

    -- i_or_cond1_1_conv2d3x3(LOGICAL,65)@3
    i_or_cond1_1_conv2d3x3_q <= i_or_cond_conv2d3x3_q and redist17_sync_in_aunroll_x_in_c0_eni11_7_2_q;

    -- i_or_cond2_1_conv2d3x3(LOGICAL,68)@3 + 1
    i_or_cond2_1_conv2d3x3_qi <= i_or_cond1_1_conv2d3x3_q and redist18_sync_in_aunroll_x_in_c0_eni11_8_2_q;
    i_or_cond2_1_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond2_1_conv2d3x3_qi, xout => i_or_cond2_1_conv2d3x3_q, clk => clock, aclr => resetn );

    -- redist10_i_or_cond2_1_conv2d3x3_q_9(DELAY,186)
    redist10_i_or_cond2_1_conv2d3x3_q_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond2_1_conv2d3x3_q, xout => redist10_i_or_cond2_1_conv2d3x3_q_9_q, clk => clock, aclr => resetn );

    -- i_arrayidx55_conv2d3x3_conv2d3x368_mult_multconst_x(CONSTANT,22)
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- i_mul43_conv2d3x3_bs4(BITSELECT,148)@1
    i_mul43_conv2d3x3_bs4_in <= STD_LOGIC_VECTOR(in_c0_eni11_1(17 downto 0));
    i_mul43_conv2d3x3_bs4_b <= STD_LOGIC_VECTOR(i_mul43_conv2d3x3_bs4_in(17 downto 0));

    -- i_mul43_conv2d3x3_bjA5(BITJOIN,149)@1
    i_mul43_conv2d3x3_bjA5_q <= GND_q & i_mul43_conv2d3x3_bs4_b;

    -- i_syncbuf_input_size_sync_buffer196_conv2d3x3(BLACKBOX,81)@0
    -- in in_i_dependence@1
    -- in in_valid_in@1
    -- out out_buffer_out@1
    -- out out_valid_out@1
    thei_syncbuf_input_size_sync_buffer196_conv2d3x3 : i_syncbuf_input_size_sync_buffer196_conv2d3x358
    PORT MAP (
        in_buffer_in => in_input_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_input_size_sync_buffer196_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_mul43_conv2d3x3_bs2_merged_bit_select(BITSELECT,174)@1
    i_mul43_conv2d3x3_bs2_merged_bit_select_b <= i_syncbuf_input_size_sync_buffer196_conv2d3x3_out_buffer_out(17 downto 0);
    i_mul43_conv2d3x3_bs2_merged_bit_select_c <= i_syncbuf_input_size_sync_buffer196_conv2d3x3_out_buffer_out(31 downto 18);

    -- i_mul43_conv2d3x3_bjB9(BITJOIN,153)@1
    i_mul43_conv2d3x3_bjB9_q <= GND_q & i_mul43_conv2d3x3_bs2_merged_bit_select_b;

    -- i_mul43_conv2d3x3_bs7(BITSELECT,151)@1
    i_mul43_conv2d3x3_bs7_b <= STD_LOGIC_VECTOR(in_c0_eni11_1(31 downto 18));

    -- i_mul43_conv2d3x3_ma3_cma(CHAINMULTADD,172)@1 + 2
    i_mul43_conv2d3x3_ma3_cma_reset <= not (resetn);
    i_mul43_conv2d3x3_ma3_cma_ena0 <= '1';
    i_mul43_conv2d3x3_ma3_cma_ena1 <= i_mul43_conv2d3x3_ma3_cma_ena0;
    i_mul43_conv2d3x3_ma3_cma_l(0) <= SIGNED(RESIZE(i_mul43_conv2d3x3_ma3_cma_a0(0),15));
    i_mul43_conv2d3x3_ma3_cma_l(1) <= SIGNED(RESIZE(i_mul43_conv2d3x3_ma3_cma_a0(1),15));
    i_mul43_conv2d3x3_ma3_cma_p(0) <= i_mul43_conv2d3x3_ma3_cma_l(0) * i_mul43_conv2d3x3_ma3_cma_c0(0);
    i_mul43_conv2d3x3_ma3_cma_p(1) <= i_mul43_conv2d3x3_ma3_cma_l(1) * i_mul43_conv2d3x3_ma3_cma_c0(1);
    i_mul43_conv2d3x3_ma3_cma_u(0) <= RESIZE(i_mul43_conv2d3x3_ma3_cma_p(0),35);
    i_mul43_conv2d3x3_ma3_cma_u(1) <= RESIZE(i_mul43_conv2d3x3_ma3_cma_p(1),35);
    i_mul43_conv2d3x3_ma3_cma_w(0) <= i_mul43_conv2d3x3_ma3_cma_u(0) + i_mul43_conv2d3x3_ma3_cma_u(1);
    i_mul43_conv2d3x3_ma3_cma_x(0) <= i_mul43_conv2d3x3_ma3_cma_w(0);
    i_mul43_conv2d3x3_ma3_cma_y(0) <= i_mul43_conv2d3x3_ma3_cma_x(0);
    i_mul43_conv2d3x3_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul43_conv2d3x3_ma3_cma_a0 <= (others => (others => '0'));
            i_mul43_conv2d3x3_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul43_conv2d3x3_ma3_cma_ena0 = '1') THEN
                i_mul43_conv2d3x3_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_mul43_conv2d3x3_bs7_b),14);
                i_mul43_conv2d3x3_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_mul43_conv2d3x3_bs2_merged_bit_select_c),14);
                i_mul43_conv2d3x3_ma3_cma_c0(0) <= RESIZE(SIGNED(i_mul43_conv2d3x3_bjB9_q),19);
                i_mul43_conv2d3x3_ma3_cma_c0(1) <= RESIZE(SIGNED(i_mul43_conv2d3x3_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_mul43_conv2d3x3_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul43_conv2d3x3_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul43_conv2d3x3_ma3_cma_ena1 = '1') THEN
                i_mul43_conv2d3x3_ma3_cma_s(0) <= i_mul43_conv2d3x3_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul43_conv2d3x3_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul43_conv2d3x3_ma3_cma_s(0)(33 downto 0)), xout => i_mul43_conv2d3x3_ma3_cma_qq, clk => clock, aclr => resetn );
    i_mul43_conv2d3x3_ma3_cma_q <= STD_LOGIC_VECTOR(i_mul43_conv2d3x3_ma3_cma_qq(33 downto 0));

    -- redist0_i_mul43_conv2d3x3_ma3_cma_q_1(DELAY,176)
    redist0_i_mul43_conv2d3x3_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul43_conv2d3x3_ma3_cma_q, xout => redist0_i_mul43_conv2d3x3_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul43_conv2d3x3_align_14(BITSHIFT,158)@4
    i_mul43_conv2d3x3_align_14_qint <= redist0_i_mul43_conv2d3x3_ma3_cma_q_1_q & "000000000000000000";
    i_mul43_conv2d3x3_align_14_q <= i_mul43_conv2d3x3_align_14_qint(51 downto 0);

    -- i_mul43_conv2d3x3_bs11(BITSELECT,155)@1
    i_mul43_conv2d3x3_bs11_b <= in_c0_eni11_1(31 downto 18);

    -- i_mul43_conv2d3x3_im10_cma(CHAINMULTADD,170)@1 + 2
    i_mul43_conv2d3x3_im10_cma_reset <= not (resetn);
    i_mul43_conv2d3x3_im10_cma_ena0 <= '1';
    i_mul43_conv2d3x3_im10_cma_ena1 <= i_mul43_conv2d3x3_im10_cma_ena0;
    i_mul43_conv2d3x3_im10_cma_p(0) <= i_mul43_conv2d3x3_im10_cma_a0(0) * i_mul43_conv2d3x3_im10_cma_c0(0);
    i_mul43_conv2d3x3_im10_cma_u(0) <= RESIZE(i_mul43_conv2d3x3_im10_cma_p(0),28);
    i_mul43_conv2d3x3_im10_cma_w(0) <= i_mul43_conv2d3x3_im10_cma_u(0);
    i_mul43_conv2d3x3_im10_cma_x(0) <= i_mul43_conv2d3x3_im10_cma_w(0);
    i_mul43_conv2d3x3_im10_cma_y(0) <= i_mul43_conv2d3x3_im10_cma_x(0);
    i_mul43_conv2d3x3_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul43_conv2d3x3_im10_cma_a0 <= (others => (others => '0'));
            i_mul43_conv2d3x3_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul43_conv2d3x3_im10_cma_ena0 = '1') THEN
                i_mul43_conv2d3x3_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_mul43_conv2d3x3_bs11_b),14);
                i_mul43_conv2d3x3_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_mul43_conv2d3x3_bs2_merged_bit_select_c),14);
            END IF;
        END IF;
    END PROCESS;
    i_mul43_conv2d3x3_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul43_conv2d3x3_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul43_conv2d3x3_im10_cma_ena1 = '1') THEN
                i_mul43_conv2d3x3_im10_cma_s(0) <= i_mul43_conv2d3x3_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul43_conv2d3x3_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul43_conv2d3x3_im10_cma_s(0)(27 downto 0)), xout => i_mul43_conv2d3x3_im10_cma_qq, clk => clock, aclr => resetn );
    i_mul43_conv2d3x3_im10_cma_q <= STD_LOGIC_VECTOR(i_mul43_conv2d3x3_im10_cma_qq(27 downto 0));

    -- redist2_i_mul43_conv2d3x3_im10_cma_q_1(DELAY,178)
    redist2_i_mul43_conv2d3x3_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul43_conv2d3x3_im10_cma_q, xout => redist2_i_mul43_conv2d3x3_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul43_conv2d3x3_bs1(BITSELECT,145)@1
    i_mul43_conv2d3x3_bs1_in <= in_c0_eni11_1(17 downto 0);
    i_mul43_conv2d3x3_bs1_b <= i_mul43_conv2d3x3_bs1_in(17 downto 0);

    -- i_mul43_conv2d3x3_im0_cma(CHAINMULTADD,169)@1 + 2
    i_mul43_conv2d3x3_im0_cma_reset <= not (resetn);
    i_mul43_conv2d3x3_im0_cma_ena0 <= '1';
    i_mul43_conv2d3x3_im0_cma_ena1 <= i_mul43_conv2d3x3_im0_cma_ena0;
    i_mul43_conv2d3x3_im0_cma_p(0) <= i_mul43_conv2d3x3_im0_cma_a0(0) * i_mul43_conv2d3x3_im0_cma_c0(0);
    i_mul43_conv2d3x3_im0_cma_u(0) <= RESIZE(i_mul43_conv2d3x3_im0_cma_p(0),36);
    i_mul43_conv2d3x3_im0_cma_w(0) <= i_mul43_conv2d3x3_im0_cma_u(0);
    i_mul43_conv2d3x3_im0_cma_x(0) <= i_mul43_conv2d3x3_im0_cma_w(0);
    i_mul43_conv2d3x3_im0_cma_y(0) <= i_mul43_conv2d3x3_im0_cma_x(0);
    i_mul43_conv2d3x3_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul43_conv2d3x3_im0_cma_a0 <= (others => (others => '0'));
            i_mul43_conv2d3x3_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul43_conv2d3x3_im0_cma_ena0 = '1') THEN
                i_mul43_conv2d3x3_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_mul43_conv2d3x3_bs1_b),18);
                i_mul43_conv2d3x3_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_mul43_conv2d3x3_bs2_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_mul43_conv2d3x3_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul43_conv2d3x3_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul43_conv2d3x3_im0_cma_ena1 = '1') THEN
                i_mul43_conv2d3x3_im0_cma_s(0) <= i_mul43_conv2d3x3_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul43_conv2d3x3_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul43_conv2d3x3_im0_cma_s(0)(35 downto 0)), xout => i_mul43_conv2d3x3_im0_cma_qq, clk => clock, aclr => resetn );
    i_mul43_conv2d3x3_im0_cma_q <= STD_LOGIC_VECTOR(i_mul43_conv2d3x3_im0_cma_qq(35 downto 0));

    -- redist3_i_mul43_conv2d3x3_im0_cma_q_1(DELAY,179)
    redist3_i_mul43_conv2d3x3_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul43_conv2d3x3_im0_cma_q, xout => redist3_i_mul43_conv2d3x3_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul43_conv2d3x3_join_13(BITJOIN,157)@4
    i_mul43_conv2d3x3_join_13_q <= redist2_i_mul43_conv2d3x3_im10_cma_q_1_q & redist3_i_mul43_conv2d3x3_im0_cma_q_1_q;

    -- i_mul43_conv2d3x3_result_add_0_0(ADD,160)@4
    i_mul43_conv2d3x3_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_mul43_conv2d3x3_join_13_q));
    i_mul43_conv2d3x3_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_mul43_conv2d3x3_align_14_q(51)) & i_mul43_conv2d3x3_align_14_q));
    i_mul43_conv2d3x3_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_mul43_conv2d3x3_result_add_0_0_a) + SIGNED(i_mul43_conv2d3x3_result_add_0_0_b));
    i_mul43_conv2d3x3_result_add_0_0_q <= i_mul43_conv2d3x3_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_mul43_conv2d3x3_rnd_sel(BITSELECT,123)@4
    bgTrunc_i_mul43_conv2d3x3_rnd_sel_in <= i_mul43_conv2d3x3_result_add_0_0_q(63 downto 0);
    bgTrunc_i_mul43_conv2d3x3_rnd_sel_b <= bgTrunc_i_mul43_conv2d3x3_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_mul43_conv2d3x3_sel_x(BITSELECT,7)@4
    bgTrunc_i_mul43_conv2d3x3_sel_x_b <= bgTrunc_i_mul43_conv2d3x3_rnd_sel_b(31 downto 0);

    -- redist31_bgTrunc_i_mul43_conv2d3x3_sel_x_b_1(DELAY,207)
    redist31_bgTrunc_i_mul43_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_mul43_conv2d3x3_sel_x_b, xout => redist31_bgTrunc_i_mul43_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- redist29_bgTrunc_i_sub_conv2d3x3_sel_x_b_4(DELAY,205)
    redist29_bgTrunc_i_sub_conv2d3x3_sel_x_b_4 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist28_bgTrunc_i_sub_conv2d3x3_sel_x_b_1_q, xout => redist29_bgTrunc_i_sub_conv2d3x3_sel_x_b_4_q, clk => clock, aclr => resetn );

    -- redist29_bgTrunc_i_sub_conv2d3x3_sel_x_b_4_outputreg(DELAY,235)
    redist29_bgTrunc_i_sub_conv2d3x3_sel_x_b_4_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist29_bgTrunc_i_sub_conv2d3x3_sel_x_b_4_q, xout => redist29_bgTrunc_i_sub_conv2d3x3_sel_x_b_4_outputreg_q, clk => clock, aclr => resetn );

    -- i_mul443_conv2d3x3(ADD,62)@5
    i_mul443_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & redist29_bgTrunc_i_sub_conv2d3x3_sel_x_b_4_outputreg_q);
    i_mul443_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & redist31_bgTrunc_i_mul43_conv2d3x3_sel_x_b_1_q);
    i_mul443_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_mul443_conv2d3x3_a) + UNSIGNED(i_mul443_conv2d3x3_b));
    i_mul443_conv2d3x3_q <= i_mul443_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_mul443_conv2d3x3_sel_x(BITSELECT,8)@5
    bgTrunc_i_mul443_conv2d3x3_sel_x_b <= i_mul443_conv2d3x3_q(31 downto 0);

    -- redist30_bgTrunc_i_mul443_conv2d3x3_sel_x_b_1(DELAY,206)
    redist30_bgTrunc_i_mul443_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_mul443_conv2d3x3_sel_x_b, xout => redist30_bgTrunc_i_mul443_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_add49_conv2d3x3_bs4(BITSELECT,130)@6
    i_add49_conv2d3x3_bs4_in <= STD_LOGIC_VECTOR(redist30_bgTrunc_i_mul443_conv2d3x3_sel_x_b_1_q(17 downto 0));
    i_add49_conv2d3x3_bs4_b <= STD_LOGIC_VECTOR(i_add49_conv2d3x3_bs4_in(17 downto 0));

    -- i_add49_conv2d3x3_bjA5(BITJOIN,131)@6
    i_add49_conv2d3x3_bjA5_q <= GND_q & i_add49_conv2d3x3_bs4_b;

    -- i_syncbuf_input_size_sync_buffer197_conv2d3x3(BLACKBOX,82)@0
    -- in in_i_dependence@6
    -- in in_valid_in@6
    -- out out_buffer_out@6
    -- out out_valid_out@6
    thei_syncbuf_input_size_sync_buffer197_conv2d3x3 : i_syncbuf_input_size_sync_buffer197_conv2d3x364
    PORT MAP (
        in_buffer_in => in_input_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist23_sync_in_aunroll_x_in_i_valid_5_q,
        out_buffer_out => i_syncbuf_input_size_sync_buffer197_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_add49_conv2d3x3_bs2_merged_bit_select(BITSELECT,175)@6
    i_add49_conv2d3x3_bs2_merged_bit_select_b <= i_syncbuf_input_size_sync_buffer197_conv2d3x3_out_buffer_out(17 downto 0);
    i_add49_conv2d3x3_bs2_merged_bit_select_c <= i_syncbuf_input_size_sync_buffer197_conv2d3x3_out_buffer_out(31 downto 18);

    -- i_add49_conv2d3x3_bjB9(BITJOIN,135)@6
    i_add49_conv2d3x3_bjB9_q <= GND_q & i_add49_conv2d3x3_bs2_merged_bit_select_b;

    -- i_add49_conv2d3x3_bs7(BITSELECT,133)@6
    i_add49_conv2d3x3_bs7_b <= STD_LOGIC_VECTOR(redist30_bgTrunc_i_mul443_conv2d3x3_sel_x_b_1_q(31 downto 18));

    -- i_add49_conv2d3x3_ma3_cma(CHAINMULTADD,171)@6 + 2
    i_add49_conv2d3x3_ma3_cma_reset <= not (resetn);
    i_add49_conv2d3x3_ma3_cma_ena0 <= '1';
    i_add49_conv2d3x3_ma3_cma_ena1 <= i_add49_conv2d3x3_ma3_cma_ena0;
    i_add49_conv2d3x3_ma3_cma_l(0) <= SIGNED(RESIZE(i_add49_conv2d3x3_ma3_cma_a0(0),15));
    i_add49_conv2d3x3_ma3_cma_l(1) <= SIGNED(RESIZE(i_add49_conv2d3x3_ma3_cma_a0(1),15));
    i_add49_conv2d3x3_ma3_cma_p(0) <= i_add49_conv2d3x3_ma3_cma_l(0) * i_add49_conv2d3x3_ma3_cma_c0(0);
    i_add49_conv2d3x3_ma3_cma_p(1) <= i_add49_conv2d3x3_ma3_cma_l(1) * i_add49_conv2d3x3_ma3_cma_c0(1);
    i_add49_conv2d3x3_ma3_cma_u(0) <= RESIZE(i_add49_conv2d3x3_ma3_cma_p(0),35);
    i_add49_conv2d3x3_ma3_cma_u(1) <= RESIZE(i_add49_conv2d3x3_ma3_cma_p(1),35);
    i_add49_conv2d3x3_ma3_cma_w(0) <= i_add49_conv2d3x3_ma3_cma_u(0) + i_add49_conv2d3x3_ma3_cma_u(1);
    i_add49_conv2d3x3_ma3_cma_x(0) <= i_add49_conv2d3x3_ma3_cma_w(0);
    i_add49_conv2d3x3_ma3_cma_y(0) <= i_add49_conv2d3x3_ma3_cma_x(0);
    i_add49_conv2d3x3_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_add49_conv2d3x3_ma3_cma_a0 <= (others => (others => '0'));
            i_add49_conv2d3x3_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_add49_conv2d3x3_ma3_cma_ena0 = '1') THEN
                i_add49_conv2d3x3_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_add49_conv2d3x3_bs7_b),14);
                i_add49_conv2d3x3_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_add49_conv2d3x3_bs2_merged_bit_select_c),14);
                i_add49_conv2d3x3_ma3_cma_c0(0) <= RESIZE(SIGNED(i_add49_conv2d3x3_bjB9_q),19);
                i_add49_conv2d3x3_ma3_cma_c0(1) <= RESIZE(SIGNED(i_add49_conv2d3x3_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_add49_conv2d3x3_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_add49_conv2d3x3_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_add49_conv2d3x3_ma3_cma_ena1 = '1') THEN
                i_add49_conv2d3x3_ma3_cma_s(0) <= i_add49_conv2d3x3_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_add49_conv2d3x3_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_add49_conv2d3x3_ma3_cma_s(0)(33 downto 0)), xout => i_add49_conv2d3x3_ma3_cma_qq, clk => clock, aclr => resetn );
    i_add49_conv2d3x3_ma3_cma_q <= STD_LOGIC_VECTOR(i_add49_conv2d3x3_ma3_cma_qq(33 downto 0));

    -- redist1_i_add49_conv2d3x3_ma3_cma_q_1(DELAY,177)
    redist1_i_add49_conv2d3x3_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add49_conv2d3x3_ma3_cma_q, xout => redist1_i_add49_conv2d3x3_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_add49_conv2d3x3_align_14(BITSHIFT,140)@9
    i_add49_conv2d3x3_align_14_qint <= redist1_i_add49_conv2d3x3_ma3_cma_q_1_q & "000000000000000000";
    i_add49_conv2d3x3_align_14_q <= i_add49_conv2d3x3_align_14_qint(51 downto 0);

    -- i_add49_conv2d3x3_bs11(BITSELECT,137)@6
    i_add49_conv2d3x3_bs11_b <= redist30_bgTrunc_i_mul443_conv2d3x3_sel_x_b_1_q(31 downto 18);

    -- i_add49_conv2d3x3_im10_cma(CHAINMULTADD,168)@6 + 2
    i_add49_conv2d3x3_im10_cma_reset <= not (resetn);
    i_add49_conv2d3x3_im10_cma_ena0 <= '1';
    i_add49_conv2d3x3_im10_cma_ena1 <= i_add49_conv2d3x3_im10_cma_ena0;
    i_add49_conv2d3x3_im10_cma_p(0) <= i_add49_conv2d3x3_im10_cma_a0(0) * i_add49_conv2d3x3_im10_cma_c0(0);
    i_add49_conv2d3x3_im10_cma_u(0) <= RESIZE(i_add49_conv2d3x3_im10_cma_p(0),28);
    i_add49_conv2d3x3_im10_cma_w(0) <= i_add49_conv2d3x3_im10_cma_u(0);
    i_add49_conv2d3x3_im10_cma_x(0) <= i_add49_conv2d3x3_im10_cma_w(0);
    i_add49_conv2d3x3_im10_cma_y(0) <= i_add49_conv2d3x3_im10_cma_x(0);
    i_add49_conv2d3x3_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_add49_conv2d3x3_im10_cma_a0 <= (others => (others => '0'));
            i_add49_conv2d3x3_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_add49_conv2d3x3_im10_cma_ena0 = '1') THEN
                i_add49_conv2d3x3_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_add49_conv2d3x3_bs11_b),14);
                i_add49_conv2d3x3_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_add49_conv2d3x3_bs2_merged_bit_select_c),14);
            END IF;
        END IF;
    END PROCESS;
    i_add49_conv2d3x3_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_add49_conv2d3x3_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_add49_conv2d3x3_im10_cma_ena1 = '1') THEN
                i_add49_conv2d3x3_im10_cma_s(0) <= i_add49_conv2d3x3_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_add49_conv2d3x3_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_add49_conv2d3x3_im10_cma_s(0)(27 downto 0)), xout => i_add49_conv2d3x3_im10_cma_qq, clk => clock, aclr => resetn );
    i_add49_conv2d3x3_im10_cma_q <= STD_LOGIC_VECTOR(i_add49_conv2d3x3_im10_cma_qq(27 downto 0));

    -- redist4_i_add49_conv2d3x3_im10_cma_q_1(DELAY,180)
    redist4_i_add49_conv2d3x3_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add49_conv2d3x3_im10_cma_q, xout => redist4_i_add49_conv2d3x3_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_add49_conv2d3x3_bs1(BITSELECT,127)@6
    i_add49_conv2d3x3_bs1_in <= redist30_bgTrunc_i_mul443_conv2d3x3_sel_x_b_1_q(17 downto 0);
    i_add49_conv2d3x3_bs1_b <= i_add49_conv2d3x3_bs1_in(17 downto 0);

    -- i_add49_conv2d3x3_im0_cma(CHAINMULTADD,167)@6 + 2
    i_add49_conv2d3x3_im0_cma_reset <= not (resetn);
    i_add49_conv2d3x3_im0_cma_ena0 <= '1';
    i_add49_conv2d3x3_im0_cma_ena1 <= i_add49_conv2d3x3_im0_cma_ena0;
    i_add49_conv2d3x3_im0_cma_p(0) <= i_add49_conv2d3x3_im0_cma_a0(0) * i_add49_conv2d3x3_im0_cma_c0(0);
    i_add49_conv2d3x3_im0_cma_u(0) <= RESIZE(i_add49_conv2d3x3_im0_cma_p(0),36);
    i_add49_conv2d3x3_im0_cma_w(0) <= i_add49_conv2d3x3_im0_cma_u(0);
    i_add49_conv2d3x3_im0_cma_x(0) <= i_add49_conv2d3x3_im0_cma_w(0);
    i_add49_conv2d3x3_im0_cma_y(0) <= i_add49_conv2d3x3_im0_cma_x(0);
    i_add49_conv2d3x3_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_add49_conv2d3x3_im0_cma_a0 <= (others => (others => '0'));
            i_add49_conv2d3x3_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_add49_conv2d3x3_im0_cma_ena0 = '1') THEN
                i_add49_conv2d3x3_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_add49_conv2d3x3_bs1_b),18);
                i_add49_conv2d3x3_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_add49_conv2d3x3_bs2_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_add49_conv2d3x3_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_add49_conv2d3x3_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_add49_conv2d3x3_im0_cma_ena1 = '1') THEN
                i_add49_conv2d3x3_im0_cma_s(0) <= i_add49_conv2d3x3_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_add49_conv2d3x3_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_add49_conv2d3x3_im0_cma_s(0)(35 downto 0)), xout => i_add49_conv2d3x3_im0_cma_qq, clk => clock, aclr => resetn );
    i_add49_conv2d3x3_im0_cma_q <= STD_LOGIC_VECTOR(i_add49_conv2d3x3_im0_cma_qq(35 downto 0));

    -- redist5_i_add49_conv2d3x3_im0_cma_q_1(DELAY,181)
    redist5_i_add49_conv2d3x3_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add49_conv2d3x3_im0_cma_q, xout => redist5_i_add49_conv2d3x3_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_add49_conv2d3x3_join_13(BITJOIN,139)@9
    i_add49_conv2d3x3_join_13_q <= redist4_i_add49_conv2d3x3_im10_cma_q_1_q & redist5_i_add49_conv2d3x3_im0_cma_q_1_q;

    -- i_add49_conv2d3x3_result_add_0_0(ADD,142)@9
    i_add49_conv2d3x3_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_add49_conv2d3x3_join_13_q));
    i_add49_conv2d3x3_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_add49_conv2d3x3_align_14_q(51)) & i_add49_conv2d3x3_align_14_q));
    i_add49_conv2d3x3_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_add49_conv2d3x3_result_add_0_0_a) + SIGNED(i_add49_conv2d3x3_result_add_0_0_b));
    i_add49_conv2d3x3_result_add_0_0_q <= i_add49_conv2d3x3_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_add49_conv2d3x3_rnd_sel(BITSELECT,118)@9
    bgTrunc_i_add49_conv2d3x3_rnd_sel_in <= i_add49_conv2d3x3_result_add_0_0_q(63 downto 0);
    bgTrunc_i_add49_conv2d3x3_rnd_sel_b <= bgTrunc_i_add49_conv2d3x3_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_add49_conv2d3x3_sel_x(BITSELECT,2)@9
    bgTrunc_i_add49_conv2d3x3_sel_x_b <= bgTrunc_i_add49_conv2d3x3_rnd_sel_b(31 downto 0);

    -- redist36_bgTrunc_i_add49_conv2d3x3_sel_x_b_1(DELAY,212)
    redist36_bgTrunc_i_add49_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add49_conv2d3x3_sel_x_b, xout => redist36_bgTrunc_i_add49_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- redist14_sync_in_aunroll_x_in_c0_eni11_4_9_notEnable(LOGICAL,231)
    redist14_sync_in_aunroll_x_in_c0_eni11_4_9_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist14_sync_in_aunroll_x_in_c0_eni11_4_9_nor(LOGICAL,232)
    redist14_sync_in_aunroll_x_in_c0_eni11_4_9_nor_q <= not (redist14_sync_in_aunroll_x_in_c0_eni11_4_9_notEnable_q or redist14_sync_in_aunroll_x_in_c0_eni11_4_9_sticky_ena_q);

    -- redist14_sync_in_aunroll_x_in_c0_eni11_4_9_mem_last(CONSTANT,228)
    redist14_sync_in_aunroll_x_in_c0_eni11_4_9_mem_last_q <= "0101";

    -- redist14_sync_in_aunroll_x_in_c0_eni11_4_9_cmp(LOGICAL,229)
    redist14_sync_in_aunroll_x_in_c0_eni11_4_9_cmp_b <= STD_LOGIC_VECTOR("0" & redist14_sync_in_aunroll_x_in_c0_eni11_4_9_rdcnt_q);
    redist14_sync_in_aunroll_x_in_c0_eni11_4_9_cmp_q <= "1" WHEN redist14_sync_in_aunroll_x_in_c0_eni11_4_9_mem_last_q = redist14_sync_in_aunroll_x_in_c0_eni11_4_9_cmp_b ELSE "0";

    -- redist14_sync_in_aunroll_x_in_c0_eni11_4_9_cmpReg(REG,230)
    redist14_sync_in_aunroll_x_in_c0_eni11_4_9_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_sync_in_aunroll_x_in_c0_eni11_4_9_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist14_sync_in_aunroll_x_in_c0_eni11_4_9_cmpReg_q <= STD_LOGIC_VECTOR(redist14_sync_in_aunroll_x_in_c0_eni11_4_9_cmp_q);
        END IF;
    END PROCESS;

    -- redist14_sync_in_aunroll_x_in_c0_eni11_4_9_sticky_ena(REG,233)
    redist14_sync_in_aunroll_x_in_c0_eni11_4_9_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_sync_in_aunroll_x_in_c0_eni11_4_9_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist14_sync_in_aunroll_x_in_c0_eni11_4_9_nor_q = "1") THEN
                redist14_sync_in_aunroll_x_in_c0_eni11_4_9_sticky_ena_q <= STD_LOGIC_VECTOR(redist14_sync_in_aunroll_x_in_c0_eni11_4_9_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist14_sync_in_aunroll_x_in_c0_eni11_4_9_enaAnd(LOGICAL,234)
    redist14_sync_in_aunroll_x_in_c0_eni11_4_9_enaAnd_q <= redist14_sync_in_aunroll_x_in_c0_eni11_4_9_sticky_ena_q and VCC_q;

    -- redist14_sync_in_aunroll_x_in_c0_eni11_4_9_rdcnt(COUNTER,226)
    -- low=0, high=6, step=1, init=0
    redist14_sync_in_aunroll_x_in_c0_eni11_4_9_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_sync_in_aunroll_x_in_c0_eni11_4_9_rdcnt_i <= TO_UNSIGNED(0, 3);
            redist14_sync_in_aunroll_x_in_c0_eni11_4_9_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist14_sync_in_aunroll_x_in_c0_eni11_4_9_rdcnt_i = TO_UNSIGNED(5, 3)) THEN
                redist14_sync_in_aunroll_x_in_c0_eni11_4_9_rdcnt_eq <= '1';
            ELSE
                redist14_sync_in_aunroll_x_in_c0_eni11_4_9_rdcnt_eq <= '0';
            END IF;
            IF (redist14_sync_in_aunroll_x_in_c0_eni11_4_9_rdcnt_eq = '1') THEN
                redist14_sync_in_aunroll_x_in_c0_eni11_4_9_rdcnt_i <= redist14_sync_in_aunroll_x_in_c0_eni11_4_9_rdcnt_i + 2;
            ELSE
                redist14_sync_in_aunroll_x_in_c0_eni11_4_9_rdcnt_i <= redist14_sync_in_aunroll_x_in_c0_eni11_4_9_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist14_sync_in_aunroll_x_in_c0_eni11_4_9_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist14_sync_in_aunroll_x_in_c0_eni11_4_9_rdcnt_i, 3)));

    -- redist14_sync_in_aunroll_x_in_c0_eni11_4_9_wraddr(REG,227)
    redist14_sync_in_aunroll_x_in_c0_eni11_4_9_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_sync_in_aunroll_x_in_c0_eni11_4_9_wraddr_q <= "110";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist14_sync_in_aunroll_x_in_c0_eni11_4_9_wraddr_q <= STD_LOGIC_VECTOR(redist14_sync_in_aunroll_x_in_c0_eni11_4_9_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist14_sync_in_aunroll_x_in_c0_eni11_4_9_mem(DUALMEM,225)
    redist14_sync_in_aunroll_x_in_c0_eni11_4_9_mem_ia <= STD_LOGIC_VECTOR(in_c0_eni11_4);
    redist14_sync_in_aunroll_x_in_c0_eni11_4_9_mem_aa <= redist14_sync_in_aunroll_x_in_c0_eni11_4_9_wraddr_q;
    redist14_sync_in_aunroll_x_in_c0_eni11_4_9_mem_ab <= redist14_sync_in_aunroll_x_in_c0_eni11_4_9_rdcnt_q;
    redist14_sync_in_aunroll_x_in_c0_eni11_4_9_mem_reset0 <= not (resetn);
    redist14_sync_in_aunroll_x_in_c0_eni11_4_9_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 7,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist14_sync_in_aunroll_x_in_c0_eni11_4_9_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist14_sync_in_aunroll_x_in_c0_eni11_4_9_mem_reset0,
        clock1 => clock,
        address_a => redist14_sync_in_aunroll_x_in_c0_eni11_4_9_mem_aa,
        data_a => redist14_sync_in_aunroll_x_in_c0_eni11_4_9_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist14_sync_in_aunroll_x_in_c0_eni11_4_9_mem_ab,
        q_b => redist14_sync_in_aunroll_x_in_c0_eni11_4_9_mem_iq
    );
    redist14_sync_in_aunroll_x_in_c0_eni11_4_9_mem_q <= redist14_sync_in_aunroll_x_in_c0_eni11_4_9_mem_iq(31 downto 0);

    -- redist14_sync_in_aunroll_x_in_c0_eni11_4_9_outputreg(DELAY,224)
    redist14_sync_in_aunroll_x_in_c0_eni11_4_9_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist14_sync_in_aunroll_x_in_c0_eni11_4_9_mem_q, xout => redist14_sync_in_aunroll_x_in_c0_eni11_4_9_outputreg_q, clk => clock, aclr => resetn );

    -- i_add52_conv2d3x3(ADD,46)@10
    i_add52_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & redist14_sync_in_aunroll_x_in_c0_eni11_4_9_outputreg_q);
    i_add52_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & redist36_bgTrunc_i_add49_conv2d3x3_sel_x_b_1_q);
    i_add52_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add52_conv2d3x3_a) + UNSIGNED(i_add52_conv2d3x3_b));
    i_add52_conv2d3x3_q <= i_add52_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_add52_conv2d3x3_sel_x(BITSELECT,3)@10
    bgTrunc_i_add52_conv2d3x3_sel_x_b <= i_add52_conv2d3x3_q(31 downto 0);

    -- redist35_bgTrunc_i_add52_conv2d3x3_sel_x_b_1(DELAY,211)
    redist35_bgTrunc_i_add52_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add52_conv2d3x3_sel_x_b, xout => redist35_bgTrunc_i_add52_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_idxprom54_conv2d3x3_sel_x(BITSELECT,28)@11
    i_idxprom54_conv2d3x3_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist35_bgTrunc_i_add52_conv2d3x3_sel_x_b_1_q(31 downto 0)), 64)));

    -- i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_bs1_merged_bit_select(BITSELECT,173)@11
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_bs1_merged_bit_select_b <= i_idxprom54_conv2d3x3_sel_x_b(17 downto 0);
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_bs1_merged_bit_select_c <= i_idxprom54_conv2d3x3_sel_x_b(63 downto 54);
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_bs1_merged_bit_select_d <= i_idxprom54_conv2d3x3_sel_x_b(35 downto 18);
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_bs1_merged_bit_select_e <= i_idxprom54_conv2d3x3_sel_x_b(53 downto 36);

    -- i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im3_shift0(BITSHIFT,162)@11
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im3_shift0_qint <= i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im3_shift0_q <= i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_align_15(BITSHIFT,115)@11
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_align_15_q <= i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im6_shift0(BITSHIFT,163)@11
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im6_shift0_qint <= i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im6_shift0_q <= i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_align_14(BITSHIFT,114)@11
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_align_14_q <= i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_join_16(BITJOIN,116)@11
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_join_16_q <= i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_align_15_q & i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_align_14_q;

    -- i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im9_shift0(BITSHIFT,164)@11
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im9_shift0_qint <= i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im9_shift0_q <= i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_align_12(BITSHIFT,112)@11
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_align_12_q <= i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im0_shift0(BITSHIFT,161)@11
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im0_shift0_qint <= i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im0_shift0_q <= i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_join_13(BITJOIN,113)@11
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_join_13_q <= i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_im0_shift0_q);

    -- i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_result_add_0_0(ADD,117)@11
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_join_13_q);
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_join_16_q);
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_result_add_0_0_b));
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_result_add_0_0_q <= i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx55_conv2d3x3_conv2d3x368_mult_extender_x(BITJOIN,21)@11
    i_arrayidx55_conv2d3x3_conv2d3x368_mult_extender_x_q <= i_arrayidx55_conv2d3x3_conv2d3x368_mult_multconst_x_q & i_arrayidx55_conv2d3x3_conv2d3x368_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx55_conv2d3x3_conv2d3x368_trunc_sel_x(BITSELECT,23)@11
    i_arrayidx55_conv2d3x3_conv2d3x368_trunc_sel_x_b <= i_arrayidx55_conv2d3x3_conv2d3x368_mult_extender_x_q(63 downto 0);

    -- redist27_i_arrayidx55_conv2d3x3_conv2d3x368_trunc_sel_x_b_1(DELAY,203)
    redist27_i_arrayidx55_conv2d3x3_conv2d3x368_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_arrayidx55_conv2d3x3_conv2d3x368_trunc_sel_x_b, xout => redist27_i_arrayidx55_conv2d3x3_conv2d3x368_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_input_im_sync_buffer_conv2d3x3(BLACKBOX,80)@0
    -- in in_i_dependence@12
    -- in in_valid_in@12
    -- out out_buffer_out@12
    -- out out_valid_out@12
    thei_syncbuf_input_im_sync_buffer_conv2d3x3 : i_syncbuf_input_im_sync_buffer_conv2d3x366
    PORT MAP (
        in_buffer_in => in_input_im,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist26_sync_in_aunroll_x_in_i_valid_11_q,
        out_buffer_out => i_syncbuf_input_im_sync_buffer_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx55_conv2d3x3_conv2d3x368_add_x(ADD,24)@12
    i_arrayidx55_conv2d3x3_conv2d3x368_add_x_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_input_im_sync_buffer_conv2d3x3_out_buffer_out);
    i_arrayidx55_conv2d3x3_conv2d3x368_add_x_b <= STD_LOGIC_VECTOR("0" & redist27_i_arrayidx55_conv2d3x3_conv2d3x368_trunc_sel_x_b_1_q);
    i_arrayidx55_conv2d3x3_conv2d3x368_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx55_conv2d3x3_conv2d3x368_add_x_a) + UNSIGNED(i_arrayidx55_conv2d3x3_conv2d3x368_add_x_b));
    i_arrayidx55_conv2d3x3_conv2d3x368_add_x_q <= i_arrayidx55_conv2d3x3_conv2d3x368_add_x_o(64 downto 0);

    -- i_arrayidx55_conv2d3x3_conv2d3x368_dupName_0_trunc_sel_x(BITSELECT,18)@12
    i_arrayidx55_conv2d3x3_conv2d3x368_dupName_0_trunc_sel_x_b <= i_arrayidx55_conv2d3x3_conv2d3x368_add_x_q(63 downto 0);

    -- redist11_i_notlhs_conv2d3x3_c_2(DELAY,187)
    redist11_i_notlhs_conv2d3x3_c_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_notlhs_conv2d3x3_c, xout => redist11_i_notlhs_conv2d3x3_c_2_q, clk => clock, aclr => resetn );

    -- redist16_sync_in_aunroll_x_in_c0_eni11_6_2(DELAY,192)
    redist16_sync_in_aunroll_x_in_c0_eni11_6_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni11_6, xout => redist16_sync_in_aunroll_x_in_c0_eni11_6_2_q, clk => clock, aclr => resetn );

    -- redist15_sync_in_aunroll_x_in_c0_eni11_5_2(DELAY,191)
    redist15_sync_in_aunroll_x_in_c0_eni11_5_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni11_5, xout => redist15_sync_in_aunroll_x_in_c0_eni11_5_2_q, clk => clock, aclr => resetn );

    -- i_or_cond1_conv2d3x3(LOGICAL,67)@3
    i_or_cond1_conv2d3x3_q <= i_or_cond_conv2d3x3_q and redist15_sync_in_aunroll_x_in_c0_eni11_5_2_q;

    -- i_or_cond2_conv2d3x3(LOGICAL,70)@3 + 1
    i_or_cond2_conv2d3x3_qi <= i_or_cond1_conv2d3x3_q and redist16_sync_in_aunroll_x_in_c0_eni11_6_2_q;
    i_or_cond2_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond2_conv2d3x3_qi, xout => i_or_cond2_conv2d3x3_q, clk => clock, aclr => resetn );

    -- redist8_i_or_cond2_conv2d3x3_q_9(DELAY,184)
    redist8_i_or_cond2_conv2d3x3_q_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_cond2_conv2d3x3_q, xout => redist8_i_or_cond2_conv2d3x3_q_9_q, clk => clock, aclr => resetn );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,30)@12
    out_c0_exi10_0 <= GND_q;
    out_c0_exi10_1 <= redist8_i_or_cond2_conv2d3x3_q_9_q;
    out_c0_exi10_2 <= redist11_i_notlhs_conv2d3x3_c_2_q;
    out_c0_exi10_3 <= i_arrayidx55_conv2d3x3_conv2d3x368_dupName_0_trunc_sel_x_b;
    out_c0_exi10_4 <= redist10_i_or_cond2_1_conv2d3x3_q_9_q;
    out_c0_exi10_5 <= redist9_i_or_cond2_2_conv2d3x3_q_9_q;
    out_c0_exi10_6 <= i_phi_decision44_xor_or_and_and_conv2d3x3_q;
    out_c0_exi10_7 <= i_fpgaindvars_iv_lc_innerphi_conv2d3x3_q;
    out_c0_exi10_8 <= i_l_37_lc_innerphi_conv2d3x3_q;
    out_c0_exi10_9 <= i_k_210_lc_outerphi_conv2d3x3_q;
    out_c0_exi10_10 <= i_for_end69_loopexit_loopexit_lc_cond_conv2d3x3_q;
    out_o_valid <= redist26_sync_in_aunroll_x_in_i_valid_11_q;

END normal;
