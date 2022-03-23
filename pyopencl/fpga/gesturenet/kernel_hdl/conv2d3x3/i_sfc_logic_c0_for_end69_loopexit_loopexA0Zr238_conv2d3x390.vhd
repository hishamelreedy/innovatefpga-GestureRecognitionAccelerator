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

-- VHDL created from i_sfc_logic_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x390
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

entity i_sfc_logic_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x390 is
    port (
        in_c0_eni7237_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni7237_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni7237_2 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni7237_3 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni7237_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni7237_5 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni7237_6 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni7237_7 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_size : in std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi7252_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi7252_1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c0_exi7252_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi7252_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi7252_4 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi7252_5 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi7252_6 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi7252_7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x390;

architecture normal of i_sfc_logic_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x390 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_syncbuf_input_channels_sync_buffer194_conv2d3x395 is
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


    component i_syncbuf_output_size_sync_buffer203_conv2d3x3100 is
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


    component i_syncbuf_output_size_sync_buffer204_conv2d3x3110 is
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


    component i_syncbuf_output_size_sync_buffer205_conv2d3x392 is
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


    component i_syncbuf_output_size_sync_buffer206_conv2d3x3104 is
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
    signal bgTrunc_i_inc76_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_inc79_conv2d3x3_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_unnamed_conv2d3x3106_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_unnamed_conv2d3x3108_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_0_c_i32_1gr_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_incdec_ptr_conv2d3x3_conv2d3x399_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_incdec_ptr_conv2d3x3_conv2d3x399_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_incdec_ptr_conv2d3x3_conv2d3x399_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_incdec_ptr_conv2d3x3_conv2d3x399_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_incdec_ptr_conv2d3x3_conv2d3x399_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_incdec_ptr_conv2d3x3_conv2d3x399_c_i64_4gr_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_multconst_x_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_unnamed_conv2d3x3107_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal c_float_0_000000e_00_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i64_1gr_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_cmp138_rm63_conv2d3x3_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp138_rm63_conv2d3x3_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp138_rm63_conv2d3x3_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp138_rm63_conv2d3x3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp21_phi_decision39_xor_rm_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp21_phi_decision39_xor_rm_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp21_rm62_conv2d3x3_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp21_rm62_conv2d3x3_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp21_rm62_conv2d3x3_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp21_rm62_conv2d3x3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cond_conv2d3x3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cond_conv2d3x3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_exitcond28_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond28_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond29_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond29_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_for_end80_loopexit_loopexit_lc_cond_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_i_023_lc_outerphi_conv2d3x3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_i_023_lc_outerphi_conv2d3x3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_inc76_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc76_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc76_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc76_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc79_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc79_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc79_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc79_conv2d3x3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_j_115_lc_innerphi_conv2d3x3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_j_115_lc_innerphi_conv2d3x3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_output_im_addr_022_lc_outerphi_conv2d3x3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_output_im_addr_022_lc_outerphi_conv2d3x3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_output_im_addr_114_lc_innerphi_conv2d3x3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_output_im_addr_114_lc_innerphi_conv2d3x3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_select35_conv2d3x3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select35_conv2d3x3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_channels_sync_buffer194_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_output_size_sync_buffer203_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_output_size_sync_buffer204_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_output_size_sync_buffer205_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_output_size_sync_buffer206_conv2d3x3_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_conv2d3x3103_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_conv2d3x3106_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_unnamed_conv2d3x3106_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_unnamed_conv2d3x3106_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_unnamed_conv2d3x3106_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_unnamed_conv2d3x3107_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_unnamed_conv2d3x3107_vt_select_31_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_conv2d3x3108_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_unnamed_conv2d3x3108_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_unnamed_conv2d3x3108_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_unnamed_conv2d3x3108_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_unnamed_conv2d3x3108_vt_const_63_q : STD_LOGIC_VECTOR (30 downto 0);
    signal i_unnamed_conv2d3x3108_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_unnamed_conv2d3x3108_vt_select_32_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_unnamed_conv2d3x3113_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_conv2d3x398_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid79_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid80_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid81_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal exp_x_uid82_i_cmp71_conv2d3x3_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid83_i_cmp71_conv2d3x3_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expXIsZero_uid84_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid85_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid86_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid87_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid88_i_cmp71_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid88_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid90_i_cmp71_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid90_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_y_uid99_i_cmp71_conv2d3x3_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_y_uid100_i_cmp71_conv2d3x3_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expXIsZero_uid101_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid102_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid103_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid104_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid105_i_cmp71_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid105_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid107_i_cmp71_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid107_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid113_i_cmp71_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid113_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracX_uid118_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid120_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (30 downto 0);
    signal efxGTefy_uid122_i_cmp71_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid122_i_cmp71_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid122_i_cmp71_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid122_i_cmp71_conv2d3x3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal efxLTefy_uid123_i_cmp71_conv2d3x3_a : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid123_i_cmp71_conv2d3x3_b : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid123_i_cmp71_conv2d3x3_o : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid123_i_cmp71_conv2d3x3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal signX_uid127_i_cmp71_conv2d3x3_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid128_i_cmp71_conv2d3x3_b : STD_LOGIC_VECTOR (0 downto 0);
    signal two_uid129_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (1 downto 0);
    signal concSXSY_uid130_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sxLTsy_uid131_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xorSigns_uid132_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsy_uid133_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid134_i_cmp71_conv2d3x3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid134_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcYZ_uid135_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcXZ_uid136_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneNonZero_uid137_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rc2_uid138_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsyExpFracCompMux_uid139_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid140_i_cmp71_conv2d3x3_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid140_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid141_i_cmp71_conv2d3x3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid141_i_cmp71_conv2d3x3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_x_join_13_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_x_align_14_q : STD_LOGIC_VECTOR (38 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_x_align_14_qint : STD_LOGIC_VECTOR (38 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_x_join_16_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (67 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (67 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (67 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (67 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scevgep_conv2d3x3_conv2d3x3109_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_i_unnamed_conv2d3x3108_vt_select_32_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist1_i_unnamed_conv2d3x3103_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_select35_conv2d3x3_q_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_i_select35_conv2d3x3_q_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_i_cmp21_phi_decision39_xor_rm_conv2d3x3_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_cmp21_phi_decision39_xor_rm_conv2d3x3_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_sync_in_aunroll_x_in_c0_eni7237_1_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_sync_in_aunroll_x_in_c0_eni7237_2_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_sync_in_aunroll_x_in_c0_eni7237_3_3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist9_sync_in_aunroll_x_in_c0_eni7237_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_sync_in_aunroll_x_in_c0_eni7237_5_3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist11_sync_in_aunroll_x_in_c0_eni7237_5_4_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist12_sync_in_aunroll_x_in_c0_eni7237_6_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_sync_in_aunroll_x_in_c0_eni7237_6_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_sync_in_aunroll_x_in_c0_eni7237_7_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_sync_in_aunroll_x_in_i_valid_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_sync_in_aunroll_x_in_i_valid_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_sync_in_aunroll_x_in_i_valid_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_i_scevgep_conv2d3x3_conv2d3x3109_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist19_i_scevgep_conv2d3x3_conv2d3x3109_dupName_0_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist20_i_incdec_ptr_conv2d3x3_conv2d3x399_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist21_bgTrunc_i_unnamed_conv2d3x3106_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist22_bgTrunc_i_inc79_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_bgTrunc_i_inc76_conv2d3x3_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_bgTrunc_i_inc76_conv2d3x3_sel_x_b_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_sync_in_aunroll_x_in_c0_eni7237_3_3_outputreg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist10_sync_in_aunroll_x_in_c0_eni7237_5_3_outputreg_q : STD_LOGIC_VECTOR (63 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist15_sync_in_aunroll_x_in_i_valid_2(DELAY,185)
    redist15_sync_in_aunroll_x_in_i_valid_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist15_sync_in_aunroll_x_in_i_valid_2_q, clk => clock, aclr => resetn );

    -- redist16_sync_in_aunroll_x_in_i_valid_3(DELAY,186)
    redist16_sync_in_aunroll_x_in_i_valid_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist15_sync_in_aunroll_x_in_i_valid_2_q, xout => redist16_sync_in_aunroll_x_in_i_valid_3_q, clk => clock, aclr => resetn );

    -- redist17_sync_in_aunroll_x_in_i_valid_4(DELAY,187)
    redist17_sync_in_aunroll_x_in_i_valid_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist16_sync_in_aunroll_x_in_i_valid_3_q, xout => redist17_sync_in_aunroll_x_in_i_valid_4_q, clk => clock, aclr => resetn );

    -- redist14_sync_in_aunroll_x_in_c0_eni7237_7_4(DELAY,184)
    redist14_sync_in_aunroll_x_in_c0_eni7237_7_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni7237_7, xout => redist14_sync_in_aunroll_x_in_c0_eni7237_7_4_q, clk => clock, aclr => resetn );

    -- i_syncbuf_output_size_sync_buffer204_conv2d3x3(BLACKBOX,55)@0
    -- in in_i_dependence@3
    -- in in_valid_in@3
    -- out out_buffer_out@3
    -- out out_valid_out@3
    thei_syncbuf_output_size_sync_buffer204_conv2d3x3 : i_syncbuf_output_size_sync_buffer204_conv2d3x3110
    PORT MAP (
        in_buffer_in => in_output_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist16_sync_in_aunroll_x_in_i_valid_3_q,
        out_buffer_out => i_syncbuf_output_size_sync_buffer204_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_1gr(CONSTANT,36)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- redist12_sync_in_aunroll_x_in_c0_eni7237_6_2(DELAY,182)
    redist12_sync_in_aunroll_x_in_c0_eni7237_6_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni7237_6, xout => redist12_sync_in_aunroll_x_in_c0_eni7237_6_2_q, clk => clock, aclr => resetn );

    -- i_inc79_conv2d3x3(ADD,48)@2
    i_inc79_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & redist12_sync_in_aunroll_x_in_c0_eni7237_6_2_q);
    i_inc79_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc79_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc79_conv2d3x3_a) + UNSIGNED(i_inc79_conv2d3x3_b));
    i_inc79_conv2d3x3_q <= i_inc79_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_inc79_conv2d3x3_sel_x(BITSELECT,3)@2
    bgTrunc_i_inc79_conv2d3x3_sel_x_b <= i_inc79_conv2d3x3_q(31 downto 0);

    -- redist22_bgTrunc_i_inc79_conv2d3x3_sel_x_b_1(DELAY,192)
    redist22_bgTrunc_i_inc79_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_inc79_conv2d3x3_sel_x_b, xout => redist22_bgTrunc_i_inc79_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_exitcond29_conv2d3x3(LOGICAL,44)@3 + 1
    i_exitcond29_conv2d3x3_qi <= "1" WHEN redist22_bgTrunc_i_inc79_conv2d3x3_sel_x_b_1_q = i_syncbuf_output_size_sync_buffer204_conv2d3x3_out_buffer_out ELSE "0";
    i_exitcond29_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_exitcond29_conv2d3x3_qi, xout => i_exitcond29_conv2d3x3_q, clk => clock, aclr => resetn );

    -- i_unnamed_conv2d3x3113(LOGICAL,68)@4
    i_unnamed_conv2d3x3113_q <= i_exitcond29_conv2d3x3_q or redist14_sync_in_aunroll_x_in_c0_eni7237_7_4_q;

    -- i_syncbuf_output_size_sync_buffer205_conv2d3x3(BLACKBOX,56)@0
    thei_syncbuf_output_size_sync_buffer205_conv2d3x3 : i_syncbuf_output_size_sync_buffer205_conv2d3x392
    PORT MAP (
        in_buffer_in => in_output_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_output_size_sync_buffer205_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_0gr(CONSTANT,35)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- i_cmp21_rm62_conv2d3x3(COMPARE,40)@0 + 1
    i_cmp21_rm62_conv2d3x3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_0gr_q(31)) & c_i32_0gr_q));
    i_cmp21_rm62_conv2d3x3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_output_size_sync_buffer205_conv2d3x3_out_buffer_out(31)) & i_syncbuf_output_size_sync_buffer205_conv2d3x3_out_buffer_out));
    i_cmp21_rm62_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp21_rm62_conv2d3x3_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp21_rm62_conv2d3x3_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp21_rm62_conv2d3x3_a) - SIGNED(i_cmp21_rm62_conv2d3x3_b));
        END IF;
    END PROCESS;
    i_cmp21_rm62_conv2d3x3_c(0) <= i_cmp21_rm62_conv2d3x3_o(33);

    -- i_cmp21_phi_decision39_xor_rm_conv2d3x3(LOGICAL,39)@1 + 1
    i_cmp21_phi_decision39_xor_rm_conv2d3x3_qi <= i_cmp21_rm62_conv2d3x3_c xor VCC_q;
    i_cmp21_phi_decision39_xor_rm_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp21_phi_decision39_xor_rm_conv2d3x3_qi, xout => i_cmp21_phi_decision39_xor_rm_conv2d3x3_q, clk => clock, aclr => resetn );

    -- redist4_i_cmp21_phi_decision39_xor_rm_conv2d3x3_q_2(DELAY,174)
    redist4_i_cmp21_phi_decision39_xor_rm_conv2d3x3_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp21_phi_decision39_xor_rm_conv2d3x3_q, xout => redist4_i_cmp21_phi_decision39_xor_rm_conv2d3x3_q_2_q, clk => clock, aclr => resetn );

    -- i_syncbuf_output_size_sync_buffer203_conv2d3x3(BLACKBOX,54)@0
    -- in in_i_dependence@2
    -- in in_valid_in@2
    -- out out_buffer_out@2
    -- out out_valid_out@2
    thei_syncbuf_output_size_sync_buffer203_conv2d3x3 : i_syncbuf_output_size_sync_buffer203_conv2d3x3100
    PORT MAP (
        in_buffer_in => in_output_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist15_sync_in_aunroll_x_in_i_valid_2_q,
        out_buffer_out => i_syncbuf_output_size_sync_buffer203_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- redist9_sync_in_aunroll_x_in_c0_eni7237_4_1(DELAY,179)
    redist9_sync_in_aunroll_x_in_c0_eni7237_4_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni7237_4, xout => redist9_sync_in_aunroll_x_in_c0_eni7237_4_1_q, clk => clock, aclr => resetn );

    -- i_inc76_conv2d3x3(ADD,47)@1
    i_inc76_conv2d3x3_a <= STD_LOGIC_VECTOR("0" & redist9_sync_in_aunroll_x_in_c0_eni7237_4_1_q);
    i_inc76_conv2d3x3_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc76_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc76_conv2d3x3_a) + UNSIGNED(i_inc76_conv2d3x3_b));
    i_inc76_conv2d3x3_q <= i_inc76_conv2d3x3_o(32 downto 0);

    -- bgTrunc_i_inc76_conv2d3x3_sel_x(BITSELECT,2)@1
    bgTrunc_i_inc76_conv2d3x3_sel_x_b <= i_inc76_conv2d3x3_q(31 downto 0);

    -- redist23_bgTrunc_i_inc76_conv2d3x3_sel_x_b_1(DELAY,193)
    redist23_bgTrunc_i_inc76_conv2d3x3_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_inc76_conv2d3x3_sel_x_b, xout => redist23_bgTrunc_i_inc76_conv2d3x3_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_exitcond28_conv2d3x3(LOGICAL,43)@2 + 1
    i_exitcond28_conv2d3x3_qi <= "1" WHEN redist23_bgTrunc_i_inc76_conv2d3x3_sel_x_b_1_q = i_syncbuf_output_size_sync_buffer203_conv2d3x3_out_buffer_out ELSE "0";
    i_exitcond28_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_exitcond28_conv2d3x3_qi, xout => i_exitcond28_conv2d3x3_q, clk => clock, aclr => resetn );

    -- i_unnamed_conv2d3x3103(LOGICAL,58)@3
    i_unnamed_conv2d3x3103_q <= i_exitcond28_conv2d3x3_q or redist4_i_cmp21_phi_decision39_xor_rm_conv2d3x3_q_2_q;

    -- redist1_i_unnamed_conv2d3x3103_q_1(DELAY,171)
    redist1_i_unnamed_conv2d3x3103_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_conv2d3x3103_q, xout => redist1_i_unnamed_conv2d3x3103_q_1_q, clk => clock, aclr => resetn );

    -- i_for_end80_loopexit_loopexit_lc_cond_conv2d3x3(LOGICAL,45)@4
    i_for_end80_loopexit_loopexit_lc_cond_conv2d3x3_q <= redist1_i_unnamed_conv2d3x3103_q_1_q and i_unnamed_conv2d3x3113_q;

    -- i_scevgep_conv2d3x3_conv2d3x3109_mult_multconst_x(CONSTANT,19)
    i_scevgep_conv2d3x3_conv2d3x3109_mult_multconst_x_q <= "0000000000000000000000000000000000000000000000000000000000000";

    -- i_unnamed_conv2d3x3108_vt_const_63(CONSTANT,65)
    i_unnamed_conv2d3x3108_vt_const_63_q <= "0000000000000000000000000000000";

    -- c_i64_1gr(CONSTANT,37)
    c_i64_1gr_q <= "0000000000000000000000000000000000000000000000000000000000000001";

    -- dupName_0_c_i32_1gr_x(CONSTANT,7)
    dupName_0_c_i32_1gr_x_q <= "11111111111111111111111111111111";

    -- i_syncbuf_output_size_sync_buffer206_conv2d3x3(BLACKBOX,57)@0
    thei_syncbuf_output_size_sync_buffer206_conv2d3x3 : i_syncbuf_output_size_sync_buffer206_conv2d3x3104
    PORT MAP (
        in_buffer_in => in_output_size,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_output_size_sync_buffer206_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_unnamed_conv2d3x3106(ADD,59)@0
    i_unnamed_conv2d3x3106_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_output_size_sync_buffer206_conv2d3x3_out_buffer_out);
    i_unnamed_conv2d3x3106_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_1gr_x_q);
    i_unnamed_conv2d3x3106_o <= STD_LOGIC_VECTOR(UNSIGNED(i_unnamed_conv2d3x3106_a) + UNSIGNED(i_unnamed_conv2d3x3106_b));
    i_unnamed_conv2d3x3106_q <= i_unnamed_conv2d3x3106_o(32 downto 0);

    -- bgTrunc_i_unnamed_conv2d3x3106_sel_x(BITSELECT,4)@0
    bgTrunc_i_unnamed_conv2d3x3106_sel_x_b <= i_unnamed_conv2d3x3106_q(31 downto 0);

    -- redist21_bgTrunc_i_unnamed_conv2d3x3106_sel_x_b_1(DELAY,191)
    redist21_bgTrunc_i_unnamed_conv2d3x3106_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_unnamed_conv2d3x3106_sel_x_b, xout => redist21_bgTrunc_i_unnamed_conv2d3x3106_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_unnamed_conv2d3x3107_sel_x(BITSELECT,25)@1
    i_unnamed_conv2d3x3107_sel_x_b <= std_logic_vector(resize(unsigned(redist21_bgTrunc_i_unnamed_conv2d3x3106_sel_x_b_1_q(31 downto 0)), 64));

    -- i_unnamed_conv2d3x3107_vt_select_31(BITSELECT,63)@1
    i_unnamed_conv2d3x3107_vt_select_31_b <= i_unnamed_conv2d3x3107_sel_x_b(31 downto 0);

    -- i_unnamed_conv2d3x3107_vt_join(BITJOIN,62)@1
    i_unnamed_conv2d3x3107_vt_join_q <= c_i32_0gr_q & i_unnamed_conv2d3x3107_vt_select_31_b;

    -- i_unnamed_conv2d3x3108(ADD,64)@1
    i_unnamed_conv2d3x3108_a <= STD_LOGIC_VECTOR("0" & i_unnamed_conv2d3x3107_vt_join_q);
    i_unnamed_conv2d3x3108_b <= STD_LOGIC_VECTOR("0" & c_i64_1gr_q);
    i_unnamed_conv2d3x3108_o <= STD_LOGIC_VECTOR(UNSIGNED(i_unnamed_conv2d3x3108_a) + UNSIGNED(i_unnamed_conv2d3x3108_b));
    i_unnamed_conv2d3x3108_q <= i_unnamed_conv2d3x3108_o(64 downto 0);

    -- bgTrunc_i_unnamed_conv2d3x3108_sel_x(BITSELECT,5)@1
    bgTrunc_i_unnamed_conv2d3x3108_sel_x_b <= i_unnamed_conv2d3x3108_q(63 downto 0);

    -- i_unnamed_conv2d3x3108_vt_select_32(BITSELECT,67)@1
    i_unnamed_conv2d3x3108_vt_select_32_b <= bgTrunc_i_unnamed_conv2d3x3108_sel_x_b(32 downto 0);

    -- redist0_i_unnamed_conv2d3x3108_vt_select_32_b_1(DELAY,170)
    redist0_i_unnamed_conv2d3x3108_vt_select_32_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_conv2d3x3108_vt_select_32_b, xout => redist0_i_unnamed_conv2d3x3108_vt_select_32_b_1_q, clk => clock, aclr => resetn );

    -- i_unnamed_conv2d3x3108_vt_join(BITJOIN,66)@2
    i_unnamed_conv2d3x3108_vt_join_q <= i_unnamed_conv2d3x3108_vt_const_63_q & redist0_i_unnamed_conv2d3x3108_vt_select_32_b_1_q;

    -- i_scevgep_conv2d3x3_conv2d3x3109_mult_x_bs1_merged_bit_select(BITSELECT,169)@2
    i_scevgep_conv2d3x3_conv2d3x3109_mult_x_bs1_merged_bit_select_b <= i_unnamed_conv2d3x3108_vt_join_q(17 downto 0);
    i_scevgep_conv2d3x3_conv2d3x3109_mult_x_bs1_merged_bit_select_c <= i_unnamed_conv2d3x3108_vt_join_q(63 downto 54);
    i_scevgep_conv2d3x3_conv2d3x3109_mult_x_bs1_merged_bit_select_d <= i_unnamed_conv2d3x3108_vt_join_q(35 downto 18);
    i_scevgep_conv2d3x3_conv2d3x3109_mult_x_bs1_merged_bit_select_e <= i_unnamed_conv2d3x3108_vt_join_q(53 downto 36);

    -- i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im3_shift0(BITSHIFT,166)@2
    i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im3_shift0_qint <= i_scevgep_conv2d3x3_conv2d3x3109_mult_x_bs1_merged_bit_select_c & "00";
    i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im3_shift0_q <= i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im3_shift0_qint(11 downto 0);

    -- i_scevgep_conv2d3x3_conv2d3x3109_mult_x_align_15(BITSHIFT,157)@2
    i_scevgep_conv2d3x3_conv2d3x3109_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im3_shift0_q) & "000000000000000";
    i_scevgep_conv2d3x3_conv2d3x3109_mult_x_align_15_q <= i_scevgep_conv2d3x3_conv2d3x3109_mult_x_align_15_qint(27 downto 0);

    -- i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im6_shift0(BITSHIFT,167)@2
    i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im6_shift0_qint <= i_scevgep_conv2d3x3_conv2d3x3109_mult_x_bs1_merged_bit_select_d & "00";
    i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im6_shift0_q <= i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im6_shift0_qint(19 downto 0);

    -- i_scevgep_conv2d3x3_conv2d3x3109_mult_x_align_14(BITSHIFT,156)@2
    i_scevgep_conv2d3x3_conv2d3x3109_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im6_shift0_q) & "000000000000000000";
    i_scevgep_conv2d3x3_conv2d3x3109_mult_x_align_14_q <= i_scevgep_conv2d3x3_conv2d3x3109_mult_x_align_14_qint(38 downto 0);

    -- i_scevgep_conv2d3x3_conv2d3x3109_mult_x_join_16(BITJOIN,158)@2
    i_scevgep_conv2d3x3_conv2d3x3109_mult_x_join_16_q <= i_scevgep_conv2d3x3_conv2d3x3109_mult_x_align_15_q & i_scevgep_conv2d3x3_conv2d3x3109_mult_x_align_14_q;

    -- i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im9_shift0(BITSHIFT,168)@2
    i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im9_shift0_qint <= i_scevgep_conv2d3x3_conv2d3x3109_mult_x_bs1_merged_bit_select_e & "00";
    i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im9_shift0_q <= i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im9_shift0_qint(19 downto 0);

    -- i_scevgep_conv2d3x3_conv2d3x3109_mult_x_align_12(BITSHIFT,154)@2
    i_scevgep_conv2d3x3_conv2d3x3109_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im9_shift0_q) & "000000000000000";
    i_scevgep_conv2d3x3_conv2d3x3109_mult_x_align_12_q <= i_scevgep_conv2d3x3_conv2d3x3109_mult_x_align_12_qint(35 downto 0);

    -- i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im0_shift0(BITSHIFT,165)@2
    i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im0_shift0_qint <= i_scevgep_conv2d3x3_conv2d3x3109_mult_x_bs1_merged_bit_select_b & "00";
    i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im0_shift0_q <= i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im0_shift0_qint(19 downto 0);

    -- i_scevgep_conv2d3x3_conv2d3x3109_mult_x_join_13(BITJOIN,155)@2
    i_scevgep_conv2d3x3_conv2d3x3109_mult_x_join_13_q <= i_scevgep_conv2d3x3_conv2d3x3109_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_scevgep_conv2d3x3_conv2d3x3109_mult_x_im0_shift0_q);

    -- i_scevgep_conv2d3x3_conv2d3x3109_mult_x_result_add_0_0(ADD,159)@2
    i_scevgep_conv2d3x3_conv2d3x3109_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_scevgep_conv2d3x3_conv2d3x3109_mult_x_join_13_q);
    i_scevgep_conv2d3x3_conv2d3x3109_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_scevgep_conv2d3x3_conv2d3x3109_mult_x_join_16_q);
    i_scevgep_conv2d3x3_conv2d3x3109_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_scevgep_conv2d3x3_conv2d3x3109_mult_x_result_add_0_0_a) + UNSIGNED(i_scevgep_conv2d3x3_conv2d3x3109_mult_x_result_add_0_0_b));
    i_scevgep_conv2d3x3_conv2d3x3109_mult_x_result_add_0_0_q <= i_scevgep_conv2d3x3_conv2d3x3109_mult_x_result_add_0_0_o(67 downto 0);

    -- i_scevgep_conv2d3x3_conv2d3x3109_mult_extender_x(BITJOIN,18)@2
    i_scevgep_conv2d3x3_conv2d3x3109_mult_extender_x_q <= i_scevgep_conv2d3x3_conv2d3x3109_mult_multconst_x_q & i_scevgep_conv2d3x3_conv2d3x3109_mult_x_result_add_0_0_q(66 downto 0);

    -- i_scevgep_conv2d3x3_conv2d3x3109_trunc_sel_x(BITSELECT,20)@2
    i_scevgep_conv2d3x3_conv2d3x3109_trunc_sel_x_b <= i_scevgep_conv2d3x3_conv2d3x3109_mult_extender_x_q(63 downto 0);

    -- redist18_i_scevgep_conv2d3x3_conv2d3x3109_trunc_sel_x_b_1(DELAY,188)
    redist18_i_scevgep_conv2d3x3_conv2d3x3109_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_scevgep_conv2d3x3_conv2d3x3109_trunc_sel_x_b, xout => redist18_i_scevgep_conv2d3x3_conv2d3x3109_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- redist10_sync_in_aunroll_x_in_c0_eni7237_5_3(DELAY,180)
    redist10_sync_in_aunroll_x_in_c0_eni7237_5_3 : dspba_delay
    GENERIC MAP ( width => 64, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni7237_5, xout => redist10_sync_in_aunroll_x_in_c0_eni7237_5_3_q, clk => clock, aclr => resetn );

    -- redist10_sync_in_aunroll_x_in_c0_eni7237_5_3_outputreg(DELAY,196)
    redist10_sync_in_aunroll_x_in_c0_eni7237_5_3_outputreg : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist10_sync_in_aunroll_x_in_c0_eni7237_5_3_q, xout => redist10_sync_in_aunroll_x_in_c0_eni7237_5_3_outputreg_q, clk => clock, aclr => resetn );

    -- i_scevgep_conv2d3x3_conv2d3x3109_add_x(ADD,21)@3
    i_scevgep_conv2d3x3_conv2d3x3109_add_x_a <= STD_LOGIC_VECTOR("0" & redist10_sync_in_aunroll_x_in_c0_eni7237_5_3_outputreg_q);
    i_scevgep_conv2d3x3_conv2d3x3109_add_x_b <= STD_LOGIC_VECTOR("0" & redist18_i_scevgep_conv2d3x3_conv2d3x3109_trunc_sel_x_b_1_q);
    i_scevgep_conv2d3x3_conv2d3x3109_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_scevgep_conv2d3x3_conv2d3x3109_add_x_a) + UNSIGNED(i_scevgep_conv2d3x3_conv2d3x3109_add_x_b));
    i_scevgep_conv2d3x3_conv2d3x3109_add_x_q <= i_scevgep_conv2d3x3_conv2d3x3109_add_x_o(64 downto 0);

    -- i_scevgep_conv2d3x3_conv2d3x3109_dupName_0_trunc_sel_x(BITSELECT,15)@3
    i_scevgep_conv2d3x3_conv2d3x3109_dupName_0_trunc_sel_x_b <= i_scevgep_conv2d3x3_conv2d3x3109_add_x_q(63 downto 0);

    -- redist19_i_scevgep_conv2d3x3_conv2d3x3109_dupName_0_trunc_sel_x_b_1(DELAY,189)
    redist19_i_scevgep_conv2d3x3_conv2d3x3109_dupName_0_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_scevgep_conv2d3x3_conv2d3x3109_dupName_0_trunc_sel_x_b, xout => redist19_i_scevgep_conv2d3x3_conv2d3x3109_dupName_0_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- redist11_sync_in_aunroll_x_in_c0_eni7237_5_4(DELAY,181)
    redist11_sync_in_aunroll_x_in_c0_eni7237_5_4 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist10_sync_in_aunroll_x_in_c0_eni7237_5_3_outputreg_q, xout => redist11_sync_in_aunroll_x_in_c0_eni7237_5_4_q, clk => clock, aclr => resetn );

    -- i_output_im_addr_022_lc_outerphi_conv2d3x3(MUX,50)@4
    i_output_im_addr_022_lc_outerphi_conv2d3x3_s <= redist1_i_unnamed_conv2d3x3103_q_1_q;
    i_output_im_addr_022_lc_outerphi_conv2d3x3_combproc: PROCESS (i_output_im_addr_022_lc_outerphi_conv2d3x3_s, redist11_sync_in_aunroll_x_in_c0_eni7237_5_4_q, redist19_i_scevgep_conv2d3x3_conv2d3x3109_dupName_0_trunc_sel_x_b_1_q)
    BEGIN
        CASE (i_output_im_addr_022_lc_outerphi_conv2d3x3_s) IS
            WHEN "0" => i_output_im_addr_022_lc_outerphi_conv2d3x3_q <= redist11_sync_in_aunroll_x_in_c0_eni7237_5_4_q;
            WHEN "1" => i_output_im_addr_022_lc_outerphi_conv2d3x3_q <= redist19_i_scevgep_conv2d3x3_conv2d3x3109_dupName_0_trunc_sel_x_b_1_q;
            WHEN OTHERS => i_output_im_addr_022_lc_outerphi_conv2d3x3_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist13_sync_in_aunroll_x_in_c0_eni7237_6_3(DELAY,183)
    redist13_sync_in_aunroll_x_in_c0_eni7237_6_3 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist12_sync_in_aunroll_x_in_c0_eni7237_6_2_q, xout => redist13_sync_in_aunroll_x_in_c0_eni7237_6_3_q, clk => clock, aclr => resetn );

    -- i_i_023_lc_outerphi_conv2d3x3(MUX,46)@3 + 1
    i_i_023_lc_outerphi_conv2d3x3_s <= i_unnamed_conv2d3x3103_q;
    i_i_023_lc_outerphi_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_i_023_lc_outerphi_conv2d3x3_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_i_023_lc_outerphi_conv2d3x3_s) IS
                WHEN "0" => i_i_023_lc_outerphi_conv2d3x3_q <= redist13_sync_in_aunroll_x_in_c0_eni7237_6_3_q;
                WHEN "1" => i_i_023_lc_outerphi_conv2d3x3_q <= redist22_bgTrunc_i_inc79_conv2d3x3_sel_x_b_1_q;
                WHEN OTHERS => i_i_023_lc_outerphi_conv2d3x3_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- i_incdec_ptr_conv2d3x3_conv2d3x399_c_i64_4gr_x(CONSTANT,13)
    i_incdec_ptr_conv2d3x3_conv2d3x399_c_i64_4gr_x_q <= "0000000000000000000000000000000000000000000000000000000000000100";

    -- redist8_sync_in_aunroll_x_in_c0_eni7237_3_3(DELAY,178)
    redist8_sync_in_aunroll_x_in_c0_eni7237_3_3 : dspba_delay
    GENERIC MAP ( width => 64, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni7237_3, xout => redist8_sync_in_aunroll_x_in_c0_eni7237_3_3_q, clk => clock, aclr => resetn );

    -- redist8_sync_in_aunroll_x_in_c0_eni7237_3_3_outputreg(DELAY,195)
    redist8_sync_in_aunroll_x_in_c0_eni7237_3_3_outputreg : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist8_sync_in_aunroll_x_in_c0_eni7237_3_3_q, xout => redist8_sync_in_aunroll_x_in_c0_eni7237_3_3_outputreg_q, clk => clock, aclr => resetn );

    -- i_incdec_ptr_conv2d3x3_conv2d3x399_add_x(ADD,12)@3
    i_incdec_ptr_conv2d3x3_conv2d3x399_add_x_a <= STD_LOGIC_VECTOR("0" & redist8_sync_in_aunroll_x_in_c0_eni7237_3_3_outputreg_q);
    i_incdec_ptr_conv2d3x3_conv2d3x399_add_x_b <= STD_LOGIC_VECTOR("0" & i_incdec_ptr_conv2d3x3_conv2d3x399_c_i64_4gr_x_q);
    i_incdec_ptr_conv2d3x3_conv2d3x399_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_incdec_ptr_conv2d3x3_conv2d3x399_add_x_a) + UNSIGNED(i_incdec_ptr_conv2d3x3_conv2d3x399_add_x_b));
    i_incdec_ptr_conv2d3x3_conv2d3x399_add_x_q <= i_incdec_ptr_conv2d3x3_conv2d3x399_add_x_o(64 downto 0);

    -- i_incdec_ptr_conv2d3x3_conv2d3x399_trunc_sel_x(BITSELECT,11)@3
    i_incdec_ptr_conv2d3x3_conv2d3x399_trunc_sel_x_b <= i_incdec_ptr_conv2d3x3_conv2d3x399_add_x_q(63 downto 0);

    -- redist20_i_incdec_ptr_conv2d3x3_conv2d3x399_trunc_sel_x_b_1(DELAY,190)
    redist20_i_incdec_ptr_conv2d3x3_conv2d3x399_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_incdec_ptr_conv2d3x3_conv2d3x399_trunc_sel_x_b, xout => redist20_i_incdec_ptr_conv2d3x3_conv2d3x399_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_output_im_addr_114_lc_innerphi_conv2d3x3(MUX,51)@4
    i_output_im_addr_114_lc_innerphi_conv2d3x3_s <= redist1_i_unnamed_conv2d3x3103_q_1_q;
    i_output_im_addr_114_lc_innerphi_conv2d3x3_combproc: PROCESS (i_output_im_addr_114_lc_innerphi_conv2d3x3_s, redist20_i_incdec_ptr_conv2d3x3_conv2d3x399_trunc_sel_x_b_1_q, redist19_i_scevgep_conv2d3x3_conv2d3x3109_dupName_0_trunc_sel_x_b_1_q)
    BEGIN
        CASE (i_output_im_addr_114_lc_innerphi_conv2d3x3_s) IS
            WHEN "0" => i_output_im_addr_114_lc_innerphi_conv2d3x3_q <= redist20_i_incdec_ptr_conv2d3x3_conv2d3x399_trunc_sel_x_b_1_q;
            WHEN "1" => i_output_im_addr_114_lc_innerphi_conv2d3x3_q <= redist19_i_scevgep_conv2d3x3_conv2d3x3109_dupName_0_trunc_sel_x_b_1_q;
            WHEN OTHERS => i_output_im_addr_114_lc_innerphi_conv2d3x3_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist24_bgTrunc_i_inc76_conv2d3x3_sel_x_b_2(DELAY,194)
    redist24_bgTrunc_i_inc76_conv2d3x3_sel_x_b_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist23_bgTrunc_i_inc76_conv2d3x3_sel_x_b_1_q, xout => redist24_bgTrunc_i_inc76_conv2d3x3_sel_x_b_2_q, clk => clock, aclr => resetn );

    -- i_j_115_lc_innerphi_conv2d3x3(MUX,49)@3 + 1
    i_j_115_lc_innerphi_conv2d3x3_s <= i_unnamed_conv2d3x3103_q;
    i_j_115_lc_innerphi_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_j_115_lc_innerphi_conv2d3x3_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_j_115_lc_innerphi_conv2d3x3_s) IS
                WHEN "0" => i_j_115_lc_innerphi_conv2d3x3_q <= redist24_bgTrunc_i_inc76_conv2d3x3_sel_x_b_2_q;
                WHEN "1" => i_j_115_lc_innerphi_conv2d3x3_q <= c_i32_0gr_q;
                WHEN OTHERS => i_j_115_lc_innerphi_conv2d3x3_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist5_i_cmp21_phi_decision39_xor_rm_conv2d3x3_q_3(DELAY,175)
    redist5_i_cmp21_phi_decision39_xor_rm_conv2d3x3_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist4_i_cmp21_phi_decision39_xor_rm_conv2d3x3_q_2_q, xout => redist5_i_cmp21_phi_decision39_xor_rm_conv2d3x3_q_3_q, clk => clock, aclr => resetn );

    -- redist6_sync_in_aunroll_x_in_c0_eni7237_1_1(DELAY,176)
    redist6_sync_in_aunroll_x_in_c0_eni7237_1_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni7237_1, xout => redist6_sync_in_aunroll_x_in_c0_eni7237_1_1_q, clk => clock, aclr => resetn );

    -- redist7_sync_in_aunroll_x_in_c0_eni7237_2_1(DELAY,177)
    redist7_sync_in_aunroll_x_in_c0_eni7237_2_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni7237_2, xout => redist7_sync_in_aunroll_x_in_c0_eni7237_2_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_input_channels_sync_buffer194_conv2d3x3(BLACKBOX,53)@0
    thei_syncbuf_input_channels_sync_buffer194_conv2d3x3 : i_syncbuf_input_channels_sync_buffer194_conv2d3x395
    PORT MAP (
        in_buffer_in => in_input_channels,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_input_channels_sync_buffer194_conv2d3x3_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_cmp138_rm63_conv2d3x3(COMPARE,38)@0 + 1
    i_cmp138_rm63_conv2d3x3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_0gr_q(31)) & c_i32_0gr_q));
    i_cmp138_rm63_conv2d3x3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_input_channels_sync_buffer194_conv2d3x3_out_buffer_out(31)) & i_syncbuf_input_channels_sync_buffer194_conv2d3x3_out_buffer_out));
    i_cmp138_rm63_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp138_rm63_conv2d3x3_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp138_rm63_conv2d3x3_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp138_rm63_conv2d3x3_a) - SIGNED(i_cmp138_rm63_conv2d3x3_b));
        END IF;
    END PROCESS;
    i_cmp138_rm63_conv2d3x3_c(0) <= i_cmp138_rm63_conv2d3x3_o(33);

    -- i_unnamed_conv2d3x398(LOGICAL,69)@1
    i_unnamed_conv2d3x398_q <= i_cmp21_rm62_conv2d3x3_c and i_cmp138_rm63_conv2d3x3_c;

    -- i_select35_conv2d3x3(MUX,52)@1 + 1
    i_select35_conv2d3x3_s <= i_unnamed_conv2d3x398_q;
    i_select35_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_select35_conv2d3x3_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_select35_conv2d3x3_s) IS
                WHEN "0" => i_select35_conv2d3x3_q <= redist7_sync_in_aunroll_x_in_c0_eni7237_2_1_q;
                WHEN "1" => i_select35_conv2d3x3_q <= redist6_sync_in_aunroll_x_in_c0_eni7237_1_1_q;
                WHEN OTHERS => i_select35_conv2d3x3_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist2_i_select35_conv2d3x3_q_2(DELAY,172)
    redist2_i_select35_conv2d3x3_q_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_select35_conv2d3x3_q, xout => redist2_i_select35_conv2d3x3_q_2_q, clk => clock, aclr => resetn );

    -- redist3_i_select35_conv2d3x3_q_3(DELAY,173)
    redist3_i_select35_conv2d3x3_q_3 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist2_i_select35_conv2d3x3_q_2_q, xout => redist3_i_select35_conv2d3x3_q_3_q, clk => clock, aclr => resetn );

    -- c_float_0_000000e_00(FLOATCONSTANT,32)
    c_float_0_000000e_00_q <= "00000000000000000000000000000000";

    -- frac_y_uid100_i_cmp71_conv2d3x3(BITSELECT,99)@2
    frac_y_uid100_i_cmp71_conv2d3x3_b <= i_select35_conv2d3x3_q(22 downto 0);

    -- cstZeroWF_uid80_i_cmp71_conv2d3x3(CONSTANT,79)
    cstZeroWF_uid80_i_cmp71_conv2d3x3_q <= "00000000000000000000000";

    -- fracXIsZero_uid103_i_cmp71_conv2d3x3(LOGICAL,102)@2
    fracXIsZero_uid103_i_cmp71_conv2d3x3_q <= "1" WHEN cstZeroWF_uid80_i_cmp71_conv2d3x3_q = frac_y_uid100_i_cmp71_conv2d3x3_b ELSE "0";

    -- cstAllZWE_uid81_i_cmp71_conv2d3x3(CONSTANT,80)
    cstAllZWE_uid81_i_cmp71_conv2d3x3_q <= "00000000";

    -- exp_y_uid99_i_cmp71_conv2d3x3(BITSELECT,98)@2
    exp_y_uid99_i_cmp71_conv2d3x3_b <= i_select35_conv2d3x3_q(30 downto 23);

    -- expXIsZero_uid101_i_cmp71_conv2d3x3(LOGICAL,100)@2
    expXIsZero_uid101_i_cmp71_conv2d3x3_q <= "1" WHEN exp_y_uid99_i_cmp71_conv2d3x3_b = cstAllZWE_uid81_i_cmp71_conv2d3x3_q ELSE "0";

    -- excZ_y_uid105_i_cmp71_conv2d3x3(LOGICAL,104)@2 + 1
    excZ_y_uid105_i_cmp71_conv2d3x3_qi <= expXIsZero_uid101_i_cmp71_conv2d3x3_q and fracXIsZero_uid103_i_cmp71_conv2d3x3_q;
    excZ_y_uid105_i_cmp71_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excZ_y_uid105_i_cmp71_conv2d3x3_qi, xout => excZ_y_uid105_i_cmp71_conv2d3x3_q, clk => clock, aclr => resetn );

    -- invExcYZ_uid135_i_cmp71_conv2d3x3(LOGICAL,134)@3
    invExcYZ_uid135_i_cmp71_conv2d3x3_q <= not (excZ_y_uid105_i_cmp71_conv2d3x3_q);

    -- frac_x_uid83_i_cmp71_conv2d3x3(BITSELECT,82)@2
    frac_x_uid83_i_cmp71_conv2d3x3_b <= c_float_0_000000e_00_q(22 downto 0);

    -- fracXIsZero_uid86_i_cmp71_conv2d3x3(LOGICAL,85)@2
    fracXIsZero_uid86_i_cmp71_conv2d3x3_q <= "1" WHEN cstZeroWF_uid80_i_cmp71_conv2d3x3_q = frac_x_uid83_i_cmp71_conv2d3x3_b ELSE "0";

    -- exp_x_uid82_i_cmp71_conv2d3x3(BITSELECT,81)@2
    exp_x_uid82_i_cmp71_conv2d3x3_b <= c_float_0_000000e_00_q(30 downto 23);

    -- expXIsZero_uid84_i_cmp71_conv2d3x3(LOGICAL,83)@2
    expXIsZero_uid84_i_cmp71_conv2d3x3_q <= "1" WHEN exp_x_uid82_i_cmp71_conv2d3x3_b = cstAllZWE_uid81_i_cmp71_conv2d3x3_q ELSE "0";

    -- excZ_x_uid88_i_cmp71_conv2d3x3(LOGICAL,87)@2 + 1
    excZ_x_uid88_i_cmp71_conv2d3x3_qi <= expXIsZero_uid84_i_cmp71_conv2d3x3_q and fracXIsZero_uid86_i_cmp71_conv2d3x3_q;
    excZ_x_uid88_i_cmp71_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excZ_x_uid88_i_cmp71_conv2d3x3_qi, xout => excZ_x_uid88_i_cmp71_conv2d3x3_q, clk => clock, aclr => resetn );

    -- invExcXZ_uid136_i_cmp71_conv2d3x3(LOGICAL,135)@3
    invExcXZ_uid136_i_cmp71_conv2d3x3_q <= not (excZ_x_uid88_i_cmp71_conv2d3x3_q);

    -- oneNonZero_uid137_i_cmp71_conv2d3x3(LOGICAL,136)@3
    oneNonZero_uid137_i_cmp71_conv2d3x3_q <= invExcXZ_uid136_i_cmp71_conv2d3x3_q or invExcYZ_uid135_i_cmp71_conv2d3x3_q;

    -- two_uid129_i_cmp71_conv2d3x3(CONSTANT,128)
    two_uid129_i_cmp71_conv2d3x3_q <= "10";

    -- signX_uid127_i_cmp71_conv2d3x3(BITSELECT,126)@3
    signX_uid127_i_cmp71_conv2d3x3_b <= STD_LOGIC_VECTOR(c_float_0_000000e_00_q(31 downto 31));

    -- signY_uid128_i_cmp71_conv2d3x3(BITSELECT,127)@3
    signY_uid128_i_cmp71_conv2d3x3_b <= STD_LOGIC_VECTOR(redist2_i_select35_conv2d3x3_q_2_q(31 downto 31));

    -- concSXSY_uid130_i_cmp71_conv2d3x3(BITJOIN,129)@3
    concSXSY_uid130_i_cmp71_conv2d3x3_q <= signX_uid127_i_cmp71_conv2d3x3_b & signY_uid128_i_cmp71_conv2d3x3_b;

    -- sxLTsy_uid131_i_cmp71_conv2d3x3(LOGICAL,130)@3
    sxLTsy_uid131_i_cmp71_conv2d3x3_q <= "1" WHEN concSXSY_uid130_i_cmp71_conv2d3x3_q = two_uid129_i_cmp71_conv2d3x3_q ELSE "0";

    -- rc2_uid138_i_cmp71_conv2d3x3(LOGICAL,137)@3
    rc2_uid138_i_cmp71_conv2d3x3_q <= sxLTsy_uid131_i_cmp71_conv2d3x3_q and oneNonZero_uid137_i_cmp71_conv2d3x3_q;

    -- expFracX_uid118_i_cmp71_conv2d3x3(BITJOIN,117)@2
    expFracX_uid118_i_cmp71_conv2d3x3_q <= exp_x_uid82_i_cmp71_conv2d3x3_b & frac_x_uid83_i_cmp71_conv2d3x3_b;

    -- expFracY_uid120_i_cmp71_conv2d3x3(BITJOIN,119)@2
    expFracY_uid120_i_cmp71_conv2d3x3_q <= exp_y_uid99_i_cmp71_conv2d3x3_b & frac_y_uid100_i_cmp71_conv2d3x3_b;

    -- efxGTefy_uid122_i_cmp71_conv2d3x3(COMPARE,121)@2 + 1
    efxGTefy_uid122_i_cmp71_conv2d3x3_a <= STD_LOGIC_VECTOR("00" & expFracY_uid120_i_cmp71_conv2d3x3_q);
    efxGTefy_uid122_i_cmp71_conv2d3x3_b <= STD_LOGIC_VECTOR("00" & expFracX_uid118_i_cmp71_conv2d3x3_q);
    efxGTefy_uid122_i_cmp71_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            efxGTefy_uid122_i_cmp71_conv2d3x3_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            efxGTefy_uid122_i_cmp71_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(efxGTefy_uid122_i_cmp71_conv2d3x3_a) - UNSIGNED(efxGTefy_uid122_i_cmp71_conv2d3x3_b));
        END IF;
    END PROCESS;
    efxGTefy_uid122_i_cmp71_conv2d3x3_c(0) <= efxGTefy_uid122_i_cmp71_conv2d3x3_o(32);

    -- efxLTefy_uid123_i_cmp71_conv2d3x3(COMPARE,122)@2 + 1
    efxLTefy_uid123_i_cmp71_conv2d3x3_a <= STD_LOGIC_VECTOR("00" & expFracX_uid118_i_cmp71_conv2d3x3_q);
    efxLTefy_uid123_i_cmp71_conv2d3x3_b <= STD_LOGIC_VECTOR("00" & expFracY_uid120_i_cmp71_conv2d3x3_q);
    efxLTefy_uid123_i_cmp71_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            efxLTefy_uid123_i_cmp71_conv2d3x3_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            efxLTefy_uid123_i_cmp71_conv2d3x3_o <= STD_LOGIC_VECTOR(UNSIGNED(efxLTefy_uid123_i_cmp71_conv2d3x3_a) - UNSIGNED(efxLTefy_uid123_i_cmp71_conv2d3x3_b));
        END IF;
    END PROCESS;
    efxLTefy_uid123_i_cmp71_conv2d3x3_c(0) <= efxLTefy_uid123_i_cmp71_conv2d3x3_o(32);

    -- expFracCompMux_uid134_i_cmp71_conv2d3x3(MUX,133)@3
    expFracCompMux_uid134_i_cmp71_conv2d3x3_s <= signX_uid127_i_cmp71_conv2d3x3_b;
    expFracCompMux_uid134_i_cmp71_conv2d3x3_combproc: PROCESS (expFracCompMux_uid134_i_cmp71_conv2d3x3_s, efxLTefy_uid123_i_cmp71_conv2d3x3_c, efxGTefy_uid122_i_cmp71_conv2d3x3_c)
    BEGIN
        CASE (expFracCompMux_uid134_i_cmp71_conv2d3x3_s) IS
            WHEN "0" => expFracCompMux_uid134_i_cmp71_conv2d3x3_q <= efxLTefy_uid123_i_cmp71_conv2d3x3_c;
            WHEN "1" => expFracCompMux_uid134_i_cmp71_conv2d3x3_q <= efxGTefy_uid122_i_cmp71_conv2d3x3_c;
            WHEN OTHERS => expFracCompMux_uid134_i_cmp71_conv2d3x3_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- xorSigns_uid132_i_cmp71_conv2d3x3(LOGICAL,131)@3
    xorSigns_uid132_i_cmp71_conv2d3x3_q <= signX_uid127_i_cmp71_conv2d3x3_b xor signY_uid128_i_cmp71_conv2d3x3_b;

    -- sxEQsy_uid133_i_cmp71_conv2d3x3(LOGICAL,132)@3
    sxEQsy_uid133_i_cmp71_conv2d3x3_q <= not (xorSigns_uid132_i_cmp71_conv2d3x3_q);

    -- sxEQsyExpFracCompMux_uid139_i_cmp71_conv2d3x3(LOGICAL,138)@3
    sxEQsyExpFracCompMux_uid139_i_cmp71_conv2d3x3_q <= sxEQsy_uid133_i_cmp71_conv2d3x3_q and expFracCompMux_uid134_i_cmp71_conv2d3x3_q;

    -- r_uid140_i_cmp71_conv2d3x3(LOGICAL,139)@3 + 1
    r_uid140_i_cmp71_conv2d3x3_qi <= sxEQsyExpFracCompMux_uid139_i_cmp71_conv2d3x3_q or rc2_uid138_i_cmp71_conv2d3x3_q;
    r_uid140_i_cmp71_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => r_uid140_i_cmp71_conv2d3x3_qi, xout => r_uid140_i_cmp71_conv2d3x3_q, clk => clock, aclr => resetn );

    -- fracXIsNotZero_uid104_i_cmp71_conv2d3x3(LOGICAL,103)@2
    fracXIsNotZero_uid104_i_cmp71_conv2d3x3_q <= not (fracXIsZero_uid103_i_cmp71_conv2d3x3_q);

    -- cstAllOWE_uid79_i_cmp71_conv2d3x3(CONSTANT,78)
    cstAllOWE_uid79_i_cmp71_conv2d3x3_q <= "11111111";

    -- expXIsMax_uid102_i_cmp71_conv2d3x3(LOGICAL,101)@2
    expXIsMax_uid102_i_cmp71_conv2d3x3_q <= "1" WHEN exp_y_uid99_i_cmp71_conv2d3x3_b = cstAllOWE_uid79_i_cmp71_conv2d3x3_q ELSE "0";

    -- excN_y_uid107_i_cmp71_conv2d3x3(LOGICAL,106)@2 + 1
    excN_y_uid107_i_cmp71_conv2d3x3_qi <= expXIsMax_uid102_i_cmp71_conv2d3x3_q and fracXIsNotZero_uid104_i_cmp71_conv2d3x3_q;
    excN_y_uid107_i_cmp71_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excN_y_uid107_i_cmp71_conv2d3x3_qi, xout => excN_y_uid107_i_cmp71_conv2d3x3_q, clk => clock, aclr => resetn );

    -- fracXIsNotZero_uid87_i_cmp71_conv2d3x3(LOGICAL,86)@2
    fracXIsNotZero_uid87_i_cmp71_conv2d3x3_q <= not (fracXIsZero_uid86_i_cmp71_conv2d3x3_q);

    -- expXIsMax_uid85_i_cmp71_conv2d3x3(LOGICAL,84)@2
    expXIsMax_uid85_i_cmp71_conv2d3x3_q <= "1" WHEN exp_x_uid82_i_cmp71_conv2d3x3_b = cstAllOWE_uid79_i_cmp71_conv2d3x3_q ELSE "0";

    -- excN_x_uid90_i_cmp71_conv2d3x3(LOGICAL,89)@2 + 1
    excN_x_uid90_i_cmp71_conv2d3x3_qi <= expXIsMax_uid85_i_cmp71_conv2d3x3_q and fracXIsNotZero_uid87_i_cmp71_conv2d3x3_q;
    excN_x_uid90_i_cmp71_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excN_x_uid90_i_cmp71_conv2d3x3_qi, xout => excN_x_uid90_i_cmp71_conv2d3x3_q, clk => clock, aclr => resetn );

    -- oneIsNaN_uid113_i_cmp71_conv2d3x3(LOGICAL,112)@3 + 1
    oneIsNaN_uid113_i_cmp71_conv2d3x3_qi <= excN_x_uid90_i_cmp71_conv2d3x3_q or excN_y_uid107_i_cmp71_conv2d3x3_q;
    oneIsNaN_uid113_i_cmp71_conv2d3x3_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => oneIsNaN_uid113_i_cmp71_conv2d3x3_qi, xout => oneIsNaN_uid113_i_cmp71_conv2d3x3_q, clk => clock, aclr => resetn );

    -- rPostExc_uid141_i_cmp71_conv2d3x3(MUX,140)@4
    rPostExc_uid141_i_cmp71_conv2d3x3_s <= oneIsNaN_uid113_i_cmp71_conv2d3x3_q;
    rPostExc_uid141_i_cmp71_conv2d3x3_combproc: PROCESS (rPostExc_uid141_i_cmp71_conv2d3x3_s, r_uid140_i_cmp71_conv2d3x3_q, GND_q)
    BEGIN
        CASE (rPostExc_uid141_i_cmp71_conv2d3x3_s) IS
            WHEN "0" => rPostExc_uid141_i_cmp71_conv2d3x3_q <= r_uid140_i_cmp71_conv2d3x3_q;
            WHEN "1" => rPostExc_uid141_i_cmp71_conv2d3x3_q <= GND_q;
            WHEN OTHERS => rPostExc_uid141_i_cmp71_conv2d3x3_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_cond_conv2d3x3(MUX,42)@4
    i_cond_conv2d3x3_s <= rPostExc_uid141_i_cmp71_conv2d3x3_q;
    i_cond_conv2d3x3_combproc: PROCESS (i_cond_conv2d3x3_s, c_float_0_000000e_00_q, redist3_i_select35_conv2d3x3_q_3_q)
    BEGIN
        CASE (i_cond_conv2d3x3_s) IS
            WHEN "0" => i_cond_conv2d3x3_q <= c_float_0_000000e_00_q;
            WHEN "1" => i_cond_conv2d3x3_q <= redist3_i_select35_conv2d3x3_q_3_q;
            WHEN OTHERS => i_cond_conv2d3x3_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,27)@4
    out_c0_exi7252_0 <= GND_q;
    out_c0_exi7252_1 <= i_cond_conv2d3x3_q;
    out_c0_exi7252_2 <= redist5_i_cmp21_phi_decision39_xor_rm_conv2d3x3_q_3_q;
    out_c0_exi7252_3 <= i_j_115_lc_innerphi_conv2d3x3_q;
    out_c0_exi7252_4 <= i_output_im_addr_114_lc_innerphi_conv2d3x3_q;
    out_c0_exi7252_5 <= i_i_023_lc_outerphi_conv2d3x3_q;
    out_c0_exi7252_6 <= i_output_im_addr_022_lc_outerphi_conv2d3x3_q;
    out_c0_exi7252_7 <= i_for_end80_loopexit_loopexit_lc_cond_conv2d3x3_q;
    out_o_valid <= redist17_sync_in_aunroll_x_in_i_valid_4_q;

END normal;
