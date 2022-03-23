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

-- VHDL created from bb_fc_B2_stall_region
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

entity bb_fc_B2_stall_region is
    port (
        in_lsu_unnamed_fc5_streset_stream_reset : in std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_unnamed_fc5_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        in_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe14 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_idxprom2 : in std_logic_vector(63 downto 0);  -- ufix64
        in_unnamed_fc4 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc5_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_fc5_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_sizex : in std_logic_vector(31 downto 0);  -- ufix32
        in_lsu_unnamed_fc5_sts_stream_size : in std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_fc5_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_fc5_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc5_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc5_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc5_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_fc5_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_fc5_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_fc_B2_stall_region;

architecture normal of bb_fc_B2_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc is
        port (
            in_c0_eni214_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni214_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni214_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_sizex : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit19_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit19_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_store_unnamed_fc5_fc53 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_writedata : in std_logic_vector(31 downto 0);  -- Floating Point
            in_lsu_unnamed_fc5_streset_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_fc5_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stream_base_addr : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_unnamed_fc5_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_fc5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc5_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_fc5_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_output_im_sync_buffer_fc50 is
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
    signal i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx27_fc_fc52_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx27_fc_fc52_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx27_fc_fc52_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx27_fc_fc52_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx27_fc_fc52_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx27_fc_fc52_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx27_fc_fc52_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_out_c0_exit19_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_fc5_fc_out_lsu_unnamed_fc5_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_fc5_fc_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_fc5_fc_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_fc5_fc_out_unnamed_fc5_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal i_store_unnamed_fc5_fc_out_unnamed_fc5_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_store_unnamed_fc5_fc_out_unnamed_fc5_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_unnamed_fc5_fc_out_unnamed_fc5_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_fc5_fc_out_unnamed_fc5_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_fc5_fc_out_unnamed_fc5_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_fc5_fc_out_unnamed_fc5_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_syncbuf_output_im_sync_buffer_fc_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_output_im_sync_buffer_fc_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_output_im_sync_buffer_fc_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx27_fc_fc52_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx27_fc_fc52_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx27_fc_fc52_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx27_fc_fc52_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx27_fc_fc52_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx27_fc_fc52_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx27_fc_fc52_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx27_fc_fc52_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx27_fc_fc52_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx27_fc_fc52_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx27_fc_fc52_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx27_fc_fc52_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx27_fc_fc52_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx27_fc_fc52_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx27_fc_fc52_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx27_fc_fc52_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx27_fc_fc52_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx27_fc_fc52_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx27_fc_fc52_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx27_fc_fc52_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx27_fc_fc52_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx27_fc_fc52_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx27_fc_fc52_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx27_fc_fc52_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_stall_entry_o5_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_output_im_sync_buffer_fc_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_output_im_sync_buffer_fc_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (127 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_fc5_fc_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_fc5_fc_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_fc5_fc_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_im_sync_buffer_fc_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_im_sync_buffer_fc_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_im_sync_buffer_fc_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_im_sync_buffer_fc_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o5_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o5_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o5_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o5_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o5_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o5_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_1_reg_stall_out_bitsignaltemp : std_logic;
    signal SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_D0 : STD_LOGIC_VECTOR (63 downto 0);

begin


    -- i_arrayidx27_fc_fc52_mult_multconst_x(CONSTANT,17)
    i_arrayidx27_fc_fc52_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist0_stall_entry_o5_1_0(REG,64)
    redist0_stall_entry_o5_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_stall_entry_o5_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o5_1_0_backEN = "1") THEN
                redist0_stall_entry_o5_1_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_c);
            END IF;
        END IF;
    END PROCESS;

    -- i_arrayidx27_fc_fc52_mult_x_bs1_merged_bit_select(BITSELECT,60)@1
    i_arrayidx27_fc_fc52_mult_x_bs1_merged_bit_select_b <= redist0_stall_entry_o5_1_0_q(17 downto 0);
    i_arrayidx27_fc_fc52_mult_x_bs1_merged_bit_select_c <= redist0_stall_entry_o5_1_0_q(63 downto 54);
    i_arrayidx27_fc_fc52_mult_x_bs1_merged_bit_select_d <= redist0_stall_entry_o5_1_0_q(35 downto 18);
    i_arrayidx27_fc_fc52_mult_x_bs1_merged_bit_select_e <= redist0_stall_entry_o5_1_0_q(53 downto 36);

    -- i_arrayidx27_fc_fc52_mult_x_im3_shift0(BITSHIFT,57)@1
    i_arrayidx27_fc_fc52_mult_x_im3_shift0_qint <= i_arrayidx27_fc_fc52_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx27_fc_fc52_mult_x_im3_shift0_q <= i_arrayidx27_fc_fc52_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx27_fc_fc52_mult_x_align_15(BITSHIFT,53)@1
    i_arrayidx27_fc_fc52_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx27_fc_fc52_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx27_fc_fc52_mult_x_align_15_q <= i_arrayidx27_fc_fc52_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx27_fc_fc52_mult_x_im6_shift0(BITSHIFT,58)@1
    i_arrayidx27_fc_fc52_mult_x_im6_shift0_qint <= i_arrayidx27_fc_fc52_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx27_fc_fc52_mult_x_im6_shift0_q <= i_arrayidx27_fc_fc52_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx27_fc_fc52_mult_x_align_14(BITSHIFT,52)@1
    i_arrayidx27_fc_fc52_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx27_fc_fc52_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx27_fc_fc52_mult_x_align_14_q <= i_arrayidx27_fc_fc52_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx27_fc_fc52_mult_x_join_16(BITJOIN,54)@1
    i_arrayidx27_fc_fc52_mult_x_join_16_q <= i_arrayidx27_fc_fc52_mult_x_align_15_q & i_arrayidx27_fc_fc52_mult_x_align_14_q;

    -- i_arrayidx27_fc_fc52_mult_x_im9_shift0(BITSHIFT,59)@1
    i_arrayidx27_fc_fc52_mult_x_im9_shift0_qint <= i_arrayidx27_fc_fc52_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx27_fc_fc52_mult_x_im9_shift0_q <= i_arrayidx27_fc_fc52_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx27_fc_fc52_mult_x_align_12(BITSHIFT,50)@1
    i_arrayidx27_fc_fc52_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx27_fc_fc52_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx27_fc_fc52_mult_x_align_12_q <= i_arrayidx27_fc_fc52_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx27_fc_fc52_mult_x_im0_shift0(BITSHIFT,56)@1
    i_arrayidx27_fc_fc52_mult_x_im0_shift0_qint <= i_arrayidx27_fc_fc52_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx27_fc_fc52_mult_x_im0_shift0_q <= i_arrayidx27_fc_fc52_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx27_fc_fc52_mult_x_join_13(BITJOIN,51)@1
    i_arrayidx27_fc_fc52_mult_x_join_13_q <= i_arrayidx27_fc_fc52_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx27_fc_fc52_mult_x_im0_shift0_q);

    -- i_arrayidx27_fc_fc52_mult_x_result_add_0_0(ADD,55)@1
    i_arrayidx27_fc_fc52_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx27_fc_fc52_mult_x_join_13_q);
    i_arrayidx27_fc_fc52_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx27_fc_fc52_mult_x_join_16_q);
    i_arrayidx27_fc_fc52_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx27_fc_fc52_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx27_fc_fc52_mult_x_result_add_0_0_b));
    i_arrayidx27_fc_fc52_mult_x_result_add_0_0_q <= i_arrayidx27_fc_fc52_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx27_fc_fc52_mult_extender_x(BITJOIN,16)@1
    i_arrayidx27_fc_fc52_mult_extender_x_q <= i_arrayidx27_fc_fc52_mult_multconst_x_q & i_arrayidx27_fc_fc52_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx27_fc_fc52_trunc_sel_x(BITSELECT,18)@1
    i_arrayidx27_fc_fc52_trunc_sel_x_b <= i_arrayidx27_fc_fc52_mult_extender_x_q(63 downto 0);

    -- redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0(REG,65)
    redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(i_arrayidx27_fc_fc52_trunc_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_syncbuf_output_im_sync_buffer_fc(BITJOIN,76)
    bubble_join_i_syncbuf_output_im_sync_buffer_fc_q <= i_syncbuf_output_im_sync_buffer_fc_out_buffer_out;

    -- bubble_select_i_syncbuf_output_im_sync_buffer_fc(BITSELECT,77)
    bubble_select_i_syncbuf_output_im_sync_buffer_fc_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_output_im_sync_buffer_fc_q(63 downto 0));

    -- i_arrayidx27_fc_fc52_add_x(ADD,19)@2
    i_arrayidx27_fc_fc52_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_output_im_sync_buffer_fc_b);
    i_arrayidx27_fc_fc52_add_x_b <= STD_LOGIC_VECTOR("0" & redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_q);
    i_arrayidx27_fc_fc52_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx27_fc_fc52_add_x_a) + UNSIGNED(i_arrayidx27_fc_fc52_add_x_b));
    i_arrayidx27_fc_fc52_add_x_q <= i_arrayidx27_fc_fc52_add_x_o(64 downto 0);

    -- i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x(BITSELECT,13)@2
    i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b <= i_arrayidx27_fc_fc52_add_x_q(63 downto 0);

    -- redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0(REG,66)
    redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_backEN = "1") THEN
                redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_q <= STD_LOGIC_VECTOR(SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1(REG,67)
    redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_backEN = "1") THEN
                redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_q <= STD_LOGIC_VECTOR(redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2(REG,68)
    redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_backEN = "1") THEN
                redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_q <= STD_LOGIC_VECTOR(SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3(REG,69)
    redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_backEN = "1") THEN
                redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_q <= STD_LOGIC_VECTOR(redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4(STALLENABLE,112)
    -- Valid signal propagation
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_V0 <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_R_v_0;
    -- Stall signal propagation
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_s_tv_0 <= SE_out_i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_backStall and SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_R_v_0;
    -- Backward Enable generation
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_backEN <= not (SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_v_s_0 <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_backEN and SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_V;
    -- Backward Stall generation
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_backStall <= not (SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_backEN);
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_backEN = "0") THEN
                SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_R_v_0 <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_R_v_0 and SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_s_tv_0;
            ELSE
                SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_R_v_0 <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4(STALLREG,134)
    SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_r_valid <= (others => '0');
            SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_r_valid <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_backStall and (SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_r_valid or SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_i_valid);

            IF (SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_r_data0 <= STD_LOGIC_VECTOR(redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_i_valid <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_V0;
    -- Stall signal propagation
    SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_backStall <= SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_r_valid or not (SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_i_valid);

    -- Valid
    SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_V <= SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_r_valid WHEN SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_r_valid = "1" ELSE SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_i_valid;

    SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_D0 <= SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_r_data0 WHEN SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_r_valid = "1" ELSE redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_q;

    -- SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3(STALLENABLE,111)
    -- Valid signal propagation
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_V0 <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_R_v_0;
    -- Stall signal propagation
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_s_tv_0 <= SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_backStall and SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_R_v_0;
    -- Backward Enable generation
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_backEN <= not (SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_v_s_0 <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_backEN and SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_V0;
    -- Backward Stall generation
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_backStall <= not (SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_v_s_0);
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_backEN = "0") THEN
                SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_R_v_0 <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_R_v_0 and SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_s_tv_0;
            ELSE
                SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_R_v_0 <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2(STALLENABLE,110)
    -- Valid signal propagation
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_V0 <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_R_v_0;
    -- Stall signal propagation
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_s_tv_0 <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_3_backStall and SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_R_v_0;
    -- Backward Enable generation
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_backEN <= not (SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_v_s_0 <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_backEN and SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_V;
    -- Backward Stall generation
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_backStall <= not (SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_backEN);
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_backEN = "0") THEN
                SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_R_v_0 <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_R_v_0 and SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_s_tv_0;
            ELSE
                SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_R_v_0 <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2(STALLREG,133)
    SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_r_valid <= (others => '0');
            SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_r_valid <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_backStall and (SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_r_valid or SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_i_valid);

            IF (SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_r_data0 <= STD_LOGIC_VECTOR(redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_i_valid <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_V0;
    -- Stall signal propagation
    SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_backStall <= SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_r_valid or not (SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_i_valid);

    -- Valid
    SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_V <= SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_r_valid WHEN SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_r_valid = "1" ELSE SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_i_valid;

    SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_D0 <= SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_r_data0 WHEN SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_r_valid = "1" ELSE redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_q;

    -- SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1(STALLENABLE,109)
    -- Valid signal propagation
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_V0 <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_R_v_0;
    -- Stall signal propagation
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_s_tv_0 <= SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_2_backStall and SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_R_v_0;
    -- Backward Enable generation
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_backEN <= not (SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_v_s_0 <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_backEN and SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_V0;
    -- Backward Stall generation
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_backStall <= not (SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_v_s_0);
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_backEN = "0") THEN
                SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_R_v_0 <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_R_v_0 and SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_s_tv_0;
            ELSE
                SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_R_v_0 <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0(STALLENABLE,108)
    -- Valid signal propagation
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_V0 <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_R_v_0;
    -- Stall signal propagation
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_s_tv_0 <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_1_backStall and SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_R_v_0;
    -- Backward Enable generation
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_backEN <= not (SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_v_s_0 <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_backEN and SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_V;
    -- Backward Stall generation
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_backStall <= not (SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_backEN);
    SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_backEN = "0") THEN
                SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_R_v_0 <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_R_v_0 and SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_s_tv_0;
            ELSE
                SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_R_v_0 <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0(STALLREG,132)
    SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_r_valid <= (others => '0');
            SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_r_valid <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_backStall and (SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_r_valid or SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_i_valid);

            IF (SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_r_data0 <= STD_LOGIC_VECTOR(i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_i_valid <= SE_out_i_syncbuf_output_im_sync_buffer_fc_V0;
    -- Stall signal propagation
    SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_backStall <= SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_r_valid or not (SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_i_valid);

    -- Valid
    SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_V <= SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_r_valid WHEN SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_r_valid = "1" ELSE SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_i_valid;

    SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_D0 <= SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_r_data0 WHEN SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_r_valid = "1" ELSE i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b;

    -- SE_out_bubble_out_stall_entry_1(STALLENABLE,128)
    -- Valid signal propagation
    SE_out_bubble_out_stall_entry_1_V0 <= SE_out_bubble_out_stall_entry_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_stall_entry_1_backStall <= i_syncbuf_output_im_sync_buffer_fc_out_stall_out or not (SE_out_bubble_out_stall_entry_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_stall_entry_1_wireValid <= bubble_out_stall_entry_1_reg_valid_out;

    -- i_syncbuf_output_im_sync_buffer_fc(BLACKBOX,30)@2
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_output_im_sync_buffer_fc : i_syncbuf_output_im_sync_buffer_fc50
    PORT MAP (
        in_buffer_in => in_output_im,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_output_im_sync_buffer_fc_backStall,
        in_valid_in => SE_out_bubble_out_stall_entry_1_V0,
        out_buffer_out => i_syncbuf_output_im_sync_buffer_fc_out_buffer_out,
        out_stall_out => i_syncbuf_output_im_sync_buffer_fc_out_stall_out,
        out_valid_out => i_syncbuf_output_im_sync_buffer_fc_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_output_im_sync_buffer_fc(STALLENABLE,92)
    -- Valid signal propagation
    SE_out_i_syncbuf_output_im_sync_buffer_fc_V0 <= SE_out_i_syncbuf_output_im_sync_buffer_fc_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_output_im_sync_buffer_fc_backStall <= SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_0_backStall or not (SE_out_i_syncbuf_output_im_sync_buffer_fc_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_output_im_sync_buffer_fc_and0 <= i_syncbuf_output_im_sync_buffer_fc_out_valid_out;
    SE_out_i_syncbuf_output_im_sync_buffer_fc_wireValid <= SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_V0 and SE_out_i_syncbuf_output_im_sync_buffer_fc_and0;

    -- SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0(STALLENABLE,107)
    -- Valid signal propagation
    SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_V0 <= SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_s_tv_0 <= SE_out_i_syncbuf_output_im_sync_buffer_fc_backStall and SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_backEN <= not (SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_v_s_0 <= SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_backEN and SE_redist0_stall_entry_o5_1_0_V0;
    -- Backward Stall generation
    SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_backStall <= not (SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_v_s_0);
    SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_R_v_0 <= SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_R_v_0 and SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_R_v_0 <= SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_stall_entry_o5_1_0(STALLENABLE,106)
    -- Valid signal propagation
    SE_redist0_stall_entry_o5_1_0_V0 <= SE_redist0_stall_entry_o5_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist0_stall_entry_o5_1_0_s_tv_0 <= SE_redist1_i_arrayidx27_fc_fc52_trunc_sel_x_b_1_0_backStall and SE_redist0_stall_entry_o5_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist0_stall_entry_o5_1_0_backEN <= not (SE_redist0_stall_entry_o5_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_stall_entry_o5_1_0_v_s_0 <= SE_redist0_stall_entry_o5_1_0_backEN and SE_stall_entry_V1;
    -- Backward Stall generation
    SE_redist0_stall_entry_o5_1_0_backStall <= not (SE_redist0_stall_entry_o5_1_0_v_s_0);
    SE_redist0_stall_entry_o5_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_stall_entry_o5_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o5_1_0_backEN = "0") THEN
                SE_redist0_stall_entry_o5_1_0_R_v_0 <= SE_redist0_stall_entry_o5_1_0_R_v_0 and SE_redist0_stall_entry_o5_1_0_s_tv_0;
            ELSE
                SE_redist0_stall_entry_o5_1_0_R_v_0 <= SE_redist0_stall_entry_o5_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_out_stall_entry_1_reg(STALLFIFO,131)
    bubble_out_stall_entry_1_reg_valid_in <= SE_stall_entry_V0;
    bubble_out_stall_entry_1_reg_stall_in <= SE_out_bubble_out_stall_entry_1_backStall;
    bubble_out_stall_entry_1_reg_valid_in_bitsignaltemp <= bubble_out_stall_entry_1_reg_valid_in(0);
    bubble_out_stall_entry_1_reg_stall_in_bitsignaltemp <= bubble_out_stall_entry_1_reg_stall_in(0);
    bubble_out_stall_entry_1_reg_valid_out(0) <= bubble_out_stall_entry_1_reg_valid_out_bitsignaltemp;
    bubble_out_stall_entry_1_reg_stall_out(0) <= bubble_out_stall_entry_1_reg_stall_out_bitsignaltemp;
    thebubble_out_stall_entry_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_stall_entry_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_stall_entry_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_stall_entry_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_stall_entry_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,93)
    SE_stall_entry_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_stall_entry_fromReg0 <= (others => '0');
            SE_stall_entry_fromReg1 <= (others => '0');
            SE_stall_entry_fromReg2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_stall_entry_fromReg0 <= SE_stall_entry_toReg0;
            -- Succesor 1
            SE_stall_entry_fromReg1 <= SE_stall_entry_toReg1;
            -- Succesor 2
            SE_stall_entry_fromReg2 <= SE_stall_entry_toReg2;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_stall_entry_consumed0 <= (not (bubble_out_stall_entry_1_reg_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg0;
    SE_stall_entry_consumed1 <= (not (SE_redist0_stall_entry_o5_1_0_backStall) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg1;
    SE_stall_entry_consumed2 <= (not (i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_out_o_stall) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg2;
    -- Consuming
    SE_stall_entry_StallValid <= SE_stall_entry_backStall and SE_stall_entry_wireValid;
    SE_stall_entry_toReg0 <= SE_stall_entry_StallValid and SE_stall_entry_consumed0;
    SE_stall_entry_toReg1 <= SE_stall_entry_StallValid and SE_stall_entry_consumed1;
    SE_stall_entry_toReg2 <= SE_stall_entry_StallValid and SE_stall_entry_consumed2;
    -- Backward Stall generation
    SE_stall_entry_or0 <= SE_stall_entry_consumed0;
    SE_stall_entry_or1 <= SE_stall_entry_consumed1 and SE_stall_entry_or0;
    SE_stall_entry_wireStall <= not (SE_stall_entry_consumed2 and SE_stall_entry_or1);
    SE_stall_entry_backStall <= SE_stall_entry_wireStall;
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg0);
    SE_stall_entry_V1 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg1);
    SE_stall_entry_V2 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg2);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,79)
    bubble_join_stall_entry_q <= in_unnamed_fc4 & in_idxprom2 & in_c1_exe14;

    -- bubble_select_stall_entry(BITSELECT,80)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(95 downto 32));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(127 downto 96));

    -- i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x(BLACKBOX,23)@0
    -- in in_i_stall@20000000
    -- out out_c0_exit19_0@7
    -- out out_c0_exit19_1@7
    -- out out_o_stall@20000000
    -- out out_o_valid@7
    thei_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x : i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc
    PORT MAP (
        in_c0_eni214_0 => GND_q,
        in_c0_eni214_1 => bubble_select_stall_entry_b,
        in_c0_eni214_2 => bubble_select_stall_entry_d,
        in_i_stall => SE_out_i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_backStall,
        in_i_valid => SE_stall_entry_V2,
        in_sizex => in_sizex,
        out_c0_exit19_1 => i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_out_c0_exit19_1,
        out_o_stall => i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x(BITJOIN,72)
    bubble_join_i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_q <= i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_out_c0_exit19_1;

    -- bubble_select_i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x(BITSELECT,73)
    bubble_select_i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_q(31 downto 0));

    -- SE_out_i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x(STALLENABLE,88)
    -- Valid signal propagation
    SE_out_i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_V0 <= SE_out_i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_backStall <= i_store_unnamed_fc5_fc_out_o_stall or not (SE_out_i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_and0 <= i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_out_o_valid;
    SE_out_i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_wireValid <= SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_V0 and SE_out_i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_and0;

    -- SE_out_i_store_unnamed_fc5_fc(STALLENABLE,90)
    -- Valid signal propagation
    SE_out_i_store_unnamed_fc5_fc_V0 <= SE_out_i_store_unnamed_fc5_fc_wireValid;
    -- Backward Stall generation
    SE_out_i_store_unnamed_fc5_fc_backStall <= in_stall_in or not (SE_out_i_store_unnamed_fc5_fc_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_store_unnamed_fc5_fc_wireValid <= i_store_unnamed_fc5_fc_out_o_valid;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4(REG,70)
    redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_backEN = "1") THEN
                redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_q <= STD_LOGIC_VECTOR(SR_SE_redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_D0);
            END IF;
        END IF;
    END PROCESS;

    -- i_store_unnamed_fc5_fc(BLACKBOX,29)@7
    -- in in_i_stall@20000000
    -- out out_lsu_unnamed_fc5_o_active@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@8
    -- out out_unnamed_fc5_avm_address@20000000
    -- out out_unnamed_fc5_avm_burstcount@20000000
    -- out out_unnamed_fc5_avm_byteenable@20000000
    -- out out_unnamed_fc5_avm_enable@20000000
    -- out out_unnamed_fc5_avm_read@20000000
    -- out out_unnamed_fc5_avm_write@20000000
    -- out out_unnamed_fc5_avm_writedata@20000000
    thei_store_unnamed_fc5_fc : i_store_unnamed_fc5_fc53
    PORT MAP (
        in_flush => in_flush,
        in_i_address => redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_q,
        in_i_predicate => GND_q,
        in_i_stall => SE_out_i_store_unnamed_fc5_fc_backStall,
        in_i_valid => SE_out_i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_V0,
        in_i_writedata => bubble_select_i_sfc_c0_for_end20_loopexit_loopexit_fc_c0_enter15_fc_aunroll_x_b,
        in_lsu_unnamed_fc5_streset_stream_reset => in_lsu_unnamed_fc5_streset_stream_reset,
        in_lsu_unnamed_fc5_sts_stream_size => in_lsu_unnamed_fc5_sts_stream_size,
        in_stream_base_addr => redist2_i_arrayidx27_fc_fc52_dupName_0_trunc_sel_x_b_5_4_q,
        in_unnamed_fc5_avm_readdata => in_unnamed_fc5_avm_readdata,
        in_unnamed_fc5_avm_readdatavalid => in_unnamed_fc5_avm_readdatavalid,
        in_unnamed_fc5_avm_waitrequest => in_unnamed_fc5_avm_waitrequest,
        in_unnamed_fc5_avm_writeack => in_unnamed_fc5_avm_writeack,
        out_lsu_unnamed_fc5_o_active => i_store_unnamed_fc5_fc_out_lsu_unnamed_fc5_o_active,
        out_o_stall => i_store_unnamed_fc5_fc_out_o_stall,
        out_o_valid => i_store_unnamed_fc5_fc_out_o_valid,
        out_unnamed_fc5_avm_address => i_store_unnamed_fc5_fc_out_unnamed_fc5_avm_address,
        out_unnamed_fc5_avm_burstcount => i_store_unnamed_fc5_fc_out_unnamed_fc5_avm_burstcount,
        out_unnamed_fc5_avm_byteenable => i_store_unnamed_fc5_fc_out_unnamed_fc5_avm_byteenable,
        out_unnamed_fc5_avm_enable => i_store_unnamed_fc5_fc_out_unnamed_fc5_avm_enable,
        out_unnamed_fc5_avm_read => i_store_unnamed_fc5_fc_out_unnamed_fc5_avm_read,
        out_unnamed_fc5_avm_write => i_store_unnamed_fc5_fc_out_unnamed_fc5_avm_write,
        out_unnamed_fc5_avm_writedata => i_store_unnamed_fc5_fc_out_unnamed_fc5_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,3)
    out_lsu_unnamed_fc5_o_active <= i_store_unnamed_fc5_fc_out_lsu_unnamed_fc5_o_active;

    -- dupName_0_sync_out_x(GPOUT,8)@8
    out_valid_out <= SE_out_i_store_unnamed_fc5_fc_V0;

    -- ext_sig_sync_out(GPOUT,28)
    out_unnamed_fc5_avm_address <= i_store_unnamed_fc5_fc_out_unnamed_fc5_avm_address;
    out_unnamed_fc5_avm_enable <= i_store_unnamed_fc5_fc_out_unnamed_fc5_avm_enable;
    out_unnamed_fc5_avm_read <= i_store_unnamed_fc5_fc_out_unnamed_fc5_avm_read;
    out_unnamed_fc5_avm_write <= i_store_unnamed_fc5_fc_out_unnamed_fc5_avm_write;
    out_unnamed_fc5_avm_writedata <= i_store_unnamed_fc5_fc_out_unnamed_fc5_avm_writedata;
    out_unnamed_fc5_avm_byteenable <= i_store_unnamed_fc5_fc_out_unnamed_fc5_avm_byteenable;
    out_unnamed_fc5_avm_burstcount <= i_store_unnamed_fc5_fc_out_unnamed_fc5_avm_burstcount;

    -- sync_out(GPOUT,37)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
