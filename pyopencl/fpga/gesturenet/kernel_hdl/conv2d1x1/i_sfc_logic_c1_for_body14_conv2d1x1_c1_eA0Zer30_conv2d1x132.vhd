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

-- VHDL created from i_sfc_logic_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x132
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

entity i_sfc_logic_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x132 is
    port (
        in_c1_eni3_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni3_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni3_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni3_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size_x : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_size_y : in std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exi10_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi10_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi10_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi10_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi10_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi10_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi10_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi10_7 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exi10_8 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exi10_9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exi10_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x132;

architecture normal of i_sfc_logic_c1_for_body14_conv2d1x1_c1_enter30_conv2d1x132 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_syncbuf_input_channels_sync_buffer4_conv2d1x143 is
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


    component i_syncbuf_input_channels_sync_buffer5_conv2d1x146 is
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


    component i_syncbuf_input_channels_sync_buffer6_conv2d1x163 is
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


    component i_syncbuf_input_channels_sync_buffer_conv2d1x134 is
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


    component i_syncbuf_input_im_sync_buffer21_conv2d1x153 is
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


    component i_syncbuf_input_im_sync_buffer22_conv2d1x160 is
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


    component i_syncbuf_input_size_x_sync_buffer11_conv2d1x151 is
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


    component i_syncbuf_input_size_x_sync_buffer12_conv2d1x158 is
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


    component i_syncbuf_input_size_x_sync_buffer_conv2d1x137 is
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


    component i_syncbuf_input_size_y_sync_buffer17_conv2d1x149 is
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


    component i_syncbuf_input_size_y_sync_buffer18_conv2d1x156 is
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


    component i_syncbuf_input_size_y_sync_buffer_conv2d1x140 is
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
    signal bgTrunc_i_add18_1_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add18_2_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_inc_1_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_inc_2_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_inc_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul16_1_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul16_2_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_tmp1_1_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_tmp1_2_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_tmp_1_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_tmp_2_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_idxprom19_1_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom19_2_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_2gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_3gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add18_1_conv2d1x1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add18_1_conv2d1x1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add18_1_conv2d1x1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add18_1_conv2d1x1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add18_2_conv2d1x1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add18_2_conv2d1x1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add18_2_conv2d1x1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add18_2_conv2d1x1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_cmp122_neg_or43_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp122_neg_rm_conv2d1x1_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp122_neg_rm_conv2d1x1_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp122_neg_rm_conv2d1x1_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp122_neg_rm_conv2d1x1_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond_1_conv2d1x1_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond_1_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond_2_conv2d1x1_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond_2_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond_conv2d1x1_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_inc_1_conv2d1x1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_1_conv2d1x1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_1_conv2d1x1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_1_conv2d1x1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_2_conv2d1x1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_2_conv2d1x1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_2_conv2d1x1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_2_conv2d1x1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_conv2d1x1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_conv2d1x1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_conv2d1x1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_conv2d1x1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_notlhs_conv2d1x1_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_notlhs_conv2d1x1_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_notlhs_conv2d1x1_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_notlhs_conv2d1x1_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_notrhs_conv2d1x1_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_notrhs_conv2d1x1_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_notrhs_conv2d1x1_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_notrhs_conv2d1x1_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phi_decision52_xor54_or_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phi_decision52_xor_or_rm_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phi_decision52_xor_rm_conv2d1x1_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phi_decision52_xor_rm_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_conv2d1x1_1_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_conv2d1x1_2_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_conv2d1x1_5_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_reduction_conv2d1x1_6_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_channels_sync_buffer4_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_channels_sync_buffer5_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_channels_sync_buffer6_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_channels_sync_buffer_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_im_sync_buffer21_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_input_im_sync_buffer22_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_input_size_x_sync_buffer11_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_size_x_sync_buffer12_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_size_x_sync_buffer_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_size_y_sync_buffer17_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_size_y_sync_buffer18_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_size_y_sync_buffer_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_tmp_1_conv2d1x1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_tmp_1_conv2d1x1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_tmp_1_conv2d1x1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_tmp_1_conv2d1x1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_tmp_2_conv2d1x1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_tmp_2_conv2d1x1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_tmp_2_conv2d1x1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_tmp_2_conv2d1x1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal bgTrunc_i_mul16_1_conv2d1x1_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul16_1_conv2d1x1_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul16_2_conv2d1x1_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul16_2_conv2d1x1_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_tmp1_1_conv2d1x1_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_tmp1_1_conv2d1x1_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_tmp1_2_conv2d1x1_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_tmp1_2_conv2d1x1_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul16_1_conv2d1x1_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul16_1_conv2d1x1_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul16_1_conv2d1x1_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul16_1_conv2d1x1_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul16_1_conv2d1x1_bjA5_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul16_1_conv2d1x1_bs7_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul16_1_conv2d1x1_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul16_1_conv2d1x1_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul16_1_conv2d1x1_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul16_1_conv2d1x1_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul16_1_conv2d1x1_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul16_1_conv2d1x1_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul16_1_conv2d1x1_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul16_1_conv2d1x1_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul16_1_conv2d1x1_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_mul16_2_conv2d1x1_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul16_2_conv2d1x1_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul16_2_conv2d1x1_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul16_2_conv2d1x1_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul16_2_conv2d1x1_bjA5_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul16_2_conv2d1x1_bs7_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul16_2_conv2d1x1_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul16_2_conv2d1x1_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul16_2_conv2d1x1_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul16_2_conv2d1x1_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul16_2_conv2d1x1_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul16_2_conv2d1x1_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul16_2_conv2d1x1_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul16_2_conv2d1x1_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul16_2_conv2d1x1_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_tmp1_1_conv2d1x1_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_tmp1_1_conv2d1x1_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_tmp1_1_conv2d1x1_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_tmp1_1_conv2d1x1_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_tmp1_1_conv2d1x1_bjA5_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_tmp1_1_conv2d1x1_bs7_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_tmp1_1_conv2d1x1_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_tmp1_1_conv2d1x1_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_tmp1_1_conv2d1x1_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_tmp1_1_conv2d1x1_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_tmp1_1_conv2d1x1_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_tmp1_1_conv2d1x1_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_tmp1_1_conv2d1x1_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_tmp1_1_conv2d1x1_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_tmp1_1_conv2d1x1_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_tmp1_2_conv2d1x1_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_tmp1_2_conv2d1x1_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_tmp1_2_conv2d1x1_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_tmp1_2_conv2d1x1_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_tmp1_2_conv2d1x1_bjA5_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_tmp1_2_conv2d1x1_bs7_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_tmp1_2_conv2d1x1_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_tmp1_2_conv2d1x1_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_tmp1_2_conv2d1x1_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_tmp1_2_conv2d1x1_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_tmp1_2_conv2d1x1_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_tmp1_2_conv2d1x1_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_tmp1_2_conv2d1x1_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_tmp1_2_conv2d1x1_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_tmp1_2_conv2d1x1_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_mul16_1_conv2d1x1_im0_cma_reset : std_logic;
    type i_mul16_1_conv2d1x1_im0_cma_a0type is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal i_mul16_1_conv2d1x1_im0_cma_a0 : i_mul16_1_conv2d1x1_im0_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of i_mul16_1_conv2d1x1_im0_cma_a0 : signal is true;
    signal i_mul16_1_conv2d1x1_im0_cma_c0 : i_mul16_1_conv2d1x1_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul16_1_conv2d1x1_im0_cma_c0 : signal is true;
    type i_mul16_1_conv2d1x1_im0_cma_ptype is array(NATURAL range <>) of UNSIGNED(35 downto 0);
    signal i_mul16_1_conv2d1x1_im0_cma_p : i_mul16_1_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul16_1_conv2d1x1_im0_cma_u : i_mul16_1_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul16_1_conv2d1x1_im0_cma_w : i_mul16_1_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul16_1_conv2d1x1_im0_cma_x : i_mul16_1_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul16_1_conv2d1x1_im0_cma_y : i_mul16_1_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul16_1_conv2d1x1_im0_cma_s : i_mul16_1_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul16_1_conv2d1x1_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul16_1_conv2d1x1_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul16_1_conv2d1x1_im0_cma_ena0 : std_logic;
    signal i_mul16_1_conv2d1x1_im0_cma_ena1 : std_logic;
    signal i_mul16_1_conv2d1x1_im10_cma_reset : std_logic;
    type i_mul16_1_conv2d1x1_im10_cma_a0type is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal i_mul16_1_conv2d1x1_im10_cma_a0 : i_mul16_1_conv2d1x1_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul16_1_conv2d1x1_im10_cma_a0 : signal is true;
    signal i_mul16_1_conv2d1x1_im10_cma_c0 : i_mul16_1_conv2d1x1_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul16_1_conv2d1x1_im10_cma_c0 : signal is true;
    type i_mul16_1_conv2d1x1_im10_cma_ptype is array(NATURAL range <>) of UNSIGNED(27 downto 0);
    signal i_mul16_1_conv2d1x1_im10_cma_p : i_mul16_1_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul16_1_conv2d1x1_im10_cma_u : i_mul16_1_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul16_1_conv2d1x1_im10_cma_w : i_mul16_1_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul16_1_conv2d1x1_im10_cma_x : i_mul16_1_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul16_1_conv2d1x1_im10_cma_y : i_mul16_1_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul16_1_conv2d1x1_im10_cma_s : i_mul16_1_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul16_1_conv2d1x1_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul16_1_conv2d1x1_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul16_1_conv2d1x1_im10_cma_ena0 : std_logic;
    signal i_mul16_1_conv2d1x1_im10_cma_ena1 : std_logic;
    signal i_mul16_2_conv2d1x1_im0_cma_reset : std_logic;
    signal i_mul16_2_conv2d1x1_im0_cma_a0 : i_mul16_1_conv2d1x1_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul16_2_conv2d1x1_im0_cma_a0 : signal is true;
    signal i_mul16_2_conv2d1x1_im0_cma_c0 : i_mul16_1_conv2d1x1_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul16_2_conv2d1x1_im0_cma_c0 : signal is true;
    signal i_mul16_2_conv2d1x1_im0_cma_p : i_mul16_1_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul16_2_conv2d1x1_im0_cma_u : i_mul16_1_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul16_2_conv2d1x1_im0_cma_w : i_mul16_1_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul16_2_conv2d1x1_im0_cma_x : i_mul16_1_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul16_2_conv2d1x1_im0_cma_y : i_mul16_1_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul16_2_conv2d1x1_im0_cma_s : i_mul16_1_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul16_2_conv2d1x1_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul16_2_conv2d1x1_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul16_2_conv2d1x1_im0_cma_ena0 : std_logic;
    signal i_mul16_2_conv2d1x1_im0_cma_ena1 : std_logic;
    signal i_mul16_2_conv2d1x1_im10_cma_reset : std_logic;
    signal i_mul16_2_conv2d1x1_im10_cma_a0 : i_mul16_1_conv2d1x1_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul16_2_conv2d1x1_im10_cma_a0 : signal is true;
    signal i_mul16_2_conv2d1x1_im10_cma_c0 : i_mul16_1_conv2d1x1_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul16_2_conv2d1x1_im10_cma_c0 : signal is true;
    signal i_mul16_2_conv2d1x1_im10_cma_p : i_mul16_1_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul16_2_conv2d1x1_im10_cma_u : i_mul16_1_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul16_2_conv2d1x1_im10_cma_w : i_mul16_1_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul16_2_conv2d1x1_im10_cma_x : i_mul16_1_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul16_2_conv2d1x1_im10_cma_y : i_mul16_1_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul16_2_conv2d1x1_im10_cma_s : i_mul16_1_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul16_2_conv2d1x1_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul16_2_conv2d1x1_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul16_2_conv2d1x1_im10_cma_ena0 : std_logic;
    signal i_mul16_2_conv2d1x1_im10_cma_ena1 : std_logic;
    signal i_tmp1_1_conv2d1x1_im0_cma_reset : std_logic;
    signal i_tmp1_1_conv2d1x1_im0_cma_a0 : i_mul16_1_conv2d1x1_im0_cma_a0type(0 to 0);
    attribute preserve of i_tmp1_1_conv2d1x1_im0_cma_a0 : signal is true;
    signal i_tmp1_1_conv2d1x1_im0_cma_c0 : i_mul16_1_conv2d1x1_im0_cma_a0type(0 to 0);
    attribute preserve of i_tmp1_1_conv2d1x1_im0_cma_c0 : signal is true;
    signal i_tmp1_1_conv2d1x1_im0_cma_p : i_mul16_1_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_tmp1_1_conv2d1x1_im0_cma_u : i_mul16_1_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_tmp1_1_conv2d1x1_im0_cma_w : i_mul16_1_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_tmp1_1_conv2d1x1_im0_cma_x : i_mul16_1_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_tmp1_1_conv2d1x1_im0_cma_y : i_mul16_1_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_tmp1_1_conv2d1x1_im0_cma_s : i_mul16_1_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_tmp1_1_conv2d1x1_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_tmp1_1_conv2d1x1_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_tmp1_1_conv2d1x1_im0_cma_ena0 : std_logic;
    signal i_tmp1_1_conv2d1x1_im0_cma_ena1 : std_logic;
    signal i_tmp1_1_conv2d1x1_im10_cma_reset : std_logic;
    signal i_tmp1_1_conv2d1x1_im10_cma_a0 : i_mul16_1_conv2d1x1_im10_cma_a0type(0 to 0);
    attribute preserve of i_tmp1_1_conv2d1x1_im10_cma_a0 : signal is true;
    signal i_tmp1_1_conv2d1x1_im10_cma_c0 : i_mul16_1_conv2d1x1_im10_cma_a0type(0 to 0);
    attribute preserve of i_tmp1_1_conv2d1x1_im10_cma_c0 : signal is true;
    signal i_tmp1_1_conv2d1x1_im10_cma_p : i_mul16_1_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_tmp1_1_conv2d1x1_im10_cma_u : i_mul16_1_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_tmp1_1_conv2d1x1_im10_cma_w : i_mul16_1_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_tmp1_1_conv2d1x1_im10_cma_x : i_mul16_1_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_tmp1_1_conv2d1x1_im10_cma_y : i_mul16_1_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_tmp1_1_conv2d1x1_im10_cma_s : i_mul16_1_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_tmp1_1_conv2d1x1_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_tmp1_1_conv2d1x1_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_tmp1_1_conv2d1x1_im10_cma_ena0 : std_logic;
    signal i_tmp1_1_conv2d1x1_im10_cma_ena1 : std_logic;
    signal i_tmp1_2_conv2d1x1_im0_cma_reset : std_logic;
    signal i_tmp1_2_conv2d1x1_im0_cma_a0 : i_mul16_1_conv2d1x1_im0_cma_a0type(0 to 0);
    attribute preserve of i_tmp1_2_conv2d1x1_im0_cma_a0 : signal is true;
    signal i_tmp1_2_conv2d1x1_im0_cma_c0 : i_mul16_1_conv2d1x1_im0_cma_a0type(0 to 0);
    attribute preserve of i_tmp1_2_conv2d1x1_im0_cma_c0 : signal is true;
    signal i_tmp1_2_conv2d1x1_im0_cma_p : i_mul16_1_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_tmp1_2_conv2d1x1_im0_cma_u : i_mul16_1_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_tmp1_2_conv2d1x1_im0_cma_w : i_mul16_1_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_tmp1_2_conv2d1x1_im0_cma_x : i_mul16_1_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_tmp1_2_conv2d1x1_im0_cma_y : i_mul16_1_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_tmp1_2_conv2d1x1_im0_cma_s : i_mul16_1_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_tmp1_2_conv2d1x1_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_tmp1_2_conv2d1x1_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_tmp1_2_conv2d1x1_im0_cma_ena0 : std_logic;
    signal i_tmp1_2_conv2d1x1_im0_cma_ena1 : std_logic;
    signal i_tmp1_2_conv2d1x1_im10_cma_reset : std_logic;
    signal i_tmp1_2_conv2d1x1_im10_cma_a0 : i_mul16_1_conv2d1x1_im10_cma_a0type(0 to 0);
    attribute preserve of i_tmp1_2_conv2d1x1_im10_cma_a0 : signal is true;
    signal i_tmp1_2_conv2d1x1_im10_cma_c0 : i_mul16_1_conv2d1x1_im10_cma_a0type(0 to 0);
    attribute preserve of i_tmp1_2_conv2d1x1_im10_cma_c0 : signal is true;
    signal i_tmp1_2_conv2d1x1_im10_cma_p : i_mul16_1_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_tmp1_2_conv2d1x1_im10_cma_u : i_mul16_1_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_tmp1_2_conv2d1x1_im10_cma_w : i_mul16_1_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_tmp1_2_conv2d1x1_im10_cma_x : i_mul16_1_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_tmp1_2_conv2d1x1_im10_cma_y : i_mul16_1_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_tmp1_2_conv2d1x1_im10_cma_s : i_mul16_1_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_tmp1_2_conv2d1x1_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_tmp1_2_conv2d1x1_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_tmp1_2_conv2d1x1_im10_cma_ena0 : std_logic;
    signal i_tmp1_2_conv2d1x1_im10_cma_ena1 : std_logic;
    signal i_mul16_1_conv2d1x1_ma3_cma_reset : std_logic;
    signal i_mul16_1_conv2d1x1_ma3_cma_a0 : i_mul16_1_conv2d1x1_im10_cma_a0type(0 to 1);
    attribute preserve of i_mul16_1_conv2d1x1_ma3_cma_a0 : signal is true;
    type i_mul16_1_conv2d1x1_ma3_cma_c0type is array(NATURAL range <>) of SIGNED(18 downto 0);
    signal i_mul16_1_conv2d1x1_ma3_cma_c0 : i_mul16_1_conv2d1x1_ma3_cma_c0type(0 to 1);
    attribute preserve of i_mul16_1_conv2d1x1_ma3_cma_c0 : signal is true;
    type i_mul16_1_conv2d1x1_ma3_cma_ltype is array(NATURAL range <>) of SIGNED(14 downto 0);
    signal i_mul16_1_conv2d1x1_ma3_cma_l : i_mul16_1_conv2d1x1_ma3_cma_ltype(0 to 1);
    type i_mul16_1_conv2d1x1_ma3_cma_ptype is array(NATURAL range <>) of SIGNED(33 downto 0);
    signal i_mul16_1_conv2d1x1_ma3_cma_p : i_mul16_1_conv2d1x1_ma3_cma_ptype(0 to 1);
    type i_mul16_1_conv2d1x1_ma3_cma_utype is array(NATURAL range <>) of SIGNED(34 downto 0);
    signal i_mul16_1_conv2d1x1_ma3_cma_u : i_mul16_1_conv2d1x1_ma3_cma_utype(0 to 1);
    signal i_mul16_1_conv2d1x1_ma3_cma_w : i_mul16_1_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul16_1_conv2d1x1_ma3_cma_x : i_mul16_1_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul16_1_conv2d1x1_ma3_cma_y : i_mul16_1_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul16_1_conv2d1x1_ma3_cma_s : i_mul16_1_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul16_1_conv2d1x1_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul16_1_conv2d1x1_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul16_1_conv2d1x1_ma3_cma_ena0 : std_logic;
    signal i_mul16_1_conv2d1x1_ma3_cma_ena1 : std_logic;
    signal i_mul16_2_conv2d1x1_ma3_cma_reset : std_logic;
    signal i_mul16_2_conv2d1x1_ma3_cma_a0 : i_mul16_1_conv2d1x1_im10_cma_a0type(0 to 1);
    attribute preserve of i_mul16_2_conv2d1x1_ma3_cma_a0 : signal is true;
    signal i_mul16_2_conv2d1x1_ma3_cma_c0 : i_mul16_1_conv2d1x1_ma3_cma_c0type(0 to 1);
    attribute preserve of i_mul16_2_conv2d1x1_ma3_cma_c0 : signal is true;
    signal i_mul16_2_conv2d1x1_ma3_cma_l : i_mul16_1_conv2d1x1_ma3_cma_ltype(0 to 1);
    signal i_mul16_2_conv2d1x1_ma3_cma_p : i_mul16_1_conv2d1x1_ma3_cma_ptype(0 to 1);
    signal i_mul16_2_conv2d1x1_ma3_cma_u : i_mul16_1_conv2d1x1_ma3_cma_utype(0 to 1);
    signal i_mul16_2_conv2d1x1_ma3_cma_w : i_mul16_1_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul16_2_conv2d1x1_ma3_cma_x : i_mul16_1_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul16_2_conv2d1x1_ma3_cma_y : i_mul16_1_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul16_2_conv2d1x1_ma3_cma_s : i_mul16_1_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul16_2_conv2d1x1_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul16_2_conv2d1x1_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul16_2_conv2d1x1_ma3_cma_ena0 : std_logic;
    signal i_mul16_2_conv2d1x1_ma3_cma_ena1 : std_logic;
    signal i_tmp1_1_conv2d1x1_ma3_cma_reset : std_logic;
    signal i_tmp1_1_conv2d1x1_ma3_cma_a0 : i_mul16_1_conv2d1x1_im10_cma_a0type(0 to 1);
    attribute preserve of i_tmp1_1_conv2d1x1_ma3_cma_a0 : signal is true;
    signal i_tmp1_1_conv2d1x1_ma3_cma_c0 : i_mul16_1_conv2d1x1_ma3_cma_c0type(0 to 1);
    attribute preserve of i_tmp1_1_conv2d1x1_ma3_cma_c0 : signal is true;
    signal i_tmp1_1_conv2d1x1_ma3_cma_l : i_mul16_1_conv2d1x1_ma3_cma_ltype(0 to 1);
    signal i_tmp1_1_conv2d1x1_ma3_cma_p : i_mul16_1_conv2d1x1_ma3_cma_ptype(0 to 1);
    signal i_tmp1_1_conv2d1x1_ma3_cma_u : i_mul16_1_conv2d1x1_ma3_cma_utype(0 to 1);
    signal i_tmp1_1_conv2d1x1_ma3_cma_w : i_mul16_1_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_tmp1_1_conv2d1x1_ma3_cma_x : i_mul16_1_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_tmp1_1_conv2d1x1_ma3_cma_y : i_mul16_1_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_tmp1_1_conv2d1x1_ma3_cma_s : i_mul16_1_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_tmp1_1_conv2d1x1_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_tmp1_1_conv2d1x1_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_tmp1_1_conv2d1x1_ma3_cma_ena0 : std_logic;
    signal i_tmp1_1_conv2d1x1_ma3_cma_ena1 : std_logic;
    signal i_tmp1_2_conv2d1x1_ma3_cma_reset : std_logic;
    signal i_tmp1_2_conv2d1x1_ma3_cma_a0 : i_mul16_1_conv2d1x1_im10_cma_a0type(0 to 1);
    attribute preserve of i_tmp1_2_conv2d1x1_ma3_cma_a0 : signal is true;
    signal i_tmp1_2_conv2d1x1_ma3_cma_c0 : i_mul16_1_conv2d1x1_ma3_cma_c0type(0 to 1);
    attribute preserve of i_tmp1_2_conv2d1x1_ma3_cma_c0 : signal is true;
    signal i_tmp1_2_conv2d1x1_ma3_cma_l : i_mul16_1_conv2d1x1_ma3_cma_ltype(0 to 1);
    signal i_tmp1_2_conv2d1x1_ma3_cma_p : i_mul16_1_conv2d1x1_ma3_cma_ptype(0 to 1);
    signal i_tmp1_2_conv2d1x1_ma3_cma_u : i_mul16_1_conv2d1x1_ma3_cma_utype(0 to 1);
    signal i_tmp1_2_conv2d1x1_ma3_cma_w : i_mul16_1_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_tmp1_2_conv2d1x1_ma3_cma_x : i_mul16_1_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_tmp1_2_conv2d1x1_ma3_cma_y : i_mul16_1_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_tmp1_2_conv2d1x1_ma3_cma_s : i_mul16_1_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_tmp1_2_conv2d1x1_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_tmp1_2_conv2d1x1_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_tmp1_2_conv2d1x1_ma3_cma_ena0 : std_logic;
    signal i_tmp1_2_conv2d1x1_ma3_cma_ena1 : std_logic;
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal i_tmp1_1_conv2d1x1_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_tmp1_1_conv2d1x1_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal i_tmp1_2_conv2d1x1_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_tmp1_2_conv2d1x1_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul16_1_conv2d1x1_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul16_1_conv2d1x1_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul16_2_conv2d1x1_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul16_2_conv2d1x1_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal redist0_i_tmp1_2_conv2d1x1_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist1_i_tmp1_1_conv2d1x1_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist2_i_mul16_2_conv2d1x1_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist3_i_mul16_1_conv2d1x1_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist4_i_tmp1_2_conv2d1x1_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist5_i_tmp1_2_conv2d1x1_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist6_i_tmp1_1_conv2d1x1_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist7_i_tmp1_1_conv2d1x1_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist8_i_mul16_2_conv2d1x1_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist9_i_mul16_2_conv2d1x1_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist10_i_mul16_1_conv2d1x1_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist11_i_mul16_1_conv2d1x1_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist12_i_exitcond_conv2d1x1_q_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_exitcond_1_conv2d1x1_q_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_sync_in_aunroll_x_in_i_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_sync_in_aunroll_x_in_i_valid_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_sync_in_aunroll_x_in_i_valid_10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_sync_in_aunroll_x_in_i_valid_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_sync_in_aunroll_x_in_i_valid_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_i_arrayidx20_2_conv2d1x1_conv2d1x162_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist23_i_arrayidx20_1_conv2d1x1_conv2d1x155_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist24_bgTrunc_i_tmp_2_conv2d1x1_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_bgTrunc_i_tmp_1_conv2d1x1_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_bgTrunc_i_tmp1_2_conv2d1x1_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist27_bgTrunc_i_tmp1_1_conv2d1x1_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist28_bgTrunc_i_mul16_2_conv2d1x1_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist29_bgTrunc_i_mul16_1_conv2d1x1_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist30_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist31_bgTrunc_i_inc_2_conv2d1x1_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist32_bgTrunc_i_inc_2_conv2d1x1_sel_x_b_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist33_bgTrunc_i_inc_1_conv2d1x1_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist34_bgTrunc_i_add18_2_conv2d1x1_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist35_bgTrunc_i_add18_1_conv2d1x1_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_sync_in_aunroll_x_in_c1_eni3_1_10_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_sync_in_aunroll_x_in_c1_eni3_1_10_mem_reset0 : std_logic;
    signal redist14_sync_in_aunroll_x_in_c1_eni3_1_10_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_sync_in_aunroll_x_in_c1_eni3_1_10_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist14_sync_in_aunroll_x_in_c1_eni3_1_10_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist14_sync_in_aunroll_x_in_c1_eni3_1_10_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_sync_in_aunroll_x_in_c1_eni3_1_10_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_sync_in_aunroll_x_in_c1_eni3_1_10_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist14_sync_in_aunroll_x_in_c1_eni3_1_10_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist14_sync_in_aunroll_x_in_c1_eni3_1_10_rdcnt_i : signal is true;
    signal redist14_sync_in_aunroll_x_in_c1_eni3_1_10_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist14_sync_in_aunroll_x_in_c1_eni3_1_10_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist14_sync_in_aunroll_x_in_c1_eni3_1_10_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist14_sync_in_aunroll_x_in_c1_eni3_1_10_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sync_in_aunroll_x_in_c1_eni3_1_10_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sync_in_aunroll_x_in_c1_eni3_1_10_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sync_in_aunroll_x_in_c1_eni3_1_10_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sync_in_aunroll_x_in_c1_eni3_1_10_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist14_sync_in_aunroll_x_in_c1_eni3_1_10_sticky_ena_q : signal is true;
    signal redist14_sync_in_aunroll_x_in_c1_eni3_1_10_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_sync_in_aunroll_x_in_c1_eni3_2_5_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_sync_in_aunroll_x_in_c1_eni3_2_5_mem_reset0 : std_logic;
    signal redist15_sync_in_aunroll_x_in_c1_eni3_2_5_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_sync_in_aunroll_x_in_c1_eni3_2_5_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_sync_in_aunroll_x_in_c1_eni3_2_5_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_sync_in_aunroll_x_in_c1_eni3_2_5_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_sync_in_aunroll_x_in_c1_eni3_2_5_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_sync_in_aunroll_x_in_c1_eni3_2_5_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_sync_in_aunroll_x_in_c1_eni3_2_5_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist15_sync_in_aunroll_x_in_c1_eni3_2_5_rdcnt_i : signal is true;
    signal redist15_sync_in_aunroll_x_in_c1_eni3_2_5_rdcnt_eq : std_logic;
    attribute preserve of redist15_sync_in_aunroll_x_in_c1_eni3_2_5_rdcnt_eq : signal is true;
    signal redist15_sync_in_aunroll_x_in_c1_eni3_2_5_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_sync_in_aunroll_x_in_c1_eni3_2_5_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist15_sync_in_aunroll_x_in_c1_eni3_2_5_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_sync_in_aunroll_x_in_c1_eni3_2_5_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_sync_in_aunroll_x_in_c1_eni3_2_5_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_sync_in_aunroll_x_in_c1_eni3_2_5_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_sync_in_aunroll_x_in_c1_eni3_2_5_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist15_sync_in_aunroll_x_in_c1_eni3_2_5_sticky_ena_q : signal is true;
    signal redist15_sync_in_aunroll_x_in_c1_eni3_2_5_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_sync_in_aunroll_x_in_c1_eni3_3_10_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_sync_in_aunroll_x_in_c1_eni3_3_10_mem_reset0 : std_logic;
    signal redist16_sync_in_aunroll_x_in_c1_eni3_3_10_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_sync_in_aunroll_x_in_c1_eni3_3_10_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist16_sync_in_aunroll_x_in_c1_eni3_3_10_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist16_sync_in_aunroll_x_in_c1_eni3_3_10_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_sync_in_aunroll_x_in_c1_eni3_3_10_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_sync_in_aunroll_x_in_c1_eni3_3_10_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist16_sync_in_aunroll_x_in_c1_eni3_3_10_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist16_sync_in_aunroll_x_in_c1_eni3_3_10_rdcnt_i : signal is true;
    signal redist16_sync_in_aunroll_x_in_c1_eni3_3_10_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist16_sync_in_aunroll_x_in_c1_eni3_3_10_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist16_sync_in_aunroll_x_in_c1_eni3_3_10_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist16_sync_in_aunroll_x_in_c1_eni3_3_10_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_sync_in_aunroll_x_in_c1_eni3_3_10_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_sync_in_aunroll_x_in_c1_eni3_3_10_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_sync_in_aunroll_x_in_c1_eni3_3_10_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_sync_in_aunroll_x_in_c1_eni3_3_10_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist16_sync_in_aunroll_x_in_c1_eni3_3_10_sticky_ena_q : signal is true;
    signal redist16_sync_in_aunroll_x_in_c1_eni3_3_10_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist17_sync_in_aunroll_x_in_i_valid_1(DELAY,278)
    redist17_sync_in_aunroll_x_in_i_valid_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist17_sync_in_aunroll_x_in_i_valid_1_q, clk => clock, aclr => resetn );

    -- redist18_sync_in_aunroll_x_in_i_valid_6(DELAY,279)
    redist18_sync_in_aunroll_x_in_i_valid_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist17_sync_in_aunroll_x_in_i_valid_1_q, xout => redist18_sync_in_aunroll_x_in_i_valid_6_q, clk => clock, aclr => resetn );

    -- redist19_sync_in_aunroll_x_in_i_valid_10(DELAY,280)
    redist19_sync_in_aunroll_x_in_i_valid_10 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist18_sync_in_aunroll_x_in_i_valid_6_q, xout => redist19_sync_in_aunroll_x_in_i_valid_10_q, clk => clock, aclr => resetn );

    -- redist20_sync_in_aunroll_x_in_i_valid_11(DELAY,281)
    redist20_sync_in_aunroll_x_in_i_valid_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist19_sync_in_aunroll_x_in_i_valid_10_q, xout => redist20_sync_in_aunroll_x_in_i_valid_11_q, clk => clock, aclr => resetn );

    -- redist21_sync_in_aunroll_x_in_i_valid_12(DELAY,282)
    redist21_sync_in_aunroll_x_in_i_valid_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist20_sync_in_aunroll_x_in_i_valid_11_q, xout => redist21_sync_in_aunroll_x_in_i_valid_12_q, clk => clock, aclr => resetn );

    -- i_syncbuf_input_channels_sync_buffer6_conv2d1x1(BLACKBOX,91)@0
    -- in in_i_dependence@12
    -- in in_valid_in@12
    -- out out_buffer_out@12
    -- out out_valid_out@12
    thei_syncbuf_input_channels_sync_buffer6_conv2d1x1 : i_syncbuf_input_channels_sync_buffer6_conv2d1x163
    PORT MAP (
        in_buffer_in => in_input_channels,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist20_sync_in_aunroll_x_in_i_valid_11_q,
        out_buffer_out => i_syncbuf_input_channels_sync_buffer6_conv2d1x1_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_3gr(CONSTANT,63)
    c_i32_3gr_q <= "00000000000000000000000000000011";

    -- redist14_sync_in_aunroll_x_in_c1_eni3_1_10_notEnable(LOGICAL,304)
    redist14_sync_in_aunroll_x_in_c1_eni3_1_10_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist14_sync_in_aunroll_x_in_c1_eni3_1_10_nor(LOGICAL,305)
    redist14_sync_in_aunroll_x_in_c1_eni3_1_10_nor_q <= not (redist14_sync_in_aunroll_x_in_c1_eni3_1_10_notEnable_q or redist14_sync_in_aunroll_x_in_c1_eni3_1_10_sticky_ena_q);

    -- redist14_sync_in_aunroll_x_in_c1_eni3_1_10_mem_last(CONSTANT,301)
    redist14_sync_in_aunroll_x_in_c1_eni3_1_10_mem_last_q <= "0110";

    -- redist14_sync_in_aunroll_x_in_c1_eni3_1_10_cmp(LOGICAL,302)
    redist14_sync_in_aunroll_x_in_c1_eni3_1_10_cmp_b <= STD_LOGIC_VECTOR("0" & redist14_sync_in_aunroll_x_in_c1_eni3_1_10_rdcnt_q);
    redist14_sync_in_aunroll_x_in_c1_eni3_1_10_cmp_q <= "1" WHEN redist14_sync_in_aunroll_x_in_c1_eni3_1_10_mem_last_q = redist14_sync_in_aunroll_x_in_c1_eni3_1_10_cmp_b ELSE "0";

    -- redist14_sync_in_aunroll_x_in_c1_eni3_1_10_cmpReg(REG,303)
    redist14_sync_in_aunroll_x_in_c1_eni3_1_10_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_sync_in_aunroll_x_in_c1_eni3_1_10_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist14_sync_in_aunroll_x_in_c1_eni3_1_10_cmpReg_q <= STD_LOGIC_VECTOR(redist14_sync_in_aunroll_x_in_c1_eni3_1_10_cmp_q);
        END IF;
    END PROCESS;

    -- redist14_sync_in_aunroll_x_in_c1_eni3_1_10_sticky_ena(REG,306)
    redist14_sync_in_aunroll_x_in_c1_eni3_1_10_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_sync_in_aunroll_x_in_c1_eni3_1_10_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist14_sync_in_aunroll_x_in_c1_eni3_1_10_nor_q = "1") THEN
                redist14_sync_in_aunroll_x_in_c1_eni3_1_10_sticky_ena_q <= STD_LOGIC_VECTOR(redist14_sync_in_aunroll_x_in_c1_eni3_1_10_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist14_sync_in_aunroll_x_in_c1_eni3_1_10_enaAnd(LOGICAL,307)
    redist14_sync_in_aunroll_x_in_c1_eni3_1_10_enaAnd_q <= redist14_sync_in_aunroll_x_in_c1_eni3_1_10_sticky_ena_q and VCC_q;

    -- redist14_sync_in_aunroll_x_in_c1_eni3_1_10_rdcnt(COUNTER,299)
    -- low=0, high=7, step=1, init=0
    redist14_sync_in_aunroll_x_in_c1_eni3_1_10_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_sync_in_aunroll_x_in_c1_eni3_1_10_rdcnt_i <= TO_UNSIGNED(0, 3);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist14_sync_in_aunroll_x_in_c1_eni3_1_10_rdcnt_i <= redist14_sync_in_aunroll_x_in_c1_eni3_1_10_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist14_sync_in_aunroll_x_in_c1_eni3_1_10_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist14_sync_in_aunroll_x_in_c1_eni3_1_10_rdcnt_i, 3)));

    -- redist14_sync_in_aunroll_x_in_c1_eni3_1_10_wraddr(REG,300)
    redist14_sync_in_aunroll_x_in_c1_eni3_1_10_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_sync_in_aunroll_x_in_c1_eni3_1_10_wraddr_q <= "111";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist14_sync_in_aunroll_x_in_c1_eni3_1_10_wraddr_q <= STD_LOGIC_VECTOR(redist14_sync_in_aunroll_x_in_c1_eni3_1_10_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist14_sync_in_aunroll_x_in_c1_eni3_1_10_mem(DUALMEM,298)
    redist14_sync_in_aunroll_x_in_c1_eni3_1_10_mem_ia <= STD_LOGIC_VECTOR(in_c1_eni3_1);
    redist14_sync_in_aunroll_x_in_c1_eni3_1_10_mem_aa <= redist14_sync_in_aunroll_x_in_c1_eni3_1_10_wraddr_q;
    redist14_sync_in_aunroll_x_in_c1_eni3_1_10_mem_ab <= redist14_sync_in_aunroll_x_in_c1_eni3_1_10_rdcnt_q;
    redist14_sync_in_aunroll_x_in_c1_eni3_1_10_mem_reset0 <= not (resetn);
    redist14_sync_in_aunroll_x_in_c1_eni3_1_10_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 8,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 8,
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
        clocken1 => redist14_sync_in_aunroll_x_in_c1_eni3_1_10_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist14_sync_in_aunroll_x_in_c1_eni3_1_10_mem_reset0,
        clock1 => clock,
        address_a => redist14_sync_in_aunroll_x_in_c1_eni3_1_10_mem_aa,
        data_a => redist14_sync_in_aunroll_x_in_c1_eni3_1_10_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist14_sync_in_aunroll_x_in_c1_eni3_1_10_mem_ab,
        q_b => redist14_sync_in_aunroll_x_in_c1_eni3_1_10_mem_iq
    );
    redist14_sync_in_aunroll_x_in_c1_eni3_1_10_mem_q <= redist14_sync_in_aunroll_x_in_c1_eni3_1_10_mem_iq(31 downto 0);

    -- redist14_sync_in_aunroll_x_in_c1_eni3_1_10_outputreg(DELAY,297)
    redist14_sync_in_aunroll_x_in_c1_eni3_1_10_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist14_sync_in_aunroll_x_in_c1_eni3_1_10_mem_q, xout => redist14_sync_in_aunroll_x_in_c1_eni3_1_10_outputreg_q, clk => clock, aclr => resetn );

    -- i_inc_2_conv2d1x1(ADD,76)@11
    i_inc_2_conv2d1x1_a <= STD_LOGIC_VECTOR("0" & redist14_sync_in_aunroll_x_in_c1_eni3_1_10_outputreg_q);
    i_inc_2_conv2d1x1_b <= STD_LOGIC_VECTOR("0" & c_i32_3gr_q);
    i_inc_2_conv2d1x1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc_2_conv2d1x1_a) + UNSIGNED(i_inc_2_conv2d1x1_b));
    i_inc_2_conv2d1x1_q <= i_inc_2_conv2d1x1_o(32 downto 0);

    -- bgTrunc_i_inc_2_conv2d1x1_sel_x(BITSELECT,5)@11
    bgTrunc_i_inc_2_conv2d1x1_sel_x_b <= i_inc_2_conv2d1x1_q(31 downto 0);

    -- redist31_bgTrunc_i_inc_2_conv2d1x1_sel_x_b_1(DELAY,292)
    redist31_bgTrunc_i_inc_2_conv2d1x1_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_inc_2_conv2d1x1_sel_x_b, xout => redist31_bgTrunc_i_inc_2_conv2d1x1_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_exitcond_2_conv2d1x1(LOGICAL,69)@12 + 1
    i_exitcond_2_conv2d1x1_qi <= "1" WHEN redist31_bgTrunc_i_inc_2_conv2d1x1_sel_x_b_1_q = i_syncbuf_input_channels_sync_buffer6_conv2d1x1_out_buffer_out ELSE "0";
    i_exitcond_2_conv2d1x1_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_exitcond_2_conv2d1x1_qi, xout => i_exitcond_2_conv2d1x1_q, clk => clock, aclr => resetn );

    -- i_reduction_conv2d1x1_5_conv2d1x1(LOGICAL,87)@13
    i_reduction_conv2d1x1_5_conv2d1x1_q <= i_exitcond_2_conv2d1x1_q or i_phi_decision52_xor_or_rm_conv2d1x1_q;

    -- i_reduction_conv2d1x1_1_conv2d1x1(LOGICAL,85)@13
    i_reduction_conv2d1x1_1_conv2d1x1_q <= redist12_i_exitcond_conv2d1x1_q_11_q or redist13_i_exitcond_1_conv2d1x1_q_11_q;

    -- i_reduction_conv2d1x1_6_conv2d1x1(LOGICAL,88)@13
    i_reduction_conv2d1x1_6_conv2d1x1_q <= i_reduction_conv2d1x1_1_conv2d1x1_q or i_reduction_conv2d1x1_5_conv2d1x1_q;

    -- redist32_bgTrunc_i_inc_2_conv2d1x1_sel_x_b_2(DELAY,293)
    redist32_bgTrunc_i_inc_2_conv2d1x1_sel_x_b_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist31_bgTrunc_i_inc_2_conv2d1x1_sel_x_b_1_q, xout => redist32_bgTrunc_i_inc_2_conv2d1x1_sel_x_b_2_q, clk => clock, aclr => resetn );

    -- i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_multconst_x(CONSTANT,29)
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- redist16_sync_in_aunroll_x_in_c1_eni3_3_10_notEnable(LOGICAL,326)
    redist16_sync_in_aunroll_x_in_c1_eni3_3_10_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist16_sync_in_aunroll_x_in_c1_eni3_3_10_nor(LOGICAL,327)
    redist16_sync_in_aunroll_x_in_c1_eni3_3_10_nor_q <= not (redist16_sync_in_aunroll_x_in_c1_eni3_3_10_notEnable_q or redist16_sync_in_aunroll_x_in_c1_eni3_3_10_sticky_ena_q);

    -- redist16_sync_in_aunroll_x_in_c1_eni3_3_10_mem_last(CONSTANT,323)
    redist16_sync_in_aunroll_x_in_c1_eni3_3_10_mem_last_q <= "0110";

    -- redist16_sync_in_aunroll_x_in_c1_eni3_3_10_cmp(LOGICAL,324)
    redist16_sync_in_aunroll_x_in_c1_eni3_3_10_cmp_b <= STD_LOGIC_VECTOR("0" & redist16_sync_in_aunroll_x_in_c1_eni3_3_10_rdcnt_q);
    redist16_sync_in_aunroll_x_in_c1_eni3_3_10_cmp_q <= "1" WHEN redist16_sync_in_aunroll_x_in_c1_eni3_3_10_mem_last_q = redist16_sync_in_aunroll_x_in_c1_eni3_3_10_cmp_b ELSE "0";

    -- redist16_sync_in_aunroll_x_in_c1_eni3_3_10_cmpReg(REG,325)
    redist16_sync_in_aunroll_x_in_c1_eni3_3_10_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist16_sync_in_aunroll_x_in_c1_eni3_3_10_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist16_sync_in_aunroll_x_in_c1_eni3_3_10_cmpReg_q <= STD_LOGIC_VECTOR(redist16_sync_in_aunroll_x_in_c1_eni3_3_10_cmp_q);
        END IF;
    END PROCESS;

    -- redist16_sync_in_aunroll_x_in_c1_eni3_3_10_sticky_ena(REG,328)
    redist16_sync_in_aunroll_x_in_c1_eni3_3_10_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist16_sync_in_aunroll_x_in_c1_eni3_3_10_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist16_sync_in_aunroll_x_in_c1_eni3_3_10_nor_q = "1") THEN
                redist16_sync_in_aunroll_x_in_c1_eni3_3_10_sticky_ena_q <= STD_LOGIC_VECTOR(redist16_sync_in_aunroll_x_in_c1_eni3_3_10_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist16_sync_in_aunroll_x_in_c1_eni3_3_10_enaAnd(LOGICAL,329)
    redist16_sync_in_aunroll_x_in_c1_eni3_3_10_enaAnd_q <= redist16_sync_in_aunroll_x_in_c1_eni3_3_10_sticky_ena_q and VCC_q;

    -- redist16_sync_in_aunroll_x_in_c1_eni3_3_10_rdcnt(COUNTER,321)
    -- low=0, high=7, step=1, init=0
    redist16_sync_in_aunroll_x_in_c1_eni3_3_10_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist16_sync_in_aunroll_x_in_c1_eni3_3_10_rdcnt_i <= TO_UNSIGNED(0, 3);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist16_sync_in_aunroll_x_in_c1_eni3_3_10_rdcnt_i <= redist16_sync_in_aunroll_x_in_c1_eni3_3_10_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist16_sync_in_aunroll_x_in_c1_eni3_3_10_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist16_sync_in_aunroll_x_in_c1_eni3_3_10_rdcnt_i, 3)));

    -- redist16_sync_in_aunroll_x_in_c1_eni3_3_10_wraddr(REG,322)
    redist16_sync_in_aunroll_x_in_c1_eni3_3_10_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist16_sync_in_aunroll_x_in_c1_eni3_3_10_wraddr_q <= "111";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist16_sync_in_aunroll_x_in_c1_eni3_3_10_wraddr_q <= STD_LOGIC_VECTOR(redist16_sync_in_aunroll_x_in_c1_eni3_3_10_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist16_sync_in_aunroll_x_in_c1_eni3_3_10_mem(DUALMEM,320)
    redist16_sync_in_aunroll_x_in_c1_eni3_3_10_mem_ia <= STD_LOGIC_VECTOR(in_c1_eni3_3);
    redist16_sync_in_aunroll_x_in_c1_eni3_3_10_mem_aa <= redist16_sync_in_aunroll_x_in_c1_eni3_3_10_wraddr_q;
    redist16_sync_in_aunroll_x_in_c1_eni3_3_10_mem_ab <= redist16_sync_in_aunroll_x_in_c1_eni3_3_10_rdcnt_q;
    redist16_sync_in_aunroll_x_in_c1_eni3_3_10_mem_reset0 <= not (resetn);
    redist16_sync_in_aunroll_x_in_c1_eni3_3_10_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 8,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 8,
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
        clocken1 => redist16_sync_in_aunroll_x_in_c1_eni3_3_10_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist16_sync_in_aunroll_x_in_c1_eni3_3_10_mem_reset0,
        clock1 => clock,
        address_a => redist16_sync_in_aunroll_x_in_c1_eni3_3_10_mem_aa,
        data_a => redist16_sync_in_aunroll_x_in_c1_eni3_3_10_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist16_sync_in_aunroll_x_in_c1_eni3_3_10_mem_ab,
        q_b => redist16_sync_in_aunroll_x_in_c1_eni3_3_10_mem_iq
    );
    redist16_sync_in_aunroll_x_in_c1_eni3_3_10_mem_q <= redist16_sync_in_aunroll_x_in_c1_eni3_3_10_mem_iq(31 downto 0);

    -- redist16_sync_in_aunroll_x_in_c1_eni3_3_10_outputreg(DELAY,319)
    redist16_sync_in_aunroll_x_in_c1_eni3_3_10_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist16_sync_in_aunroll_x_in_c1_eni3_3_10_mem_q, xout => redist16_sync_in_aunroll_x_in_c1_eni3_3_10_outputreg_q, clk => clock, aclr => resetn );

    -- redist15_sync_in_aunroll_x_in_c1_eni3_2_5_notEnable(LOGICAL,315)
    redist15_sync_in_aunroll_x_in_c1_eni3_2_5_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist15_sync_in_aunroll_x_in_c1_eni3_2_5_nor(LOGICAL,316)
    redist15_sync_in_aunroll_x_in_c1_eni3_2_5_nor_q <= not (redist15_sync_in_aunroll_x_in_c1_eni3_2_5_notEnable_q or redist15_sync_in_aunroll_x_in_c1_eni3_2_5_sticky_ena_q);

    -- redist15_sync_in_aunroll_x_in_c1_eni3_2_5_mem_last(CONSTANT,312)
    redist15_sync_in_aunroll_x_in_c1_eni3_2_5_mem_last_q <= "01";

    -- redist15_sync_in_aunroll_x_in_c1_eni3_2_5_cmp(LOGICAL,313)
    redist15_sync_in_aunroll_x_in_c1_eni3_2_5_cmp_q <= "1" WHEN redist15_sync_in_aunroll_x_in_c1_eni3_2_5_mem_last_q = redist15_sync_in_aunroll_x_in_c1_eni3_2_5_rdcnt_q ELSE "0";

    -- redist15_sync_in_aunroll_x_in_c1_eni3_2_5_cmpReg(REG,314)
    redist15_sync_in_aunroll_x_in_c1_eni3_2_5_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist15_sync_in_aunroll_x_in_c1_eni3_2_5_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist15_sync_in_aunroll_x_in_c1_eni3_2_5_cmpReg_q <= STD_LOGIC_VECTOR(redist15_sync_in_aunroll_x_in_c1_eni3_2_5_cmp_q);
        END IF;
    END PROCESS;

    -- redist15_sync_in_aunroll_x_in_c1_eni3_2_5_sticky_ena(REG,317)
    redist15_sync_in_aunroll_x_in_c1_eni3_2_5_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist15_sync_in_aunroll_x_in_c1_eni3_2_5_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist15_sync_in_aunroll_x_in_c1_eni3_2_5_nor_q = "1") THEN
                redist15_sync_in_aunroll_x_in_c1_eni3_2_5_sticky_ena_q <= STD_LOGIC_VECTOR(redist15_sync_in_aunroll_x_in_c1_eni3_2_5_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist15_sync_in_aunroll_x_in_c1_eni3_2_5_enaAnd(LOGICAL,318)
    redist15_sync_in_aunroll_x_in_c1_eni3_2_5_enaAnd_q <= redist15_sync_in_aunroll_x_in_c1_eni3_2_5_sticky_ena_q and VCC_q;

    -- redist15_sync_in_aunroll_x_in_c1_eni3_2_5_rdcnt(COUNTER,310)
    -- low=0, high=2, step=1, init=0
    redist15_sync_in_aunroll_x_in_c1_eni3_2_5_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist15_sync_in_aunroll_x_in_c1_eni3_2_5_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist15_sync_in_aunroll_x_in_c1_eni3_2_5_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist15_sync_in_aunroll_x_in_c1_eni3_2_5_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist15_sync_in_aunroll_x_in_c1_eni3_2_5_rdcnt_eq <= '1';
            ELSE
                redist15_sync_in_aunroll_x_in_c1_eni3_2_5_rdcnt_eq <= '0';
            END IF;
            IF (redist15_sync_in_aunroll_x_in_c1_eni3_2_5_rdcnt_eq = '1') THEN
                redist15_sync_in_aunroll_x_in_c1_eni3_2_5_rdcnt_i <= redist15_sync_in_aunroll_x_in_c1_eni3_2_5_rdcnt_i + 2;
            ELSE
                redist15_sync_in_aunroll_x_in_c1_eni3_2_5_rdcnt_i <= redist15_sync_in_aunroll_x_in_c1_eni3_2_5_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist15_sync_in_aunroll_x_in_c1_eni3_2_5_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist15_sync_in_aunroll_x_in_c1_eni3_2_5_rdcnt_i, 2)));

    -- redist15_sync_in_aunroll_x_in_c1_eni3_2_5_wraddr(REG,311)
    redist15_sync_in_aunroll_x_in_c1_eni3_2_5_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist15_sync_in_aunroll_x_in_c1_eni3_2_5_wraddr_q <= "10";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist15_sync_in_aunroll_x_in_c1_eni3_2_5_wraddr_q <= STD_LOGIC_VECTOR(redist15_sync_in_aunroll_x_in_c1_eni3_2_5_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist15_sync_in_aunroll_x_in_c1_eni3_2_5_mem(DUALMEM,309)
    redist15_sync_in_aunroll_x_in_c1_eni3_2_5_mem_ia <= STD_LOGIC_VECTOR(in_c1_eni3_2);
    redist15_sync_in_aunroll_x_in_c1_eni3_2_5_mem_aa <= redist15_sync_in_aunroll_x_in_c1_eni3_2_5_wraddr_q;
    redist15_sync_in_aunroll_x_in_c1_eni3_2_5_mem_ab <= redist15_sync_in_aunroll_x_in_c1_eni3_2_5_rdcnt_q;
    redist15_sync_in_aunroll_x_in_c1_eni3_2_5_mem_reset0 <= not (resetn);
    redist15_sync_in_aunroll_x_in_c1_eni3_2_5_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 32,
        widthad_b => 2,
        numwords_b => 3,
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
        clocken1 => redist15_sync_in_aunroll_x_in_c1_eni3_2_5_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist15_sync_in_aunroll_x_in_c1_eni3_2_5_mem_reset0,
        clock1 => clock,
        address_a => redist15_sync_in_aunroll_x_in_c1_eni3_2_5_mem_aa,
        data_a => redist15_sync_in_aunroll_x_in_c1_eni3_2_5_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist15_sync_in_aunroll_x_in_c1_eni3_2_5_mem_ab,
        q_b => redist15_sync_in_aunroll_x_in_c1_eni3_2_5_mem_iq
    );
    redist15_sync_in_aunroll_x_in_c1_eni3_2_5_mem_q <= redist15_sync_in_aunroll_x_in_c1_eni3_2_5_mem_iq(31 downto 0);

    -- redist15_sync_in_aunroll_x_in_c1_eni3_2_5_outputreg(DELAY,308)
    redist15_sync_in_aunroll_x_in_c1_eni3_2_5_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist15_sync_in_aunroll_x_in_c1_eni3_2_5_mem_q, xout => redist15_sync_in_aunroll_x_in_c1_eni3_2_5_outputreg_q, clk => clock, aclr => resetn );

    -- c_i32_2gr(CONSTANT,62)
    c_i32_2gr_q <= "00000000000000000000000000000010";

    -- i_inc_1_conv2d1x1(ADD,75)@1
    i_inc_1_conv2d1x1_a <= STD_LOGIC_VECTOR("0" & in_c1_eni3_1);
    i_inc_1_conv2d1x1_b <= STD_LOGIC_VECTOR("0" & c_i32_2gr_q);
    i_inc_1_conv2d1x1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc_1_conv2d1x1_a) + UNSIGNED(i_inc_1_conv2d1x1_b));
    i_inc_1_conv2d1x1_q <= i_inc_1_conv2d1x1_o(32 downto 0);

    -- bgTrunc_i_inc_1_conv2d1x1_sel_x(BITSELECT,4)@1
    bgTrunc_i_inc_1_conv2d1x1_sel_x_b <= i_inc_1_conv2d1x1_q(31 downto 0);

    -- redist33_bgTrunc_i_inc_1_conv2d1x1_sel_x_b_1(DELAY,294)
    redist33_bgTrunc_i_inc_1_conv2d1x1_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_inc_1_conv2d1x1_sel_x_b, xout => redist33_bgTrunc_i_inc_1_conv2d1x1_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_mul16_2_conv2d1x1_bs4(BITSELECT,188)@2
    i_mul16_2_conv2d1x1_bs4_in <= STD_LOGIC_VECTOR(redist33_bgTrunc_i_inc_1_conv2d1x1_sel_x_b_1_q(17 downto 0));
    i_mul16_2_conv2d1x1_bs4_b <= STD_LOGIC_VECTOR(i_mul16_2_conv2d1x1_bs4_in(17 downto 0));

    -- i_mul16_2_conv2d1x1_bjA5(BITJOIN,189)@2
    i_mul16_2_conv2d1x1_bjA5_q <= GND_q & i_mul16_2_conv2d1x1_bs4_b;

    -- i_syncbuf_input_size_y_sync_buffer18_conv2d1x1(BLACKBOX,99)@0
    -- in in_i_dependence@2
    -- in in_valid_in@2
    -- out out_buffer_out@2
    -- out out_valid_out@2
    thei_syncbuf_input_size_y_sync_buffer18_conv2d1x1 : i_syncbuf_input_size_y_sync_buffer18_conv2d1x156
    PORT MAP (
        in_buffer_in => in_input_size_y,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist17_sync_in_aunroll_x_in_i_valid_1_q,
        out_buffer_out => i_syncbuf_input_size_y_sync_buffer18_conv2d1x1_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_mul16_2_conv2d1x1_bs2_merged_bit_select(BITSELECT,260)@2
    i_mul16_2_conv2d1x1_bs2_merged_bit_select_b <= i_syncbuf_input_size_y_sync_buffer18_conv2d1x1_out_buffer_out(17 downto 0);
    i_mul16_2_conv2d1x1_bs2_merged_bit_select_c <= i_syncbuf_input_size_y_sync_buffer18_conv2d1x1_out_buffer_out(31 downto 18);

    -- i_mul16_2_conv2d1x1_bjB9(BITJOIN,193)@2
    i_mul16_2_conv2d1x1_bjB9_q <= GND_q & i_mul16_2_conv2d1x1_bs2_merged_bit_select_b;

    -- i_mul16_2_conv2d1x1_bs7(BITSELECT,191)@2
    i_mul16_2_conv2d1x1_bs7_b <= STD_LOGIC_VECTOR(redist33_bgTrunc_i_inc_1_conv2d1x1_sel_x_b_1_q(31 downto 18));

    -- i_mul16_2_conv2d1x1_ma3_cma(CHAINMULTADD,252)@2 + 2
    i_mul16_2_conv2d1x1_ma3_cma_reset <= not (resetn);
    i_mul16_2_conv2d1x1_ma3_cma_ena0 <= '1';
    i_mul16_2_conv2d1x1_ma3_cma_ena1 <= i_mul16_2_conv2d1x1_ma3_cma_ena0;
    i_mul16_2_conv2d1x1_ma3_cma_l(0) <= SIGNED(RESIZE(i_mul16_2_conv2d1x1_ma3_cma_a0(0),15));
    i_mul16_2_conv2d1x1_ma3_cma_l(1) <= SIGNED(RESIZE(i_mul16_2_conv2d1x1_ma3_cma_a0(1),15));
    i_mul16_2_conv2d1x1_ma3_cma_p(0) <= i_mul16_2_conv2d1x1_ma3_cma_l(0) * i_mul16_2_conv2d1x1_ma3_cma_c0(0);
    i_mul16_2_conv2d1x1_ma3_cma_p(1) <= i_mul16_2_conv2d1x1_ma3_cma_l(1) * i_mul16_2_conv2d1x1_ma3_cma_c0(1);
    i_mul16_2_conv2d1x1_ma3_cma_u(0) <= RESIZE(i_mul16_2_conv2d1x1_ma3_cma_p(0),35);
    i_mul16_2_conv2d1x1_ma3_cma_u(1) <= RESIZE(i_mul16_2_conv2d1x1_ma3_cma_p(1),35);
    i_mul16_2_conv2d1x1_ma3_cma_w(0) <= i_mul16_2_conv2d1x1_ma3_cma_u(0) + i_mul16_2_conv2d1x1_ma3_cma_u(1);
    i_mul16_2_conv2d1x1_ma3_cma_x(0) <= i_mul16_2_conv2d1x1_ma3_cma_w(0);
    i_mul16_2_conv2d1x1_ma3_cma_y(0) <= i_mul16_2_conv2d1x1_ma3_cma_x(0);
    i_mul16_2_conv2d1x1_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul16_2_conv2d1x1_ma3_cma_a0 <= (others => (others => '0'));
            i_mul16_2_conv2d1x1_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul16_2_conv2d1x1_ma3_cma_ena0 = '1') THEN
                i_mul16_2_conv2d1x1_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_mul16_2_conv2d1x1_bs7_b),14);
                i_mul16_2_conv2d1x1_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_mul16_2_conv2d1x1_bs2_merged_bit_select_c),14);
                i_mul16_2_conv2d1x1_ma3_cma_c0(0) <= RESIZE(SIGNED(i_mul16_2_conv2d1x1_bjB9_q),19);
                i_mul16_2_conv2d1x1_ma3_cma_c0(1) <= RESIZE(SIGNED(i_mul16_2_conv2d1x1_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_mul16_2_conv2d1x1_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul16_2_conv2d1x1_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul16_2_conv2d1x1_ma3_cma_ena1 = '1') THEN
                i_mul16_2_conv2d1x1_ma3_cma_s(0) <= i_mul16_2_conv2d1x1_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul16_2_conv2d1x1_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul16_2_conv2d1x1_ma3_cma_s(0)(33 downto 0)), xout => i_mul16_2_conv2d1x1_ma3_cma_qq, clk => clock, aclr => resetn );
    i_mul16_2_conv2d1x1_ma3_cma_q <= STD_LOGIC_VECTOR(i_mul16_2_conv2d1x1_ma3_cma_qq(33 downto 0));

    -- redist2_i_mul16_2_conv2d1x1_ma3_cma_q_1(DELAY,263)
    redist2_i_mul16_2_conv2d1x1_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul16_2_conv2d1x1_ma3_cma_q, xout => redist2_i_mul16_2_conv2d1x1_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul16_2_conv2d1x1_align_14(BITSHIFT,198)@5
    i_mul16_2_conv2d1x1_align_14_qint <= redist2_i_mul16_2_conv2d1x1_ma3_cma_q_1_q & "000000000000000000";
    i_mul16_2_conv2d1x1_align_14_q <= i_mul16_2_conv2d1x1_align_14_qint(51 downto 0);

    -- i_mul16_2_conv2d1x1_bs11(BITSELECT,195)@2
    i_mul16_2_conv2d1x1_bs11_b <= redist33_bgTrunc_i_inc_1_conv2d1x1_sel_x_b_1_q(31 downto 18);

    -- i_mul16_2_conv2d1x1_im10_cma(CHAINMULTADD,246)@2 + 2
    i_mul16_2_conv2d1x1_im10_cma_reset <= not (resetn);
    i_mul16_2_conv2d1x1_im10_cma_ena0 <= '1';
    i_mul16_2_conv2d1x1_im10_cma_ena1 <= i_mul16_2_conv2d1x1_im10_cma_ena0;
    i_mul16_2_conv2d1x1_im10_cma_p(0) <= i_mul16_2_conv2d1x1_im10_cma_a0(0) * i_mul16_2_conv2d1x1_im10_cma_c0(0);
    i_mul16_2_conv2d1x1_im10_cma_u(0) <= RESIZE(i_mul16_2_conv2d1x1_im10_cma_p(0),28);
    i_mul16_2_conv2d1x1_im10_cma_w(0) <= i_mul16_2_conv2d1x1_im10_cma_u(0);
    i_mul16_2_conv2d1x1_im10_cma_x(0) <= i_mul16_2_conv2d1x1_im10_cma_w(0);
    i_mul16_2_conv2d1x1_im10_cma_y(0) <= i_mul16_2_conv2d1x1_im10_cma_x(0);
    i_mul16_2_conv2d1x1_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul16_2_conv2d1x1_im10_cma_a0 <= (others => (others => '0'));
            i_mul16_2_conv2d1x1_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul16_2_conv2d1x1_im10_cma_ena0 = '1') THEN
                i_mul16_2_conv2d1x1_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_mul16_2_conv2d1x1_bs11_b),14);
                i_mul16_2_conv2d1x1_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_mul16_2_conv2d1x1_bs2_merged_bit_select_c),14);
            END IF;
        END IF;
    END PROCESS;
    i_mul16_2_conv2d1x1_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul16_2_conv2d1x1_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul16_2_conv2d1x1_im10_cma_ena1 = '1') THEN
                i_mul16_2_conv2d1x1_im10_cma_s(0) <= i_mul16_2_conv2d1x1_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul16_2_conv2d1x1_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul16_2_conv2d1x1_im10_cma_s(0)(27 downto 0)), xout => i_mul16_2_conv2d1x1_im10_cma_qq, clk => clock, aclr => resetn );
    i_mul16_2_conv2d1x1_im10_cma_q <= STD_LOGIC_VECTOR(i_mul16_2_conv2d1x1_im10_cma_qq(27 downto 0));

    -- redist8_i_mul16_2_conv2d1x1_im10_cma_q_1(DELAY,269)
    redist8_i_mul16_2_conv2d1x1_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul16_2_conv2d1x1_im10_cma_q, xout => redist8_i_mul16_2_conv2d1x1_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul16_2_conv2d1x1_bs1(BITSELECT,185)@2
    i_mul16_2_conv2d1x1_bs1_in <= redist33_bgTrunc_i_inc_1_conv2d1x1_sel_x_b_1_q(17 downto 0);
    i_mul16_2_conv2d1x1_bs1_b <= i_mul16_2_conv2d1x1_bs1_in(17 downto 0);

    -- i_mul16_2_conv2d1x1_im0_cma(CHAINMULTADD,245)@2 + 2
    i_mul16_2_conv2d1x1_im0_cma_reset <= not (resetn);
    i_mul16_2_conv2d1x1_im0_cma_ena0 <= '1';
    i_mul16_2_conv2d1x1_im0_cma_ena1 <= i_mul16_2_conv2d1x1_im0_cma_ena0;
    i_mul16_2_conv2d1x1_im0_cma_p(0) <= i_mul16_2_conv2d1x1_im0_cma_a0(0) * i_mul16_2_conv2d1x1_im0_cma_c0(0);
    i_mul16_2_conv2d1x1_im0_cma_u(0) <= RESIZE(i_mul16_2_conv2d1x1_im0_cma_p(0),36);
    i_mul16_2_conv2d1x1_im0_cma_w(0) <= i_mul16_2_conv2d1x1_im0_cma_u(0);
    i_mul16_2_conv2d1x1_im0_cma_x(0) <= i_mul16_2_conv2d1x1_im0_cma_w(0);
    i_mul16_2_conv2d1x1_im0_cma_y(0) <= i_mul16_2_conv2d1x1_im0_cma_x(0);
    i_mul16_2_conv2d1x1_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul16_2_conv2d1x1_im0_cma_a0 <= (others => (others => '0'));
            i_mul16_2_conv2d1x1_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul16_2_conv2d1x1_im0_cma_ena0 = '1') THEN
                i_mul16_2_conv2d1x1_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_mul16_2_conv2d1x1_bs1_b),18);
                i_mul16_2_conv2d1x1_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_mul16_2_conv2d1x1_bs2_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_mul16_2_conv2d1x1_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul16_2_conv2d1x1_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul16_2_conv2d1x1_im0_cma_ena1 = '1') THEN
                i_mul16_2_conv2d1x1_im0_cma_s(0) <= i_mul16_2_conv2d1x1_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul16_2_conv2d1x1_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul16_2_conv2d1x1_im0_cma_s(0)(35 downto 0)), xout => i_mul16_2_conv2d1x1_im0_cma_qq, clk => clock, aclr => resetn );
    i_mul16_2_conv2d1x1_im0_cma_q <= STD_LOGIC_VECTOR(i_mul16_2_conv2d1x1_im0_cma_qq(35 downto 0));

    -- redist9_i_mul16_2_conv2d1x1_im0_cma_q_1(DELAY,270)
    redist9_i_mul16_2_conv2d1x1_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul16_2_conv2d1x1_im0_cma_q, xout => redist9_i_mul16_2_conv2d1x1_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul16_2_conv2d1x1_join_13(BITJOIN,197)@5
    i_mul16_2_conv2d1x1_join_13_q <= redist8_i_mul16_2_conv2d1x1_im10_cma_q_1_q & redist9_i_mul16_2_conv2d1x1_im0_cma_q_1_q;

    -- i_mul16_2_conv2d1x1_result_add_0_0(ADD,200)@5
    i_mul16_2_conv2d1x1_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_mul16_2_conv2d1x1_join_13_q));
    i_mul16_2_conv2d1x1_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_mul16_2_conv2d1x1_align_14_q(51)) & i_mul16_2_conv2d1x1_align_14_q));
    i_mul16_2_conv2d1x1_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_mul16_2_conv2d1x1_result_add_0_0_a) + SIGNED(i_mul16_2_conv2d1x1_result_add_0_0_b));
    i_mul16_2_conv2d1x1_result_add_0_0_q <= i_mul16_2_conv2d1x1_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_mul16_2_conv2d1x1_rnd_sel(BITSELECT,160)@5
    bgTrunc_i_mul16_2_conv2d1x1_rnd_sel_in <= i_mul16_2_conv2d1x1_result_add_0_0_q(63 downto 0);
    bgTrunc_i_mul16_2_conv2d1x1_rnd_sel_b <= bgTrunc_i_mul16_2_conv2d1x1_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_mul16_2_conv2d1x1_sel_x(BITSELECT,8)@5
    bgTrunc_i_mul16_2_conv2d1x1_sel_x_b <= bgTrunc_i_mul16_2_conv2d1x1_rnd_sel_b(31 downto 0);

    -- redist28_bgTrunc_i_mul16_2_conv2d1x1_sel_x_b_1(DELAY,289)
    redist28_bgTrunc_i_mul16_2_conv2d1x1_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_mul16_2_conv2d1x1_sel_x_b, xout => redist28_bgTrunc_i_mul16_2_conv2d1x1_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_tmp_2_conv2d1x1(ADD,104)@6
    i_tmp_2_conv2d1x1_a <= STD_LOGIC_VECTOR("0" & redist28_bgTrunc_i_mul16_2_conv2d1x1_sel_x_b_1_q);
    i_tmp_2_conv2d1x1_b <= STD_LOGIC_VECTOR("0" & redist15_sync_in_aunroll_x_in_c1_eni3_2_5_outputreg_q);
    i_tmp_2_conv2d1x1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_tmp_2_conv2d1x1_a) + UNSIGNED(i_tmp_2_conv2d1x1_b));
    i_tmp_2_conv2d1x1_q <= i_tmp_2_conv2d1x1_o(32 downto 0);

    -- bgTrunc_i_tmp_2_conv2d1x1_sel_x(BITSELECT,12)@6
    bgTrunc_i_tmp_2_conv2d1x1_sel_x_b <= i_tmp_2_conv2d1x1_q(31 downto 0);

    -- redist24_bgTrunc_i_tmp_2_conv2d1x1_sel_x_b_1(DELAY,285)
    redist24_bgTrunc_i_tmp_2_conv2d1x1_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_tmp_2_conv2d1x1_sel_x_b, xout => redist24_bgTrunc_i_tmp_2_conv2d1x1_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_tmp1_2_conv2d1x1_bs4(BITSELECT,222)@7
    i_tmp1_2_conv2d1x1_bs4_in <= STD_LOGIC_VECTOR(redist24_bgTrunc_i_tmp_2_conv2d1x1_sel_x_b_1_q(17 downto 0));
    i_tmp1_2_conv2d1x1_bs4_b <= STD_LOGIC_VECTOR(i_tmp1_2_conv2d1x1_bs4_in(17 downto 0));

    -- i_tmp1_2_conv2d1x1_bjA5(BITJOIN,223)@7
    i_tmp1_2_conv2d1x1_bjA5_q <= GND_q & i_tmp1_2_conv2d1x1_bs4_b;

    -- i_syncbuf_input_size_x_sync_buffer12_conv2d1x1(BLACKBOX,96)@0
    -- in in_i_dependence@7
    -- in in_valid_in@7
    -- out out_buffer_out@7
    -- out out_valid_out@7
    thei_syncbuf_input_size_x_sync_buffer12_conv2d1x1 : i_syncbuf_input_size_x_sync_buffer12_conv2d1x158
    PORT MAP (
        in_buffer_in => in_input_size_x,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist18_sync_in_aunroll_x_in_i_valid_6_q,
        out_buffer_out => i_syncbuf_input_size_x_sync_buffer12_conv2d1x1_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_tmp1_2_conv2d1x1_bs2_merged_bit_select(BITSELECT,258)@7
    i_tmp1_2_conv2d1x1_bs2_merged_bit_select_b <= i_syncbuf_input_size_x_sync_buffer12_conv2d1x1_out_buffer_out(17 downto 0);
    i_tmp1_2_conv2d1x1_bs2_merged_bit_select_c <= i_syncbuf_input_size_x_sync_buffer12_conv2d1x1_out_buffer_out(31 downto 18);

    -- i_tmp1_2_conv2d1x1_bjB9(BITJOIN,227)@7
    i_tmp1_2_conv2d1x1_bjB9_q <= GND_q & i_tmp1_2_conv2d1x1_bs2_merged_bit_select_b;

    -- i_tmp1_2_conv2d1x1_bs7(BITSELECT,225)@7
    i_tmp1_2_conv2d1x1_bs7_b <= STD_LOGIC_VECTOR(redist24_bgTrunc_i_tmp_2_conv2d1x1_sel_x_b_1_q(31 downto 18));

    -- i_tmp1_2_conv2d1x1_ma3_cma(CHAINMULTADD,254)@7 + 2
    i_tmp1_2_conv2d1x1_ma3_cma_reset <= not (resetn);
    i_tmp1_2_conv2d1x1_ma3_cma_ena0 <= '1';
    i_tmp1_2_conv2d1x1_ma3_cma_ena1 <= i_tmp1_2_conv2d1x1_ma3_cma_ena0;
    i_tmp1_2_conv2d1x1_ma3_cma_l(0) <= SIGNED(RESIZE(i_tmp1_2_conv2d1x1_ma3_cma_a0(0),15));
    i_tmp1_2_conv2d1x1_ma3_cma_l(1) <= SIGNED(RESIZE(i_tmp1_2_conv2d1x1_ma3_cma_a0(1),15));
    i_tmp1_2_conv2d1x1_ma3_cma_p(0) <= i_tmp1_2_conv2d1x1_ma3_cma_l(0) * i_tmp1_2_conv2d1x1_ma3_cma_c0(0);
    i_tmp1_2_conv2d1x1_ma3_cma_p(1) <= i_tmp1_2_conv2d1x1_ma3_cma_l(1) * i_tmp1_2_conv2d1x1_ma3_cma_c0(1);
    i_tmp1_2_conv2d1x1_ma3_cma_u(0) <= RESIZE(i_tmp1_2_conv2d1x1_ma3_cma_p(0),35);
    i_tmp1_2_conv2d1x1_ma3_cma_u(1) <= RESIZE(i_tmp1_2_conv2d1x1_ma3_cma_p(1),35);
    i_tmp1_2_conv2d1x1_ma3_cma_w(0) <= i_tmp1_2_conv2d1x1_ma3_cma_u(0) + i_tmp1_2_conv2d1x1_ma3_cma_u(1);
    i_tmp1_2_conv2d1x1_ma3_cma_x(0) <= i_tmp1_2_conv2d1x1_ma3_cma_w(0);
    i_tmp1_2_conv2d1x1_ma3_cma_y(0) <= i_tmp1_2_conv2d1x1_ma3_cma_x(0);
    i_tmp1_2_conv2d1x1_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_tmp1_2_conv2d1x1_ma3_cma_a0 <= (others => (others => '0'));
            i_tmp1_2_conv2d1x1_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_tmp1_2_conv2d1x1_ma3_cma_ena0 = '1') THEN
                i_tmp1_2_conv2d1x1_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_tmp1_2_conv2d1x1_bs7_b),14);
                i_tmp1_2_conv2d1x1_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_tmp1_2_conv2d1x1_bs2_merged_bit_select_c),14);
                i_tmp1_2_conv2d1x1_ma3_cma_c0(0) <= RESIZE(SIGNED(i_tmp1_2_conv2d1x1_bjB9_q),19);
                i_tmp1_2_conv2d1x1_ma3_cma_c0(1) <= RESIZE(SIGNED(i_tmp1_2_conv2d1x1_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_tmp1_2_conv2d1x1_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_tmp1_2_conv2d1x1_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_tmp1_2_conv2d1x1_ma3_cma_ena1 = '1') THEN
                i_tmp1_2_conv2d1x1_ma3_cma_s(0) <= i_tmp1_2_conv2d1x1_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_tmp1_2_conv2d1x1_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_tmp1_2_conv2d1x1_ma3_cma_s(0)(33 downto 0)), xout => i_tmp1_2_conv2d1x1_ma3_cma_qq, clk => clock, aclr => resetn );
    i_tmp1_2_conv2d1x1_ma3_cma_q <= STD_LOGIC_VECTOR(i_tmp1_2_conv2d1x1_ma3_cma_qq(33 downto 0));

    -- redist0_i_tmp1_2_conv2d1x1_ma3_cma_q_1(DELAY,261)
    redist0_i_tmp1_2_conv2d1x1_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_tmp1_2_conv2d1x1_ma3_cma_q, xout => redist0_i_tmp1_2_conv2d1x1_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_tmp1_2_conv2d1x1_align_14(BITSHIFT,232)@10
    i_tmp1_2_conv2d1x1_align_14_qint <= redist0_i_tmp1_2_conv2d1x1_ma3_cma_q_1_q & "000000000000000000";
    i_tmp1_2_conv2d1x1_align_14_q <= i_tmp1_2_conv2d1x1_align_14_qint(51 downto 0);

    -- i_tmp1_2_conv2d1x1_bs11(BITSELECT,229)@7
    i_tmp1_2_conv2d1x1_bs11_b <= redist24_bgTrunc_i_tmp_2_conv2d1x1_sel_x_b_1_q(31 downto 18);

    -- i_tmp1_2_conv2d1x1_im10_cma(CHAINMULTADD,250)@7 + 2
    i_tmp1_2_conv2d1x1_im10_cma_reset <= not (resetn);
    i_tmp1_2_conv2d1x1_im10_cma_ena0 <= '1';
    i_tmp1_2_conv2d1x1_im10_cma_ena1 <= i_tmp1_2_conv2d1x1_im10_cma_ena0;
    i_tmp1_2_conv2d1x1_im10_cma_p(0) <= i_tmp1_2_conv2d1x1_im10_cma_a0(0) * i_tmp1_2_conv2d1x1_im10_cma_c0(0);
    i_tmp1_2_conv2d1x1_im10_cma_u(0) <= RESIZE(i_tmp1_2_conv2d1x1_im10_cma_p(0),28);
    i_tmp1_2_conv2d1x1_im10_cma_w(0) <= i_tmp1_2_conv2d1x1_im10_cma_u(0);
    i_tmp1_2_conv2d1x1_im10_cma_x(0) <= i_tmp1_2_conv2d1x1_im10_cma_w(0);
    i_tmp1_2_conv2d1x1_im10_cma_y(0) <= i_tmp1_2_conv2d1x1_im10_cma_x(0);
    i_tmp1_2_conv2d1x1_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_tmp1_2_conv2d1x1_im10_cma_a0 <= (others => (others => '0'));
            i_tmp1_2_conv2d1x1_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_tmp1_2_conv2d1x1_im10_cma_ena0 = '1') THEN
                i_tmp1_2_conv2d1x1_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_tmp1_2_conv2d1x1_bs11_b),14);
                i_tmp1_2_conv2d1x1_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_tmp1_2_conv2d1x1_bs2_merged_bit_select_c),14);
            END IF;
        END IF;
    END PROCESS;
    i_tmp1_2_conv2d1x1_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_tmp1_2_conv2d1x1_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_tmp1_2_conv2d1x1_im10_cma_ena1 = '1') THEN
                i_tmp1_2_conv2d1x1_im10_cma_s(0) <= i_tmp1_2_conv2d1x1_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_tmp1_2_conv2d1x1_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_tmp1_2_conv2d1x1_im10_cma_s(0)(27 downto 0)), xout => i_tmp1_2_conv2d1x1_im10_cma_qq, clk => clock, aclr => resetn );
    i_tmp1_2_conv2d1x1_im10_cma_q <= STD_LOGIC_VECTOR(i_tmp1_2_conv2d1x1_im10_cma_qq(27 downto 0));

    -- redist4_i_tmp1_2_conv2d1x1_im10_cma_q_1(DELAY,265)
    redist4_i_tmp1_2_conv2d1x1_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_tmp1_2_conv2d1x1_im10_cma_q, xout => redist4_i_tmp1_2_conv2d1x1_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_tmp1_2_conv2d1x1_bs1(BITSELECT,219)@7
    i_tmp1_2_conv2d1x1_bs1_in <= redist24_bgTrunc_i_tmp_2_conv2d1x1_sel_x_b_1_q(17 downto 0);
    i_tmp1_2_conv2d1x1_bs1_b <= i_tmp1_2_conv2d1x1_bs1_in(17 downto 0);

    -- i_tmp1_2_conv2d1x1_im0_cma(CHAINMULTADD,249)@7 + 2
    i_tmp1_2_conv2d1x1_im0_cma_reset <= not (resetn);
    i_tmp1_2_conv2d1x1_im0_cma_ena0 <= '1';
    i_tmp1_2_conv2d1x1_im0_cma_ena1 <= i_tmp1_2_conv2d1x1_im0_cma_ena0;
    i_tmp1_2_conv2d1x1_im0_cma_p(0) <= i_tmp1_2_conv2d1x1_im0_cma_a0(0) * i_tmp1_2_conv2d1x1_im0_cma_c0(0);
    i_tmp1_2_conv2d1x1_im0_cma_u(0) <= RESIZE(i_tmp1_2_conv2d1x1_im0_cma_p(0),36);
    i_tmp1_2_conv2d1x1_im0_cma_w(0) <= i_tmp1_2_conv2d1x1_im0_cma_u(0);
    i_tmp1_2_conv2d1x1_im0_cma_x(0) <= i_tmp1_2_conv2d1x1_im0_cma_w(0);
    i_tmp1_2_conv2d1x1_im0_cma_y(0) <= i_tmp1_2_conv2d1x1_im0_cma_x(0);
    i_tmp1_2_conv2d1x1_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_tmp1_2_conv2d1x1_im0_cma_a0 <= (others => (others => '0'));
            i_tmp1_2_conv2d1x1_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_tmp1_2_conv2d1x1_im0_cma_ena0 = '1') THEN
                i_tmp1_2_conv2d1x1_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_tmp1_2_conv2d1x1_bs1_b),18);
                i_tmp1_2_conv2d1x1_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_tmp1_2_conv2d1x1_bs2_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_tmp1_2_conv2d1x1_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_tmp1_2_conv2d1x1_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_tmp1_2_conv2d1x1_im0_cma_ena1 = '1') THEN
                i_tmp1_2_conv2d1x1_im0_cma_s(0) <= i_tmp1_2_conv2d1x1_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_tmp1_2_conv2d1x1_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_tmp1_2_conv2d1x1_im0_cma_s(0)(35 downto 0)), xout => i_tmp1_2_conv2d1x1_im0_cma_qq, clk => clock, aclr => resetn );
    i_tmp1_2_conv2d1x1_im0_cma_q <= STD_LOGIC_VECTOR(i_tmp1_2_conv2d1x1_im0_cma_qq(35 downto 0));

    -- redist5_i_tmp1_2_conv2d1x1_im0_cma_q_1(DELAY,266)
    redist5_i_tmp1_2_conv2d1x1_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_tmp1_2_conv2d1x1_im0_cma_q, xout => redist5_i_tmp1_2_conv2d1x1_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_tmp1_2_conv2d1x1_join_13(BITJOIN,231)@10
    i_tmp1_2_conv2d1x1_join_13_q <= redist4_i_tmp1_2_conv2d1x1_im10_cma_q_1_q & redist5_i_tmp1_2_conv2d1x1_im0_cma_q_1_q;

    -- i_tmp1_2_conv2d1x1_result_add_0_0(ADD,234)@10
    i_tmp1_2_conv2d1x1_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_tmp1_2_conv2d1x1_join_13_q));
    i_tmp1_2_conv2d1x1_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_tmp1_2_conv2d1x1_align_14_q(51)) & i_tmp1_2_conv2d1x1_align_14_q));
    i_tmp1_2_conv2d1x1_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_tmp1_2_conv2d1x1_result_add_0_0_a) + SIGNED(i_tmp1_2_conv2d1x1_result_add_0_0_b));
    i_tmp1_2_conv2d1x1_result_add_0_0_q <= i_tmp1_2_conv2d1x1_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_tmp1_2_conv2d1x1_rnd_sel(BITSELECT,162)@10
    bgTrunc_i_tmp1_2_conv2d1x1_rnd_sel_in <= i_tmp1_2_conv2d1x1_result_add_0_0_q(63 downto 0);
    bgTrunc_i_tmp1_2_conv2d1x1_rnd_sel_b <= bgTrunc_i_tmp1_2_conv2d1x1_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_tmp1_2_conv2d1x1_sel_x(BITSELECT,10)@10
    bgTrunc_i_tmp1_2_conv2d1x1_sel_x_b <= bgTrunc_i_tmp1_2_conv2d1x1_rnd_sel_b(31 downto 0);

    -- redist26_bgTrunc_i_tmp1_2_conv2d1x1_sel_x_b_1(DELAY,287)
    redist26_bgTrunc_i_tmp1_2_conv2d1x1_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_tmp1_2_conv2d1x1_sel_x_b, xout => redist26_bgTrunc_i_tmp1_2_conv2d1x1_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_add18_2_conv2d1x1(ADD,65)@11
    i_add18_2_conv2d1x1_a <= STD_LOGIC_VECTOR("0" & redist26_bgTrunc_i_tmp1_2_conv2d1x1_sel_x_b_1_q);
    i_add18_2_conv2d1x1_b <= STD_LOGIC_VECTOR("0" & redist16_sync_in_aunroll_x_in_c1_eni3_3_10_outputreg_q);
    i_add18_2_conv2d1x1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add18_2_conv2d1x1_a) + UNSIGNED(i_add18_2_conv2d1x1_b));
    i_add18_2_conv2d1x1_q <= i_add18_2_conv2d1x1_o(32 downto 0);

    -- bgTrunc_i_add18_2_conv2d1x1_sel_x(BITSELECT,3)@11
    bgTrunc_i_add18_2_conv2d1x1_sel_x_b <= i_add18_2_conv2d1x1_q(31 downto 0);

    -- redist34_bgTrunc_i_add18_2_conv2d1x1_sel_x_b_1(DELAY,295)
    redist34_bgTrunc_i_add18_2_conv2d1x1_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add18_2_conv2d1x1_sel_x_b, xout => redist34_bgTrunc_i_add18_2_conv2d1x1_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_idxprom19_2_conv2d1x1_sel_x(BITSELECT,46)@12
    i_idxprom19_2_conv2d1x1_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist34_bgTrunc_i_add18_2_conv2d1x1_sel_x_b_1_q(31 downto 0)), 64)));

    -- i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_bs1_merged_bit_select(BITSELECT,256)@12
    i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_bs1_merged_bit_select_b <= i_idxprom19_2_conv2d1x1_sel_x_b(17 downto 0);
    i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_bs1_merged_bit_select_c <= i_idxprom19_2_conv2d1x1_sel_x_b(63 downto 54);
    i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_bs1_merged_bit_select_d <= i_idxprom19_2_conv2d1x1_sel_x_b(35 downto 18);
    i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_bs1_merged_bit_select_e <= i_idxprom19_2_conv2d1x1_sel_x_b(53 downto 36);

    -- i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im3_shift0(BITSHIFT,240)@12
    i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im3_shift0_qint <= i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im3_shift0_q <= i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_align_15(BITSHIFT,151)@12
    i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_align_15_q <= i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im6_shift0(BITSHIFT,241)@12
    i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im6_shift0_qint <= i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im6_shift0_q <= i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_align_14(BITSHIFT,150)@12
    i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_align_14_q <= i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_join_16(BITJOIN,152)@12
    i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_join_16_q <= i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_align_15_q & i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_align_14_q;

    -- i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im9_shift0(BITSHIFT,242)@12
    i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im9_shift0_qint <= i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im9_shift0_q <= i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_align_12(BITSHIFT,148)@12
    i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_align_12_q <= i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im0_shift0(BITSHIFT,239)@12
    i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im0_shift0_qint <= i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im0_shift0_q <= i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_join_13(BITJOIN,149)@12
    i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_join_13_q <= i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_im0_shift0_q);

    -- i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_result_add_0_0(ADD,153)@12
    i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_join_13_q);
    i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_join_16_q);
    i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_result_add_0_0_b));
    i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_result_add_0_0_q <= i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_extender_x(BITJOIN,38)@12
    i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_extender_x_q <= i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_multconst_x_q & i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx20_2_conv2d1x1_conv2d1x162_trunc_sel_x(BITSELECT,40)@12
    i_arrayidx20_2_conv2d1x1_conv2d1x162_trunc_sel_x_b <= i_arrayidx20_2_conv2d1x1_conv2d1x162_mult_extender_x_q(63 downto 0);

    -- redist22_i_arrayidx20_2_conv2d1x1_conv2d1x162_trunc_sel_x_b_1(DELAY,283)
    redist22_i_arrayidx20_2_conv2d1x1_conv2d1x162_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_arrayidx20_2_conv2d1x1_conv2d1x162_trunc_sel_x_b, xout => redist22_i_arrayidx20_2_conv2d1x1_conv2d1x162_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_input_im_sync_buffer22_conv2d1x1(BLACKBOX,94)@0
    -- in in_i_dependence@13
    -- in in_valid_in@13
    -- out out_buffer_out@13
    -- out out_valid_out@13
    thei_syncbuf_input_im_sync_buffer22_conv2d1x1 : i_syncbuf_input_im_sync_buffer22_conv2d1x160
    PORT MAP (
        in_buffer_in => in_input_im,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_12_q,
        out_buffer_out => i_syncbuf_input_im_sync_buffer22_conv2d1x1_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx20_2_conv2d1x1_conv2d1x162_add_x(ADD,41)@13
    i_arrayidx20_2_conv2d1x1_conv2d1x162_add_x_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_input_im_sync_buffer22_conv2d1x1_out_buffer_out);
    i_arrayidx20_2_conv2d1x1_conv2d1x162_add_x_b <= STD_LOGIC_VECTOR("0" & redist22_i_arrayidx20_2_conv2d1x1_conv2d1x162_trunc_sel_x_b_1_q);
    i_arrayidx20_2_conv2d1x1_conv2d1x162_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx20_2_conv2d1x1_conv2d1x162_add_x_a) + UNSIGNED(i_arrayidx20_2_conv2d1x1_conv2d1x162_add_x_b));
    i_arrayidx20_2_conv2d1x1_conv2d1x162_add_x_q <= i_arrayidx20_2_conv2d1x1_conv2d1x162_add_x_o(64 downto 0);

    -- i_arrayidx20_2_conv2d1x1_conv2d1x162_dupName_0_trunc_sel_x(BITSELECT,35)@13
    i_arrayidx20_2_conv2d1x1_conv2d1x162_dupName_0_trunc_sel_x_b <= i_arrayidx20_2_conv2d1x1_conv2d1x162_add_x_q(63 downto 0);

    -- c_i32_1gr(CONSTANT,61)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- i_inc_conv2d1x1(ADD,77)@1
    i_inc_conv2d1x1_a <= STD_LOGIC_VECTOR("0" & in_c1_eni3_1);
    i_inc_conv2d1x1_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc_conv2d1x1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc_conv2d1x1_a) + UNSIGNED(i_inc_conv2d1x1_b));
    i_inc_conv2d1x1_q <= i_inc_conv2d1x1_o(32 downto 0);

    -- bgTrunc_i_inc_conv2d1x1_sel_x(BITSELECT,6)@1
    bgTrunc_i_inc_conv2d1x1_sel_x_b <= i_inc_conv2d1x1_q(31 downto 0);

    -- redist30_bgTrunc_i_inc_conv2d1x1_sel_x_b_1(DELAY,291)
    redist30_bgTrunc_i_inc_conv2d1x1_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_inc_conv2d1x1_sel_x_b, xout => redist30_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_mul16_1_conv2d1x1_bs4(BITSELECT,171)@2
    i_mul16_1_conv2d1x1_bs4_in <= STD_LOGIC_VECTOR(redist30_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_q(17 downto 0));
    i_mul16_1_conv2d1x1_bs4_b <= STD_LOGIC_VECTOR(i_mul16_1_conv2d1x1_bs4_in(17 downto 0));

    -- i_mul16_1_conv2d1x1_bjA5(BITJOIN,172)@2
    i_mul16_1_conv2d1x1_bjA5_q <= GND_q & i_mul16_1_conv2d1x1_bs4_b;

    -- i_syncbuf_input_size_y_sync_buffer17_conv2d1x1(BLACKBOX,98)@0
    -- in in_i_dependence@2
    -- in in_valid_in@2
    -- out out_buffer_out@2
    -- out out_valid_out@2
    thei_syncbuf_input_size_y_sync_buffer17_conv2d1x1 : i_syncbuf_input_size_y_sync_buffer17_conv2d1x149
    PORT MAP (
        in_buffer_in => in_input_size_y,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist17_sync_in_aunroll_x_in_i_valid_1_q,
        out_buffer_out => i_syncbuf_input_size_y_sync_buffer17_conv2d1x1_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_mul16_1_conv2d1x1_bs2_merged_bit_select(BITSELECT,259)@2
    i_mul16_1_conv2d1x1_bs2_merged_bit_select_b <= i_syncbuf_input_size_y_sync_buffer17_conv2d1x1_out_buffer_out(17 downto 0);
    i_mul16_1_conv2d1x1_bs2_merged_bit_select_c <= i_syncbuf_input_size_y_sync_buffer17_conv2d1x1_out_buffer_out(31 downto 18);

    -- i_mul16_1_conv2d1x1_bjB9(BITJOIN,176)@2
    i_mul16_1_conv2d1x1_bjB9_q <= GND_q & i_mul16_1_conv2d1x1_bs2_merged_bit_select_b;

    -- i_mul16_1_conv2d1x1_bs7(BITSELECT,174)@2
    i_mul16_1_conv2d1x1_bs7_b <= STD_LOGIC_VECTOR(redist30_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_q(31 downto 18));

    -- i_mul16_1_conv2d1x1_ma3_cma(CHAINMULTADD,251)@2 + 2
    i_mul16_1_conv2d1x1_ma3_cma_reset <= not (resetn);
    i_mul16_1_conv2d1x1_ma3_cma_ena0 <= '1';
    i_mul16_1_conv2d1x1_ma3_cma_ena1 <= i_mul16_1_conv2d1x1_ma3_cma_ena0;
    i_mul16_1_conv2d1x1_ma3_cma_l(0) <= SIGNED(RESIZE(i_mul16_1_conv2d1x1_ma3_cma_a0(0),15));
    i_mul16_1_conv2d1x1_ma3_cma_l(1) <= SIGNED(RESIZE(i_mul16_1_conv2d1x1_ma3_cma_a0(1),15));
    i_mul16_1_conv2d1x1_ma3_cma_p(0) <= i_mul16_1_conv2d1x1_ma3_cma_l(0) * i_mul16_1_conv2d1x1_ma3_cma_c0(0);
    i_mul16_1_conv2d1x1_ma3_cma_p(1) <= i_mul16_1_conv2d1x1_ma3_cma_l(1) * i_mul16_1_conv2d1x1_ma3_cma_c0(1);
    i_mul16_1_conv2d1x1_ma3_cma_u(0) <= RESIZE(i_mul16_1_conv2d1x1_ma3_cma_p(0),35);
    i_mul16_1_conv2d1x1_ma3_cma_u(1) <= RESIZE(i_mul16_1_conv2d1x1_ma3_cma_p(1),35);
    i_mul16_1_conv2d1x1_ma3_cma_w(0) <= i_mul16_1_conv2d1x1_ma3_cma_u(0) + i_mul16_1_conv2d1x1_ma3_cma_u(1);
    i_mul16_1_conv2d1x1_ma3_cma_x(0) <= i_mul16_1_conv2d1x1_ma3_cma_w(0);
    i_mul16_1_conv2d1x1_ma3_cma_y(0) <= i_mul16_1_conv2d1x1_ma3_cma_x(0);
    i_mul16_1_conv2d1x1_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul16_1_conv2d1x1_ma3_cma_a0 <= (others => (others => '0'));
            i_mul16_1_conv2d1x1_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul16_1_conv2d1x1_ma3_cma_ena0 = '1') THEN
                i_mul16_1_conv2d1x1_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_mul16_1_conv2d1x1_bs7_b),14);
                i_mul16_1_conv2d1x1_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_mul16_1_conv2d1x1_bs2_merged_bit_select_c),14);
                i_mul16_1_conv2d1x1_ma3_cma_c0(0) <= RESIZE(SIGNED(i_mul16_1_conv2d1x1_bjB9_q),19);
                i_mul16_1_conv2d1x1_ma3_cma_c0(1) <= RESIZE(SIGNED(i_mul16_1_conv2d1x1_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_mul16_1_conv2d1x1_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul16_1_conv2d1x1_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul16_1_conv2d1x1_ma3_cma_ena1 = '1') THEN
                i_mul16_1_conv2d1x1_ma3_cma_s(0) <= i_mul16_1_conv2d1x1_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul16_1_conv2d1x1_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul16_1_conv2d1x1_ma3_cma_s(0)(33 downto 0)), xout => i_mul16_1_conv2d1x1_ma3_cma_qq, clk => clock, aclr => resetn );
    i_mul16_1_conv2d1x1_ma3_cma_q <= STD_LOGIC_VECTOR(i_mul16_1_conv2d1x1_ma3_cma_qq(33 downto 0));

    -- redist3_i_mul16_1_conv2d1x1_ma3_cma_q_1(DELAY,264)
    redist3_i_mul16_1_conv2d1x1_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul16_1_conv2d1x1_ma3_cma_q, xout => redist3_i_mul16_1_conv2d1x1_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul16_1_conv2d1x1_align_14(BITSHIFT,181)@5
    i_mul16_1_conv2d1x1_align_14_qint <= redist3_i_mul16_1_conv2d1x1_ma3_cma_q_1_q & "000000000000000000";
    i_mul16_1_conv2d1x1_align_14_q <= i_mul16_1_conv2d1x1_align_14_qint(51 downto 0);

    -- i_mul16_1_conv2d1x1_bs11(BITSELECT,178)@2
    i_mul16_1_conv2d1x1_bs11_b <= redist30_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_q(31 downto 18);

    -- i_mul16_1_conv2d1x1_im10_cma(CHAINMULTADD,244)@2 + 2
    i_mul16_1_conv2d1x1_im10_cma_reset <= not (resetn);
    i_mul16_1_conv2d1x1_im10_cma_ena0 <= '1';
    i_mul16_1_conv2d1x1_im10_cma_ena1 <= i_mul16_1_conv2d1x1_im10_cma_ena0;
    i_mul16_1_conv2d1x1_im10_cma_p(0) <= i_mul16_1_conv2d1x1_im10_cma_a0(0) * i_mul16_1_conv2d1x1_im10_cma_c0(0);
    i_mul16_1_conv2d1x1_im10_cma_u(0) <= RESIZE(i_mul16_1_conv2d1x1_im10_cma_p(0),28);
    i_mul16_1_conv2d1x1_im10_cma_w(0) <= i_mul16_1_conv2d1x1_im10_cma_u(0);
    i_mul16_1_conv2d1x1_im10_cma_x(0) <= i_mul16_1_conv2d1x1_im10_cma_w(0);
    i_mul16_1_conv2d1x1_im10_cma_y(0) <= i_mul16_1_conv2d1x1_im10_cma_x(0);
    i_mul16_1_conv2d1x1_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul16_1_conv2d1x1_im10_cma_a0 <= (others => (others => '0'));
            i_mul16_1_conv2d1x1_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul16_1_conv2d1x1_im10_cma_ena0 = '1') THEN
                i_mul16_1_conv2d1x1_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_mul16_1_conv2d1x1_bs11_b),14);
                i_mul16_1_conv2d1x1_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_mul16_1_conv2d1x1_bs2_merged_bit_select_c),14);
            END IF;
        END IF;
    END PROCESS;
    i_mul16_1_conv2d1x1_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul16_1_conv2d1x1_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul16_1_conv2d1x1_im10_cma_ena1 = '1') THEN
                i_mul16_1_conv2d1x1_im10_cma_s(0) <= i_mul16_1_conv2d1x1_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul16_1_conv2d1x1_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul16_1_conv2d1x1_im10_cma_s(0)(27 downto 0)), xout => i_mul16_1_conv2d1x1_im10_cma_qq, clk => clock, aclr => resetn );
    i_mul16_1_conv2d1x1_im10_cma_q <= STD_LOGIC_VECTOR(i_mul16_1_conv2d1x1_im10_cma_qq(27 downto 0));

    -- redist10_i_mul16_1_conv2d1x1_im10_cma_q_1(DELAY,271)
    redist10_i_mul16_1_conv2d1x1_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul16_1_conv2d1x1_im10_cma_q, xout => redist10_i_mul16_1_conv2d1x1_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul16_1_conv2d1x1_bs1(BITSELECT,168)@2
    i_mul16_1_conv2d1x1_bs1_in <= redist30_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_q(17 downto 0);
    i_mul16_1_conv2d1x1_bs1_b <= i_mul16_1_conv2d1x1_bs1_in(17 downto 0);

    -- i_mul16_1_conv2d1x1_im0_cma(CHAINMULTADD,243)@2 + 2
    i_mul16_1_conv2d1x1_im0_cma_reset <= not (resetn);
    i_mul16_1_conv2d1x1_im0_cma_ena0 <= '1';
    i_mul16_1_conv2d1x1_im0_cma_ena1 <= i_mul16_1_conv2d1x1_im0_cma_ena0;
    i_mul16_1_conv2d1x1_im0_cma_p(0) <= i_mul16_1_conv2d1x1_im0_cma_a0(0) * i_mul16_1_conv2d1x1_im0_cma_c0(0);
    i_mul16_1_conv2d1x1_im0_cma_u(0) <= RESIZE(i_mul16_1_conv2d1x1_im0_cma_p(0),36);
    i_mul16_1_conv2d1x1_im0_cma_w(0) <= i_mul16_1_conv2d1x1_im0_cma_u(0);
    i_mul16_1_conv2d1x1_im0_cma_x(0) <= i_mul16_1_conv2d1x1_im0_cma_w(0);
    i_mul16_1_conv2d1x1_im0_cma_y(0) <= i_mul16_1_conv2d1x1_im0_cma_x(0);
    i_mul16_1_conv2d1x1_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul16_1_conv2d1x1_im0_cma_a0 <= (others => (others => '0'));
            i_mul16_1_conv2d1x1_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul16_1_conv2d1x1_im0_cma_ena0 = '1') THEN
                i_mul16_1_conv2d1x1_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_mul16_1_conv2d1x1_bs1_b),18);
                i_mul16_1_conv2d1x1_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_mul16_1_conv2d1x1_bs2_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_mul16_1_conv2d1x1_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul16_1_conv2d1x1_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul16_1_conv2d1x1_im0_cma_ena1 = '1') THEN
                i_mul16_1_conv2d1x1_im0_cma_s(0) <= i_mul16_1_conv2d1x1_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul16_1_conv2d1x1_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul16_1_conv2d1x1_im0_cma_s(0)(35 downto 0)), xout => i_mul16_1_conv2d1x1_im0_cma_qq, clk => clock, aclr => resetn );
    i_mul16_1_conv2d1x1_im0_cma_q <= STD_LOGIC_VECTOR(i_mul16_1_conv2d1x1_im0_cma_qq(35 downto 0));

    -- redist11_i_mul16_1_conv2d1x1_im0_cma_q_1(DELAY,272)
    redist11_i_mul16_1_conv2d1x1_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul16_1_conv2d1x1_im0_cma_q, xout => redist11_i_mul16_1_conv2d1x1_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul16_1_conv2d1x1_join_13(BITJOIN,180)@5
    i_mul16_1_conv2d1x1_join_13_q <= redist10_i_mul16_1_conv2d1x1_im10_cma_q_1_q & redist11_i_mul16_1_conv2d1x1_im0_cma_q_1_q;

    -- i_mul16_1_conv2d1x1_result_add_0_0(ADD,183)@5
    i_mul16_1_conv2d1x1_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_mul16_1_conv2d1x1_join_13_q));
    i_mul16_1_conv2d1x1_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_mul16_1_conv2d1x1_align_14_q(51)) & i_mul16_1_conv2d1x1_align_14_q));
    i_mul16_1_conv2d1x1_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_mul16_1_conv2d1x1_result_add_0_0_a) + SIGNED(i_mul16_1_conv2d1x1_result_add_0_0_b));
    i_mul16_1_conv2d1x1_result_add_0_0_q <= i_mul16_1_conv2d1x1_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_mul16_1_conv2d1x1_rnd_sel(BITSELECT,159)@5
    bgTrunc_i_mul16_1_conv2d1x1_rnd_sel_in <= i_mul16_1_conv2d1x1_result_add_0_0_q(63 downto 0);
    bgTrunc_i_mul16_1_conv2d1x1_rnd_sel_b <= bgTrunc_i_mul16_1_conv2d1x1_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_mul16_1_conv2d1x1_sel_x(BITSELECT,7)@5
    bgTrunc_i_mul16_1_conv2d1x1_sel_x_b <= bgTrunc_i_mul16_1_conv2d1x1_rnd_sel_b(31 downto 0);

    -- redist29_bgTrunc_i_mul16_1_conv2d1x1_sel_x_b_1(DELAY,290)
    redist29_bgTrunc_i_mul16_1_conv2d1x1_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_mul16_1_conv2d1x1_sel_x_b, xout => redist29_bgTrunc_i_mul16_1_conv2d1x1_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_tmp_1_conv2d1x1(ADD,103)@6
    i_tmp_1_conv2d1x1_a <= STD_LOGIC_VECTOR("0" & redist29_bgTrunc_i_mul16_1_conv2d1x1_sel_x_b_1_q);
    i_tmp_1_conv2d1x1_b <= STD_LOGIC_VECTOR("0" & redist15_sync_in_aunroll_x_in_c1_eni3_2_5_outputreg_q);
    i_tmp_1_conv2d1x1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_tmp_1_conv2d1x1_a) + UNSIGNED(i_tmp_1_conv2d1x1_b));
    i_tmp_1_conv2d1x1_q <= i_tmp_1_conv2d1x1_o(32 downto 0);

    -- bgTrunc_i_tmp_1_conv2d1x1_sel_x(BITSELECT,11)@6
    bgTrunc_i_tmp_1_conv2d1x1_sel_x_b <= i_tmp_1_conv2d1x1_q(31 downto 0);

    -- redist25_bgTrunc_i_tmp_1_conv2d1x1_sel_x_b_1(DELAY,286)
    redist25_bgTrunc_i_tmp_1_conv2d1x1_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_tmp_1_conv2d1x1_sel_x_b, xout => redist25_bgTrunc_i_tmp_1_conv2d1x1_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_tmp1_1_conv2d1x1_bs4(BITSELECT,205)@7
    i_tmp1_1_conv2d1x1_bs4_in <= STD_LOGIC_VECTOR(redist25_bgTrunc_i_tmp_1_conv2d1x1_sel_x_b_1_q(17 downto 0));
    i_tmp1_1_conv2d1x1_bs4_b <= STD_LOGIC_VECTOR(i_tmp1_1_conv2d1x1_bs4_in(17 downto 0));

    -- i_tmp1_1_conv2d1x1_bjA5(BITJOIN,206)@7
    i_tmp1_1_conv2d1x1_bjA5_q <= GND_q & i_tmp1_1_conv2d1x1_bs4_b;

    -- i_syncbuf_input_size_x_sync_buffer11_conv2d1x1(BLACKBOX,95)@0
    -- in in_i_dependence@7
    -- in in_valid_in@7
    -- out out_buffer_out@7
    -- out out_valid_out@7
    thei_syncbuf_input_size_x_sync_buffer11_conv2d1x1 : i_syncbuf_input_size_x_sync_buffer11_conv2d1x151
    PORT MAP (
        in_buffer_in => in_input_size_x,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist18_sync_in_aunroll_x_in_i_valid_6_q,
        out_buffer_out => i_syncbuf_input_size_x_sync_buffer11_conv2d1x1_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_tmp1_1_conv2d1x1_bs2_merged_bit_select(BITSELECT,257)@7
    i_tmp1_1_conv2d1x1_bs2_merged_bit_select_b <= i_syncbuf_input_size_x_sync_buffer11_conv2d1x1_out_buffer_out(17 downto 0);
    i_tmp1_1_conv2d1x1_bs2_merged_bit_select_c <= i_syncbuf_input_size_x_sync_buffer11_conv2d1x1_out_buffer_out(31 downto 18);

    -- i_tmp1_1_conv2d1x1_bjB9(BITJOIN,210)@7
    i_tmp1_1_conv2d1x1_bjB9_q <= GND_q & i_tmp1_1_conv2d1x1_bs2_merged_bit_select_b;

    -- i_tmp1_1_conv2d1x1_bs7(BITSELECT,208)@7
    i_tmp1_1_conv2d1x1_bs7_b <= STD_LOGIC_VECTOR(redist25_bgTrunc_i_tmp_1_conv2d1x1_sel_x_b_1_q(31 downto 18));

    -- i_tmp1_1_conv2d1x1_ma3_cma(CHAINMULTADD,253)@7 + 2
    i_tmp1_1_conv2d1x1_ma3_cma_reset <= not (resetn);
    i_tmp1_1_conv2d1x1_ma3_cma_ena0 <= '1';
    i_tmp1_1_conv2d1x1_ma3_cma_ena1 <= i_tmp1_1_conv2d1x1_ma3_cma_ena0;
    i_tmp1_1_conv2d1x1_ma3_cma_l(0) <= SIGNED(RESIZE(i_tmp1_1_conv2d1x1_ma3_cma_a0(0),15));
    i_tmp1_1_conv2d1x1_ma3_cma_l(1) <= SIGNED(RESIZE(i_tmp1_1_conv2d1x1_ma3_cma_a0(1),15));
    i_tmp1_1_conv2d1x1_ma3_cma_p(0) <= i_tmp1_1_conv2d1x1_ma3_cma_l(0) * i_tmp1_1_conv2d1x1_ma3_cma_c0(0);
    i_tmp1_1_conv2d1x1_ma3_cma_p(1) <= i_tmp1_1_conv2d1x1_ma3_cma_l(1) * i_tmp1_1_conv2d1x1_ma3_cma_c0(1);
    i_tmp1_1_conv2d1x1_ma3_cma_u(0) <= RESIZE(i_tmp1_1_conv2d1x1_ma3_cma_p(0),35);
    i_tmp1_1_conv2d1x1_ma3_cma_u(1) <= RESIZE(i_tmp1_1_conv2d1x1_ma3_cma_p(1),35);
    i_tmp1_1_conv2d1x1_ma3_cma_w(0) <= i_tmp1_1_conv2d1x1_ma3_cma_u(0) + i_tmp1_1_conv2d1x1_ma3_cma_u(1);
    i_tmp1_1_conv2d1x1_ma3_cma_x(0) <= i_tmp1_1_conv2d1x1_ma3_cma_w(0);
    i_tmp1_1_conv2d1x1_ma3_cma_y(0) <= i_tmp1_1_conv2d1x1_ma3_cma_x(0);
    i_tmp1_1_conv2d1x1_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_tmp1_1_conv2d1x1_ma3_cma_a0 <= (others => (others => '0'));
            i_tmp1_1_conv2d1x1_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_tmp1_1_conv2d1x1_ma3_cma_ena0 = '1') THEN
                i_tmp1_1_conv2d1x1_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_tmp1_1_conv2d1x1_bs7_b),14);
                i_tmp1_1_conv2d1x1_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_tmp1_1_conv2d1x1_bs2_merged_bit_select_c),14);
                i_tmp1_1_conv2d1x1_ma3_cma_c0(0) <= RESIZE(SIGNED(i_tmp1_1_conv2d1x1_bjB9_q),19);
                i_tmp1_1_conv2d1x1_ma3_cma_c0(1) <= RESIZE(SIGNED(i_tmp1_1_conv2d1x1_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_tmp1_1_conv2d1x1_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_tmp1_1_conv2d1x1_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_tmp1_1_conv2d1x1_ma3_cma_ena1 = '1') THEN
                i_tmp1_1_conv2d1x1_ma3_cma_s(0) <= i_tmp1_1_conv2d1x1_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_tmp1_1_conv2d1x1_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_tmp1_1_conv2d1x1_ma3_cma_s(0)(33 downto 0)), xout => i_tmp1_1_conv2d1x1_ma3_cma_qq, clk => clock, aclr => resetn );
    i_tmp1_1_conv2d1x1_ma3_cma_q <= STD_LOGIC_VECTOR(i_tmp1_1_conv2d1x1_ma3_cma_qq(33 downto 0));

    -- redist1_i_tmp1_1_conv2d1x1_ma3_cma_q_1(DELAY,262)
    redist1_i_tmp1_1_conv2d1x1_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_tmp1_1_conv2d1x1_ma3_cma_q, xout => redist1_i_tmp1_1_conv2d1x1_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_tmp1_1_conv2d1x1_align_14(BITSHIFT,215)@10
    i_tmp1_1_conv2d1x1_align_14_qint <= redist1_i_tmp1_1_conv2d1x1_ma3_cma_q_1_q & "000000000000000000";
    i_tmp1_1_conv2d1x1_align_14_q <= i_tmp1_1_conv2d1x1_align_14_qint(51 downto 0);

    -- i_tmp1_1_conv2d1x1_bs11(BITSELECT,212)@7
    i_tmp1_1_conv2d1x1_bs11_b <= redist25_bgTrunc_i_tmp_1_conv2d1x1_sel_x_b_1_q(31 downto 18);

    -- i_tmp1_1_conv2d1x1_im10_cma(CHAINMULTADD,248)@7 + 2
    i_tmp1_1_conv2d1x1_im10_cma_reset <= not (resetn);
    i_tmp1_1_conv2d1x1_im10_cma_ena0 <= '1';
    i_tmp1_1_conv2d1x1_im10_cma_ena1 <= i_tmp1_1_conv2d1x1_im10_cma_ena0;
    i_tmp1_1_conv2d1x1_im10_cma_p(0) <= i_tmp1_1_conv2d1x1_im10_cma_a0(0) * i_tmp1_1_conv2d1x1_im10_cma_c0(0);
    i_tmp1_1_conv2d1x1_im10_cma_u(0) <= RESIZE(i_tmp1_1_conv2d1x1_im10_cma_p(0),28);
    i_tmp1_1_conv2d1x1_im10_cma_w(0) <= i_tmp1_1_conv2d1x1_im10_cma_u(0);
    i_tmp1_1_conv2d1x1_im10_cma_x(0) <= i_tmp1_1_conv2d1x1_im10_cma_w(0);
    i_tmp1_1_conv2d1x1_im10_cma_y(0) <= i_tmp1_1_conv2d1x1_im10_cma_x(0);
    i_tmp1_1_conv2d1x1_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_tmp1_1_conv2d1x1_im10_cma_a0 <= (others => (others => '0'));
            i_tmp1_1_conv2d1x1_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_tmp1_1_conv2d1x1_im10_cma_ena0 = '1') THEN
                i_tmp1_1_conv2d1x1_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_tmp1_1_conv2d1x1_bs11_b),14);
                i_tmp1_1_conv2d1x1_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_tmp1_1_conv2d1x1_bs2_merged_bit_select_c),14);
            END IF;
        END IF;
    END PROCESS;
    i_tmp1_1_conv2d1x1_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_tmp1_1_conv2d1x1_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_tmp1_1_conv2d1x1_im10_cma_ena1 = '1') THEN
                i_tmp1_1_conv2d1x1_im10_cma_s(0) <= i_tmp1_1_conv2d1x1_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_tmp1_1_conv2d1x1_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_tmp1_1_conv2d1x1_im10_cma_s(0)(27 downto 0)), xout => i_tmp1_1_conv2d1x1_im10_cma_qq, clk => clock, aclr => resetn );
    i_tmp1_1_conv2d1x1_im10_cma_q <= STD_LOGIC_VECTOR(i_tmp1_1_conv2d1x1_im10_cma_qq(27 downto 0));

    -- redist6_i_tmp1_1_conv2d1x1_im10_cma_q_1(DELAY,267)
    redist6_i_tmp1_1_conv2d1x1_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_tmp1_1_conv2d1x1_im10_cma_q, xout => redist6_i_tmp1_1_conv2d1x1_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_tmp1_1_conv2d1x1_bs1(BITSELECT,202)@7
    i_tmp1_1_conv2d1x1_bs1_in <= redist25_bgTrunc_i_tmp_1_conv2d1x1_sel_x_b_1_q(17 downto 0);
    i_tmp1_1_conv2d1x1_bs1_b <= i_tmp1_1_conv2d1x1_bs1_in(17 downto 0);

    -- i_tmp1_1_conv2d1x1_im0_cma(CHAINMULTADD,247)@7 + 2
    i_tmp1_1_conv2d1x1_im0_cma_reset <= not (resetn);
    i_tmp1_1_conv2d1x1_im0_cma_ena0 <= '1';
    i_tmp1_1_conv2d1x1_im0_cma_ena1 <= i_tmp1_1_conv2d1x1_im0_cma_ena0;
    i_tmp1_1_conv2d1x1_im0_cma_p(0) <= i_tmp1_1_conv2d1x1_im0_cma_a0(0) * i_tmp1_1_conv2d1x1_im0_cma_c0(0);
    i_tmp1_1_conv2d1x1_im0_cma_u(0) <= RESIZE(i_tmp1_1_conv2d1x1_im0_cma_p(0),36);
    i_tmp1_1_conv2d1x1_im0_cma_w(0) <= i_tmp1_1_conv2d1x1_im0_cma_u(0);
    i_tmp1_1_conv2d1x1_im0_cma_x(0) <= i_tmp1_1_conv2d1x1_im0_cma_w(0);
    i_tmp1_1_conv2d1x1_im0_cma_y(0) <= i_tmp1_1_conv2d1x1_im0_cma_x(0);
    i_tmp1_1_conv2d1x1_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_tmp1_1_conv2d1x1_im0_cma_a0 <= (others => (others => '0'));
            i_tmp1_1_conv2d1x1_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_tmp1_1_conv2d1x1_im0_cma_ena0 = '1') THEN
                i_tmp1_1_conv2d1x1_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_tmp1_1_conv2d1x1_bs1_b),18);
                i_tmp1_1_conv2d1x1_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_tmp1_1_conv2d1x1_bs2_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_tmp1_1_conv2d1x1_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_tmp1_1_conv2d1x1_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_tmp1_1_conv2d1x1_im0_cma_ena1 = '1') THEN
                i_tmp1_1_conv2d1x1_im0_cma_s(0) <= i_tmp1_1_conv2d1x1_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_tmp1_1_conv2d1x1_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_tmp1_1_conv2d1x1_im0_cma_s(0)(35 downto 0)), xout => i_tmp1_1_conv2d1x1_im0_cma_qq, clk => clock, aclr => resetn );
    i_tmp1_1_conv2d1x1_im0_cma_q <= STD_LOGIC_VECTOR(i_tmp1_1_conv2d1x1_im0_cma_qq(35 downto 0));

    -- redist7_i_tmp1_1_conv2d1x1_im0_cma_q_1(DELAY,268)
    redist7_i_tmp1_1_conv2d1x1_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_tmp1_1_conv2d1x1_im0_cma_q, xout => redist7_i_tmp1_1_conv2d1x1_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_tmp1_1_conv2d1x1_join_13(BITJOIN,214)@10
    i_tmp1_1_conv2d1x1_join_13_q <= redist6_i_tmp1_1_conv2d1x1_im10_cma_q_1_q & redist7_i_tmp1_1_conv2d1x1_im0_cma_q_1_q;

    -- i_tmp1_1_conv2d1x1_result_add_0_0(ADD,217)@10
    i_tmp1_1_conv2d1x1_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_tmp1_1_conv2d1x1_join_13_q));
    i_tmp1_1_conv2d1x1_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_tmp1_1_conv2d1x1_align_14_q(51)) & i_tmp1_1_conv2d1x1_align_14_q));
    i_tmp1_1_conv2d1x1_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_tmp1_1_conv2d1x1_result_add_0_0_a) + SIGNED(i_tmp1_1_conv2d1x1_result_add_0_0_b));
    i_tmp1_1_conv2d1x1_result_add_0_0_q <= i_tmp1_1_conv2d1x1_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_tmp1_1_conv2d1x1_rnd_sel(BITSELECT,161)@10
    bgTrunc_i_tmp1_1_conv2d1x1_rnd_sel_in <= i_tmp1_1_conv2d1x1_result_add_0_0_q(63 downto 0);
    bgTrunc_i_tmp1_1_conv2d1x1_rnd_sel_b <= bgTrunc_i_tmp1_1_conv2d1x1_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_tmp1_1_conv2d1x1_sel_x(BITSELECT,9)@10
    bgTrunc_i_tmp1_1_conv2d1x1_sel_x_b <= bgTrunc_i_tmp1_1_conv2d1x1_rnd_sel_b(31 downto 0);

    -- redist27_bgTrunc_i_tmp1_1_conv2d1x1_sel_x_b_1(DELAY,288)
    redist27_bgTrunc_i_tmp1_1_conv2d1x1_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_tmp1_1_conv2d1x1_sel_x_b, xout => redist27_bgTrunc_i_tmp1_1_conv2d1x1_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_add18_1_conv2d1x1(ADD,64)@11
    i_add18_1_conv2d1x1_a <= STD_LOGIC_VECTOR("0" & redist27_bgTrunc_i_tmp1_1_conv2d1x1_sel_x_b_1_q);
    i_add18_1_conv2d1x1_b <= STD_LOGIC_VECTOR("0" & redist16_sync_in_aunroll_x_in_c1_eni3_3_10_outputreg_q);
    i_add18_1_conv2d1x1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add18_1_conv2d1x1_a) + UNSIGNED(i_add18_1_conv2d1x1_b));
    i_add18_1_conv2d1x1_q <= i_add18_1_conv2d1x1_o(32 downto 0);

    -- bgTrunc_i_add18_1_conv2d1x1_sel_x(BITSELECT,2)@11
    bgTrunc_i_add18_1_conv2d1x1_sel_x_b <= i_add18_1_conv2d1x1_q(31 downto 0);

    -- redist35_bgTrunc_i_add18_1_conv2d1x1_sel_x_b_1(DELAY,296)
    redist35_bgTrunc_i_add18_1_conv2d1x1_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add18_1_conv2d1x1_sel_x_b, xout => redist35_bgTrunc_i_add18_1_conv2d1x1_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_idxprom19_1_conv2d1x1_sel_x(BITSELECT,45)@12
    i_idxprom19_1_conv2d1x1_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist35_bgTrunc_i_add18_1_conv2d1x1_sel_x_b_1_q(31 downto 0)), 64)));

    -- i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_bs1_merged_bit_select(BITSELECT,255)@12
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_bs1_merged_bit_select_b <= i_idxprom19_1_conv2d1x1_sel_x_b(17 downto 0);
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_bs1_merged_bit_select_c <= i_idxprom19_1_conv2d1x1_sel_x_b(63 downto 54);
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_bs1_merged_bit_select_d <= i_idxprom19_1_conv2d1x1_sel_x_b(35 downto 18);
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_bs1_merged_bit_select_e <= i_idxprom19_1_conv2d1x1_sel_x_b(53 downto 36);

    -- i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im3_shift0(BITSHIFT,236)@12
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im3_shift0_qint <= i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im3_shift0_q <= i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_align_15(BITSHIFT,133)@12
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_align_15_q <= i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im6_shift0(BITSHIFT,237)@12
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im6_shift0_qint <= i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im6_shift0_q <= i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_align_14(BITSHIFT,132)@12
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_align_14_q <= i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_join_16(BITJOIN,134)@12
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_join_16_q <= i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_align_15_q & i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_align_14_q;

    -- i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im9_shift0(BITSHIFT,238)@12
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im9_shift0_qint <= i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im9_shift0_q <= i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_align_12(BITSHIFT,130)@12
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_align_12_q <= i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im0_shift0(BITSHIFT,235)@12
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im0_shift0_qint <= i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im0_shift0_q <= i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_join_13(BITJOIN,131)@12
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_join_13_q <= i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_im0_shift0_q);

    -- i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_result_add_0_0(ADD,135)@12
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_join_13_q);
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_join_16_q);
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_result_add_0_0_b));
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_result_add_0_0_q <= i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_extender_x(BITJOIN,28)@12
    i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_extender_x_q <= i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_multconst_x_q & i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx20_1_conv2d1x1_conv2d1x155_trunc_sel_x(BITSELECT,30)@12
    i_arrayidx20_1_conv2d1x1_conv2d1x155_trunc_sel_x_b <= i_arrayidx20_1_conv2d1x1_conv2d1x155_mult_extender_x_q(63 downto 0);

    -- redist23_i_arrayidx20_1_conv2d1x1_conv2d1x155_trunc_sel_x_b_1(DELAY,284)
    redist23_i_arrayidx20_1_conv2d1x1_conv2d1x155_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_arrayidx20_1_conv2d1x1_conv2d1x155_trunc_sel_x_b, xout => redist23_i_arrayidx20_1_conv2d1x1_conv2d1x155_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_input_im_sync_buffer21_conv2d1x1(BLACKBOX,93)@0
    -- in in_i_dependence@13
    -- in in_valid_in@13
    -- out out_buffer_out@13
    -- out out_valid_out@13
    thei_syncbuf_input_im_sync_buffer21_conv2d1x1 : i_syncbuf_input_im_sync_buffer21_conv2d1x153
    PORT MAP (
        in_buffer_in => in_input_im,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_12_q,
        out_buffer_out => i_syncbuf_input_im_sync_buffer21_conv2d1x1_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx20_1_conv2d1x1_conv2d1x155_add_x(ADD,31)@13
    i_arrayidx20_1_conv2d1x1_conv2d1x155_add_x_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_input_im_sync_buffer21_conv2d1x1_out_buffer_out);
    i_arrayidx20_1_conv2d1x1_conv2d1x155_add_x_b <= STD_LOGIC_VECTOR("0" & redist23_i_arrayidx20_1_conv2d1x1_conv2d1x155_trunc_sel_x_b_1_q);
    i_arrayidx20_1_conv2d1x1_conv2d1x155_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx20_1_conv2d1x1_conv2d1x155_add_x_a) + UNSIGNED(i_arrayidx20_1_conv2d1x1_conv2d1x155_add_x_b));
    i_arrayidx20_1_conv2d1x1_conv2d1x155_add_x_q <= i_arrayidx20_1_conv2d1x1_conv2d1x155_add_x_o(64 downto 0);

    -- i_arrayidx20_1_conv2d1x1_conv2d1x155_dupName_0_trunc_sel_x(BITSELECT,25)@13
    i_arrayidx20_1_conv2d1x1_conv2d1x155_dupName_0_trunc_sel_x_b <= i_arrayidx20_1_conv2d1x1_conv2d1x155_add_x_q(63 downto 0);

    -- i_reduction_conv2d1x1_2_conv2d1x1(LOGICAL,86)@13
    i_reduction_conv2d1x1_2_conv2d1x1_q <= i_phi_decision52_xor_or_rm_conv2d1x1_q or i_reduction_conv2d1x1_1_conv2d1x1_q;

    -- i_syncbuf_input_channels_sync_buffer5_conv2d1x1(BLACKBOX,90)@0
    -- in in_i_dependence@2
    -- in in_valid_in@2
    -- out out_buffer_out@2
    -- out out_valid_out@2
    thei_syncbuf_input_channels_sync_buffer5_conv2d1x1 : i_syncbuf_input_channels_sync_buffer5_conv2d1x146
    PORT MAP (
        in_buffer_in => in_input_channels,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist17_sync_in_aunroll_x_in_i_valid_1_q,
        out_buffer_out => i_syncbuf_input_channels_sync_buffer5_conv2d1x1_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_exitcond_1_conv2d1x1(LOGICAL,68)@2 + 1
    i_exitcond_1_conv2d1x1_qi <= "1" WHEN redist33_bgTrunc_i_inc_1_conv2d1x1_sel_x_b_1_q = i_syncbuf_input_channels_sync_buffer5_conv2d1x1_out_buffer_out ELSE "0";
    i_exitcond_1_conv2d1x1_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_exitcond_1_conv2d1x1_qi, xout => i_exitcond_1_conv2d1x1_q, clk => clock, aclr => resetn );

    -- redist13_i_exitcond_1_conv2d1x1_q_11(DELAY,274)
    redist13_i_exitcond_1_conv2d1x1_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 10, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_exitcond_1_conv2d1x1_q, xout => redist13_i_exitcond_1_conv2d1x1_q_11_q, clk => clock, aclr => resetn );

    -- i_syncbuf_input_channels_sync_buffer_conv2d1x1(BLACKBOX,92)@0
    -- in in_i_dependence@12
    -- in in_valid_in@12
    -- out out_buffer_out@12
    -- out out_valid_out@12
    thei_syncbuf_input_channels_sync_buffer_conv2d1x1 : i_syncbuf_input_channels_sync_buffer_conv2d1x134
    PORT MAP (
        in_buffer_in => in_input_channels,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist20_sync_in_aunroll_x_in_i_valid_11_q,
        out_buffer_out => i_syncbuf_input_channels_sync_buffer_conv2d1x1_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_cmp122_neg_rm_conv2d1x1(COMPARE,67)@12 + 1
    i_cmp122_neg_rm_conv2d1x1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_input_channels_sync_buffer_conv2d1x1_out_buffer_out(31)) & i_syncbuf_input_channels_sync_buffer_conv2d1x1_out_buffer_out));
    i_cmp122_neg_rm_conv2d1x1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_1gr_q(31)) & c_i32_1gr_q));
    i_cmp122_neg_rm_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp122_neg_rm_conv2d1x1_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp122_neg_rm_conv2d1x1_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp122_neg_rm_conv2d1x1_a) - SIGNED(i_cmp122_neg_rm_conv2d1x1_b));
        END IF;
    END PROCESS;
    i_cmp122_neg_rm_conv2d1x1_c(0) <= i_cmp122_neg_rm_conv2d1x1_o(33);

    -- i_cmp122_neg_or43_conv2d1x1(LOGICAL,66)@13
    i_cmp122_neg_or43_conv2d1x1_q <= redist12_i_exitcond_conv2d1x1_q_11_q or i_cmp122_neg_rm_conv2d1x1_c;

    -- i_phi_decision52_xor54_or_conv2d1x1(LOGICAL,82)@13
    i_phi_decision52_xor54_or_conv2d1x1_q <= i_cmp122_neg_or43_conv2d1x1_q or i_phi_decision52_xor_rm_conv2d1x1_q;

    -- i_syncbuf_input_channels_sync_buffer4_conv2d1x1(BLACKBOX,89)@0
    -- in in_i_dependence@2
    -- in in_valid_in@2
    -- out out_buffer_out@2
    -- out out_valid_out@2
    thei_syncbuf_input_channels_sync_buffer4_conv2d1x1 : i_syncbuf_input_channels_sync_buffer4_conv2d1x143
    PORT MAP (
        in_buffer_in => in_input_channels,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist17_sync_in_aunroll_x_in_i_valid_1_q,
        out_buffer_out => i_syncbuf_input_channels_sync_buffer4_conv2d1x1_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_exitcond_conv2d1x1(LOGICAL,70)@2 + 1
    i_exitcond_conv2d1x1_qi <= "1" WHEN redist30_bgTrunc_i_inc_conv2d1x1_sel_x_b_1_q = i_syncbuf_input_channels_sync_buffer4_conv2d1x1_out_buffer_out ELSE "0";
    i_exitcond_conv2d1x1_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_exitcond_conv2d1x1_qi, xout => i_exitcond_conv2d1x1_q, clk => clock, aclr => resetn );

    -- redist12_i_exitcond_conv2d1x1_q_11(DELAY,273)
    redist12_i_exitcond_conv2d1x1_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 10, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_exitcond_conv2d1x1_q, xout => redist12_i_exitcond_conv2d1x1_q_11_q, clk => clock, aclr => resetn );

    -- i_phi_decision52_xor_or_rm_conv2d1x1(LOGICAL,83)@13
    i_phi_decision52_xor_or_rm_conv2d1x1_q <= i_cmp122_neg_rm_conv2d1x1_c or i_phi_decision52_xor_rm_conv2d1x1_q;

    -- i_syncbuf_input_size_x_sync_buffer_conv2d1x1(BLACKBOX,97)@0
    -- in in_i_dependence@11
    -- in in_valid_in@11
    -- out out_buffer_out@11
    -- out out_valid_out@11
    thei_syncbuf_input_size_x_sync_buffer_conv2d1x1 : i_syncbuf_input_size_x_sync_buffer_conv2d1x137
    PORT MAP (
        in_buffer_in => in_input_size_x,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist19_sync_in_aunroll_x_in_i_valid_10_q,
        out_buffer_out => i_syncbuf_input_size_x_sync_buffer_conv2d1x1_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_notlhs_conv2d1x1(COMPARE,80)@11 + 1
    i_notlhs_conv2d1x1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_input_size_x_sync_buffer_conv2d1x1_out_buffer_out(31)) & i_syncbuf_input_size_x_sync_buffer_conv2d1x1_out_buffer_out));
    i_notlhs_conv2d1x1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_1gr_q(31)) & c_i32_1gr_q));
    i_notlhs_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_notlhs_conv2d1x1_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_notlhs_conv2d1x1_o <= STD_LOGIC_VECTOR(SIGNED(i_notlhs_conv2d1x1_a) - SIGNED(i_notlhs_conv2d1x1_b));
        END IF;
    END PROCESS;
    i_notlhs_conv2d1x1_c(0) <= i_notlhs_conv2d1x1_o(33);

    -- i_syncbuf_input_size_y_sync_buffer_conv2d1x1(BLACKBOX,100)@0
    -- in in_i_dependence@11
    -- in in_valid_in@11
    -- out out_buffer_out@11
    -- out out_valid_out@11
    thei_syncbuf_input_size_y_sync_buffer_conv2d1x1 : i_syncbuf_input_size_y_sync_buffer_conv2d1x140
    PORT MAP (
        in_buffer_in => in_input_size_y,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist19_sync_in_aunroll_x_in_i_valid_10_q,
        out_buffer_out => i_syncbuf_input_size_y_sync_buffer_conv2d1x1_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_notrhs_conv2d1x1(COMPARE,81)@11 + 1
    i_notrhs_conv2d1x1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_input_size_y_sync_buffer_conv2d1x1_out_buffer_out(31)) & i_syncbuf_input_size_y_sync_buffer_conv2d1x1_out_buffer_out));
    i_notrhs_conv2d1x1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_1gr_q(31)) & c_i32_1gr_q));
    i_notrhs_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_notrhs_conv2d1x1_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_notrhs_conv2d1x1_o <= STD_LOGIC_VECTOR(SIGNED(i_notrhs_conv2d1x1_a) - SIGNED(i_notrhs_conv2d1x1_b));
        END IF;
    END PROCESS;
    i_notrhs_conv2d1x1_c(0) <= i_notrhs_conv2d1x1_o(33);

    -- i_phi_decision52_xor_rm_conv2d1x1(LOGICAL,84)@12 + 1
    i_phi_decision52_xor_rm_conv2d1x1_qi <= i_notrhs_conv2d1x1_c or i_notlhs_conv2d1x1_c;
    i_phi_decision52_xor_rm_conv2d1x1_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_phi_decision52_xor_rm_conv2d1x1_qi, xout => i_phi_decision52_xor_rm_conv2d1x1_q, clk => clock, aclr => resetn );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,48)@13
    out_c1_exi10_0 <= GND_q;
    out_c1_exi10_1 <= i_phi_decision52_xor_rm_conv2d1x1_q;
    out_c1_exi10_2 <= i_phi_decision52_xor_or_rm_conv2d1x1_q;
    out_c1_exi10_3 <= redist12_i_exitcond_conv2d1x1_q_11_q;
    out_c1_exi10_4 <= i_phi_decision52_xor54_or_conv2d1x1_q;
    out_c1_exi10_5 <= redist13_i_exitcond_1_conv2d1x1_q_11_q;
    out_c1_exi10_6 <= i_reduction_conv2d1x1_2_conv2d1x1_q;
    out_c1_exi10_7 <= i_arrayidx20_1_conv2d1x1_conv2d1x155_dupName_0_trunc_sel_x_b;
    out_c1_exi10_8 <= i_arrayidx20_2_conv2d1x1_conv2d1x162_dupName_0_trunc_sel_x_b;
    out_c1_exi10_9 <= redist32_bgTrunc_i_inc_2_conv2d1x1_sel_x_b_2_q;
    out_c1_exi10_10 <= i_reduction_conv2d1x1_6_conv2d1x1_q;
    out_o_valid <= redist21_sync_in_aunroll_x_in_i_valid_12_q;

END normal;
