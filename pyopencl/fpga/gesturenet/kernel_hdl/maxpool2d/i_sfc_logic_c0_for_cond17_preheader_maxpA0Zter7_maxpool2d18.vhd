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

-- VHDL created from i_sfc_logic_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d18
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

entity i_sfc_logic_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d18 is
    port (
        in_c0_eni4_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni4_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni4_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni4_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni4_4 : in std_logic_vector(63 downto 0);  -- ufix64
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi19_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi19_1 : out std_logic_vector(63 downto 0);  -- ufix64
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d18;

architecture normal of i_sfc_logic_c0_for_cond17_preheader_maxpool2d_c0_enter7_maxpool2d18 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_syncbuf_input_im_sync_buffer_maxpool2d22 is
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


    component i_syncbuf_input_size_sync_buffer1_maxpool2d20 is
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
    signal bgTrunc_i_add25_maxpool2d_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add_maxpool2d_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add_ptr_sum_maxpool2d_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul23_maxpool2d_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_idxprom_maxpool2d_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_add25_maxpool2d_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add25_maxpool2d_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add25_maxpool2d_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add25_maxpool2d_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_maxpool2d_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_maxpool2d_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_maxpool2d_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_maxpool2d_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_ptr_sum_maxpool2d_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr_sum_maxpool2d_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr_sum_maxpool2d_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr_sum_maxpool2d_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_syncbuf_input_im_sync_buffer_maxpool2d_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_input_size_sync_buffer1_maxpool2d_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal bgTrunc_i_mul23_maxpool2d_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul23_maxpool2d_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul23_maxpool2d_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul23_maxpool2d_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul23_maxpool2d_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul23_maxpool2d_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul23_maxpool2d_bjA5_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul23_maxpool2d_bs7_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul23_maxpool2d_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul23_maxpool2d_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul23_maxpool2d_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul23_maxpool2d_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul23_maxpool2d_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul23_maxpool2d_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul23_maxpool2d_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul23_maxpool2d_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul23_maxpool2d_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_mul23_maxpool2d_im0_cma_reset : std_logic;
    type i_mul23_maxpool2d_im0_cma_a0type is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal i_mul23_maxpool2d_im0_cma_a0 : i_mul23_maxpool2d_im0_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of i_mul23_maxpool2d_im0_cma_a0 : signal is true;
    signal i_mul23_maxpool2d_im0_cma_c0 : i_mul23_maxpool2d_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul23_maxpool2d_im0_cma_c0 : signal is true;
    type i_mul23_maxpool2d_im0_cma_ptype is array(NATURAL range <>) of UNSIGNED(35 downto 0);
    signal i_mul23_maxpool2d_im0_cma_p : i_mul23_maxpool2d_im0_cma_ptype(0 to 0);
    signal i_mul23_maxpool2d_im0_cma_u : i_mul23_maxpool2d_im0_cma_ptype(0 to 0);
    signal i_mul23_maxpool2d_im0_cma_w : i_mul23_maxpool2d_im0_cma_ptype(0 to 0);
    signal i_mul23_maxpool2d_im0_cma_x : i_mul23_maxpool2d_im0_cma_ptype(0 to 0);
    signal i_mul23_maxpool2d_im0_cma_y : i_mul23_maxpool2d_im0_cma_ptype(0 to 0);
    signal i_mul23_maxpool2d_im0_cma_s : i_mul23_maxpool2d_im0_cma_ptype(0 to 0);
    signal i_mul23_maxpool2d_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul23_maxpool2d_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul23_maxpool2d_im0_cma_ena0 : std_logic;
    signal i_mul23_maxpool2d_im0_cma_ena1 : std_logic;
    signal i_mul23_maxpool2d_im10_cma_reset : std_logic;
    type i_mul23_maxpool2d_im10_cma_a0type is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal i_mul23_maxpool2d_im10_cma_a0 : i_mul23_maxpool2d_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul23_maxpool2d_im10_cma_a0 : signal is true;
    signal i_mul23_maxpool2d_im10_cma_c0 : i_mul23_maxpool2d_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul23_maxpool2d_im10_cma_c0 : signal is true;
    type i_mul23_maxpool2d_im10_cma_ptype is array(NATURAL range <>) of UNSIGNED(27 downto 0);
    signal i_mul23_maxpool2d_im10_cma_p : i_mul23_maxpool2d_im10_cma_ptype(0 to 0);
    signal i_mul23_maxpool2d_im10_cma_u : i_mul23_maxpool2d_im10_cma_ptype(0 to 0);
    signal i_mul23_maxpool2d_im10_cma_w : i_mul23_maxpool2d_im10_cma_ptype(0 to 0);
    signal i_mul23_maxpool2d_im10_cma_x : i_mul23_maxpool2d_im10_cma_ptype(0 to 0);
    signal i_mul23_maxpool2d_im10_cma_y : i_mul23_maxpool2d_im10_cma_ptype(0 to 0);
    signal i_mul23_maxpool2d_im10_cma_s : i_mul23_maxpool2d_im10_cma_ptype(0 to 0);
    signal i_mul23_maxpool2d_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul23_maxpool2d_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul23_maxpool2d_im10_cma_ena0 : std_logic;
    signal i_mul23_maxpool2d_im10_cma_ena1 : std_logic;
    signal i_mul23_maxpool2d_ma3_cma_reset : std_logic;
    signal i_mul23_maxpool2d_ma3_cma_a0 : i_mul23_maxpool2d_im10_cma_a0type(0 to 1);
    attribute preserve of i_mul23_maxpool2d_ma3_cma_a0 : signal is true;
    type i_mul23_maxpool2d_ma3_cma_c0type is array(NATURAL range <>) of SIGNED(18 downto 0);
    signal i_mul23_maxpool2d_ma3_cma_c0 : i_mul23_maxpool2d_ma3_cma_c0type(0 to 1);
    attribute preserve of i_mul23_maxpool2d_ma3_cma_c0 : signal is true;
    type i_mul23_maxpool2d_ma3_cma_ltype is array(NATURAL range <>) of SIGNED(14 downto 0);
    signal i_mul23_maxpool2d_ma3_cma_l : i_mul23_maxpool2d_ma3_cma_ltype(0 to 1);
    type i_mul23_maxpool2d_ma3_cma_ptype is array(NATURAL range <>) of SIGNED(33 downto 0);
    signal i_mul23_maxpool2d_ma3_cma_p : i_mul23_maxpool2d_ma3_cma_ptype(0 to 1);
    type i_mul23_maxpool2d_ma3_cma_utype is array(NATURAL range <>) of SIGNED(34 downto 0);
    signal i_mul23_maxpool2d_ma3_cma_u : i_mul23_maxpool2d_ma3_cma_utype(0 to 1);
    signal i_mul23_maxpool2d_ma3_cma_w : i_mul23_maxpool2d_ma3_cma_utype(0 to 0);
    signal i_mul23_maxpool2d_ma3_cma_x : i_mul23_maxpool2d_ma3_cma_utype(0 to 0);
    signal i_mul23_maxpool2d_ma3_cma_y : i_mul23_maxpool2d_ma3_cma_utype(0 to 0);
    signal i_mul23_maxpool2d_ma3_cma_s : i_mul23_maxpool2d_ma3_cma_utype(0 to 0);
    signal i_mul23_maxpool2d_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul23_maxpool2d_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul23_maxpool2d_ma3_cma_ena0 : std_logic;
    signal i_mul23_maxpool2d_ma3_cma_ena1 : std_logic;
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_maxpool2d_maxpool2d24_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul23_maxpool2d_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul23_maxpool2d_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal redist0_i_mul23_maxpool2d_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist1_i_mul23_maxpool2d_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist2_i_mul23_maxpool2d_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist5_sync_in_aunroll_x_in_i_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_sync_in_aunroll_x_in_i_valid_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_arrayidx_maxpool2d_maxpool2d24_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist8_bgTrunc_i_mul23_maxpool2d_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_bgTrunc_i_add_ptr_sum_maxpool2d_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist10_bgTrunc_i_add_maxpool2d_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_bgTrunc_i_add25_maxpool2d_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni4_3_5_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni4_3_5_mem_reset0 : std_logic;
    signal redist3_sync_in_aunroll_x_in_c0_eni4_3_5_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni4_3_5_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni4_3_5_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni4_3_5_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni4_3_5_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni4_3_5_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni4_3_5_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist3_sync_in_aunroll_x_in_c0_eni4_3_5_rdcnt_i : signal is true;
    signal redist3_sync_in_aunroll_x_in_c0_eni4_3_5_rdcnt_eq : std_logic;
    attribute preserve of redist3_sync_in_aunroll_x_in_c0_eni4_3_5_rdcnt_eq : signal is true;
    signal redist3_sync_in_aunroll_x_in_c0_eni4_3_5_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni4_3_5_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni4_3_5_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni4_3_5_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni4_3_5_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni4_3_5_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_sync_in_aunroll_x_in_c0_eni4_3_5_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist3_sync_in_aunroll_x_in_c0_eni4_3_5_sticky_ena_q : signal is true;
    signal redist3_sync_in_aunroll_x_in_c0_eni4_3_5_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni4_4_6_outputreg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni4_4_6_mem_reset0 : std_logic;
    signal redist4_sync_in_aunroll_x_in_c0_eni4_4_6_mem_ia : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni4_4_6_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni4_4_6_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni4_4_6_mem_iq : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni4_4_6_mem_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni4_4_6_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni4_4_6_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist4_sync_in_aunroll_x_in_c0_eni4_4_6_rdcnt_i : signal is true;
    signal redist4_sync_in_aunroll_x_in_c0_eni4_4_6_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni4_4_6_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni4_4_6_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni4_4_6_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni4_4_6_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni4_4_6_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni4_4_6_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sync_in_aunroll_x_in_c0_eni4_4_6_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist4_sync_in_aunroll_x_in_c0_eni4_4_6_sticky_ena_q : signal is true;
    signal redist4_sync_in_aunroll_x_in_c0_eni4_4_6_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist5_sync_in_aunroll_x_in_i_valid_1(DELAY,89)
    redist5_sync_in_aunroll_x_in_i_valid_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist5_sync_in_aunroll_x_in_i_valid_1_q, clk => clock, aclr => resetn );

    -- redist6_sync_in_aunroll_x_in_i_valid_8(DELAY,90)
    redist6_sync_in_aunroll_x_in_i_valid_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist5_sync_in_aunroll_x_in_i_valid_1_q, xout => redist6_sync_in_aunroll_x_in_i_valid_8_q, clk => clock, aclr => resetn );

    -- i_arrayidx_maxpool2d_maxpool2d24_mult_multconst_x(CONSTANT,11)
    i_arrayidx_maxpool2d_maxpool2d24_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- redist4_sync_in_aunroll_x_in_c0_eni4_4_6_notEnable(LOGICAL,114)
    redist4_sync_in_aunroll_x_in_c0_eni4_4_6_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist4_sync_in_aunroll_x_in_c0_eni4_4_6_nor(LOGICAL,115)
    redist4_sync_in_aunroll_x_in_c0_eni4_4_6_nor_q <= not (redist4_sync_in_aunroll_x_in_c0_eni4_4_6_notEnable_q or redist4_sync_in_aunroll_x_in_c0_eni4_4_6_sticky_ena_q);

    -- redist4_sync_in_aunroll_x_in_c0_eni4_4_6_mem_last(CONSTANT,111)
    redist4_sync_in_aunroll_x_in_c0_eni4_4_6_mem_last_q <= "010";

    -- redist4_sync_in_aunroll_x_in_c0_eni4_4_6_cmp(LOGICAL,112)
    redist4_sync_in_aunroll_x_in_c0_eni4_4_6_cmp_b <= STD_LOGIC_VECTOR("0" & redist4_sync_in_aunroll_x_in_c0_eni4_4_6_rdcnt_q);
    redist4_sync_in_aunroll_x_in_c0_eni4_4_6_cmp_q <= "1" WHEN redist4_sync_in_aunroll_x_in_c0_eni4_4_6_mem_last_q = redist4_sync_in_aunroll_x_in_c0_eni4_4_6_cmp_b ELSE "0";

    -- redist4_sync_in_aunroll_x_in_c0_eni4_4_6_cmpReg(REG,113)
    redist4_sync_in_aunroll_x_in_c0_eni4_4_6_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_sync_in_aunroll_x_in_c0_eni4_4_6_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist4_sync_in_aunroll_x_in_c0_eni4_4_6_cmpReg_q <= STD_LOGIC_VECTOR(redist4_sync_in_aunroll_x_in_c0_eni4_4_6_cmp_q);
        END IF;
    END PROCESS;

    -- redist4_sync_in_aunroll_x_in_c0_eni4_4_6_sticky_ena(REG,116)
    redist4_sync_in_aunroll_x_in_c0_eni4_4_6_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_sync_in_aunroll_x_in_c0_eni4_4_6_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist4_sync_in_aunroll_x_in_c0_eni4_4_6_nor_q = "1") THEN
                redist4_sync_in_aunroll_x_in_c0_eni4_4_6_sticky_ena_q <= STD_LOGIC_VECTOR(redist4_sync_in_aunroll_x_in_c0_eni4_4_6_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_sync_in_aunroll_x_in_c0_eni4_4_6_enaAnd(LOGICAL,117)
    redist4_sync_in_aunroll_x_in_c0_eni4_4_6_enaAnd_q <= redist4_sync_in_aunroll_x_in_c0_eni4_4_6_sticky_ena_q and VCC_q;

    -- redist4_sync_in_aunroll_x_in_c0_eni4_4_6_rdcnt(COUNTER,109)
    -- low=0, high=3, step=1, init=0
    redist4_sync_in_aunroll_x_in_c0_eni4_4_6_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_sync_in_aunroll_x_in_c0_eni4_4_6_rdcnt_i <= TO_UNSIGNED(0, 2);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist4_sync_in_aunroll_x_in_c0_eni4_4_6_rdcnt_i <= redist4_sync_in_aunroll_x_in_c0_eni4_4_6_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist4_sync_in_aunroll_x_in_c0_eni4_4_6_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist4_sync_in_aunroll_x_in_c0_eni4_4_6_rdcnt_i, 2)));

    -- redist4_sync_in_aunroll_x_in_c0_eni4_4_6_wraddr(REG,110)
    redist4_sync_in_aunroll_x_in_c0_eni4_4_6_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_sync_in_aunroll_x_in_c0_eni4_4_6_wraddr_q <= "11";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist4_sync_in_aunroll_x_in_c0_eni4_4_6_wraddr_q <= STD_LOGIC_VECTOR(redist4_sync_in_aunroll_x_in_c0_eni4_4_6_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist4_sync_in_aunroll_x_in_c0_eni4_4_6_mem(DUALMEM,108)
    redist4_sync_in_aunroll_x_in_c0_eni4_4_6_mem_ia <= STD_LOGIC_VECTOR(in_c0_eni4_4);
    redist4_sync_in_aunroll_x_in_c0_eni4_4_6_mem_aa <= redist4_sync_in_aunroll_x_in_c0_eni4_4_6_wraddr_q;
    redist4_sync_in_aunroll_x_in_c0_eni4_4_6_mem_ab <= redist4_sync_in_aunroll_x_in_c0_eni4_4_6_rdcnt_q;
    redist4_sync_in_aunroll_x_in_c0_eni4_4_6_mem_reset0 <= not (resetn);
    redist4_sync_in_aunroll_x_in_c0_eni4_4_6_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 64,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 64,
        widthad_b => 2,
        numwords_b => 4,
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
        clocken1 => redist4_sync_in_aunroll_x_in_c0_eni4_4_6_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist4_sync_in_aunroll_x_in_c0_eni4_4_6_mem_reset0,
        clock1 => clock,
        address_a => redist4_sync_in_aunroll_x_in_c0_eni4_4_6_mem_aa,
        data_a => redist4_sync_in_aunroll_x_in_c0_eni4_4_6_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist4_sync_in_aunroll_x_in_c0_eni4_4_6_mem_ab,
        q_b => redist4_sync_in_aunroll_x_in_c0_eni4_4_6_mem_iq
    );
    redist4_sync_in_aunroll_x_in_c0_eni4_4_6_mem_q <= redist4_sync_in_aunroll_x_in_c0_eni4_4_6_mem_iq(63 downto 0);

    -- redist4_sync_in_aunroll_x_in_c0_eni4_4_6_outputreg(DELAY,107)
    redist4_sync_in_aunroll_x_in_c0_eni4_4_6_outputreg : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist4_sync_in_aunroll_x_in_c0_eni4_4_6_mem_q, xout => redist4_sync_in_aunroll_x_in_c0_eni4_4_6_outputreg_q, clk => clock, aclr => resetn );

    -- redist3_sync_in_aunroll_x_in_c0_eni4_3_5_notEnable(LOGICAL,103)
    redist3_sync_in_aunroll_x_in_c0_eni4_3_5_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist3_sync_in_aunroll_x_in_c0_eni4_3_5_nor(LOGICAL,104)
    redist3_sync_in_aunroll_x_in_c0_eni4_3_5_nor_q <= not (redist3_sync_in_aunroll_x_in_c0_eni4_3_5_notEnable_q or redist3_sync_in_aunroll_x_in_c0_eni4_3_5_sticky_ena_q);

    -- redist3_sync_in_aunroll_x_in_c0_eni4_3_5_mem_last(CONSTANT,100)
    redist3_sync_in_aunroll_x_in_c0_eni4_3_5_mem_last_q <= "01";

    -- redist3_sync_in_aunroll_x_in_c0_eni4_3_5_cmp(LOGICAL,101)
    redist3_sync_in_aunroll_x_in_c0_eni4_3_5_cmp_q <= "1" WHEN redist3_sync_in_aunroll_x_in_c0_eni4_3_5_mem_last_q = redist3_sync_in_aunroll_x_in_c0_eni4_3_5_rdcnt_q ELSE "0";

    -- redist3_sync_in_aunroll_x_in_c0_eni4_3_5_cmpReg(REG,102)
    redist3_sync_in_aunroll_x_in_c0_eni4_3_5_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_sync_in_aunroll_x_in_c0_eni4_3_5_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist3_sync_in_aunroll_x_in_c0_eni4_3_5_cmpReg_q <= STD_LOGIC_VECTOR(redist3_sync_in_aunroll_x_in_c0_eni4_3_5_cmp_q);
        END IF;
    END PROCESS;

    -- redist3_sync_in_aunroll_x_in_c0_eni4_3_5_sticky_ena(REG,105)
    redist3_sync_in_aunroll_x_in_c0_eni4_3_5_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_sync_in_aunroll_x_in_c0_eni4_3_5_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist3_sync_in_aunroll_x_in_c0_eni4_3_5_nor_q = "1") THEN
                redist3_sync_in_aunroll_x_in_c0_eni4_3_5_sticky_ena_q <= STD_LOGIC_VECTOR(redist3_sync_in_aunroll_x_in_c0_eni4_3_5_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_sync_in_aunroll_x_in_c0_eni4_3_5_enaAnd(LOGICAL,106)
    redist3_sync_in_aunroll_x_in_c0_eni4_3_5_enaAnd_q <= redist3_sync_in_aunroll_x_in_c0_eni4_3_5_sticky_ena_q and VCC_q;

    -- redist3_sync_in_aunroll_x_in_c0_eni4_3_5_rdcnt(COUNTER,98)
    -- low=0, high=2, step=1, init=0
    redist3_sync_in_aunroll_x_in_c0_eni4_3_5_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_sync_in_aunroll_x_in_c0_eni4_3_5_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist3_sync_in_aunroll_x_in_c0_eni4_3_5_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist3_sync_in_aunroll_x_in_c0_eni4_3_5_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist3_sync_in_aunroll_x_in_c0_eni4_3_5_rdcnt_eq <= '1';
            ELSE
                redist3_sync_in_aunroll_x_in_c0_eni4_3_5_rdcnt_eq <= '0';
            END IF;
            IF (redist3_sync_in_aunroll_x_in_c0_eni4_3_5_rdcnt_eq = '1') THEN
                redist3_sync_in_aunroll_x_in_c0_eni4_3_5_rdcnt_i <= redist3_sync_in_aunroll_x_in_c0_eni4_3_5_rdcnt_i + 2;
            ELSE
                redist3_sync_in_aunroll_x_in_c0_eni4_3_5_rdcnt_i <= redist3_sync_in_aunroll_x_in_c0_eni4_3_5_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist3_sync_in_aunroll_x_in_c0_eni4_3_5_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist3_sync_in_aunroll_x_in_c0_eni4_3_5_rdcnt_i, 2)));

    -- redist3_sync_in_aunroll_x_in_c0_eni4_3_5_wraddr(REG,99)
    redist3_sync_in_aunroll_x_in_c0_eni4_3_5_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_sync_in_aunroll_x_in_c0_eni4_3_5_wraddr_q <= "10";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist3_sync_in_aunroll_x_in_c0_eni4_3_5_wraddr_q <= STD_LOGIC_VECTOR(redist3_sync_in_aunroll_x_in_c0_eni4_3_5_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist3_sync_in_aunroll_x_in_c0_eni4_3_5_mem(DUALMEM,97)
    redist3_sync_in_aunroll_x_in_c0_eni4_3_5_mem_ia <= STD_LOGIC_VECTOR(in_c0_eni4_3);
    redist3_sync_in_aunroll_x_in_c0_eni4_3_5_mem_aa <= redist3_sync_in_aunroll_x_in_c0_eni4_3_5_wraddr_q;
    redist3_sync_in_aunroll_x_in_c0_eni4_3_5_mem_ab <= redist3_sync_in_aunroll_x_in_c0_eni4_3_5_rdcnt_q;
    redist3_sync_in_aunroll_x_in_c0_eni4_3_5_mem_reset0 <= not (resetn);
    redist3_sync_in_aunroll_x_in_c0_eni4_3_5_mem_dmem : altera_syncram
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
        clocken1 => redist3_sync_in_aunroll_x_in_c0_eni4_3_5_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist3_sync_in_aunroll_x_in_c0_eni4_3_5_mem_reset0,
        clock1 => clock,
        address_a => redist3_sync_in_aunroll_x_in_c0_eni4_3_5_mem_aa,
        data_a => redist3_sync_in_aunroll_x_in_c0_eni4_3_5_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist3_sync_in_aunroll_x_in_c0_eni4_3_5_mem_ab,
        q_b => redist3_sync_in_aunroll_x_in_c0_eni4_3_5_mem_iq
    );
    redist3_sync_in_aunroll_x_in_c0_eni4_3_5_mem_q <= redist3_sync_in_aunroll_x_in_c0_eni4_3_5_mem_iq(31 downto 0);

    -- redist3_sync_in_aunroll_x_in_c0_eni4_3_5_outputreg(DELAY,96)
    redist3_sync_in_aunroll_x_in_c0_eni4_3_5_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist3_sync_in_aunroll_x_in_c0_eni4_3_5_mem_q, xout => redist3_sync_in_aunroll_x_in_c0_eni4_3_5_outputreg_q, clk => clock, aclr => resetn );

    -- i_add_maxpool2d(ADD,26)@1
    i_add_maxpool2d_a <= STD_LOGIC_VECTOR("0" & in_c0_eni4_1);
    i_add_maxpool2d_b <= STD_LOGIC_VECTOR("0" & in_c0_eni4_2);
    i_add_maxpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_maxpool2d_a) + UNSIGNED(i_add_maxpool2d_b));
    i_add_maxpool2d_q <= i_add_maxpool2d_o(32 downto 0);

    -- bgTrunc_i_add_maxpool2d_sel_x(BITSELECT,3)@1
    bgTrunc_i_add_maxpool2d_sel_x_b <= i_add_maxpool2d_q(31 downto 0);

    -- redist10_bgTrunc_i_add_maxpool2d_sel_x_b_1(DELAY,94)
    redist10_bgTrunc_i_add_maxpool2d_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add_maxpool2d_sel_x_b, xout => redist10_bgTrunc_i_add_maxpool2d_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_mul23_maxpool2d_bs4(BITSELECT,62)@2
    i_mul23_maxpool2d_bs4_in <= STD_LOGIC_VECTOR(redist10_bgTrunc_i_add_maxpool2d_sel_x_b_1_q(17 downto 0));
    i_mul23_maxpool2d_bs4_b <= STD_LOGIC_VECTOR(i_mul23_maxpool2d_bs4_in(17 downto 0));

    -- i_mul23_maxpool2d_bjA5(BITJOIN,63)@2
    i_mul23_maxpool2d_bjA5_q <= GND_q & i_mul23_maxpool2d_bs4_b;

    -- i_syncbuf_input_size_sync_buffer1_maxpool2d(BLACKBOX,33)@0
    -- in in_i_dependence@2
    -- in in_valid_in@2
    -- out out_buffer_out@2
    -- out out_valid_out@2
    thei_syncbuf_input_size_sync_buffer1_maxpool2d : i_syncbuf_input_size_sync_buffer1_maxpool2d20
    PORT MAP (
        in_buffer_in => in_input_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist5_sync_in_aunroll_x_in_i_valid_1_q,
        out_buffer_out => i_syncbuf_input_size_sync_buffer1_maxpool2d_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_mul23_maxpool2d_bs2_merged_bit_select(BITSELECT,83)@2
    i_mul23_maxpool2d_bs2_merged_bit_select_b <= i_syncbuf_input_size_sync_buffer1_maxpool2d_out_buffer_out(17 downto 0);
    i_mul23_maxpool2d_bs2_merged_bit_select_c <= i_syncbuf_input_size_sync_buffer1_maxpool2d_out_buffer_out(31 downto 18);

    -- i_mul23_maxpool2d_bjB9(BITJOIN,67)@2
    i_mul23_maxpool2d_bjB9_q <= GND_q & i_mul23_maxpool2d_bs2_merged_bit_select_b;

    -- i_mul23_maxpool2d_bs7(BITSELECT,65)@2
    i_mul23_maxpool2d_bs7_b <= STD_LOGIC_VECTOR(redist10_bgTrunc_i_add_maxpool2d_sel_x_b_1_q(31 downto 18));

    -- i_mul23_maxpool2d_ma3_cma(CHAINMULTADD,81)@2 + 2
    i_mul23_maxpool2d_ma3_cma_reset <= not (resetn);
    i_mul23_maxpool2d_ma3_cma_ena0 <= '1';
    i_mul23_maxpool2d_ma3_cma_ena1 <= i_mul23_maxpool2d_ma3_cma_ena0;
    i_mul23_maxpool2d_ma3_cma_l(0) <= SIGNED(RESIZE(i_mul23_maxpool2d_ma3_cma_a0(0),15));
    i_mul23_maxpool2d_ma3_cma_l(1) <= SIGNED(RESIZE(i_mul23_maxpool2d_ma3_cma_a0(1),15));
    i_mul23_maxpool2d_ma3_cma_p(0) <= i_mul23_maxpool2d_ma3_cma_l(0) * i_mul23_maxpool2d_ma3_cma_c0(0);
    i_mul23_maxpool2d_ma3_cma_p(1) <= i_mul23_maxpool2d_ma3_cma_l(1) * i_mul23_maxpool2d_ma3_cma_c0(1);
    i_mul23_maxpool2d_ma3_cma_u(0) <= RESIZE(i_mul23_maxpool2d_ma3_cma_p(0),35);
    i_mul23_maxpool2d_ma3_cma_u(1) <= RESIZE(i_mul23_maxpool2d_ma3_cma_p(1),35);
    i_mul23_maxpool2d_ma3_cma_w(0) <= i_mul23_maxpool2d_ma3_cma_u(0) + i_mul23_maxpool2d_ma3_cma_u(1);
    i_mul23_maxpool2d_ma3_cma_x(0) <= i_mul23_maxpool2d_ma3_cma_w(0);
    i_mul23_maxpool2d_ma3_cma_y(0) <= i_mul23_maxpool2d_ma3_cma_x(0);
    i_mul23_maxpool2d_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul23_maxpool2d_ma3_cma_a0 <= (others => (others => '0'));
            i_mul23_maxpool2d_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul23_maxpool2d_ma3_cma_ena0 = '1') THEN
                i_mul23_maxpool2d_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_mul23_maxpool2d_bs7_b),14);
                i_mul23_maxpool2d_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_mul23_maxpool2d_bs2_merged_bit_select_c),14);
                i_mul23_maxpool2d_ma3_cma_c0(0) <= RESIZE(SIGNED(i_mul23_maxpool2d_bjB9_q),19);
                i_mul23_maxpool2d_ma3_cma_c0(1) <= RESIZE(SIGNED(i_mul23_maxpool2d_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_mul23_maxpool2d_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul23_maxpool2d_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul23_maxpool2d_ma3_cma_ena1 = '1') THEN
                i_mul23_maxpool2d_ma3_cma_s(0) <= i_mul23_maxpool2d_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul23_maxpool2d_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul23_maxpool2d_ma3_cma_s(0)(33 downto 0)), xout => i_mul23_maxpool2d_ma3_cma_qq, clk => clock, aclr => resetn );
    i_mul23_maxpool2d_ma3_cma_q <= STD_LOGIC_VECTOR(i_mul23_maxpool2d_ma3_cma_qq(33 downto 0));

    -- redist0_i_mul23_maxpool2d_ma3_cma_q_1(DELAY,84)
    redist0_i_mul23_maxpool2d_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul23_maxpool2d_ma3_cma_q, xout => redist0_i_mul23_maxpool2d_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul23_maxpool2d_align_14(BITSHIFT,72)@5
    i_mul23_maxpool2d_align_14_qint <= redist0_i_mul23_maxpool2d_ma3_cma_q_1_q & "000000000000000000";
    i_mul23_maxpool2d_align_14_q <= i_mul23_maxpool2d_align_14_qint(51 downto 0);

    -- i_mul23_maxpool2d_bs11(BITSELECT,69)@2
    i_mul23_maxpool2d_bs11_b <= redist10_bgTrunc_i_add_maxpool2d_sel_x_b_1_q(31 downto 18);

    -- i_mul23_maxpool2d_im10_cma(CHAINMULTADD,80)@2 + 2
    i_mul23_maxpool2d_im10_cma_reset <= not (resetn);
    i_mul23_maxpool2d_im10_cma_ena0 <= '1';
    i_mul23_maxpool2d_im10_cma_ena1 <= i_mul23_maxpool2d_im10_cma_ena0;
    i_mul23_maxpool2d_im10_cma_p(0) <= i_mul23_maxpool2d_im10_cma_a0(0) * i_mul23_maxpool2d_im10_cma_c0(0);
    i_mul23_maxpool2d_im10_cma_u(0) <= RESIZE(i_mul23_maxpool2d_im10_cma_p(0),28);
    i_mul23_maxpool2d_im10_cma_w(0) <= i_mul23_maxpool2d_im10_cma_u(0);
    i_mul23_maxpool2d_im10_cma_x(0) <= i_mul23_maxpool2d_im10_cma_w(0);
    i_mul23_maxpool2d_im10_cma_y(0) <= i_mul23_maxpool2d_im10_cma_x(0);
    i_mul23_maxpool2d_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul23_maxpool2d_im10_cma_a0 <= (others => (others => '0'));
            i_mul23_maxpool2d_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul23_maxpool2d_im10_cma_ena0 = '1') THEN
                i_mul23_maxpool2d_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_mul23_maxpool2d_bs11_b),14);
                i_mul23_maxpool2d_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_mul23_maxpool2d_bs2_merged_bit_select_c),14);
            END IF;
        END IF;
    END PROCESS;
    i_mul23_maxpool2d_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul23_maxpool2d_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul23_maxpool2d_im10_cma_ena1 = '1') THEN
                i_mul23_maxpool2d_im10_cma_s(0) <= i_mul23_maxpool2d_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul23_maxpool2d_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul23_maxpool2d_im10_cma_s(0)(27 downto 0)), xout => i_mul23_maxpool2d_im10_cma_qq, clk => clock, aclr => resetn );
    i_mul23_maxpool2d_im10_cma_q <= STD_LOGIC_VECTOR(i_mul23_maxpool2d_im10_cma_qq(27 downto 0));

    -- redist1_i_mul23_maxpool2d_im10_cma_q_1(DELAY,85)
    redist1_i_mul23_maxpool2d_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul23_maxpool2d_im10_cma_q, xout => redist1_i_mul23_maxpool2d_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul23_maxpool2d_bs1(BITSELECT,59)@2
    i_mul23_maxpool2d_bs1_in <= redist10_bgTrunc_i_add_maxpool2d_sel_x_b_1_q(17 downto 0);
    i_mul23_maxpool2d_bs1_b <= i_mul23_maxpool2d_bs1_in(17 downto 0);

    -- i_mul23_maxpool2d_im0_cma(CHAINMULTADD,79)@2 + 2
    i_mul23_maxpool2d_im0_cma_reset <= not (resetn);
    i_mul23_maxpool2d_im0_cma_ena0 <= '1';
    i_mul23_maxpool2d_im0_cma_ena1 <= i_mul23_maxpool2d_im0_cma_ena0;
    i_mul23_maxpool2d_im0_cma_p(0) <= i_mul23_maxpool2d_im0_cma_a0(0) * i_mul23_maxpool2d_im0_cma_c0(0);
    i_mul23_maxpool2d_im0_cma_u(0) <= RESIZE(i_mul23_maxpool2d_im0_cma_p(0),36);
    i_mul23_maxpool2d_im0_cma_w(0) <= i_mul23_maxpool2d_im0_cma_u(0);
    i_mul23_maxpool2d_im0_cma_x(0) <= i_mul23_maxpool2d_im0_cma_w(0);
    i_mul23_maxpool2d_im0_cma_y(0) <= i_mul23_maxpool2d_im0_cma_x(0);
    i_mul23_maxpool2d_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul23_maxpool2d_im0_cma_a0 <= (others => (others => '0'));
            i_mul23_maxpool2d_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul23_maxpool2d_im0_cma_ena0 = '1') THEN
                i_mul23_maxpool2d_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_mul23_maxpool2d_bs1_b),18);
                i_mul23_maxpool2d_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_mul23_maxpool2d_bs2_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_mul23_maxpool2d_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul23_maxpool2d_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul23_maxpool2d_im0_cma_ena1 = '1') THEN
                i_mul23_maxpool2d_im0_cma_s(0) <= i_mul23_maxpool2d_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul23_maxpool2d_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul23_maxpool2d_im0_cma_s(0)(35 downto 0)), xout => i_mul23_maxpool2d_im0_cma_qq, clk => clock, aclr => resetn );
    i_mul23_maxpool2d_im0_cma_q <= STD_LOGIC_VECTOR(i_mul23_maxpool2d_im0_cma_qq(35 downto 0));

    -- redist2_i_mul23_maxpool2d_im0_cma_q_1(DELAY,86)
    redist2_i_mul23_maxpool2d_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul23_maxpool2d_im0_cma_q, xout => redist2_i_mul23_maxpool2d_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul23_maxpool2d_join_13(BITJOIN,71)@5
    i_mul23_maxpool2d_join_13_q <= redist1_i_mul23_maxpool2d_im10_cma_q_1_q & redist2_i_mul23_maxpool2d_im0_cma_q_1_q;

    -- i_mul23_maxpool2d_result_add_0_0(ADD,74)@5
    i_mul23_maxpool2d_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_mul23_maxpool2d_join_13_q));
    i_mul23_maxpool2d_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_mul23_maxpool2d_align_14_q(51)) & i_mul23_maxpool2d_align_14_q));
    i_mul23_maxpool2d_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_mul23_maxpool2d_result_add_0_0_a) + SIGNED(i_mul23_maxpool2d_result_add_0_0_b));
    i_mul23_maxpool2d_result_add_0_0_q <= i_mul23_maxpool2d_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_mul23_maxpool2d_rnd_sel(BITSELECT,56)@5
    bgTrunc_i_mul23_maxpool2d_rnd_sel_in <= i_mul23_maxpool2d_result_add_0_0_q(63 downto 0);
    bgTrunc_i_mul23_maxpool2d_rnd_sel_b <= bgTrunc_i_mul23_maxpool2d_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_mul23_maxpool2d_sel_x(BITSELECT,5)@5
    bgTrunc_i_mul23_maxpool2d_sel_x_b <= bgTrunc_i_mul23_maxpool2d_rnd_sel_b(31 downto 0);

    -- redist8_bgTrunc_i_mul23_maxpool2d_sel_x_b_1(DELAY,92)
    redist8_bgTrunc_i_mul23_maxpool2d_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_mul23_maxpool2d_sel_x_b, xout => redist8_bgTrunc_i_mul23_maxpool2d_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_add25_maxpool2d(ADD,25)@6
    i_add25_maxpool2d_a <= STD_LOGIC_VECTOR("0" & redist8_bgTrunc_i_mul23_maxpool2d_sel_x_b_1_q);
    i_add25_maxpool2d_b <= STD_LOGIC_VECTOR("0" & redist3_sync_in_aunroll_x_in_c0_eni4_3_5_outputreg_q);
    i_add25_maxpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add25_maxpool2d_a) + UNSIGNED(i_add25_maxpool2d_b));
    i_add25_maxpool2d_q <= i_add25_maxpool2d_o(32 downto 0);

    -- bgTrunc_i_add25_maxpool2d_sel_x(BITSELECT,2)@6
    bgTrunc_i_add25_maxpool2d_sel_x_b <= i_add25_maxpool2d_q(31 downto 0);

    -- redist11_bgTrunc_i_add25_maxpool2d_sel_x_b_1(DELAY,95)
    redist11_bgTrunc_i_add25_maxpool2d_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add25_maxpool2d_sel_x_b, xout => redist11_bgTrunc_i_add25_maxpool2d_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_idxprom_maxpool2d_sel_x(BITSELECT,17)@7
    i_idxprom_maxpool2d_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist11_bgTrunc_i_add25_maxpool2d_sel_x_b_1_q(31 downto 0)), 64)));

    -- i_add_ptr_sum_maxpool2d(ADD,27)@7
    i_add_ptr_sum_maxpool2d_a <= STD_LOGIC_VECTOR("0" & i_idxprom_maxpool2d_sel_x_b);
    i_add_ptr_sum_maxpool2d_b <= STD_LOGIC_VECTOR("0" & redist4_sync_in_aunroll_x_in_c0_eni4_4_6_outputreg_q);
    i_add_ptr_sum_maxpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_ptr_sum_maxpool2d_a) + UNSIGNED(i_add_ptr_sum_maxpool2d_b));
    i_add_ptr_sum_maxpool2d_q <= i_add_ptr_sum_maxpool2d_o(64 downto 0);

    -- bgTrunc_i_add_ptr_sum_maxpool2d_sel_x(BITSELECT,4)@7
    bgTrunc_i_add_ptr_sum_maxpool2d_sel_x_b <= i_add_ptr_sum_maxpool2d_q(63 downto 0);

    -- redist9_bgTrunc_i_add_ptr_sum_maxpool2d_sel_x_b_1(DELAY,93)
    redist9_bgTrunc_i_add_ptr_sum_maxpool2d_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add_ptr_sum_maxpool2d_sel_x_b, xout => redist9_bgTrunc_i_add_ptr_sum_maxpool2d_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_arrayidx_maxpool2d_maxpool2d24_mult_x_bs1_merged_bit_select(BITSELECT,82)@8
    i_arrayidx_maxpool2d_maxpool2d24_mult_x_bs1_merged_bit_select_b <= redist9_bgTrunc_i_add_ptr_sum_maxpool2d_sel_x_b_1_q(17 downto 0);
    i_arrayidx_maxpool2d_maxpool2d24_mult_x_bs1_merged_bit_select_c <= redist9_bgTrunc_i_add_ptr_sum_maxpool2d_sel_x_b_1_q(63 downto 54);
    i_arrayidx_maxpool2d_maxpool2d24_mult_x_bs1_merged_bit_select_d <= redist9_bgTrunc_i_add_ptr_sum_maxpool2d_sel_x_b_1_q(35 downto 18);
    i_arrayidx_maxpool2d_maxpool2d24_mult_x_bs1_merged_bit_select_e <= redist9_bgTrunc_i_add_ptr_sum_maxpool2d_sel_x_b_1_q(53 downto 36);

    -- i_arrayidx_maxpool2d_maxpool2d24_mult_x_im3_shift0(BITSHIFT,76)@8
    i_arrayidx_maxpool2d_maxpool2d24_mult_x_im3_shift0_qint <= i_arrayidx_maxpool2d_maxpool2d24_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx_maxpool2d_maxpool2d24_mult_x_im3_shift0_q <= i_arrayidx_maxpool2d_maxpool2d24_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx_maxpool2d_maxpool2d24_mult_x_align_15(BITSHIFT,50)@8
    i_arrayidx_maxpool2d_maxpool2d24_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_maxpool2d_maxpool2d24_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx_maxpool2d_maxpool2d24_mult_x_align_15_q <= i_arrayidx_maxpool2d_maxpool2d24_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx_maxpool2d_maxpool2d24_mult_x_im6_shift0(BITSHIFT,77)@8
    i_arrayidx_maxpool2d_maxpool2d24_mult_x_im6_shift0_qint <= i_arrayidx_maxpool2d_maxpool2d24_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx_maxpool2d_maxpool2d24_mult_x_im6_shift0_q <= i_arrayidx_maxpool2d_maxpool2d24_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx_maxpool2d_maxpool2d24_mult_x_align_14(BITSHIFT,49)@8
    i_arrayidx_maxpool2d_maxpool2d24_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_maxpool2d_maxpool2d24_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx_maxpool2d_maxpool2d24_mult_x_align_14_q <= i_arrayidx_maxpool2d_maxpool2d24_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx_maxpool2d_maxpool2d24_mult_x_join_16(BITJOIN,51)@8
    i_arrayidx_maxpool2d_maxpool2d24_mult_x_join_16_q <= i_arrayidx_maxpool2d_maxpool2d24_mult_x_align_15_q & i_arrayidx_maxpool2d_maxpool2d24_mult_x_align_14_q;

    -- i_arrayidx_maxpool2d_maxpool2d24_mult_x_im9_shift0(BITSHIFT,78)@8
    i_arrayidx_maxpool2d_maxpool2d24_mult_x_im9_shift0_qint <= i_arrayidx_maxpool2d_maxpool2d24_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx_maxpool2d_maxpool2d24_mult_x_im9_shift0_q <= i_arrayidx_maxpool2d_maxpool2d24_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx_maxpool2d_maxpool2d24_mult_x_align_12(BITSHIFT,47)@8
    i_arrayidx_maxpool2d_maxpool2d24_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_maxpool2d_maxpool2d24_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx_maxpool2d_maxpool2d24_mult_x_align_12_q <= i_arrayidx_maxpool2d_maxpool2d24_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx_maxpool2d_maxpool2d24_mult_x_im0_shift0(BITSHIFT,75)@8
    i_arrayidx_maxpool2d_maxpool2d24_mult_x_im0_shift0_qint <= i_arrayidx_maxpool2d_maxpool2d24_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx_maxpool2d_maxpool2d24_mult_x_im0_shift0_q <= i_arrayidx_maxpool2d_maxpool2d24_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx_maxpool2d_maxpool2d24_mult_x_join_13(BITJOIN,48)@8
    i_arrayidx_maxpool2d_maxpool2d24_mult_x_join_13_q <= i_arrayidx_maxpool2d_maxpool2d24_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx_maxpool2d_maxpool2d24_mult_x_im0_shift0_q);

    -- i_arrayidx_maxpool2d_maxpool2d24_mult_x_result_add_0_0(ADD,52)@8
    i_arrayidx_maxpool2d_maxpool2d24_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx_maxpool2d_maxpool2d24_mult_x_join_13_q);
    i_arrayidx_maxpool2d_maxpool2d24_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx_maxpool2d_maxpool2d24_mult_x_join_16_q);
    i_arrayidx_maxpool2d_maxpool2d24_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx_maxpool2d_maxpool2d24_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx_maxpool2d_maxpool2d24_mult_x_result_add_0_0_b));
    i_arrayidx_maxpool2d_maxpool2d24_mult_x_result_add_0_0_q <= i_arrayidx_maxpool2d_maxpool2d24_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx_maxpool2d_maxpool2d24_mult_extender_x(BITJOIN,10)@8
    i_arrayidx_maxpool2d_maxpool2d24_mult_extender_x_q <= i_arrayidx_maxpool2d_maxpool2d24_mult_multconst_x_q & i_arrayidx_maxpool2d_maxpool2d24_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx_maxpool2d_maxpool2d24_trunc_sel_x(BITSELECT,12)@8
    i_arrayidx_maxpool2d_maxpool2d24_trunc_sel_x_b <= i_arrayidx_maxpool2d_maxpool2d24_mult_extender_x_q(63 downto 0);

    -- redist7_i_arrayidx_maxpool2d_maxpool2d24_trunc_sel_x_b_1(DELAY,91)
    redist7_i_arrayidx_maxpool2d_maxpool2d24_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_arrayidx_maxpool2d_maxpool2d24_trunc_sel_x_b, xout => redist7_i_arrayidx_maxpool2d_maxpool2d24_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_input_im_sync_buffer_maxpool2d(BLACKBOX,32)@0
    -- in in_i_dependence@9
    -- in in_valid_in@9
    -- out out_buffer_out@9
    -- out out_valid_out@9
    thei_syncbuf_input_im_sync_buffer_maxpool2d : i_syncbuf_input_im_sync_buffer_maxpool2d22
    PORT MAP (
        in_buffer_in => in_input_im,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist6_sync_in_aunroll_x_in_i_valid_8_q,
        out_buffer_out => i_syncbuf_input_im_sync_buffer_maxpool2d_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx_maxpool2d_maxpool2d24_add_x(ADD,13)@9
    i_arrayidx_maxpool2d_maxpool2d24_add_x_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_input_im_sync_buffer_maxpool2d_out_buffer_out);
    i_arrayidx_maxpool2d_maxpool2d24_add_x_b <= STD_LOGIC_VECTOR("0" & redist7_i_arrayidx_maxpool2d_maxpool2d24_trunc_sel_x_b_1_q);
    i_arrayidx_maxpool2d_maxpool2d24_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx_maxpool2d_maxpool2d24_add_x_a) + UNSIGNED(i_arrayidx_maxpool2d_maxpool2d24_add_x_b));
    i_arrayidx_maxpool2d_maxpool2d24_add_x_q <= i_arrayidx_maxpool2d_maxpool2d24_add_x_o(64 downto 0);

    -- i_arrayidx_maxpool2d_maxpool2d24_dupName_0_trunc_sel_x(BITSELECT,7)@9
    i_arrayidx_maxpool2d_maxpool2d24_dupName_0_trunc_sel_x_b <= i_arrayidx_maxpool2d_maxpool2d24_add_x_q(63 downto 0);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,19)@9
    out_c0_exi19_0 <= GND_q;
    out_c0_exi19_1 <= i_arrayidx_maxpool2d_maxpool2d24_dupName_0_trunc_sel_x_b;
    out_o_valid <= redist6_sync_in_aunroll_x_in_i_valid_8_q;

END normal;
