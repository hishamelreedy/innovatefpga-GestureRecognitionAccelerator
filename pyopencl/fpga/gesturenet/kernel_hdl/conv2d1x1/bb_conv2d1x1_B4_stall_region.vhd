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

-- VHDL created from bb_conv2d1x1_B4_stall_region
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

entity bb_conv2d1x1_B4_stall_region is
    port (
        in_c0_exe13 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe13413 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit3312_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit3312_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit3312_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit3312_3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit3312_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit3312_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit3312_6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit3312_7 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exit3312_8 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exit3312_9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit3312_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exe315 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c2_exit14_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exit14_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c2_exit14_2 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c2_exit14_3 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_i_0114 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_178 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im_addr_0106 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_1610 : in std_logic_vector(63 downto 0);  -- ufix64
        in_unnamed_conv2d1x16 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_unnamed_conv2d1x17_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe13 : out std_logic_vector(63 downto 0);  -- ufix64
        out_for_end35_loopexit_loopexit_LC_COND : out std_logic_vector(0 downto 0);  -- ufix1
        out_i_011_LC_OuterPHI : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_17_LC_InnerPHI : out std_logic_vector(31 downto 0);  -- ufix32
        out_output_im_addr_010_LC_OuterPHI : out std_logic_vector(63 downto 0);  -- ufix64
        out_output_im_addr_16_LC_InnerPHI : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_conv2d1x16 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_input_size_x : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_size_y : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_conv2d1x17_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d1x17_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x17_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x17_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x17_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_conv2d1x17_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x17_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x17_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x17_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_conv2d1x17_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d1x17_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_conv2d1x1_B4_stall_region;

architecture normal of bb_conv2d1x1_B4_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1 is
        port (
            in_c0_eni6_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni6_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni6_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni6_3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni6_4 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni6_5 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni6_6 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit43_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit43_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_store_unnamed_conv2d1x17_conv2d1x196 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_writedata : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d1x17_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x17_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x17_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d1x17_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_conv2d1x17_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d1x17_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_input_size_x_sync_buffer10_conv2d1x194 is
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


    component i_syncbuf_input_size_x_sync_buffer13_conv2d1x190 is
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


    component i_syncbuf_input_size_y_sync_buffer16_conv2d1x186 is
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


    component i_syncbuf_input_size_y_sync_buffer19_conv2d1x188 is
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


    component i_syncbuf_input_size_y_sync_buffer20_conv2d1x192 is
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
    signal bgTrunc_i_inc31_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_inc34_conv2d1x1_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_unnamed_conv2d1x1107_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_unnamed_conv2d1x199_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_c_i32_1gr_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_incdec_ptr_conv2d1x1_conv2d1x185_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_incdec_ptr_conv2d1x1_conv2d1x185_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_incdec_ptr_conv2d1x1_conv2d1x185_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_incdec_ptr_conv2d1x1_conv2d1x185_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_incdec_ptr_conv2d1x1_conv2d1x185_c_i64_4gr_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_out_c0_exit43_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_conv2d1x1104_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i64_1gr_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_cmp75_rm70_conv2d1x1_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp75_rm70_conv2d1x1_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp75_rm70_conv2d1x1_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp75_rm70_conv2d1x1_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp9_rm69_conv2d1x1_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp9_rm69_conv2d1x1_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp9_rm69_conv2d1x1_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp9_rm69_conv2d1x1_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond12_conv2d1x1_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond12_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond13_conv2d1x1_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond13_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_for_end35_loopexit_loopexit_lc_cond_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_i_011_lc_outerphi_conv2d1x1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_i_011_lc_outerphi_conv2d1x1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_inc31_conv2d1x1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc31_conv2d1x1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc31_conv2d1x1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc31_conv2d1x1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc34_conv2d1x1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc34_conv2d1x1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc34_conv2d1x1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc34_conv2d1x1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_j_17_lc_innerphi_conv2d1x1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_j_17_lc_innerphi_conv2d1x1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_output_im_addr_010_lc_outerphi_conv2d1x1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_output_im_addr_010_lc_outerphi_conv2d1x1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_output_im_addr_16_lc_innerphi_conv2d1x1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_output_im_addr_16_lc_innerphi_conv2d1x1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_select34_conv2d1x1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select34_conv2d1x1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_store_unnamed_conv2d1x17_conv2d1x1_out_lsu_unnamed_conv2d1x17_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_conv2d1x17_conv2d1x1_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_conv2d1x17_conv2d1x1_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal i_store_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_store_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_conv2d1x1103_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_conv2d1x1104_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_unnamed_conv2d1x1104_vt_select_31_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_conv2d1x1105_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_conv2d1x1106_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_conv2d1x1107_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_unnamed_conv2d1x1107_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_unnamed_conv2d1x1107_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_unnamed_conv2d1x1107_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_unnamed_conv2d1x1107_vt_const_63_q : STD_LOGIC_VECTOR (30 downto 0);
    signal i_unnamed_conv2d1x1107_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_unnamed_conv2d1x1107_vt_select_32_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_unnamed_conv2d1x1108_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_conv2d1x199_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_unnamed_conv2d1x199_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_unnamed_conv2d1x199_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_unnamed_conv2d1x199_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scevgep_conv2d1x1_conv2d1x1109_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_stall_entry_aunroll_o4_9_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_aunroll_o4_9_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist0_stall_entry_aunroll_o4_9_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_aunroll_o4_9_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist0_stall_entry_aunroll_o4_9_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist0_stall_entry_aunroll_o4_9_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_aunroll_o4_9_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist0_stall_entry_aunroll_o4_9_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_aunroll_o4_9_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist0_stall_entry_aunroll_o4_9_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_stall_entry_aunroll_o5_7_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_aunroll_o5_7_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_aunroll_o5_7_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_aunroll_o5_7_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_aunroll_o5_7_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_aunroll_o5_7_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_aunroll_o5_7_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_aunroll_o22_7_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_stall_entry_aunroll_o22_7_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_stall_entry_aunroll_o22_7_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_stall_entry_aunroll_o22_7_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_stall_entry_aunroll_o22_7_4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_stall_entry_aunroll_o22_7_5_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_stall_entry_aunroll_o22_7_6_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_stall_entry_aunroll_o22_8_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_stall_entry_aunroll_o23_5_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_stall_entry_aunroll_o23_5_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_stall_entry_aunroll_o23_5_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_stall_entry_aunroll_o23_5_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_stall_entry_aunroll_o23_5_4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_stall_entry_aunroll_o24_8_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_aunroll_o24_8_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist5_stall_entry_aunroll_o24_8_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_aunroll_o24_8_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist5_stall_entry_aunroll_o24_8_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist5_stall_entry_aunroll_o24_8_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_aunroll_o24_8_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist5_stall_entry_aunroll_o24_8_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_aunroll_o24_8_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist5_stall_entry_aunroll_o24_8_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist6_stall_entry_aunroll_o24_9_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist7_stall_entry_aunroll_o25_7_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist7_stall_entry_aunroll_o25_7_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist7_stall_entry_aunroll_o25_7_2_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist7_stall_entry_aunroll_o25_7_3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist7_stall_entry_aunroll_o25_7_4_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist7_stall_entry_aunroll_o25_7_5_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist7_stall_entry_aunroll_o25_7_6_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist8_stall_entry_aunroll_o25_8_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist9_stall_entry_aunroll_o26_9_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_stall_entry_aunroll_o26_9_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist9_stall_entry_aunroll_o26_9_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_stall_entry_aunroll_o26_9_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist9_stall_entry_aunroll_o26_9_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_stall_entry_aunroll_o26_9_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_stall_entry_aunroll_o26_9_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist9_stall_entry_aunroll_o26_9_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_stall_entry_aunroll_o26_9_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist9_stall_entry_aunroll_o26_9_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_i_unnamed_conv2d1x1103_q_1_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_unnamed_conv2d1x1103_q_2_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist18_bgTrunc_i_inc34_conv2d1x1_sel_x_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist19_bgTrunc_i_inc31_conv2d1x1_sel_x_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist20_bgTrunc_i_inc31_conv2d1x1_sel_x_b_2_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_stall_entry_aunroll_q : STD_LOGIC_VECTOR (386 downto 0);
    signal bubble_select_stall_entry_aunroll_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_aunroll_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_d : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_e : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_k : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_aunroll_l : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_aunroll_m : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist0_stall_entry_aunroll_o4_9_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist0_stall_entry_aunroll_o4_9_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist5_stall_entry_aunroll_o24_8_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist5_stall_entry_aunroll_o24_8_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist9_stall_entry_aunroll_o26_9_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist9_stall_entry_aunroll_o26_9_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_i_scevgep_conv2d1x1_conv2d1x1109_add_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scevgep_conv2d1x1_conv2d1x1109_add_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scevgep_conv2d1x1_conv2d1x1109_add_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_scevgep_conv2d1x1_conv2d1x1109_add_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp75_rm70_conv2d1x1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp75_rm70_conv2d1x1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp75_rm70_conv2d1x1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp75_rm70_conv2d1x1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp75_rm70_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp75_rm70_conv2d1x1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_rm69_conv2d1x1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_rm69_conv2d1x1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_rm69_conv2d1x1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_rm69_conv2d1x1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_rm69_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_cmp9_rm69_conv2d1x1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond12_conv2d1x1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond12_conv2d1x1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond12_conv2d1x1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond12_conv2d1x1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond12_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond12_conv2d1x1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond13_conv2d1x1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond13_conv2d1x1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond13_conv2d1x1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond13_conv2d1x1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond13_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_exitcond13_conv2d1x1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_i_011_lc_outerphi_conv2d1x1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_i_011_lc_outerphi_conv2d1x1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_i_011_lc_outerphi_conv2d1x1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_i_011_lc_outerphi_conv2d1x1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_i_011_lc_outerphi_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_i_011_lc_outerphi_conv2d1x1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_j_17_lc_innerphi_conv2d1x1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_j_17_lc_innerphi_conv2d1x1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_j_17_lc_innerphi_conv2d1x1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_j_17_lc_innerphi_conv2d1x1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_j_17_lc_innerphi_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_j_17_lc_innerphi_conv2d1x1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_conv2d1x1103_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_conv2d1x1103_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_conv2d1x1103_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_conv2d1x1103_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_conv2d1x1103_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_conv2d1x1103_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_conv2d1x1103_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_conv2d1x1103_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_conv2d1x1103_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_conv2d1x1103_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_conv2d1x1103_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_conv2d1x1103_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_conv2d1x1103_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_conv2d1x1103_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_toReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_fromReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_consumed8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_toReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_fromReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_consumed9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_or7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_or8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_4_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_4_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_4_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_4_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_5_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_5_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_5_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_5_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_5_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_5_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_5_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_5_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_5_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_5_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_6_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_6_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_6_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_6_R_v_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_6_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_6_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_6_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_6_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_6_s_tv_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_6_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_6_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_6_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_6_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_6_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_6_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_6_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_6_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o5_7_6_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_stall_entry_aunroll_o22_8_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_stall_entry_aunroll_o22_8_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_stall_entry_aunroll_o22_8_0_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_stall_entry_aunroll_o22_8_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_stall_entry_aunroll_o22_8_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_stall_entry_aunroll_o22_8_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_stall_entry_aunroll_o22_8_0_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_stall_entry_aunroll_o22_8_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_stall_entry_aunroll_o22_8_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_stall_entry_aunroll_o22_8_0_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_stall_entry_aunroll_o22_8_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_stall_entry_aunroll_o22_8_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_stall_entry_aunroll_o22_8_0_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_stall_entry_aunroll_o22_8_0_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_stall_entry_aunroll_o24_8_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_stall_entry_aunroll_o24_8_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_stall_entry_aunroll_o24_8_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_stall_entry_aunroll_o24_8_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_stall_entry_aunroll_o24_8_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_stall_entry_aunroll_o24_8_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_stall_entry_aunroll_o24_8_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_stall_entry_aunroll_o24_8_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_stall_entry_aunroll_o24_8_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_stall_entry_aunroll_o24_8_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_stall_entry_aunroll_o24_8_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_stall_entry_aunroll_o24_8_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_stall_entry_aunroll_o24_8_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_stall_entry_aunroll_o24_9_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_stall_entry_aunroll_o24_9_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_stall_entry_aunroll_o24_9_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_stall_entry_aunroll_o24_9_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_stall_entry_aunroll_o24_9_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_stall_entry_aunroll_o24_9_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_unnamed_conv2d1x1103_q_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_unnamed_conv2d1x1103_q_1_0_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_unnamed_conv2d1x1103_q_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_unnamed_conv2d1x1103_q_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_unnamed_conv2d1x1103_q_1_0_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_unnamed_conv2d1x1103_q_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_unnamed_conv2d1x1103_q_1_0_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_unnamed_conv2d1x1103_q_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_unnamed_conv2d1x1103_q_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_unnamed_conv2d1x1103_q_1_0_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_unnamed_conv2d1x1103_q_2_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_unnamed_conv2d1x1103_q_2_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_unnamed_conv2d1x1103_q_2_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_unnamed_conv2d1x1103_q_2_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_unnamed_conv2d1x1103_q_2_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_unnamed_conv2d1x1103_q_2_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_aunroll_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_aunroll_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_aunroll_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_aunroll_2_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_aunroll_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_aunroll_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_aunroll_3_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_aunroll_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_aunroll_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_aunroll_4_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_aunroll_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_aunroll_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_aunroll_5_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_aunroll_5_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_aunroll_5_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_aunroll_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_aunroll_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_aunroll_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_aunroll_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_aunroll_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_aunroll_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_aunroll_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_aunroll_1_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_aunroll_2_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_aunroll_2_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_aunroll_2_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_aunroll_2_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_aunroll_2_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_aunroll_2_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_aunroll_2_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_aunroll_2_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_aunroll_3_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_aunroll_3_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_aunroll_3_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_aunroll_3_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_aunroll_3_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_aunroll_3_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_aunroll_3_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_aunroll_3_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_aunroll_4_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_aunroll_4_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_aunroll_4_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_aunroll_4_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_aunroll_4_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_aunroll_4_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_aunroll_4_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_aunroll_4_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_aunroll_5_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_aunroll_5_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_aunroll_5_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_aunroll_5_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_aunroll_5_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_aunroll_5_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_aunroll_5_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_aunroll_5_reg_stall_out_bitsignaltemp : std_logic;
    signal SR_bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_1_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_data2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_data3 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_1_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_1_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_1_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_1_D2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_1_D3 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_3_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_data2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_data3 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_3_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_3_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_3_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_3_D2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_3_D3 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_5_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_data2 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_data3 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_5_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_5_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_5_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_5_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_5_D2 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_5_D3 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_6_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_data2 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_data3 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_6_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_6_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_6_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_6_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_6_D2 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o5_7_6_D3 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist3_stall_entry_aunroll_o22_8_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist3_stall_entry_aunroll_o22_8_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist3_stall_entry_aunroll_o22_8_0_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist3_stall_entry_aunroll_o22_8_0_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist3_stall_entry_aunroll_o22_8_0_r_data2 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist3_stall_entry_aunroll_o22_8_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist3_stall_entry_aunroll_o22_8_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist3_stall_entry_aunroll_o22_8_0_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist3_stall_entry_aunroll_o22_8_0_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist3_stall_entry_aunroll_o22_8_0_D2 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_i_exitcond13_conv2d1x1_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond13_conv2d1x1_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond13_conv2d1x1_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond13_conv2d1x1_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond13_conv2d1x1_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond13_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond13_conv2d1x1_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond13_conv2d1x1_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond13_conv2d1x1_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist6_stall_entry_aunroll_o24_9_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_stall_entry_aunroll_o24_9_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_stall_entry_aunroll_o24_9_0_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist6_stall_entry_aunroll_o24_9_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_stall_entry_aunroll_o24_9_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_stall_entry_aunroll_o24_9_0_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_i_exitcond12_conv2d1x1_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond12_conv2d1x1_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond12_conv2d1x1_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond12_conv2d1x1_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond12_conv2d1x1_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond12_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond12_conv2d1x1_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_exitcond12_conv2d1x1_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_exitcond12_conv2d1x1_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_i_i_011_lc_outerphi_conv2d1x1_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_011_lc_outerphi_conv2d1x1_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_011_lc_outerphi_conv2d1x1_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_011_lc_outerphi_conv2d1x1_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_011_lc_outerphi_conv2d1x1_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_i_011_lc_outerphi_conv2d1x1_r_data2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_i_011_lc_outerphi_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_011_lc_outerphi_conv2d1x1_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_011_lc_outerphi_conv2d1x1_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_i_011_lc_outerphi_conv2d1x1_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_i_011_lc_outerphi_conv2d1x1_D2 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_j_17_lc_innerphi_conv2d1x1_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_j_17_lc_innerphi_conv2d1x1_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_j_17_lc_innerphi_conv2d1x1_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_j_17_lc_innerphi_conv2d1x1_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_j_17_lc_innerphi_conv2d1x1_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_j_17_lc_innerphi_conv2d1x1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_j_17_lc_innerphi_conv2d1x1_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_j_17_lc_innerphi_conv2d1x1_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_j_17_lc_innerphi_conv2d1x1_D1 : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- redist9_stall_entry_aunroll_o26_9_fifo(STALLFIFO,180)
    redist9_stall_entry_aunroll_o26_9_fifo_valid_in <= SE_stall_entry_aunroll_V9;
    redist9_stall_entry_aunroll_o26_9_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_backStall;
    redist9_stall_entry_aunroll_o26_9_fifo_data_in <= bubble_select_stall_entry_aunroll_m;
    redist9_stall_entry_aunroll_o26_9_fifo_valid_in_bitsignaltemp <= redist9_stall_entry_aunroll_o26_9_fifo_valid_in(0);
    redist9_stall_entry_aunroll_o26_9_fifo_stall_in_bitsignaltemp <= redist9_stall_entry_aunroll_o26_9_fifo_stall_in(0);
    redist9_stall_entry_aunroll_o26_9_fifo_valid_out(0) <= redist9_stall_entry_aunroll_o26_9_fifo_valid_out_bitsignaltemp;
    redist9_stall_entry_aunroll_o26_9_fifo_stall_out(0) <= redist9_stall_entry_aunroll_o26_9_fifo_stall_out_bitsignaltemp;
    theredist9_stall_entry_aunroll_o26_9_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 10,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist9_stall_entry_aunroll_o26_9_fifo_valid_in_bitsignaltemp,
        stall_in => redist9_stall_entry_aunroll_o26_9_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_aunroll_m,
        valid_out => redist9_stall_entry_aunroll_o26_9_fifo_valid_out_bitsignaltemp,
        stall_out => redist9_stall_entry_aunroll_o26_9_fifo_stall_out_bitsignaltemp,
        data_out => redist9_stall_entry_aunroll_o26_9_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_redist5_stall_entry_aunroll_o24_8_fifo(BITJOIN,229)
    bubble_join_redist5_stall_entry_aunroll_o24_8_fifo_q <= redist5_stall_entry_aunroll_o24_8_fifo_data_out;

    -- bubble_select_redist5_stall_entry_aunroll_o24_8_fifo(BITSELECT,230)
    bubble_select_redist5_stall_entry_aunroll_o24_8_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist5_stall_entry_aunroll_o24_8_fifo_q(63 downto 0));

    -- SE_redist6_stall_entry_aunroll_o24_9_0(STALLENABLE,318)
    -- Valid signal propagation
    SE_redist6_stall_entry_aunroll_o24_9_0_V0 <= SE_redist6_stall_entry_aunroll_o24_9_0_R_v_0;
    -- Stall signal propagation
    SE_redist6_stall_entry_aunroll_o24_9_0_s_tv_0 <= SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_backStall and SE_redist6_stall_entry_aunroll_o24_9_0_R_v_0;
    -- Backward Enable generation
    SE_redist6_stall_entry_aunroll_o24_9_0_backEN <= not (SE_redist6_stall_entry_aunroll_o24_9_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist6_stall_entry_aunroll_o24_9_0_v_s_0 <= SE_redist6_stall_entry_aunroll_o24_9_0_backEN and SR_SE_redist6_stall_entry_aunroll_o24_9_0_V;
    -- Backward Stall generation
    SE_redist6_stall_entry_aunroll_o24_9_0_backStall <= not (SE_redist6_stall_entry_aunroll_o24_9_0_backEN);
    SE_redist6_stall_entry_aunroll_o24_9_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist6_stall_entry_aunroll_o24_9_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_stall_entry_aunroll_o24_9_0_backEN = "0") THEN
                SE_redist6_stall_entry_aunroll_o24_9_0_R_v_0 <= SE_redist6_stall_entry_aunroll_o24_9_0_R_v_0 and SE_redist6_stall_entry_aunroll_o24_9_0_s_tv_0;
            ELSE
                SE_redist6_stall_entry_aunroll_o24_9_0_R_v_0 <= SE_redist6_stall_entry_aunroll_o24_9_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist6_stall_entry_aunroll_o24_9_0(STALLREG,421)
    SR_SE_redist6_stall_entry_aunroll_o24_9_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist6_stall_entry_aunroll_o24_9_0_r_valid <= (others => '0');
            SR_SE_redist6_stall_entry_aunroll_o24_9_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist6_stall_entry_aunroll_o24_9_0_r_valid <= SE_redist6_stall_entry_aunroll_o24_9_0_backStall and (SR_SE_redist6_stall_entry_aunroll_o24_9_0_r_valid or SR_SE_redist6_stall_entry_aunroll_o24_9_0_i_valid);

            IF (SR_SE_redist6_stall_entry_aunroll_o24_9_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist6_stall_entry_aunroll_o24_9_0_r_data0 <= STD_LOGIC_VECTOR(bubble_select_redist5_stall_entry_aunroll_o24_8_fifo_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist6_stall_entry_aunroll_o24_9_0_i_valid <= SE_out_redist5_stall_entry_aunroll_o24_8_fifo_V1;
    -- Stall signal propagation
    SR_SE_redist6_stall_entry_aunroll_o24_9_0_backStall <= SR_SE_redist6_stall_entry_aunroll_o24_9_0_r_valid or not (SR_SE_redist6_stall_entry_aunroll_o24_9_0_i_valid);

    -- Valid
    SR_SE_redist6_stall_entry_aunroll_o24_9_0_V <= SR_SE_redist6_stall_entry_aunroll_o24_9_0_r_valid WHEN SR_SE_redist6_stall_entry_aunroll_o24_9_0_r_valid = "1" ELSE SR_SE_redist6_stall_entry_aunroll_o24_9_0_i_valid;

    SR_SE_redist6_stall_entry_aunroll_o24_9_0_D0 <= SR_SE_redist6_stall_entry_aunroll_o24_9_0_r_data0 WHEN SR_SE_redist6_stall_entry_aunroll_o24_9_0_r_valid = "1" ELSE bubble_select_redist5_stall_entry_aunroll_o24_8_fifo_b;

    -- i_scevgep_conv2d1x1_conv2d1x1109_mult_multconst_x(CONSTANT,33)
    i_scevgep_conv2d1x1_conv2d1x1109_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- i_unnamed_conv2d1x1107_vt_const_63(CONSTANT,80)
    i_unnamed_conv2d1x1107_vt_const_63_q <= "0000000000000000000000000000000";

    -- c_i64_1gr(CONSTANT,49)
    c_i64_1gr_q <= "0000000000000000000000000000000000000000000000000000000000000001";

    -- c_i32_0gr(CONSTANT,47)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0(STALLENABLE,330)
    -- Valid signal propagation
    SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_V0 <= SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_s_tv_0 <= SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_backStall and SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_backEN <= not (SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_v_s_0 <= SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_backEN and SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_V;
    -- Backward Stall generation
    SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_backStall <= not (SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_backEN);
    SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_backEN = "0") THEN
                SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_R_v_0 <= SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_R_v_0 and SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_s_tv_0;
            ELSE
                SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_R_v_0 <= SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- dupName_0_c_i32_1gr_x(CONSTANT,7)
    dupName_0_c_i32_1gr_x_q <= "11111111111111111111111111111111";

    -- SE_out_bubble_out_stall_entry_aunroll_2(STALLENABLE,383)
    -- Valid signal propagation
    SE_out_bubble_out_stall_entry_aunroll_2_V0 <= SE_out_bubble_out_stall_entry_aunroll_2_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_stall_entry_aunroll_2_backStall <= i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_out_stall_out or not (SE_out_bubble_out_stall_entry_aunroll_2_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_stall_entry_aunroll_2_wireValid <= bubble_out_stall_entry_aunroll_2_reg_valid_out;

    -- i_syncbuf_input_size_y_sync_buffer19_conv2d1x1(BLACKBOX,70)@5
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_input_size_y_sync_buffer19_conv2d1x1 : i_syncbuf_input_size_y_sync_buffer19_conv2d1x188
    PORT MAP (
        in_buffer_in => in_input_size_y,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_backStall,
        in_valid_in => SE_out_bubble_out_stall_entry_aunroll_2_V0,
        out_buffer_out => i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_out_buffer_out,
        out_stall_out => i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_out_stall_out,
        out_valid_out => i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1(BITJOIN,209)
    bubble_join_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_q <= i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_out_buffer_out;

    -- bubble_select_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1(BITSELECT,210)
    bubble_select_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_q(31 downto 0));

    -- i_unnamed_conv2d1x199(ADD,84)@5
    i_unnamed_conv2d1x199_a <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_b);
    i_unnamed_conv2d1x199_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_1gr_x_q);
    i_unnamed_conv2d1x199_o <= STD_LOGIC_VECTOR(UNSIGNED(i_unnamed_conv2d1x199_a) + UNSIGNED(i_unnamed_conv2d1x199_b));
    i_unnamed_conv2d1x199_q <= i_unnamed_conv2d1x199_o(32 downto 0);

    -- bgTrunc_i_unnamed_conv2d1x199_sel_x(BITSELECT,6)@5
    bgTrunc_i_unnamed_conv2d1x199_sel_x_b <= i_unnamed_conv2d1x199_q(31 downto 0);

    -- i_unnamed_conv2d1x1104_sel_x(BITSELECT,40)@5
    i_unnamed_conv2d1x1104_sel_x_b <= std_logic_vector(resize(unsigned(bgTrunc_i_unnamed_conv2d1x199_sel_x_b(31 downto 0)), 64));

    -- i_unnamed_conv2d1x1104_vt_select_31(BITSELECT,76)@5
    i_unnamed_conv2d1x1104_vt_select_31_b <= i_unnamed_conv2d1x1104_sel_x_b(31 downto 0);

    -- bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg(STALLFIFO,407)
    bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg_valid_in <= SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_V0;
    bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg_stall_in <= SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_backStall;
    bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg_valid_in_bitsignaltemp <= bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg_valid_in(0);
    bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg_stall_in_bitsignaltemp <= bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg_stall_in(0);
    bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg_valid_out(0) <= bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg_valid_out_bitsignaltemp;
    bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg_stall_out(0) <= bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg_stall_out_bitsignaltemp;
    thebubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 5,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1(STALLENABLE,268)
    SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_fromReg0 <= (others => '0');
            SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_fromReg0 <= SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_toReg0;
            -- Succesor 1
            SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_fromReg1 <= SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_consumed0 <= (not (bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg_stall_out) and SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_wireValid) or SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_fromReg0;
    SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_consumed1 <= (not (SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_backStall) and SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_wireValid) or SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_fromReg1;
    -- Consuming
    SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_StallValid <= SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_backStall and SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_wireValid;
    SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_toReg0 <= SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_StallValid and SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_consumed0;
    SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_toReg1 <= SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_StallValid and SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_consumed1;
    -- Backward Stall generation
    SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_or0 <= SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_consumed0;
    SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_wireStall <= not (SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_consumed1 and SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_or0);
    SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_backStall <= SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_wireStall;
    -- Valid signal propagation
    SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_V0 <= SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_wireValid and not (SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_fromReg0);
    SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_V1 <= SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_wireValid and not (SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_wireValid <= i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_out_valid_out;

    -- SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0(STALLREG,422)
    SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_r_valid <= (others => '0');
            SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_r_valid <= SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_backStall and (SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_r_valid or SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_i_valid);

            IF (SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_r_data0 <= STD_LOGIC_VECTOR(i_unnamed_conv2d1x1104_vt_select_31_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_i_valid <= SE_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_V1;
    -- Stall signal propagation
    SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_backStall <= SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_r_valid or not (SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_i_valid);

    -- Valid
    SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_V <= SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_r_valid WHEN SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_r_valid = "1" ELSE SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_i_valid;

    SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_D0 <= SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_r_data0 WHEN SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_r_valid = "1" ELSE i_unnamed_conv2d1x1104_vt_select_31_b;

    -- redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0(REG,182)
    redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_backEN = "1") THEN
                redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- i_unnamed_conv2d1x1104_vt_join(BITJOIN,75)@6
    i_unnamed_conv2d1x1104_vt_join_q <= c_i32_0gr_q & redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_q;

    -- i_unnamed_conv2d1x1107(ADD,79)@6
    i_unnamed_conv2d1x1107_a <= STD_LOGIC_VECTOR("0" & i_unnamed_conv2d1x1104_vt_join_q);
    i_unnamed_conv2d1x1107_b <= STD_LOGIC_VECTOR("0" & c_i64_1gr_q);
    i_unnamed_conv2d1x1107_o <= STD_LOGIC_VECTOR(UNSIGNED(i_unnamed_conv2d1x1107_a) + UNSIGNED(i_unnamed_conv2d1x1107_b));
    i_unnamed_conv2d1x1107_q <= i_unnamed_conv2d1x1107_o(64 downto 0);

    -- bgTrunc_i_unnamed_conv2d1x1107_sel_x(BITSELECT,5)@6
    bgTrunc_i_unnamed_conv2d1x1107_sel_x_b <= i_unnamed_conv2d1x1107_q(63 downto 0);

    -- i_unnamed_conv2d1x1107_vt_select_32(BITSELECT,82)@6
    i_unnamed_conv2d1x1107_vt_select_32_b <= bgTrunc_i_unnamed_conv2d1x1107_sel_x_b(32 downto 0);

    -- redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0(REG,181)
    redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_q <= "000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_backEN = "1") THEN
                redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_q <= STD_LOGIC_VECTOR(i_unnamed_conv2d1x1107_vt_select_32_b);
            END IF;
        END IF;
    END PROCESS;

    -- i_unnamed_conv2d1x1107_vt_join(BITJOIN,81)@7
    i_unnamed_conv2d1x1107_vt_join_q <= i_unnamed_conv2d1x1107_vt_const_63_q & redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_q;

    -- i_scevgep_conv2d1x1_conv2d1x1109_mult_x_bs1_merged_bit_select(BITSELECT,127)@7
    i_scevgep_conv2d1x1_conv2d1x1109_mult_x_bs1_merged_bit_select_b <= i_unnamed_conv2d1x1107_vt_join_q(17 downto 0);
    i_scevgep_conv2d1x1_conv2d1x1109_mult_x_bs1_merged_bit_select_c <= i_unnamed_conv2d1x1107_vt_join_q(63 downto 54);
    i_scevgep_conv2d1x1_conv2d1x1109_mult_x_bs1_merged_bit_select_d <= i_unnamed_conv2d1x1107_vt_join_q(35 downto 18);
    i_scevgep_conv2d1x1_conv2d1x1109_mult_x_bs1_merged_bit_select_e <= i_unnamed_conv2d1x1107_vt_join_q(53 downto 36);

    -- i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im3_shift0(BITSHIFT,124)@7
    i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im3_shift0_qint <= i_scevgep_conv2d1x1_conv2d1x1109_mult_x_bs1_merged_bit_select_c & "00";
    i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im3_shift0_q <= i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im3_shift0_qint(11 downto 0);

    -- i_scevgep_conv2d1x1_conv2d1x1109_mult_x_align_15(BITSHIFT,115)@7
    i_scevgep_conv2d1x1_conv2d1x1109_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im3_shift0_q) & "000000000000000";
    i_scevgep_conv2d1x1_conv2d1x1109_mult_x_align_15_q <= i_scevgep_conv2d1x1_conv2d1x1109_mult_x_align_15_qint(27 downto 0);

    -- i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im6_shift0(BITSHIFT,125)@7
    i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im6_shift0_qint <= i_scevgep_conv2d1x1_conv2d1x1109_mult_x_bs1_merged_bit_select_d & "00";
    i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im6_shift0_q <= i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im6_shift0_qint(19 downto 0);

    -- i_scevgep_conv2d1x1_conv2d1x1109_mult_x_align_14(BITSHIFT,114)@7
    i_scevgep_conv2d1x1_conv2d1x1109_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im6_shift0_q) & "000000000000000000";
    i_scevgep_conv2d1x1_conv2d1x1109_mult_x_align_14_q <= i_scevgep_conv2d1x1_conv2d1x1109_mult_x_align_14_qint(38 downto 0);

    -- i_scevgep_conv2d1x1_conv2d1x1109_mult_x_join_16(BITJOIN,116)@7
    i_scevgep_conv2d1x1_conv2d1x1109_mult_x_join_16_q <= i_scevgep_conv2d1x1_conv2d1x1109_mult_x_align_15_q & i_scevgep_conv2d1x1_conv2d1x1109_mult_x_align_14_q;

    -- i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im9_shift0(BITSHIFT,126)@7
    i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im9_shift0_qint <= i_scevgep_conv2d1x1_conv2d1x1109_mult_x_bs1_merged_bit_select_e & "00";
    i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im9_shift0_q <= i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im9_shift0_qint(19 downto 0);

    -- i_scevgep_conv2d1x1_conv2d1x1109_mult_x_align_12(BITSHIFT,112)@7
    i_scevgep_conv2d1x1_conv2d1x1109_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im9_shift0_q) & "000000000000000";
    i_scevgep_conv2d1x1_conv2d1x1109_mult_x_align_12_q <= i_scevgep_conv2d1x1_conv2d1x1109_mult_x_align_12_qint(35 downto 0);

    -- i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im0_shift0(BITSHIFT,123)@7
    i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im0_shift0_qint <= i_scevgep_conv2d1x1_conv2d1x1109_mult_x_bs1_merged_bit_select_b & "00";
    i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im0_shift0_q <= i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im0_shift0_qint(19 downto 0);

    -- i_scevgep_conv2d1x1_conv2d1x1109_mult_x_join_13(BITJOIN,113)@7
    i_scevgep_conv2d1x1_conv2d1x1109_mult_x_join_13_q <= i_scevgep_conv2d1x1_conv2d1x1109_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_scevgep_conv2d1x1_conv2d1x1109_mult_x_im0_shift0_q);

    -- i_scevgep_conv2d1x1_conv2d1x1109_mult_x_result_add_0_0(ADD,117)@7
    i_scevgep_conv2d1x1_conv2d1x1109_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_scevgep_conv2d1x1_conv2d1x1109_mult_x_join_13_q);
    i_scevgep_conv2d1x1_conv2d1x1109_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_scevgep_conv2d1x1_conv2d1x1109_mult_x_join_16_q);
    i_scevgep_conv2d1x1_conv2d1x1109_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_scevgep_conv2d1x1_conv2d1x1109_mult_x_result_add_0_0_a) + UNSIGNED(i_scevgep_conv2d1x1_conv2d1x1109_mult_x_result_add_0_0_b));
    i_scevgep_conv2d1x1_conv2d1x1109_mult_x_result_add_0_0_q <= i_scevgep_conv2d1x1_conv2d1x1109_mult_x_result_add_0_0_o(67 downto 0);

    -- i_scevgep_conv2d1x1_conv2d1x1109_mult_extender_x(BITJOIN,32)@7
    i_scevgep_conv2d1x1_conv2d1x1109_mult_extender_x_q <= i_scevgep_conv2d1x1_conv2d1x1109_mult_multconst_x_q & i_scevgep_conv2d1x1_conv2d1x1109_mult_x_result_add_0_0_q(66 downto 0);

    -- i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x(BITSELECT,34)@7
    i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b <= i_scevgep_conv2d1x1_conv2d1x1109_mult_extender_x_q(63 downto 0);

    -- SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0(STALLENABLE,329)
    -- Valid signal propagation
    SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_V0 <= SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_s_tv_0 <= SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_backStall and SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_backEN <= not (SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_v_s_0 <= SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_backEN and SE_redist11_i_unnamed_conv2d1x1104_vt_select_31_b_1_0_V0;
    -- Backward Stall generation
    SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_backStall <= not (SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_v_s_0);
    SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_backEN = "0") THEN
                SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_R_v_0 <= SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_R_v_0 and SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_s_tv_0;
            ELSE
                SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_R_v_0 <= SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0(STALLREG,423)
    SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_r_valid <= (others => '0');
            SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_r_valid <= SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_backStall and (SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_r_valid or SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_i_valid);

            IF (SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_r_data0 <= STD_LOGIC_VECTOR(i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_i_valid <= SE_redist10_i_unnamed_conv2d1x1107_vt_select_32_b_1_0_V0;
    -- Stall signal propagation
    SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_backStall <= SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_r_valid or not (SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_i_valid);

    -- Valid
    SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_V <= SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_r_valid WHEN SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_r_valid = "1" ELSE SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_i_valid;

    SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_D0 <= SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_r_data0 WHEN SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_r_valid = "1" ELSE i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b;

    -- redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0(REG,186)
    redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- i_scevgep_conv2d1x1_conv2d1x1109_add_x(ADD,35)@8
    i_scevgep_conv2d1x1_conv2d1x1109_add_x_a <= STD_LOGIC_VECTOR("0" & bubble_select_redist5_stall_entry_aunroll_o24_8_fifo_b);
    i_scevgep_conv2d1x1_conv2d1x1109_add_x_b <= STD_LOGIC_VECTOR("0" & redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_q);
    i_scevgep_conv2d1x1_conv2d1x1109_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_scevgep_conv2d1x1_conv2d1x1109_add_x_a) + UNSIGNED(i_scevgep_conv2d1x1_conv2d1x1109_add_x_b));
    i_scevgep_conv2d1x1_conv2d1x1109_add_x_q <= i_scevgep_conv2d1x1_conv2d1x1109_add_x_o(64 downto 0);

    -- i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x(BITSELECT,29)@8
    i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b <= i_scevgep_conv2d1x1_conv2d1x1109_add_x_q(63 downto 0);

    -- SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0(STALLENABLE,335)
    -- Valid signal propagation
    SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_V0 <= SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_s_tv_0 <= SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_backStall and SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_backEN <= not (SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_v_s_0 <= SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_backEN and SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_V;
    -- Backward Stall generation
    SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_backStall <= not (SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_backEN);
    SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_R_v_0 <= SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_R_v_0 and SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_R_v_0 <= SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0(STALLREG,424)
    SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_r_valid <= (others => '0');
            SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_r_valid <= SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_backStall and (SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_r_valid or SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_i_valid);

            IF (SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_r_data0 <= STD_LOGIC_VECTOR(i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_i_valid <= SE_i_scevgep_conv2d1x1_conv2d1x1109_add_x_V0;
    -- Stall signal propagation
    SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_backStall <= SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_r_valid or not (SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_i_valid);

    -- Valid
    SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_V <= SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_r_valid WHEN SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_r_valid = "1" ELSE SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_i_valid;

    SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_D0 <= SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_r_data0 WHEN SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_r_valid = "1" ELSE i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b;

    -- SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0(STALLENABLE,334)
    -- Valid signal propagation
    SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_V0 <= SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_s_tv_0 <= SE_i_scevgep_conv2d1x1_conv2d1x1109_add_x_backStall and SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_backEN <= not (SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_v_s_0 <= SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_backEN and SR_SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_V;
    -- Backward Stall generation
    SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_backStall <= not (SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_backEN);
    SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_R_v_0 <= SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_R_v_0 and SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_R_v_0 <= SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_scevgep_conv2d1x1_conv2d1x1109_add_x(STALLENABLE,243)
    -- Valid signal propagation
    SE_i_scevgep_conv2d1x1_conv2d1x1109_add_x_V0 <= SE_i_scevgep_conv2d1x1_conv2d1x1109_add_x_wireValid;
    -- Backward Stall generation
    SE_i_scevgep_conv2d1x1_conv2d1x1109_add_x_backStall <= SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_backStall or not (SE_i_scevgep_conv2d1x1_conv2d1x1109_add_x_wireValid);
    -- Computing multiple Valid(s)
    SE_i_scevgep_conv2d1x1_conv2d1x1109_add_x_and0 <= SE_redist15_i_scevgep_conv2d1x1_conv2d1x1109_trunc_sel_x_b_1_0_V0;
    SE_i_scevgep_conv2d1x1_conv2d1x1109_add_x_wireValid <= SE_out_redist5_stall_entry_aunroll_o24_8_fifo_V0 and SE_i_scevgep_conv2d1x1_conv2d1x1109_add_x_and0;

    -- SE_out_redist5_stall_entry_aunroll_o24_8_fifo(STALLENABLE,317)
    SE_out_redist5_stall_entry_aunroll_o24_8_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist5_stall_entry_aunroll_o24_8_fifo_fromReg0 <= (others => '0');
            SE_out_redist5_stall_entry_aunroll_o24_8_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist5_stall_entry_aunroll_o24_8_fifo_fromReg0 <= SE_out_redist5_stall_entry_aunroll_o24_8_fifo_toReg0;
            -- Succesor 1
            SE_out_redist5_stall_entry_aunroll_o24_8_fifo_fromReg1 <= SE_out_redist5_stall_entry_aunroll_o24_8_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist5_stall_entry_aunroll_o24_8_fifo_consumed0 <= (not (SE_i_scevgep_conv2d1x1_conv2d1x1109_add_x_backStall) and SE_out_redist5_stall_entry_aunroll_o24_8_fifo_wireValid) or SE_out_redist5_stall_entry_aunroll_o24_8_fifo_fromReg0;
    SE_out_redist5_stall_entry_aunroll_o24_8_fifo_consumed1 <= (not (SR_SE_redist6_stall_entry_aunroll_o24_9_0_backStall) and SE_out_redist5_stall_entry_aunroll_o24_8_fifo_wireValid) or SE_out_redist5_stall_entry_aunroll_o24_8_fifo_fromReg1;
    -- Consuming
    SE_out_redist5_stall_entry_aunroll_o24_8_fifo_StallValid <= SE_out_redist5_stall_entry_aunroll_o24_8_fifo_backStall and SE_out_redist5_stall_entry_aunroll_o24_8_fifo_wireValid;
    SE_out_redist5_stall_entry_aunroll_o24_8_fifo_toReg0 <= SE_out_redist5_stall_entry_aunroll_o24_8_fifo_StallValid and SE_out_redist5_stall_entry_aunroll_o24_8_fifo_consumed0;
    SE_out_redist5_stall_entry_aunroll_o24_8_fifo_toReg1 <= SE_out_redist5_stall_entry_aunroll_o24_8_fifo_StallValid and SE_out_redist5_stall_entry_aunroll_o24_8_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist5_stall_entry_aunroll_o24_8_fifo_or0 <= SE_out_redist5_stall_entry_aunroll_o24_8_fifo_consumed0;
    SE_out_redist5_stall_entry_aunroll_o24_8_fifo_wireStall <= not (SE_out_redist5_stall_entry_aunroll_o24_8_fifo_consumed1 and SE_out_redist5_stall_entry_aunroll_o24_8_fifo_or0);
    SE_out_redist5_stall_entry_aunroll_o24_8_fifo_backStall <= SE_out_redist5_stall_entry_aunroll_o24_8_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist5_stall_entry_aunroll_o24_8_fifo_V0 <= SE_out_redist5_stall_entry_aunroll_o24_8_fifo_wireValid and not (SE_out_redist5_stall_entry_aunroll_o24_8_fifo_fromReg0);
    SE_out_redist5_stall_entry_aunroll_o24_8_fifo_V1 <= SE_out_redist5_stall_entry_aunroll_o24_8_fifo_wireValid and not (SE_out_redist5_stall_entry_aunroll_o24_8_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist5_stall_entry_aunroll_o24_8_fifo_wireValid <= redist5_stall_entry_aunroll_o24_8_fifo_valid_out;

    -- redist5_stall_entry_aunroll_o24_8_fifo(STALLFIFO,170)
    redist5_stall_entry_aunroll_o24_8_fifo_valid_in <= SE_stall_entry_aunroll_V8;
    redist5_stall_entry_aunroll_o24_8_fifo_stall_in <= SE_out_redist5_stall_entry_aunroll_o24_8_fifo_backStall;
    redist5_stall_entry_aunroll_o24_8_fifo_data_in <= bubble_select_stall_entry_aunroll_k;
    redist5_stall_entry_aunroll_o24_8_fifo_valid_in_bitsignaltemp <= redist5_stall_entry_aunroll_o24_8_fifo_valid_in(0);
    redist5_stall_entry_aunroll_o24_8_fifo_stall_in_bitsignaltemp <= redist5_stall_entry_aunroll_o24_8_fifo_stall_in(0);
    redist5_stall_entry_aunroll_o24_8_fifo_valid_out(0) <= redist5_stall_entry_aunroll_o24_8_fifo_valid_out_bitsignaltemp;
    redist5_stall_entry_aunroll_o24_8_fifo_stall_out(0) <= redist5_stall_entry_aunroll_o24_8_fifo_stall_out_bitsignaltemp;
    theredist5_stall_entry_aunroll_o24_8_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 9,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist5_stall_entry_aunroll_o24_8_fifo_valid_in_bitsignaltemp,
        stall_in => redist5_stall_entry_aunroll_o24_8_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_aunroll_k,
        valid_out => redist5_stall_entry_aunroll_o24_8_fifo_valid_out_bitsignaltemp,
        stall_out => redist5_stall_entry_aunroll_o24_8_fifo_stall_out_bitsignaltemp,
        data_out => redist5_stall_entry_aunroll_o24_8_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist0_stall_entry_aunroll_o4_9_fifo(STALLFIFO,149)
    redist0_stall_entry_aunroll_o4_9_fifo_valid_in <= SE_stall_entry_aunroll_V7;
    redist0_stall_entry_aunroll_o4_9_fifo_stall_in <= SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_backStall;
    redist0_stall_entry_aunroll_o4_9_fifo_data_in <= bubble_select_stall_entry_aunroll_b;
    redist0_stall_entry_aunroll_o4_9_fifo_valid_in_bitsignaltemp <= redist0_stall_entry_aunroll_o4_9_fifo_valid_in(0);
    redist0_stall_entry_aunroll_o4_9_fifo_stall_in_bitsignaltemp <= redist0_stall_entry_aunroll_o4_9_fifo_stall_in(0);
    redist0_stall_entry_aunroll_o4_9_fifo_valid_out(0) <= redist0_stall_entry_aunroll_o4_9_fifo_valid_out_bitsignaltemp;
    redist0_stall_entry_aunroll_o4_9_fifo_stall_out(0) <= redist0_stall_entry_aunroll_o4_9_fifo_stall_out_bitsignaltemp;
    theredist0_stall_entry_aunroll_o4_9_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 10,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist0_stall_entry_aunroll_o4_9_fifo_valid_in_bitsignaltemp,
        stall_in => redist0_stall_entry_aunroll_o4_9_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_aunroll_b,
        valid_out => redist0_stall_entry_aunroll_o4_9_fifo_valid_out_bitsignaltemp,
        stall_out => redist0_stall_entry_aunroll_o4_9_fifo_stall_out_bitsignaltemp,
        data_out => redist0_stall_entry_aunroll_o4_9_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist7_stall_entry_aunroll_o25_7_0(REG,172)
    redist7_stall_entry_aunroll_o25_7_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_stall_entry_aunroll_o25_7_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_0_backEN = "1") THEN
                redist7_stall_entry_aunroll_o25_7_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_l);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_stall_entry_aunroll_o23_5_0(REG,165)
    redist4_stall_entry_aunroll_o23_5_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_stall_entry_aunroll_o23_5_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_0_backEN = "1") THEN
                redist4_stall_entry_aunroll_o23_5_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_j);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o22_7_0(REG,157)
    redist2_stall_entry_aunroll_o22_7_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o22_7_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_0_backEN = "1") THEN
                redist2_stall_entry_aunroll_o22_7_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_i);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_aunroll_o5_7_0(REG,150)
    redist1_stall_entry_aunroll_o5_7_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o5_7_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_0_backEN = "1") THEN
                redist1_stall_entry_aunroll_o5_7_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_c);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_stall_entry_aunroll_o25_7_1(REG,173)
    redist7_stall_entry_aunroll_o25_7_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_stall_entry_aunroll_o25_7_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_1_backEN = "1") THEN
                redist7_stall_entry_aunroll_o25_7_1_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_aunroll_o5_7_1_D3);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_stall_entry_aunroll_o25_7_2(REG,174)
    redist7_stall_entry_aunroll_o25_7_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_stall_entry_aunroll_o25_7_2_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_2_backEN = "1") THEN
                redist7_stall_entry_aunroll_o25_7_2_q <= STD_LOGIC_VECTOR(redist7_stall_entry_aunroll_o25_7_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_stall_entry_aunroll_o23_5_1(REG,166)
    redist4_stall_entry_aunroll_o23_5_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_stall_entry_aunroll_o23_5_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_1_backEN = "1") THEN
                redist4_stall_entry_aunroll_o23_5_1_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_aunroll_o5_7_1_D2);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_stall_entry_aunroll_o23_5_2(REG,167)
    redist4_stall_entry_aunroll_o23_5_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_stall_entry_aunroll_o23_5_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_2_backEN = "1") THEN
                redist4_stall_entry_aunroll_o23_5_2_q <= STD_LOGIC_VECTOR(redist4_stall_entry_aunroll_o23_5_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o22_7_1(REG,158)
    redist2_stall_entry_aunroll_o22_7_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o22_7_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_1_backEN = "1") THEN
                redist2_stall_entry_aunroll_o22_7_1_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_aunroll_o5_7_1_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o22_7_2(REG,159)
    redist2_stall_entry_aunroll_o22_7_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o22_7_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_2_backEN = "1") THEN
                redist2_stall_entry_aunroll_o22_7_2_q <= STD_LOGIC_VECTOR(redist2_stall_entry_aunroll_o22_7_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_aunroll_o5_7_1(REG,151)
    redist1_stall_entry_aunroll_o5_7_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o5_7_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_1_backEN = "1") THEN
                redist1_stall_entry_aunroll_o5_7_1_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_aunroll_o5_7_1_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_aunroll_o5_7_2(REG,152)
    redist1_stall_entry_aunroll_o5_7_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o5_7_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_2_backEN = "1") THEN
                redist1_stall_entry_aunroll_o5_7_2_q <= STD_LOGIC_VECTOR(redist1_stall_entry_aunroll_o5_7_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- c_i32_1gr(CONSTANT,48)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- redist4_stall_entry_aunroll_o23_5_3(REG,168)
    redist4_stall_entry_aunroll_o23_5_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_stall_entry_aunroll_o23_5_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_3_backEN = "1") THEN
                redist4_stall_entry_aunroll_o23_5_3_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_aunroll_o5_7_3_D2);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_stall_entry_aunroll_o23_5_4(REG,169)
    redist4_stall_entry_aunroll_o23_5_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_stall_entry_aunroll_o23_5_4_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_4_backEN = "1") THEN
                redist4_stall_entry_aunroll_o23_5_4_q <= STD_LOGIC_VECTOR(redist4_stall_entry_aunroll_o23_5_3_q);
            END IF;
        END IF;
    END PROCESS;

    -- i_inc31_conv2d1x1(ADD,60)@5
    i_inc31_conv2d1x1_a <= STD_LOGIC_VECTOR("0" & redist4_stall_entry_aunroll_o23_5_4_q);
    i_inc31_conv2d1x1_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc31_conv2d1x1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc31_conv2d1x1_a) + UNSIGNED(i_inc31_conv2d1x1_b));
    i_inc31_conv2d1x1_q <= i_inc31_conv2d1x1_o(32 downto 0);

    -- bgTrunc_i_inc31_conv2d1x1_sel_x(BITSELECT,3)@5
    bgTrunc_i_inc31_conv2d1x1_sel_x_b <= i_inc31_conv2d1x1_q(31 downto 0);

    -- redist7_stall_entry_aunroll_o25_7_3(REG,175)
    redist7_stall_entry_aunroll_o25_7_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_stall_entry_aunroll_o25_7_3_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_3_backEN = "1") THEN
                redist7_stall_entry_aunroll_o25_7_3_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_aunroll_o5_7_3_D3);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_stall_entry_aunroll_o25_7_4(REG,176)
    redist7_stall_entry_aunroll_o25_7_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_stall_entry_aunroll_o25_7_4_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_4_backEN = "1") THEN
                redist7_stall_entry_aunroll_o25_7_4_q <= STD_LOGIC_VECTOR(redist7_stall_entry_aunroll_o25_7_3_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o22_7_3(REG,160)
    redist2_stall_entry_aunroll_o22_7_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o22_7_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_3_backEN = "1") THEN
                redist2_stall_entry_aunroll_o22_7_3_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_aunroll_o5_7_3_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o22_7_4(REG,161)
    redist2_stall_entry_aunroll_o22_7_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o22_7_4_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_4_backEN = "1") THEN
                redist2_stall_entry_aunroll_o22_7_4_q <= STD_LOGIC_VECTOR(redist2_stall_entry_aunroll_o22_7_3_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_aunroll_o5_7_3(REG,153)
    redist1_stall_entry_aunroll_o5_7_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o5_7_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_3_backEN = "1") THEN
                redist1_stall_entry_aunroll_o5_7_3_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_aunroll_o5_7_3_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_aunroll_o5_7_4(REG,154)
    redist1_stall_entry_aunroll_o5_7_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o5_7_4_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_4_backEN = "1") THEN
                redist1_stall_entry_aunroll_o5_7_4_q <= STD_LOGIC_VECTOR(redist1_stall_entry_aunroll_o5_7_3_q);
            END IF;
        END IF;
    END PROCESS;

    -- SE_out_bubble_out_stall_entry_aunroll_1(STALLENABLE,381)
    -- Valid signal propagation
    SE_out_bubble_out_stall_entry_aunroll_1_V0 <= SE_out_bubble_out_stall_entry_aunroll_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_stall_entry_aunroll_1_backStall <= i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_out_stall_out or not (SE_out_bubble_out_stall_entry_aunroll_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_stall_entry_aunroll_1_wireValid <= bubble_out_stall_entry_aunroll_1_reg_valid_out;

    -- i_syncbuf_input_size_y_sync_buffer16_conv2d1x1(BLACKBOX,69)@6
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_input_size_y_sync_buffer16_conv2d1x1 : i_syncbuf_input_size_y_sync_buffer16_conv2d1x186
    PORT MAP (
        in_buffer_in => in_input_size_y,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_backStall,
        in_valid_in => SE_out_bubble_out_stall_entry_aunroll_1_V0,
        out_buffer_out => i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_out_buffer_out,
        out_stall_out => i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_out_stall_out,
        out_valid_out => i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1(BITJOIN,205)
    bubble_join_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_q <= i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_out_buffer_out;

    -- bubble_select_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1(BITSELECT,206)
    bubble_select_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_q(31 downto 0));

    -- redist19_bgTrunc_i_inc31_conv2d1x1_sel_x_b_1_0(REG,190)
    redist19_bgTrunc_i_inc31_conv2d1x1_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist19_bgTrunc_i_inc31_conv2d1x1_sel_x_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_5_backEN = "1") THEN
                redist19_bgTrunc_i_inc31_conv2d1x1_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_aunroll_o5_7_5_D3);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg(STALLFIFO,406)
    bubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg_valid_in <= SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_V0;
    bubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg_stall_in <= SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_backStall;
    bubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg_valid_in_bitsignaltemp <= bubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg_valid_in(0);
    bubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg_stall_in_bitsignaltemp <= bubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg_stall_in(0);
    bubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg_valid_out(0) <= bubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg_valid_out_bitsignaltemp;
    bubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg_stall_out(0) <= bubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg_stall_out_bitsignaltemp;
    thebubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 4,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1(STALLENABLE,266)
    SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_fromReg0 <= (others => '0');
            SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_fromReg0 <= SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_toReg0;
            -- Succesor 1
            SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_fromReg1 <= SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_consumed0 <= (not (bubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg_stall_out) and SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_wireValid) or SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_fromReg0;
    SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_consumed1 <= (not (SR_SE_i_exitcond12_conv2d1x1_backStall) and SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_wireValid) or SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_fromReg1;
    -- Consuming
    SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_StallValid <= SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_backStall and SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_wireValid;
    SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_toReg0 <= SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_StallValid and SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_consumed0;
    SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_toReg1 <= SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_StallValid and SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_consumed1;
    -- Backward Stall generation
    SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_or0 <= SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_consumed0;
    SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_wireStall <= not (SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_consumed1 and SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_or0);
    SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_backStall <= SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_wireStall;
    -- Valid signal propagation
    SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_V0 <= SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_wireValid and not (SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_fromReg0);
    SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_V1 <= SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_wireValid and not (SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_wireValid <= i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_out_valid_out;

    -- i_exitcond12_conv2d1x1(LOGICAL,56)@6 + 1
    i_exitcond12_conv2d1x1_qi <= "1" WHEN SR_SE_i_exitcond12_conv2d1x1_D0 = SR_SE_i_exitcond12_conv2d1x1_D1 ELSE "0";
    i_exitcond12_conv2d1x1_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_exitcond12_conv2d1x1_qi, xout => i_exitcond12_conv2d1x1_q, ena => SE_i_exitcond12_conv2d1x1_backEN(0), clk => clock, aclr => resetn );

    -- i_unnamed_conv2d1x1103(LOGICAL,72)@7
    i_unnamed_conv2d1x1103_q <= i_exitcond12_conv2d1x1_q or redist1_stall_entry_aunroll_o5_7_6_q;

    -- SE_redist13_i_unnamed_conv2d1x1103_q_2_0(STALLENABLE,332)
    -- Valid signal propagation
    SE_redist13_i_unnamed_conv2d1x1103_q_2_0_V0 <= SE_redist13_i_unnamed_conv2d1x1103_q_2_0_R_v_0;
    -- Stall signal propagation
    SE_redist13_i_unnamed_conv2d1x1103_q_2_0_s_tv_0 <= SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_backStall and SE_redist13_i_unnamed_conv2d1x1103_q_2_0_R_v_0;
    -- Backward Enable generation
    SE_redist13_i_unnamed_conv2d1x1103_q_2_0_backEN <= not (SE_redist13_i_unnamed_conv2d1x1103_q_2_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist13_i_unnamed_conv2d1x1103_q_2_0_v_s_0 <= SE_redist13_i_unnamed_conv2d1x1103_q_2_0_backEN and SE_redist12_i_unnamed_conv2d1x1103_q_1_0_V1;
    -- Backward Stall generation
    SE_redist13_i_unnamed_conv2d1x1103_q_2_0_backStall <= not (SE_redist13_i_unnamed_conv2d1x1103_q_2_0_v_s_0);
    SE_redist13_i_unnamed_conv2d1x1103_q_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist13_i_unnamed_conv2d1x1103_q_2_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist13_i_unnamed_conv2d1x1103_q_2_0_backEN = "0") THEN
                SE_redist13_i_unnamed_conv2d1x1103_q_2_0_R_v_0 <= SE_redist13_i_unnamed_conv2d1x1103_q_2_0_R_v_0 and SE_redist13_i_unnamed_conv2d1x1103_q_2_0_s_tv_0;
            ELSE
                SE_redist13_i_unnamed_conv2d1x1103_q_2_0_R_v_0 <= SE_redist13_i_unnamed_conv2d1x1103_q_2_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- i_inc34_conv2d1x1(ADD,61)@7
    i_inc34_conv2d1x1_a <= STD_LOGIC_VECTOR("0" & redist2_stall_entry_aunroll_o22_7_6_q);
    i_inc34_conv2d1x1_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc34_conv2d1x1_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc34_conv2d1x1_a) + UNSIGNED(i_inc34_conv2d1x1_b));
    i_inc34_conv2d1x1_q <= i_inc34_conv2d1x1_o(32 downto 0);

    -- bgTrunc_i_inc34_conv2d1x1_sel_x(BITSELECT,4)@7
    bgTrunc_i_inc34_conv2d1x1_sel_x_b <= i_inc34_conv2d1x1_q(31 downto 0);

    -- redist2_stall_entry_aunroll_o22_7_6(REG,163)
    redist2_stall_entry_aunroll_o22_7_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o22_7_6_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_6_backEN = "1") THEN
                redist2_stall_entry_aunroll_o22_7_6_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_aunroll_o5_7_6_D1);
            END IF;
        END IF;
    END PROCESS;

    -- SR_SE_redist3_stall_entry_aunroll_o22_8_0(STALLREG,419)
    SR_SE_redist3_stall_entry_aunroll_o22_8_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist3_stall_entry_aunroll_o22_8_0_r_valid <= (others => '0');
            SR_SE_redist3_stall_entry_aunroll_o22_8_0_r_data0 <= (others => '-');
            SR_SE_redist3_stall_entry_aunroll_o22_8_0_r_data1 <= (others => '-');
            SR_SE_redist3_stall_entry_aunroll_o22_8_0_r_data2 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist3_stall_entry_aunroll_o22_8_0_r_valid <= SE_redist3_stall_entry_aunroll_o22_8_0_backStall and (SR_SE_redist3_stall_entry_aunroll_o22_8_0_r_valid or SR_SE_redist3_stall_entry_aunroll_o22_8_0_i_valid);

            IF (SR_SE_redist3_stall_entry_aunroll_o22_8_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist3_stall_entry_aunroll_o22_8_0_r_data0 <= STD_LOGIC_VECTOR(redist2_stall_entry_aunroll_o22_7_6_q);
                SR_SE_redist3_stall_entry_aunroll_o22_8_0_r_data1 <= STD_LOGIC_VECTOR(bgTrunc_i_inc34_conv2d1x1_sel_x_b);
                SR_SE_redist3_stall_entry_aunroll_o22_8_0_r_data2 <= STD_LOGIC_VECTOR(redist7_stall_entry_aunroll_o25_7_6_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist3_stall_entry_aunroll_o22_8_0_i_valid <= SE_redist1_stall_entry_aunroll_o5_7_6_V2;
    -- Stall signal propagation
    SR_SE_redist3_stall_entry_aunroll_o22_8_0_backStall <= SR_SE_redist3_stall_entry_aunroll_o22_8_0_r_valid or not (SR_SE_redist3_stall_entry_aunroll_o22_8_0_i_valid);

    -- Valid
    SR_SE_redist3_stall_entry_aunroll_o22_8_0_V <= SR_SE_redist3_stall_entry_aunroll_o22_8_0_r_valid WHEN SR_SE_redist3_stall_entry_aunroll_o22_8_0_r_valid = "1" ELSE SR_SE_redist3_stall_entry_aunroll_o22_8_0_i_valid;

    -- Data0
    SR_SE_redist3_stall_entry_aunroll_o22_8_0_D0 <= SR_SE_redist3_stall_entry_aunroll_o22_8_0_r_data0 WHEN SR_SE_redist3_stall_entry_aunroll_o22_8_0_r_valid = "1" ELSE redist2_stall_entry_aunroll_o22_7_6_q;
    -- Data1
    SR_SE_redist3_stall_entry_aunroll_o22_8_0_D1 <= SR_SE_redist3_stall_entry_aunroll_o22_8_0_r_data1 WHEN SR_SE_redist3_stall_entry_aunroll_o22_8_0_r_valid = "1" ELSE bgTrunc_i_inc34_conv2d1x1_sel_x_b;
    -- Data2
    SR_SE_redist3_stall_entry_aunroll_o22_8_0_D2 <= SR_SE_redist3_stall_entry_aunroll_o22_8_0_r_data2 WHEN SR_SE_redist3_stall_entry_aunroll_o22_8_0_r_valid = "1" ELSE redist7_stall_entry_aunroll_o25_7_6_q;

    -- redist18_bgTrunc_i_inc34_conv2d1x1_sel_x_b_1_0(REG,189)
    redist18_bgTrunc_i_inc34_conv2d1x1_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist18_bgTrunc_i_inc34_conv2d1x1_sel_x_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_stall_entry_aunroll_o22_8_0_backEN = "1") THEN
                redist18_bgTrunc_i_inc34_conv2d1x1_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist3_stall_entry_aunroll_o22_8_0_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_stall_entry_aunroll_o22_8_0(REG,164)
    redist3_stall_entry_aunroll_o22_8_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_aunroll_o22_8_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_stall_entry_aunroll_o22_8_0_backEN = "1") THEN
                redist3_stall_entry_aunroll_o22_8_0_q <= STD_LOGIC_VECTOR(SR_SE_redist3_stall_entry_aunroll_o22_8_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist12_i_unnamed_conv2d1x1103_q_1_0(REG,183)
    redist12_i_unnamed_conv2d1x1103_q_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_i_unnamed_conv2d1x1103_q_1_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist12_i_unnamed_conv2d1x1103_q_1_0_backEN = "1") THEN
                redist12_i_unnamed_conv2d1x1103_q_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- i_incdec_ptr_conv2d1x1_conv2d1x185_c_i64_4gr_x(CONSTANT,27)
    i_incdec_ptr_conv2d1x1_conv2d1x185_c_i64_4gr_x_q <= "0000000000000000000000000000000000000000000000000000000000000100";

    -- redist8_stall_entry_aunroll_o25_8_0(REG,179)
    redist8_stall_entry_aunroll_o25_8_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_stall_entry_aunroll_o25_8_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_stall_entry_aunroll_o22_8_0_backEN = "1") THEN
                redist8_stall_entry_aunroll_o25_8_0_q <= STD_LOGIC_VECTOR(SR_SE_redist3_stall_entry_aunroll_o22_8_0_D2);
            END IF;
        END IF;
    END PROCESS;

    -- i_incdec_ptr_conv2d1x1_conv2d1x185_add_x(ADD,26)@8
    i_incdec_ptr_conv2d1x1_conv2d1x185_add_x_a <= STD_LOGIC_VECTOR("0" & redist8_stall_entry_aunroll_o25_8_0_q);
    i_incdec_ptr_conv2d1x1_conv2d1x185_add_x_b <= STD_LOGIC_VECTOR("0" & i_incdec_ptr_conv2d1x1_conv2d1x185_c_i64_4gr_x_q);
    i_incdec_ptr_conv2d1x1_conv2d1x185_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_incdec_ptr_conv2d1x1_conv2d1x185_add_x_a) + UNSIGNED(i_incdec_ptr_conv2d1x1_conv2d1x185_add_x_b));
    i_incdec_ptr_conv2d1x1_conv2d1x185_add_x_q <= i_incdec_ptr_conv2d1x1_conv2d1x185_add_x_o(64 downto 0);

    -- i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x(BITSELECT,25)@8
    i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b <= i_incdec_ptr_conv2d1x1_conv2d1x185_add_x_q(63 downto 0);

    -- SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0(STALLENABLE,336)
    -- Valid signal propagation
    SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_V0 <= SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_s_tv_0 <= SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_backStall and SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_backEN <= not (SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_v_s_0 <= SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_backEN and SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_V;
    -- Backward Stall generation
    SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_backStall <= not (SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_backEN);
    SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_backEN = "0") THEN
                SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_R_v_0 <= SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_R_v_0 and SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_R_v_0 <= SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0(STALLREG,427)
    SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_r_valid <= (others => '0');
            SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_r_valid <= SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_backStall and (SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_r_valid or SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_i_valid);

            IF (SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_r_data0 <= STD_LOGIC_VECTOR(i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_i_valid <= SE_redist3_stall_entry_aunroll_o22_8_0_V2;
    -- Stall signal propagation
    SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_backStall <= SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_r_valid or not (SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_i_valid);

    -- Valid
    SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_V <= SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_r_valid WHEN SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_r_valid = "1" ELSE SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_i_valid;

    SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_D0 <= SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_r_data0 WHEN SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_r_valid = "1" ELSE i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b;

    -- SE_out_bubble_out_stall_entry_aunroll_5(STALLENABLE,389)
    -- Valid signal propagation
    SE_out_bubble_out_stall_entry_aunroll_5_V0 <= SE_out_bubble_out_stall_entry_aunroll_5_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_stall_entry_aunroll_5_backStall <= i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_out_stall_out or not (SE_out_bubble_out_stall_entry_aunroll_5_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_stall_entry_aunroll_5_wireValid <= bubble_out_stall_entry_aunroll_5_reg_valid_out;

    -- i_syncbuf_input_size_x_sync_buffer10_conv2d1x1(BLACKBOX,67)@8
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_input_size_x_sync_buffer10_conv2d1x1 : i_syncbuf_input_size_x_sync_buffer10_conv2d1x194
    PORT MAP (
        in_buffer_in => in_input_size_x,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_backStall,
        in_valid_in => SE_out_bubble_out_stall_entry_aunroll_5_V0,
        out_buffer_out => i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_out_buffer_out,
        out_stall_out => i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_out_stall_out,
        out_valid_out => i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1(BITJOIN,197)
    bubble_join_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_q <= i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_out_buffer_out;

    -- bubble_select_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1(BITSELECT,198)
    bubble_select_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_q(31 downto 0));

    -- bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg(STALLENABLE,404)
    -- Valid signal propagation
    bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_V0 <= bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_R_v_0;
    -- Stall signal propagation
    bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_s_tv_0 <= SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_backStall and bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_R_v_0;
    -- Backward Enable generation
    bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_backEN <= not (bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_v_s_0 <= bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_backEN and SR_bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_V;
    -- Backward Stall generation
    bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_backStall <= not (bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_backEN);
    bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_backEN = "0") THEN
                bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_R_v_0 <= bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_R_v_0 and bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_s_tv_0;
            ELSE
                bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_R_v_0 <= bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg(STALLREG,414)
    SR_bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_r_valid <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_r_valid <= bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_backStall and (SR_bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_r_valid or SR_bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_i_valid);

            IF (SR_bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_r_valid = "0") THEN
                -- Data(s)
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_i_valid <= SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_V0;
    -- Stall signal propagation
    SR_bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_backStall <= SR_bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_r_valid or not (SR_bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_i_valid);

    -- Valid
    SR_bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_V <= SR_bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_r_valid WHEN SR_bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_r_valid = "1" ELSE SR_bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_i_valid;


    -- SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1(STALLENABLE,262)
    SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_fromReg0 <= (others => '0');
            SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_fromReg0 <= SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_toReg0;
            -- Succesor 1
            SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_fromReg1 <= SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_consumed0 <= (not (SR_bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_backStall) and SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_wireValid) or SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_fromReg0;
    SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_consumed1 <= (not (SR_SE_i_exitcond13_conv2d1x1_backStall) and SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_wireValid) or SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_fromReg1;
    -- Consuming
    SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_StallValid <= SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_backStall and SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_wireValid;
    SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_toReg0 <= SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_StallValid and SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_consumed0;
    SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_toReg1 <= SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_StallValid and SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_consumed1;
    -- Backward Stall generation
    SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_or0 <= SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_consumed0;
    SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_wireStall <= not (SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_consumed1 and SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_or0);
    SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_backStall <= SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_wireStall;
    -- Valid signal propagation
    SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_V0 <= SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_wireValid and not (SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_fromReg0);
    SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_V1 <= SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_wireValid and not (SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_wireValid <= i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_out_valid_out;

    -- SE_i_exitcond13_conv2d1x1(STALLENABLE,250)
    -- Valid signal propagation
    SE_i_exitcond13_conv2d1x1_V0 <= SE_i_exitcond13_conv2d1x1_R_v_0;
    -- Stall signal propagation
    SE_i_exitcond13_conv2d1x1_s_tv_0 <= SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_backStall and SE_i_exitcond13_conv2d1x1_R_v_0;
    -- Backward Enable generation
    SE_i_exitcond13_conv2d1x1_backEN <= not (SE_i_exitcond13_conv2d1x1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_exitcond13_conv2d1x1_v_s_0 <= SE_i_exitcond13_conv2d1x1_backEN and SR_SE_i_exitcond13_conv2d1x1_V;
    -- Backward Stall generation
    SE_i_exitcond13_conv2d1x1_backStall <= not (SE_i_exitcond13_conv2d1x1_backEN);
    SE_i_exitcond13_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_exitcond13_conv2d1x1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_exitcond13_conv2d1x1_backEN = "0") THEN
                SE_i_exitcond13_conv2d1x1_R_v_0 <= SE_i_exitcond13_conv2d1x1_R_v_0 and SE_i_exitcond13_conv2d1x1_s_tv_0;
            ELSE
                SE_i_exitcond13_conv2d1x1_R_v_0 <= SE_i_exitcond13_conv2d1x1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_i_exitcond13_conv2d1x1(STALLREG,420)
    SR_SE_i_exitcond13_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_exitcond13_conv2d1x1_r_valid <= (others => '0');
            SR_SE_i_exitcond13_conv2d1x1_r_data0 <= (others => '-');
            SR_SE_i_exitcond13_conv2d1x1_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_exitcond13_conv2d1x1_r_valid <= SE_i_exitcond13_conv2d1x1_backStall and (SR_SE_i_exitcond13_conv2d1x1_r_valid or SR_SE_i_exitcond13_conv2d1x1_i_valid);

            IF (SR_SE_i_exitcond13_conv2d1x1_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_exitcond13_conv2d1x1_r_data0 <= STD_LOGIC_VECTOR(redist18_bgTrunc_i_inc34_conv2d1x1_sel_x_b_1_0_q);
                SR_SE_i_exitcond13_conv2d1x1_r_data1 <= STD_LOGIC_VECTOR(bubble_select_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_exitcond13_conv2d1x1_and0 <= SE_redist3_stall_entry_aunroll_o22_8_0_V1;
    SR_SE_i_exitcond13_conv2d1x1_i_valid <= SE_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_V1 and SR_SE_i_exitcond13_conv2d1x1_and0;
    -- Stall signal propagation
    SR_SE_i_exitcond13_conv2d1x1_backStall <= SR_SE_i_exitcond13_conv2d1x1_r_valid or not (SR_SE_i_exitcond13_conv2d1x1_i_valid);

    -- Valid
    SR_SE_i_exitcond13_conv2d1x1_V <= SR_SE_i_exitcond13_conv2d1x1_r_valid WHEN SR_SE_i_exitcond13_conv2d1x1_r_valid = "1" ELSE SR_SE_i_exitcond13_conv2d1x1_i_valid;

    -- Data0
    SR_SE_i_exitcond13_conv2d1x1_D0 <= SR_SE_i_exitcond13_conv2d1x1_r_data0 WHEN SR_SE_i_exitcond13_conv2d1x1_r_valid = "1" ELSE redist18_bgTrunc_i_inc34_conv2d1x1_sel_x_b_1_0_q;
    -- Data1
    SR_SE_i_exitcond13_conv2d1x1_D1 <= SR_SE_i_exitcond13_conv2d1x1_r_data1 WHEN SR_SE_i_exitcond13_conv2d1x1_r_valid = "1" ELSE bubble_select_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_b;

    -- SE_redist3_stall_entry_aunroll_o22_8_0(STALLENABLE,310)
    -- Valid signal propagation
    SE_redist3_stall_entry_aunroll_o22_8_0_V0 <= SE_redist3_stall_entry_aunroll_o22_8_0_R_v_0;
    SE_redist3_stall_entry_aunroll_o22_8_0_V1 <= SE_redist3_stall_entry_aunroll_o22_8_0_R_v_1;
    SE_redist3_stall_entry_aunroll_o22_8_0_V2 <= SE_redist3_stall_entry_aunroll_o22_8_0_R_v_2;
    -- Stall signal propagation
    SE_redist3_stall_entry_aunroll_o22_8_0_s_tv_0 <= SR_SE_i_i_011_lc_outerphi_conv2d1x1_backStall and SE_redist3_stall_entry_aunroll_o22_8_0_R_v_0;
    SE_redist3_stall_entry_aunroll_o22_8_0_s_tv_1 <= SR_SE_i_exitcond13_conv2d1x1_backStall and SE_redist3_stall_entry_aunroll_o22_8_0_R_v_1;
    SE_redist3_stall_entry_aunroll_o22_8_0_s_tv_2 <= SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_backStall and SE_redist3_stall_entry_aunroll_o22_8_0_R_v_2;
    -- Backward Enable generation
    SE_redist3_stall_entry_aunroll_o22_8_0_or0 <= SE_redist3_stall_entry_aunroll_o22_8_0_s_tv_0;
    SE_redist3_stall_entry_aunroll_o22_8_0_or1 <= SE_redist3_stall_entry_aunroll_o22_8_0_s_tv_1 or SE_redist3_stall_entry_aunroll_o22_8_0_or0;
    SE_redist3_stall_entry_aunroll_o22_8_0_backEN <= not (SE_redist3_stall_entry_aunroll_o22_8_0_s_tv_2 or SE_redist3_stall_entry_aunroll_o22_8_0_or1);
    -- Determine whether to write valid data into the first register stage
    SE_redist3_stall_entry_aunroll_o22_8_0_v_s_0 <= SE_redist3_stall_entry_aunroll_o22_8_0_backEN and SR_SE_redist3_stall_entry_aunroll_o22_8_0_V;
    -- Backward Stall generation
    SE_redist3_stall_entry_aunroll_o22_8_0_backStall <= not (SE_redist3_stall_entry_aunroll_o22_8_0_backEN);
    SE_redist3_stall_entry_aunroll_o22_8_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist3_stall_entry_aunroll_o22_8_0_R_v_0 <= (others => '0');
            SE_redist3_stall_entry_aunroll_o22_8_0_R_v_1 <= (others => '0');
            SE_redist3_stall_entry_aunroll_o22_8_0_R_v_2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_stall_entry_aunroll_o22_8_0_backEN = "0") THEN
                SE_redist3_stall_entry_aunroll_o22_8_0_R_v_0 <= SE_redist3_stall_entry_aunroll_o22_8_0_R_v_0 and SE_redist3_stall_entry_aunroll_o22_8_0_s_tv_0;
            ELSE
                SE_redist3_stall_entry_aunroll_o22_8_0_R_v_0 <= SE_redist3_stall_entry_aunroll_o22_8_0_v_s_0;
            END IF;

            IF (SE_redist3_stall_entry_aunroll_o22_8_0_backEN = "0") THEN
                SE_redist3_stall_entry_aunroll_o22_8_0_R_v_1 <= SE_redist3_stall_entry_aunroll_o22_8_0_R_v_1 and SE_redist3_stall_entry_aunroll_o22_8_0_s_tv_1;
            ELSE
                SE_redist3_stall_entry_aunroll_o22_8_0_R_v_1 <= SE_redist3_stall_entry_aunroll_o22_8_0_v_s_0;
            END IF;

            IF (SE_redist3_stall_entry_aunroll_o22_8_0_backEN = "0") THEN
                SE_redist3_stall_entry_aunroll_o22_8_0_R_v_2 <= SE_redist3_stall_entry_aunroll_o22_8_0_R_v_2 and SE_redist3_stall_entry_aunroll_o22_8_0_s_tv_2;
            ELSE
                SE_redist3_stall_entry_aunroll_o22_8_0_R_v_2 <= SE_redist3_stall_entry_aunroll_o22_8_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_i_011_lc_outerphi_conv2d1x1(STALLENABLE,252)
    -- Valid signal propagation
    SE_i_i_011_lc_outerphi_conv2d1x1_V0 <= SE_i_i_011_lc_outerphi_conv2d1x1_R_v_0;
    -- Stall signal propagation
    SE_i_i_011_lc_outerphi_conv2d1x1_s_tv_0 <= SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_backStall and SE_i_i_011_lc_outerphi_conv2d1x1_R_v_0;
    -- Backward Enable generation
    SE_i_i_011_lc_outerphi_conv2d1x1_backEN <= not (SE_i_i_011_lc_outerphi_conv2d1x1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_i_011_lc_outerphi_conv2d1x1_v_s_0 <= SE_i_i_011_lc_outerphi_conv2d1x1_backEN and SR_SE_i_i_011_lc_outerphi_conv2d1x1_V;
    -- Backward Stall generation
    SE_i_i_011_lc_outerphi_conv2d1x1_backStall <= not (SE_i_i_011_lc_outerphi_conv2d1x1_backEN);
    SE_i_i_011_lc_outerphi_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_i_011_lc_outerphi_conv2d1x1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_i_011_lc_outerphi_conv2d1x1_backEN = "0") THEN
                SE_i_i_011_lc_outerphi_conv2d1x1_R_v_0 <= SE_i_i_011_lc_outerphi_conv2d1x1_R_v_0 and SE_i_i_011_lc_outerphi_conv2d1x1_s_tv_0;
            ELSE
                SE_i_i_011_lc_outerphi_conv2d1x1_R_v_0 <= SE_i_i_011_lc_outerphi_conv2d1x1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_i_i_011_lc_outerphi_conv2d1x1(STALLREG,428)
    SR_SE_i_i_011_lc_outerphi_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_i_011_lc_outerphi_conv2d1x1_r_valid <= (others => '0');
            SR_SE_i_i_011_lc_outerphi_conv2d1x1_r_data0 <= (others => '-');
            SR_SE_i_i_011_lc_outerphi_conv2d1x1_r_data1 <= (others => '-');
            SR_SE_i_i_011_lc_outerphi_conv2d1x1_r_data2 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_i_011_lc_outerphi_conv2d1x1_r_valid <= SE_i_i_011_lc_outerphi_conv2d1x1_backStall and (SR_SE_i_i_011_lc_outerphi_conv2d1x1_r_valid or SR_SE_i_i_011_lc_outerphi_conv2d1x1_i_valid);

            IF (SR_SE_i_i_011_lc_outerphi_conv2d1x1_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_i_011_lc_outerphi_conv2d1x1_r_data0 <= redist12_i_unnamed_conv2d1x1103_q_1_0_q;
                SR_SE_i_i_011_lc_outerphi_conv2d1x1_r_data1 <= redist3_stall_entry_aunroll_o22_8_0_q;
                SR_SE_i_i_011_lc_outerphi_conv2d1x1_r_data2 <= redist18_bgTrunc_i_inc34_conv2d1x1_sel_x_b_1_0_q;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_i_011_lc_outerphi_conv2d1x1_and0 <= SE_redist3_stall_entry_aunroll_o22_8_0_V0;
    SR_SE_i_i_011_lc_outerphi_conv2d1x1_i_valid <= SE_redist12_i_unnamed_conv2d1x1103_q_1_0_V0 and SR_SE_i_i_011_lc_outerphi_conv2d1x1_and0;
    -- Stall signal propagation
    SR_SE_i_i_011_lc_outerphi_conv2d1x1_backStall <= SR_SE_i_i_011_lc_outerphi_conv2d1x1_r_valid or not (SR_SE_i_i_011_lc_outerphi_conv2d1x1_i_valid);

    -- Valid
    SR_SE_i_i_011_lc_outerphi_conv2d1x1_V <= SR_SE_i_i_011_lc_outerphi_conv2d1x1_r_valid WHEN SR_SE_i_i_011_lc_outerphi_conv2d1x1_r_valid = "1" ELSE SR_SE_i_i_011_lc_outerphi_conv2d1x1_i_valid;

    -- Data0
    SR_SE_i_i_011_lc_outerphi_conv2d1x1_D0 <= SR_SE_i_i_011_lc_outerphi_conv2d1x1_r_data0 WHEN SR_SE_i_i_011_lc_outerphi_conv2d1x1_r_valid = "1" ELSE redist12_i_unnamed_conv2d1x1103_q_1_0_q;
    -- Data1
    SR_SE_i_i_011_lc_outerphi_conv2d1x1_D1 <= SR_SE_i_i_011_lc_outerphi_conv2d1x1_r_data1 WHEN SR_SE_i_i_011_lc_outerphi_conv2d1x1_r_valid = "1" ELSE redist3_stall_entry_aunroll_o22_8_0_q;
    -- Data2
    SR_SE_i_i_011_lc_outerphi_conv2d1x1_D2 <= SR_SE_i_i_011_lc_outerphi_conv2d1x1_r_data2 WHEN SR_SE_i_i_011_lc_outerphi_conv2d1x1_r_valid = "1" ELSE redist18_bgTrunc_i_inc34_conv2d1x1_sel_x_b_1_0_q;

    -- SE_redist12_i_unnamed_conv2d1x1103_q_1_0(STALLENABLE,331)
    -- Valid signal propagation
    SE_redist12_i_unnamed_conv2d1x1103_q_1_0_V0 <= SE_redist12_i_unnamed_conv2d1x1103_q_1_0_R_v_0;
    SE_redist12_i_unnamed_conv2d1x1103_q_1_0_V1 <= SE_redist12_i_unnamed_conv2d1x1103_q_1_0_R_v_1;
    -- Stall signal propagation
    SE_redist12_i_unnamed_conv2d1x1103_q_1_0_s_tv_0 <= SR_SE_i_i_011_lc_outerphi_conv2d1x1_backStall and SE_redist12_i_unnamed_conv2d1x1103_q_1_0_R_v_0;
    SE_redist12_i_unnamed_conv2d1x1103_q_1_0_s_tv_1 <= SE_redist13_i_unnamed_conv2d1x1103_q_2_0_backStall and SE_redist12_i_unnamed_conv2d1x1103_q_1_0_R_v_1;
    -- Backward Enable generation
    SE_redist12_i_unnamed_conv2d1x1103_q_1_0_or0 <= SE_redist12_i_unnamed_conv2d1x1103_q_1_0_s_tv_0;
    SE_redist12_i_unnamed_conv2d1x1103_q_1_0_backEN <= not (SE_redist12_i_unnamed_conv2d1x1103_q_1_0_s_tv_1 or SE_redist12_i_unnamed_conv2d1x1103_q_1_0_or0);
    -- Determine whether to write valid data into the first register stage
    SE_redist12_i_unnamed_conv2d1x1103_q_1_0_v_s_0 <= SE_redist12_i_unnamed_conv2d1x1103_q_1_0_backEN and SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_V;
    -- Backward Stall generation
    SE_redist12_i_unnamed_conv2d1x1103_q_1_0_backStall <= not (SE_redist12_i_unnamed_conv2d1x1103_q_1_0_backEN);
    SE_redist12_i_unnamed_conv2d1x1103_q_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist12_i_unnamed_conv2d1x1103_q_1_0_R_v_0 <= (others => '0');
            SE_redist12_i_unnamed_conv2d1x1103_q_1_0_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist12_i_unnamed_conv2d1x1103_q_1_0_backEN = "0") THEN
                SE_redist12_i_unnamed_conv2d1x1103_q_1_0_R_v_0 <= SE_redist12_i_unnamed_conv2d1x1103_q_1_0_R_v_0 and SE_redist12_i_unnamed_conv2d1x1103_q_1_0_s_tv_0;
            ELSE
                SE_redist12_i_unnamed_conv2d1x1103_q_1_0_R_v_0 <= SE_redist12_i_unnamed_conv2d1x1103_q_1_0_v_s_0;
            END IF;

            IF (SE_redist12_i_unnamed_conv2d1x1103_q_1_0_backEN = "0") THEN
                SE_redist12_i_unnamed_conv2d1x1103_q_1_0_R_v_1 <= SE_redist12_i_unnamed_conv2d1x1103_q_1_0_R_v_1 and SE_redist12_i_unnamed_conv2d1x1103_q_1_0_s_tv_1;
            ELSE
                SE_redist12_i_unnamed_conv2d1x1103_q_1_0_R_v_1 <= SE_redist12_i_unnamed_conv2d1x1103_q_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0(STALLREG,426)
    SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_r_valid <= (others => '0');
            SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_r_valid <= SE_redist12_i_unnamed_conv2d1x1103_q_1_0_backStall and (SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_r_valid or SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_i_valid);

            IF (SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_r_data0 <= STD_LOGIC_VECTOR(i_unnamed_conv2d1x1103_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_i_valid <= SE_i_unnamed_conv2d1x1103_V1;
    -- Stall signal propagation
    SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_backStall <= SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_r_valid or not (SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_i_valid);

    -- Valid
    SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_V <= SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_r_valid WHEN SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_r_valid = "1" ELSE SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_i_valid;

    SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_D0 <= SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_r_data0 WHEN SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_r_valid = "1" ELSE i_unnamed_conv2d1x1103_q;

    -- redist20_bgTrunc_i_inc31_conv2d1x1_sel_x_b_2_0(REG,191)
    redist20_bgTrunc_i_inc31_conv2d1x1_sel_x_b_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist20_bgTrunc_i_inc31_conv2d1x1_sel_x_b_2_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_6_backEN = "1") THEN
                redist20_bgTrunc_i_inc31_conv2d1x1_sel_x_b_2_0_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_aunroll_o5_7_6_D3);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0(STALLENABLE,333)
    -- Valid signal propagation
    SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_V0 <= SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_R_v_0;
    -- Stall signal propagation
    SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_s_tv_0 <= SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_backStall and SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_R_v_0;
    -- Backward Enable generation
    SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_backEN <= not (SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_v_s_0 <= SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_backEN and SE_i_j_17_lc_innerphi_conv2d1x1_V0;
    -- Backward Stall generation
    SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_backStall <= not (SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_v_s_0);
    SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_backEN = "0") THEN
                SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_R_v_0 <= SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_R_v_0 and SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_s_tv_0;
            ELSE
                SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_R_v_0 <= SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_j_17_lc_innerphi_conv2d1x1(STALLENABLE,255)
    -- Valid signal propagation
    SE_i_j_17_lc_innerphi_conv2d1x1_V0 <= SE_i_j_17_lc_innerphi_conv2d1x1_R_v_0;
    -- Stall signal propagation
    SE_i_j_17_lc_innerphi_conv2d1x1_s_tv_0 <= SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_backStall and SE_i_j_17_lc_innerphi_conv2d1x1_R_v_0;
    -- Backward Enable generation
    SE_i_j_17_lc_innerphi_conv2d1x1_backEN <= not (SE_i_j_17_lc_innerphi_conv2d1x1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_j_17_lc_innerphi_conv2d1x1_v_s_0 <= SE_i_j_17_lc_innerphi_conv2d1x1_backEN and SR_SE_i_j_17_lc_innerphi_conv2d1x1_V;
    -- Backward Stall generation
    SE_i_j_17_lc_innerphi_conv2d1x1_backStall <= not (SE_i_j_17_lc_innerphi_conv2d1x1_backEN);
    SE_i_j_17_lc_innerphi_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_j_17_lc_innerphi_conv2d1x1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_j_17_lc_innerphi_conv2d1x1_backEN = "0") THEN
                SE_i_j_17_lc_innerphi_conv2d1x1_R_v_0 <= SE_i_j_17_lc_innerphi_conv2d1x1_R_v_0 and SE_i_j_17_lc_innerphi_conv2d1x1_s_tv_0;
            ELSE
                SE_i_j_17_lc_innerphi_conv2d1x1_R_v_0 <= SE_i_j_17_lc_innerphi_conv2d1x1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_i_j_17_lc_innerphi_conv2d1x1(STALLREG,429)
    SR_SE_i_j_17_lc_innerphi_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_j_17_lc_innerphi_conv2d1x1_r_valid <= (others => '0');
            SR_SE_i_j_17_lc_innerphi_conv2d1x1_r_data0 <= (others => '-');
            SR_SE_i_j_17_lc_innerphi_conv2d1x1_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_j_17_lc_innerphi_conv2d1x1_r_valid <= SE_i_j_17_lc_innerphi_conv2d1x1_backStall and (SR_SE_i_j_17_lc_innerphi_conv2d1x1_r_valid or SR_SE_i_j_17_lc_innerphi_conv2d1x1_i_valid);

            IF (SR_SE_i_j_17_lc_innerphi_conv2d1x1_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_j_17_lc_innerphi_conv2d1x1_r_data0 <= i_unnamed_conv2d1x1103_q;
                SR_SE_i_j_17_lc_innerphi_conv2d1x1_r_data1 <= redist20_bgTrunc_i_inc31_conv2d1x1_sel_x_b_2_0_q;
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_j_17_lc_innerphi_conv2d1x1_and0 <= SE_i_unnamed_conv2d1x1103_V0;
    SR_SE_i_j_17_lc_innerphi_conv2d1x1_i_valid <= SE_redist1_stall_entry_aunroll_o5_7_6_V3 and SR_SE_i_j_17_lc_innerphi_conv2d1x1_and0;
    -- Stall signal propagation
    SR_SE_i_j_17_lc_innerphi_conv2d1x1_backStall <= SR_SE_i_j_17_lc_innerphi_conv2d1x1_r_valid or not (SR_SE_i_j_17_lc_innerphi_conv2d1x1_i_valid);

    -- Valid
    SR_SE_i_j_17_lc_innerphi_conv2d1x1_V <= SR_SE_i_j_17_lc_innerphi_conv2d1x1_r_valid WHEN SR_SE_i_j_17_lc_innerphi_conv2d1x1_r_valid = "1" ELSE SR_SE_i_j_17_lc_innerphi_conv2d1x1_i_valid;

    -- Data0
    SR_SE_i_j_17_lc_innerphi_conv2d1x1_D0 <= SR_SE_i_j_17_lc_innerphi_conv2d1x1_r_data0 WHEN SR_SE_i_j_17_lc_innerphi_conv2d1x1_r_valid = "1" ELSE i_unnamed_conv2d1x1103_q;
    -- Data1
    SR_SE_i_j_17_lc_innerphi_conv2d1x1_D1 <= SR_SE_i_j_17_lc_innerphi_conv2d1x1_r_data1 WHEN SR_SE_i_j_17_lc_innerphi_conv2d1x1_r_valid = "1" ELSE redist20_bgTrunc_i_inc31_conv2d1x1_sel_x_b_2_0_q;

    -- SE_redist1_stall_entry_aunroll_o5_7_6(STALLENABLE,302)
    -- Valid signal propagation
    SE_redist1_stall_entry_aunroll_o5_7_6_V0 <= SE_redist1_stall_entry_aunroll_o5_7_6_R_v_0;
    SE_redist1_stall_entry_aunroll_o5_7_6_V1 <= SE_redist1_stall_entry_aunroll_o5_7_6_R_v_1;
    SE_redist1_stall_entry_aunroll_o5_7_6_V2 <= SE_redist1_stall_entry_aunroll_o5_7_6_R_v_2;
    SE_redist1_stall_entry_aunroll_o5_7_6_V3 <= SE_redist1_stall_entry_aunroll_o5_7_6_R_v_3;
    -- Stall signal propagation
    SE_redist1_stall_entry_aunroll_o5_7_6_s_tv_0 <= SE_out_i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_backStall and SE_redist1_stall_entry_aunroll_o5_7_6_R_v_0;
    SE_redist1_stall_entry_aunroll_o5_7_6_s_tv_1 <= SE_i_unnamed_conv2d1x1103_backStall and SE_redist1_stall_entry_aunroll_o5_7_6_R_v_1;
    SE_redist1_stall_entry_aunroll_o5_7_6_s_tv_2 <= SR_SE_redist3_stall_entry_aunroll_o22_8_0_backStall and SE_redist1_stall_entry_aunroll_o5_7_6_R_v_2;
    SE_redist1_stall_entry_aunroll_o5_7_6_s_tv_3 <= SR_SE_i_j_17_lc_innerphi_conv2d1x1_backStall and SE_redist1_stall_entry_aunroll_o5_7_6_R_v_3;
    -- Backward Enable generation
    SE_redist1_stall_entry_aunroll_o5_7_6_or0 <= SE_redist1_stall_entry_aunroll_o5_7_6_s_tv_0;
    SE_redist1_stall_entry_aunroll_o5_7_6_or1 <= SE_redist1_stall_entry_aunroll_o5_7_6_s_tv_1 or SE_redist1_stall_entry_aunroll_o5_7_6_or0;
    SE_redist1_stall_entry_aunroll_o5_7_6_or2 <= SE_redist1_stall_entry_aunroll_o5_7_6_s_tv_2 or SE_redist1_stall_entry_aunroll_o5_7_6_or1;
    SE_redist1_stall_entry_aunroll_o5_7_6_backEN <= not (SE_redist1_stall_entry_aunroll_o5_7_6_s_tv_3 or SE_redist1_stall_entry_aunroll_o5_7_6_or2);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_stall_entry_aunroll_o5_7_6_v_s_0 <= SE_redist1_stall_entry_aunroll_o5_7_6_backEN and SR_SE_redist1_stall_entry_aunroll_o5_7_6_V;
    -- Backward Stall generation
    SE_redist1_stall_entry_aunroll_o5_7_6_backStall <= not (SE_redist1_stall_entry_aunroll_o5_7_6_backEN);
    SE_redist1_stall_entry_aunroll_o5_7_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_stall_entry_aunroll_o5_7_6_R_v_0 <= (others => '0');
            SE_redist1_stall_entry_aunroll_o5_7_6_R_v_1 <= (others => '0');
            SE_redist1_stall_entry_aunroll_o5_7_6_R_v_2 <= (others => '0');
            SE_redist1_stall_entry_aunroll_o5_7_6_R_v_3 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_6_backEN = "0") THEN
                SE_redist1_stall_entry_aunroll_o5_7_6_R_v_0 <= SE_redist1_stall_entry_aunroll_o5_7_6_R_v_0 and SE_redist1_stall_entry_aunroll_o5_7_6_s_tv_0;
            ELSE
                SE_redist1_stall_entry_aunroll_o5_7_6_R_v_0 <= SE_redist1_stall_entry_aunroll_o5_7_6_v_s_0;
            END IF;

            IF (SE_redist1_stall_entry_aunroll_o5_7_6_backEN = "0") THEN
                SE_redist1_stall_entry_aunroll_o5_7_6_R_v_1 <= SE_redist1_stall_entry_aunroll_o5_7_6_R_v_1 and SE_redist1_stall_entry_aunroll_o5_7_6_s_tv_1;
            ELSE
                SE_redist1_stall_entry_aunroll_o5_7_6_R_v_1 <= SE_redist1_stall_entry_aunroll_o5_7_6_v_s_0;
            END IF;

            IF (SE_redist1_stall_entry_aunroll_o5_7_6_backEN = "0") THEN
                SE_redist1_stall_entry_aunroll_o5_7_6_R_v_2 <= SE_redist1_stall_entry_aunroll_o5_7_6_R_v_2 and SE_redist1_stall_entry_aunroll_o5_7_6_s_tv_2;
            ELSE
                SE_redist1_stall_entry_aunroll_o5_7_6_R_v_2 <= SE_redist1_stall_entry_aunroll_o5_7_6_v_s_0;
            END IF;

            IF (SE_redist1_stall_entry_aunroll_o5_7_6_backEN = "0") THEN
                SE_redist1_stall_entry_aunroll_o5_7_6_R_v_3 <= SE_redist1_stall_entry_aunroll_o5_7_6_R_v_3 and SE_redist1_stall_entry_aunroll_o5_7_6_s_tv_3;
            ELSE
                SE_redist1_stall_entry_aunroll_o5_7_6_R_v_3 <= SE_redist1_stall_entry_aunroll_o5_7_6_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_unnamed_conv2d1x1103(STALLENABLE,271)
    SE_i_unnamed_conv2d1x1103_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_unnamed_conv2d1x1103_fromReg0 <= (others => '0');
            SE_i_unnamed_conv2d1x1103_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_i_unnamed_conv2d1x1103_fromReg0 <= SE_i_unnamed_conv2d1x1103_toReg0;
            -- Succesor 1
            SE_i_unnamed_conv2d1x1103_fromReg1 <= SE_i_unnamed_conv2d1x1103_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_i_unnamed_conv2d1x1103_consumed0 <= (not (SR_SE_i_j_17_lc_innerphi_conv2d1x1_backStall) and SE_i_unnamed_conv2d1x1103_wireValid) or SE_i_unnamed_conv2d1x1103_fromReg0;
    SE_i_unnamed_conv2d1x1103_consumed1 <= (not (SR_SE_redist12_i_unnamed_conv2d1x1103_q_1_0_backStall) and SE_i_unnamed_conv2d1x1103_wireValid) or SE_i_unnamed_conv2d1x1103_fromReg1;
    -- Consuming
    SE_i_unnamed_conv2d1x1103_StallValid <= SE_i_unnamed_conv2d1x1103_backStall and SE_i_unnamed_conv2d1x1103_wireValid;
    SE_i_unnamed_conv2d1x1103_toReg0 <= SE_i_unnamed_conv2d1x1103_StallValid and SE_i_unnamed_conv2d1x1103_consumed0;
    SE_i_unnamed_conv2d1x1103_toReg1 <= SE_i_unnamed_conv2d1x1103_StallValid and SE_i_unnamed_conv2d1x1103_consumed1;
    -- Backward Stall generation
    SE_i_unnamed_conv2d1x1103_or0 <= SE_i_unnamed_conv2d1x1103_consumed0;
    SE_i_unnamed_conv2d1x1103_wireStall <= not (SE_i_unnamed_conv2d1x1103_consumed1 and SE_i_unnamed_conv2d1x1103_or0);
    SE_i_unnamed_conv2d1x1103_backStall <= SE_i_unnamed_conv2d1x1103_wireStall;
    -- Valid signal propagation
    SE_i_unnamed_conv2d1x1103_V0 <= SE_i_unnamed_conv2d1x1103_wireValid and not (SE_i_unnamed_conv2d1x1103_fromReg0);
    SE_i_unnamed_conv2d1x1103_V1 <= SE_i_unnamed_conv2d1x1103_wireValid and not (SE_i_unnamed_conv2d1x1103_fromReg1);
    -- Computing multiple Valid(s)
    SE_i_unnamed_conv2d1x1103_and0 <= SE_i_exitcond12_conv2d1x1_V0;
    SE_i_unnamed_conv2d1x1103_wireValid <= SE_redist1_stall_entry_aunroll_o5_7_6_V1 and SE_i_unnamed_conv2d1x1103_and0;

    -- SE_i_exitcond12_conv2d1x1(STALLENABLE,249)
    -- Valid signal propagation
    SE_i_exitcond12_conv2d1x1_V0 <= SE_i_exitcond12_conv2d1x1_R_v_0;
    -- Stall signal propagation
    SE_i_exitcond12_conv2d1x1_s_tv_0 <= SE_i_unnamed_conv2d1x1103_backStall and SE_i_exitcond12_conv2d1x1_R_v_0;
    -- Backward Enable generation
    SE_i_exitcond12_conv2d1x1_backEN <= not (SE_i_exitcond12_conv2d1x1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_exitcond12_conv2d1x1_v_s_0 <= SE_i_exitcond12_conv2d1x1_backEN and SR_SE_i_exitcond12_conv2d1x1_V;
    -- Backward Stall generation
    SE_i_exitcond12_conv2d1x1_backStall <= not (SE_i_exitcond12_conv2d1x1_backEN);
    SE_i_exitcond12_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_exitcond12_conv2d1x1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_exitcond12_conv2d1x1_backEN = "0") THEN
                SE_i_exitcond12_conv2d1x1_R_v_0 <= SE_i_exitcond12_conv2d1x1_R_v_0 and SE_i_exitcond12_conv2d1x1_s_tv_0;
            ELSE
                SE_i_exitcond12_conv2d1x1_R_v_0 <= SE_i_exitcond12_conv2d1x1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_i_exitcond12_conv2d1x1(STALLREG,425)
    SR_SE_i_exitcond12_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_exitcond12_conv2d1x1_r_valid <= (others => '0');
            SR_SE_i_exitcond12_conv2d1x1_r_data0 <= (others => '-');
            SR_SE_i_exitcond12_conv2d1x1_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_exitcond12_conv2d1x1_r_valid <= SE_i_exitcond12_conv2d1x1_backStall and (SR_SE_i_exitcond12_conv2d1x1_r_valid or SR_SE_i_exitcond12_conv2d1x1_i_valid);

            IF (SR_SE_i_exitcond12_conv2d1x1_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_exitcond12_conv2d1x1_r_data0 <= STD_LOGIC_VECTOR(redist19_bgTrunc_i_inc31_conv2d1x1_sel_x_b_1_0_q);
                SR_SE_i_exitcond12_conv2d1x1_r_data1 <= STD_LOGIC_VECTOR(bubble_select_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_exitcond12_conv2d1x1_and0 <= SE_redist1_stall_entry_aunroll_o5_7_5_V1;
    SR_SE_i_exitcond12_conv2d1x1_i_valid <= SE_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_V1 and SR_SE_i_exitcond12_conv2d1x1_and0;
    -- Stall signal propagation
    SR_SE_i_exitcond12_conv2d1x1_backStall <= SR_SE_i_exitcond12_conv2d1x1_r_valid or not (SR_SE_i_exitcond12_conv2d1x1_i_valid);

    -- Valid
    SR_SE_i_exitcond12_conv2d1x1_V <= SR_SE_i_exitcond12_conv2d1x1_r_valid WHEN SR_SE_i_exitcond12_conv2d1x1_r_valid = "1" ELSE SR_SE_i_exitcond12_conv2d1x1_i_valid;

    -- Data0
    SR_SE_i_exitcond12_conv2d1x1_D0 <= SR_SE_i_exitcond12_conv2d1x1_r_data0 WHEN SR_SE_i_exitcond12_conv2d1x1_r_valid = "1" ELSE redist19_bgTrunc_i_inc31_conv2d1x1_sel_x_b_1_0_q;
    -- Data1
    SR_SE_i_exitcond12_conv2d1x1_D1 <= SR_SE_i_exitcond12_conv2d1x1_r_data1 WHEN SR_SE_i_exitcond12_conv2d1x1_r_valid = "1" ELSE bubble_select_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_b;

    -- redist7_stall_entry_aunroll_o25_7_5(REG,177)
    redist7_stall_entry_aunroll_o25_7_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_stall_entry_aunroll_o25_7_5_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_5_backEN = "1") THEN
                redist7_stall_entry_aunroll_o25_7_5_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_aunroll_o5_7_5_D2);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o22_7_5(REG,162)
    redist2_stall_entry_aunroll_o22_7_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o22_7_5_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_5_backEN = "1") THEN
                redist2_stall_entry_aunroll_o22_7_5_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_aunroll_o5_7_5_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_aunroll_o5_7_5(REG,155)
    redist1_stall_entry_aunroll_o5_7_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o5_7_5_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_5_backEN = "1") THEN
                redist1_stall_entry_aunroll_o5_7_5_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_aunroll_o5_7_5_D0);
            END IF;
        END IF;
    END PROCESS;

    -- SR_SE_redist1_stall_entry_aunroll_o5_7_6(STALLREG,418)
    SR_SE_redist1_stall_entry_aunroll_o5_7_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_valid <= (others => '0');
            SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_data0 <= (others => '-');
            SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_data1 <= (others => '-');
            SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_data2 <= (others => '-');
            SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_data3 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_valid <= SE_redist1_stall_entry_aunroll_o5_7_6_backStall and (SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_valid or SR_SE_redist1_stall_entry_aunroll_o5_7_6_i_valid);

            IF (SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_data0 <= STD_LOGIC_VECTOR(redist1_stall_entry_aunroll_o5_7_5_q);
                SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_data1 <= STD_LOGIC_VECTOR(redist2_stall_entry_aunroll_o22_7_5_q);
                SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_data2 <= STD_LOGIC_VECTOR(redist7_stall_entry_aunroll_o25_7_5_q);
                SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_data3 <= STD_LOGIC_VECTOR(redist19_bgTrunc_i_inc31_conv2d1x1_sel_x_b_1_0_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist1_stall_entry_aunroll_o5_7_6_i_valid <= SE_redist1_stall_entry_aunroll_o5_7_5_V0;
    -- Stall signal propagation
    SR_SE_redist1_stall_entry_aunroll_o5_7_6_backStall <= SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_valid or not (SR_SE_redist1_stall_entry_aunroll_o5_7_6_i_valid);

    -- Valid
    SR_SE_redist1_stall_entry_aunroll_o5_7_6_V <= SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_valid WHEN SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_valid = "1" ELSE SR_SE_redist1_stall_entry_aunroll_o5_7_6_i_valid;

    -- Data0
    SR_SE_redist1_stall_entry_aunroll_o5_7_6_D0 <= SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_data0 WHEN SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_valid = "1" ELSE redist1_stall_entry_aunroll_o5_7_5_q;
    -- Data1
    SR_SE_redist1_stall_entry_aunroll_o5_7_6_D1 <= SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_data1 WHEN SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_valid = "1" ELSE redist2_stall_entry_aunroll_o22_7_5_q;
    -- Data2
    SR_SE_redist1_stall_entry_aunroll_o5_7_6_D2 <= SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_data2 WHEN SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_valid = "1" ELSE redist7_stall_entry_aunroll_o25_7_5_q;
    -- Data3
    SR_SE_redist1_stall_entry_aunroll_o5_7_6_D3 <= SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_data3 WHEN SR_SE_redist1_stall_entry_aunroll_o5_7_6_r_valid = "1" ELSE redist19_bgTrunc_i_inc31_conv2d1x1_sel_x_b_1_0_q;

    -- SE_redist1_stall_entry_aunroll_o5_7_5(STALLENABLE,301)
    -- Valid signal propagation
    SE_redist1_stall_entry_aunroll_o5_7_5_V0 <= SE_redist1_stall_entry_aunroll_o5_7_5_R_v_0;
    SE_redist1_stall_entry_aunroll_o5_7_5_V1 <= SE_redist1_stall_entry_aunroll_o5_7_5_R_v_1;
    -- Stall signal propagation
    SE_redist1_stall_entry_aunroll_o5_7_5_s_tv_0 <= SR_SE_redist1_stall_entry_aunroll_o5_7_6_backStall and SE_redist1_stall_entry_aunroll_o5_7_5_R_v_0;
    SE_redist1_stall_entry_aunroll_o5_7_5_s_tv_1 <= SR_SE_i_exitcond12_conv2d1x1_backStall and SE_redist1_stall_entry_aunroll_o5_7_5_R_v_1;
    -- Backward Enable generation
    SE_redist1_stall_entry_aunroll_o5_7_5_or0 <= SE_redist1_stall_entry_aunroll_o5_7_5_s_tv_0;
    SE_redist1_stall_entry_aunroll_o5_7_5_backEN <= not (SE_redist1_stall_entry_aunroll_o5_7_5_s_tv_1 or SE_redist1_stall_entry_aunroll_o5_7_5_or0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_stall_entry_aunroll_o5_7_5_v_s_0 <= SE_redist1_stall_entry_aunroll_o5_7_5_backEN and SR_SE_redist1_stall_entry_aunroll_o5_7_5_V;
    -- Backward Stall generation
    SE_redist1_stall_entry_aunroll_o5_7_5_backStall <= not (SE_redist1_stall_entry_aunroll_o5_7_5_backEN);
    SE_redist1_stall_entry_aunroll_o5_7_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_stall_entry_aunroll_o5_7_5_R_v_0 <= (others => '0');
            SE_redist1_stall_entry_aunroll_o5_7_5_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_5_backEN = "0") THEN
                SE_redist1_stall_entry_aunroll_o5_7_5_R_v_0 <= SE_redist1_stall_entry_aunroll_o5_7_5_R_v_0 and SE_redist1_stall_entry_aunroll_o5_7_5_s_tv_0;
            ELSE
                SE_redist1_stall_entry_aunroll_o5_7_5_R_v_0 <= SE_redist1_stall_entry_aunroll_o5_7_5_v_s_0;
            END IF;

            IF (SE_redist1_stall_entry_aunroll_o5_7_5_backEN = "0") THEN
                SE_redist1_stall_entry_aunroll_o5_7_5_R_v_1 <= SE_redist1_stall_entry_aunroll_o5_7_5_R_v_1 and SE_redist1_stall_entry_aunroll_o5_7_5_s_tv_1;
            ELSE
                SE_redist1_stall_entry_aunroll_o5_7_5_R_v_1 <= SE_redist1_stall_entry_aunroll_o5_7_5_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist1_stall_entry_aunroll_o5_7_5(STALLREG,417)
    SR_SE_redist1_stall_entry_aunroll_o5_7_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_valid <= (others => '0');
            SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_data0 <= (others => '-');
            SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_data1 <= (others => '-');
            SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_data2 <= (others => '-');
            SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_data3 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_valid <= SE_redist1_stall_entry_aunroll_o5_7_5_backStall and (SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_valid or SR_SE_redist1_stall_entry_aunroll_o5_7_5_i_valid);

            IF (SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_data0 <= STD_LOGIC_VECTOR(redist1_stall_entry_aunroll_o5_7_4_q);
                SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_data1 <= STD_LOGIC_VECTOR(redist2_stall_entry_aunroll_o22_7_4_q);
                SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_data2 <= STD_LOGIC_VECTOR(redist7_stall_entry_aunroll_o25_7_4_q);
                SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_data3 <= STD_LOGIC_VECTOR(bgTrunc_i_inc31_conv2d1x1_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist1_stall_entry_aunroll_o5_7_5_i_valid <= SE_redist1_stall_entry_aunroll_o5_7_4_V0;
    -- Stall signal propagation
    SR_SE_redist1_stall_entry_aunroll_o5_7_5_backStall <= SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_valid or not (SR_SE_redist1_stall_entry_aunroll_o5_7_5_i_valid);

    -- Valid
    SR_SE_redist1_stall_entry_aunroll_o5_7_5_V <= SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_valid WHEN SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_valid = "1" ELSE SR_SE_redist1_stall_entry_aunroll_o5_7_5_i_valid;

    -- Data0
    SR_SE_redist1_stall_entry_aunroll_o5_7_5_D0 <= SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_data0 WHEN SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_valid = "1" ELSE redist1_stall_entry_aunroll_o5_7_4_q;
    -- Data1
    SR_SE_redist1_stall_entry_aunroll_o5_7_5_D1 <= SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_data1 WHEN SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_valid = "1" ELSE redist2_stall_entry_aunroll_o22_7_4_q;
    -- Data2
    SR_SE_redist1_stall_entry_aunroll_o5_7_5_D2 <= SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_data2 WHEN SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_valid = "1" ELSE redist7_stall_entry_aunroll_o25_7_4_q;
    -- Data3
    SR_SE_redist1_stall_entry_aunroll_o5_7_5_D3 <= SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_data3 WHEN SR_SE_redist1_stall_entry_aunroll_o5_7_5_r_valid = "1" ELSE bgTrunc_i_inc31_conv2d1x1_sel_x_b;

    -- SE_redist1_stall_entry_aunroll_o5_7_4(STALLENABLE,300)
    -- Valid signal propagation
    SE_redist1_stall_entry_aunroll_o5_7_4_V0 <= SE_redist1_stall_entry_aunroll_o5_7_4_R_v_0;
    -- Stall signal propagation
    SE_redist1_stall_entry_aunroll_o5_7_4_s_tv_0 <= SR_SE_redist1_stall_entry_aunroll_o5_7_5_backStall and SE_redist1_stall_entry_aunroll_o5_7_4_R_v_0;
    -- Backward Enable generation
    SE_redist1_stall_entry_aunroll_o5_7_4_backEN <= not (SE_redist1_stall_entry_aunroll_o5_7_4_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_stall_entry_aunroll_o5_7_4_v_s_0 <= SE_redist1_stall_entry_aunroll_o5_7_4_backEN and SE_redist1_stall_entry_aunroll_o5_7_3_V0;
    -- Backward Stall generation
    SE_redist1_stall_entry_aunroll_o5_7_4_backStall <= not (SE_redist1_stall_entry_aunroll_o5_7_4_v_s_0);
    SE_redist1_stall_entry_aunroll_o5_7_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_stall_entry_aunroll_o5_7_4_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_4_backEN = "0") THEN
                SE_redist1_stall_entry_aunroll_o5_7_4_R_v_0 <= SE_redist1_stall_entry_aunroll_o5_7_4_R_v_0 and SE_redist1_stall_entry_aunroll_o5_7_4_s_tv_0;
            ELSE
                SE_redist1_stall_entry_aunroll_o5_7_4_R_v_0 <= SE_redist1_stall_entry_aunroll_o5_7_4_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist1_stall_entry_aunroll_o5_7_3(STALLENABLE,299)
    -- Valid signal propagation
    SE_redist1_stall_entry_aunroll_o5_7_3_V0 <= SE_redist1_stall_entry_aunroll_o5_7_3_R_v_0;
    -- Stall signal propagation
    SE_redist1_stall_entry_aunroll_o5_7_3_s_tv_0 <= SE_redist1_stall_entry_aunroll_o5_7_4_backStall and SE_redist1_stall_entry_aunroll_o5_7_3_R_v_0;
    -- Backward Enable generation
    SE_redist1_stall_entry_aunroll_o5_7_3_backEN <= not (SE_redist1_stall_entry_aunroll_o5_7_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_stall_entry_aunroll_o5_7_3_v_s_0 <= SE_redist1_stall_entry_aunroll_o5_7_3_backEN and SR_SE_redist1_stall_entry_aunroll_o5_7_3_V;
    -- Backward Stall generation
    SE_redist1_stall_entry_aunroll_o5_7_3_backStall <= not (SE_redist1_stall_entry_aunroll_o5_7_3_backEN);
    SE_redist1_stall_entry_aunroll_o5_7_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_stall_entry_aunroll_o5_7_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_3_backEN = "0") THEN
                SE_redist1_stall_entry_aunroll_o5_7_3_R_v_0 <= SE_redist1_stall_entry_aunroll_o5_7_3_R_v_0 and SE_redist1_stall_entry_aunroll_o5_7_3_s_tv_0;
            ELSE
                SE_redist1_stall_entry_aunroll_o5_7_3_R_v_0 <= SE_redist1_stall_entry_aunroll_o5_7_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist1_stall_entry_aunroll_o5_7_3(STALLREG,416)
    SR_SE_redist1_stall_entry_aunroll_o5_7_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_valid <= (others => '0');
            SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_data0 <= (others => '-');
            SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_data1 <= (others => '-');
            SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_data2 <= (others => '-');
            SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_data3 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_valid <= SE_redist1_stall_entry_aunroll_o5_7_3_backStall and (SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_valid or SR_SE_redist1_stall_entry_aunroll_o5_7_3_i_valid);

            IF (SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_data0 <= STD_LOGIC_VECTOR(redist1_stall_entry_aunroll_o5_7_2_q);
                SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_data1 <= STD_LOGIC_VECTOR(redist2_stall_entry_aunroll_o22_7_2_q);
                SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_data2 <= STD_LOGIC_VECTOR(redist4_stall_entry_aunroll_o23_5_2_q);
                SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_data3 <= STD_LOGIC_VECTOR(redist7_stall_entry_aunroll_o25_7_2_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist1_stall_entry_aunroll_o5_7_3_i_valid <= SE_redist1_stall_entry_aunroll_o5_7_2_V0;
    -- Stall signal propagation
    SR_SE_redist1_stall_entry_aunroll_o5_7_3_backStall <= SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_valid or not (SR_SE_redist1_stall_entry_aunroll_o5_7_3_i_valid);

    -- Valid
    SR_SE_redist1_stall_entry_aunroll_o5_7_3_V <= SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_valid WHEN SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_valid = "1" ELSE SR_SE_redist1_stall_entry_aunroll_o5_7_3_i_valid;

    -- Data0
    SR_SE_redist1_stall_entry_aunroll_o5_7_3_D0 <= SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_data0 WHEN SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_valid = "1" ELSE redist1_stall_entry_aunroll_o5_7_2_q;
    -- Data1
    SR_SE_redist1_stall_entry_aunroll_o5_7_3_D1 <= SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_data1 WHEN SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_valid = "1" ELSE redist2_stall_entry_aunroll_o22_7_2_q;
    -- Data2
    SR_SE_redist1_stall_entry_aunroll_o5_7_3_D2 <= SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_data2 WHEN SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_valid = "1" ELSE redist4_stall_entry_aunroll_o23_5_2_q;
    -- Data3
    SR_SE_redist1_stall_entry_aunroll_o5_7_3_D3 <= SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_data3 WHEN SR_SE_redist1_stall_entry_aunroll_o5_7_3_r_valid = "1" ELSE redist7_stall_entry_aunroll_o25_7_2_q;

    -- SE_redist1_stall_entry_aunroll_o5_7_2(STALLENABLE,298)
    -- Valid signal propagation
    SE_redist1_stall_entry_aunroll_o5_7_2_V0 <= SE_redist1_stall_entry_aunroll_o5_7_2_R_v_0;
    -- Stall signal propagation
    SE_redist1_stall_entry_aunroll_o5_7_2_s_tv_0 <= SR_SE_redist1_stall_entry_aunroll_o5_7_3_backStall and SE_redist1_stall_entry_aunroll_o5_7_2_R_v_0;
    -- Backward Enable generation
    SE_redist1_stall_entry_aunroll_o5_7_2_backEN <= not (SE_redist1_stall_entry_aunroll_o5_7_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_stall_entry_aunroll_o5_7_2_v_s_0 <= SE_redist1_stall_entry_aunroll_o5_7_2_backEN and SE_redist1_stall_entry_aunroll_o5_7_1_V0;
    -- Backward Stall generation
    SE_redist1_stall_entry_aunroll_o5_7_2_backStall <= not (SE_redist1_stall_entry_aunroll_o5_7_2_v_s_0);
    SE_redist1_stall_entry_aunroll_o5_7_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_stall_entry_aunroll_o5_7_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_2_backEN = "0") THEN
                SE_redist1_stall_entry_aunroll_o5_7_2_R_v_0 <= SE_redist1_stall_entry_aunroll_o5_7_2_R_v_0 and SE_redist1_stall_entry_aunroll_o5_7_2_s_tv_0;
            ELSE
                SE_redist1_stall_entry_aunroll_o5_7_2_R_v_0 <= SE_redist1_stall_entry_aunroll_o5_7_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist1_stall_entry_aunroll_o5_7_1(STALLENABLE,297)
    -- Valid signal propagation
    SE_redist1_stall_entry_aunroll_o5_7_1_V0 <= SE_redist1_stall_entry_aunroll_o5_7_1_R_v_0;
    -- Stall signal propagation
    SE_redist1_stall_entry_aunroll_o5_7_1_s_tv_0 <= SE_redist1_stall_entry_aunroll_o5_7_2_backStall and SE_redist1_stall_entry_aunroll_o5_7_1_R_v_0;
    -- Backward Enable generation
    SE_redist1_stall_entry_aunroll_o5_7_1_backEN <= not (SE_redist1_stall_entry_aunroll_o5_7_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_stall_entry_aunroll_o5_7_1_v_s_0 <= SE_redist1_stall_entry_aunroll_o5_7_1_backEN and SR_SE_redist1_stall_entry_aunroll_o5_7_1_V;
    -- Backward Stall generation
    SE_redist1_stall_entry_aunroll_o5_7_1_backStall <= not (SE_redist1_stall_entry_aunroll_o5_7_1_backEN);
    SE_redist1_stall_entry_aunroll_o5_7_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_stall_entry_aunroll_o5_7_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_1_backEN = "0") THEN
                SE_redist1_stall_entry_aunroll_o5_7_1_R_v_0 <= SE_redist1_stall_entry_aunroll_o5_7_1_R_v_0 and SE_redist1_stall_entry_aunroll_o5_7_1_s_tv_0;
            ELSE
                SE_redist1_stall_entry_aunroll_o5_7_1_R_v_0 <= SE_redist1_stall_entry_aunroll_o5_7_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist1_stall_entry_aunroll_o5_7_1(STALLREG,415)
    SR_SE_redist1_stall_entry_aunroll_o5_7_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_valid <= (others => '0');
            SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_data0 <= (others => '-');
            SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_data1 <= (others => '-');
            SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_data2 <= (others => '-');
            SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_data3 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_valid <= SE_redist1_stall_entry_aunroll_o5_7_1_backStall and (SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_valid or SR_SE_redist1_stall_entry_aunroll_o5_7_1_i_valid);

            IF (SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_data0 <= STD_LOGIC_VECTOR(redist1_stall_entry_aunroll_o5_7_0_q);
                SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_data1 <= STD_LOGIC_VECTOR(redist2_stall_entry_aunroll_o22_7_0_q);
                SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_data2 <= STD_LOGIC_VECTOR(redist4_stall_entry_aunroll_o23_5_0_q);
                SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_data3 <= STD_LOGIC_VECTOR(redist7_stall_entry_aunroll_o25_7_0_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist1_stall_entry_aunroll_o5_7_1_i_valid <= SE_redist1_stall_entry_aunroll_o5_7_0_V0;
    -- Stall signal propagation
    SR_SE_redist1_stall_entry_aunroll_o5_7_1_backStall <= SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_valid or not (SR_SE_redist1_stall_entry_aunroll_o5_7_1_i_valid);

    -- Valid
    SR_SE_redist1_stall_entry_aunroll_o5_7_1_V <= SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_valid WHEN SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_valid = "1" ELSE SR_SE_redist1_stall_entry_aunroll_o5_7_1_i_valid;

    -- Data0
    SR_SE_redist1_stall_entry_aunroll_o5_7_1_D0 <= SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_data0 WHEN SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_valid = "1" ELSE redist1_stall_entry_aunroll_o5_7_0_q;
    -- Data1
    SR_SE_redist1_stall_entry_aunroll_o5_7_1_D1 <= SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_data1 WHEN SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_valid = "1" ELSE redist2_stall_entry_aunroll_o22_7_0_q;
    -- Data2
    SR_SE_redist1_stall_entry_aunroll_o5_7_1_D2 <= SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_data2 WHEN SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_valid = "1" ELSE redist4_stall_entry_aunroll_o23_5_0_q;
    -- Data3
    SR_SE_redist1_stall_entry_aunroll_o5_7_1_D3 <= SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_data3 WHEN SR_SE_redist1_stall_entry_aunroll_o5_7_1_r_valid = "1" ELSE redist7_stall_entry_aunroll_o25_7_0_q;

    -- SE_redist1_stall_entry_aunroll_o5_7_0(STALLENABLE,296)
    -- Valid signal propagation
    SE_redist1_stall_entry_aunroll_o5_7_0_V0 <= SE_redist1_stall_entry_aunroll_o5_7_0_R_v_0;
    -- Stall signal propagation
    SE_redist1_stall_entry_aunroll_o5_7_0_s_tv_0 <= SR_SE_redist1_stall_entry_aunroll_o5_7_1_backStall and SE_redist1_stall_entry_aunroll_o5_7_0_R_v_0;
    -- Backward Enable generation
    SE_redist1_stall_entry_aunroll_o5_7_0_backEN <= not (SE_redist1_stall_entry_aunroll_o5_7_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_stall_entry_aunroll_o5_7_0_v_s_0 <= SE_redist1_stall_entry_aunroll_o5_7_0_backEN and SE_stall_entry_aunroll_V5;
    -- Backward Stall generation
    SE_redist1_stall_entry_aunroll_o5_7_0_backStall <= not (SE_redist1_stall_entry_aunroll_o5_7_0_v_s_0);
    SE_redist1_stall_entry_aunroll_o5_7_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_stall_entry_aunroll_o5_7_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_0_backEN = "0") THEN
                SE_redist1_stall_entry_aunroll_o5_7_0_R_v_0 <= SE_redist1_stall_entry_aunroll_o5_7_0_R_v_0 and SE_redist1_stall_entry_aunroll_o5_7_0_s_tv_0;
            ELSE
                SE_redist1_stall_entry_aunroll_o5_7_0_R_v_0 <= SE_redist1_stall_entry_aunroll_o5_7_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_out_stall_entry_aunroll_5_reg(STALLFIFO,413)
    bubble_out_stall_entry_aunroll_5_reg_valid_in <= SE_stall_entry_aunroll_V4;
    bubble_out_stall_entry_aunroll_5_reg_stall_in <= SE_out_bubble_out_stall_entry_aunroll_5_backStall;
    bubble_out_stall_entry_aunroll_5_reg_valid_in_bitsignaltemp <= bubble_out_stall_entry_aunroll_5_reg_valid_in(0);
    bubble_out_stall_entry_aunroll_5_reg_stall_in_bitsignaltemp <= bubble_out_stall_entry_aunroll_5_reg_stall_in(0);
    bubble_out_stall_entry_aunroll_5_reg_valid_out(0) <= bubble_out_stall_entry_aunroll_5_reg_valid_out_bitsignaltemp;
    bubble_out_stall_entry_aunroll_5_reg_stall_out(0) <= bubble_out_stall_entry_aunroll_5_reg_stall_out_bitsignaltemp;
    thebubble_out_stall_entry_aunroll_5_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 9,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_stall_entry_aunroll_5_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_stall_entry_aunroll_5_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_stall_entry_aunroll_5_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_stall_entry_aunroll_5_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_i_cmp75_rm70_conv2d1x1(STALLENABLE,247)
    -- Valid signal propagation
    SE_i_cmp75_rm70_conv2d1x1_V0 <= SE_i_cmp75_rm70_conv2d1x1_R_v_0;
    -- Stall signal propagation
    SE_i_cmp75_rm70_conv2d1x1_s_tv_0 <= SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_backStall and SE_i_cmp75_rm70_conv2d1x1_R_v_0;
    -- Backward Enable generation
    SE_i_cmp75_rm70_conv2d1x1_backEN <= not (SE_i_cmp75_rm70_conv2d1x1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_cmp75_rm70_conv2d1x1_v_s_0 <= SE_i_cmp75_rm70_conv2d1x1_backEN and SE_out_i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_V0;
    -- Backward Stall generation
    SE_i_cmp75_rm70_conv2d1x1_backStall <= not (SE_i_cmp75_rm70_conv2d1x1_v_s_0);
    SE_i_cmp75_rm70_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_cmp75_rm70_conv2d1x1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp75_rm70_conv2d1x1_backEN = "0") THEN
                SE_i_cmp75_rm70_conv2d1x1_R_v_0 <= SE_i_cmp75_rm70_conv2d1x1_R_v_0 and SE_i_cmp75_rm70_conv2d1x1_s_tv_0;
            ELSE
                SE_i_cmp75_rm70_conv2d1x1_R_v_0 <= SE_i_cmp75_rm70_conv2d1x1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_out_i_syncbuf_input_size_y_sync_buffer20_conv2d1x1(STALLENABLE,270)
    -- Valid signal propagation
    SE_out_i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_V0 <= SE_out_i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_backStall <= SE_i_cmp75_rm70_conv2d1x1_backStall or not (SE_out_i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_wireValid <= i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_out_valid_out;

    -- i_syncbuf_input_size_y_sync_buffer20_conv2d1x1(BLACKBOX,71)@8
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_input_size_y_sync_buffer20_conv2d1x1 : i_syncbuf_input_size_y_sync_buffer20_conv2d1x192
    PORT MAP (
        in_buffer_in => in_input_size_y,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_backStall,
        in_valid_in => SE_out_bubble_out_stall_entry_aunroll_4_V0,
        out_buffer_out => i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_out_buffer_out,
        out_stall_out => i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_out_stall_out,
        out_valid_out => i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_stall_entry_aunroll_4(STALLENABLE,387)
    -- Valid signal propagation
    SE_out_bubble_out_stall_entry_aunroll_4_V0 <= SE_out_bubble_out_stall_entry_aunroll_4_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_stall_entry_aunroll_4_backStall <= i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_out_stall_out or not (SE_out_bubble_out_stall_entry_aunroll_4_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_stall_entry_aunroll_4_wireValid <= bubble_out_stall_entry_aunroll_4_reg_valid_out;

    -- bubble_out_stall_entry_aunroll_4_reg(STALLFIFO,412)
    bubble_out_stall_entry_aunroll_4_reg_valid_in <= SE_stall_entry_aunroll_V3;
    bubble_out_stall_entry_aunroll_4_reg_stall_in <= SE_out_bubble_out_stall_entry_aunroll_4_backStall;
    bubble_out_stall_entry_aunroll_4_reg_valid_in_bitsignaltemp <= bubble_out_stall_entry_aunroll_4_reg_valid_in(0);
    bubble_out_stall_entry_aunroll_4_reg_stall_in_bitsignaltemp <= bubble_out_stall_entry_aunroll_4_reg_stall_in(0);
    bubble_out_stall_entry_aunroll_4_reg_valid_out(0) <= bubble_out_stall_entry_aunroll_4_reg_valid_out_bitsignaltemp;
    bubble_out_stall_entry_aunroll_4_reg_stall_out(0) <= bubble_out_stall_entry_aunroll_4_reg_stall_out_bitsignaltemp;
    thebubble_out_stall_entry_aunroll_4_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 9,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_stall_entry_aunroll_4_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_stall_entry_aunroll_4_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_stall_entry_aunroll_4_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_stall_entry_aunroll_4_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_i_cmp9_rm69_conv2d1x1(STALLENABLE,248)
    -- Valid signal propagation
    SE_i_cmp9_rm69_conv2d1x1_V0 <= SE_i_cmp9_rm69_conv2d1x1_R_v_0;
    -- Stall signal propagation
    SE_i_cmp9_rm69_conv2d1x1_s_tv_0 <= SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_backStall and SE_i_cmp9_rm69_conv2d1x1_R_v_0;
    -- Backward Enable generation
    SE_i_cmp9_rm69_conv2d1x1_backEN <= not (SE_i_cmp9_rm69_conv2d1x1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_cmp9_rm69_conv2d1x1_v_s_0 <= SE_i_cmp9_rm69_conv2d1x1_backEN and SE_out_i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_V0;
    -- Backward Stall generation
    SE_i_cmp9_rm69_conv2d1x1_backStall <= not (SE_i_cmp9_rm69_conv2d1x1_v_s_0);
    SE_i_cmp9_rm69_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_cmp9_rm69_conv2d1x1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp9_rm69_conv2d1x1_backEN = "0") THEN
                SE_i_cmp9_rm69_conv2d1x1_R_v_0 <= SE_i_cmp9_rm69_conv2d1x1_R_v_0 and SE_i_cmp9_rm69_conv2d1x1_s_tv_0;
            ELSE
                SE_i_cmp9_rm69_conv2d1x1_R_v_0 <= SE_i_cmp9_rm69_conv2d1x1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_out_i_syncbuf_input_size_x_sync_buffer13_conv2d1x1(STALLENABLE,264)
    -- Valid signal propagation
    SE_out_i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_V0 <= SE_out_i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_backStall <= SE_i_cmp9_rm69_conv2d1x1_backStall or not (SE_out_i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_wireValid <= i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_out_valid_out;

    -- i_syncbuf_input_size_x_sync_buffer13_conv2d1x1(BLACKBOX,68)@8
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_input_size_x_sync_buffer13_conv2d1x1 : i_syncbuf_input_size_x_sync_buffer13_conv2d1x190
    PORT MAP (
        in_buffer_in => in_input_size_x,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_backStall,
        in_valid_in => SE_out_bubble_out_stall_entry_aunroll_3_V0,
        out_buffer_out => i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_out_buffer_out,
        out_stall_out => i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_out_stall_out,
        out_valid_out => i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_stall_entry_aunroll_3(STALLENABLE,385)
    -- Valid signal propagation
    SE_out_bubble_out_stall_entry_aunroll_3_V0 <= SE_out_bubble_out_stall_entry_aunroll_3_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_stall_entry_aunroll_3_backStall <= i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_out_stall_out or not (SE_out_bubble_out_stall_entry_aunroll_3_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_stall_entry_aunroll_3_wireValid <= bubble_out_stall_entry_aunroll_3_reg_valid_out;

    -- bubble_out_stall_entry_aunroll_3_reg(STALLFIFO,411)
    bubble_out_stall_entry_aunroll_3_reg_valid_in <= SE_stall_entry_aunroll_V2;
    bubble_out_stall_entry_aunroll_3_reg_stall_in <= SE_out_bubble_out_stall_entry_aunroll_3_backStall;
    bubble_out_stall_entry_aunroll_3_reg_valid_in_bitsignaltemp <= bubble_out_stall_entry_aunroll_3_reg_valid_in(0);
    bubble_out_stall_entry_aunroll_3_reg_stall_in_bitsignaltemp <= bubble_out_stall_entry_aunroll_3_reg_stall_in(0);
    bubble_out_stall_entry_aunroll_3_reg_valid_out(0) <= bubble_out_stall_entry_aunroll_3_reg_valid_out_bitsignaltemp;
    bubble_out_stall_entry_aunroll_3_reg_stall_out(0) <= bubble_out_stall_entry_aunroll_3_reg_stall_out_bitsignaltemp;
    thebubble_out_stall_entry_aunroll_3_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 9,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_stall_entry_aunroll_3_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_stall_entry_aunroll_3_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_stall_entry_aunroll_3_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_stall_entry_aunroll_3_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_stall_entry_aunroll_2_reg(STALLFIFO,410)
    bubble_out_stall_entry_aunroll_2_reg_valid_in <= SE_stall_entry_aunroll_V1;
    bubble_out_stall_entry_aunroll_2_reg_stall_in <= SE_out_bubble_out_stall_entry_aunroll_2_backStall;
    bubble_out_stall_entry_aunroll_2_reg_valid_in_bitsignaltemp <= bubble_out_stall_entry_aunroll_2_reg_valid_in(0);
    bubble_out_stall_entry_aunroll_2_reg_stall_in_bitsignaltemp <= bubble_out_stall_entry_aunroll_2_reg_stall_in(0);
    bubble_out_stall_entry_aunroll_2_reg_valid_out(0) <= bubble_out_stall_entry_aunroll_2_reg_valid_out_bitsignaltemp;
    bubble_out_stall_entry_aunroll_2_reg_stall_out(0) <= bubble_out_stall_entry_aunroll_2_reg_stall_out_bitsignaltemp;
    thebubble_out_stall_entry_aunroll_2_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 6,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_stall_entry_aunroll_2_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_stall_entry_aunroll_2_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_stall_entry_aunroll_2_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_stall_entry_aunroll_2_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_stall_entry_aunroll_1_reg(STALLFIFO,409)
    bubble_out_stall_entry_aunroll_1_reg_valid_in <= SE_stall_entry_aunroll_V0;
    bubble_out_stall_entry_aunroll_1_reg_stall_in <= SE_out_bubble_out_stall_entry_aunroll_1_backStall;
    bubble_out_stall_entry_aunroll_1_reg_valid_in_bitsignaltemp <= bubble_out_stall_entry_aunroll_1_reg_valid_in(0);
    bubble_out_stall_entry_aunroll_1_reg_stall_in_bitsignaltemp <= bubble_out_stall_entry_aunroll_1_reg_stall_in(0);
    bubble_out_stall_entry_aunroll_1_reg_valid_out(0) <= bubble_out_stall_entry_aunroll_1_reg_valid_out_bitsignaltemp;
    bubble_out_stall_entry_aunroll_1_reg_stall_out(0) <= bubble_out_stall_entry_aunroll_1_reg_stall_out_bitsignaltemp;
    thebubble_out_stall_entry_aunroll_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 7,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_stall_entry_aunroll_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_stall_entry_aunroll_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_stall_entry_aunroll_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_stall_entry_aunroll_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry_aunroll(STALLENABLE,281)
    SE_stall_entry_aunroll_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_stall_entry_aunroll_fromReg0 <= (others => '0');
            SE_stall_entry_aunroll_fromReg1 <= (others => '0');
            SE_stall_entry_aunroll_fromReg2 <= (others => '0');
            SE_stall_entry_aunroll_fromReg3 <= (others => '0');
            SE_stall_entry_aunroll_fromReg4 <= (others => '0');
            SE_stall_entry_aunroll_fromReg5 <= (others => '0');
            SE_stall_entry_aunroll_fromReg6 <= (others => '0');
            SE_stall_entry_aunroll_fromReg7 <= (others => '0');
            SE_stall_entry_aunroll_fromReg8 <= (others => '0');
            SE_stall_entry_aunroll_fromReg9 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_stall_entry_aunroll_fromReg0 <= SE_stall_entry_aunroll_toReg0;
            -- Succesor 1
            SE_stall_entry_aunroll_fromReg1 <= SE_stall_entry_aunroll_toReg1;
            -- Succesor 2
            SE_stall_entry_aunroll_fromReg2 <= SE_stall_entry_aunroll_toReg2;
            -- Succesor 3
            SE_stall_entry_aunroll_fromReg3 <= SE_stall_entry_aunroll_toReg3;
            -- Succesor 4
            SE_stall_entry_aunroll_fromReg4 <= SE_stall_entry_aunroll_toReg4;
            -- Succesor 5
            SE_stall_entry_aunroll_fromReg5 <= SE_stall_entry_aunroll_toReg5;
            -- Succesor 6
            SE_stall_entry_aunroll_fromReg6 <= SE_stall_entry_aunroll_toReg6;
            -- Succesor 7
            SE_stall_entry_aunroll_fromReg7 <= SE_stall_entry_aunroll_toReg7;
            -- Succesor 8
            SE_stall_entry_aunroll_fromReg8 <= SE_stall_entry_aunroll_toReg8;
            -- Succesor 9
            SE_stall_entry_aunroll_fromReg9 <= SE_stall_entry_aunroll_toReg9;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_stall_entry_aunroll_consumed0 <= (not (bubble_out_stall_entry_aunroll_1_reg_stall_out) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg0;
    SE_stall_entry_aunroll_consumed1 <= (not (bubble_out_stall_entry_aunroll_2_reg_stall_out) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg1;
    SE_stall_entry_aunroll_consumed2 <= (not (bubble_out_stall_entry_aunroll_3_reg_stall_out) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg2;
    SE_stall_entry_aunroll_consumed3 <= (not (bubble_out_stall_entry_aunroll_4_reg_stall_out) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg3;
    SE_stall_entry_aunroll_consumed4 <= (not (bubble_out_stall_entry_aunroll_5_reg_stall_out) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg4;
    SE_stall_entry_aunroll_consumed5 <= (not (SE_redist1_stall_entry_aunroll_o5_7_0_backStall) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg5;
    SE_stall_entry_aunroll_consumed6 <= (not (i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_out_o_stall) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg6;
    SE_stall_entry_aunroll_consumed7 <= (not (redist0_stall_entry_aunroll_o4_9_fifo_stall_out) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg7;
    SE_stall_entry_aunroll_consumed8 <= (not (redist5_stall_entry_aunroll_o24_8_fifo_stall_out) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg8;
    SE_stall_entry_aunroll_consumed9 <= (not (redist9_stall_entry_aunroll_o26_9_fifo_stall_out) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg9;
    -- Consuming
    SE_stall_entry_aunroll_StallValid <= SE_stall_entry_aunroll_backStall and SE_stall_entry_aunroll_wireValid;
    SE_stall_entry_aunroll_toReg0 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed0;
    SE_stall_entry_aunroll_toReg1 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed1;
    SE_stall_entry_aunroll_toReg2 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed2;
    SE_stall_entry_aunroll_toReg3 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed3;
    SE_stall_entry_aunroll_toReg4 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed4;
    SE_stall_entry_aunroll_toReg5 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed5;
    SE_stall_entry_aunroll_toReg6 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed6;
    SE_stall_entry_aunroll_toReg7 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed7;
    SE_stall_entry_aunroll_toReg8 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed8;
    SE_stall_entry_aunroll_toReg9 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed9;
    -- Backward Stall generation
    SE_stall_entry_aunroll_or0 <= SE_stall_entry_aunroll_consumed0;
    SE_stall_entry_aunroll_or1 <= SE_stall_entry_aunroll_consumed1 and SE_stall_entry_aunroll_or0;
    SE_stall_entry_aunroll_or2 <= SE_stall_entry_aunroll_consumed2 and SE_stall_entry_aunroll_or1;
    SE_stall_entry_aunroll_or3 <= SE_stall_entry_aunroll_consumed3 and SE_stall_entry_aunroll_or2;
    SE_stall_entry_aunroll_or4 <= SE_stall_entry_aunroll_consumed4 and SE_stall_entry_aunroll_or3;
    SE_stall_entry_aunroll_or5 <= SE_stall_entry_aunroll_consumed5 and SE_stall_entry_aunroll_or4;
    SE_stall_entry_aunroll_or6 <= SE_stall_entry_aunroll_consumed6 and SE_stall_entry_aunroll_or5;
    SE_stall_entry_aunroll_or7 <= SE_stall_entry_aunroll_consumed7 and SE_stall_entry_aunroll_or6;
    SE_stall_entry_aunroll_or8 <= SE_stall_entry_aunroll_consumed8 and SE_stall_entry_aunroll_or7;
    SE_stall_entry_aunroll_wireStall <= not (SE_stall_entry_aunroll_consumed9 and SE_stall_entry_aunroll_or8);
    SE_stall_entry_aunroll_backStall <= SE_stall_entry_aunroll_wireStall;
    -- Valid signal propagation
    SE_stall_entry_aunroll_V0 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg0);
    SE_stall_entry_aunroll_V1 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg1);
    SE_stall_entry_aunroll_V2 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg2);
    SE_stall_entry_aunroll_V3 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg3);
    SE_stall_entry_aunroll_V4 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg4);
    SE_stall_entry_aunroll_V5 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg5);
    SE_stall_entry_aunroll_V6 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg6);
    SE_stall_entry_aunroll_V7 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg7);
    SE_stall_entry_aunroll_V8 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg8);
    SE_stall_entry_aunroll_V9 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg9);
    -- Computing multiple Valid(s)
    SE_stall_entry_aunroll_wireValid <= in_valid_in;

    -- bubble_join_stall_entry_aunroll(BITJOIN,217)
    bubble_join_stall_entry_aunroll_q <= in_unnamed_conv2d1x16 & in_output_im_addr_1610 & in_output_im_addr_0106 & in_j_178 & in_i_0114 & in_c2_exit14_2 & in_c2_exit14_1 & in_c2_exe315 & in_c1_exit3312_5 & in_c1_exit3312_3 & in_c1_exe13413 & in_c0_exe13;

    -- bubble_select_stall_entry_aunroll(BITSELECT,218)
    bubble_select_stall_entry_aunroll_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(63 downto 0));
    bubble_select_stall_entry_aunroll_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(64 downto 64));
    bubble_select_stall_entry_aunroll_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(65 downto 65));
    bubble_select_stall_entry_aunroll_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(66 downto 66));
    bubble_select_stall_entry_aunroll_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(98 downto 67));
    bubble_select_stall_entry_aunroll_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(130 downto 99));
    bubble_select_stall_entry_aunroll_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(162 downto 131));
    bubble_select_stall_entry_aunroll_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(194 downto 163));
    bubble_select_stall_entry_aunroll_j <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(226 downto 195));
    bubble_select_stall_entry_aunroll_k <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(290 downto 227));
    bubble_select_stall_entry_aunroll_l <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(354 downto 291));
    bubble_select_stall_entry_aunroll_m <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(386 downto 355));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x(BLACKBOX,39)@0
    -- in in_i_stall@20000000
    -- out out_c0_exit43_0@7
    -- out out_c0_exit43_1@7
    -- out out_o_stall@20000000
    -- out out_o_valid@7
    thei_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x : i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1
    PORT MAP (
        in_c0_eni6_0 => GND_q,
        in_c0_eni6_1 => bubble_select_stall_entry_aunroll_d,
        in_c0_eni6_2 => bubble_select_stall_entry_aunroll_e,
        in_c0_eni6_3 => bubble_select_stall_entry_aunroll_h,
        in_c0_eni6_4 => bubble_select_stall_entry_aunroll_f,
        in_c0_eni6_5 => bubble_select_stall_entry_aunroll_g,
        in_c0_eni6_6 => bubble_select_stall_entry_aunroll_m,
        in_i_stall => SE_out_i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_backStall,
        in_i_valid => SE_stall_entry_aunroll_V6,
        in_input_channels => in_input_channels,
        out_c0_exit43_1 => i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_out_c0_exit43_1,
        out_o_stall => i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x(BITJOIN,193)
    bubble_join_i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_q <= i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_out_c0_exit43_1;

    -- bubble_select_i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x(BITSELECT,194)
    bubble_select_i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_q(31 downto 0));

    -- SE_out_i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x(STALLENABLE,245)
    -- Valid signal propagation
    SE_out_i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_V0 <= SE_out_i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_backStall <= i_store_unnamed_conv2d1x17_conv2d1x1_out_o_stall or not (SE_out_i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_and0 <= i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_out_o_valid;
    SE_out_i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_wireValid <= SE_redist1_stall_entry_aunroll_o5_7_6_V0 and SE_out_i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_and0;

    -- SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1(STALLENABLE,369)
    -- Valid signal propagation
    SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_V0 <= SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_backStall <= in_stall_in or not (SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and0 <= bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_reg_valid_out;
    SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and1 <= bubble_out_i_syncbuf_input_size_y_sync_buffer16_conv2d1x1_1_reg_valid_out and SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and0;
    SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and2 <= bubble_out_i_syncbuf_input_size_x_sync_buffer10_conv2d1x1_1_reg_V0 and SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and1;
    SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and3 <= redist9_stall_entry_aunroll_o26_9_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and2;
    SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and4 <= redist0_stall_entry_aunroll_o4_9_fifo_valid_out and SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and3;
    SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and5 <= SE_i_exitcond13_conv2d1x1_V0 and SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and4;
    SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and6 <= SE_i_cmp9_rm69_conv2d1x1_V0 and SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and5;
    SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and7 <= SE_i_cmp75_rm70_conv2d1x1_V0 and SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and6;
    SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and8 <= SE_redist6_stall_entry_aunroll_o24_9_0_V0 and SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and7;
    SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and9 <= SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_V0 and SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and8;
    SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and10 <= i_store_unnamed_conv2d1x17_conv2d1x1_out_o_valid and SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and9;
    SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and11 <= SE_redist13_i_unnamed_conv2d1x1103_q_2_0_V0 and SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and10;
    SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and12 <= SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_V0 and SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and11;
    SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and13 <= SE_i_i_011_lc_outerphi_conv2d1x1_V0 and SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and12;
    SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_wireValid <= SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_V0 and SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_and13;

    -- redist1_stall_entry_aunroll_o5_7_6(REG,156)
    redist1_stall_entry_aunroll_o5_7_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o5_7_6_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_6_backEN = "1") THEN
                redist1_stall_entry_aunroll_o5_7_6_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_aunroll_o5_7_6_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_stall_entry_aunroll_o25_7_6(REG,178)
    redist7_stall_entry_aunroll_o25_7_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_stall_entry_aunroll_o25_7_6_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o5_7_6_backEN = "1") THEN
                redist7_stall_entry_aunroll_o25_7_6_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_aunroll_o5_7_6_D2);
            END IF;
        END IF;
    END PROCESS;

    -- i_store_unnamed_conv2d1x17_conv2d1x1(BLACKBOX,66)@7
    -- in in_i_stall@20000000
    -- out out_lsu_unnamed_conv2d1x17_o_active@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@9
    -- out out_unnamed_conv2d1x17_avm_address@20000000
    -- out out_unnamed_conv2d1x17_avm_burstcount@20000000
    -- out out_unnamed_conv2d1x17_avm_byteenable@20000000
    -- out out_unnamed_conv2d1x17_avm_enable@20000000
    -- out out_unnamed_conv2d1x17_avm_read@20000000
    -- out out_unnamed_conv2d1x17_avm_write@20000000
    -- out out_unnamed_conv2d1x17_avm_writedata@20000000
    thei_store_unnamed_conv2d1x17_conv2d1x1 : i_store_unnamed_conv2d1x17_conv2d1x196
    PORT MAP (
        in_flush => in_flush,
        in_i_address => redist7_stall_entry_aunroll_o25_7_6_q,
        in_i_predicate => redist1_stall_entry_aunroll_o5_7_6_q,
        in_i_stall => SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_backStall,
        in_i_valid => SE_out_i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_V0,
        in_i_writedata => bubble_select_i_sfc_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x1_aunroll_x_b,
        in_unnamed_conv2d1x17_avm_readdata => in_unnamed_conv2d1x17_avm_readdata,
        in_unnamed_conv2d1x17_avm_readdatavalid => in_unnamed_conv2d1x17_avm_readdatavalid,
        in_unnamed_conv2d1x17_avm_waitrequest => in_unnamed_conv2d1x17_avm_waitrequest,
        in_unnamed_conv2d1x17_avm_writeack => in_unnamed_conv2d1x17_avm_writeack,
        out_lsu_unnamed_conv2d1x17_o_active => i_store_unnamed_conv2d1x17_conv2d1x1_out_lsu_unnamed_conv2d1x17_o_active,
        out_o_stall => i_store_unnamed_conv2d1x17_conv2d1x1_out_o_stall,
        out_o_valid => i_store_unnamed_conv2d1x17_conv2d1x1_out_o_valid,
        out_unnamed_conv2d1x17_avm_address => i_store_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_address,
        out_unnamed_conv2d1x17_avm_burstcount => i_store_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_burstcount,
        out_unnamed_conv2d1x17_avm_byteenable => i_store_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_byteenable,
        out_unnamed_conv2d1x17_avm_enable => i_store_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_enable,
        out_unnamed_conv2d1x17_avm_read => i_store_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_read,
        out_unnamed_conv2d1x17_avm_write => i_store_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_write,
        out_unnamed_conv2d1x17_avm_writedata => i_store_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,8)
    out_lsu_unnamed_conv2d1x17_o_active <= i_store_unnamed_conv2d1x17_conv2d1x1_out_lsu_unnamed_conv2d1x17_o_active;

    -- bubble_join_redist9_stall_entry_aunroll_o26_9_fifo(BITJOIN,232)
    bubble_join_redist9_stall_entry_aunroll_o26_9_fifo_q <= redist9_stall_entry_aunroll_o26_9_fifo_data_out;

    -- bubble_select_redist9_stall_entry_aunroll_o26_9_fifo(BITSELECT,233)
    bubble_select_redist9_stall_entry_aunroll_o26_9_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist9_stall_entry_aunroll_o26_9_fifo_q(31 downto 0));

    -- redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0(REG,187)
    redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_stall_entry_aunroll_o24_9_0(REG,171)
    redist6_stall_entry_aunroll_o24_9_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_stall_entry_aunroll_o24_9_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_stall_entry_aunroll_o24_9_0_backEN = "1") THEN
                redist6_stall_entry_aunroll_o24_9_0_q <= STD_LOGIC_VECTOR(SR_SE_redist6_stall_entry_aunroll_o24_9_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_syncbuf_input_size_y_sync_buffer20_conv2d1x1(BITJOIN,213)
    bubble_join_i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_q <= i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_out_buffer_out;

    -- bubble_select_i_syncbuf_input_size_y_sync_buffer20_conv2d1x1(BITSELECT,214)
    bubble_select_i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_q(31 downto 0));

    -- i_cmp75_rm70_conv2d1x1(COMPARE,54)@8 + 1
    i_cmp75_rm70_conv2d1x1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_0gr_q(31)) & c_i32_0gr_q));
    i_cmp75_rm70_conv2d1x1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => bubble_select_i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_b(31)) & bubble_select_i_syncbuf_input_size_y_sync_buffer20_conv2d1x1_b));
    i_cmp75_rm70_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp75_rm70_conv2d1x1_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp75_rm70_conv2d1x1_backEN = "1") THEN
                i_cmp75_rm70_conv2d1x1_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp75_rm70_conv2d1x1_a) - SIGNED(i_cmp75_rm70_conv2d1x1_b));
            END IF;
        END IF;
    END PROCESS;
    i_cmp75_rm70_conv2d1x1_c(0) <= i_cmp75_rm70_conv2d1x1_o(33);

    -- bubble_join_i_syncbuf_input_size_x_sync_buffer13_conv2d1x1(BITJOIN,201)
    bubble_join_i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_q <= i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_out_buffer_out;

    -- bubble_select_i_syncbuf_input_size_x_sync_buffer13_conv2d1x1(BITSELECT,202)
    bubble_select_i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_q(31 downto 0));

    -- i_cmp9_rm69_conv2d1x1(COMPARE,55)@8 + 1
    i_cmp9_rm69_conv2d1x1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_0gr_q(31)) & c_i32_0gr_q));
    i_cmp9_rm69_conv2d1x1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => bubble_select_i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_b(31)) & bubble_select_i_syncbuf_input_size_x_sync_buffer13_conv2d1x1_b));
    i_cmp9_rm69_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp9_rm69_conv2d1x1_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_cmp9_rm69_conv2d1x1_backEN = "1") THEN
                i_cmp9_rm69_conv2d1x1_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp9_rm69_conv2d1x1_a) - SIGNED(i_cmp9_rm69_conv2d1x1_b));
            END IF;
        END IF;
    END PROCESS;
    i_cmp9_rm69_conv2d1x1_c(0) <= i_cmp9_rm69_conv2d1x1_o(33);

    -- i_unnamed_conv2d1x1106(LOGICAL,78)@9
    i_unnamed_conv2d1x1106_q <= i_cmp9_rm69_conv2d1x1_c and i_cmp75_rm70_conv2d1x1_c;

    -- i_select34_conv2d1x1(MUX,65)@9
    i_select34_conv2d1x1_s <= i_unnamed_conv2d1x1106_q;
    i_select34_conv2d1x1_combproc: PROCESS (i_select34_conv2d1x1_s, redist6_stall_entry_aunroll_o24_9_0_q, redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_q)
    BEGIN
        CASE (i_select34_conv2d1x1_s) IS
            WHEN "0" => i_select34_conv2d1x1_q <= redist6_stall_entry_aunroll_o24_9_0_q;
            WHEN "1" => i_select34_conv2d1x1_q <= redist16_i_scevgep_conv2d1x1_conv2d1x1109_dupName_0_trunc_sel_x_b_1_0_q;
            WHEN OTHERS => i_select34_conv2d1x1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0(REG,188)
    redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_backEN = "1") THEN
                redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist13_i_unnamed_conv2d1x1103_q_2_0(REG,184)
    redist13_i_unnamed_conv2d1x1103_q_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_i_unnamed_conv2d1x1103_q_2_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist13_i_unnamed_conv2d1x1103_q_2_0_backEN = "1") THEN
                redist13_i_unnamed_conv2d1x1103_q_2_0_q <= STD_LOGIC_VECTOR(redist12_i_unnamed_conv2d1x1103_q_1_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- i_output_im_addr_16_lc_innerphi_conv2d1x1(MUX,64)@9
    i_output_im_addr_16_lc_innerphi_conv2d1x1_s <= redist13_i_unnamed_conv2d1x1103_q_2_0_q;
    i_output_im_addr_16_lc_innerphi_conv2d1x1_combproc: PROCESS (i_output_im_addr_16_lc_innerphi_conv2d1x1_s, redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_q, i_select34_conv2d1x1_q)
    BEGIN
        CASE (i_output_im_addr_16_lc_innerphi_conv2d1x1_s) IS
            WHEN "0" => i_output_im_addr_16_lc_innerphi_conv2d1x1_q <= redist17_i_incdec_ptr_conv2d1x1_conv2d1x185_trunc_sel_x_b_1_0_q;
            WHEN "1" => i_output_im_addr_16_lc_innerphi_conv2d1x1_q <= i_select34_conv2d1x1_q;
            WHEN OTHERS => i_output_im_addr_16_lc_innerphi_conv2d1x1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_output_im_addr_010_lc_outerphi_conv2d1x1(MUX,63)@9
    i_output_im_addr_010_lc_outerphi_conv2d1x1_s <= redist13_i_unnamed_conv2d1x1103_q_2_0_q;
    i_output_im_addr_010_lc_outerphi_conv2d1x1_combproc: PROCESS (i_output_im_addr_010_lc_outerphi_conv2d1x1_s, redist6_stall_entry_aunroll_o24_9_0_q, i_select34_conv2d1x1_q)
    BEGIN
        CASE (i_output_im_addr_010_lc_outerphi_conv2d1x1_s) IS
            WHEN "0" => i_output_im_addr_010_lc_outerphi_conv2d1x1_q <= redist6_stall_entry_aunroll_o24_9_0_q;
            WHEN "1" => i_output_im_addr_010_lc_outerphi_conv2d1x1_q <= i_select34_conv2d1x1_q;
            WHEN OTHERS => i_output_im_addr_010_lc_outerphi_conv2d1x1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_j_17_lc_innerphi_conv2d1x1(MUX,62)@7 + 1
    i_j_17_lc_innerphi_conv2d1x1_s <= SR_SE_i_j_17_lc_innerphi_conv2d1x1_D0;
    i_j_17_lc_innerphi_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_j_17_lc_innerphi_conv2d1x1_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_j_17_lc_innerphi_conv2d1x1_backEN = "1") THEN
                CASE (i_j_17_lc_innerphi_conv2d1x1_s) IS
                    WHEN "0" => i_j_17_lc_innerphi_conv2d1x1_q <= SR_SE_i_j_17_lc_innerphi_conv2d1x1_D1;
                    WHEN "1" => i_j_17_lc_innerphi_conv2d1x1_q <= c_i32_0gr_q;
                    WHEN OTHERS => i_j_17_lc_innerphi_conv2d1x1_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0(REG,185)
    redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_backEN = "1") THEN
                redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_q <= STD_LOGIC_VECTOR(i_j_17_lc_innerphi_conv2d1x1_q);
            END IF;
        END IF;
    END PROCESS;

    -- i_i_011_lc_outerphi_conv2d1x1(MUX,59)@8 + 1
    i_i_011_lc_outerphi_conv2d1x1_s <= SR_SE_i_i_011_lc_outerphi_conv2d1x1_D0;
    i_i_011_lc_outerphi_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_i_011_lc_outerphi_conv2d1x1_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_i_011_lc_outerphi_conv2d1x1_backEN = "1") THEN
                CASE (i_i_011_lc_outerphi_conv2d1x1_s) IS
                    WHEN "0" => i_i_011_lc_outerphi_conv2d1x1_q <= SR_SE_i_i_011_lc_outerphi_conv2d1x1_D1;
                    WHEN "1" => i_i_011_lc_outerphi_conv2d1x1_q <= SR_SE_i_i_011_lc_outerphi_conv2d1x1_D2;
                    WHEN OTHERS => i_i_011_lc_outerphi_conv2d1x1_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- i_unnamed_conv2d1x1105(LOGICAL,77)@9
    i_unnamed_conv2d1x1105_q <= i_cmp9_rm69_conv2d1x1_c xor VCC_q;

    -- i_exitcond13_conv2d1x1(LOGICAL,57)@8 + 1
    i_exitcond13_conv2d1x1_qi <= "1" WHEN SR_SE_i_exitcond13_conv2d1x1_D0 = SR_SE_i_exitcond13_conv2d1x1_D1 ELSE "0";
    i_exitcond13_conv2d1x1_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_exitcond13_conv2d1x1_qi, xout => i_exitcond13_conv2d1x1_q, ena => SE_i_exitcond13_conv2d1x1_backEN(0), clk => clock, aclr => resetn );

    -- i_unnamed_conv2d1x1108(LOGICAL,83)@9
    i_unnamed_conv2d1x1108_q <= i_exitcond13_conv2d1x1_q or i_unnamed_conv2d1x1105_q;

    -- i_for_end35_loopexit_loopexit_lc_cond_conv2d1x1(LOGICAL,58)@9
    i_for_end35_loopexit_loopexit_lc_cond_conv2d1x1_q <= redist13_i_unnamed_conv2d1x1103_q_2_0_q and i_unnamed_conv2d1x1108_q;

    -- bubble_join_redist0_stall_entry_aunroll_o4_9_fifo(BITJOIN,226)
    bubble_join_redist0_stall_entry_aunroll_o4_9_fifo_q <= redist0_stall_entry_aunroll_o4_9_fifo_data_out;

    -- bubble_select_redist0_stall_entry_aunroll_o4_9_fifo(BITSELECT,227)
    bubble_select_redist0_stall_entry_aunroll_o4_9_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist0_stall_entry_aunroll_o4_9_fifo_q(63 downto 0));

    -- dupName_0_sync_out_x(GPOUT,12)@9
    out_c0_exe13 <= bubble_select_redist0_stall_entry_aunroll_o4_9_fifo_b;
    out_for_end35_loopexit_loopexit_LC_COND <= i_for_end35_loopexit_loopexit_lc_cond_conv2d1x1_q;
    out_i_011_LC_OuterPHI <= i_i_011_lc_outerphi_conv2d1x1_q;
    out_j_17_LC_InnerPHI <= redist14_i_j_17_lc_innerphi_conv2d1x1_q_2_0_q;
    out_output_im_addr_010_LC_OuterPHI <= i_output_im_addr_010_lc_outerphi_conv2d1x1_q;
    out_output_im_addr_16_LC_InnerPHI <= i_output_im_addr_16_lc_innerphi_conv2d1x1_q;
    out_unnamed_conv2d1x16 <= bubble_select_redist9_stall_entry_aunroll_o26_9_fifo_b;
    out_valid_out <= SE_out_bubble_out_i_syncbuf_input_size_y_sync_buffer19_conv2d1x1_1_V0;

    -- ext_sig_sync_out(GPOUT,53)
    out_unnamed_conv2d1x17_avm_address <= i_store_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_address;
    out_unnamed_conv2d1x17_avm_enable <= i_store_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_enable;
    out_unnamed_conv2d1x17_avm_read <= i_store_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_read;
    out_unnamed_conv2d1x17_avm_write <= i_store_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_write;
    out_unnamed_conv2d1x17_avm_writedata <= i_store_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_writedata;
    out_unnamed_conv2d1x17_avm_byteenable <= i_store_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_byteenable;
    out_unnamed_conv2d1x17_avm_burstcount <= i_store_unnamed_conv2d1x17_conv2d1x1_out_unnamed_conv2d1x17_avm_burstcount;

    -- sync_out(GPOUT,99)@0
    out_stall_out <= SE_stall_entry_aunroll_backStall;

END normal;
