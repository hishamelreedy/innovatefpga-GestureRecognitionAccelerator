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

-- VHDL created from bb_maxpool2d_B3_stall_region
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

entity bb_maxpool2d_B3_stall_region is
    port (
        out_lsu_unnamed_maxpool2d1_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        in_output_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe13 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe11715 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_cmp9_phi_decision18_xor_RM14 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_0106 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_1610 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im_addr_0114 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_178 : in std_logic_vector(63 downto 0);  -- ufix64
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe13 : out std_logic_vector(63 downto 0);  -- ufix64
        out_for_end37_loopexit_loopexit_LC_COND : out std_logic_vector(0 downto 0);  -- ufix1
        out_i_010_LC_OuterPHI : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_16_LC_InnerPHI : out std_logic_vector(31 downto 0);  -- ufix32
        out_output_im_addr_011_LC_OuterPHI : out std_logic_vector(63 downto 0);  -- ufix64
        out_output_im_addr_17_LC_InnerPHI : out std_logic_vector(63 downto 0);  -- ufix64
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_maxpool2d1_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_maxpool2d1_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_maxpool2d1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_maxpool2d1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_maxpool2d1_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_maxpool2d1_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_maxpool2d1_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_maxpool2d1_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_maxpool2d1_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_maxpool2d1_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_maxpool2d1_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_maxpool2d_B3_stall_region;

architecture normal of bb_maxpool2d_B3_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_store_unnamed_maxpool2d1_maxpool2d33 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_writedata : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_maxpool2d1_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_maxpool2d1_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_maxpool2d1_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_maxpool2d1_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_maxpool2d1_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d1_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_output_size_sync_buffer2_maxpool2d36 is
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


    component i_syncbuf_output_size_sync_buffer3_maxpool2d46 is
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


    component i_syncbuf_output_size_sync_buffer5_maxpool2d40 is
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
    signal bgTrunc_i_inc33_maxpool2d_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_inc36_maxpool2d_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_unnamed_maxpool2d42_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_unnamed_maxpool2d44_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_0_c_i32_1gr_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_incdec_ptr_maxpool2d_maxpool2d35_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_incdec_ptr_maxpool2d_maxpool2d35_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_incdec_ptr_maxpool2d_maxpool2d35_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_incdec_ptr_maxpool2d_maxpool2d35_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_incdec_ptr_maxpool2d_maxpool2d35_c_i64_4gr_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_unnamed_maxpool2d43_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i64_1gr_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_exitcond14_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond14_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond15_maxpool2d_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond15_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_for_end37_loopexit_loopexit_lc_cond_maxpool2d_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_i_010_lc_outerphi_maxpool2d_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_i_010_lc_outerphi_maxpool2d_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_inc33_maxpool2d_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc33_maxpool2d_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc33_maxpool2d_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc33_maxpool2d_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc36_maxpool2d_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc36_maxpool2d_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc36_maxpool2d_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc36_maxpool2d_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_j_16_lc_innerphi_maxpool2d_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_j_16_lc_innerphi_maxpool2d_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_output_im_addr_011_lc_outerphi_maxpool2d_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_output_im_addr_011_lc_outerphi_maxpool2d_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_output_im_addr_17_lc_innerphi_maxpool2d_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_output_im_addr_17_lc_innerphi_maxpool2d_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_store_unnamed_maxpool2d1_maxpool2d_out_lsu_unnamed_maxpool2d1_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_maxpool2d1_maxpool2d_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_maxpool2d1_maxpool2d_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_syncbuf_output_size_sync_buffer2_maxpool2d_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_output_size_sync_buffer2_maxpool2d_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_output_size_sync_buffer2_maxpool2d_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_output_size_sync_buffer3_maxpool2d_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_output_size_sync_buffer3_maxpool2d_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_output_size_sync_buffer3_maxpool2d_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_output_size_sync_buffer5_maxpool2d_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_output_size_sync_buffer5_maxpool2d_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_output_size_sync_buffer5_maxpool2d_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_maxpool2d39_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_maxpool2d42_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_unnamed_maxpool2d42_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_unnamed_maxpool2d42_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_unnamed_maxpool2d42_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_unnamed_maxpool2d43_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_unnamed_maxpool2d43_vt_select_31_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_maxpool2d44_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_unnamed_maxpool2d44_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_unnamed_maxpool2d44_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_unnamed_maxpool2d44_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_unnamed_maxpool2d44_vt_const_63_q : STD_LOGIC_VECTOR (30 downto 0);
    signal i_unnamed_maxpool2d44_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_unnamed_maxpool2d44_vt_select_32_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_unnamed_maxpool2d49_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scevgep_maxpool2d_maxpool2d45_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_stall_entry_o4_4_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist0_stall_entry_o4_4_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist0_stall_entry_o4_4_2_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist0_stall_entry_o4_4_3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_stall_entry_o6_3_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_o6_3_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_o6_3_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_o6_4_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_stall_entry_o7_2_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_stall_entry_o7_2_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_stall_entry_o7_3_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_stall_entry_o8_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_stall_entry_o9_3_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist6_stall_entry_o9_3_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist6_stall_entry_o9_3_2_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist7_stall_entry_o9_4_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist8_stall_entry_o10_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist10_i_unnamed_maxpool2d39_q_1_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist13_i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x_b_3_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist13_i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x_b_3_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist13_i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x_b_3_2_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_bgTrunc_i_inc36_maxpool2d_sel_x_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_bgTrunc_i_inc33_maxpool2d_sel_x_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_bgTrunc_i_inc33_maxpool2d_sel_x_b_3_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_bgTrunc_i_inc33_maxpool2d_sel_x_b_3_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_output_size_sync_buffer2_maxpool2d_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_output_size_sync_buffer2_maxpool2d_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_output_size_sync_buffer3_maxpool2d_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_output_size_sync_buffer3_maxpool2d_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_output_size_sync_buffer5_maxpool2d_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_output_size_sync_buffer5_maxpool2d_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (288 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_h : STD_LOGIC_VECTOR (63 downto 0);
    signal SE_i_scevgep_maxpool2d_maxpool2d45_add_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scevgep_maxpool2d_maxpool2d45_add_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scevgep_maxpool2d_maxpool2d45_add_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scevgep_maxpool2d_maxpool2d45_add_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond14_maxpool2d_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond14_maxpool2d_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond14_maxpool2d_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond14_maxpool2d_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond14_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond14_maxpool2d_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond15_maxpool2d_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond15_maxpool2d_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond15_maxpool2d_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond15_maxpool2d_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond15_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond15_maxpool2d_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_i_010_lc_outerphi_maxpool2d_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_i_010_lc_outerphi_maxpool2d_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_i_010_lc_outerphi_maxpool2d_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_i_010_lc_outerphi_maxpool2d_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_i_010_lc_outerphi_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_i_010_lc_outerphi_maxpool2d_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_maxpool2d1_maxpool2d_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_maxpool2d1_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_unnamed_maxpool2d1_maxpool2d_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d39_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d39_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d39_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d39_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d39_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d39_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d39_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d39_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d39_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d39_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d39_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d39_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d39_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_maxpool2d39_V1 : STD_LOGIC_VECTOR (0 downto 0);
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
    signal SE_stall_entry_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_1_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_1_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_1_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_1_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_2_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_2_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_2_R_v_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_2_R_v_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_2_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_2_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_2_s_tv_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_2_s_tv_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_2_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_2_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_2_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_2_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_2_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_2_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_2_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_2_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_4_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist10_i_unnamed_maxpool2d39_q_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist10_i_unnamed_maxpool2d39_q_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist10_i_unnamed_maxpool2d39_q_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist10_i_unnamed_maxpool2d39_q_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist10_i_unnamed_maxpool2d39_q_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist10_i_unnamed_maxpool2d39_q_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_and7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_2_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_4_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_2_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_2_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_2_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_2_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_2_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_4_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_4_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_4_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_4_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_4_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_4_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_4_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_4_reg_stall_out_bitsignaltemp : std_logic;
    signal SR_bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_1_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_1_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_1_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_1_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_1_r_data2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_1_r_data3 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_1_r_data4 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_1_r_data5 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_1_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_1_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_1_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_1_D2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_1_D3 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_1_D4 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_1_D5 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_2_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_2_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_2_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_2_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_2_r_data2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_2_r_data3 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_2_r_data4 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_2_r_data5 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_2_r_data6 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_2_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_2_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_2_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_2_D2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_2_D3 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_2_D4 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_2_D5 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_2_D6 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond15_maxpool2d_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond15_maxpool2d_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond15_maxpool2d_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond15_maxpool2d_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond15_maxpool2d_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond15_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond15_maxpool2d_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond15_maxpool2d_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond15_maxpool2d_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_3_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_3_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_3_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_3_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_3_r_data2 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_3_r_data3 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_3_r_data4 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_3_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_3_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_3_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_3_D2 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_3_D3 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist0_stall_entry_o4_4_3_D4 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond14_maxpool2d_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond14_maxpool2d_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond14_maxpool2d_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond14_maxpool2d_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond14_maxpool2d_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond14_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond14_maxpool2d_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond14_maxpool2d_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond14_maxpool2d_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_i_i_010_lc_outerphi_maxpool2d_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_010_lc_outerphi_maxpool2d_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_010_lc_outerphi_maxpool2d_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_010_lc_outerphi_maxpool2d_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_010_lc_outerphi_maxpool2d_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_i_010_lc_outerphi_maxpool2d_r_data2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_i_010_lc_outerphi_maxpool2d_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_010_lc_outerphi_maxpool2d_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_010_lc_outerphi_maxpool2d_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_010_lc_outerphi_maxpool2d_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_i_010_lc_outerphi_maxpool2d_D2 : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- c_i32_1gr(CONSTANT,38)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- redist5_stall_entry_o8_1_0(REG,136)
    redist5_stall_entry_o8_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_stall_entry_o8_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_0_backEN = "1") THEN
                redist5_stall_entry_o8_1_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_f);
            END IF;
        END IF;
    END PROCESS;

    -- i_inc33_maxpool2d(ADD,48)@1
    i_inc33_maxpool2d_a <= STD_LOGIC_VECTOR("0" & redist5_stall_entry_o8_1_0_q);
    i_inc33_maxpool2d_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc33_maxpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc33_maxpool2d_a) + UNSIGNED(i_inc33_maxpool2d_b));
    i_inc33_maxpool2d_q <= i_inc33_maxpool2d_o(32 downto 0);

    -- bgTrunc_i_inc33_maxpool2d_sel_x(BITSELECT,2)@1
    bgTrunc_i_inc33_maxpool2d_sel_x_b <= i_inc33_maxpool2d_q(31 downto 0);

    -- i_incdec_ptr_maxpool2d_maxpool2d35_c_i64_4gr_x(CONSTANT,19)
    i_incdec_ptr_maxpool2d_maxpool2d35_c_i64_4gr_x_q <= "0000000000000000000000000000000000000000000000000000000000000100";

    -- redist8_stall_entry_o10_1_0(REG,141)
    redist8_stall_entry_o10_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_stall_entry_o10_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_0_backEN = "1") THEN
                redist8_stall_entry_o10_1_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_h);
            END IF;
        END IF;
    END PROCESS;

    -- i_incdec_ptr_maxpool2d_maxpool2d35_add_x(ADD,18)@1
    i_incdec_ptr_maxpool2d_maxpool2d35_add_x_a <= STD_LOGIC_VECTOR("0" & redist8_stall_entry_o10_1_0_q);
    i_incdec_ptr_maxpool2d_maxpool2d35_add_x_b <= STD_LOGIC_VECTOR("0" & i_incdec_ptr_maxpool2d_maxpool2d35_c_i64_4gr_x_q);
    i_incdec_ptr_maxpool2d_maxpool2d35_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_incdec_ptr_maxpool2d_maxpool2d35_add_x_a) + UNSIGNED(i_incdec_ptr_maxpool2d_maxpool2d35_add_x_b));
    i_incdec_ptr_maxpool2d_maxpool2d35_add_x_q <= i_incdec_ptr_maxpool2d_maxpool2d35_add_x_o(64 downto 0);

    -- i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x(BITSELECT,17)@1
    i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x_b <= i_incdec_ptr_maxpool2d_maxpool2d35_add_x_q(63 downto 0);

    -- redist6_stall_entry_o9_3_0(REG,137)
    redist6_stall_entry_o9_3_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_stall_entry_o9_3_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_0_backEN = "1") THEN
                redist6_stall_entry_o9_3_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_g);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_stall_entry_o7_2_0(REG,133)
    redist3_stall_entry_o7_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_o7_2_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_0_backEN = "1") THEN
                redist3_stall_entry_o7_2_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_e);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_o6_3_0(REG,129)
    redist1_stall_entry_o6_3_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_o6_3_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_0_backEN = "1") THEN
                redist1_stall_entry_o6_3_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_d);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_stall_entry_o4_4_0(REG,125)
    redist0_stall_entry_o4_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_stall_entry_o4_4_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_0_backEN = "1") THEN
                redist0_stall_entry_o4_4_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_b);
            END IF;
        END IF;
    END PROCESS;

    -- SE_out_bubble_out_stall_entry_2(STALLENABLE,279)
    -- Valid signal propagation
    SE_out_bubble_out_stall_entry_2_V0 <= SE_out_bubble_out_stall_entry_2_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_stall_entry_2_backStall <= i_syncbuf_output_size_sync_buffer2_maxpool2d_out_stall_out or not (SE_out_bubble_out_stall_entry_2_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_stall_entry_2_wireValid <= bubble_out_stall_entry_2_reg_valid_out;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_syncbuf_output_size_sync_buffer2_maxpool2d(BLACKBOX,54)@2
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_output_size_sync_buffer2_maxpool2d : i_syncbuf_output_size_sync_buffer2_maxpool2d36
    PORT MAP (
        in_buffer_in => in_output_size,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_backStall,
        in_valid_in => SE_out_bubble_out_stall_entry_2_V0,
        out_buffer_out => i_syncbuf_output_size_sync_buffer2_maxpool2d_out_buffer_out,
        out_stall_out => i_syncbuf_output_size_sync_buffer2_maxpool2d_out_stall_out,
        out_valid_out => i_syncbuf_output_size_sync_buffer2_maxpool2d_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_syncbuf_output_size_sync_buffer2_maxpool2d(BITJOIN,156)
    bubble_join_i_syncbuf_output_size_sync_buffer2_maxpool2d_q <= i_syncbuf_output_size_sync_buffer2_maxpool2d_out_buffer_out;

    -- bubble_select_i_syncbuf_output_size_sync_buffer2_maxpool2d(BITSELECT,157)
    bubble_select_i_syncbuf_output_size_sync_buffer2_maxpool2d_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_output_size_sync_buffer2_maxpool2d_q(31 downto 0));

    -- redist16_bgTrunc_i_inc33_maxpool2d_sel_x_b_1_0(REG,151)
    redist16_bgTrunc_i_inc33_maxpool2d_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist16_bgTrunc_i_inc33_maxpool2d_sel_x_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_1_backEN = "1") THEN
                redist16_bgTrunc_i_inc33_maxpool2d_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_4_1_D5);
            END IF;
        END IF;
    END PROCESS;

    -- redist15_bgTrunc_i_inc36_maxpool2d_sel_x_b_1_0(REG,150)
    redist15_bgTrunc_i_inc36_maxpool2d_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist15_bgTrunc_i_inc36_maxpool2d_sel_x_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_2_backEN = "1") THEN
                redist15_bgTrunc_i_inc36_maxpool2d_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_4_2_D5);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_stall_entry_o7_3_0(REG,135)
    redist4_stall_entry_o7_3_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_stall_entry_o7_3_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_2_backEN = "1") THEN
                redist4_stall_entry_o7_3_0_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_4_2_D2);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_o6_3_2(REG,131)
    redist1_stall_entry_o6_3_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_o6_3_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_2_backEN = "1") THEN
                redist1_stall_entry_o6_3_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_4_2_D1);
            END IF;
        END IF;
    END PROCESS;

    -- i_exitcond14_maxpool2d(LOGICAL,44)@2 + 1
    i_exitcond14_maxpool2d_qi <= "1" WHEN SR_SE_i_exitcond14_maxpool2d_D0 = SR_SE_i_exitcond14_maxpool2d_D1 ELSE "0";
    i_exitcond14_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_exitcond14_maxpool2d_qi, xout => i_exitcond14_maxpool2d_q, ena => SE_i_exitcond14_maxpool2d_backEN(0), clk => clock, aclr => resetn );

    -- i_unnamed_maxpool2d39(LOGICAL,57)@3
    i_unnamed_maxpool2d39_q <= i_exitcond14_maxpool2d_q or redist1_stall_entry_o6_3_2_q;

    -- SE_out_bubble_out_stall_entry_4(STALLENABLE,283)
    -- Valid signal propagation
    SE_out_bubble_out_stall_entry_4_V0 <= SE_out_bubble_out_stall_entry_4_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_stall_entry_4_backStall <= i_syncbuf_output_size_sync_buffer3_maxpool2d_out_stall_out or not (SE_out_bubble_out_stall_entry_4_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_stall_entry_4_wireValid <= bubble_out_stall_entry_4_reg_valid_out;

    -- i_syncbuf_output_size_sync_buffer3_maxpool2d(BLACKBOX,55)@3
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_output_size_sync_buffer3_maxpool2d : i_syncbuf_output_size_sync_buffer3_maxpool2d46
    PORT MAP (
        in_buffer_in => in_output_size,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_backStall,
        in_valid_in => SE_out_bubble_out_stall_entry_4_V0,
        out_buffer_out => i_syncbuf_output_size_sync_buffer3_maxpool2d_out_buffer_out,
        out_stall_out => i_syncbuf_output_size_sync_buffer3_maxpool2d_out_stall_out,
        out_valid_out => i_syncbuf_output_size_sync_buffer3_maxpool2d_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_syncbuf_output_size_sync_buffer3_maxpool2d(BITJOIN,160)
    bubble_join_i_syncbuf_output_size_sync_buffer3_maxpool2d_q <= i_syncbuf_output_size_sync_buffer3_maxpool2d_out_buffer_out;

    -- bubble_select_i_syncbuf_output_size_sync_buffer3_maxpool2d(BITSELECT,161)
    bubble_select_i_syncbuf_output_size_sync_buffer3_maxpool2d_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_output_size_sync_buffer3_maxpool2d_q(31 downto 0));

    -- SR_bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg(STALLREG,290)
    SR_bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_r_valid <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_r_valid <= bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_backStall and (SR_bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_r_valid or SR_bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_i_valid);

            IF (SR_bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_r_valid = "0") THEN
                -- Data(s)
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_i_valid <= SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_V0;
    -- Stall signal propagation
    SR_bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_backStall <= SR_bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_r_valid or not (SR_bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_i_valid);

    -- Valid
    SR_bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_V <= SR_bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_r_valid WHEN SR_bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_r_valid = "1" ELSE SR_bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_i_valid;


    -- SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d(STALLENABLE,199)
    SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_fromReg0 <= (others => '0');
            SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_fromReg0 <= SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_toReg0;
            -- Succesor 1
            SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_fromReg1 <= SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_consumed0 <= (not (SR_bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_backStall) and SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_wireValid) or SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_fromReg0;
    SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_consumed1 <= (not (SR_SE_i_exitcond15_maxpool2d_backStall) and SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_wireValid) or SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_fromReg1;
    -- Consuming
    SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_StallValid <= SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_backStall and SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_wireValid;
    SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_toReg0 <= SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_StallValid and SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_consumed0;
    SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_toReg1 <= SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_StallValid and SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_consumed1;
    -- Backward Stall generation
    SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_or0 <= SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_consumed0;
    SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_wireStall <= not (SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_consumed1 and SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_or0);
    SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_backStall <= SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_wireStall;
    -- Valid signal propagation
    SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_V0 <= SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_wireValid and not (SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_fromReg0);
    SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_V1 <= SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_wireValid and not (SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_wireValid <= i_syncbuf_output_size_sync_buffer3_maxpool2d_out_valid_out;

    -- SR_SE_i_exitcond15_maxpool2d(STALLREG,293)
    SR_SE_i_exitcond15_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_exitcond15_maxpool2d_r_valid <= (others => '0');
            SR_SE_i_exitcond15_maxpool2d_r_data0 <= (others => '-');
            SR_SE_i_exitcond15_maxpool2d_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_exitcond15_maxpool2d_r_valid <= SE_i_exitcond15_maxpool2d_backStall and (SR_SE_i_exitcond15_maxpool2d_r_valid or SR_SE_i_exitcond15_maxpool2d_i_valid);

            IF (SR_SE_i_exitcond15_maxpool2d_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_exitcond15_maxpool2d_r_data0 <= STD_LOGIC_VECTOR(redist15_bgTrunc_i_inc36_maxpool2d_sel_x_b_1_0_q);
                SR_SE_i_exitcond15_maxpool2d_r_data1 <= STD_LOGIC_VECTOR(bubble_select_i_syncbuf_output_size_sync_buffer3_maxpool2d_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_exitcond15_maxpool2d_and0 <= SE_redist0_stall_entry_o4_4_2_V4;
    SR_SE_i_exitcond15_maxpool2d_i_valid <= SE_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_V1 and SR_SE_i_exitcond15_maxpool2d_and0;
    -- Stall signal propagation
    SR_SE_i_exitcond15_maxpool2d_backStall <= SR_SE_i_exitcond15_maxpool2d_r_valid or not (SR_SE_i_exitcond15_maxpool2d_i_valid);

    -- Valid
    SR_SE_i_exitcond15_maxpool2d_V <= SR_SE_i_exitcond15_maxpool2d_r_valid WHEN SR_SE_i_exitcond15_maxpool2d_r_valid = "1" ELSE SR_SE_i_exitcond15_maxpool2d_i_valid;

    -- Data0
    SR_SE_i_exitcond15_maxpool2d_D0 <= SR_SE_i_exitcond15_maxpool2d_r_data0 WHEN SR_SE_i_exitcond15_maxpool2d_r_valid = "1" ELSE redist15_bgTrunc_i_inc36_maxpool2d_sel_x_b_1_0_q;
    -- Data1
    SR_SE_i_exitcond15_maxpool2d_D1 <= SR_SE_i_exitcond15_maxpool2d_r_data1 WHEN SR_SE_i_exitcond15_maxpool2d_r_valid = "1" ELSE bubble_select_i_syncbuf_output_size_sync_buffer3_maxpool2d_b;

    -- i_scevgep_maxpool2d_maxpool2d45_mult_multconst_x(CONSTANT,25)
    i_scevgep_maxpool2d_maxpool2d45_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- i_unnamed_maxpool2d44_vt_const_63(CONSTANT,64)
    i_unnamed_maxpool2d44_vt_const_63_q <= "0000000000000000000000000000000";

    -- c_i64_1gr(CONSTANT,39)
    c_i64_1gr_q <= "0000000000000000000000000000000000000000000000000000000000000001";

    -- c_i32_0gr(CONSTANT,37)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0(STALLENABLE,247)
    -- Valid signal propagation
    SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_V0 <= SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_s_tv_0 <= SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_backStall and SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_backEN <= not (SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_v_s_0 <= SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_backEN and SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_V;
    -- Backward Stall generation
    SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_backStall <= not (SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_backEN);
    SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_backEN = "0") THEN
                SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_R_v_0 <= SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_R_v_0 and SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_R_v_0 <= SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- dupName_0_c_i32_1gr_x(CONSTANT,6)
    dupName_0_c_i32_1gr_x_q <= "11111111111111111111111111111111";

    -- bubble_join_i_syncbuf_output_size_sync_buffer5_maxpool2d(BITJOIN,164)
    bubble_join_i_syncbuf_output_size_sync_buffer5_maxpool2d_q <= i_syncbuf_output_size_sync_buffer5_maxpool2d_out_buffer_out;

    -- bubble_select_i_syncbuf_output_size_sync_buffer5_maxpool2d(BITSELECT,165)
    bubble_select_i_syncbuf_output_size_sync_buffer5_maxpool2d_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_output_size_sync_buffer5_maxpool2d_q(31 downto 0));

    -- i_unnamed_maxpool2d42(ADD,58)@0
    i_unnamed_maxpool2d42_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_output_size_sync_buffer5_maxpool2d_b);
    i_unnamed_maxpool2d42_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_1gr_x_q);
    i_unnamed_maxpool2d42_o <= STD_LOGIC_VECTOR(UNSIGNED(i_unnamed_maxpool2d42_a) + UNSIGNED(i_unnamed_maxpool2d42_b));
    i_unnamed_maxpool2d42_q <= i_unnamed_maxpool2d42_o(32 downto 0);

    -- bgTrunc_i_unnamed_maxpool2d42_sel_x(BITSELECT,4)@0
    bgTrunc_i_unnamed_maxpool2d42_sel_x_b <= i_unnamed_maxpool2d42_q(31 downto 0);

    -- SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d(STALLENABLE,201)
    SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_fromReg0 <= (others => '0');
            SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_fromReg0 <= SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_toReg0;
            -- Succesor 1
            SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_fromReg1 <= SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_consumed0 <= (not (bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg_stall_out) and SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_wireValid) or SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_fromReg0;
    SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_consumed1 <= (not (SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_backStall) and SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_wireValid) or SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_fromReg1;
    -- Consuming
    SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_StallValid <= SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_backStall and SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_wireValid;
    SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_toReg0 <= SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_StallValid and SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_consumed0;
    SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_toReg1 <= SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_StallValid and SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_consumed1;
    -- Backward Stall generation
    SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_or0 <= SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_consumed0;
    SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_wireStall <= not (SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_consumed1 and SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_or0);
    SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_backStall <= SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_wireStall;
    -- Valid signal propagation
    SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_V0 <= SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_wireValid and not (SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_fromReg0);
    SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_V1 <= SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_wireValid and not (SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_wireValid <= i_syncbuf_output_size_sync_buffer5_maxpool2d_out_valid_out;

    -- SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0(STALLREG,297)
    SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_r_valid <= (others => '0');
            SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_r_valid <= SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_backStall and (SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_r_valid or SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_i_valid);

            IF (SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_r_data0 <= STD_LOGIC_VECTOR(bgTrunc_i_unnamed_maxpool2d42_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_i_valid <= SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_V1;
    -- Stall signal propagation
    SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_backStall <= SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_r_valid or not (SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_i_valid);

    -- Valid
    SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_V <= SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_r_valid WHEN SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_r_valid = "1" ELSE SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_i_valid;

    SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_D0 <= SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_r_data0 WHEN SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_r_valid = "1" ELSE bgTrunc_i_unnamed_maxpool2d42_sel_x_b;

    -- redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0(REG,149)
    redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_backEN = "1") THEN
                redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- i_unnamed_maxpool2d43_sel_x(BITSELECT,31)@1
    i_unnamed_maxpool2d43_sel_x_b <= std_logic_vector(resize(unsigned(redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_q(31 downto 0)), 64));

    -- i_unnamed_maxpool2d43_vt_select_31(BITSELECT,62)@1
    i_unnamed_maxpool2d43_vt_select_31_b <= i_unnamed_maxpool2d43_sel_x_b(31 downto 0);

    -- i_unnamed_maxpool2d43_vt_join(BITJOIN,61)@1
    i_unnamed_maxpool2d43_vt_join_q <= c_i32_0gr_q & i_unnamed_maxpool2d43_vt_select_31_b;

    -- i_unnamed_maxpool2d44(ADD,63)@1
    i_unnamed_maxpool2d44_a <= STD_LOGIC_VECTOR("0" & i_unnamed_maxpool2d43_vt_join_q);
    i_unnamed_maxpool2d44_b <= STD_LOGIC_VECTOR("0" & c_i64_1gr_q);
    i_unnamed_maxpool2d44_o <= STD_LOGIC_VECTOR(UNSIGNED(i_unnamed_maxpool2d44_a) + UNSIGNED(i_unnamed_maxpool2d44_b));
    i_unnamed_maxpool2d44_q <= i_unnamed_maxpool2d44_o(64 downto 0);

    -- bgTrunc_i_unnamed_maxpool2d44_sel_x(BITSELECT,5)@1
    bgTrunc_i_unnamed_maxpool2d44_sel_x_b <= i_unnamed_maxpool2d44_q(63 downto 0);

    -- i_unnamed_maxpool2d44_vt_select_32(BITSELECT,66)@1
    i_unnamed_maxpool2d44_vt_select_32_b <= bgTrunc_i_unnamed_maxpool2d44_sel_x_b(32 downto 0);

    -- redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0(REG,142)
    redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_q <= "000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_backEN = "1") THEN
                redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_q <= STD_LOGIC_VECTOR(i_unnamed_maxpool2d44_vt_select_32_b);
            END IF;
        END IF;
    END PROCESS;

    -- i_unnamed_maxpool2d44_vt_join(BITJOIN,65)@2
    i_unnamed_maxpool2d44_vt_join_q <= i_unnamed_maxpool2d44_vt_const_63_q & redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_q;

    -- i_scevgep_maxpool2d_maxpool2d45_mult_x_bs1_merged_bit_select(BITSELECT,106)@2
    i_scevgep_maxpool2d_maxpool2d45_mult_x_bs1_merged_bit_select_b <= i_unnamed_maxpool2d44_vt_join_q(17 downto 0);
    i_scevgep_maxpool2d_maxpool2d45_mult_x_bs1_merged_bit_select_c <= i_unnamed_maxpool2d44_vt_join_q(63 downto 54);
    i_scevgep_maxpool2d_maxpool2d45_mult_x_bs1_merged_bit_select_d <= i_unnamed_maxpool2d44_vt_join_q(35 downto 18);
    i_scevgep_maxpool2d_maxpool2d45_mult_x_bs1_merged_bit_select_e <= i_unnamed_maxpool2d44_vt_join_q(53 downto 36);

    -- i_scevgep_maxpool2d_maxpool2d45_mult_x_im3_shift0(BITSHIFT,103)@2
    i_scevgep_maxpool2d_maxpool2d45_mult_x_im3_shift0_qint <= i_scevgep_maxpool2d_maxpool2d45_mult_x_bs1_merged_bit_select_c & "00";
    i_scevgep_maxpool2d_maxpool2d45_mult_x_im3_shift0_q <= i_scevgep_maxpool2d_maxpool2d45_mult_x_im3_shift0_qint(11 downto 0);

    -- i_scevgep_maxpool2d_maxpool2d45_mult_x_align_15(BITSHIFT,94)@2
    i_scevgep_maxpool2d_maxpool2d45_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_scevgep_maxpool2d_maxpool2d45_mult_x_im3_shift0_q) & "000000000000000";
    i_scevgep_maxpool2d_maxpool2d45_mult_x_align_15_q <= i_scevgep_maxpool2d_maxpool2d45_mult_x_align_15_qint(27 downto 0);

    -- i_scevgep_maxpool2d_maxpool2d45_mult_x_im6_shift0(BITSHIFT,104)@2
    i_scevgep_maxpool2d_maxpool2d45_mult_x_im6_shift0_qint <= i_scevgep_maxpool2d_maxpool2d45_mult_x_bs1_merged_bit_select_d & "00";
    i_scevgep_maxpool2d_maxpool2d45_mult_x_im6_shift0_q <= i_scevgep_maxpool2d_maxpool2d45_mult_x_im6_shift0_qint(19 downto 0);

    -- i_scevgep_maxpool2d_maxpool2d45_mult_x_align_14(BITSHIFT,93)@2
    i_scevgep_maxpool2d_maxpool2d45_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_scevgep_maxpool2d_maxpool2d45_mult_x_im6_shift0_q) & "000000000000000000";
    i_scevgep_maxpool2d_maxpool2d45_mult_x_align_14_q <= i_scevgep_maxpool2d_maxpool2d45_mult_x_align_14_qint(38 downto 0);

    -- i_scevgep_maxpool2d_maxpool2d45_mult_x_join_16(BITJOIN,95)@2
    i_scevgep_maxpool2d_maxpool2d45_mult_x_join_16_q <= i_scevgep_maxpool2d_maxpool2d45_mult_x_align_15_q & i_scevgep_maxpool2d_maxpool2d45_mult_x_align_14_q;

    -- i_scevgep_maxpool2d_maxpool2d45_mult_x_im9_shift0(BITSHIFT,105)@2
    i_scevgep_maxpool2d_maxpool2d45_mult_x_im9_shift0_qint <= i_scevgep_maxpool2d_maxpool2d45_mult_x_bs1_merged_bit_select_e & "00";
    i_scevgep_maxpool2d_maxpool2d45_mult_x_im9_shift0_q <= i_scevgep_maxpool2d_maxpool2d45_mult_x_im9_shift0_qint(19 downto 0);

    -- i_scevgep_maxpool2d_maxpool2d45_mult_x_align_12(BITSHIFT,91)@2
    i_scevgep_maxpool2d_maxpool2d45_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_scevgep_maxpool2d_maxpool2d45_mult_x_im9_shift0_q) & "000000000000000";
    i_scevgep_maxpool2d_maxpool2d45_mult_x_align_12_q <= i_scevgep_maxpool2d_maxpool2d45_mult_x_align_12_qint(35 downto 0);

    -- i_scevgep_maxpool2d_maxpool2d45_mult_x_im0_shift0(BITSHIFT,102)@2
    i_scevgep_maxpool2d_maxpool2d45_mult_x_im0_shift0_qint <= i_scevgep_maxpool2d_maxpool2d45_mult_x_bs1_merged_bit_select_b & "00";
    i_scevgep_maxpool2d_maxpool2d45_mult_x_im0_shift0_q <= i_scevgep_maxpool2d_maxpool2d45_mult_x_im0_shift0_qint(19 downto 0);

    -- i_scevgep_maxpool2d_maxpool2d45_mult_x_join_13(BITJOIN,92)@2
    i_scevgep_maxpool2d_maxpool2d45_mult_x_join_13_q <= i_scevgep_maxpool2d_maxpool2d45_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_scevgep_maxpool2d_maxpool2d45_mult_x_im0_shift0_q);

    -- i_scevgep_maxpool2d_maxpool2d45_mult_x_result_add_0_0(ADD,96)@2
    i_scevgep_maxpool2d_maxpool2d45_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_scevgep_maxpool2d_maxpool2d45_mult_x_join_13_q);
    i_scevgep_maxpool2d_maxpool2d45_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_scevgep_maxpool2d_maxpool2d45_mult_x_join_16_q);
    i_scevgep_maxpool2d_maxpool2d45_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_scevgep_maxpool2d_maxpool2d45_mult_x_result_add_0_0_a) + UNSIGNED(i_scevgep_maxpool2d_maxpool2d45_mult_x_result_add_0_0_b));
    i_scevgep_maxpool2d_maxpool2d45_mult_x_result_add_0_0_q <= i_scevgep_maxpool2d_maxpool2d45_mult_x_result_add_0_0_o(67 downto 0);

    -- i_scevgep_maxpool2d_maxpool2d45_mult_extender_x(BITJOIN,24)@2
    i_scevgep_maxpool2d_maxpool2d45_mult_extender_x_q <= i_scevgep_maxpool2d_maxpool2d45_mult_multconst_x_q & i_scevgep_maxpool2d_maxpool2d45_mult_x_result_add_0_0_q(66 downto 0);

    -- i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x(BITSELECT,26)@2
    i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b <= i_scevgep_maxpool2d_maxpool2d45_mult_extender_x_q(63 downto 0);

    -- SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0(STALLENABLE,240)
    -- Valid signal propagation
    SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_V0 <= SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_s_tv_0 <= SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_backStall and SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_backEN <= not (SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_v_s_0 <= SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_backEN and SE_redist14_bgTrunc_i_unnamed_maxpool2d42_sel_x_b_1_0_V0;
    -- Backward Stall generation
    SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_backStall <= not (SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_v_s_0);
    SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_backEN = "0") THEN
                SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_R_v_0 <= SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_R_v_0 and SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_s_tv_0;
            ELSE
                SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_R_v_0 <= SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0(STALLREG,298)
    SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_r_valid <= (others => '0');
            SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_r_valid <= SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_backStall and (SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_r_valid or SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_i_valid);

            IF (SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_r_data0 <= STD_LOGIC_VECTOR(i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_i_valid <= SE_redist9_i_unnamed_maxpool2d44_vt_select_32_b_1_0_V0;
    -- Stall signal propagation
    SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_backStall <= SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_r_valid or not (SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_i_valid);

    -- Valid
    SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_V <= SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_r_valid WHEN SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_r_valid = "1" ELSE SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_i_valid;

    SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_D0 <= SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_r_data0 WHEN SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_r_valid = "1" ELSE i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b;

    -- redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0(REG,144)
    redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_stall_entry_o9_3_2(REG,139)
    redist6_stall_entry_o9_3_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_stall_entry_o9_3_2_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_2_backEN = "1") THEN
                redist6_stall_entry_o9_3_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_4_2_D3);
            END IF;
        END IF;
    END PROCESS;

    -- i_scevgep_maxpool2d_maxpool2d45_add_x(ADD,27)@3
    i_scevgep_maxpool2d_maxpool2d45_add_x_a <= STD_LOGIC_VECTOR("0" & redist6_stall_entry_o9_3_2_q);
    i_scevgep_maxpool2d_maxpool2d45_add_x_b <= STD_LOGIC_VECTOR("0" & redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_q);
    i_scevgep_maxpool2d_maxpool2d45_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_scevgep_maxpool2d_maxpool2d45_add_x_a) + UNSIGNED(i_scevgep_maxpool2d_maxpool2d45_add_x_b));
    i_scevgep_maxpool2d_maxpool2d45_add_x_q <= i_scevgep_maxpool2d_maxpool2d45_add_x_o(64 downto 0);

    -- i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x(BITSELECT,21)@3
    i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b <= i_scevgep_maxpool2d_maxpool2d45_add_x_q(63 downto 0);

    -- SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0(STALLREG,299)
    SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_r_valid <= (others => '0');
            SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_r_valid <= SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_backStall and (SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_r_valid or SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_i_valid);

            IF (SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_r_data0 <= STD_LOGIC_VECTOR(i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_i_valid <= SE_i_scevgep_maxpool2d_maxpool2d45_add_x_V0;
    -- Stall signal propagation
    SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_backStall <= SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_r_valid or not (SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_i_valid);

    -- Valid
    SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_V <= SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_r_valid WHEN SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_r_valid = "1" ELSE SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_i_valid;

    SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_D0 <= SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_r_data0 WHEN SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_r_valid = "1" ELSE i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b;

    -- SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0(STALLENABLE,242)
    -- Valid signal propagation
    SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_V0 <= SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_s_tv_0 <= SE_i_scevgep_maxpool2d_maxpool2d45_add_x_backStall and SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_backEN <= not (SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_v_s_0 <= SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_backEN and SR_SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_V;
    -- Backward Stall generation
    SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_backStall <= not (SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_backEN);
    SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_R_v_0 <= SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_R_v_0 and SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_R_v_0 <= SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_scevgep_maxpool2d_maxpool2d45_add_x(STALLENABLE,183)
    -- Valid signal propagation
    SE_i_scevgep_maxpool2d_maxpool2d45_add_x_V0 <= SE_i_scevgep_maxpool2d_maxpool2d45_add_x_wireValid;
    -- Backward Stall generation
    SE_i_scevgep_maxpool2d_maxpool2d45_add_x_backStall <= SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_backStall or not (SE_i_scevgep_maxpool2d_maxpool2d45_add_x_wireValid);
    -- Computing multiple Valid(s)
    SE_i_scevgep_maxpool2d_maxpool2d45_add_x_and0 <= SE_redist0_stall_entry_o4_4_2_V3;
    SE_i_scevgep_maxpool2d_maxpool2d45_add_x_wireValid <= SE_redist11_i_scevgep_maxpool2d_maxpool2d45_trunc_sel_x_b_1_0_V0 and SE_i_scevgep_maxpool2d_maxpool2d45_add_x_and0;

    -- redist17_bgTrunc_i_inc33_maxpool2d_sel_x_b_3_0(REG,152)
    redist17_bgTrunc_i_inc33_maxpool2d_sel_x_b_3_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist17_bgTrunc_i_inc33_maxpool2d_sel_x_b_3_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_2_backEN = "1") THEN
                redist17_bgTrunc_i_inc33_maxpool2d_sel_x_b_3_0_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_4_2_D6);
            END IF;
        END IF;
    END PROCESS;

    -- redist13_i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x_b_3_1(REG,147)
    redist13_i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x_b_3_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x_b_3_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_2_backEN = "1") THEN
                redist13_i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x_b_3_1_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_4_2_D4);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_stall_entry_o4_4_2(REG,127)
    redist0_stall_entry_o4_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_stall_entry_o4_4_2_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_2_backEN = "1") THEN
                redist0_stall_entry_o4_4_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_4_2_D0);
            END IF;
        END IF;
    END PROCESS;

    -- SR_SE_redist0_stall_entry_o4_4_3(STALLREG,294)
    SR_SE_redist0_stall_entry_o4_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist0_stall_entry_o4_4_3_r_valid <= (others => '0');
            SR_SE_redist0_stall_entry_o4_4_3_r_data0 <= (others => '-');
            SR_SE_redist0_stall_entry_o4_4_3_r_data1 <= (others => '-');
            SR_SE_redist0_stall_entry_o4_4_3_r_data2 <= (others => '-');
            SR_SE_redist0_stall_entry_o4_4_3_r_data3 <= (others => '-');
            SR_SE_redist0_stall_entry_o4_4_3_r_data4 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist0_stall_entry_o4_4_3_r_valid <= SE_redist0_stall_entry_o4_4_3_backStall and (SR_SE_redist0_stall_entry_o4_4_3_r_valid or SR_SE_redist0_stall_entry_o4_4_3_i_valid);

            IF (SR_SE_redist0_stall_entry_o4_4_3_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist0_stall_entry_o4_4_3_r_data0 <= STD_LOGIC_VECTOR(redist0_stall_entry_o4_4_2_q);
                SR_SE_redist0_stall_entry_o4_4_3_r_data1 <= STD_LOGIC_VECTOR(redist1_stall_entry_o6_3_2_q);
                SR_SE_redist0_stall_entry_o4_4_3_r_data2 <= STD_LOGIC_VECTOR(redist6_stall_entry_o9_3_2_q);
                SR_SE_redist0_stall_entry_o4_4_3_r_data3 <= STD_LOGIC_VECTOR(redist13_i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x_b_3_1_q);
                SR_SE_redist0_stall_entry_o4_4_3_r_data4 <= STD_LOGIC_VECTOR(redist17_bgTrunc_i_inc33_maxpool2d_sel_x_b_3_0_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist0_stall_entry_o4_4_3_i_valid <= SE_redist0_stall_entry_o4_4_2_V0;
    -- Stall signal propagation
    SR_SE_redist0_stall_entry_o4_4_3_backStall <= SR_SE_redist0_stall_entry_o4_4_3_r_valid or not (SR_SE_redist0_stall_entry_o4_4_3_i_valid);

    -- Valid
    SR_SE_redist0_stall_entry_o4_4_3_V <= SR_SE_redist0_stall_entry_o4_4_3_r_valid WHEN SR_SE_redist0_stall_entry_o4_4_3_r_valid = "1" ELSE SR_SE_redist0_stall_entry_o4_4_3_i_valid;

    -- Data0
    SR_SE_redist0_stall_entry_o4_4_3_D0 <= SR_SE_redist0_stall_entry_o4_4_3_r_data0 WHEN SR_SE_redist0_stall_entry_o4_4_3_r_valid = "1" ELSE redist0_stall_entry_o4_4_2_q;
    -- Data1
    SR_SE_redist0_stall_entry_o4_4_3_D1 <= SR_SE_redist0_stall_entry_o4_4_3_r_data1 WHEN SR_SE_redist0_stall_entry_o4_4_3_r_valid = "1" ELSE redist1_stall_entry_o6_3_2_q;
    -- Data2
    SR_SE_redist0_stall_entry_o4_4_3_D2 <= SR_SE_redist0_stall_entry_o4_4_3_r_data2 WHEN SR_SE_redist0_stall_entry_o4_4_3_r_valid = "1" ELSE redist6_stall_entry_o9_3_2_q;
    -- Data3
    SR_SE_redist0_stall_entry_o4_4_3_D3 <= SR_SE_redist0_stall_entry_o4_4_3_r_data3 WHEN SR_SE_redist0_stall_entry_o4_4_3_r_valid = "1" ELSE redist13_i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x_b_3_1_q;
    -- Data4
    SR_SE_redist0_stall_entry_o4_4_3_D4 <= SR_SE_redist0_stall_entry_o4_4_3_r_data4 WHEN SR_SE_redist0_stall_entry_o4_4_3_r_valid = "1" ELSE redist17_bgTrunc_i_inc33_maxpool2d_sel_x_b_3_0_q;

    -- SE_redist0_stall_entry_o4_4_2(STALLENABLE,225)
    -- Valid signal propagation
    SE_redist0_stall_entry_o4_4_2_V0 <= SE_redist0_stall_entry_o4_4_2_R_v_0;
    SE_redist0_stall_entry_o4_4_2_V1 <= SE_redist0_stall_entry_o4_4_2_R_v_1;
    SE_redist0_stall_entry_o4_4_2_V2 <= SE_redist0_stall_entry_o4_4_2_R_v_2;
    SE_redist0_stall_entry_o4_4_2_V3 <= SE_redist0_stall_entry_o4_4_2_R_v_3;
    SE_redist0_stall_entry_o4_4_2_V4 <= SE_redist0_stall_entry_o4_4_2_R_v_4;
    -- Stall signal propagation
    SE_redist0_stall_entry_o4_4_2_s_tv_0 <= SR_SE_redist0_stall_entry_o4_4_3_backStall and SE_redist0_stall_entry_o4_4_2_R_v_0;
    SE_redist0_stall_entry_o4_4_2_s_tv_1 <= SE_i_unnamed_maxpool2d39_backStall and SE_redist0_stall_entry_o4_4_2_R_v_1;
    SE_redist0_stall_entry_o4_4_2_s_tv_2 <= SR_SE_i_i_010_lc_outerphi_maxpool2d_backStall and SE_redist0_stall_entry_o4_4_2_R_v_2;
    SE_redist0_stall_entry_o4_4_2_s_tv_3 <= SE_i_scevgep_maxpool2d_maxpool2d45_add_x_backStall and SE_redist0_stall_entry_o4_4_2_R_v_3;
    SE_redist0_stall_entry_o4_4_2_s_tv_4 <= SR_SE_i_exitcond15_maxpool2d_backStall and SE_redist0_stall_entry_o4_4_2_R_v_4;
    -- Backward Enable generation
    SE_redist0_stall_entry_o4_4_2_or0 <= SE_redist0_stall_entry_o4_4_2_s_tv_0;
    SE_redist0_stall_entry_o4_4_2_or1 <= SE_redist0_stall_entry_o4_4_2_s_tv_1 or SE_redist0_stall_entry_o4_4_2_or0;
    SE_redist0_stall_entry_o4_4_2_or2 <= SE_redist0_stall_entry_o4_4_2_s_tv_2 or SE_redist0_stall_entry_o4_4_2_or1;
    SE_redist0_stall_entry_o4_4_2_or3 <= SE_redist0_stall_entry_o4_4_2_s_tv_3 or SE_redist0_stall_entry_o4_4_2_or2;
    SE_redist0_stall_entry_o4_4_2_backEN <= not (SE_redist0_stall_entry_o4_4_2_s_tv_4 or SE_redist0_stall_entry_o4_4_2_or3);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_stall_entry_o4_4_2_v_s_0 <= SE_redist0_stall_entry_o4_4_2_backEN and SR_SE_redist0_stall_entry_o4_4_2_V;
    -- Backward Stall generation
    SE_redist0_stall_entry_o4_4_2_backStall <= not (SE_redist0_stall_entry_o4_4_2_backEN);
    SE_redist0_stall_entry_o4_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_stall_entry_o4_4_2_R_v_0 <= (others => '0');
            SE_redist0_stall_entry_o4_4_2_R_v_1 <= (others => '0');
            SE_redist0_stall_entry_o4_4_2_R_v_2 <= (others => '0');
            SE_redist0_stall_entry_o4_4_2_R_v_3 <= (others => '0');
            SE_redist0_stall_entry_o4_4_2_R_v_4 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_2_backEN = "0") THEN
                SE_redist0_stall_entry_o4_4_2_R_v_0 <= SE_redist0_stall_entry_o4_4_2_R_v_0 and SE_redist0_stall_entry_o4_4_2_s_tv_0;
            ELSE
                SE_redist0_stall_entry_o4_4_2_R_v_0 <= SE_redist0_stall_entry_o4_4_2_v_s_0;
            END IF;

            IF (SE_redist0_stall_entry_o4_4_2_backEN = "0") THEN
                SE_redist0_stall_entry_o4_4_2_R_v_1 <= SE_redist0_stall_entry_o4_4_2_R_v_1 and SE_redist0_stall_entry_o4_4_2_s_tv_1;
            ELSE
                SE_redist0_stall_entry_o4_4_2_R_v_1 <= SE_redist0_stall_entry_o4_4_2_v_s_0;
            END IF;

            IF (SE_redist0_stall_entry_o4_4_2_backEN = "0") THEN
                SE_redist0_stall_entry_o4_4_2_R_v_2 <= SE_redist0_stall_entry_o4_4_2_R_v_2 and SE_redist0_stall_entry_o4_4_2_s_tv_2;
            ELSE
                SE_redist0_stall_entry_o4_4_2_R_v_2 <= SE_redist0_stall_entry_o4_4_2_v_s_0;
            END IF;

            IF (SE_redist0_stall_entry_o4_4_2_backEN = "0") THEN
                SE_redist0_stall_entry_o4_4_2_R_v_3 <= SE_redist0_stall_entry_o4_4_2_R_v_3 and SE_redist0_stall_entry_o4_4_2_s_tv_3;
            ELSE
                SE_redist0_stall_entry_o4_4_2_R_v_3 <= SE_redist0_stall_entry_o4_4_2_v_s_0;
            END IF;

            IF (SE_redist0_stall_entry_o4_4_2_backEN = "0") THEN
                SE_redist0_stall_entry_o4_4_2_R_v_4 <= SE_redist0_stall_entry_o4_4_2_R_v_4 and SE_redist0_stall_entry_o4_4_2_s_tv_4;
            ELSE
                SE_redist0_stall_entry_o4_4_2_R_v_4 <= SE_redist0_stall_entry_o4_4_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0(STALLREG,296)
    SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_r_valid <= (others => '0');
            SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_r_valid <= SE_redist10_i_unnamed_maxpool2d39_q_1_0_backStall and (SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_r_valid or SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_i_valid);

            IF (SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_r_data0 <= STD_LOGIC_VECTOR(i_unnamed_maxpool2d39_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_i_valid <= SE_i_unnamed_maxpool2d39_V1;
    -- Stall signal propagation
    SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_backStall <= SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_r_valid or not (SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_i_valid);

    -- Valid
    SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_V <= SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_r_valid WHEN SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_r_valid = "1" ELSE SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_i_valid;

    SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_D0 <= SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_r_data0 WHEN SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_r_valid = "1" ELSE i_unnamed_maxpool2d39_q;

    -- SE_i_unnamed_maxpool2d39(STALLENABLE,202)
    SE_i_unnamed_maxpool2d39_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_unnamed_maxpool2d39_fromReg0 <= (others => '0');
            SE_i_unnamed_maxpool2d39_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_i_unnamed_maxpool2d39_fromReg0 <= SE_i_unnamed_maxpool2d39_toReg0;
            -- Succesor 1
            SE_i_unnamed_maxpool2d39_fromReg1 <= SE_i_unnamed_maxpool2d39_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_i_unnamed_maxpool2d39_consumed0 <= (not (SR_SE_i_i_010_lc_outerphi_maxpool2d_backStall) and SE_i_unnamed_maxpool2d39_wireValid) or SE_i_unnamed_maxpool2d39_fromReg0;
    SE_i_unnamed_maxpool2d39_consumed1 <= (not (SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_backStall) and SE_i_unnamed_maxpool2d39_wireValid) or SE_i_unnamed_maxpool2d39_fromReg1;
    -- Consuming
    SE_i_unnamed_maxpool2d39_StallValid <= SE_i_unnamed_maxpool2d39_backStall and SE_i_unnamed_maxpool2d39_wireValid;
    SE_i_unnamed_maxpool2d39_toReg0 <= SE_i_unnamed_maxpool2d39_StallValid and SE_i_unnamed_maxpool2d39_consumed0;
    SE_i_unnamed_maxpool2d39_toReg1 <= SE_i_unnamed_maxpool2d39_StallValid and SE_i_unnamed_maxpool2d39_consumed1;
    -- Backward Stall generation
    SE_i_unnamed_maxpool2d39_or0 <= SE_i_unnamed_maxpool2d39_consumed0;
    SE_i_unnamed_maxpool2d39_wireStall <= not (SE_i_unnamed_maxpool2d39_consumed1 and SE_i_unnamed_maxpool2d39_or0);
    SE_i_unnamed_maxpool2d39_backStall <= SE_i_unnamed_maxpool2d39_wireStall;
    -- Valid signal propagation
    SE_i_unnamed_maxpool2d39_V0 <= SE_i_unnamed_maxpool2d39_wireValid and not (SE_i_unnamed_maxpool2d39_fromReg0);
    SE_i_unnamed_maxpool2d39_V1 <= SE_i_unnamed_maxpool2d39_wireValid and not (SE_i_unnamed_maxpool2d39_fromReg1);
    -- Computing multiple Valid(s)
    SE_i_unnamed_maxpool2d39_and0 <= SE_i_exitcond14_maxpool2d_V0;
    SE_i_unnamed_maxpool2d39_wireValid <= SE_redist0_stall_entry_o4_4_2_V1 and SE_i_unnamed_maxpool2d39_and0;

    -- SR_SE_i_i_010_lc_outerphi_maxpool2d(STALLREG,300)
    SR_SE_i_i_010_lc_outerphi_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_i_010_lc_outerphi_maxpool2d_r_valid <= (others => '0');
            SR_SE_i_i_010_lc_outerphi_maxpool2d_r_data0 <= (others => '-');
            SR_SE_i_i_010_lc_outerphi_maxpool2d_r_data1 <= (others => '-');
            SR_SE_i_i_010_lc_outerphi_maxpool2d_r_data2 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_i_010_lc_outerphi_maxpool2d_r_valid <= SE_i_i_010_lc_outerphi_maxpool2d_backStall and (SR_SE_i_i_010_lc_outerphi_maxpool2d_r_valid or SR_SE_i_i_010_lc_outerphi_maxpool2d_i_valid);

            IF (SR_SE_i_i_010_lc_outerphi_maxpool2d_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_i_010_lc_outerphi_maxpool2d_r_data0 <= i_unnamed_maxpool2d39_q;
                SR_SE_i_i_010_lc_outerphi_maxpool2d_r_data1 <= redist4_stall_entry_o7_3_0_q;
                SR_SE_i_i_010_lc_outerphi_maxpool2d_r_data2 <= redist15_bgTrunc_i_inc36_maxpool2d_sel_x_b_1_0_q;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_i_010_lc_outerphi_maxpool2d_and0 <= SE_i_unnamed_maxpool2d39_V0;
    SR_SE_i_i_010_lc_outerphi_maxpool2d_i_valid <= SE_redist0_stall_entry_o4_4_2_V2 and SR_SE_i_i_010_lc_outerphi_maxpool2d_and0;
    -- Stall signal propagation
    SR_SE_i_i_010_lc_outerphi_maxpool2d_backStall <= SR_SE_i_i_010_lc_outerphi_maxpool2d_r_valid or not (SR_SE_i_i_010_lc_outerphi_maxpool2d_i_valid);

    -- Valid
    SR_SE_i_i_010_lc_outerphi_maxpool2d_V <= SR_SE_i_i_010_lc_outerphi_maxpool2d_r_valid WHEN SR_SE_i_i_010_lc_outerphi_maxpool2d_r_valid = "1" ELSE SR_SE_i_i_010_lc_outerphi_maxpool2d_i_valid;

    -- Data0
    SR_SE_i_i_010_lc_outerphi_maxpool2d_D0 <= SR_SE_i_i_010_lc_outerphi_maxpool2d_r_data0 WHEN SR_SE_i_i_010_lc_outerphi_maxpool2d_r_valid = "1" ELSE i_unnamed_maxpool2d39_q;
    -- Data1
    SR_SE_i_i_010_lc_outerphi_maxpool2d_D1 <= SR_SE_i_i_010_lc_outerphi_maxpool2d_r_data1 WHEN SR_SE_i_i_010_lc_outerphi_maxpool2d_r_valid = "1" ELSE redist4_stall_entry_o7_3_0_q;
    -- Data2
    SR_SE_i_i_010_lc_outerphi_maxpool2d_D2 <= SR_SE_i_i_010_lc_outerphi_maxpool2d_r_data2 WHEN SR_SE_i_i_010_lc_outerphi_maxpool2d_r_valid = "1" ELSE redist15_bgTrunc_i_inc36_maxpool2d_sel_x_b_1_0_q;

    -- SE_i_i_010_lc_outerphi_maxpool2d(STALLENABLE,188)
    -- Valid signal propagation
    SE_i_i_010_lc_outerphi_maxpool2d_V0 <= SE_i_i_010_lc_outerphi_maxpool2d_R_v_0;
    -- Stall signal propagation
    SE_i_i_010_lc_outerphi_maxpool2d_s_tv_0 <= SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_backStall and SE_i_i_010_lc_outerphi_maxpool2d_R_v_0;
    -- Backward Enable generation
    SE_i_i_010_lc_outerphi_maxpool2d_backEN <= not (SE_i_i_010_lc_outerphi_maxpool2d_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_i_010_lc_outerphi_maxpool2d_v_s_0 <= SE_i_i_010_lc_outerphi_maxpool2d_backEN and SR_SE_i_i_010_lc_outerphi_maxpool2d_V;
    -- Backward Stall generation
    SE_i_i_010_lc_outerphi_maxpool2d_backStall <= not (SE_i_i_010_lc_outerphi_maxpool2d_backEN);
    SE_i_i_010_lc_outerphi_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_i_010_lc_outerphi_maxpool2d_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_i_010_lc_outerphi_maxpool2d_backEN = "0") THEN
                SE_i_i_010_lc_outerphi_maxpool2d_R_v_0 <= SE_i_i_010_lc_outerphi_maxpool2d_R_v_0 and SE_i_i_010_lc_outerphi_maxpool2d_s_tv_0;
            ELSE
                SE_i_i_010_lc_outerphi_maxpool2d_R_v_0 <= SE_i_i_010_lc_outerphi_maxpool2d_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0(STALLENABLE,243)
    -- Valid signal propagation
    SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_V0 <= SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_s_tv_0 <= SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_backStall and SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_backEN <= not (SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_v_s_0 <= SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_backEN and SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_V;
    -- Backward Stall generation
    SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_backStall <= not (SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_backEN);
    SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_R_v_0 <= SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_R_v_0 and SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_R_v_0 <= SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist10_i_unnamed_maxpool2d39_q_1_0(STALLENABLE,241)
    -- Valid signal propagation
    SE_redist10_i_unnamed_maxpool2d39_q_1_0_V0 <= SE_redist10_i_unnamed_maxpool2d39_q_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist10_i_unnamed_maxpool2d39_q_1_0_s_tv_0 <= SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_backStall and SE_redist10_i_unnamed_maxpool2d39_q_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist10_i_unnamed_maxpool2d39_q_1_0_backEN <= not (SE_redist10_i_unnamed_maxpool2d39_q_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist10_i_unnamed_maxpool2d39_q_1_0_v_s_0 <= SE_redist10_i_unnamed_maxpool2d39_q_1_0_backEN and SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_V;
    -- Backward Stall generation
    SE_redist10_i_unnamed_maxpool2d39_q_1_0_backStall <= not (SE_redist10_i_unnamed_maxpool2d39_q_1_0_backEN);
    SE_redist10_i_unnamed_maxpool2d39_q_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist10_i_unnamed_maxpool2d39_q_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist10_i_unnamed_maxpool2d39_q_1_0_backEN = "0") THEN
                SE_redist10_i_unnamed_maxpool2d39_q_1_0_R_v_0 <= SE_redist10_i_unnamed_maxpool2d39_q_1_0_R_v_0 and SE_redist10_i_unnamed_maxpool2d39_q_1_0_s_tv_0;
            ELSE
                SE_redist10_i_unnamed_maxpool2d39_q_1_0_R_v_0 <= SE_redist10_i_unnamed_maxpool2d39_q_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg(STALLFIFO,284)
    bubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg_valid_in <= SE_out_i_store_unnamed_maxpool2d1_maxpool2d_V0;
    bubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg_stall_in <= SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_backStall;
    bubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg_valid_in_bitsignaltemp <= bubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg_valid_in(0);
    bubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg_stall_in_bitsignaltemp <= bubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg_stall_in(0);
    bubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg_valid_out(0) <= bubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg_valid_out_bitsignaltemp;
    bubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg_stall_out(0) <= bubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg_stall_out_bitsignaltemp;
    thebubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_redist0_stall_entry_o4_4_3(STALLENABLE,226)
    -- Valid signal propagation
    SE_redist0_stall_entry_o4_4_3_V0 <= SE_redist0_stall_entry_o4_4_3_R_v_0;
    -- Stall signal propagation
    SE_redist0_stall_entry_o4_4_3_s_tv_0 <= SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_backStall and SE_redist0_stall_entry_o4_4_3_R_v_0;
    -- Backward Enable generation
    SE_redist0_stall_entry_o4_4_3_backEN <= not (SE_redist0_stall_entry_o4_4_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_stall_entry_o4_4_3_v_s_0 <= SE_redist0_stall_entry_o4_4_3_backEN and SR_SE_redist0_stall_entry_o4_4_3_V;
    -- Backward Stall generation
    SE_redist0_stall_entry_o4_4_3_backStall <= not (SE_redist0_stall_entry_o4_4_3_backEN);
    SE_redist0_stall_entry_o4_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_stall_entry_o4_4_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_3_backEN = "0") THEN
                SE_redist0_stall_entry_o4_4_3_R_v_0 <= SE_redist0_stall_entry_o4_4_3_R_v_0 and SE_redist0_stall_entry_o4_4_3_s_tv_0;
            ELSE
                SE_redist0_stall_entry_o4_4_3_R_v_0 <= SE_redist0_stall_entry_o4_4_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_exitcond15_maxpool2d(STALLENABLE,186)
    -- Valid signal propagation
    SE_i_exitcond15_maxpool2d_V0 <= SE_i_exitcond15_maxpool2d_R_v_0;
    -- Stall signal propagation
    SE_i_exitcond15_maxpool2d_s_tv_0 <= SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_backStall and SE_i_exitcond15_maxpool2d_R_v_0;
    -- Backward Enable generation
    SE_i_exitcond15_maxpool2d_backEN <= not (SE_i_exitcond15_maxpool2d_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_exitcond15_maxpool2d_v_s_0 <= SE_i_exitcond15_maxpool2d_backEN and SR_SE_i_exitcond15_maxpool2d_V;
    -- Backward Stall generation
    SE_i_exitcond15_maxpool2d_backStall <= not (SE_i_exitcond15_maxpool2d_backEN);
    SE_i_exitcond15_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_exitcond15_maxpool2d_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_exitcond15_maxpool2d_backEN = "0") THEN
                SE_i_exitcond15_maxpool2d_R_v_0 <= SE_i_exitcond15_maxpool2d_R_v_0 and SE_i_exitcond15_maxpool2d_s_tv_0;
            ELSE
                SE_i_exitcond15_maxpool2d_R_v_0 <= SE_i_exitcond15_maxpool2d_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg(STALLENABLE,286)
    -- Valid signal propagation
    bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_V0 <= bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_R_v_0;
    -- Stall signal propagation
    bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_s_tv_0 <= SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_backStall and bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_R_v_0;
    -- Backward Enable generation
    bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_backEN <= not (bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_v_s_0 <= bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_backEN and SR_bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_V;
    -- Backward Stall generation
    bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_backStall <= not (bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_backEN);
    bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_backEN = "0") THEN
                bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_R_v_0 <= bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_R_v_0 and bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_s_tv_0;
            ELSE
                bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_R_v_0 <= bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg(STALLFIFO,287)
    bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg_valid_in <= SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_V0;
    bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg_stall_in <= SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_backStall;
    bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg_valid_in_bitsignaltemp <= bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg_valid_in(0);
    bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg_stall_in_bitsignaltemp <= bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg_stall_in(0);
    bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg_valid_out(0) <= bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg_valid_out_bitsignaltemp;
    bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg_stall_out(0) <= bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg_stall_out_bitsignaltemp;
    thebubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 5,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1(STALLENABLE,271)
    -- Valid signal propagation
    SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_V0 <= SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_backStall <= in_stall_in or not (SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_and0 <= bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_reg_valid_out;
    SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_and1 <= bubble_out_i_syncbuf_output_size_sync_buffer3_maxpool2d_1_reg_V0 and SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_and0;
    SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_and2 <= bubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg_valid_out and SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_and1;
    SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_and3 <= SE_i_exitcond15_maxpool2d_V0 and SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_and2;
    SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_and4 <= SE_redist0_stall_entry_o4_4_3_V0 and SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_and3;
    SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_and5 <= bubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg_valid_out and SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_and4;
    SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_and6 <= SE_redist10_i_unnamed_maxpool2d39_q_1_0_V0 and SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_and5;
    SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_and7 <= SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_V0 and SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_and6;
    SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_wireValid <= SE_i_i_010_lc_outerphi_maxpool2d_V0 and SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_and7;

    -- bubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg(STALLFIFO,285)
    bubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg_valid_in <= SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_V0;
    bubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg_stall_in <= SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_backStall;
    bubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg_valid_in_bitsignaltemp <= bubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg_valid_in(0);
    bubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg_stall_in_bitsignaltemp <= bubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg_stall_in(0);
    bubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg_valid_out(0) <= bubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg_valid_out_bitsignaltemp;
    bubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg_stall_out(0) <= bubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg_stall_out_bitsignaltemp;
    thebubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d(STALLENABLE,197)
    SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_fromReg0 <= (others => '0');
            SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_fromReg0 <= SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_toReg0;
            -- Succesor 1
            SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_fromReg1 <= SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_consumed0 <= (not (bubble_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_1_reg_stall_out) and SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_wireValid) or SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_fromReg0;
    SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_consumed1 <= (not (SR_SE_i_exitcond14_maxpool2d_backStall) and SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_wireValid) or SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_fromReg1;
    -- Consuming
    SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_StallValid <= SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_backStall and SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_wireValid;
    SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_toReg0 <= SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_StallValid and SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_consumed0;
    SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_toReg1 <= SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_StallValid and SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_consumed1;
    -- Backward Stall generation
    SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_or0 <= SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_consumed0;
    SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_wireStall <= not (SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_consumed1 and SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_or0);
    SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_backStall <= SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_wireStall;
    -- Valid signal propagation
    SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_V0 <= SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_wireValid and not (SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_fromReg0);
    SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_V1 <= SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_wireValid and not (SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_wireValid <= i_syncbuf_output_size_sync_buffer2_maxpool2d_out_valid_out;

    -- SE_i_exitcond14_maxpool2d(STALLENABLE,185)
    -- Valid signal propagation
    SE_i_exitcond14_maxpool2d_V0 <= SE_i_exitcond14_maxpool2d_R_v_0;
    -- Stall signal propagation
    SE_i_exitcond14_maxpool2d_s_tv_0 <= SE_i_unnamed_maxpool2d39_backStall and SE_i_exitcond14_maxpool2d_R_v_0;
    -- Backward Enable generation
    SE_i_exitcond14_maxpool2d_backEN <= not (SE_i_exitcond14_maxpool2d_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_exitcond14_maxpool2d_v_s_0 <= SE_i_exitcond14_maxpool2d_backEN and SR_SE_i_exitcond14_maxpool2d_V;
    -- Backward Stall generation
    SE_i_exitcond14_maxpool2d_backStall <= not (SE_i_exitcond14_maxpool2d_backEN);
    SE_i_exitcond14_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_exitcond14_maxpool2d_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_exitcond14_maxpool2d_backEN = "0") THEN
                SE_i_exitcond14_maxpool2d_R_v_0 <= SE_i_exitcond14_maxpool2d_R_v_0 and SE_i_exitcond14_maxpool2d_s_tv_0;
            ELSE
                SE_i_exitcond14_maxpool2d_R_v_0 <= SE_i_exitcond14_maxpool2d_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_i_exitcond14_maxpool2d(STALLREG,295)
    SR_SE_i_exitcond14_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_exitcond14_maxpool2d_r_valid <= (others => '0');
            SR_SE_i_exitcond14_maxpool2d_r_data0 <= (others => '-');
            SR_SE_i_exitcond14_maxpool2d_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_exitcond14_maxpool2d_r_valid <= SE_i_exitcond14_maxpool2d_backStall and (SR_SE_i_exitcond14_maxpool2d_r_valid or SR_SE_i_exitcond14_maxpool2d_i_valid);

            IF (SR_SE_i_exitcond14_maxpool2d_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_exitcond14_maxpool2d_r_data0 <= STD_LOGIC_VECTOR(redist16_bgTrunc_i_inc33_maxpool2d_sel_x_b_1_0_q);
                SR_SE_i_exitcond14_maxpool2d_r_data1 <= STD_LOGIC_VECTOR(bubble_select_i_syncbuf_output_size_sync_buffer2_maxpool2d_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_exitcond14_maxpool2d_and0 <= SE_redist0_stall_entry_o4_4_1_V1;
    SR_SE_i_exitcond14_maxpool2d_i_valid <= SE_out_i_syncbuf_output_size_sync_buffer2_maxpool2d_V1 and SR_SE_i_exitcond14_maxpool2d_and0;
    -- Stall signal propagation
    SR_SE_i_exitcond14_maxpool2d_backStall <= SR_SE_i_exitcond14_maxpool2d_r_valid or not (SR_SE_i_exitcond14_maxpool2d_i_valid);

    -- Valid
    SR_SE_i_exitcond14_maxpool2d_V <= SR_SE_i_exitcond14_maxpool2d_r_valid WHEN SR_SE_i_exitcond14_maxpool2d_r_valid = "1" ELSE SR_SE_i_exitcond14_maxpool2d_i_valid;

    -- Data0
    SR_SE_i_exitcond14_maxpool2d_D0 <= SR_SE_i_exitcond14_maxpool2d_r_data0 WHEN SR_SE_i_exitcond14_maxpool2d_r_valid = "1" ELSE redist16_bgTrunc_i_inc33_maxpool2d_sel_x_b_1_0_q;
    -- Data1
    SR_SE_i_exitcond14_maxpool2d_D1 <= SR_SE_i_exitcond14_maxpool2d_r_data1 WHEN SR_SE_i_exitcond14_maxpool2d_r_valid = "1" ELSE bubble_select_i_syncbuf_output_size_sync_buffer2_maxpool2d_b;

    -- i_inc36_maxpool2d(ADD,49)@2
    i_inc36_maxpool2d_a <= STD_LOGIC_VECTOR("0" & redist3_stall_entry_o7_2_1_q);
    i_inc36_maxpool2d_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc36_maxpool2d_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc36_maxpool2d_a) + UNSIGNED(i_inc36_maxpool2d_b));
    i_inc36_maxpool2d_q <= i_inc36_maxpool2d_o(32 downto 0);

    -- bgTrunc_i_inc36_maxpool2d_sel_x(BITSELECT,3)@2
    bgTrunc_i_inc36_maxpool2d_sel_x_b <= i_inc36_maxpool2d_q(31 downto 0);

    -- redist13_i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x_b_3_0(REG,146)
    redist13_i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x_b_3_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x_b_3_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_1_backEN = "1") THEN
                redist13_i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x_b_3_0_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_4_1_D4);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_stall_entry_o9_3_1(REG,138)
    redist6_stall_entry_o9_3_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_stall_entry_o9_3_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_1_backEN = "1") THEN
                redist6_stall_entry_o9_3_1_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_4_1_D3);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_stall_entry_o7_2_1(REG,134)
    redist3_stall_entry_o7_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_o7_2_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_1_backEN = "1") THEN
                redist3_stall_entry_o7_2_1_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_4_1_D2);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_o6_3_1(REG,130)
    redist1_stall_entry_o6_3_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_o6_3_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_1_backEN = "1") THEN
                redist1_stall_entry_o6_3_1_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_4_1_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_stall_entry_o4_4_1(REG,126)
    redist0_stall_entry_o4_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_stall_entry_o4_4_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_1_backEN = "1") THEN
                redist0_stall_entry_o4_4_1_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_4_1_D0);
            END IF;
        END IF;
    END PROCESS;

    -- SR_SE_redist0_stall_entry_o4_4_2(STALLREG,292)
    SR_SE_redist0_stall_entry_o4_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist0_stall_entry_o4_4_2_r_valid <= (others => '0');
            SR_SE_redist0_stall_entry_o4_4_2_r_data0 <= (others => '-');
            SR_SE_redist0_stall_entry_o4_4_2_r_data1 <= (others => '-');
            SR_SE_redist0_stall_entry_o4_4_2_r_data2 <= (others => '-');
            SR_SE_redist0_stall_entry_o4_4_2_r_data3 <= (others => '-');
            SR_SE_redist0_stall_entry_o4_4_2_r_data4 <= (others => '-');
            SR_SE_redist0_stall_entry_o4_4_2_r_data5 <= (others => '-');
            SR_SE_redist0_stall_entry_o4_4_2_r_data6 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist0_stall_entry_o4_4_2_r_valid <= SE_redist0_stall_entry_o4_4_2_backStall and (SR_SE_redist0_stall_entry_o4_4_2_r_valid or SR_SE_redist0_stall_entry_o4_4_2_i_valid);

            IF (SR_SE_redist0_stall_entry_o4_4_2_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist0_stall_entry_o4_4_2_r_data0 <= STD_LOGIC_VECTOR(redist0_stall_entry_o4_4_1_q);
                SR_SE_redist0_stall_entry_o4_4_2_r_data1 <= STD_LOGIC_VECTOR(redist1_stall_entry_o6_3_1_q);
                SR_SE_redist0_stall_entry_o4_4_2_r_data2 <= STD_LOGIC_VECTOR(redist3_stall_entry_o7_2_1_q);
                SR_SE_redist0_stall_entry_o4_4_2_r_data3 <= STD_LOGIC_VECTOR(redist6_stall_entry_o9_3_1_q);
                SR_SE_redist0_stall_entry_o4_4_2_r_data4 <= STD_LOGIC_VECTOR(redist13_i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x_b_3_0_q);
                SR_SE_redist0_stall_entry_o4_4_2_r_data5 <= STD_LOGIC_VECTOR(bgTrunc_i_inc36_maxpool2d_sel_x_b);
                SR_SE_redist0_stall_entry_o4_4_2_r_data6 <= STD_LOGIC_VECTOR(redist16_bgTrunc_i_inc33_maxpool2d_sel_x_b_1_0_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist0_stall_entry_o4_4_2_i_valid <= SE_redist0_stall_entry_o4_4_1_V0;
    -- Stall signal propagation
    SR_SE_redist0_stall_entry_o4_4_2_backStall <= SR_SE_redist0_stall_entry_o4_4_2_r_valid or not (SR_SE_redist0_stall_entry_o4_4_2_i_valid);

    -- Valid
    SR_SE_redist0_stall_entry_o4_4_2_V <= SR_SE_redist0_stall_entry_o4_4_2_r_valid WHEN SR_SE_redist0_stall_entry_o4_4_2_r_valid = "1" ELSE SR_SE_redist0_stall_entry_o4_4_2_i_valid;

    -- Data0
    SR_SE_redist0_stall_entry_o4_4_2_D0 <= SR_SE_redist0_stall_entry_o4_4_2_r_data0 WHEN SR_SE_redist0_stall_entry_o4_4_2_r_valid = "1" ELSE redist0_stall_entry_o4_4_1_q;
    -- Data1
    SR_SE_redist0_stall_entry_o4_4_2_D1 <= SR_SE_redist0_stall_entry_o4_4_2_r_data1 WHEN SR_SE_redist0_stall_entry_o4_4_2_r_valid = "1" ELSE redist1_stall_entry_o6_3_1_q;
    -- Data2
    SR_SE_redist0_stall_entry_o4_4_2_D2 <= SR_SE_redist0_stall_entry_o4_4_2_r_data2 WHEN SR_SE_redist0_stall_entry_o4_4_2_r_valid = "1" ELSE redist3_stall_entry_o7_2_1_q;
    -- Data3
    SR_SE_redist0_stall_entry_o4_4_2_D3 <= SR_SE_redist0_stall_entry_o4_4_2_r_data3 WHEN SR_SE_redist0_stall_entry_o4_4_2_r_valid = "1" ELSE redist6_stall_entry_o9_3_1_q;
    -- Data4
    SR_SE_redist0_stall_entry_o4_4_2_D4 <= SR_SE_redist0_stall_entry_o4_4_2_r_data4 WHEN SR_SE_redist0_stall_entry_o4_4_2_r_valid = "1" ELSE redist13_i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x_b_3_0_q;
    -- Data5
    SR_SE_redist0_stall_entry_o4_4_2_D5 <= SR_SE_redist0_stall_entry_o4_4_2_r_data5 WHEN SR_SE_redist0_stall_entry_o4_4_2_r_valid = "1" ELSE bgTrunc_i_inc36_maxpool2d_sel_x_b;
    -- Data6
    SR_SE_redist0_stall_entry_o4_4_2_D6 <= SR_SE_redist0_stall_entry_o4_4_2_r_data6 WHEN SR_SE_redist0_stall_entry_o4_4_2_r_valid = "1" ELSE redist16_bgTrunc_i_inc33_maxpool2d_sel_x_b_1_0_q;

    -- SE_redist0_stall_entry_o4_4_1(STALLENABLE,224)
    -- Valid signal propagation
    SE_redist0_stall_entry_o4_4_1_V0 <= SE_redist0_stall_entry_o4_4_1_R_v_0;
    SE_redist0_stall_entry_o4_4_1_V1 <= SE_redist0_stall_entry_o4_4_1_R_v_1;
    -- Stall signal propagation
    SE_redist0_stall_entry_o4_4_1_s_tv_0 <= SR_SE_redist0_stall_entry_o4_4_2_backStall and SE_redist0_stall_entry_o4_4_1_R_v_0;
    SE_redist0_stall_entry_o4_4_1_s_tv_1 <= SR_SE_i_exitcond14_maxpool2d_backStall and SE_redist0_stall_entry_o4_4_1_R_v_1;
    -- Backward Enable generation
    SE_redist0_stall_entry_o4_4_1_or0 <= SE_redist0_stall_entry_o4_4_1_s_tv_0;
    SE_redist0_stall_entry_o4_4_1_backEN <= not (SE_redist0_stall_entry_o4_4_1_s_tv_1 or SE_redist0_stall_entry_o4_4_1_or0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_stall_entry_o4_4_1_v_s_0 <= SE_redist0_stall_entry_o4_4_1_backEN and SR_SE_redist0_stall_entry_o4_4_1_V;
    -- Backward Stall generation
    SE_redist0_stall_entry_o4_4_1_backStall <= not (SE_redist0_stall_entry_o4_4_1_backEN);
    SE_redist0_stall_entry_o4_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_stall_entry_o4_4_1_R_v_0 <= (others => '0');
            SE_redist0_stall_entry_o4_4_1_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_1_backEN = "0") THEN
                SE_redist0_stall_entry_o4_4_1_R_v_0 <= SE_redist0_stall_entry_o4_4_1_R_v_0 and SE_redist0_stall_entry_o4_4_1_s_tv_0;
            ELSE
                SE_redist0_stall_entry_o4_4_1_R_v_0 <= SE_redist0_stall_entry_o4_4_1_v_s_0;
            END IF;

            IF (SE_redist0_stall_entry_o4_4_1_backEN = "0") THEN
                SE_redist0_stall_entry_o4_4_1_R_v_1 <= SE_redist0_stall_entry_o4_4_1_R_v_1 and SE_redist0_stall_entry_o4_4_1_s_tv_1;
            ELSE
                SE_redist0_stall_entry_o4_4_1_R_v_1 <= SE_redist0_stall_entry_o4_4_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist0_stall_entry_o4_4_1(STALLREG,291)
    SR_SE_redist0_stall_entry_o4_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist0_stall_entry_o4_4_1_r_valid <= (others => '0');
            SR_SE_redist0_stall_entry_o4_4_1_r_data0 <= (others => '-');
            SR_SE_redist0_stall_entry_o4_4_1_r_data1 <= (others => '-');
            SR_SE_redist0_stall_entry_o4_4_1_r_data2 <= (others => '-');
            SR_SE_redist0_stall_entry_o4_4_1_r_data3 <= (others => '-');
            SR_SE_redist0_stall_entry_o4_4_1_r_data4 <= (others => '-');
            SR_SE_redist0_stall_entry_o4_4_1_r_data5 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist0_stall_entry_o4_4_1_r_valid <= SE_redist0_stall_entry_o4_4_1_backStall and (SR_SE_redist0_stall_entry_o4_4_1_r_valid or SR_SE_redist0_stall_entry_o4_4_1_i_valid);

            IF (SR_SE_redist0_stall_entry_o4_4_1_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist0_stall_entry_o4_4_1_r_data0 <= STD_LOGIC_VECTOR(redist0_stall_entry_o4_4_0_q);
                SR_SE_redist0_stall_entry_o4_4_1_r_data1 <= STD_LOGIC_VECTOR(redist1_stall_entry_o6_3_0_q);
                SR_SE_redist0_stall_entry_o4_4_1_r_data2 <= STD_LOGIC_VECTOR(redist3_stall_entry_o7_2_0_q);
                SR_SE_redist0_stall_entry_o4_4_1_r_data3 <= STD_LOGIC_VECTOR(redist6_stall_entry_o9_3_0_q);
                SR_SE_redist0_stall_entry_o4_4_1_r_data4 <= STD_LOGIC_VECTOR(i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x_b);
                SR_SE_redist0_stall_entry_o4_4_1_r_data5 <= STD_LOGIC_VECTOR(bgTrunc_i_inc33_maxpool2d_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist0_stall_entry_o4_4_1_i_valid <= SE_redist0_stall_entry_o4_4_0_V0;
    -- Stall signal propagation
    SR_SE_redist0_stall_entry_o4_4_1_backStall <= SR_SE_redist0_stall_entry_o4_4_1_r_valid or not (SR_SE_redist0_stall_entry_o4_4_1_i_valid);

    -- Valid
    SR_SE_redist0_stall_entry_o4_4_1_V <= SR_SE_redist0_stall_entry_o4_4_1_r_valid WHEN SR_SE_redist0_stall_entry_o4_4_1_r_valid = "1" ELSE SR_SE_redist0_stall_entry_o4_4_1_i_valid;

    -- Data0
    SR_SE_redist0_stall_entry_o4_4_1_D0 <= SR_SE_redist0_stall_entry_o4_4_1_r_data0 WHEN SR_SE_redist0_stall_entry_o4_4_1_r_valid = "1" ELSE redist0_stall_entry_o4_4_0_q;
    -- Data1
    SR_SE_redist0_stall_entry_o4_4_1_D1 <= SR_SE_redist0_stall_entry_o4_4_1_r_data1 WHEN SR_SE_redist0_stall_entry_o4_4_1_r_valid = "1" ELSE redist1_stall_entry_o6_3_0_q;
    -- Data2
    SR_SE_redist0_stall_entry_o4_4_1_D2 <= SR_SE_redist0_stall_entry_o4_4_1_r_data2 WHEN SR_SE_redist0_stall_entry_o4_4_1_r_valid = "1" ELSE redist3_stall_entry_o7_2_0_q;
    -- Data3
    SR_SE_redist0_stall_entry_o4_4_1_D3 <= SR_SE_redist0_stall_entry_o4_4_1_r_data3 WHEN SR_SE_redist0_stall_entry_o4_4_1_r_valid = "1" ELSE redist6_stall_entry_o9_3_0_q;
    -- Data4
    SR_SE_redist0_stall_entry_o4_4_1_D4 <= SR_SE_redist0_stall_entry_o4_4_1_r_data4 WHEN SR_SE_redist0_stall_entry_o4_4_1_r_valid = "1" ELSE i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x_b;
    -- Data5
    SR_SE_redist0_stall_entry_o4_4_1_D5 <= SR_SE_redist0_stall_entry_o4_4_1_r_data5 WHEN SR_SE_redist0_stall_entry_o4_4_1_r_valid = "1" ELSE bgTrunc_i_inc33_maxpool2d_sel_x_b;

    -- SE_redist0_stall_entry_o4_4_0(STALLENABLE,223)
    -- Valid signal propagation
    SE_redist0_stall_entry_o4_4_0_V0 <= SE_redist0_stall_entry_o4_4_0_R_v_0;
    -- Stall signal propagation
    SE_redist0_stall_entry_o4_4_0_s_tv_0 <= SR_SE_redist0_stall_entry_o4_4_1_backStall and SE_redist0_stall_entry_o4_4_0_R_v_0;
    -- Backward Enable generation
    SE_redist0_stall_entry_o4_4_0_backEN <= not (SE_redist0_stall_entry_o4_4_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_stall_entry_o4_4_0_v_s_0 <= SE_redist0_stall_entry_o4_4_0_backEN and SE_stall_entry_V3;
    -- Backward Stall generation
    SE_redist0_stall_entry_o4_4_0_backStall <= not (SE_redist0_stall_entry_o4_4_0_v_s_0);
    SE_redist0_stall_entry_o4_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_stall_entry_o4_4_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_0_backEN = "0") THEN
                SE_redist0_stall_entry_o4_4_0_R_v_0 <= SE_redist0_stall_entry_o4_4_0_R_v_0 and SE_redist0_stall_entry_o4_4_0_s_tv_0;
            ELSE
                SE_redist0_stall_entry_o4_4_0_R_v_0 <= SE_redist0_stall_entry_o4_4_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_out_stall_entry_4_reg(STALLFIFO,289)
    bubble_out_stall_entry_4_reg_valid_in <= SE_stall_entry_V2;
    bubble_out_stall_entry_4_reg_stall_in <= SE_out_bubble_out_stall_entry_4_backStall;
    bubble_out_stall_entry_4_reg_valid_in_bitsignaltemp <= bubble_out_stall_entry_4_reg_valid_in(0);
    bubble_out_stall_entry_4_reg_stall_in_bitsignaltemp <= bubble_out_stall_entry_4_reg_stall_in(0);
    bubble_out_stall_entry_4_reg_valid_out(0) <= bubble_out_stall_entry_4_reg_valid_out_bitsignaltemp;
    bubble_out_stall_entry_4_reg_stall_out(0) <= bubble_out_stall_entry_4_reg_stall_out_bitsignaltemp;
    thebubble_out_stall_entry_4_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 4,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_stall_entry_4_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_stall_entry_4_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_stall_entry_4_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_stall_entry_4_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_stall_entry_2_reg(STALLFIFO,288)
    bubble_out_stall_entry_2_reg_valid_in <= SE_stall_entry_V1;
    bubble_out_stall_entry_2_reg_stall_in <= SE_out_bubble_out_stall_entry_2_backStall;
    bubble_out_stall_entry_2_reg_valid_in_bitsignaltemp <= bubble_out_stall_entry_2_reg_valid_in(0);
    bubble_out_stall_entry_2_reg_stall_in_bitsignaltemp <= bubble_out_stall_entry_2_reg_stall_in(0);
    bubble_out_stall_entry_2_reg_valid_out(0) <= bubble_out_stall_entry_2_reg_valid_out_bitsignaltemp;
    bubble_out_stall_entry_2_reg_stall_out(0) <= bubble_out_stall_entry_2_reg_stall_out_bitsignaltemp;
    thebubble_out_stall_entry_2_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_stall_entry_2_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_stall_entry_2_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_stall_entry_2_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_stall_entry_2_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- i_syncbuf_output_size_sync_buffer5_maxpool2d(BLACKBOX,56)@0
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_output_size_sync_buffer5_maxpool2d : i_syncbuf_output_size_sync_buffer5_maxpool2d40
    PORT MAP (
        in_buffer_in => in_output_size,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_buffer_out => i_syncbuf_output_size_sync_buffer5_maxpool2d_out_buffer_out,
        out_stall_out => i_syncbuf_output_size_sync_buffer5_maxpool2d_out_stall_out,
        out_valid_out => i_syncbuf_output_size_sync_buffer5_maxpool2d_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,210)
    SE_stall_entry_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_stall_entry_fromReg0 <= (others => '0');
            SE_stall_entry_fromReg1 <= (others => '0');
            SE_stall_entry_fromReg2 <= (others => '0');
            SE_stall_entry_fromReg3 <= (others => '0');
            SE_stall_entry_fromReg4 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_stall_entry_fromReg0 <= SE_stall_entry_toReg0;
            -- Succesor 1
            SE_stall_entry_fromReg1 <= SE_stall_entry_toReg1;
            -- Succesor 2
            SE_stall_entry_fromReg2 <= SE_stall_entry_toReg2;
            -- Succesor 3
            SE_stall_entry_fromReg3 <= SE_stall_entry_toReg3;
            -- Succesor 4
            SE_stall_entry_fromReg4 <= SE_stall_entry_toReg4;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_stall_entry_consumed0 <= (not (i_syncbuf_output_size_sync_buffer5_maxpool2d_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg0;
    SE_stall_entry_consumed1 <= (not (bubble_out_stall_entry_2_reg_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg1;
    SE_stall_entry_consumed2 <= (not (bubble_out_stall_entry_4_reg_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg2;
    SE_stall_entry_consumed3 <= (not (SE_redist0_stall_entry_o4_4_0_backStall) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg3;
    SE_stall_entry_consumed4 <= (not (i_store_unnamed_maxpool2d1_maxpool2d_out_o_stall) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg4;
    -- Consuming
    SE_stall_entry_StallValid <= SE_stall_entry_backStall and SE_stall_entry_wireValid;
    SE_stall_entry_toReg0 <= SE_stall_entry_StallValid and SE_stall_entry_consumed0;
    SE_stall_entry_toReg1 <= SE_stall_entry_StallValid and SE_stall_entry_consumed1;
    SE_stall_entry_toReg2 <= SE_stall_entry_StallValid and SE_stall_entry_consumed2;
    SE_stall_entry_toReg3 <= SE_stall_entry_StallValid and SE_stall_entry_consumed3;
    SE_stall_entry_toReg4 <= SE_stall_entry_StallValid and SE_stall_entry_consumed4;
    -- Backward Stall generation
    SE_stall_entry_or0 <= SE_stall_entry_consumed0;
    SE_stall_entry_or1 <= SE_stall_entry_consumed1 and SE_stall_entry_or0;
    SE_stall_entry_or2 <= SE_stall_entry_consumed2 and SE_stall_entry_or1;
    SE_stall_entry_or3 <= SE_stall_entry_consumed3 and SE_stall_entry_or2;
    SE_stall_entry_wireStall <= not (SE_stall_entry_consumed4 and SE_stall_entry_or3);
    SE_stall_entry_backStall <= SE_stall_entry_wireStall;
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg0);
    SE_stall_entry_V1 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg1);
    SE_stall_entry_V2 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg2);
    SE_stall_entry_V3 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg3);
    SE_stall_entry_V4 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg4);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- SE_out_i_store_unnamed_maxpool2d1_maxpool2d(STALLENABLE,195)
    -- Valid signal propagation
    SE_out_i_store_unnamed_maxpool2d1_maxpool2d_V0 <= SE_out_i_store_unnamed_maxpool2d1_maxpool2d_wireValid;
    -- Backward Stall generation
    SE_out_i_store_unnamed_maxpool2d1_maxpool2d_backStall <= bubble_out_i_store_unnamed_maxpool2d1_maxpool2d_1_reg_stall_out or not (SE_out_i_store_unnamed_maxpool2d1_maxpool2d_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_store_unnamed_maxpool2d1_maxpool2d_wireValid <= i_store_unnamed_maxpool2d1_maxpool2d_out_o_valid;

    -- bubble_join_stall_entry(BITJOIN,168)
    bubble_join_stall_entry_q <= in_output_im_addr_178 & in_output_im_addr_0114 & in_j_1610 & in_i_0106 & in_cmp9_phi_decision18_xor_RM14 & in_c1_exe11715 & in_c0_exe13;

    -- bubble_select_stall_entry(BITSELECT,169)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(95 downto 64));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(96 downto 96));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(128 downto 97));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(160 downto 129));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(224 downto 161));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(288 downto 225));

    -- i_store_unnamed_maxpool2d1_maxpool2d(BLACKBOX,53)@0
    -- in in_i_stall@20000000
    -- out out_lsu_unnamed_maxpool2d1_o_active@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@2
    -- out out_unnamed_maxpool2d1_avm_address@20000000
    -- out out_unnamed_maxpool2d1_avm_burstcount@20000000
    -- out out_unnamed_maxpool2d1_avm_byteenable@20000000
    -- out out_unnamed_maxpool2d1_avm_enable@20000000
    -- out out_unnamed_maxpool2d1_avm_read@20000000
    -- out out_unnamed_maxpool2d1_avm_write@20000000
    -- out out_unnamed_maxpool2d1_avm_writedata@20000000
    thei_store_unnamed_maxpool2d1_maxpool2d : i_store_unnamed_maxpool2d1_maxpool2d33
    PORT MAP (
        in_flush => in_flush,
        in_i_address => bubble_select_stall_entry_h,
        in_i_predicate => bubble_select_stall_entry_d,
        in_i_stall => SE_out_i_store_unnamed_maxpool2d1_maxpool2d_backStall,
        in_i_valid => SE_stall_entry_V4,
        in_i_writedata => bubble_select_stall_entry_c,
        in_unnamed_maxpool2d1_avm_readdata => in_unnamed_maxpool2d1_avm_readdata,
        in_unnamed_maxpool2d1_avm_readdatavalid => in_unnamed_maxpool2d1_avm_readdatavalid,
        in_unnamed_maxpool2d1_avm_waitrequest => in_unnamed_maxpool2d1_avm_waitrequest,
        in_unnamed_maxpool2d1_avm_writeack => in_unnamed_maxpool2d1_avm_writeack,
        out_lsu_unnamed_maxpool2d1_o_active => i_store_unnamed_maxpool2d1_maxpool2d_out_lsu_unnamed_maxpool2d1_o_active,
        out_o_stall => i_store_unnamed_maxpool2d1_maxpool2d_out_o_stall,
        out_o_valid => i_store_unnamed_maxpool2d1_maxpool2d_out_o_valid,
        out_unnamed_maxpool2d1_avm_address => i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_address,
        out_unnamed_maxpool2d1_avm_burstcount => i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_burstcount,
        out_unnamed_maxpool2d1_avm_byteenable => i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_byteenable,
        out_unnamed_maxpool2d1_avm_enable => i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_enable,
        out_unnamed_maxpool2d1_avm_read => i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_read,
        out_unnamed_maxpool2d1_avm_write => i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_write,
        out_unnamed_maxpool2d1_avm_writedata => i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,7)
    out_lsu_unnamed_maxpool2d1_o_active <= i_store_unnamed_maxpool2d1_maxpool2d_out_lsu_unnamed_maxpool2d1_o_active;

    -- redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0(REG,145)
    redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist13_i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x_b_3_2(REG,148)
    redist13_i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x_b_3_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x_b_3_2_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_3_backEN = "1") THEN
                redist13_i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x_b_3_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_4_3_D3);
            END IF;
        END IF;
    END PROCESS;

    -- redist10_i_unnamed_maxpool2d39_q_1_0(REG,143)
    redist10_i_unnamed_maxpool2d39_q_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_i_unnamed_maxpool2d39_q_1_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist10_i_unnamed_maxpool2d39_q_1_0_backEN = "1") THEN
                redist10_i_unnamed_maxpool2d39_q_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist10_i_unnamed_maxpool2d39_q_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- i_output_im_addr_17_lc_innerphi_maxpool2d(MUX,52)@4
    i_output_im_addr_17_lc_innerphi_maxpool2d_s <= redist10_i_unnamed_maxpool2d39_q_1_0_q;
    i_output_im_addr_17_lc_innerphi_maxpool2d_combproc: PROCESS (i_output_im_addr_17_lc_innerphi_maxpool2d_s, redist13_i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x_b_3_2_q, redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_q)
    BEGIN
        CASE (i_output_im_addr_17_lc_innerphi_maxpool2d_s) IS
            WHEN "0" => i_output_im_addr_17_lc_innerphi_maxpool2d_q <= redist13_i_incdec_ptr_maxpool2d_maxpool2d35_trunc_sel_x_b_3_2_q;
            WHEN "1" => i_output_im_addr_17_lc_innerphi_maxpool2d_q <= redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_q;
            WHEN OTHERS => i_output_im_addr_17_lc_innerphi_maxpool2d_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist7_stall_entry_o9_4_0(REG,140)
    redist7_stall_entry_o9_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_stall_entry_o9_4_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_3_backEN = "1") THEN
                redist7_stall_entry_o9_4_0_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_4_3_D2);
            END IF;
        END IF;
    END PROCESS;

    -- i_output_im_addr_011_lc_outerphi_maxpool2d(MUX,51)@4
    i_output_im_addr_011_lc_outerphi_maxpool2d_s <= redist10_i_unnamed_maxpool2d39_q_1_0_q;
    i_output_im_addr_011_lc_outerphi_maxpool2d_combproc: PROCESS (i_output_im_addr_011_lc_outerphi_maxpool2d_s, redist7_stall_entry_o9_4_0_q, redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_q)
    BEGIN
        CASE (i_output_im_addr_011_lc_outerphi_maxpool2d_s) IS
            WHEN "0" => i_output_im_addr_011_lc_outerphi_maxpool2d_q <= redist7_stall_entry_o9_4_0_q;
            WHEN "1" => i_output_im_addr_011_lc_outerphi_maxpool2d_q <= redist12_i_scevgep_maxpool2d_maxpool2d45_dupName_0_trunc_sel_x_b_1_0_q;
            WHEN OTHERS => i_output_im_addr_011_lc_outerphi_maxpool2d_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist17_bgTrunc_i_inc33_maxpool2d_sel_x_b_3_1(REG,153)
    redist17_bgTrunc_i_inc33_maxpool2d_sel_x_b_3_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist17_bgTrunc_i_inc33_maxpool2d_sel_x_b_3_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_3_backEN = "1") THEN
                redist17_bgTrunc_i_inc33_maxpool2d_sel_x_b_3_1_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_4_3_D4);
            END IF;
        END IF;
    END PROCESS;

    -- i_j_16_lc_innerphi_maxpool2d(MUX,50)@4
    i_j_16_lc_innerphi_maxpool2d_s <= redist10_i_unnamed_maxpool2d39_q_1_0_q;
    i_j_16_lc_innerphi_maxpool2d_combproc: PROCESS (i_j_16_lc_innerphi_maxpool2d_s, redist17_bgTrunc_i_inc33_maxpool2d_sel_x_b_3_1_q, c_i32_0gr_q)
    BEGIN
        CASE (i_j_16_lc_innerphi_maxpool2d_s) IS
            WHEN "0" => i_j_16_lc_innerphi_maxpool2d_q <= redist17_bgTrunc_i_inc33_maxpool2d_sel_x_b_3_1_q;
            WHEN "1" => i_j_16_lc_innerphi_maxpool2d_q <= c_i32_0gr_q;
            WHEN OTHERS => i_j_16_lc_innerphi_maxpool2d_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_i_010_lc_outerphi_maxpool2d(MUX,47)@3 + 1
    i_i_010_lc_outerphi_maxpool2d_s <= SR_SE_i_i_010_lc_outerphi_maxpool2d_D0;
    i_i_010_lc_outerphi_maxpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_i_010_lc_outerphi_maxpool2d_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_i_010_lc_outerphi_maxpool2d_backEN = "1") THEN
                CASE (i_i_010_lc_outerphi_maxpool2d_s) IS
                    WHEN "0" => i_i_010_lc_outerphi_maxpool2d_q <= SR_SE_i_i_010_lc_outerphi_maxpool2d_D1;
                    WHEN "1" => i_i_010_lc_outerphi_maxpool2d_q <= SR_SE_i_i_010_lc_outerphi_maxpool2d_D2;
                    WHEN OTHERS => i_i_010_lc_outerphi_maxpool2d_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_o6_4_0(REG,132)
    redist2_stall_entry_o6_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_o6_4_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_3_backEN = "1") THEN
                redist2_stall_entry_o6_4_0_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_4_3_D1);
            END IF;
        END IF;
    END PROCESS;

    -- i_exitcond15_maxpool2d(LOGICAL,45)@3 + 1
    i_exitcond15_maxpool2d_qi <= "1" WHEN SR_SE_i_exitcond15_maxpool2d_D0 = SR_SE_i_exitcond15_maxpool2d_D1 ELSE "0";
    i_exitcond15_maxpool2d_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_exitcond15_maxpool2d_qi, xout => i_exitcond15_maxpool2d_q, ena => SE_i_exitcond15_maxpool2d_backEN(0), clk => clock, aclr => resetn );

    -- i_unnamed_maxpool2d49(LOGICAL,67)@4
    i_unnamed_maxpool2d49_q <= i_exitcond15_maxpool2d_q or redist2_stall_entry_o6_4_0_q;

    -- i_for_end37_loopexit_loopexit_lc_cond_maxpool2d(LOGICAL,46)@4
    i_for_end37_loopexit_loopexit_lc_cond_maxpool2d_q <= redist10_i_unnamed_maxpool2d39_q_1_0_q and i_unnamed_maxpool2d49_q;

    -- redist0_stall_entry_o4_4_3(REG,128)
    redist0_stall_entry_o4_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_stall_entry_o4_4_3_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_4_3_backEN = "1") THEN
                redist0_stall_entry_o4_4_3_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_o4_4_3_D0);
            END IF;
        END IF;
    END PROCESS;

    -- dupName_0_sync_out_x(GPOUT,12)@4
    out_c0_exe13 <= redist0_stall_entry_o4_4_3_q;
    out_for_end37_loopexit_loopexit_LC_COND <= i_for_end37_loopexit_loopexit_lc_cond_maxpool2d_q;
    out_i_010_LC_OuterPHI <= i_i_010_lc_outerphi_maxpool2d_q;
    out_j_16_LC_InnerPHI <= i_j_16_lc_innerphi_maxpool2d_q;
    out_output_im_addr_011_LC_OuterPHI <= i_output_im_addr_011_lc_outerphi_maxpool2d_q;
    out_output_im_addr_17_LC_InnerPHI <= i_output_im_addr_17_lc_innerphi_maxpool2d_q;
    out_valid_out <= SE_out_bubble_out_i_syncbuf_output_size_sync_buffer5_maxpool2d_1_V0;

    -- ext_sig_sync_out(GPOUT,43)
    out_unnamed_maxpool2d1_avm_address <= i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_address;
    out_unnamed_maxpool2d1_avm_enable <= i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_enable;
    out_unnamed_maxpool2d1_avm_read <= i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_read;
    out_unnamed_maxpool2d1_avm_write <= i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_write;
    out_unnamed_maxpool2d1_avm_writedata <= i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_writedata;
    out_unnamed_maxpool2d1_avm_byteenable <= i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_byteenable;
    out_unnamed_maxpool2d1_avm_burstcount <= i_store_unnamed_maxpool2d1_maxpool2d_out_unnamed_maxpool2d1_avm_burstcount;

    -- sync_out(GPOUT,78)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
