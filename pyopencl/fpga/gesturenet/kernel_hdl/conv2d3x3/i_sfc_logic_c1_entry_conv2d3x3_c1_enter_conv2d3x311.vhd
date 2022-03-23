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

-- VHDL created from i_sfc_logic_c1_entry_conv2d3x3_c1_enter_conv2d3x311
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

entity i_sfc_logic_c1_entry_conv2d3x3_c1_enter_conv2d3x311 is
    port (
        in_c1_eni1_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni1_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_start_channel : in std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exi1_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi1_1 : out std_logic_vector(63 downto 0);  -- ufix64
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c1_entry_conv2d3x3_c1_enter_conv2d3x311;

architecture normal of i_sfc_logic_c1_entry_conv2d3x3_c1_enter_conv2d3x311 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_syncbuf_output_im_sync_buffer_conv2d3x317 is
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


    component i_syncbuf_output_size_sync_buffer202_conv2d3x313 is
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


    component i_syncbuf_start_channel_sync_buffer_conv2d3x315 is
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
    signal bgTrunc_i_add_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul2_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul3_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_idx_ext4_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_add_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_syncbuf_output_im_sync_buffer_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_output_size_sync_buffer202_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_start_channel_sync_buffer_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal bgTrunc_i_mul2_conv2d3x3_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul2_conv2d3x3_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul3_conv2d3x3_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul3_conv2d3x3_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul2_conv2d3x3_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul2_conv2d3x3_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul2_conv2d3x3_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul2_conv2d3x3_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul2_conv2d3x3_bjA5_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul2_conv2d3x3_bs6_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul2_conv2d3x3_bs7_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul2_conv2d3x3_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul2_conv2d3x3_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul2_conv2d3x3_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul2_conv2d3x3_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul2_conv2d3x3_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul2_conv2d3x3_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul2_conv2d3x3_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul2_conv2d3x3_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_mul3_conv2d3x3_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul3_conv2d3x3_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul3_conv2d3x3_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul3_conv2d3x3_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul3_conv2d3x3_bjA5_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul3_conv2d3x3_bs7_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul3_conv2d3x3_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul3_conv2d3x3_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul3_conv2d3x3_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul3_conv2d3x3_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul3_conv2d3x3_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul3_conv2d3x3_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul3_conv2d3x3_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul3_conv2d3x3_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul3_conv2d3x3_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_mul2_conv2d3x3_im0_cma_reset : std_logic;
    type i_mul2_conv2d3x3_im0_cma_a0type is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal i_mul2_conv2d3x3_im0_cma_a0 : i_mul2_conv2d3x3_im0_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of i_mul2_conv2d3x3_im0_cma_a0 : signal is true;
    signal i_mul2_conv2d3x3_im0_cma_c0 : i_mul2_conv2d3x3_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul2_conv2d3x3_im0_cma_c0 : signal is true;
    type i_mul2_conv2d3x3_im0_cma_ptype is array(NATURAL range <>) of UNSIGNED(35 downto 0);
    signal i_mul2_conv2d3x3_im0_cma_p : i_mul2_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul2_conv2d3x3_im0_cma_u : i_mul2_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul2_conv2d3x3_im0_cma_w : i_mul2_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul2_conv2d3x3_im0_cma_x : i_mul2_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul2_conv2d3x3_im0_cma_y : i_mul2_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul2_conv2d3x3_im0_cma_s : i_mul2_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul2_conv2d3x3_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul2_conv2d3x3_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul2_conv2d3x3_im0_cma_ena0 : std_logic;
    signal i_mul2_conv2d3x3_im0_cma_ena1 : std_logic;
    signal i_mul2_conv2d3x3_im10_cma_reset : std_logic;
    type i_mul2_conv2d3x3_im10_cma_a0type is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal i_mul2_conv2d3x3_im10_cma_a0 : i_mul2_conv2d3x3_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul2_conv2d3x3_im10_cma_a0 : signal is true;
    signal i_mul2_conv2d3x3_im10_cma_c0 : i_mul2_conv2d3x3_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul2_conv2d3x3_im10_cma_c0 : signal is true;
    type i_mul2_conv2d3x3_im10_cma_ptype is array(NATURAL range <>) of UNSIGNED(27 downto 0);
    signal i_mul2_conv2d3x3_im10_cma_p : i_mul2_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul2_conv2d3x3_im10_cma_u : i_mul2_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul2_conv2d3x3_im10_cma_w : i_mul2_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul2_conv2d3x3_im10_cma_x : i_mul2_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul2_conv2d3x3_im10_cma_y : i_mul2_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul2_conv2d3x3_im10_cma_s : i_mul2_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul2_conv2d3x3_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul2_conv2d3x3_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul2_conv2d3x3_im10_cma_ena0 : std_logic;
    signal i_mul2_conv2d3x3_im10_cma_ena1 : std_logic;
    signal i_mul3_conv2d3x3_im0_cma_reset : std_logic;
    signal i_mul3_conv2d3x3_im0_cma_a0 : i_mul2_conv2d3x3_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul3_conv2d3x3_im0_cma_a0 : signal is true;
    signal i_mul3_conv2d3x3_im0_cma_c0 : i_mul2_conv2d3x3_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul3_conv2d3x3_im0_cma_c0 : signal is true;
    signal i_mul3_conv2d3x3_im0_cma_p : i_mul2_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul3_conv2d3x3_im0_cma_u : i_mul2_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul3_conv2d3x3_im0_cma_w : i_mul2_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul3_conv2d3x3_im0_cma_x : i_mul2_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul3_conv2d3x3_im0_cma_y : i_mul2_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul3_conv2d3x3_im0_cma_s : i_mul2_conv2d3x3_im0_cma_ptype(0 to 0);
    signal i_mul3_conv2d3x3_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul3_conv2d3x3_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul3_conv2d3x3_im0_cma_ena0 : std_logic;
    signal i_mul3_conv2d3x3_im0_cma_ena1 : std_logic;
    signal i_mul3_conv2d3x3_im10_cma_reset : std_logic;
    signal i_mul3_conv2d3x3_im10_cma_a0 : i_mul2_conv2d3x3_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul3_conv2d3x3_im10_cma_a0 : signal is true;
    signal i_mul3_conv2d3x3_im10_cma_c0 : i_mul2_conv2d3x3_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul3_conv2d3x3_im10_cma_c0 : signal is true;
    signal i_mul3_conv2d3x3_im10_cma_p : i_mul2_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul3_conv2d3x3_im10_cma_u : i_mul2_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul3_conv2d3x3_im10_cma_w : i_mul2_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul3_conv2d3x3_im10_cma_x : i_mul2_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul3_conv2d3x3_im10_cma_y : i_mul2_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul3_conv2d3x3_im10_cma_s : i_mul2_conv2d3x3_im10_cma_ptype(0 to 0);
    signal i_mul3_conv2d3x3_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul3_conv2d3x3_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul3_conv2d3x3_im10_cma_ena0 : std_logic;
    signal i_mul3_conv2d3x3_im10_cma_ena1 : std_logic;
    signal i_mul2_conv2d3x3_ma3_cma_reset : std_logic;
    signal i_mul2_conv2d3x3_ma3_cma_a0 : i_mul2_conv2d3x3_im10_cma_a0type(0 to 1);
    attribute preserve of i_mul2_conv2d3x3_ma3_cma_a0 : signal is true;
    type i_mul2_conv2d3x3_ma3_cma_c0type is array(NATURAL range <>) of SIGNED(18 downto 0);
    signal i_mul2_conv2d3x3_ma3_cma_c0 : i_mul2_conv2d3x3_ma3_cma_c0type(0 to 1);
    attribute preserve of i_mul2_conv2d3x3_ma3_cma_c0 : signal is true;
    type i_mul2_conv2d3x3_ma3_cma_ltype is array(NATURAL range <>) of SIGNED(14 downto 0);
    signal i_mul2_conv2d3x3_ma3_cma_l : i_mul2_conv2d3x3_ma3_cma_ltype(0 to 1);
    type i_mul2_conv2d3x3_ma3_cma_ptype is array(NATURAL range <>) of SIGNED(33 downto 0);
    signal i_mul2_conv2d3x3_ma3_cma_p : i_mul2_conv2d3x3_ma3_cma_ptype(0 to 1);
    type i_mul2_conv2d3x3_ma3_cma_utype is array(NATURAL range <>) of SIGNED(34 downto 0);
    signal i_mul2_conv2d3x3_ma3_cma_u : i_mul2_conv2d3x3_ma3_cma_utype(0 to 1);
    signal i_mul2_conv2d3x3_ma3_cma_w : i_mul2_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul2_conv2d3x3_ma3_cma_x : i_mul2_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul2_conv2d3x3_ma3_cma_y : i_mul2_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul2_conv2d3x3_ma3_cma_s : i_mul2_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul2_conv2d3x3_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul2_conv2d3x3_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul2_conv2d3x3_ma3_cma_ena0 : std_logic;
    signal i_mul2_conv2d3x3_ma3_cma_ena1 : std_logic;
    signal i_mul3_conv2d3x3_ma3_cma_reset : std_logic;
    signal i_mul3_conv2d3x3_ma3_cma_a0 : i_mul2_conv2d3x3_im10_cma_a0type(0 to 1);
    attribute preserve of i_mul3_conv2d3x3_ma3_cma_a0 : signal is true;
    signal i_mul3_conv2d3x3_ma3_cma_c0 : i_mul2_conv2d3x3_ma3_cma_c0type(0 to 1);
    attribute preserve of i_mul3_conv2d3x3_ma3_cma_c0 : signal is true;
    signal i_mul3_conv2d3x3_ma3_cma_l : i_mul2_conv2d3x3_ma3_cma_ltype(0 to 1);
    signal i_mul3_conv2d3x3_ma3_cma_p : i_mul2_conv2d3x3_ma3_cma_ptype(0 to 1);
    signal i_mul3_conv2d3x3_ma3_cma_u : i_mul2_conv2d3x3_ma3_cma_utype(0 to 1);
    signal i_mul3_conv2d3x3_ma3_cma_w : i_mul2_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul3_conv2d3x3_ma3_cma_x : i_mul2_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul3_conv2d3x3_ma3_cma_y : i_mul2_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul3_conv2d3x3_ma3_cma_s : i_mul2_conv2d3x3_ma3_cma_utype(0 to 0);
    signal i_mul3_conv2d3x3_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul3_conv2d3x3_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul3_conv2d3x3_ma3_cma_ena0 : std_logic;
    signal i_mul3_conv2d3x3_ma3_cma_ena1 : std_logic;
    signal i_mul3_conv2d3x3_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul3_conv2d3x3_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_i_mul3_conv2d3x3_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist1_i_mul2_conv2d3x3_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist2_i_mul3_conv2d3x3_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist3_i_mul3_conv2d3x3_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist4_i_mul2_conv2d3x3_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist5_i_mul2_conv2d3x3_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist6_sync_in_aunroll_x_in_i_valid_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_add_ptr5_conv2d3x3_conv2d3x319_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist8_bgTrunc_i_mul3_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_bgTrunc_i_mul2_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_bgTrunc_i_add_conv2d3x3_sel_x_b_4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_bgTrunc_i_add_conv2d3x3_sel_x_b_4_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_bgTrunc_i_add_conv2d3x3_sel_x_b_4_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist6_sync_in_aunroll_x_in_i_valid_9(DELAY,107)
    redist6_sync_in_aunroll_x_in_i_valid_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 9, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist6_sync_in_aunroll_x_in_i_valid_9_q, clk => clock, aclr => resetn );

    -- i_add_ptr5_conv2d3x3_conv2d3x319_mult_multconst_x(CONSTANT,11)
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- i_syncbuf_output_size_sync_buffer202_conv2d3x3(BLACKBOX,30)@0
    -- in in_i_dependence@1
    -- in in_valid_in@1
    -- out out_buffer_out@1
    -- out out_valid_out@1
    thei_syncbuf_output_size_sync_buffer202_conv2d3x3 : i_syncbuf_output_size_sync_buffer202_conv2d3x313
    PORT MAP (
        in_buffer_in => in_output_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_output_size_sync_buffer202_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_mul2_conv2d3x3_bs4(BITSELECT,59)@1
    i_mul2_conv2d3x3_bs4_in <= STD_LOGIC_VECTOR(i_syncbuf_output_size_sync_buffer202_conv2d3x3_out_buffer_out(17 downto 0));
    i_mul2_conv2d3x3_bs4_b <= STD_LOGIC_VECTOR(i_mul2_conv2d3x3_bs4_in(17 downto 0));

    -- i_mul2_conv2d3x3_bjA5(BITJOIN,60)@1
    i_mul2_conv2d3x3_bjA5_q <= GND_q & i_mul2_conv2d3x3_bs4_b;

    -- i_mul2_conv2d3x3_bs6(BITSELECT,61)@1
    i_mul2_conv2d3x3_bs6_b <= i_syncbuf_output_size_sync_buffer202_conv2d3x3_out_buffer_out(31 downto 18);

    -- i_mul2_conv2d3x3_bs1(BITSELECT,56)@1
    i_mul2_conv2d3x3_bs1_in <= i_syncbuf_output_size_sync_buffer202_conv2d3x3_out_buffer_out(17 downto 0);
    i_mul2_conv2d3x3_bs1_b <= i_mul2_conv2d3x3_bs1_in(17 downto 0);

    -- i_mul2_conv2d3x3_bjB9(BITJOIN,64)@1
    i_mul2_conv2d3x3_bjB9_q <= GND_q & i_mul2_conv2d3x3_bs1_b;

    -- i_mul2_conv2d3x3_bs7(BITSELECT,62)@1
    i_mul2_conv2d3x3_bs7_b <= STD_LOGIC_VECTOR(i_syncbuf_output_size_sync_buffer202_conv2d3x3_out_buffer_out(31 downto 18));

    -- i_mul2_conv2d3x3_ma3_cma(CHAINMULTADD,97)@1 + 2
    i_mul2_conv2d3x3_ma3_cma_reset <= not (resetn);
    i_mul2_conv2d3x3_ma3_cma_ena0 <= '1';
    i_mul2_conv2d3x3_ma3_cma_ena1 <= i_mul2_conv2d3x3_ma3_cma_ena0;
    i_mul2_conv2d3x3_ma3_cma_l(0) <= SIGNED(RESIZE(i_mul2_conv2d3x3_ma3_cma_a0(0),15));
    i_mul2_conv2d3x3_ma3_cma_l(1) <= SIGNED(RESIZE(i_mul2_conv2d3x3_ma3_cma_a0(1),15));
    i_mul2_conv2d3x3_ma3_cma_p(0) <= i_mul2_conv2d3x3_ma3_cma_l(0) * i_mul2_conv2d3x3_ma3_cma_c0(0);
    i_mul2_conv2d3x3_ma3_cma_p(1) <= i_mul2_conv2d3x3_ma3_cma_l(1) * i_mul2_conv2d3x3_ma3_cma_c0(1);
    i_mul2_conv2d3x3_ma3_cma_u(0) <= RESIZE(i_mul2_conv2d3x3_ma3_cma_p(0),35);
    i_mul2_conv2d3x3_ma3_cma_u(1) <= RESIZE(i_mul2_conv2d3x3_ma3_cma_p(1),35);
    i_mul2_conv2d3x3_ma3_cma_w(0) <= i_mul2_conv2d3x3_ma3_cma_u(0) + i_mul2_conv2d3x3_ma3_cma_u(1);
    i_mul2_conv2d3x3_ma3_cma_x(0) <= i_mul2_conv2d3x3_ma3_cma_w(0);
    i_mul2_conv2d3x3_ma3_cma_y(0) <= i_mul2_conv2d3x3_ma3_cma_x(0);
    i_mul2_conv2d3x3_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul2_conv2d3x3_ma3_cma_a0 <= (others => (others => '0'));
            i_mul2_conv2d3x3_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul2_conv2d3x3_ma3_cma_ena0 = '1') THEN
                i_mul2_conv2d3x3_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_mul2_conv2d3x3_bs7_b),14);
                i_mul2_conv2d3x3_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_mul2_conv2d3x3_bs6_b),14);
                i_mul2_conv2d3x3_ma3_cma_c0(0) <= RESIZE(SIGNED(i_mul2_conv2d3x3_bjB9_q),19);
                i_mul2_conv2d3x3_ma3_cma_c0(1) <= RESIZE(SIGNED(i_mul2_conv2d3x3_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_mul2_conv2d3x3_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul2_conv2d3x3_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul2_conv2d3x3_ma3_cma_ena1 = '1') THEN
                i_mul2_conv2d3x3_ma3_cma_s(0) <= i_mul2_conv2d3x3_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul2_conv2d3x3_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul2_conv2d3x3_ma3_cma_s(0)(33 downto 0)), xout => i_mul2_conv2d3x3_ma3_cma_qq, clk => clock, aclr => resetn );
    i_mul2_conv2d3x3_ma3_cma_q <= STD_LOGIC_VECTOR(i_mul2_conv2d3x3_ma3_cma_qq(33 downto 0));

    -- redist1_i_mul2_conv2d3x3_ma3_cma_q_1(DELAY,102)
    redist1_i_mul2_conv2d3x3_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul2_conv2d3x3_ma3_cma_q, xout => redist1_i_mul2_conv2d3x3_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul2_conv2d3x3_align_14(BITSHIFT,69)@4
    i_mul2_conv2d3x3_align_14_qint <= redist1_i_mul2_conv2d3x3_ma3_cma_q_1_q & "000000000000000000";
    i_mul2_conv2d3x3_align_14_q <= i_mul2_conv2d3x3_align_14_qint(51 downto 0);

    -- i_mul2_conv2d3x3_im10_cma(CHAINMULTADD,94)@1 + 2
    i_mul2_conv2d3x3_im10_cma_reset <= not (resetn);
    i_mul2_conv2d3x3_im10_cma_ena0 <= '1';
    i_mul2_conv2d3x3_im10_cma_ena1 <= i_mul2_conv2d3x3_im10_cma_ena0;
    i_mul2_conv2d3x3_im10_cma_p(0) <= i_mul2_conv2d3x3_im10_cma_a0(0) * i_mul2_conv2d3x3_im10_cma_c0(0);
    i_mul2_conv2d3x3_im10_cma_u(0) <= RESIZE(i_mul2_conv2d3x3_im10_cma_p(0),28);
    i_mul2_conv2d3x3_im10_cma_w(0) <= i_mul2_conv2d3x3_im10_cma_u(0);
    i_mul2_conv2d3x3_im10_cma_x(0) <= i_mul2_conv2d3x3_im10_cma_w(0);
    i_mul2_conv2d3x3_im10_cma_y(0) <= i_mul2_conv2d3x3_im10_cma_x(0);
    i_mul2_conv2d3x3_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul2_conv2d3x3_im10_cma_a0 <= (others => (others => '0'));
            i_mul2_conv2d3x3_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul2_conv2d3x3_im10_cma_ena0 = '1') THEN
                i_mul2_conv2d3x3_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_mul2_conv2d3x3_bs6_b),14);
                i_mul2_conv2d3x3_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_mul2_conv2d3x3_bs6_b),14);
            END IF;
        END IF;
    END PROCESS;
    i_mul2_conv2d3x3_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul2_conv2d3x3_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul2_conv2d3x3_im10_cma_ena1 = '1') THEN
                i_mul2_conv2d3x3_im10_cma_s(0) <= i_mul2_conv2d3x3_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul2_conv2d3x3_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul2_conv2d3x3_im10_cma_s(0)(27 downto 0)), xout => i_mul2_conv2d3x3_im10_cma_qq, clk => clock, aclr => resetn );
    i_mul2_conv2d3x3_im10_cma_q <= STD_LOGIC_VECTOR(i_mul2_conv2d3x3_im10_cma_qq(27 downto 0));

    -- redist4_i_mul2_conv2d3x3_im10_cma_q_1(DELAY,105)
    redist4_i_mul2_conv2d3x3_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul2_conv2d3x3_im10_cma_q, xout => redist4_i_mul2_conv2d3x3_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul2_conv2d3x3_im0_cma(CHAINMULTADD,93)@1 + 2
    i_mul2_conv2d3x3_im0_cma_reset <= not (resetn);
    i_mul2_conv2d3x3_im0_cma_ena0 <= '1';
    i_mul2_conv2d3x3_im0_cma_ena1 <= i_mul2_conv2d3x3_im0_cma_ena0;
    i_mul2_conv2d3x3_im0_cma_p(0) <= i_mul2_conv2d3x3_im0_cma_a0(0) * i_mul2_conv2d3x3_im0_cma_c0(0);
    i_mul2_conv2d3x3_im0_cma_u(0) <= RESIZE(i_mul2_conv2d3x3_im0_cma_p(0),36);
    i_mul2_conv2d3x3_im0_cma_w(0) <= i_mul2_conv2d3x3_im0_cma_u(0);
    i_mul2_conv2d3x3_im0_cma_x(0) <= i_mul2_conv2d3x3_im0_cma_w(0);
    i_mul2_conv2d3x3_im0_cma_y(0) <= i_mul2_conv2d3x3_im0_cma_x(0);
    i_mul2_conv2d3x3_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul2_conv2d3x3_im0_cma_a0 <= (others => (others => '0'));
            i_mul2_conv2d3x3_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul2_conv2d3x3_im0_cma_ena0 = '1') THEN
                i_mul2_conv2d3x3_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_mul2_conv2d3x3_bs1_b),18);
                i_mul2_conv2d3x3_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_mul2_conv2d3x3_bs1_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_mul2_conv2d3x3_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul2_conv2d3x3_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul2_conv2d3x3_im0_cma_ena1 = '1') THEN
                i_mul2_conv2d3x3_im0_cma_s(0) <= i_mul2_conv2d3x3_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul2_conv2d3x3_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul2_conv2d3x3_im0_cma_s(0)(35 downto 0)), xout => i_mul2_conv2d3x3_im0_cma_qq, clk => clock, aclr => resetn );
    i_mul2_conv2d3x3_im0_cma_q <= STD_LOGIC_VECTOR(i_mul2_conv2d3x3_im0_cma_qq(35 downto 0));

    -- redist5_i_mul2_conv2d3x3_im0_cma_q_1(DELAY,106)
    redist5_i_mul2_conv2d3x3_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul2_conv2d3x3_im0_cma_q, xout => redist5_i_mul2_conv2d3x3_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul2_conv2d3x3_join_13(BITJOIN,68)@4
    i_mul2_conv2d3x3_join_13_q <= redist4_i_mul2_conv2d3x3_im10_cma_q_1_q & redist5_i_mul2_conv2d3x3_im0_cma_q_1_q;

    -- i_mul2_conv2d3x3_result_add_0_0(ADD,71)@4
    i_mul2_conv2d3x3_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_mul2_conv2d3x3_join_13_q));
    i_mul2_conv2d3x3_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_mul2_conv2d3x3_align_14_q(51)) & i_mul2_conv2d3x3_align_14_q));
    i_mul2_conv2d3x3_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_mul2_conv2d3x3_result_add_0_0_a) + SIGNED(i_mul2_conv2d3x3_result_add_0_0_b));
    i_mul2_conv2d3x3_result_add_0_0_q <= i_mul2_conv2d3x3_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_mul2_conv2d3x3_rnd_sel(BITSELECT,52)@4
    bgTrunc_i_mul2_conv2d3x3_rnd_sel_in <= i_mul2_conv2d3x3_result_add_0_0_q(63 downto 0);
    bgTrunc_i_mul2_conv2d3x3_rnd_sel_b <= bgTrunc_i_mul2_conv2d3x3_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_mul2_conv2d3x3_sel_x(BITSELECT,3)@4
    bgTrunc_i_mul2_conv2d3x3_sel_x_b <= bgTrunc_i_mul2_conv2d3x3_rnd_sel_b(31 downto 0);

    -- redist9_bgTrunc_i_mul2_conv2d3x3_sel_x_b_1(DELAY,110)
    redist9_bgTrunc_i_mul2_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_mul2_conv2d3x3_sel_x_b, xout => redist9_bgTrunc_i_mul2_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_mul3_conv2d3x3_bs4(BITSELECT,76)@5
    i_mul3_conv2d3x3_bs4_in <= STD_LOGIC_VECTOR(redist9_bgTrunc_i_mul2_conv2d3x3_sel_x_b_1_q(17 downto 0));
    i_mul3_conv2d3x3_bs4_b <= STD_LOGIC_VECTOR(i_mul3_conv2d3x3_bs4_in(17 downto 0));

    -- i_mul3_conv2d3x3_bjA5(BITJOIN,77)@5
    i_mul3_conv2d3x3_bjA5_q <= GND_q & i_mul3_conv2d3x3_bs4_b;

    -- i_syncbuf_start_channel_sync_buffer_conv2d3x3(BLACKBOX,31)@0
    -- in in_i_dependence@1
    -- in in_valid_in@1
    -- out out_buffer_out@1
    -- out out_valid_out@1
    thei_syncbuf_start_channel_sync_buffer_conv2d3x3 : i_syncbuf_start_channel_sync_buffer_conv2d3x315
    PORT MAP (
        in_buffer_in => in_start_channel,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_start_channel_sync_buffer_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_add_conv2d3x3(ADD,24)@1
    i_add_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_start_channel_sync_buffer_conv2d3x3_out_buffer_out);
    i_add_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & in_c1_eni1_1);
    i_add_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_conv2d3x3_a) + UNSIGNED(i_add_conv2d3x3_b));
    i_add_conv2d3x3_q <= i_add_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_add_conv2d3x3_sel_x(BITSELECT,2)@1
    bgTrunc_i_add_conv2d3x3_sel_x_b <= i_add_conv2d3x3_q(31 downto 0);

    -- redist10_bgTrunc_i_add_conv2d3x3_sel_x_b_4_inputreg(DELAY,112)
    redist10_bgTrunc_i_add_conv2d3x3_sel_x_b_4_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add_conv2d3x3_sel_x_b, xout => redist10_bgTrunc_i_add_conv2d3x3_sel_x_b_4_inputreg_q, clk => clock, aclr => resetn );

    -- redist10_bgTrunc_i_add_conv2d3x3_sel_x_b_4(DELAY,111)
    redist10_bgTrunc_i_add_conv2d3x3_sel_x_b_4 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist10_bgTrunc_i_add_conv2d3x3_sel_x_b_4_inputreg_q, xout => redist10_bgTrunc_i_add_conv2d3x3_sel_x_b_4_q, clk => clock, aclr => resetn );

    -- redist10_bgTrunc_i_add_conv2d3x3_sel_x_b_4_outputreg(DELAY,113)
    redist10_bgTrunc_i_add_conv2d3x3_sel_x_b_4_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist10_bgTrunc_i_add_conv2d3x3_sel_x_b_4_q, xout => redist10_bgTrunc_i_add_conv2d3x3_sel_x_b_4_outputreg_q, clk => clock, aclr => resetn );

    -- i_mul3_conv2d3x3_bs2_merged_bit_select(BITSELECT,99)@5
    i_mul3_conv2d3x3_bs2_merged_bit_select_b <= redist10_bgTrunc_i_add_conv2d3x3_sel_x_b_4_outputreg_q(17 downto 0);
    i_mul3_conv2d3x3_bs2_merged_bit_select_c <= redist10_bgTrunc_i_add_conv2d3x3_sel_x_b_4_outputreg_q(31 downto 18);

    -- i_mul3_conv2d3x3_bjB9(BITJOIN,81)@5
    i_mul3_conv2d3x3_bjB9_q <= GND_q & i_mul3_conv2d3x3_bs2_merged_bit_select_b;

    -- i_mul3_conv2d3x3_bs7(BITSELECT,79)@5
    i_mul3_conv2d3x3_bs7_b <= STD_LOGIC_VECTOR(redist9_bgTrunc_i_mul2_conv2d3x3_sel_x_b_1_q(31 downto 18));

    -- i_mul3_conv2d3x3_ma3_cma(CHAINMULTADD,98)@5 + 2
    i_mul3_conv2d3x3_ma3_cma_reset <= not (resetn);
    i_mul3_conv2d3x3_ma3_cma_ena0 <= '1';
    i_mul3_conv2d3x3_ma3_cma_ena1 <= i_mul3_conv2d3x3_ma3_cma_ena0;
    i_mul3_conv2d3x3_ma3_cma_l(0) <= SIGNED(RESIZE(i_mul3_conv2d3x3_ma3_cma_a0(0),15));
    i_mul3_conv2d3x3_ma3_cma_l(1) <= SIGNED(RESIZE(i_mul3_conv2d3x3_ma3_cma_a0(1),15));
    i_mul3_conv2d3x3_ma3_cma_p(0) <= i_mul3_conv2d3x3_ma3_cma_l(0) * i_mul3_conv2d3x3_ma3_cma_c0(0);
    i_mul3_conv2d3x3_ma3_cma_p(1) <= i_mul3_conv2d3x3_ma3_cma_l(1) * i_mul3_conv2d3x3_ma3_cma_c0(1);
    i_mul3_conv2d3x3_ma3_cma_u(0) <= RESIZE(i_mul3_conv2d3x3_ma3_cma_p(0),35);
    i_mul3_conv2d3x3_ma3_cma_u(1) <= RESIZE(i_mul3_conv2d3x3_ma3_cma_p(1),35);
    i_mul3_conv2d3x3_ma3_cma_w(0) <= i_mul3_conv2d3x3_ma3_cma_u(0) + i_mul3_conv2d3x3_ma3_cma_u(1);
    i_mul3_conv2d3x3_ma3_cma_x(0) <= i_mul3_conv2d3x3_ma3_cma_w(0);
    i_mul3_conv2d3x3_ma3_cma_y(0) <= i_mul3_conv2d3x3_ma3_cma_x(0);
    i_mul3_conv2d3x3_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul3_conv2d3x3_ma3_cma_a0 <= (others => (others => '0'));
            i_mul3_conv2d3x3_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul3_conv2d3x3_ma3_cma_ena0 = '1') THEN
                i_mul3_conv2d3x3_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_mul3_conv2d3x3_bs7_b),14);
                i_mul3_conv2d3x3_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_mul3_conv2d3x3_bs2_merged_bit_select_c),14);
                i_mul3_conv2d3x3_ma3_cma_c0(0) <= RESIZE(SIGNED(i_mul3_conv2d3x3_bjB9_q),19);
                i_mul3_conv2d3x3_ma3_cma_c0(1) <= RESIZE(SIGNED(i_mul3_conv2d3x3_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_mul3_conv2d3x3_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul3_conv2d3x3_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul3_conv2d3x3_ma3_cma_ena1 = '1') THEN
                i_mul3_conv2d3x3_ma3_cma_s(0) <= i_mul3_conv2d3x3_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul3_conv2d3x3_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul3_conv2d3x3_ma3_cma_s(0)(33 downto 0)), xout => i_mul3_conv2d3x3_ma3_cma_qq, clk => clock, aclr => resetn );
    i_mul3_conv2d3x3_ma3_cma_q <= STD_LOGIC_VECTOR(i_mul3_conv2d3x3_ma3_cma_qq(33 downto 0));

    -- redist0_i_mul3_conv2d3x3_ma3_cma_q_1(DELAY,101)
    redist0_i_mul3_conv2d3x3_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul3_conv2d3x3_ma3_cma_q, xout => redist0_i_mul3_conv2d3x3_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul3_conv2d3x3_align_14(BITSHIFT,86)@8
    i_mul3_conv2d3x3_align_14_qint <= redist0_i_mul3_conv2d3x3_ma3_cma_q_1_q & "000000000000000000";
    i_mul3_conv2d3x3_align_14_q <= i_mul3_conv2d3x3_align_14_qint(51 downto 0);

    -- i_mul3_conv2d3x3_bs11(BITSELECT,83)@5
    i_mul3_conv2d3x3_bs11_b <= redist9_bgTrunc_i_mul2_conv2d3x3_sel_x_b_1_q(31 downto 18);

    -- i_mul3_conv2d3x3_im10_cma(CHAINMULTADD,96)@5 + 2
    i_mul3_conv2d3x3_im10_cma_reset <= not (resetn);
    i_mul3_conv2d3x3_im10_cma_ena0 <= '1';
    i_mul3_conv2d3x3_im10_cma_ena1 <= i_mul3_conv2d3x3_im10_cma_ena0;
    i_mul3_conv2d3x3_im10_cma_p(0) <= i_mul3_conv2d3x3_im10_cma_a0(0) * i_mul3_conv2d3x3_im10_cma_c0(0);
    i_mul3_conv2d3x3_im10_cma_u(0) <= RESIZE(i_mul3_conv2d3x3_im10_cma_p(0),28);
    i_mul3_conv2d3x3_im10_cma_w(0) <= i_mul3_conv2d3x3_im10_cma_u(0);
    i_mul3_conv2d3x3_im10_cma_x(0) <= i_mul3_conv2d3x3_im10_cma_w(0);
    i_mul3_conv2d3x3_im10_cma_y(0) <= i_mul3_conv2d3x3_im10_cma_x(0);
    i_mul3_conv2d3x3_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul3_conv2d3x3_im10_cma_a0 <= (others => (others => '0'));
            i_mul3_conv2d3x3_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul3_conv2d3x3_im10_cma_ena0 = '1') THEN
                i_mul3_conv2d3x3_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_mul3_conv2d3x3_bs11_b),14);
                i_mul3_conv2d3x3_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_mul3_conv2d3x3_bs2_merged_bit_select_c),14);
            END IF;
        END IF;
    END PROCESS;
    i_mul3_conv2d3x3_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul3_conv2d3x3_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul3_conv2d3x3_im10_cma_ena1 = '1') THEN
                i_mul3_conv2d3x3_im10_cma_s(0) <= i_mul3_conv2d3x3_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul3_conv2d3x3_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul3_conv2d3x3_im10_cma_s(0)(27 downto 0)), xout => i_mul3_conv2d3x3_im10_cma_qq, clk => clock, aclr => resetn );
    i_mul3_conv2d3x3_im10_cma_q <= STD_LOGIC_VECTOR(i_mul3_conv2d3x3_im10_cma_qq(27 downto 0));

    -- redist2_i_mul3_conv2d3x3_im10_cma_q_1(DELAY,103)
    redist2_i_mul3_conv2d3x3_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul3_conv2d3x3_im10_cma_q, xout => redist2_i_mul3_conv2d3x3_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul3_conv2d3x3_bs1(BITSELECT,73)@5
    i_mul3_conv2d3x3_bs1_in <= redist9_bgTrunc_i_mul2_conv2d3x3_sel_x_b_1_q(17 downto 0);
    i_mul3_conv2d3x3_bs1_b <= i_mul3_conv2d3x3_bs1_in(17 downto 0);

    -- i_mul3_conv2d3x3_im0_cma(CHAINMULTADD,95)@5 + 2
    i_mul3_conv2d3x3_im0_cma_reset <= not (resetn);
    i_mul3_conv2d3x3_im0_cma_ena0 <= '1';
    i_mul3_conv2d3x3_im0_cma_ena1 <= i_mul3_conv2d3x3_im0_cma_ena0;
    i_mul3_conv2d3x3_im0_cma_p(0) <= i_mul3_conv2d3x3_im0_cma_a0(0) * i_mul3_conv2d3x3_im0_cma_c0(0);
    i_mul3_conv2d3x3_im0_cma_u(0) <= RESIZE(i_mul3_conv2d3x3_im0_cma_p(0),36);
    i_mul3_conv2d3x3_im0_cma_w(0) <= i_mul3_conv2d3x3_im0_cma_u(0);
    i_mul3_conv2d3x3_im0_cma_x(0) <= i_mul3_conv2d3x3_im0_cma_w(0);
    i_mul3_conv2d3x3_im0_cma_y(0) <= i_mul3_conv2d3x3_im0_cma_x(0);
    i_mul3_conv2d3x3_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul3_conv2d3x3_im0_cma_a0 <= (others => (others => '0'));
            i_mul3_conv2d3x3_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul3_conv2d3x3_im0_cma_ena0 = '1') THEN
                i_mul3_conv2d3x3_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_mul3_conv2d3x3_bs1_b),18);
                i_mul3_conv2d3x3_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_mul3_conv2d3x3_bs2_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_mul3_conv2d3x3_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul3_conv2d3x3_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul3_conv2d3x3_im0_cma_ena1 = '1') THEN
                i_mul3_conv2d3x3_im0_cma_s(0) <= i_mul3_conv2d3x3_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul3_conv2d3x3_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul3_conv2d3x3_im0_cma_s(0)(35 downto 0)), xout => i_mul3_conv2d3x3_im0_cma_qq, clk => clock, aclr => resetn );
    i_mul3_conv2d3x3_im0_cma_q <= STD_LOGIC_VECTOR(i_mul3_conv2d3x3_im0_cma_qq(35 downto 0));

    -- redist3_i_mul3_conv2d3x3_im0_cma_q_1(DELAY,104)
    redist3_i_mul3_conv2d3x3_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul3_conv2d3x3_im0_cma_q, xout => redist3_i_mul3_conv2d3x3_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul3_conv2d3x3_join_13(BITJOIN,85)@8
    i_mul3_conv2d3x3_join_13_q <= redist2_i_mul3_conv2d3x3_im10_cma_q_1_q & redist3_i_mul3_conv2d3x3_im0_cma_q_1_q;

    -- i_mul3_conv2d3x3_result_add_0_0(ADD,88)@8
    i_mul3_conv2d3x3_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_mul3_conv2d3x3_join_13_q));
    i_mul3_conv2d3x3_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_mul3_conv2d3x3_align_14_q(51)) & i_mul3_conv2d3x3_align_14_q));
    i_mul3_conv2d3x3_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_mul3_conv2d3x3_result_add_0_0_a) + SIGNED(i_mul3_conv2d3x3_result_add_0_0_b));
    i_mul3_conv2d3x3_result_add_0_0_q <= i_mul3_conv2d3x3_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_mul3_conv2d3x3_rnd_sel(BITSELECT,53)@8
    bgTrunc_i_mul3_conv2d3x3_rnd_sel_in <= i_mul3_conv2d3x3_result_add_0_0_q(63 downto 0);
    bgTrunc_i_mul3_conv2d3x3_rnd_sel_b <= bgTrunc_i_mul3_conv2d3x3_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_mul3_conv2d3x3_sel_x(BITSELECT,4)@8
    bgTrunc_i_mul3_conv2d3x3_sel_x_b <= bgTrunc_i_mul3_conv2d3x3_rnd_sel_b(31 downto 0);

    -- redist8_bgTrunc_i_mul3_conv2d3x3_sel_x_b_1(DELAY,109)
    redist8_bgTrunc_i_mul3_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_mul3_conv2d3x3_sel_x_b, xout => redist8_bgTrunc_i_mul3_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_idx_ext4_conv2d3x3_sel_x(BITSELECT,17)@9
    i_idx_ext4_conv2d3x3_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist8_bgTrunc_i_mul3_conv2d3x3_sel_x_b_1_q(31 downto 0)), 64)));

    -- i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_bs1_merged_bit_select(BITSELECT,100)@9
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_bs1_merged_bit_select_b <= i_idx_ext4_conv2d3x3_sel_x_b(17 downto 0);
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_bs1_merged_bit_select_c <= i_idx_ext4_conv2d3x3_sel_x_b(63 downto 54);
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_bs1_merged_bit_select_d <= i_idx_ext4_conv2d3x3_sel_x_b(35 downto 18);
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_bs1_merged_bit_select_e <= i_idx_ext4_conv2d3x3_sel_x_b(53 downto 36);

    -- i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im3_shift0(BITSHIFT,90)@9
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im3_shift0_qint <= i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_bs1_merged_bit_select_c & "00";
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im3_shift0_q <= i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im3_shift0_qint(11 downto 0);

    -- i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_align_15(BITSHIFT,48)@9
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im3_shift0_q) & "000000000000000";
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_align_15_q <= i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_align_15_qint(27 downto 0);

    -- i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im6_shift0(BITSHIFT,91)@9
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im6_shift0_qint <= i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_bs1_merged_bit_select_d & "00";
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im6_shift0_q <= i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im6_shift0_qint(19 downto 0);

    -- i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_align_14(BITSHIFT,47)@9
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im6_shift0_q) & "000000000000000000";
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_align_14_q <= i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_align_14_qint(38 downto 0);

    -- i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_join_16(BITJOIN,49)@9
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_join_16_q <= i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_align_15_q & i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_align_14_q;

    -- i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im9_shift0(BITSHIFT,92)@9
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im9_shift0_qint <= i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_bs1_merged_bit_select_e & "00";
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im9_shift0_q <= i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im9_shift0_qint(19 downto 0);

    -- i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_align_12(BITSHIFT,45)@9
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im9_shift0_q) & "000000000000000";
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_align_12_q <= i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_align_12_qint(35 downto 0);

    -- i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im0_shift0(BITSHIFT,89)@9
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im0_shift0_qint <= i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_bs1_merged_bit_select_b & "00";
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im0_shift0_q <= i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im0_shift0_qint(19 downto 0);

    -- i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_join_13(BITJOIN,46)@9
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_join_13_q <= i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_im0_shift0_q);

    -- i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_result_add_0_0(ADD,50)@9
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_join_13_q);
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_join_16_q);
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_result_add_0_0_a) + UNSIGNED(i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_result_add_0_0_b));
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_result_add_0_0_q <= i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_result_add_0_0_o(67 downto 0);

    -- i_add_ptr5_conv2d3x3_conv2d3x319_mult_extender_x(BITJOIN,10)@9
    i_add_ptr5_conv2d3x3_conv2d3x319_mult_extender_x_q <= i_add_ptr5_conv2d3x3_conv2d3x319_mult_multconst_x_q & i_add_ptr5_conv2d3x3_conv2d3x319_mult_x_result_add_0_0_q(66 downto 0);

    -- i_add_ptr5_conv2d3x3_conv2d3x319_trunc_sel_x(BITSELECT,12)@9
    i_add_ptr5_conv2d3x3_conv2d3x319_trunc_sel_x_b <= i_add_ptr5_conv2d3x3_conv2d3x319_mult_extender_x_q(63 downto 0);

    -- redist7_i_add_ptr5_conv2d3x3_conv2d3x319_trunc_sel_x_b_1(DELAY,108)
    redist7_i_add_ptr5_conv2d3x3_conv2d3x319_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add_ptr5_conv2d3x3_conv2d3x319_trunc_sel_x_b, xout => redist7_i_add_ptr5_conv2d3x3_conv2d3x319_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_output_im_sync_buffer_conv2d3x3(BLACKBOX,29)@0
    -- in in_i_dependence@10
    -- in in_valid_in@10
    -- out out_buffer_out@10
    -- out out_valid_out@10
    thei_syncbuf_output_im_sync_buffer_conv2d3x3 : i_syncbuf_output_im_sync_buffer_conv2d3x317
    PORT MAP (
        in_buffer_in => in_output_im,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist6_sync_in_aunroll_x_in_i_valid_9_q,
        out_buffer_out => i_syncbuf_output_im_sync_buffer_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_add_ptr5_conv2d3x3_conv2d3x319_add_x(ADD,13)@10
    i_add_ptr5_conv2d3x3_conv2d3x319_add_x_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_output_im_sync_buffer_conv2d3x3_out_buffer_out);
    i_add_ptr5_conv2d3x3_conv2d3x319_add_x_b <= STD_LOGIC_VECTOR("0" & redist7_i_add_ptr5_conv2d3x3_conv2d3x319_trunc_sel_x_b_1_q);
    i_add_ptr5_conv2d3x3_conv2d3x319_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_ptr5_conv2d3x3_conv2d3x319_add_x_a) + UNSIGNED(i_add_ptr5_conv2d3x3_conv2d3x319_add_x_b));
    i_add_ptr5_conv2d3x3_conv2d3x319_add_x_q <= i_add_ptr5_conv2d3x3_conv2d3x319_add_x_o(64 downto 0);

    -- i_add_ptr5_conv2d3x3_conv2d3x319_dupName_0_trunc_sel_x(BITSELECT,7)@10
    i_add_ptr5_conv2d3x3_conv2d3x319_dupName_0_trunc_sel_x_b <= i_add_ptr5_conv2d3x3_conv2d3x319_add_x_q(63 downto 0);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,19)@10
    out_c1_exi1_0 <= GND_q;
    out_c1_exi1_1 <= i_add_ptr5_conv2d3x3_conv2d3x319_dupName_0_trunc_sel_x_b;
    out_o_valid <= redist6_sync_in_aunroll_x_in_i_valid_9_q;

END normal;
