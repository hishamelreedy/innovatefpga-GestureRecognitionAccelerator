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

-- VHDL created from i_sfc_logic_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x122
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

entity i_sfc_logic_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x122 is
    port (
        in_c0_eni3_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni3_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni3_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni3_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size_x : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_size_y : in std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi126_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi126_1 : out std_logic_vector(63 downto 0);  -- ufix64
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x122;

architecture normal of i_sfc_logic_c0_for_body14_conv2d1x1_c0_enter24_conv2d1x122 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_syncbuf_input_im_sync_buffer_conv2d1x128 is
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


    component i_syncbuf_input_size_x_sync_buffer9_conv2d1x126 is
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


    component i_syncbuf_input_size_y_sync_buffer15_conv2d1x124 is
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
    signal bgTrunc_i_add18_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul16_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_tmp1_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_tmp_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_idxprom19_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_add18_conv2d1x1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add18_conv2d1x1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add18_conv2d1x1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add18_conv2d1x1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_syncbuf_input_im_sync_buffer_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_input_size_x_sync_buffer9_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_size_y_sync_buffer15_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_tmp_conv2d1x1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_tmp_conv2d1x1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_tmp_conv2d1x1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_tmp_conv2d1x1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal bgTrunc_i_mul16_conv2d1x1_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul16_conv2d1x1_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_tmp1_conv2d1x1_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_tmp1_conv2d1x1_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul16_conv2d1x1_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul16_conv2d1x1_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul16_conv2d1x1_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul16_conv2d1x1_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul16_conv2d1x1_bjA5_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul16_conv2d1x1_bs7_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul16_conv2d1x1_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul16_conv2d1x1_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul16_conv2d1x1_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul16_conv2d1x1_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul16_conv2d1x1_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul16_conv2d1x1_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul16_conv2d1x1_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul16_conv2d1x1_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul16_conv2d1x1_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_tmp1_conv2d1x1_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_tmp1_conv2d1x1_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_tmp1_conv2d1x1_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_tmp1_conv2d1x1_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_tmp1_conv2d1x1_bjA5_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_tmp1_conv2d1x1_bs7_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_tmp1_conv2d1x1_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_tmp1_conv2d1x1_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_tmp1_conv2d1x1_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_tmp1_conv2d1x1_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_tmp1_conv2d1x1_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_tmp1_conv2d1x1_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_tmp1_conv2d1x1_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_tmp1_conv2d1x1_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_tmp1_conv2d1x1_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_mul16_conv2d1x1_im0_cma_reset : std_logic;
    type i_mul16_conv2d1x1_im0_cma_a0type is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal i_mul16_conv2d1x1_im0_cma_a0 : i_mul16_conv2d1x1_im0_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of i_mul16_conv2d1x1_im0_cma_a0 : signal is true;
    signal i_mul16_conv2d1x1_im0_cma_c0 : i_mul16_conv2d1x1_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul16_conv2d1x1_im0_cma_c0 : signal is true;
    type i_mul16_conv2d1x1_im0_cma_ptype is array(NATURAL range <>) of UNSIGNED(35 downto 0);
    signal i_mul16_conv2d1x1_im0_cma_p : i_mul16_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul16_conv2d1x1_im0_cma_u : i_mul16_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul16_conv2d1x1_im0_cma_w : i_mul16_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul16_conv2d1x1_im0_cma_x : i_mul16_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul16_conv2d1x1_im0_cma_y : i_mul16_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul16_conv2d1x1_im0_cma_s : i_mul16_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_mul16_conv2d1x1_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul16_conv2d1x1_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul16_conv2d1x1_im0_cma_ena0 : std_logic;
    signal i_mul16_conv2d1x1_im0_cma_ena1 : std_logic;
    signal i_mul16_conv2d1x1_im10_cma_reset : std_logic;
    type i_mul16_conv2d1x1_im10_cma_a0type is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal i_mul16_conv2d1x1_im10_cma_a0 : i_mul16_conv2d1x1_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul16_conv2d1x1_im10_cma_a0 : signal is true;
    signal i_mul16_conv2d1x1_im10_cma_c0 : i_mul16_conv2d1x1_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul16_conv2d1x1_im10_cma_c0 : signal is true;
    type i_mul16_conv2d1x1_im10_cma_ptype is array(NATURAL range <>) of UNSIGNED(27 downto 0);
    signal i_mul16_conv2d1x1_im10_cma_p : i_mul16_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul16_conv2d1x1_im10_cma_u : i_mul16_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul16_conv2d1x1_im10_cma_w : i_mul16_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul16_conv2d1x1_im10_cma_x : i_mul16_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul16_conv2d1x1_im10_cma_y : i_mul16_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul16_conv2d1x1_im10_cma_s : i_mul16_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_mul16_conv2d1x1_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul16_conv2d1x1_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul16_conv2d1x1_im10_cma_ena0 : std_logic;
    signal i_mul16_conv2d1x1_im10_cma_ena1 : std_logic;
    signal i_tmp1_conv2d1x1_im0_cma_reset : std_logic;
    signal i_tmp1_conv2d1x1_im0_cma_a0 : i_mul16_conv2d1x1_im0_cma_a0type(0 to 0);
    attribute preserve of i_tmp1_conv2d1x1_im0_cma_a0 : signal is true;
    signal i_tmp1_conv2d1x1_im0_cma_c0 : i_mul16_conv2d1x1_im0_cma_a0type(0 to 0);
    attribute preserve of i_tmp1_conv2d1x1_im0_cma_c0 : signal is true;
    signal i_tmp1_conv2d1x1_im0_cma_p : i_mul16_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_tmp1_conv2d1x1_im0_cma_u : i_mul16_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_tmp1_conv2d1x1_im0_cma_w : i_mul16_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_tmp1_conv2d1x1_im0_cma_x : i_mul16_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_tmp1_conv2d1x1_im0_cma_y : i_mul16_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_tmp1_conv2d1x1_im0_cma_s : i_mul16_conv2d1x1_im0_cma_ptype(0 to 0);
    signal i_tmp1_conv2d1x1_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_tmp1_conv2d1x1_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_tmp1_conv2d1x1_im0_cma_ena0 : std_logic;
    signal i_tmp1_conv2d1x1_im0_cma_ena1 : std_logic;
    signal i_tmp1_conv2d1x1_im10_cma_reset : std_logic;
    signal i_tmp1_conv2d1x1_im10_cma_a0 : i_mul16_conv2d1x1_im10_cma_a0type(0 to 0);
    attribute preserve of i_tmp1_conv2d1x1_im10_cma_a0 : signal is true;
    signal i_tmp1_conv2d1x1_im10_cma_c0 : i_mul16_conv2d1x1_im10_cma_a0type(0 to 0);
    attribute preserve of i_tmp1_conv2d1x1_im10_cma_c0 : signal is true;
    signal i_tmp1_conv2d1x1_im10_cma_p : i_mul16_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_tmp1_conv2d1x1_im10_cma_u : i_mul16_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_tmp1_conv2d1x1_im10_cma_w : i_mul16_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_tmp1_conv2d1x1_im10_cma_x : i_mul16_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_tmp1_conv2d1x1_im10_cma_y : i_mul16_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_tmp1_conv2d1x1_im10_cma_s : i_mul16_conv2d1x1_im10_cma_ptype(0 to 0);
    signal i_tmp1_conv2d1x1_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_tmp1_conv2d1x1_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_tmp1_conv2d1x1_im10_cma_ena0 : std_logic;
    signal i_tmp1_conv2d1x1_im10_cma_ena1 : std_logic;
    signal i_mul16_conv2d1x1_ma3_cma_reset : std_logic;
    signal i_mul16_conv2d1x1_ma3_cma_a0 : i_mul16_conv2d1x1_im10_cma_a0type(0 to 1);
    attribute preserve of i_mul16_conv2d1x1_ma3_cma_a0 : signal is true;
    type i_mul16_conv2d1x1_ma3_cma_c0type is array(NATURAL range <>) of SIGNED(18 downto 0);
    signal i_mul16_conv2d1x1_ma3_cma_c0 : i_mul16_conv2d1x1_ma3_cma_c0type(0 to 1);
    attribute preserve of i_mul16_conv2d1x1_ma3_cma_c0 : signal is true;
    type i_mul16_conv2d1x1_ma3_cma_ltype is array(NATURAL range <>) of SIGNED(14 downto 0);
    signal i_mul16_conv2d1x1_ma3_cma_l : i_mul16_conv2d1x1_ma3_cma_ltype(0 to 1);
    type i_mul16_conv2d1x1_ma3_cma_ptype is array(NATURAL range <>) of SIGNED(33 downto 0);
    signal i_mul16_conv2d1x1_ma3_cma_p : i_mul16_conv2d1x1_ma3_cma_ptype(0 to 1);
    type i_mul16_conv2d1x1_ma3_cma_utype is array(NATURAL range <>) of SIGNED(34 downto 0);
    signal i_mul16_conv2d1x1_ma3_cma_u : i_mul16_conv2d1x1_ma3_cma_utype(0 to 1);
    signal i_mul16_conv2d1x1_ma3_cma_w : i_mul16_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul16_conv2d1x1_ma3_cma_x : i_mul16_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul16_conv2d1x1_ma3_cma_y : i_mul16_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul16_conv2d1x1_ma3_cma_s : i_mul16_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_mul16_conv2d1x1_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul16_conv2d1x1_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul16_conv2d1x1_ma3_cma_ena0 : std_logic;
    signal i_mul16_conv2d1x1_ma3_cma_ena1 : std_logic;
    signal i_tmp1_conv2d1x1_ma3_cma_reset : std_logic;
    signal i_tmp1_conv2d1x1_ma3_cma_a0 : i_mul16_conv2d1x1_im10_cma_a0type(0 to 1);
    attribute preserve of i_tmp1_conv2d1x1_ma3_cma_a0 : signal is true;
    signal i_tmp1_conv2d1x1_ma3_cma_c0 : i_mul16_conv2d1x1_ma3_cma_c0type(0 to 1);
    attribute preserve of i_tmp1_conv2d1x1_ma3_cma_c0 : signal is true;
    signal i_tmp1_conv2d1x1_ma3_cma_l : i_mul16_conv2d1x1_ma3_cma_ltype(0 to 1);
    signal i_tmp1_conv2d1x1_ma3_cma_p : i_mul16_conv2d1x1_ma3_cma_ptype(0 to 1);
    signal i_tmp1_conv2d1x1_ma3_cma_u : i_mul16_conv2d1x1_ma3_cma_utype(0 to 1);
    signal i_tmp1_conv2d1x1_ma3_cma_w : i_mul16_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_tmp1_conv2d1x1_ma3_cma_x : i_mul16_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_tmp1_conv2d1x1_ma3_cma_y : i_mul16_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_tmp1_conv2d1x1_ma3_cma_s : i_mul16_conv2d1x1_ma3_cma_utype(0 to 0);
    signal i_tmp1_conv2d1x1_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_tmp1_conv2d1x1_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_tmp1_conv2d1x1_ma3_cma_ena0 : std_logic;
    signal i_tmp1_conv2d1x1_ma3_cma_ena1 : std_logic;
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal i_tmp1_conv2d1x1_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_tmp1_conv2d1x1_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul16_conv2d1x1_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul16_conv2d1x1_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal redist0_i_tmp1_conv2d1x1_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist1_i_mul16_conv2d1x1_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist2_i_tmp1_conv2d1x1_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist3_i_tmp1_conv2d1x1_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist4_i_mul16_conv2d1x1_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist5_i_mul16_conv2d1x1_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist8_sync_in_aunroll_x_in_i_valid_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_sync_in_aunroll_x_in_i_valid_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_arrayidx20_conv2d1x1_conv2d1x130_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist11_bgTrunc_i_tmp_conv2d1x1_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_bgTrunc_i_tmp1_conv2d1x1_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_bgTrunc_i_mul16_conv2d1x1_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_bgTrunc_i_add18_conv2d1x1_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_sync_in_aunroll_x_in_c0_eni3_2_4_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_sync_in_aunroll_x_in_c0_eni3_2_4_mem_reset0 : std_logic;
    signal redist6_sync_in_aunroll_x_in_c0_eni3_2_4_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_sync_in_aunroll_x_in_c0_eni3_2_4_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_sync_in_aunroll_x_in_c0_eni3_2_4_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_sync_in_aunroll_x_in_c0_eni3_2_4_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_sync_in_aunroll_x_in_c0_eni3_2_4_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_sync_in_aunroll_x_in_c0_eni3_2_4_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_sync_in_aunroll_x_in_c0_eni3_2_4_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of redist6_sync_in_aunroll_x_in_c0_eni3_2_4_rdcnt_i : signal is true;
    signal redist6_sync_in_aunroll_x_in_c0_eni3_2_4_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_sync_in_aunroll_x_in_c0_eni3_2_4_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_sync_in_aunroll_x_in_c0_eni3_2_4_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_sync_in_aunroll_x_in_c0_eni3_2_4_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_sync_in_aunroll_x_in_c0_eni3_2_4_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist6_sync_in_aunroll_x_in_c0_eni3_2_4_sticky_ena_q : signal is true;
    signal redist6_sync_in_aunroll_x_in_c0_eni3_2_4_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_sync_in_aunroll_x_in_c0_eni3_3_9_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_sync_in_aunroll_x_in_c0_eni3_3_9_mem_reset0 : std_logic;
    signal redist7_sync_in_aunroll_x_in_c0_eni3_3_9_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_sync_in_aunroll_x_in_c0_eni3_3_9_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist7_sync_in_aunroll_x_in_c0_eni3_3_9_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist7_sync_in_aunroll_x_in_c0_eni3_3_9_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_sync_in_aunroll_x_in_c0_eni3_3_9_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_sync_in_aunroll_x_in_c0_eni3_3_9_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist7_sync_in_aunroll_x_in_c0_eni3_3_9_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist7_sync_in_aunroll_x_in_c0_eni3_3_9_rdcnt_i : signal is true;
    signal redist7_sync_in_aunroll_x_in_c0_eni3_3_9_rdcnt_eq : std_logic;
    attribute preserve of redist7_sync_in_aunroll_x_in_c0_eni3_3_9_rdcnt_eq : signal is true;
    signal redist7_sync_in_aunroll_x_in_c0_eni3_3_9_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist7_sync_in_aunroll_x_in_c0_eni3_3_9_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist7_sync_in_aunroll_x_in_c0_eni3_3_9_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist7_sync_in_aunroll_x_in_c0_eni3_3_9_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_sync_in_aunroll_x_in_c0_eni3_3_9_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_sync_in_aunroll_x_in_c0_eni3_3_9_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_sync_in_aunroll_x_in_c0_eni3_3_9_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_sync_in_aunroll_x_in_c0_eni3_3_9_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist7_sync_in_aunroll_x_in_c0_eni3_3_9_sticky_ena_q : signal is true;
    signal redist7_sync_in_aunroll_x_in_c0_eni3_3_9_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist8_sync_in_aunroll_x_in_i_valid_5(DELAY,114)
    redist8_sync_in_aunroll_x_in_i_valid_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist8_sync_in_aunroll_x_in_i_valid_5_q, clk => clock, aclr => resetn );

    -- redist9_sync_in_aunroll_x_in_i_valid_11(DELAY,115)
    redist9_sync_in_aunroll_x_in_i_valid_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist8_sync_in_aunroll_x_in_i_valid_5_q, xout => redist9_sync_in_aunroll_x_in_i_valid_11_q, clk => clock, aclr => resetn );

    -- i_arrayidx20_conv2d1x1_conv2d1x130_mult_multconst_x(CONSTANT,12)
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- redist7_sync_in_aunroll_x_in_c0_eni3_3_9_notEnable(LOGICAL,137)
    redist7_sync_in_aunroll_x_in_c0_eni3_3_9_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist7_sync_in_aunroll_x_in_c0_eni3_3_9_nor(LOGICAL,138)
    redist7_sync_in_aunroll_x_in_c0_eni3_3_9_nor_q <= not (redist7_sync_in_aunroll_x_in_c0_eni3_3_9_notEnable_q or redist7_sync_in_aunroll_x_in_c0_eni3_3_9_sticky_ena_q);

    -- redist7_sync_in_aunroll_x_in_c0_eni3_3_9_mem_last(CONSTANT,134)
    redist7_sync_in_aunroll_x_in_c0_eni3_3_9_mem_last_q <= "0101";

    -- redist7_sync_in_aunroll_x_in_c0_eni3_3_9_cmp(LOGICAL,135)
    redist7_sync_in_aunroll_x_in_c0_eni3_3_9_cmp_b <= STD_LOGIC_VECTOR("0" & redist7_sync_in_aunroll_x_in_c0_eni3_3_9_rdcnt_q);
    redist7_sync_in_aunroll_x_in_c0_eni3_3_9_cmp_q <= "1" WHEN redist7_sync_in_aunroll_x_in_c0_eni3_3_9_mem_last_q = redist7_sync_in_aunroll_x_in_c0_eni3_3_9_cmp_b ELSE "0";

    -- redist7_sync_in_aunroll_x_in_c0_eni3_3_9_cmpReg(REG,136)
    redist7_sync_in_aunroll_x_in_c0_eni3_3_9_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_sync_in_aunroll_x_in_c0_eni3_3_9_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist7_sync_in_aunroll_x_in_c0_eni3_3_9_cmpReg_q <= STD_LOGIC_VECTOR(redist7_sync_in_aunroll_x_in_c0_eni3_3_9_cmp_q);
        END IF;
    END PROCESS;

    -- redist7_sync_in_aunroll_x_in_c0_eni3_3_9_sticky_ena(REG,139)
    redist7_sync_in_aunroll_x_in_c0_eni3_3_9_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_sync_in_aunroll_x_in_c0_eni3_3_9_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist7_sync_in_aunroll_x_in_c0_eni3_3_9_nor_q = "1") THEN
                redist7_sync_in_aunroll_x_in_c0_eni3_3_9_sticky_ena_q <= STD_LOGIC_VECTOR(redist7_sync_in_aunroll_x_in_c0_eni3_3_9_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_sync_in_aunroll_x_in_c0_eni3_3_9_enaAnd(LOGICAL,140)
    redist7_sync_in_aunroll_x_in_c0_eni3_3_9_enaAnd_q <= redist7_sync_in_aunroll_x_in_c0_eni3_3_9_sticky_ena_q and VCC_q;

    -- redist7_sync_in_aunroll_x_in_c0_eni3_3_9_rdcnt(COUNTER,132)
    -- low=0, high=6, step=1, init=0
    redist7_sync_in_aunroll_x_in_c0_eni3_3_9_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_sync_in_aunroll_x_in_c0_eni3_3_9_rdcnt_i <= TO_UNSIGNED(0, 3);
            redist7_sync_in_aunroll_x_in_c0_eni3_3_9_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist7_sync_in_aunroll_x_in_c0_eni3_3_9_rdcnt_i = TO_UNSIGNED(5, 3)) THEN
                redist7_sync_in_aunroll_x_in_c0_eni3_3_9_rdcnt_eq <= '1';
            ELSE
                redist7_sync_in_aunroll_x_in_c0_eni3_3_9_rdcnt_eq <= '0';
            END IF;
            IF (redist7_sync_in_aunroll_x_in_c0_eni3_3_9_rdcnt_eq = '1') THEN
                redist7_sync_in_aunroll_x_in_c0_eni3_3_9_rdcnt_i <= redist7_sync_in_aunroll_x_in_c0_eni3_3_9_rdcnt_i + 2;
            ELSE
                redist7_sync_in_aunroll_x_in_c0_eni3_3_9_rdcnt_i <= redist7_sync_in_aunroll_x_in_c0_eni3_3_9_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist7_sync_in_aunroll_x_in_c0_eni3_3_9_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist7_sync_in_aunroll_x_in_c0_eni3_3_9_rdcnt_i, 3)));

    -- redist7_sync_in_aunroll_x_in_c0_eni3_3_9_wraddr(REG,133)
    redist7_sync_in_aunroll_x_in_c0_eni3_3_9_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_sync_in_aunroll_x_in_c0_eni3_3_9_wraddr_q <= "110";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist7_sync_in_aunroll_x_in_c0_eni3_3_9_wraddr_q <= STD_LOGIC_VECTOR(redist7_sync_in_aunroll_x_in_c0_eni3_3_9_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist7_sync_in_aunroll_x_in_c0_eni3_3_9_mem(DUALMEM,131)
    redist7_sync_in_aunroll_x_in_c0_eni3_3_9_mem_ia <= STD_LOGIC_VECTOR(in_c0_eni3_3);
    redist7_sync_in_aunroll_x_in_c0_eni3_3_9_mem_aa <= redist7_sync_in_aunroll_x_in_c0_eni3_3_9_wraddr_q;
    redist7_sync_in_aunroll_x_in_c0_eni3_3_9_mem_ab <= redist7_sync_in_aunroll_x_in_c0_eni3_3_9_rdcnt_q;
    redist7_sync_in_aunroll_x_in_c0_eni3_3_9_mem_reset0 <= not (resetn);
    redist7_sync_in_aunroll_x_in_c0_eni3_3_9_mem_dmem : altera_syncram
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
        clocken1 => redist7_sync_in_aunroll_x_in_c0_eni3_3_9_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist7_sync_in_aunroll_x_in_c0_eni3_3_9_mem_reset0,
        clock1 => clock,
        address_a => redist7_sync_in_aunroll_x_in_c0_eni3_3_9_mem_aa,
        data_a => redist7_sync_in_aunroll_x_in_c0_eni3_3_9_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist7_sync_in_aunroll_x_in_c0_eni3_3_9_mem_ab,
        q_b => redist7_sync_in_aunroll_x_in_c0_eni3_3_9_mem_iq
    );
    redist7_sync_in_aunroll_x_in_c0_eni3_3_9_mem_q <= redist7_sync_in_aunroll_x_in_c0_eni3_3_9_mem_iq(31 downto 0);

    -- redist7_sync_in_aunroll_x_in_c0_eni3_3_9_outputreg(DELAY,130)
    redist7_sync_in_aunroll_x_in_c0_eni3_3_9_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist7_sync_in_aunroll_x_in_c0_eni3_3_9_mem_q, xout => redist7_sync_in_aunroll_x_in_c0_eni3_3_9_outputreg_q, clk => clock, aclr => resetn );

    -- redist6_sync_in_aunroll_x_in_c0_eni3_2_4_notEnable(LOGICAL,126)
    redist6_sync_in_aunroll_x_in_c0_eni3_2_4_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist6_sync_in_aunroll_x_in_c0_eni3_2_4_nor(LOGICAL,127)
    redist6_sync_in_aunroll_x_in_c0_eni3_2_4_nor_q <= not (redist6_sync_in_aunroll_x_in_c0_eni3_2_4_notEnable_q or redist6_sync_in_aunroll_x_in_c0_eni3_2_4_sticky_ena_q);

    -- redist6_sync_in_aunroll_x_in_c0_eni3_2_4_cmpReg(REG,125)
    redist6_sync_in_aunroll_x_in_c0_eni3_2_4_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_sync_in_aunroll_x_in_c0_eni3_2_4_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist6_sync_in_aunroll_x_in_c0_eni3_2_4_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist6_sync_in_aunroll_x_in_c0_eni3_2_4_sticky_ena(REG,128)
    redist6_sync_in_aunroll_x_in_c0_eni3_2_4_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_sync_in_aunroll_x_in_c0_eni3_2_4_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist6_sync_in_aunroll_x_in_c0_eni3_2_4_nor_q = "1") THEN
                redist6_sync_in_aunroll_x_in_c0_eni3_2_4_sticky_ena_q <= STD_LOGIC_VECTOR(redist6_sync_in_aunroll_x_in_c0_eni3_2_4_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_sync_in_aunroll_x_in_c0_eni3_2_4_enaAnd(LOGICAL,129)
    redist6_sync_in_aunroll_x_in_c0_eni3_2_4_enaAnd_q <= redist6_sync_in_aunroll_x_in_c0_eni3_2_4_sticky_ena_q and VCC_q;

    -- redist6_sync_in_aunroll_x_in_c0_eni3_2_4_rdcnt(COUNTER,123)
    -- low=0, high=1, step=1, init=0
    redist6_sync_in_aunroll_x_in_c0_eni3_2_4_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_sync_in_aunroll_x_in_c0_eni3_2_4_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist6_sync_in_aunroll_x_in_c0_eni3_2_4_rdcnt_i <= redist6_sync_in_aunroll_x_in_c0_eni3_2_4_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist6_sync_in_aunroll_x_in_c0_eni3_2_4_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist6_sync_in_aunroll_x_in_c0_eni3_2_4_rdcnt_i, 1)));

    -- redist6_sync_in_aunroll_x_in_c0_eni3_2_4_wraddr(REG,124)
    redist6_sync_in_aunroll_x_in_c0_eni3_2_4_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_sync_in_aunroll_x_in_c0_eni3_2_4_wraddr_q <= "1";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist6_sync_in_aunroll_x_in_c0_eni3_2_4_wraddr_q <= STD_LOGIC_VECTOR(redist6_sync_in_aunroll_x_in_c0_eni3_2_4_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist6_sync_in_aunroll_x_in_c0_eni3_2_4_mem(DUALMEM,122)
    redist6_sync_in_aunroll_x_in_c0_eni3_2_4_mem_ia <= STD_LOGIC_VECTOR(in_c0_eni3_2);
    redist6_sync_in_aunroll_x_in_c0_eni3_2_4_mem_aa <= redist6_sync_in_aunroll_x_in_c0_eni3_2_4_wraddr_q;
    redist6_sync_in_aunroll_x_in_c0_eni3_2_4_mem_ab <= redist6_sync_in_aunroll_x_in_c0_eni3_2_4_rdcnt_q;
    redist6_sync_in_aunroll_x_in_c0_eni3_2_4_mem_reset0 <= not (resetn);
    redist6_sync_in_aunroll_x_in_c0_eni3_2_4_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 32,
        widthad_b => 1,
        numwords_b => 2,
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
        clocken1 => redist6_sync_in_aunroll_x_in_c0_eni3_2_4_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist6_sync_in_aunroll_x_in_c0_eni3_2_4_mem_reset0,
        clock1 => clock,
        address_a => redist6_sync_in_aunroll_x_in_c0_eni3_2_4_mem_aa,
        data_a => redist6_sync_in_aunroll_x_in_c0_eni3_2_4_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist6_sync_in_aunroll_x_in_c0_eni3_2_4_mem_ab,
        q_b => redist6_sync_in_aunroll_x_in_c0_eni3_2_4_mem_iq
    );
    redist6_sync_in_aunroll_x_in_c0_eni3_2_4_mem_q <= redist6_sync_in_aunroll_x_in_c0_eni3_2_4_mem_iq(31 downto 0);

    -- redist6_sync_in_aunroll_x_in_c0_eni3_2_4_outputreg(DELAY,121)
    redist6_sync_in_aunroll_x_in_c0_eni3_2_4_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist6_sync_in_aunroll_x_in_c0_eni3_2_4_mem_q, xout => redist6_sync_in_aunroll_x_in_c0_eni3_2_4_outputreg_q, clk => clock, aclr => resetn );

    -- i_mul16_conv2d1x1_bs4(BITSELECT,63)@6
    i_mul16_conv2d1x1_bs4_in <= STD_LOGIC_VECTOR(in_c0_eni3_1(17 downto 0));
    i_mul16_conv2d1x1_bs4_b <= STD_LOGIC_VECTOR(i_mul16_conv2d1x1_bs4_in(17 downto 0));

    -- i_mul16_conv2d1x1_bjA5(BITJOIN,64)@6
    i_mul16_conv2d1x1_bjA5_q <= GND_q & i_mul16_conv2d1x1_bs4_b;

    -- i_syncbuf_input_size_y_sync_buffer15_conv2d1x1(BLACKBOX,32)@0
    -- in in_i_dependence@6
    -- in in_valid_in@6
    -- out out_buffer_out@6
    -- out out_valid_out@6
    thei_syncbuf_input_size_y_sync_buffer15_conv2d1x1 : i_syncbuf_input_size_y_sync_buffer15_conv2d1x124
    PORT MAP (
        in_buffer_in => in_input_size_y,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_input_size_y_sync_buffer15_conv2d1x1_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_mul16_conv2d1x1_bs2_merged_bit_select(BITSELECT,105)@6
    i_mul16_conv2d1x1_bs2_merged_bit_select_b <= i_syncbuf_input_size_y_sync_buffer15_conv2d1x1_out_buffer_out(17 downto 0);
    i_mul16_conv2d1x1_bs2_merged_bit_select_c <= i_syncbuf_input_size_y_sync_buffer15_conv2d1x1_out_buffer_out(31 downto 18);

    -- i_mul16_conv2d1x1_bjB9(BITJOIN,68)@6
    i_mul16_conv2d1x1_bjB9_q <= GND_q & i_mul16_conv2d1x1_bs2_merged_bit_select_b;

    -- i_mul16_conv2d1x1_bs7(BITSELECT,66)@6
    i_mul16_conv2d1x1_bs7_b <= STD_LOGIC_VECTOR(in_c0_eni3_1(31 downto 18));

    -- i_mul16_conv2d1x1_ma3_cma(CHAINMULTADD,101)@6 + 2
    i_mul16_conv2d1x1_ma3_cma_reset <= not (resetn);
    i_mul16_conv2d1x1_ma3_cma_ena0 <= '1';
    i_mul16_conv2d1x1_ma3_cma_ena1 <= i_mul16_conv2d1x1_ma3_cma_ena0;
    i_mul16_conv2d1x1_ma3_cma_l(0) <= SIGNED(RESIZE(i_mul16_conv2d1x1_ma3_cma_a0(0),15));
    i_mul16_conv2d1x1_ma3_cma_l(1) <= SIGNED(RESIZE(i_mul16_conv2d1x1_ma3_cma_a0(1),15));
    i_mul16_conv2d1x1_ma3_cma_p(0) <= i_mul16_conv2d1x1_ma3_cma_l(0) * i_mul16_conv2d1x1_ma3_cma_c0(0);
    i_mul16_conv2d1x1_ma3_cma_p(1) <= i_mul16_conv2d1x1_ma3_cma_l(1) * i_mul16_conv2d1x1_ma3_cma_c0(1);
    i_mul16_conv2d1x1_ma3_cma_u(0) <= RESIZE(i_mul16_conv2d1x1_ma3_cma_p(0),35);
    i_mul16_conv2d1x1_ma3_cma_u(1) <= RESIZE(i_mul16_conv2d1x1_ma3_cma_p(1),35);
    i_mul16_conv2d1x1_ma3_cma_w(0) <= i_mul16_conv2d1x1_ma3_cma_u(0) + i_mul16_conv2d1x1_ma3_cma_u(1);
    i_mul16_conv2d1x1_ma3_cma_x(0) <= i_mul16_conv2d1x1_ma3_cma_w(0);
    i_mul16_conv2d1x1_ma3_cma_y(0) <= i_mul16_conv2d1x1_ma3_cma_x(0);
    i_mul16_conv2d1x1_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul16_conv2d1x1_ma3_cma_a0 <= (others => (others => '0'));
            i_mul16_conv2d1x1_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul16_conv2d1x1_ma3_cma_ena0 = '1') THEN
                i_mul16_conv2d1x1_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_mul16_conv2d1x1_bs7_b),14);
                i_mul16_conv2d1x1_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_mul16_conv2d1x1_bs2_merged_bit_select_c),14);
                i_mul16_conv2d1x1_ma3_cma_c0(0) <= RESIZE(SIGNED(i_mul16_conv2d1x1_bjB9_q),19);
                i_mul16_conv2d1x1_ma3_cma_c0(1) <= RESIZE(SIGNED(i_mul16_conv2d1x1_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_mul16_conv2d1x1_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul16_conv2d1x1_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul16_conv2d1x1_ma3_cma_ena1 = '1') THEN
                i_mul16_conv2d1x1_ma3_cma_s(0) <= i_mul16_conv2d1x1_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul16_conv2d1x1_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul16_conv2d1x1_ma3_cma_s(0)(33 downto 0)), xout => i_mul16_conv2d1x1_ma3_cma_qq, clk => clock, aclr => resetn );
    i_mul16_conv2d1x1_ma3_cma_q <= STD_LOGIC_VECTOR(i_mul16_conv2d1x1_ma3_cma_qq(33 downto 0));

    -- redist1_i_mul16_conv2d1x1_ma3_cma_q_1(DELAY,107)
    redist1_i_mul16_conv2d1x1_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul16_conv2d1x1_ma3_cma_q, xout => redist1_i_mul16_conv2d1x1_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul16_conv2d1x1_align_14(BITSHIFT,73)@9
    i_mul16_conv2d1x1_align_14_qint <= redist1_i_mul16_conv2d1x1_ma3_cma_q_1_q & "000000000000000000";
    i_mul16_conv2d1x1_align_14_q <= i_mul16_conv2d1x1_align_14_qint(51 downto 0);

    -- i_mul16_conv2d1x1_bs11(BITSELECT,70)@6
    i_mul16_conv2d1x1_bs11_b <= in_c0_eni3_1(31 downto 18);

    -- i_mul16_conv2d1x1_im10_cma(CHAINMULTADD,98)@6 + 2
    i_mul16_conv2d1x1_im10_cma_reset <= not (resetn);
    i_mul16_conv2d1x1_im10_cma_ena0 <= '1';
    i_mul16_conv2d1x1_im10_cma_ena1 <= i_mul16_conv2d1x1_im10_cma_ena0;
    i_mul16_conv2d1x1_im10_cma_p(0) <= i_mul16_conv2d1x1_im10_cma_a0(0) * i_mul16_conv2d1x1_im10_cma_c0(0);
    i_mul16_conv2d1x1_im10_cma_u(0) <= RESIZE(i_mul16_conv2d1x1_im10_cma_p(0),28);
    i_mul16_conv2d1x1_im10_cma_w(0) <= i_mul16_conv2d1x1_im10_cma_u(0);
    i_mul16_conv2d1x1_im10_cma_x(0) <= i_mul16_conv2d1x1_im10_cma_w(0);
    i_mul16_conv2d1x1_im10_cma_y(0) <= i_mul16_conv2d1x1_im10_cma_x(0);
    i_mul16_conv2d1x1_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul16_conv2d1x1_im10_cma_a0 <= (others => (others => '0'));
            i_mul16_conv2d1x1_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul16_conv2d1x1_im10_cma_ena0 = '1') THEN
                i_mul16_conv2d1x1_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_mul16_conv2d1x1_bs11_b),14);
                i_mul16_conv2d1x1_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_mul16_conv2d1x1_bs2_merged_bit_select_c),14);
            END IF;
        END IF;
    END PROCESS;
    i_mul16_conv2d1x1_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul16_conv2d1x1_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul16_conv2d1x1_im10_cma_ena1 = '1') THEN
                i_mul16_conv2d1x1_im10_cma_s(0) <= i_mul16_conv2d1x1_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul16_conv2d1x1_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul16_conv2d1x1_im10_cma_s(0)(27 downto 0)), xout => i_mul16_conv2d1x1_im10_cma_qq, clk => clock, aclr => resetn );
    i_mul16_conv2d1x1_im10_cma_q <= STD_LOGIC_VECTOR(i_mul16_conv2d1x1_im10_cma_qq(27 downto 0));

    -- redist4_i_mul16_conv2d1x1_im10_cma_q_1(DELAY,110)
    redist4_i_mul16_conv2d1x1_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul16_conv2d1x1_im10_cma_q, xout => redist4_i_mul16_conv2d1x1_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul16_conv2d1x1_bs1(BITSELECT,60)@6
    i_mul16_conv2d1x1_bs1_in <= in_c0_eni3_1(17 downto 0);
    i_mul16_conv2d1x1_bs1_b <= i_mul16_conv2d1x1_bs1_in(17 downto 0);

    -- i_mul16_conv2d1x1_im0_cma(CHAINMULTADD,97)@6 + 2
    i_mul16_conv2d1x1_im0_cma_reset <= not (resetn);
    i_mul16_conv2d1x1_im0_cma_ena0 <= '1';
    i_mul16_conv2d1x1_im0_cma_ena1 <= i_mul16_conv2d1x1_im0_cma_ena0;
    i_mul16_conv2d1x1_im0_cma_p(0) <= i_mul16_conv2d1x1_im0_cma_a0(0) * i_mul16_conv2d1x1_im0_cma_c0(0);
    i_mul16_conv2d1x1_im0_cma_u(0) <= RESIZE(i_mul16_conv2d1x1_im0_cma_p(0),36);
    i_mul16_conv2d1x1_im0_cma_w(0) <= i_mul16_conv2d1x1_im0_cma_u(0);
    i_mul16_conv2d1x1_im0_cma_x(0) <= i_mul16_conv2d1x1_im0_cma_w(0);
    i_mul16_conv2d1x1_im0_cma_y(0) <= i_mul16_conv2d1x1_im0_cma_x(0);
    i_mul16_conv2d1x1_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul16_conv2d1x1_im0_cma_a0 <= (others => (others => '0'));
            i_mul16_conv2d1x1_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul16_conv2d1x1_im0_cma_ena0 = '1') THEN
                i_mul16_conv2d1x1_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_mul16_conv2d1x1_bs1_b),18);
                i_mul16_conv2d1x1_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_mul16_conv2d1x1_bs2_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_mul16_conv2d1x1_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul16_conv2d1x1_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul16_conv2d1x1_im0_cma_ena1 = '1') THEN
                i_mul16_conv2d1x1_im0_cma_s(0) <= i_mul16_conv2d1x1_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul16_conv2d1x1_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul16_conv2d1x1_im0_cma_s(0)(35 downto 0)), xout => i_mul16_conv2d1x1_im0_cma_qq, clk => clock, aclr => resetn );
    i_mul16_conv2d1x1_im0_cma_q <= STD_LOGIC_VECTOR(i_mul16_conv2d1x1_im0_cma_qq(35 downto 0));

    -- redist5_i_mul16_conv2d1x1_im0_cma_q_1(DELAY,111)
    redist5_i_mul16_conv2d1x1_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul16_conv2d1x1_im0_cma_q, xout => redist5_i_mul16_conv2d1x1_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul16_conv2d1x1_join_13(BITJOIN,72)@9
    i_mul16_conv2d1x1_join_13_q <= redist4_i_mul16_conv2d1x1_im10_cma_q_1_q & redist5_i_mul16_conv2d1x1_im0_cma_q_1_q;

    -- i_mul16_conv2d1x1_result_add_0_0(ADD,75)@9
    i_mul16_conv2d1x1_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_mul16_conv2d1x1_join_13_q));
    i_mul16_conv2d1x1_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_mul16_conv2d1x1_align_14_q(51)) & i_mul16_conv2d1x1_align_14_q));
    i_mul16_conv2d1x1_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_mul16_conv2d1x1_result_add_0_0_a) + SIGNED(i_mul16_conv2d1x1_result_add_0_0_b));
    i_mul16_conv2d1x1_result_add_0_0_q <= i_mul16_conv2d1x1_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_mul16_conv2d1x1_rnd_sel(BITSELECT,55)@9
    bgTrunc_i_mul16_conv2d1x1_rnd_sel_in <= i_mul16_conv2d1x1_result_add_0_0_q(63 downto 0);
    bgTrunc_i_mul16_conv2d1x1_rnd_sel_b <= bgTrunc_i_mul16_conv2d1x1_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_mul16_conv2d1x1_sel_x(BITSELECT,3)@9
    bgTrunc_i_mul16_conv2d1x1_sel_x_b <= bgTrunc_i_mul16_conv2d1x1_rnd_sel_b(31 downto 0);

    -- redist13_bgTrunc_i_mul16_conv2d1x1_sel_x_b_1(DELAY,119)
    redist13_bgTrunc_i_mul16_conv2d1x1_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_mul16_conv2d1x1_sel_x_b, xout => redist13_bgTrunc_i_mul16_conv2d1x1_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_tmp_conv2d1x1(ADD,34)@10
    i_tmp_conv2d1x1_a <= STD_LOGIC_VECTOR("0" & redist13_bgTrunc_i_mul16_conv2d1x1_sel_x_b_1_q);
    i_tmp_conv2d1x1_b <= STD_LOGIC_VECTOR("0" & redist6_sync_in_aunroll_x_in_c0_eni3_2_4_outputreg_q);
    i_tmp_conv2d1x1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_tmp_conv2d1x1_a) + UNSIGNED(i_tmp_conv2d1x1_b));
    i_tmp_conv2d1x1_q <= i_tmp_conv2d1x1_o(32 downto 0);

    -- bgTrunc_i_tmp_conv2d1x1_sel_x(BITSELECT,5)@10
    bgTrunc_i_tmp_conv2d1x1_sel_x_b <= i_tmp_conv2d1x1_q(31 downto 0);

    -- redist11_bgTrunc_i_tmp_conv2d1x1_sel_x_b_1(DELAY,117)
    redist11_bgTrunc_i_tmp_conv2d1x1_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_tmp_conv2d1x1_sel_x_b, xout => redist11_bgTrunc_i_tmp_conv2d1x1_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_tmp1_conv2d1x1_bs4(BITSELECT,80)@11
    i_tmp1_conv2d1x1_bs4_in <= STD_LOGIC_VECTOR(redist11_bgTrunc_i_tmp_conv2d1x1_sel_x_b_1_q(17 downto 0));
    i_tmp1_conv2d1x1_bs4_b <= STD_LOGIC_VECTOR(i_tmp1_conv2d1x1_bs4_in(17 downto 0));

    -- i_tmp1_conv2d1x1_bjA5(BITJOIN,81)@11
    i_tmp1_conv2d1x1_bjA5_q <= GND_q & i_tmp1_conv2d1x1_bs4_b;

    -- i_syncbuf_input_size_x_sync_buffer9_conv2d1x1(BLACKBOX,31)@0
    -- in in_i_dependence@11
    -- in in_valid_in@11
    -- out out_buffer_out@11
    -- out out_valid_out@11
    thei_syncbuf_input_size_x_sync_buffer9_conv2d1x1 : i_syncbuf_input_size_x_sync_buffer9_conv2d1x126
    PORT MAP (
        in_buffer_in => in_input_size_x,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist8_sync_in_aunroll_x_in_i_valid_5_q,
        out_buffer_out => i_syncbuf_input_size_x_sync_buffer9_conv2d1x1_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_tmp1_conv2d1x1_bs2_merged_bit_select(BITSELECT,104)@11
    i_tmp1_conv2d1x1_bs2_merged_bit_select_b <= i_syncbuf_input_size_x_sync_buffer9_conv2d1x1_out_buffer_out(17 downto 0);
    i_tmp1_conv2d1x1_bs2_merged_bit_select_c <= i_syncbuf_input_size_x_sync_buffer9_conv2d1x1_out_buffer_out(31 downto 18);

    -- i_tmp1_conv2d1x1_bjB9(BITJOIN,85)@11
    i_tmp1_conv2d1x1_bjB9_q <= GND_q & i_tmp1_conv2d1x1_bs2_merged_bit_select_b;

    -- i_tmp1_conv2d1x1_bs7(BITSELECT,83)@11
    i_tmp1_conv2d1x1_bs7_b <= STD_LOGIC_VECTOR(redist11_bgTrunc_i_tmp_conv2d1x1_sel_x_b_1_q(31 downto 18));

    -- i_tmp1_conv2d1x1_ma3_cma(CHAINMULTADD,102)@11 + 2
    i_tmp1_conv2d1x1_ma3_cma_reset <= not (resetn);
    i_tmp1_conv2d1x1_ma3_cma_ena0 <= '1';
    i_tmp1_conv2d1x1_ma3_cma_ena1 <= i_tmp1_conv2d1x1_ma3_cma_ena0;
    i_tmp1_conv2d1x1_ma3_cma_l(0) <= SIGNED(RESIZE(i_tmp1_conv2d1x1_ma3_cma_a0(0),15));
    i_tmp1_conv2d1x1_ma3_cma_l(1) <= SIGNED(RESIZE(i_tmp1_conv2d1x1_ma3_cma_a0(1),15));
    i_tmp1_conv2d1x1_ma3_cma_p(0) <= i_tmp1_conv2d1x1_ma3_cma_l(0) * i_tmp1_conv2d1x1_ma3_cma_c0(0);
    i_tmp1_conv2d1x1_ma3_cma_p(1) <= i_tmp1_conv2d1x1_ma3_cma_l(1) * i_tmp1_conv2d1x1_ma3_cma_c0(1);
    i_tmp1_conv2d1x1_ma3_cma_u(0) <= RESIZE(i_tmp1_conv2d1x1_ma3_cma_p(0),35);
    i_tmp1_conv2d1x1_ma3_cma_u(1) <= RESIZE(i_tmp1_conv2d1x1_ma3_cma_p(1),35);
    i_tmp1_conv2d1x1_ma3_cma_w(0) <= i_tmp1_conv2d1x1_ma3_cma_u(0) + i_tmp1_conv2d1x1_ma3_cma_u(1);
    i_tmp1_conv2d1x1_ma3_cma_x(0) <= i_tmp1_conv2d1x1_ma3_cma_w(0);
    i_tmp1_conv2d1x1_ma3_cma_y(0) <= i_tmp1_conv2d1x1_ma3_cma_x(0);
    i_tmp1_conv2d1x1_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_tmp1_conv2d1x1_ma3_cma_a0 <= (others => (others => '0'));
            i_tmp1_conv2d1x1_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_tmp1_conv2d1x1_ma3_cma_ena0 = '1') THEN
                i_tmp1_conv2d1x1_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_tmp1_conv2d1x1_bs7_b),14);
                i_tmp1_conv2d1x1_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_tmp1_conv2d1x1_bs2_merged_bit_select_c),14);
                i_tmp1_conv2d1x1_ma3_cma_c0(0) <= RESIZE(SIGNED(i_tmp1_conv2d1x1_bjB9_q),19);
                i_tmp1_conv2d1x1_ma3_cma_c0(1) <= RESIZE(SIGNED(i_tmp1_conv2d1x1_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_tmp1_conv2d1x1_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_tmp1_conv2d1x1_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_tmp1_conv2d1x1_ma3_cma_ena1 = '1') THEN
                i_tmp1_conv2d1x1_ma3_cma_s(0) <= i_tmp1_conv2d1x1_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_tmp1_conv2d1x1_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_tmp1_conv2d1x1_ma3_cma_s(0)(33 downto 0)), xout => i_tmp1_conv2d1x1_ma3_cma_qq, clk => clock, aclr => resetn );
    i_tmp1_conv2d1x1_ma3_cma_q <= STD_LOGIC_VECTOR(i_tmp1_conv2d1x1_ma3_cma_qq(33 downto 0));

    -- redist0_i_tmp1_conv2d1x1_ma3_cma_q_1(DELAY,106)
    redist0_i_tmp1_conv2d1x1_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_tmp1_conv2d1x1_ma3_cma_q, xout => redist0_i_tmp1_conv2d1x1_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_tmp1_conv2d1x1_align_14(BITSHIFT,90)@14
    i_tmp1_conv2d1x1_align_14_qint <= redist0_i_tmp1_conv2d1x1_ma3_cma_q_1_q & "000000000000000000";
    i_tmp1_conv2d1x1_align_14_q <= i_tmp1_conv2d1x1_align_14_qint(51 downto 0);

    -- i_tmp1_conv2d1x1_bs11(BITSELECT,87)@11
    i_tmp1_conv2d1x1_bs11_b <= redist11_bgTrunc_i_tmp_conv2d1x1_sel_x_b_1_q(31 downto 18);

    -- i_tmp1_conv2d1x1_im10_cma(CHAINMULTADD,100)@11 + 2
    i_tmp1_conv2d1x1_im10_cma_reset <= not (resetn);
    i_tmp1_conv2d1x1_im10_cma_ena0 <= '1';
    i_tmp1_conv2d1x1_im10_cma_ena1 <= i_tmp1_conv2d1x1_im10_cma_ena0;
    i_tmp1_conv2d1x1_im10_cma_p(0) <= i_tmp1_conv2d1x1_im10_cma_a0(0) * i_tmp1_conv2d1x1_im10_cma_c0(0);
    i_tmp1_conv2d1x1_im10_cma_u(0) <= RESIZE(i_tmp1_conv2d1x1_im10_cma_p(0),28);
    i_tmp1_conv2d1x1_im10_cma_w(0) <= i_tmp1_conv2d1x1_im10_cma_u(0);
    i_tmp1_conv2d1x1_im10_cma_x(0) <= i_tmp1_conv2d1x1_im10_cma_w(0);
    i_tmp1_conv2d1x1_im10_cma_y(0) <= i_tmp1_conv2d1x1_im10_cma_x(0);
    i_tmp1_conv2d1x1_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_tmp1_conv2d1x1_im10_cma_a0 <= (others => (others => '0'));
            i_tmp1_conv2d1x1_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_tmp1_conv2d1x1_im10_cma_ena0 = '1') THEN
                i_tmp1_conv2d1x1_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_tmp1_conv2d1x1_bs11_b),14);
                i_tmp1_conv2d1x1_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_tmp1_conv2d1x1_bs2_merged_bit_select_c),14);
            END IF;
        END IF;
    END PROCESS;
    i_tmp1_conv2d1x1_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_tmp1_conv2d1x1_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_tmp1_conv2d1x1_im10_cma_ena1 = '1') THEN
                i_tmp1_conv2d1x1_im10_cma_s(0) <= i_tmp1_conv2d1x1_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_tmp1_conv2d1x1_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_tmp1_conv2d1x1_im10_cma_s(0)(27 downto 0)), xout => i_tmp1_conv2d1x1_im10_cma_qq, clk => clock, aclr => resetn );
    i_tmp1_conv2d1x1_im10_cma_q <= STD_LOGIC_VECTOR(i_tmp1_conv2d1x1_im10_cma_qq(27 downto 0));

    -- redist2_i_tmp1_conv2d1x1_im10_cma_q_1(DELAY,108)
    redist2_i_tmp1_conv2d1x1_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_tmp1_conv2d1x1_im10_cma_q, xout => redist2_i_tmp1_conv2d1x1_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_tmp1_conv2d1x1_bs1(BITSELECT,77)@11
    i_tmp1_conv2d1x1_bs1_in <= redist11_bgTrunc_i_tmp_conv2d1x1_sel_x_b_1_q(17 downto 0);
    i_tmp1_conv2d1x1_bs1_b <= i_tmp1_conv2d1x1_bs1_in(17 downto 0);

    -- i_tmp1_conv2d1x1_im0_cma(CHAINMULTADD,99)@11 + 2
    i_tmp1_conv2d1x1_im0_cma_reset <= not (resetn);
    i_tmp1_conv2d1x1_im0_cma_ena0 <= '1';
    i_tmp1_conv2d1x1_im0_cma_ena1 <= i_tmp1_conv2d1x1_im0_cma_ena0;
    i_tmp1_conv2d1x1_im0_cma_p(0) <= i_tmp1_conv2d1x1_im0_cma_a0(0) * i_tmp1_conv2d1x1_im0_cma_c0(0);
    i_tmp1_conv2d1x1_im0_cma_u(0) <= RESIZE(i_tmp1_conv2d1x1_im0_cma_p(0),36);
    i_tmp1_conv2d1x1_im0_cma_w(0) <= i_tmp1_conv2d1x1_im0_cma_u(0);
    i_tmp1_conv2d1x1_im0_cma_x(0) <= i_tmp1_conv2d1x1_im0_cma_w(0);
    i_tmp1_conv2d1x1_im0_cma_y(0) <= i_tmp1_conv2d1x1_im0_cma_x(0);
    i_tmp1_conv2d1x1_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_tmp1_conv2d1x1_im0_cma_a0 <= (others => (others => '0'));
            i_tmp1_conv2d1x1_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_tmp1_conv2d1x1_im0_cma_ena0 = '1') THEN
                i_tmp1_conv2d1x1_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_tmp1_conv2d1x1_bs1_b),18);
                i_tmp1_conv2d1x1_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_tmp1_conv2d1x1_bs2_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_tmp1_conv2d1x1_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_tmp1_conv2d1x1_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_tmp1_conv2d1x1_im0_cma_ena1 = '1') THEN
                i_tmp1_conv2d1x1_im0_cma_s(0) <= i_tmp1_conv2d1x1_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_tmp1_conv2d1x1_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_tmp1_conv2d1x1_im0_cma_s(0)(35 downto 0)), xout => i_tmp1_conv2d1x1_im0_cma_qq, clk => clock, aclr => resetn );
    i_tmp1_conv2d1x1_im0_cma_q <= STD_LOGIC_VECTOR(i_tmp1_conv2d1x1_im0_cma_qq(35 downto 0));

    -- redist3_i_tmp1_conv2d1x1_im0_cma_q_1(DELAY,109)
    redist3_i_tmp1_conv2d1x1_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_tmp1_conv2d1x1_im0_cma_q, xout => redist3_i_tmp1_conv2d1x1_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_tmp1_conv2d1x1_join_13(BITJOIN,89)@14
    i_tmp1_conv2d1x1_join_13_q <= redist2_i_tmp1_conv2d1x1_im10_cma_q_1_q & redist3_i_tmp1_conv2d1x1_im0_cma_q_1_q;

    -- i_tmp1_conv2d1x1_result_add_0_0(ADD,92)@14
    i_tmp1_conv2d1x1_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_tmp1_conv2d1x1_join_13_q));
    i_tmp1_conv2d1x1_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_tmp1_conv2d1x1_align_14_q(51)) & i_tmp1_conv2d1x1_align_14_q));
    i_tmp1_conv2d1x1_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_tmp1_conv2d1x1_result_add_0_0_a) + SIGNED(i_tmp1_conv2d1x1_result_add_0_0_b));
    i_tmp1_conv2d1x1_result_add_0_0_q <= i_tmp1_conv2d1x1_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_tmp1_conv2d1x1_rnd_sel(BITSELECT,56)@14
    bgTrunc_i_tmp1_conv2d1x1_rnd_sel_in <= i_tmp1_conv2d1x1_result_add_0_0_q(63 downto 0);
    bgTrunc_i_tmp1_conv2d1x1_rnd_sel_b <= bgTrunc_i_tmp1_conv2d1x1_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_tmp1_conv2d1x1_sel_x(BITSELECT,4)@14
    bgTrunc_i_tmp1_conv2d1x1_sel_x_b <= bgTrunc_i_tmp1_conv2d1x1_rnd_sel_b(31 downto 0);

    -- redist12_bgTrunc_i_tmp1_conv2d1x1_sel_x_b_1(DELAY,118)
    redist12_bgTrunc_i_tmp1_conv2d1x1_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_tmp1_conv2d1x1_sel_x_b, xout => redist12_bgTrunc_i_tmp1_conv2d1x1_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_add18_conv2d1x1(ADD,26)@15
    i_add18_conv2d1x1_a <= STD_LOGIC_VECTOR("0" & redist12_bgTrunc_i_tmp1_conv2d1x1_sel_x_b_1_q);
    i_add18_conv2d1x1_b <= STD_LOGIC_VECTOR("0" & redist7_sync_in_aunroll_x_in_c0_eni3_3_9_outputreg_q);
    i_add18_conv2d1x1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add18_conv2d1x1_a) + UNSIGNED(i_add18_conv2d1x1_b));
    i_add18_conv2d1x1_q <= i_add18_conv2d1x1_o(32 downto 0);

    -- bgTrunc_i_add18_conv2d1x1_sel_x(BITSELECT,2)@15
    bgTrunc_i_add18_conv2d1x1_sel_x_b <= i_add18_conv2d1x1_q(31 downto 0);

    -- redist14_bgTrunc_i_add18_conv2d1x1_sel_x_b_1(DELAY,120)
    redist14_bgTrunc_i_add18_conv2d1x1_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add18_conv2d1x1_sel_x_b, xout => redist14_bgTrunc_i_add18_conv2d1x1_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_idxprom19_conv2d1x1_sel_x(BITSELECT,18)@16
    i_idxprom19_conv2d1x1_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist14_bgTrunc_i_add18_conv2d1x1_sel_x_b_1_q(31 downto 0)), 64)));

    -- i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_bs1_merged_bit_select(BITSELECT,103)@16
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_bs1_merged_bit_select_b <= i_idxprom19_conv2d1x1_sel_x_b(17 downto 0);
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_bs1_merged_bit_select_c <= i_idxprom19_conv2d1x1_sel_x_b(63 downto 54);
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_bs1_merged_bit_select_d <= i_idxprom19_conv2d1x1_sel_x_b(35 downto 18);
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_bs1_merged_bit_select_e <= i_idxprom19_conv2d1x1_sel_x_b(53 downto 36);

    -- i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im3_shift0(BITSHIFT,94)@16
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im3_shift0_qint <= i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im3_shift0_q <= i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_align_15(BITSHIFT,51)@16
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_align_15_q <= i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im6_shift0(BITSHIFT,95)@16
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im6_shift0_qint <= i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im6_shift0_q <= i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_align_14(BITSHIFT,50)@16
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_align_14_q <= i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_join_16(BITJOIN,52)@16
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_join_16_q <= i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_align_15_q & i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_align_14_q;

    -- i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im9_shift0(BITSHIFT,96)@16
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im9_shift0_qint <= i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im9_shift0_q <= i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_align_12(BITSHIFT,48)@16
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_align_12_q <= i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im0_shift0(BITSHIFT,93)@16
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im0_shift0_qint <= i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im0_shift0_q <= i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_join_13(BITJOIN,49)@16
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_join_13_q <= i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_im0_shift0_q);

    -- i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_result_add_0_0(ADD,53)@16
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_join_13_q);
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_join_16_q);
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_result_add_0_0_b));
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_result_add_0_0_q <= i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx20_conv2d1x1_conv2d1x130_mult_extender_x(BITJOIN,11)@16
    i_arrayidx20_conv2d1x1_conv2d1x130_mult_extender_x_q <= i_arrayidx20_conv2d1x1_conv2d1x130_mult_multconst_x_q & i_arrayidx20_conv2d1x1_conv2d1x130_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx20_conv2d1x1_conv2d1x130_trunc_sel_x(BITSELECT,13)@16
    i_arrayidx20_conv2d1x1_conv2d1x130_trunc_sel_x_b <= i_arrayidx20_conv2d1x1_conv2d1x130_mult_extender_x_q(63 downto 0);

    -- redist10_i_arrayidx20_conv2d1x1_conv2d1x130_trunc_sel_x_b_1(DELAY,116)
    redist10_i_arrayidx20_conv2d1x1_conv2d1x130_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_arrayidx20_conv2d1x1_conv2d1x130_trunc_sel_x_b, xout => redist10_i_arrayidx20_conv2d1x1_conv2d1x130_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_input_im_sync_buffer_conv2d1x1(BLACKBOX,30)@0
    -- in in_i_dependence@17
    -- in in_valid_in@17
    -- out out_buffer_out@17
    -- out out_valid_out@17
    thei_syncbuf_input_im_sync_buffer_conv2d1x1 : i_syncbuf_input_im_sync_buffer_conv2d1x128
    PORT MAP (
        in_buffer_in => in_input_im,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist9_sync_in_aunroll_x_in_i_valid_11_q,
        out_buffer_out => i_syncbuf_input_im_sync_buffer_conv2d1x1_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx20_conv2d1x1_conv2d1x130_add_x(ADD,14)@17
    i_arrayidx20_conv2d1x1_conv2d1x130_add_x_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_input_im_sync_buffer_conv2d1x1_out_buffer_out);
    i_arrayidx20_conv2d1x1_conv2d1x130_add_x_b <= STD_LOGIC_VECTOR("0" & redist10_i_arrayidx20_conv2d1x1_conv2d1x130_trunc_sel_x_b_1_q);
    i_arrayidx20_conv2d1x1_conv2d1x130_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx20_conv2d1x1_conv2d1x130_add_x_a) + UNSIGNED(i_arrayidx20_conv2d1x1_conv2d1x130_add_x_b));
    i_arrayidx20_conv2d1x1_conv2d1x130_add_x_q <= i_arrayidx20_conv2d1x1_conv2d1x130_add_x_o(64 downto 0);

    -- i_arrayidx20_conv2d1x1_conv2d1x130_dupName_0_trunc_sel_x(BITSELECT,8)@17
    i_arrayidx20_conv2d1x1_conv2d1x130_dupName_0_trunc_sel_x_b <= i_arrayidx20_conv2d1x1_conv2d1x130_add_x_q(63 downto 0);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,20)@17
    out_c0_exi126_0 <= GND_q;
    out_c0_exi126_1 <= i_arrayidx20_conv2d1x1_conv2d1x130_dupName_0_trunc_sel_x_b;
    out_o_valid <= redist9_sync_in_aunroll_x_in_i_valid_11_q;

END normal;
