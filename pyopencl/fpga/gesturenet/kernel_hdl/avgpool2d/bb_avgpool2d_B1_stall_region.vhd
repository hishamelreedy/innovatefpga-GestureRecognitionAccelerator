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

-- VHDL created from bb_avgpool2d_B1_stall_region
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

entity bb_avgpool2d_B1_stall_region is
    port (
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe23 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe35 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe46 : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv_in : in std_logic_vector(32 downto 0);  -- ufix33
        in_global_id_09 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_03 : in std_logic_vector(31 downto 0);  -- ufix32
        in_tmp_02 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe17 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c0_exe23 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe35 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe46 : out std_logic_vector(0 downto 0);  -- ufix1
        out_exitcond_GUARD : out std_logic_vector(0 downto 0);  -- ufix1
        out_fpgaindvars_iv : out std_logic_vector(32 downto 0);  -- ufix33
        out_global_id_09 : out std_logic_vector(31 downto 0);  -- ufix32
        out_inc : out std_logic_vector(31 downto 0);  -- ufix32
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_avgpool2d0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_avgpool2d0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_avgpool2d0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_avgpool2d0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_avgpool2d0_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_avgpool2d0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_avgpool2d0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_avgpool2d0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_avgpool2d0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_avgpool2d0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_avgpool2d0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_avgpool2d_B1_stall_region;

architecture normal of bb_avgpool2d_B1_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component avgpool2d_B1_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_data_in_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_data_out_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_for_body_avgpool2d_c0_enter3_avgpool2d is
        port (
            in_c0_eni2_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni2_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit6_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit6_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_avgpool2d0_avgpool2d14 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_avgpool2d0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_avgpool2d0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_avgpool2d0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_avgpool2d0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d0_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_avgpool2d0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_input_im_sync_buffer_avgpool2d10 is
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
    signal avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (32 downto 0);
    signal avgpool2d_B1_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal avgpool2d_B1_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal avgpool2d_B1_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b : STD_LOGIC_VECTOR (32 downto 0);
    signal bgTrunc_i_inc_avgpool2d_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_idxprom_avgpool2d_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_body_avgpool2d_c0_enter3_avgpool2d_aunroll_x_out_c0_exit6_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_body_avgpool2d_c0_enter3_avgpool2d_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body_avgpool2d_c0_enter3_avgpool2d_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i33_1gr_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_ptr_sum_avgpool2d_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr_sum_avgpool2d_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr_sum_avgpool2d_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_add_ptr_sum_avgpool2d_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_exitcond_guard_avgpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_fpgaindvars_iv_avgpool2d_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_fpgaindvars_iv_avgpool2d_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_fpgaindvars_iv_avgpool2d_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_fpgaindvars_iv_avgpool2d_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_inc_avgpool2d_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_avgpool2d_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_avgpool2d_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_avgpool2d_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_load_unnamed_avgpool2d0_avgpool2d_out_o_readdata : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_avgpool2d0_avgpool2d_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_avgpool2d0_avgpool2d_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_avgpool2d0_avgpool2d_out_unnamed_avgpool2d0_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal i_load_unnamed_avgpool2d0_avgpool2d_out_unnamed_avgpool2d0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_unnamed_avgpool2d0_avgpool2d_out_unnamed_avgpool2d0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_avgpool2d0_avgpool2d_out_unnamed_avgpool2d0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_avgpool2d0_avgpool2d_out_unnamed_avgpool2d0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_avgpool2d0_avgpool2d_out_unnamed_avgpool2d0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_avgpool2d0_avgpool2d_out_unnamed_avgpool2d0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_syncbuf_input_im_sync_buffer_avgpool2d_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_input_im_sync_buffer_avgpool2d_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_im_sync_buffer_avgpool2d_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_exitcond1_avgpool2d_cmp_sign_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_avgpool2d_avgpool2d13_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_data_in : STD_LOGIC_VECTOR (32 downto 0);
    signal redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_data_out : STD_LOGIC_VECTOR (32 downto 0);
    signal redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_2_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_2_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_avgpool2d_B1_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (226 downto 0);
    signal bubble_select_avgpool2d_B1_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (32 downto 0);
    signal bubble_select_avgpool2d_B1_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_avgpool2d_B1_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_avgpool2d_B1_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_avgpool2d_B1_merge_reg_aunroll_x_f : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_avgpool2d_B1_merge_reg_aunroll_x_g : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_avgpool2d_B1_merge_reg_aunroll_x_h : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_avgpool2d_B1_merge_reg_aunroll_x_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_sfc_c0_for_body_avgpool2d_c0_enter3_avgpool2d_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_body_avgpool2d_c0_enter3_avgpool2d_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_load_unnamed_avgpool2d0_avgpool2d_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_unnamed_avgpool2d0_avgpool2d_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_input_im_sync_buffer_avgpool2d_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_input_im_sync_buffer_avgpool2d_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (226 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (32 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_q : STD_LOGIC_VECTOR (32 downto 0);
    signal bubble_select_redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_b : STD_LOGIC_VECTOR (32 downto 0);
    signal bubble_join_redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_or7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_avgpool2d_B1_merge_reg_aunroll_x_V8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_im_sync_buffer_avgpool2d_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_im_sync_buffer_avgpool2d_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_im_sync_buffer_avgpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_im_sync_buffer_avgpool2d_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp : std_logic;
    signal SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_D1 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_stall_entry(STALLENABLE,173)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= avgpool2d_B1_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,126)
    bubble_join_stall_entry_q <= in_tmp_02 & in_i_03 & in_global_id_09 & in_fpgaindvars_iv_in & in_c0_exe46 & in_c0_exe35 & in_c0_exe23 & in_c0_exe12;

    -- bubble_select_stall_entry(BITSELECT,127)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(95 downto 32));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(96 downto 96));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(97 downto 97));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(130 downto 98));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(162 downto 131));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(194 downto 163));
    bubble_select_stall_entry_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(226 downto 195));

    -- avgpool2d_B1_merge_reg_aunroll_x(BLACKBOX,2)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_data_out_2@1
    -- out out_data_out_3@1
    -- out out_data_out_4@1
    -- out out_data_out_5@1
    -- out out_data_out_6@1
    -- out out_data_out_7@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    theavgpool2d_B1_merge_reg_aunroll_x : avgpool2d_B1_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_f,
        in_data_in_1 => bubble_select_stall_entry_h,
        in_data_in_2 => bubble_select_stall_entry_i,
        in_data_in_3 => bubble_select_stall_entry_b,
        in_data_in_4 => bubble_select_stall_entry_c,
        in_data_in_5 => bubble_select_stall_entry_d,
        in_data_in_6 => bubble_select_stall_entry_e,
        in_data_in_7 => bubble_select_stall_entry_g,
        in_stall_in => SE_out_avgpool2d_B1_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => avgpool2d_B1_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3,
        out_data_out_4 => avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4,
        out_data_out_5 => avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5,
        out_data_out_6 => avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6,
        out_data_out_7 => avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7,
        out_stall_out => avgpool2d_B1_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => avgpool2d_B1_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_avgpool2d_B1_merge_reg_aunroll_x(BITJOIN,112)
    bubble_join_avgpool2d_B1_merge_reg_aunroll_x_q <= avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7 & avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6 & avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5 & avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4 & avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3 & avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2 & avgpool2d_B1_merge_reg_aunroll_x_out_data_out_1 & avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_avgpool2d_B1_merge_reg_aunroll_x(BITSELECT,113)
    bubble_select_avgpool2d_B1_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_avgpool2d_B1_merge_reg_aunroll_x_q(32 downto 0));
    bubble_select_avgpool2d_B1_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_avgpool2d_B1_merge_reg_aunroll_x_q(64 downto 33));
    bubble_select_avgpool2d_B1_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_avgpool2d_B1_merge_reg_aunroll_x_q(96 downto 65));
    bubble_select_avgpool2d_B1_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_avgpool2d_B1_merge_reg_aunroll_x_q(128 downto 97));
    bubble_select_avgpool2d_B1_merge_reg_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_avgpool2d_B1_merge_reg_aunroll_x_q(192 downto 129));
    bubble_select_avgpool2d_B1_merge_reg_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_avgpool2d_B1_merge_reg_aunroll_x_q(193 downto 193));
    bubble_select_avgpool2d_B1_merge_reg_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_avgpool2d_B1_merge_reg_aunroll_x_q(194 downto 194));
    bubble_select_avgpool2d_B1_merge_reg_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_avgpool2d_B1_merge_reg_aunroll_x_q(226 downto 195));

    -- redist9_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_2_0(REG,107)
    redist9_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_2_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_backEN = "1") THEN
                redist9_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_2_0_q <= STD_LOGIC_VECTOR(bubble_select_avgpool2d_B1_merge_reg_aunroll_x_h);
            END IF;
        END IF;
    END PROCESS;

    -- i_arrayidx_avgpool2d_avgpool2d13_mult_multconst_x(CONSTANT,19)
    i_arrayidx_avgpool2d_avgpool2d13_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- i_idxprom_avgpool2d_sel_x(BITSELECT,25)@1
    i_idxprom_avgpool2d_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(bubble_select_avgpool2d_B1_merge_reg_aunroll_x_c(31 downto 0)), 64)));

    -- i_add_ptr_sum_avgpool2d(ADD,38)@1
    i_add_ptr_sum_avgpool2d_a <= STD_LOGIC_VECTOR("0" & i_idxprom_avgpool2d_sel_x_b);
    i_add_ptr_sum_avgpool2d_b <= STD_LOGIC_VECTOR("0" & bubble_select_avgpool2d_B1_merge_reg_aunroll_x_f);
    i_add_ptr_sum_avgpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_ptr_sum_avgpool2d_a) + UNSIGNED(i_add_ptr_sum_avgpool2d_b));
    i_add_ptr_sum_avgpool2d_q <= i_add_ptr_sum_avgpool2d_o(64 downto 0);

    -- bgTrunc_i_add_ptr_sum_avgpool2d_sel_x(BITSELECT,3)@1
    bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b <= i_add_ptr_sum_avgpool2d_q(63 downto 0);

    -- redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0(REG,101)
    redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_backEN = "1") THEN
                redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- i_arrayidx_avgpool2d_avgpool2d13_mult_x_bs1_merged_bit_select(BITSELECT,85)@2
    i_arrayidx_avgpool2d_avgpool2d13_mult_x_bs1_merged_bit_select_b <= redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_q(17 downto 0);
    i_arrayidx_avgpool2d_avgpool2d13_mult_x_bs1_merged_bit_select_c <= redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_q(63 downto 54);
    i_arrayidx_avgpool2d_avgpool2d13_mult_x_bs1_merged_bit_select_d <= redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_q(35 downto 18);
    i_arrayidx_avgpool2d_avgpool2d13_mult_x_bs1_merged_bit_select_e <= redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_q(53 downto 36);

    -- i_arrayidx_avgpool2d_avgpool2d13_mult_x_im3_shift0(BITSHIFT,80)@2
    i_arrayidx_avgpool2d_avgpool2d13_mult_x_im3_shift0_qint <= i_arrayidx_avgpool2d_avgpool2d13_mult_x_bs1_merged_bit_select_c & "00";
    i_arrayidx_avgpool2d_avgpool2d13_mult_x_im3_shift0_q <= i_arrayidx_avgpool2d_avgpool2d13_mult_x_im3_shift0_qint(11 downto 0);

    -- i_arrayidx_avgpool2d_avgpool2d13_mult_x_align_15(BITSHIFT,72)@2
    i_arrayidx_avgpool2d_avgpool2d13_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_avgpool2d_avgpool2d13_mult_x_im3_shift0_q) & "000000000000000";
    i_arrayidx_avgpool2d_avgpool2d13_mult_x_align_15_q <= i_arrayidx_avgpool2d_avgpool2d13_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx_avgpool2d_avgpool2d13_mult_x_im6_shift0(BITSHIFT,81)@2
    i_arrayidx_avgpool2d_avgpool2d13_mult_x_im6_shift0_qint <= i_arrayidx_avgpool2d_avgpool2d13_mult_x_bs1_merged_bit_select_d & "00";
    i_arrayidx_avgpool2d_avgpool2d13_mult_x_im6_shift0_q <= i_arrayidx_avgpool2d_avgpool2d13_mult_x_im6_shift0_qint(19 downto 0);

    -- i_arrayidx_avgpool2d_avgpool2d13_mult_x_align_14(BITSHIFT,71)@2
    i_arrayidx_avgpool2d_avgpool2d13_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_avgpool2d_avgpool2d13_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx_avgpool2d_avgpool2d13_mult_x_align_14_q <= i_arrayidx_avgpool2d_avgpool2d13_mult_x_align_14_qint(38 downto 0);

    -- i_arrayidx_avgpool2d_avgpool2d13_mult_x_join_16(BITJOIN,73)@2
    i_arrayidx_avgpool2d_avgpool2d13_mult_x_join_16_q <= i_arrayidx_avgpool2d_avgpool2d13_mult_x_align_15_q & i_arrayidx_avgpool2d_avgpool2d13_mult_x_align_14_q;

    -- i_arrayidx_avgpool2d_avgpool2d13_mult_x_im9_shift0(BITSHIFT,82)@2
    i_arrayidx_avgpool2d_avgpool2d13_mult_x_im9_shift0_qint <= i_arrayidx_avgpool2d_avgpool2d13_mult_x_bs1_merged_bit_select_e & "00";
    i_arrayidx_avgpool2d_avgpool2d13_mult_x_im9_shift0_q <= i_arrayidx_avgpool2d_avgpool2d13_mult_x_im9_shift0_qint(19 downto 0);

    -- i_arrayidx_avgpool2d_avgpool2d13_mult_x_align_12(BITSHIFT,69)@2
    i_arrayidx_avgpool2d_avgpool2d13_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_avgpool2d_avgpool2d13_mult_x_im9_shift0_q) & "000000000000000";
    i_arrayidx_avgpool2d_avgpool2d13_mult_x_align_12_q <= i_arrayidx_avgpool2d_avgpool2d13_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx_avgpool2d_avgpool2d13_mult_x_im0_shift0(BITSHIFT,79)@2
    i_arrayidx_avgpool2d_avgpool2d13_mult_x_im0_shift0_qint <= i_arrayidx_avgpool2d_avgpool2d13_mult_x_bs1_merged_bit_select_b & "00";
    i_arrayidx_avgpool2d_avgpool2d13_mult_x_im0_shift0_q <= i_arrayidx_avgpool2d_avgpool2d13_mult_x_im0_shift0_qint(19 downto 0);

    -- i_arrayidx_avgpool2d_avgpool2d13_mult_x_join_13(BITJOIN,70)@2
    i_arrayidx_avgpool2d_avgpool2d13_mult_x_join_13_q <= i_arrayidx_avgpool2d_avgpool2d13_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx_avgpool2d_avgpool2d13_mult_x_im0_shift0_q);

    -- i_arrayidx_avgpool2d_avgpool2d13_mult_x_result_add_0_0(ADD,74)@2
    i_arrayidx_avgpool2d_avgpool2d13_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx_avgpool2d_avgpool2d13_mult_x_join_13_q);
    i_arrayidx_avgpool2d_avgpool2d13_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx_avgpool2d_avgpool2d13_mult_x_join_16_q);
    i_arrayidx_avgpool2d_avgpool2d13_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx_avgpool2d_avgpool2d13_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx_avgpool2d_avgpool2d13_mult_x_result_add_0_0_b));
    i_arrayidx_avgpool2d_avgpool2d13_mult_x_result_add_0_0_q <= i_arrayidx_avgpool2d_avgpool2d13_mult_x_result_add_0_0_o(67 downto 0);

    -- i_arrayidx_avgpool2d_avgpool2d13_mult_extender_x(BITJOIN,18)@2
    i_arrayidx_avgpool2d_avgpool2d13_mult_extender_x_q <= i_arrayidx_avgpool2d_avgpool2d13_mult_multconst_x_q & i_arrayidx_avgpool2d_avgpool2d13_mult_x_result_add_0_0_q(66 downto 0);

    -- i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x(BITSELECT,20)@2
    i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b <= i_arrayidx_avgpool2d_avgpool2d13_mult_extender_x_q(63 downto 0);

    -- SE_out_redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo(STALLENABLE,195)
    -- Valid signal propagation
    SE_out_redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_V0 <= SE_out_redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_backStall <= i_sfc_c0_for_body_avgpool2d_c0_enter3_avgpool2d_aunroll_x_out_o_stall or not (SE_out_redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_and0 <= redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_valid_out;
    SE_out_redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_wireValid <= i_load_unnamed_avgpool2d0_avgpool2d_out_o_valid and SE_out_redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_and0;

    -- redist9_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_2_1(REG,108)
    redist9_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_2_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist9_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_2_1_q <= STD_LOGIC_VECTOR(SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0(REG,98)
    redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_syncbuf_input_im_sync_buffer_avgpool2d(BITJOIN,123)
    bubble_join_i_syncbuf_input_im_sync_buffer_avgpool2d_q <= i_syncbuf_input_im_sync_buffer_avgpool2d_out_buffer_out;

    -- bubble_select_i_syncbuf_input_im_sync_buffer_avgpool2d(BITSELECT,124)
    bubble_select_i_syncbuf_input_im_sync_buffer_avgpool2d_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_input_im_sync_buffer_avgpool2d_q(63 downto 0));

    -- i_arrayidx_avgpool2d_avgpool2d13_add_x(ADD,21)@3
    i_arrayidx_avgpool2d_avgpool2d13_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_input_im_sync_buffer_avgpool2d_b);
    i_arrayidx_avgpool2d_avgpool2d13_add_x_b <= STD_LOGIC_VECTOR("0" & redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_q);
    i_arrayidx_avgpool2d_avgpool2d13_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx_avgpool2d_avgpool2d13_add_x_a) + UNSIGNED(i_arrayidx_avgpool2d_avgpool2d13_add_x_b));
    i_arrayidx_avgpool2d_avgpool2d13_add_x_q <= i_arrayidx_avgpool2d_avgpool2d13_add_x_o(64 downto 0);

    -- i_arrayidx_avgpool2d_avgpool2d13_dupName_0_trunc_sel_x(BITSELECT,15)@3
    i_arrayidx_avgpool2d_avgpool2d13_dupName_0_trunc_sel_x_b <= i_arrayidx_avgpool2d_avgpool2d13_add_x_q(63 downto 0);

    -- i_load_unnamed_avgpool2d0_avgpool2d(BLACKBOX,45)@3
    -- in in_i_stall@20000000
    -- out out_o_readdata@139
    -- out out_o_stall@20000000
    -- out out_o_valid@139
    -- out out_unnamed_avgpool2d0_avm_address@20000000
    -- out out_unnamed_avgpool2d0_avm_burstcount@20000000
    -- out out_unnamed_avgpool2d0_avm_byteenable@20000000
    -- out out_unnamed_avgpool2d0_avm_enable@20000000
    -- out out_unnamed_avgpool2d0_avm_read@20000000
    -- out out_unnamed_avgpool2d0_avm_write@20000000
    -- out out_unnamed_avgpool2d0_avm_writedata@20000000
    thei_load_unnamed_avgpool2d0_avgpool2d : i_load_unnamed_avgpool2d0_avgpool2d14
    PORT MAP (
        in_flush => in_flush,
        in_i_address => i_arrayidx_avgpool2d_avgpool2d13_dupName_0_trunc_sel_x_b,
        in_i_predicate => redist9_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_2_1_q,
        in_i_stall => SE_out_redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_backStall,
        in_i_valid => SE_out_i_syncbuf_input_im_sync_buffer_avgpool2d_V0,
        in_unnamed_avgpool2d0_avm_readdata => in_unnamed_avgpool2d0_avm_readdata,
        in_unnamed_avgpool2d0_avm_readdatavalid => in_unnamed_avgpool2d0_avm_readdatavalid,
        in_unnamed_avgpool2d0_avm_waitrequest => in_unnamed_avgpool2d0_avm_waitrequest,
        in_unnamed_avgpool2d0_avm_writeack => in_unnamed_avgpool2d0_avm_writeack,
        out_o_readdata => i_load_unnamed_avgpool2d0_avgpool2d_out_o_readdata,
        out_o_stall => i_load_unnamed_avgpool2d0_avgpool2d_out_o_stall,
        out_o_valid => i_load_unnamed_avgpool2d0_avgpool2d_out_o_valid,
        out_unnamed_avgpool2d0_avm_address => i_load_unnamed_avgpool2d0_avgpool2d_out_unnamed_avgpool2d0_avm_address,
        out_unnamed_avgpool2d0_avm_burstcount => i_load_unnamed_avgpool2d0_avgpool2d_out_unnamed_avgpool2d0_avm_burstcount,
        out_unnamed_avgpool2d0_avm_byteenable => i_load_unnamed_avgpool2d0_avgpool2d_out_unnamed_avgpool2d0_avm_byteenable,
        out_unnamed_avgpool2d0_avm_enable => i_load_unnamed_avgpool2d0_avgpool2d_out_unnamed_avgpool2d0_avm_enable,
        out_unnamed_avgpool2d0_avm_read => i_load_unnamed_avgpool2d0_avgpool2d_out_unnamed_avgpool2d0_avm_read,
        out_unnamed_avgpool2d0_avm_write => i_load_unnamed_avgpool2d0_avgpool2d_out_unnamed_avgpool2d0_avm_write,
        out_unnamed_avgpool2d0_avm_writedata => i_load_unnamed_avgpool2d0_avgpool2d_out_unnamed_avgpool2d0_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1(STALLENABLE,213)
    -- Valid signal propagation
    SE_out_bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_V0 <= SE_out_bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_backStall <= i_syncbuf_input_im_sync_buffer_avgpool2d_out_stall_out or not (SE_out_bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_wireValid <= bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg_valid_out;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_syncbuf_input_im_sync_buffer_avgpool2d(BLACKBOX,46)@3
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_input_im_sync_buffer_avgpool2d : i_syncbuf_input_im_sync_buffer_avgpool2d10
    PORT MAP (
        in_buffer_in => in_input_im,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_input_im_sync_buffer_avgpool2d_backStall,
        in_valid_in => SE_out_bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_V0,
        out_buffer_out => i_syncbuf_input_im_sync_buffer_avgpool2d_out_buffer_out,
        out_stall_out => i_syncbuf_input_im_sync_buffer_avgpool2d_out_stall_out,
        out_valid_out => i_syncbuf_input_im_sync_buffer_avgpool2d_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_input_im_sync_buffer_avgpool2d(STALLENABLE,172)
    -- Valid signal propagation
    SE_out_i_syncbuf_input_im_sync_buffer_avgpool2d_V0 <= SE_out_i_syncbuf_input_im_sync_buffer_avgpool2d_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_input_im_sync_buffer_avgpool2d_backStall <= i_load_unnamed_avgpool2d0_avgpool2d_out_o_stall or not (SE_out_i_syncbuf_input_im_sync_buffer_avgpool2d_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_input_im_sync_buffer_avgpool2d_and0 <= i_syncbuf_input_im_sync_buffer_avgpool2d_out_valid_out;
    SE_out_i_syncbuf_input_im_sync_buffer_avgpool2d_wireValid <= SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_V0 and SE_out_i_syncbuf_input_im_sync_buffer_avgpool2d_and0;

    -- SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0(STALLENABLE,187)
    -- Valid signal propagation
    SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_V0 <= SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_R_v_0;
    SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_V1 <= SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_R_v_1;
    -- Stall signal propagation
    SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_s_tv_0 <= SE_out_i_syncbuf_input_im_sync_buffer_avgpool2d_backStall and SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_R_v_0;
    SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_s_tv_1 <= redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_stall_out and SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_R_v_1;
    -- Backward Enable generation
    SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_or0 <= SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_s_tv_0;
    SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_backEN <= not (SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_s_tv_1 or SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_or0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_v_s_0 <= SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_backEN and SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_V;
    -- Backward Stall generation
    SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_backStall <= not (SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_backEN);
    SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_R_v_0 <= (others => '0');
            SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_R_v_0 <= SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_R_v_0 and SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_R_v_0 <= SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_v_s_0;
            END IF;

            IF (SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_R_v_1 <= SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_R_v_1 and SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_s_tv_1;
            ELSE
                SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_R_v_1 <= SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0(STALLREG,267)
    SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_r_valid <= (others => '0');
            SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_r_data0 <= (others => '-');
            SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_r_valid <= SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_backStall and (SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_r_valid or SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_i_valid);

            IF (SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_r_data0 <= STD_LOGIC_VECTOR(i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b);
                SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_r_data1 <= STD_LOGIC_VECTOR(redist9_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_2_0_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_i_valid <= SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_V0;
    -- Stall signal propagation
    SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_backStall <= SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_r_valid or not (SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_i_valid);

    -- Valid
    SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_V <= SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_r_valid WHEN SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_r_valid = "1" ELSE SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_i_valid;

    -- Data0
    SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_D0 <= SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_r_data0 WHEN SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_r_valid = "1" ELSE i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b;
    -- Data1
    SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_D1 <= SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_r_data1 WHEN SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_r_valid = "1" ELSE redist9_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_2_0_q;

    -- SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0(STALLENABLE,191)
    -- Valid signal propagation
    SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_V0 <= SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_s_tv_0 <= SR_SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_backStall and SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_backEN <= not (SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_v_s_0 <= SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_backEN and SE_out_avgpool2d_B1_merge_reg_aunroll_x_V8;
    -- Backward Stall generation
    SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_backStall <= not (SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_v_s_0);
    SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_backEN = "0") THEN
                SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_R_v_0 <= SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_R_v_0 and SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_R_v_0 <= SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo(STALLFIFO,103)
    redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_valid_in <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_V2;
    redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_stall_in <= SE_out_redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_backStall;
    redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_data_in <= bubble_select_avgpool2d_B1_merge_reg_aunroll_x_d;
    redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_valid_in_bitsignaltemp <= redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_valid_in(0);
    redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_stall_in_bitsignaltemp <= redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_stall_in(0);
    redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_valid_out(0) <= redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_valid_out_bitsignaltemp;
    redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_stall_out(0) <= redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_stall_out_bitsignaltemp;
    theredist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 139,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_valid_in_bitsignaltemp,
        stall_in => redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_avgpool2d_B1_merge_reg_aunroll_x_d,
        valid_out => redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_valid_out_bitsignaltemp,
        stall_out => redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_stall_out_bitsignaltemp,
        data_out => redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg(STALLFIFO,266)
    bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg_valid_in <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_V0;
    bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg_stall_in <= SE_out_bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_backStall;
    bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp <= bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg_valid_in(0);
    bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp <= bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg_stall_in(0);
    bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg_valid_out(0) <= bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp;
    bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg_stall_out(0) <= bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp;
    thebubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_avgpool2d_B1_merge_reg_aunroll_x(STALLENABLE,154)
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg1 <= (others => '0');
            SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg2 <= (others => '0');
            SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg3 <= (others => '0');
            SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg4 <= (others => '0');
            SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg5 <= (others => '0');
            SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg6 <= (others => '0');
            SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg7 <= (others => '0');
            SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg8 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg0 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg1 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg2 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg3 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg3;
            -- Succesor 4
            SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg4 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg4;
            -- Succesor 5
            SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg5 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg5;
            -- Succesor 6
            SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg6 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg6;
            -- Succesor 7
            SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg7 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg7;
            -- Succesor 8
            SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg8 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg8;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed0 <= (not (bubble_out_avgpool2d_B1_merge_reg_aunroll_x_1_reg_stall_out) and SE_out_avgpool2d_B1_merge_reg_aunroll_x_wireValid) or SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg0;
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed1 <= (not (redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_stall_out) and SE_out_avgpool2d_B1_merge_reg_aunroll_x_wireValid) or SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg1;
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed2 <= (not (redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_stall_out) and SE_out_avgpool2d_B1_merge_reg_aunroll_x_wireValid) or SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg2;
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed3 <= (not (redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_stall_out) and SE_out_avgpool2d_B1_merge_reg_aunroll_x_wireValid) or SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg3;
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed4 <= (not (redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_stall_out) and SE_out_avgpool2d_B1_merge_reg_aunroll_x_wireValid) or SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg4;
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed5 <= (not (redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_stall_out) and SE_out_avgpool2d_B1_merge_reg_aunroll_x_wireValid) or SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg5;
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed6 <= (not (redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_stall_out) and SE_out_avgpool2d_B1_merge_reg_aunroll_x_wireValid) or SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg6;
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed7 <= (not (redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_stall_out) and SE_out_avgpool2d_B1_merge_reg_aunroll_x_wireValid) or SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg7;
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed8 <= (not (SE_redist3_bgTrunc_i_add_ptr_sum_avgpool2d_sel_x_b_1_0_backStall) and SE_out_avgpool2d_B1_merge_reg_aunroll_x_wireValid) or SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg8;
    -- Consuming
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_StallValid <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_backStall and SE_out_avgpool2d_B1_merge_reg_aunroll_x_wireValid;
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg0 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_StallValid and SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed0;
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg1 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_StallValid and SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed1;
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg2 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_StallValid and SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed2;
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg3 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_StallValid and SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed3;
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg4 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_StallValid and SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed4;
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg5 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_StallValid and SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed5;
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg6 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_StallValid and SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed6;
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg7 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_StallValid and SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed7;
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_toReg8 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_StallValid and SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed8;
    -- Backward Stall generation
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_or0 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed0;
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_or1 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed1 and SE_out_avgpool2d_B1_merge_reg_aunroll_x_or0;
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_or2 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed2 and SE_out_avgpool2d_B1_merge_reg_aunroll_x_or1;
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_or3 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed3 and SE_out_avgpool2d_B1_merge_reg_aunroll_x_or2;
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_or4 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed4 and SE_out_avgpool2d_B1_merge_reg_aunroll_x_or3;
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_or5 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed5 and SE_out_avgpool2d_B1_merge_reg_aunroll_x_or4;
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_or6 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed6 and SE_out_avgpool2d_B1_merge_reg_aunroll_x_or5;
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_or7 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed7 and SE_out_avgpool2d_B1_merge_reg_aunroll_x_or6;
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_wireStall <= not (SE_out_avgpool2d_B1_merge_reg_aunroll_x_consumed8 and SE_out_avgpool2d_B1_merge_reg_aunroll_x_or7);
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_backStall <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_V0 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_wireValid and not (SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg0);
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_V1 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_wireValid and not (SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg1);
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_V2 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_wireValid and not (SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg2);
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_V3 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_wireValid and not (SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg3);
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_V4 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_wireValid and not (SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg4);
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_V5 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_wireValid and not (SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg5);
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_V6 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_wireValid and not (SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg6);
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_V7 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_wireValid and not (SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg7);
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_V8 <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_wireValid and not (SE_out_avgpool2d_B1_merge_reg_aunroll_x_fromReg8);
    -- Computing multiple Valid(s)
    SE_out_avgpool2d_B1_merge_reg_aunroll_x_wireValid <= avgpool2d_B1_merge_reg_aunroll_x_out_valid_out;

    -- redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo(STALLFIFO,102)
    redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_valid_in <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_V1;
    redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_stall_in <= SE_out_redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_backStall;
    redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_data_in <= bubble_select_avgpool2d_B1_merge_reg_aunroll_x_b;
    redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_valid_in_bitsignaltemp <= redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_valid_in(0);
    redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_stall_in_bitsignaltemp <= redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_stall_in(0);
    redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_valid_out(0) <= redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_valid_out_bitsignaltemp;
    redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_stall_out(0) <= redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_stall_out_bitsignaltemp;
    theredist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 155,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 33,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_valid_in_bitsignaltemp,
        stall_in => redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_avgpool2d_B1_merge_reg_aunroll_x_b,
        valid_out => redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_valid_out_bitsignaltemp,
        stall_out => redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_stall_out_bitsignaltemp,
        data_out => redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo(STALLENABLE,193)
    -- Valid signal propagation
    SE_out_redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_V0 <= SE_out_redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_backStall <= SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_backStall or not (SE_out_redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_wireValid <= redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_valid_out;

    -- SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0(STALLENABLE,190)
    -- Valid signal propagation
    SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_V0 <= SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_s_tv_0 <= SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_backStall and SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_backEN <= not (SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_v_s_0 <= SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_backEN and SE_out_redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_V0;
    -- Backward Stall generation
    SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_backStall <= not (SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_v_s_0);
    SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_backEN = "0") THEN
                SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_R_v_0 <= SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_R_v_0 and SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_R_v_0 <= SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_join_i_load_unnamed_avgpool2d0_avgpool2d(BITJOIN,120)
    bubble_join_i_load_unnamed_avgpool2d0_avgpool2d_q <= i_load_unnamed_avgpool2d0_avgpool2d_out_o_readdata;

    -- bubble_select_i_load_unnamed_avgpool2d0_avgpool2d(BITSELECT,121)
    bubble_select_i_load_unnamed_avgpool2d0_avgpool2d_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_avgpool2d0_avgpool2d_q(31 downto 0));

    -- bubble_join_redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo(BITJOIN,136)
    bubble_join_redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_q <= redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_data_out;

    -- bubble_select_redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo(BITSELECT,137)
    bubble_select_redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_q(31 downto 0));

    -- i_sfc_c0_for_body_avgpool2d_c0_enter3_avgpool2d_aunroll_x(BLACKBOX,26)@139
    -- in in_i_stall@20000000
    -- out out_c0_exit6_0@156
    -- out out_c0_exit6_1@156
    -- out out_o_stall@20000000
    -- out out_o_valid@156
    thei_sfc_c0_for_body_avgpool2d_c0_enter3_avgpool2d_aunroll_x : i_sfc_c0_for_body_avgpool2d_c0_enter3_avgpool2d
    PORT MAP (
        in_c0_eni2_0 => GND_q,
        in_c0_eni2_1 => bubble_select_redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_b,
        in_c0_eni2_2 => bubble_select_i_load_unnamed_avgpool2d0_avgpool2d_b,
        in_i_stall => SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_backStall,
        in_i_valid => SE_out_redist5_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_2_138_fifo_V0,
        out_c0_exit6_1 => i_sfc_c0_for_body_avgpool2d_c0_enter3_avgpool2d_aunroll_x_out_c0_exit6_1,
        out_o_stall => i_sfc_c0_for_body_avgpool2d_c0_enter3_avgpool2d_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_body_avgpool2d_c0_enter3_avgpool2d_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_1gr(CONSTANT,31)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- i_inc_avgpool2d(ADD,44)@1
    i_inc_avgpool2d_a <= STD_LOGIC_VECTOR("0" & bubble_select_avgpool2d_B1_merge_reg_aunroll_x_c);
    i_inc_avgpool2d_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc_avgpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc_avgpool2d_a) + UNSIGNED(i_inc_avgpool2d_b));
    i_inc_avgpool2d_q <= i_inc_avgpool2d_o(32 downto 0);

    -- bgTrunc_i_inc_avgpool2d_sel_x(BITSELECT,5)@1
    bgTrunc_i_inc_avgpool2d_sel_x_b <= i_inc_avgpool2d_q(31 downto 0);

    -- redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo(STALLFIFO,99)
    redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_valid_in <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_V7;
    redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_stall_in <= SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_backStall;
    redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_data_in <= bgTrunc_i_inc_avgpool2d_sel_x_b;
    redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_valid_in_bitsignaltemp <= redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_valid_in(0);
    redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_stall_in_bitsignaltemp <= redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_stall_in(0);
    redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_valid_out(0) <= redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_valid_out_bitsignaltemp;
    redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_stall_out(0) <= redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_stall_out_bitsignaltemp;
    theredist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 156,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_valid_in_bitsignaltemp,
        stall_in => redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_stall_in_bitsignaltemp,
        data_in => bgTrunc_i_inc_avgpool2d_sel_x_b,
        valid_out => redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_valid_out_bitsignaltemp,
        stall_out => redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_stall_out_bitsignaltemp,
        data_out => redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo(STALLFIFO,104)
    redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_valid_in <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_V3;
    redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_stall_in <= SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_backStall;
    redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_data_in <= bubble_select_avgpool2d_B1_merge_reg_aunroll_x_e;
    redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_valid_in_bitsignaltemp <= redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_valid_in(0);
    redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_stall_in_bitsignaltemp <= redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_stall_in(0);
    redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_valid_out(0) <= redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_valid_out_bitsignaltemp;
    redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_stall_out(0) <= redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_stall_out_bitsignaltemp;
    theredist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 156,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_valid_in_bitsignaltemp,
        stall_in => redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_avgpool2d_B1_merge_reg_aunroll_x_e,
        valid_out => redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_valid_out_bitsignaltemp,
        stall_out => redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_stall_out_bitsignaltemp,
        data_out => redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo(STALLFIFO,105)
    redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_valid_in <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_V4;
    redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_stall_in <= SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_backStall;
    redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_data_in <= bubble_select_avgpool2d_B1_merge_reg_aunroll_x_f;
    redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_valid_in_bitsignaltemp <= redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_valid_in(0);
    redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_stall_in_bitsignaltemp <= redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_stall_in(0);
    redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_valid_out(0) <= redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_valid_out_bitsignaltemp;
    redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_stall_out(0) <= redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_stall_out_bitsignaltemp;
    theredist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 156,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_valid_in_bitsignaltemp,
        stall_in => redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_avgpool2d_B1_merge_reg_aunroll_x_f,
        valid_out => redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_valid_out_bitsignaltemp,
        stall_out => redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_stall_out_bitsignaltemp,
        data_out => redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo(STALLFIFO,106)
    redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_valid_in <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_V5;
    redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_stall_in <= SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_backStall;
    redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_data_in <= bubble_select_avgpool2d_B1_merge_reg_aunroll_x_g;
    redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_valid_in_bitsignaltemp <= redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_valid_in(0);
    redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_stall_in_bitsignaltemp <= redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_stall_in(0);
    redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_valid_out(0) <= redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_valid_out_bitsignaltemp;
    redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_stall_out(0) <= redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_stall_out_bitsignaltemp;
    theredist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 156,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_valid_in_bitsignaltemp,
        stall_in => redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_avgpool2d_B1_merge_reg_aunroll_x_g,
        valid_out => redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_valid_out_bitsignaltemp,
        stall_out => redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_stall_out_bitsignaltemp,
        data_out => redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo(STALLFIFO,109)
    redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_valid_in <= SE_redist0_i_arrayidx_avgpool2d_avgpool2d13_trunc_sel_x_b_1_0_V1;
    redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_stall_in <= SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_backStall;
    redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_data_in <= redist9_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_2_1_q;
    redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_valid_in_bitsignaltemp <= redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_valid_in(0);
    redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_stall_in_bitsignaltemp <= redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_stall_in(0);
    redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_valid_out(0) <= redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_valid_out_bitsignaltemp;
    redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_stall_out(0) <= redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_stall_out_bitsignaltemp;
    theredist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 154,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_valid_in_bitsignaltemp,
        stall_in => redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_stall_in_bitsignaltemp,
        data_in => redist9_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_2_1_q,
        valid_out => redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_valid_out_bitsignaltemp,
        stall_out => redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_stall_out_bitsignaltemp,
        data_out => redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo(STALLFIFO,110)
    redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_valid_in <= SE_out_avgpool2d_B1_merge_reg_aunroll_x_V6;
    redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_stall_in <= SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_backStall;
    redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_data_in <= bubble_select_avgpool2d_B1_merge_reg_aunroll_x_i;
    redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_valid_in_bitsignaltemp <= redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_valid_in(0);
    redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_stall_in_bitsignaltemp <= redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_stall_in(0);
    redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_valid_out(0) <= redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_valid_out_bitsignaltemp;
    redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_stall_out(0) <= redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_stall_out_bitsignaltemp;
    theredist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 156,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_valid_in_bitsignaltemp,
        stall_in => redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_avgpool2d_B1_merge_reg_aunroll_x_i,
        valid_out => redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_valid_out_bitsignaltemp,
        stall_out => redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_stall_out_bitsignaltemp,
        data_out => redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo(STALLENABLE,207)
    -- Valid signal propagation
    SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_V0 <= SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_backStall <= in_stall_in or not (SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_and0 <= redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_valid_out;
    SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_and1 <= redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_valid_out and SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_and0;
    SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_and2 <= redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_valid_out and SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_and1;
    SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_and3 <= redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_valid_out and SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_and2;
    SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_and4 <= redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_valid_out and SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_and3;
    SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_and5 <= redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_valid_out and SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_and4;
    SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_and6 <= i_sfc_c0_for_body_avgpool2d_c0_enter3_avgpool2d_aunroll_x_out_o_valid and SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_and5;
    SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_wireValid <= SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_V0 and SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_and6;

    -- bubble_join_redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo(BITJOIN,130)
    bubble_join_redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_q <= redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_data_out;

    -- bubble_select_redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo(BITSELECT,131)
    bubble_select_redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_q(31 downto 0));

    -- bubble_join_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo(BITJOIN,151)
    bubble_join_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_q <= redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_data_out;

    -- bubble_select_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo(BITSELECT,152)
    bubble_select_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_q(31 downto 0));

    -- c_i33_1gr(CONSTANT,33)
    c_i33_1gr_q <= "111111111111111111111111111111111";

    -- bubble_join_redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo(BITJOIN,133)
    bubble_join_redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_q <= redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_data_out;

    -- bubble_select_redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo(BITSELECT,134)
    bubble_select_redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_q(32 downto 0));

    -- i_fpgaindvars_iv_avgpool2d(ADD,41)@155
    i_fpgaindvars_iv_avgpool2d_a <= STD_LOGIC_VECTOR("0" & bubble_select_redist4_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_0_154_fifo_b);
    i_fpgaindvars_iv_avgpool2d_b <= STD_LOGIC_VECTOR("0" & c_i33_1gr_q);
    i_fpgaindvars_iv_avgpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(i_fpgaindvars_iv_avgpool2d_a) + UNSIGNED(i_fpgaindvars_iv_avgpool2d_b));
    i_fpgaindvars_iv_avgpool2d_q <= i_fpgaindvars_iv_avgpool2d_o(33 downto 0);

    -- bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x(BITSELECT,4)@155
    bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b <= i_fpgaindvars_iv_avgpool2d_q(32 downto 0);

    -- redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0(REG,100)
    redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_q <= "000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_backEN = "1") THEN
                redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- i_exitcond1_avgpool2d_cmp_sign(LOGICAL,83)@156
    i_exitcond1_avgpool2d_cmp_sign_q <= STD_LOGIC_VECTOR(redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_q(32 downto 32));

    -- i_exitcond_guard_avgpool2d(LOGICAL,40)@156
    i_exitcond_guard_avgpool2d_q <= i_exitcond1_avgpool2d_cmp_sign_q or bubble_select_redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_b;

    -- bubble_join_redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo(BITJOIN,148)
    bubble_join_redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_q <= redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_data_out;

    -- bubble_select_redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo(BITSELECT,149)
    bubble_select_redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_q(0 downto 0));

    -- bubble_join_redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo(BITJOIN,145)
    bubble_join_redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_q <= redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_data_out;

    -- bubble_select_redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo(BITSELECT,146)
    bubble_select_redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_q(0 downto 0));

    -- bubble_join_redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo(BITJOIN,142)
    bubble_join_redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_q <= redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_data_out;

    -- bubble_select_redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo(BITSELECT,143)
    bubble_select_redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_q(63 downto 0));

    -- bubble_join_i_sfc_c0_for_body_avgpool2d_c0_enter3_avgpool2d_aunroll_x(BITJOIN,116)
    bubble_join_i_sfc_c0_for_body_avgpool2d_c0_enter3_avgpool2d_aunroll_x_q <= i_sfc_c0_for_body_avgpool2d_c0_enter3_avgpool2d_aunroll_x_out_c0_exit6_1;

    -- bubble_select_i_sfc_c0_for_body_avgpool2d_c0_enter3_avgpool2d_aunroll_x(BITSELECT,117)
    bubble_select_i_sfc_c0_for_body_avgpool2d_c0_enter3_avgpool2d_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body_avgpool2d_c0_enter3_avgpool2d_aunroll_x_q(31 downto 0));

    -- bubble_join_redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo(BITJOIN,139)
    bubble_join_redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_q <= redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_data_out;

    -- bubble_select_redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo(BITSELECT,140)
    bubble_select_redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_q(31 downto 0));

    -- dupName_0_sync_out_x(GPOUT,10)@156
    out_c0_exe12 <= bubble_select_redist6_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_3_155_fifo_b;
    out_c0_exe17 <= bubble_select_i_sfc_c0_for_body_avgpool2d_c0_enter3_avgpool2d_aunroll_x_b;
    out_c0_exe23 <= bubble_select_redist7_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_4_155_fifo_b;
    out_c0_exe35 <= bubble_select_redist8_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_5_155_fifo_b;
    out_c0_exe46 <= bubble_select_redist10_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_6_155_fifo_b;
    out_exitcond_GUARD <= i_exitcond_guard_avgpool2d_q;
    out_fpgaindvars_iv <= redist2_bgTrunc_i_fpgaindvars_iv_avgpool2d_sel_x_b_1_0_q;
    out_global_id_09 <= bubble_select_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_b;
    out_inc <= bubble_select_redist1_bgTrunc_i_inc_avgpool2d_sel_x_b_155_fifo_b;
    out_valid_out <= SE_out_redist11_avgpool2d_B1_merge_reg_aunroll_x_out_data_out_7_155_fifo_V0;

    -- ext_sig_sync_out(GPOUT,37)
    out_unnamed_avgpool2d0_avm_address <= i_load_unnamed_avgpool2d0_avgpool2d_out_unnamed_avgpool2d0_avm_address;
    out_unnamed_avgpool2d0_avm_enable <= i_load_unnamed_avgpool2d0_avgpool2d_out_unnamed_avgpool2d0_avm_enable;
    out_unnamed_avgpool2d0_avm_read <= i_load_unnamed_avgpool2d0_avgpool2d_out_unnamed_avgpool2d0_avm_read;
    out_unnamed_avgpool2d0_avm_write <= i_load_unnamed_avgpool2d0_avgpool2d_out_unnamed_avgpool2d0_avm_write;
    out_unnamed_avgpool2d0_avm_writedata <= i_load_unnamed_avgpool2d0_avgpool2d_out_unnamed_avgpool2d0_avm_writedata;
    out_unnamed_avgpool2d0_avm_byteenable <= i_load_unnamed_avgpool2d0_avgpool2d_out_unnamed_avgpool2d0_avm_byteenable;
    out_unnamed_avgpool2d0_avm_burstcount <= i_load_unnamed_avgpool2d0_avgpool2d_out_unnamed_avgpool2d0_avm_burstcount;

    -- sync_out(GPOUT,56)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
