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

-- VHDL created from bb_conv2d3x3_B3_stall_region
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

entity bb_conv2d3x3_B3_stall_region is
    port (
        in_c0_exe13 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exit22320_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit22320_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit22320_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit22320_3 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exit22320_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit22320_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit22320_6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit22320_7 : in std_logic_vector(2 downto 0);  -- ufix3
        in_c0_exit22320_8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit22320_9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit22320_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe123021 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_i_0234 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_1158 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im_addr_0226 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_11410 : in std_logic_vector(63 downto 0);  -- ufix64
        in_unnamed_conv2d3x33 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_unnamed_conv2d3x35_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe13 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe3256 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe4257 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe5258 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe6259 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe7260 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x33 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_output_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_conv2d3x35_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_conv2d3x35_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x35_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x35_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x35_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_conv2d3x35_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x35_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x35_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x35_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_conv2d3x35_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_conv2d3x35_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_conv2d3x3_B3_stall_region;

architecture normal of bb_conv2d3x3_B3_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3 is
        port (
            in_c0_eni7237_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni7237_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni7237_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni7237_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni7237_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni7237_5 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni7237_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni7237_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_channels : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit253_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit253_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c0_exit253_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit253_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit253_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit253_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit253_6 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit253_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_store_unnamed_conv2d3x35_conv2d3x3115 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_writedata : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_conv2d3x35_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x35_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x35_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_conv2d3x35_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_conv2d3x35_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x35_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x35_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x35_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x35_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x35_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x35_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_conv2d3x35_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
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



    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_6 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_conv2d3x35_conv2d3x3_out_lsu_unnamed_conv2d3x35_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_conv2d3x35_conv2d3x3_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_conv2d3x35_conv2d3x3_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_conv2d3x35_conv2d3x3_out_unnamed_conv2d3x35_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal i_store_unnamed_conv2d3x35_conv2d3x3_out_unnamed_conv2d3x35_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_store_unnamed_conv2d3x35_conv2d3x3_out_unnamed_conv2d3x35_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_unnamed_conv2d3x35_conv2d3x3_out_unnamed_conv2d3x35_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_conv2d3x35_conv2d3x3_out_unnamed_conv2d3x35_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_conv2d3x35_conv2d3x3_out_unnamed_conv2d3x35_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_unnamed_conv2d3x35_conv2d3x3_out_unnamed_conv2d3x35_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
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
    signal redist1_stall_entry_aunroll_o20_7_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_stall_entry_aunroll_o20_7_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_stall_entry_aunroll_o20_7_2_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_stall_entry_aunroll_o20_7_3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_stall_entry_aunroll_o20_7_4_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_stall_entry_aunroll_o20_7_5_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist1_stall_entry_aunroll_o20_7_6_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_stall_entry_aunroll_o21_9_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_aunroll_o21_9_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist2_stall_entry_aunroll_o21_9_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_aunroll_o21_9_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist2_stall_entry_aunroll_o21_9_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_stall_entry_aunroll_o21_9_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_aunroll_o21_9_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist2_stall_entry_aunroll_o21_9_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_aunroll_o21_9_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist2_stall_entry_aunroll_o21_9_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_4_2_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_4_2_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist5_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_5_2_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_5_2_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_6_2_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist6_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_6_2_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist7_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_7_2_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_7_2_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_q : STD_LOGIC_VECTOR (225 downto 0);
    signal bubble_select_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_e : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_g : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_h : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_stall_entry_aunroll_q : STD_LOGIC_VECTOR (320 downto 0);
    signal bubble_select_stall_entry_aunroll_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_aunroll_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_g : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_aunroll_h : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_aunroll_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist0_stall_entry_aunroll_o4_9_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist0_stall_entry_aunroll_o4_9_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist2_stall_entry_aunroll_o21_9_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist2_stall_entry_aunroll_o21_9_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_store_unnamed_conv2d3x35_conv2d3x3_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_store_unnamed_conv2d3x35_conv2d3x3_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_store_unnamed_conv2d3x35_conv2d3x3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_store_unnamed_conv2d3x35_conv2d3x3_V0 : STD_LOGIC_VECTOR (0 downto 0);
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
    signal SE_stall_entry_aunroll_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_4_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_4_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_4_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_4_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_5_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_5_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_5_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_5_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_5_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_5_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_6_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_6_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_6_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_6_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_6_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o20_7_6_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_stall_entry_aunroll_o21_9_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_stall_entry_aunroll_o21_9_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_stall_entry_aunroll_o21_9_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_stall_entry_aunroll_o21_9_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_stall_entry_aunroll_o21_9_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist2_stall_entry_aunroll_o21_9_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o20_7_1_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o20_7_1_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o20_7_1_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o20_7_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o20_7_1_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o20_7_1_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o20_7_3_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o20_7_3_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o20_7_3_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o20_7_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o20_7_3_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o20_7_3_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o20_7_5_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o20_7_5_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o20_7_5_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o20_7_5_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o20_7_5_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_stall_entry_aunroll_o20_7_5_D0 : STD_LOGIC_VECTOR (63 downto 0);

begin


    -- SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1(STALLENABLE,82)
    -- Valid signal propagation
    SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_V0 <= SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_R_v_0;
    -- Stall signal propagation
    SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_s_tv_0 <= SE_out_redist2_stall_entry_aunroll_o21_9_fifo_backStall and SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_R_v_0;
    -- Backward Enable generation
    SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_backEN <= not (SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_v_s_0 <= SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_backEN and SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_V0;
    -- Backward Stall generation
    SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_backStall <= not (SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_v_s_0);
    SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_backEN = "0") THEN
                SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_R_v_0 <= SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_R_v_0 and SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_s_tv_0;
            ELSE
                SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_R_v_0 <= SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0(STALLENABLE,81)
    -- Valid signal propagation
    SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_V0 <= SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_R_v_0;
    -- Stall signal propagation
    SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_s_tv_0 <= SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_backStall and SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_R_v_0;
    -- Backward Enable generation
    SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_backEN <= not (SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_v_s_0 <= SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_backEN and SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_V1;
    -- Backward Stall generation
    SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_backStall <= not (SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_v_s_0);
    SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_backEN = "0") THEN
                SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_R_v_0 <= SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_R_v_0 and SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_s_tv_0;
            ELSE
                SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_R_v_0 <= SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o21_9_fifo(STALLFIFO,39)
    redist2_stall_entry_aunroll_o21_9_fifo_valid_in <= SE_stall_entry_aunroll_V2;
    redist2_stall_entry_aunroll_o21_9_fifo_stall_in <= SE_out_redist2_stall_entry_aunroll_o21_9_fifo_backStall;
    redist2_stall_entry_aunroll_o21_9_fifo_data_in <= bubble_select_stall_entry_aunroll_i;
    redist2_stall_entry_aunroll_o21_9_fifo_valid_in_bitsignaltemp <= redist2_stall_entry_aunroll_o21_9_fifo_valid_in(0);
    redist2_stall_entry_aunroll_o21_9_fifo_stall_in_bitsignaltemp <= redist2_stall_entry_aunroll_o21_9_fifo_stall_in(0);
    redist2_stall_entry_aunroll_o21_9_fifo_valid_out(0) <= redist2_stall_entry_aunroll_o21_9_fifo_valid_out_bitsignaltemp;
    redist2_stall_entry_aunroll_o21_9_fifo_stall_out(0) <= redist2_stall_entry_aunroll_o21_9_fifo_stall_out_bitsignaltemp;
    theredist2_stall_entry_aunroll_o21_9_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 10,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist2_stall_entry_aunroll_o21_9_fifo_valid_in_bitsignaltemp,
        stall_in => redist2_stall_entry_aunroll_o21_9_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_aunroll_i,
        valid_out => redist2_stall_entry_aunroll_o21_9_fifo_valid_out_bitsignaltemp,
        stall_out => redist2_stall_entry_aunroll_o21_9_fifo_stall_out_bitsignaltemp,
        data_out => redist2_stall_entry_aunroll_o21_9_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist0_stall_entry_aunroll_o4_9_fifo(STALLFIFO,31)
    redist0_stall_entry_aunroll_o4_9_fifo_valid_in <= SE_stall_entry_aunroll_V1;
    redist0_stall_entry_aunroll_o4_9_fifo_stall_in <= SE_out_redist2_stall_entry_aunroll_o21_9_fifo_backStall;
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

    -- redist1_stall_entry_aunroll_o20_7_0(REG,32)
    redist1_stall_entry_aunroll_o20_7_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o20_7_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o20_7_0_backEN = "1") THEN
                redist1_stall_entry_aunroll_o20_7_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_h);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_aunroll_o20_7_1(REG,33)
    redist1_stall_entry_aunroll_o20_7_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o20_7_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o20_7_1_backEN = "1") THEN
                redist1_stall_entry_aunroll_o20_7_1_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_aunroll_o20_7_1_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_aunroll_o20_7_2(REG,34)
    redist1_stall_entry_aunroll_o20_7_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o20_7_2_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o20_7_2_backEN = "1") THEN
                redist1_stall_entry_aunroll_o20_7_2_q <= STD_LOGIC_VECTOR(redist1_stall_entry_aunroll_o20_7_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_aunroll_o20_7_3(REG,35)
    redist1_stall_entry_aunroll_o20_7_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o20_7_3_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o20_7_3_backEN = "1") THEN
                redist1_stall_entry_aunroll_o20_7_3_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_aunroll_o20_7_3_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_aunroll_o20_7_4(REG,36)
    redist1_stall_entry_aunroll_o20_7_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o20_7_4_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o20_7_4_backEN = "1") THEN
                redist1_stall_entry_aunroll_o20_7_4_q <= STD_LOGIC_VECTOR(redist1_stall_entry_aunroll_o20_7_3_q);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist1_stall_entry_aunroll_o20_7_5(STALLENABLE,77)
    -- Valid signal propagation
    SE_redist1_stall_entry_aunroll_o20_7_5_V0 <= SE_redist1_stall_entry_aunroll_o20_7_5_R_v_0;
    -- Stall signal propagation
    SE_redist1_stall_entry_aunroll_o20_7_5_s_tv_0 <= SE_redist1_stall_entry_aunroll_o20_7_6_backStall and SE_redist1_stall_entry_aunroll_o20_7_5_R_v_0;
    -- Backward Enable generation
    SE_redist1_stall_entry_aunroll_o20_7_5_backEN <= not (SE_redist1_stall_entry_aunroll_o20_7_5_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_stall_entry_aunroll_o20_7_5_v_s_0 <= SE_redist1_stall_entry_aunroll_o20_7_5_backEN and SR_SE_redist1_stall_entry_aunroll_o20_7_5_V;
    -- Backward Stall generation
    SE_redist1_stall_entry_aunroll_o20_7_5_backStall <= not (SE_redist1_stall_entry_aunroll_o20_7_5_backEN);
    SE_redist1_stall_entry_aunroll_o20_7_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_stall_entry_aunroll_o20_7_5_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o20_7_5_backEN = "0") THEN
                SE_redist1_stall_entry_aunroll_o20_7_5_R_v_0 <= SE_redist1_stall_entry_aunroll_o20_7_5_R_v_0 and SE_redist1_stall_entry_aunroll_o20_7_5_s_tv_0;
            ELSE
                SE_redist1_stall_entry_aunroll_o20_7_5_R_v_0 <= SE_redist1_stall_entry_aunroll_o20_7_5_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist1_stall_entry_aunroll_o20_7_5(STALLREG,113)
    SR_SE_redist1_stall_entry_aunroll_o20_7_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist1_stall_entry_aunroll_o20_7_5_r_valid <= (others => '0');
            SR_SE_redist1_stall_entry_aunroll_o20_7_5_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist1_stall_entry_aunroll_o20_7_5_r_valid <= SE_redist1_stall_entry_aunroll_o20_7_5_backStall and (SR_SE_redist1_stall_entry_aunroll_o20_7_5_r_valid or SR_SE_redist1_stall_entry_aunroll_o20_7_5_i_valid);

            IF (SR_SE_redist1_stall_entry_aunroll_o20_7_5_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist1_stall_entry_aunroll_o20_7_5_r_data0 <= STD_LOGIC_VECTOR(redist1_stall_entry_aunroll_o20_7_4_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist1_stall_entry_aunroll_o20_7_5_i_valid <= SE_redist1_stall_entry_aunroll_o20_7_4_V0;
    -- Stall signal propagation
    SR_SE_redist1_stall_entry_aunroll_o20_7_5_backStall <= SR_SE_redist1_stall_entry_aunroll_o20_7_5_r_valid or not (SR_SE_redist1_stall_entry_aunroll_o20_7_5_i_valid);

    -- Valid
    SR_SE_redist1_stall_entry_aunroll_o20_7_5_V <= SR_SE_redist1_stall_entry_aunroll_o20_7_5_r_valid WHEN SR_SE_redist1_stall_entry_aunroll_o20_7_5_r_valid = "1" ELSE SR_SE_redist1_stall_entry_aunroll_o20_7_5_i_valid;

    SR_SE_redist1_stall_entry_aunroll_o20_7_5_D0 <= SR_SE_redist1_stall_entry_aunroll_o20_7_5_r_data0 WHEN SR_SE_redist1_stall_entry_aunroll_o20_7_5_r_valid = "1" ELSE redist1_stall_entry_aunroll_o20_7_4_q;

    -- SE_redist1_stall_entry_aunroll_o20_7_4(STALLENABLE,76)
    -- Valid signal propagation
    SE_redist1_stall_entry_aunroll_o20_7_4_V0 <= SE_redist1_stall_entry_aunroll_o20_7_4_R_v_0;
    -- Stall signal propagation
    SE_redist1_stall_entry_aunroll_o20_7_4_s_tv_0 <= SR_SE_redist1_stall_entry_aunroll_o20_7_5_backStall and SE_redist1_stall_entry_aunroll_o20_7_4_R_v_0;
    -- Backward Enable generation
    SE_redist1_stall_entry_aunroll_o20_7_4_backEN <= not (SE_redist1_stall_entry_aunroll_o20_7_4_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_stall_entry_aunroll_o20_7_4_v_s_0 <= SE_redist1_stall_entry_aunroll_o20_7_4_backEN and SE_redist1_stall_entry_aunroll_o20_7_3_V0;
    -- Backward Stall generation
    SE_redist1_stall_entry_aunroll_o20_7_4_backStall <= not (SE_redist1_stall_entry_aunroll_o20_7_4_v_s_0);
    SE_redist1_stall_entry_aunroll_o20_7_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_stall_entry_aunroll_o20_7_4_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o20_7_4_backEN = "0") THEN
                SE_redist1_stall_entry_aunroll_o20_7_4_R_v_0 <= SE_redist1_stall_entry_aunroll_o20_7_4_R_v_0 and SE_redist1_stall_entry_aunroll_o20_7_4_s_tv_0;
            ELSE
                SE_redist1_stall_entry_aunroll_o20_7_4_R_v_0 <= SE_redist1_stall_entry_aunroll_o20_7_4_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist1_stall_entry_aunroll_o20_7_3(STALLENABLE,75)
    -- Valid signal propagation
    SE_redist1_stall_entry_aunroll_o20_7_3_V0 <= SE_redist1_stall_entry_aunroll_o20_7_3_R_v_0;
    -- Stall signal propagation
    SE_redist1_stall_entry_aunroll_o20_7_3_s_tv_0 <= SE_redist1_stall_entry_aunroll_o20_7_4_backStall and SE_redist1_stall_entry_aunroll_o20_7_3_R_v_0;
    -- Backward Enable generation
    SE_redist1_stall_entry_aunroll_o20_7_3_backEN <= not (SE_redist1_stall_entry_aunroll_o20_7_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_stall_entry_aunroll_o20_7_3_v_s_0 <= SE_redist1_stall_entry_aunroll_o20_7_3_backEN and SR_SE_redist1_stall_entry_aunroll_o20_7_3_V;
    -- Backward Stall generation
    SE_redist1_stall_entry_aunroll_o20_7_3_backStall <= not (SE_redist1_stall_entry_aunroll_o20_7_3_backEN);
    SE_redist1_stall_entry_aunroll_o20_7_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_stall_entry_aunroll_o20_7_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o20_7_3_backEN = "0") THEN
                SE_redist1_stall_entry_aunroll_o20_7_3_R_v_0 <= SE_redist1_stall_entry_aunroll_o20_7_3_R_v_0 and SE_redist1_stall_entry_aunroll_o20_7_3_s_tv_0;
            ELSE
                SE_redist1_stall_entry_aunroll_o20_7_3_R_v_0 <= SE_redist1_stall_entry_aunroll_o20_7_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist1_stall_entry_aunroll_o20_7_3(STALLREG,112)
    SR_SE_redist1_stall_entry_aunroll_o20_7_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist1_stall_entry_aunroll_o20_7_3_r_valid <= (others => '0');
            SR_SE_redist1_stall_entry_aunroll_o20_7_3_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist1_stall_entry_aunroll_o20_7_3_r_valid <= SE_redist1_stall_entry_aunroll_o20_7_3_backStall and (SR_SE_redist1_stall_entry_aunroll_o20_7_3_r_valid or SR_SE_redist1_stall_entry_aunroll_o20_7_3_i_valid);

            IF (SR_SE_redist1_stall_entry_aunroll_o20_7_3_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist1_stall_entry_aunroll_o20_7_3_r_data0 <= STD_LOGIC_VECTOR(redist1_stall_entry_aunroll_o20_7_2_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist1_stall_entry_aunroll_o20_7_3_i_valid <= SE_redist1_stall_entry_aunroll_o20_7_2_V0;
    -- Stall signal propagation
    SR_SE_redist1_stall_entry_aunroll_o20_7_3_backStall <= SR_SE_redist1_stall_entry_aunroll_o20_7_3_r_valid or not (SR_SE_redist1_stall_entry_aunroll_o20_7_3_i_valid);

    -- Valid
    SR_SE_redist1_stall_entry_aunroll_o20_7_3_V <= SR_SE_redist1_stall_entry_aunroll_o20_7_3_r_valid WHEN SR_SE_redist1_stall_entry_aunroll_o20_7_3_r_valid = "1" ELSE SR_SE_redist1_stall_entry_aunroll_o20_7_3_i_valid;

    SR_SE_redist1_stall_entry_aunroll_o20_7_3_D0 <= SR_SE_redist1_stall_entry_aunroll_o20_7_3_r_data0 WHEN SR_SE_redist1_stall_entry_aunroll_o20_7_3_r_valid = "1" ELSE redist1_stall_entry_aunroll_o20_7_2_q;

    -- SE_redist1_stall_entry_aunroll_o20_7_2(STALLENABLE,74)
    -- Valid signal propagation
    SE_redist1_stall_entry_aunroll_o20_7_2_V0 <= SE_redist1_stall_entry_aunroll_o20_7_2_R_v_0;
    -- Stall signal propagation
    SE_redist1_stall_entry_aunroll_o20_7_2_s_tv_0 <= SR_SE_redist1_stall_entry_aunroll_o20_7_3_backStall and SE_redist1_stall_entry_aunroll_o20_7_2_R_v_0;
    -- Backward Enable generation
    SE_redist1_stall_entry_aunroll_o20_7_2_backEN <= not (SE_redist1_stall_entry_aunroll_o20_7_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_stall_entry_aunroll_o20_7_2_v_s_0 <= SE_redist1_stall_entry_aunroll_o20_7_2_backEN and SE_redist1_stall_entry_aunroll_o20_7_1_V0;
    -- Backward Stall generation
    SE_redist1_stall_entry_aunroll_o20_7_2_backStall <= not (SE_redist1_stall_entry_aunroll_o20_7_2_v_s_0);
    SE_redist1_stall_entry_aunroll_o20_7_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_stall_entry_aunroll_o20_7_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o20_7_2_backEN = "0") THEN
                SE_redist1_stall_entry_aunroll_o20_7_2_R_v_0 <= SE_redist1_stall_entry_aunroll_o20_7_2_R_v_0 and SE_redist1_stall_entry_aunroll_o20_7_2_s_tv_0;
            ELSE
                SE_redist1_stall_entry_aunroll_o20_7_2_R_v_0 <= SE_redist1_stall_entry_aunroll_o20_7_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist1_stall_entry_aunroll_o20_7_1(STALLENABLE,73)
    -- Valid signal propagation
    SE_redist1_stall_entry_aunroll_o20_7_1_V0 <= SE_redist1_stall_entry_aunroll_o20_7_1_R_v_0;
    -- Stall signal propagation
    SE_redist1_stall_entry_aunroll_o20_7_1_s_tv_0 <= SE_redist1_stall_entry_aunroll_o20_7_2_backStall and SE_redist1_stall_entry_aunroll_o20_7_1_R_v_0;
    -- Backward Enable generation
    SE_redist1_stall_entry_aunroll_o20_7_1_backEN <= not (SE_redist1_stall_entry_aunroll_o20_7_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_stall_entry_aunroll_o20_7_1_v_s_0 <= SE_redist1_stall_entry_aunroll_o20_7_1_backEN and SR_SE_redist1_stall_entry_aunroll_o20_7_1_V;
    -- Backward Stall generation
    SE_redist1_stall_entry_aunroll_o20_7_1_backStall <= not (SE_redist1_stall_entry_aunroll_o20_7_1_backEN);
    SE_redist1_stall_entry_aunroll_o20_7_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_stall_entry_aunroll_o20_7_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o20_7_1_backEN = "0") THEN
                SE_redist1_stall_entry_aunroll_o20_7_1_R_v_0 <= SE_redist1_stall_entry_aunroll_o20_7_1_R_v_0 and SE_redist1_stall_entry_aunroll_o20_7_1_s_tv_0;
            ELSE
                SE_redist1_stall_entry_aunroll_o20_7_1_R_v_0 <= SE_redist1_stall_entry_aunroll_o20_7_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist1_stall_entry_aunroll_o20_7_1(STALLREG,111)
    SR_SE_redist1_stall_entry_aunroll_o20_7_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist1_stall_entry_aunroll_o20_7_1_r_valid <= (others => '0');
            SR_SE_redist1_stall_entry_aunroll_o20_7_1_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist1_stall_entry_aunroll_o20_7_1_r_valid <= SE_redist1_stall_entry_aunroll_o20_7_1_backStall and (SR_SE_redist1_stall_entry_aunroll_o20_7_1_r_valid or SR_SE_redist1_stall_entry_aunroll_o20_7_1_i_valid);

            IF (SR_SE_redist1_stall_entry_aunroll_o20_7_1_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist1_stall_entry_aunroll_o20_7_1_r_data0 <= STD_LOGIC_VECTOR(redist1_stall_entry_aunroll_o20_7_0_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist1_stall_entry_aunroll_o20_7_1_i_valid <= SE_redist1_stall_entry_aunroll_o20_7_0_V0;
    -- Stall signal propagation
    SR_SE_redist1_stall_entry_aunroll_o20_7_1_backStall <= SR_SE_redist1_stall_entry_aunroll_o20_7_1_r_valid or not (SR_SE_redist1_stall_entry_aunroll_o20_7_1_i_valid);

    -- Valid
    SR_SE_redist1_stall_entry_aunroll_o20_7_1_V <= SR_SE_redist1_stall_entry_aunroll_o20_7_1_r_valid WHEN SR_SE_redist1_stall_entry_aunroll_o20_7_1_r_valid = "1" ELSE SR_SE_redist1_stall_entry_aunroll_o20_7_1_i_valid;

    SR_SE_redist1_stall_entry_aunroll_o20_7_1_D0 <= SR_SE_redist1_stall_entry_aunroll_o20_7_1_r_data0 WHEN SR_SE_redist1_stall_entry_aunroll_o20_7_1_r_valid = "1" ELSE redist1_stall_entry_aunroll_o20_7_0_q;

    -- SE_redist1_stall_entry_aunroll_o20_7_0(STALLENABLE,72)
    -- Valid signal propagation
    SE_redist1_stall_entry_aunroll_o20_7_0_V0 <= SE_redist1_stall_entry_aunroll_o20_7_0_R_v_0;
    -- Stall signal propagation
    SE_redist1_stall_entry_aunroll_o20_7_0_s_tv_0 <= SR_SE_redist1_stall_entry_aunroll_o20_7_1_backStall and SE_redist1_stall_entry_aunroll_o20_7_0_R_v_0;
    -- Backward Enable generation
    SE_redist1_stall_entry_aunroll_o20_7_0_backEN <= not (SE_redist1_stall_entry_aunroll_o20_7_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_stall_entry_aunroll_o20_7_0_v_s_0 <= SE_redist1_stall_entry_aunroll_o20_7_0_backEN and SE_stall_entry_aunroll_V0;
    -- Backward Stall generation
    SE_redist1_stall_entry_aunroll_o20_7_0_backStall <= not (SE_redist1_stall_entry_aunroll_o20_7_0_v_s_0);
    SE_redist1_stall_entry_aunroll_o20_7_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_stall_entry_aunroll_o20_7_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o20_7_0_backEN = "0") THEN
                SE_redist1_stall_entry_aunroll_o20_7_0_R_v_0 <= SE_redist1_stall_entry_aunroll_o20_7_0_R_v_0 and SE_redist1_stall_entry_aunroll_o20_7_0_s_tv_0;
            ELSE
                SE_redist1_stall_entry_aunroll_o20_7_0_R_v_0 <= SE_redist1_stall_entry_aunroll_o20_7_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_stall_entry_aunroll(STALLENABLE,68)
    SE_stall_entry_aunroll_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_stall_entry_aunroll_fromReg0 <= (others => '0');
            SE_stall_entry_aunroll_fromReg1 <= (others => '0');
            SE_stall_entry_aunroll_fromReg2 <= (others => '0');
            SE_stall_entry_aunroll_fromReg3 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_stall_entry_aunroll_fromReg0 <= SE_stall_entry_aunroll_toReg0;
            -- Succesor 1
            SE_stall_entry_aunroll_fromReg1 <= SE_stall_entry_aunroll_toReg1;
            -- Succesor 2
            SE_stall_entry_aunroll_fromReg2 <= SE_stall_entry_aunroll_toReg2;
            -- Succesor 3
            SE_stall_entry_aunroll_fromReg3 <= SE_stall_entry_aunroll_toReg3;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_stall_entry_aunroll_consumed0 <= (not (SE_redist1_stall_entry_aunroll_o20_7_0_backStall) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg0;
    SE_stall_entry_aunroll_consumed1 <= (not (redist0_stall_entry_aunroll_o4_9_fifo_stall_out) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg1;
    SE_stall_entry_aunroll_consumed2 <= (not (redist2_stall_entry_aunroll_o21_9_fifo_stall_out) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg2;
    SE_stall_entry_aunroll_consumed3 <= (not (i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_o_stall) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg3;
    -- Consuming
    SE_stall_entry_aunroll_StallValid <= SE_stall_entry_aunroll_backStall and SE_stall_entry_aunroll_wireValid;
    SE_stall_entry_aunroll_toReg0 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed0;
    SE_stall_entry_aunroll_toReg1 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed1;
    SE_stall_entry_aunroll_toReg2 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed2;
    SE_stall_entry_aunroll_toReg3 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed3;
    -- Backward Stall generation
    SE_stall_entry_aunroll_or0 <= SE_stall_entry_aunroll_consumed0;
    SE_stall_entry_aunroll_or1 <= SE_stall_entry_aunroll_consumed1 and SE_stall_entry_aunroll_or0;
    SE_stall_entry_aunroll_or2 <= SE_stall_entry_aunroll_consumed2 and SE_stall_entry_aunroll_or1;
    SE_stall_entry_aunroll_wireStall <= not (SE_stall_entry_aunroll_consumed3 and SE_stall_entry_aunroll_or2);
    SE_stall_entry_aunroll_backStall <= SE_stall_entry_aunroll_wireStall;
    -- Valid signal propagation
    SE_stall_entry_aunroll_V0 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg0);
    SE_stall_entry_aunroll_V1 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg1);
    SE_stall_entry_aunroll_V2 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg2);
    SE_stall_entry_aunroll_V3 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg3);
    -- Computing multiple Valid(s)
    SE_stall_entry_aunroll_wireValid <= in_valid_in;

    -- bubble_join_stall_entry_aunroll(BITJOIN,55)
    bubble_join_stall_entry_aunroll_q <= in_unnamed_conv2d3x33 & in_output_im_addr_11410 & in_output_im_addr_0226 & in_j_1158 & in_i_0234 & in_c1_exe123021 & in_c0_exit22320_2 & in_c0_exe13;

    -- bubble_select_stall_entry_aunroll(BITSELECT,56)
    bubble_select_stall_entry_aunroll_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(63 downto 0));
    bubble_select_stall_entry_aunroll_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(64 downto 64));
    bubble_select_stall_entry_aunroll_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(96 downto 65));
    bubble_select_stall_entry_aunroll_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(128 downto 97));
    bubble_select_stall_entry_aunroll_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(160 downto 129));
    bubble_select_stall_entry_aunroll_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(224 downto 161));
    bubble_select_stall_entry_aunroll_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(288 downto 225));
    bubble_select_stall_entry_aunroll_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(320 downto 289));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x(BLACKBOX,9)@0
    -- in in_i_stall@20000000
    -- out out_c0_exit253_0@7
    -- out out_c0_exit253_1@7
    -- out out_c0_exit253_2@7
    -- out out_c0_exit253_3@7
    -- out out_c0_exit253_4@7
    -- out out_c0_exit253_5@7
    -- out out_c0_exit253_6@7
    -- out out_c0_exit253_7@7
    -- out out_o_stall@20000000
    -- out out_o_valid@7
    thei_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x : i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3
    PORT MAP (
        in_c0_eni7237_0 => GND_q,
        in_c0_eni7237_1 => bubble_select_stall_entry_aunroll_d,
        in_c0_eni7237_2 => bubble_select_stall_entry_aunroll_i,
        in_c0_eni7237_3 => bubble_select_stall_entry_aunroll_h,
        in_c0_eni7237_4 => bubble_select_stall_entry_aunroll_f,
        in_c0_eni7237_5 => bubble_select_stall_entry_aunroll_g,
        in_c0_eni7237_6 => bubble_select_stall_entry_aunroll_e,
        in_c0_eni7237_7 => bubble_select_stall_entry_aunroll_c,
        in_i_stall => SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_backStall,
        in_i_valid => SE_stall_entry_aunroll_V3,
        in_input_channels => in_input_channels,
        in_output_size => in_output_size,
        out_c0_exit253_1 => i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_1,
        out_c0_exit253_2 => i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_2,
        out_c0_exit253_3 => i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3,
        out_c0_exit253_4 => i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_4,
        out_c0_exit253_5 => i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_5,
        out_c0_exit253_6 => i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_6,
        out_c0_exit253_7 => i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_7,
        out_o_stall => i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x(STALLENABLE,65)
    SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_fromReg0 <= (others => '0');
            SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_fromReg0 <= SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_fromReg1 <= SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_consumed0 <= (not (SE_in_i_store_unnamed_conv2d3x35_conv2d3x3_backStall) and SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_fromReg0;
    SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_consumed1 <= (not (SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_backStall) and SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_fromReg1;
    -- Consuming
    SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_StallValid <= SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_backStall and SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_wireValid;
    SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_toReg0 <= SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_StallValid and SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_consumed0;
    SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_toReg1 <= SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_StallValid and SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_consumed1;
    -- Backward Stall generation
    SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_or0 <= SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_consumed0;
    SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_wireStall <= not (SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_consumed1 and SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_or0);
    SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_backStall <= SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_V0 <= SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_fromReg0);
    SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_V1 <= SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_wireValid <= i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_o_valid;

    -- SE_redist1_stall_entry_aunroll_o20_7_6(STALLENABLE,78)
    -- Valid signal propagation
    SE_redist1_stall_entry_aunroll_o20_7_6_V0 <= SE_redist1_stall_entry_aunroll_o20_7_6_R_v_0;
    -- Stall signal propagation
    SE_redist1_stall_entry_aunroll_o20_7_6_s_tv_0 <= SE_in_i_store_unnamed_conv2d3x35_conv2d3x3_backStall and SE_redist1_stall_entry_aunroll_o20_7_6_R_v_0;
    -- Backward Enable generation
    SE_redist1_stall_entry_aunroll_o20_7_6_backEN <= not (SE_redist1_stall_entry_aunroll_o20_7_6_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_stall_entry_aunroll_o20_7_6_v_s_0 <= SE_redist1_stall_entry_aunroll_o20_7_6_backEN and SE_redist1_stall_entry_aunroll_o20_7_5_V0;
    -- Backward Stall generation
    SE_redist1_stall_entry_aunroll_o20_7_6_backStall <= not (SE_redist1_stall_entry_aunroll_o20_7_6_v_s_0);
    SE_redist1_stall_entry_aunroll_o20_7_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_stall_entry_aunroll_o20_7_6_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o20_7_6_backEN = "0") THEN
                SE_redist1_stall_entry_aunroll_o20_7_6_R_v_0 <= SE_redist1_stall_entry_aunroll_o20_7_6_R_v_0 and SE_redist1_stall_entry_aunroll_o20_7_6_s_tv_0;
            ELSE
                SE_redist1_stall_entry_aunroll_o20_7_6_R_v_0 <= SE_redist1_stall_entry_aunroll_o20_7_6_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_in_i_store_unnamed_conv2d3x35_conv2d3x3(STALLENABLE,66)
    -- Valid signal propagation
    SE_in_i_store_unnamed_conv2d3x35_conv2d3x3_V0 <= SE_in_i_store_unnamed_conv2d3x35_conv2d3x3_wireValid;
    -- Backward Stall generation
    SE_in_i_store_unnamed_conv2d3x35_conv2d3x3_backStall <= i_store_unnamed_conv2d3x35_conv2d3x3_out_o_stall or not (SE_in_i_store_unnamed_conv2d3x35_conv2d3x3_wireValid);
    -- Computing multiple Valid(s)
    SE_in_i_store_unnamed_conv2d3x35_conv2d3x3_and0 <= SE_redist1_stall_entry_aunroll_o20_7_6_V0;
    SE_in_i_store_unnamed_conv2d3x35_conv2d3x3_wireValid <= SE_out_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_V0 and SE_in_i_store_unnamed_conv2d3x35_conv2d3x3_and0;

    -- SE_out_redist2_stall_entry_aunroll_o21_9_fifo(STALLENABLE,80)
    -- Valid signal propagation
    SE_out_redist2_stall_entry_aunroll_o21_9_fifo_V0 <= SE_out_redist2_stall_entry_aunroll_o21_9_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist2_stall_entry_aunroll_o21_9_fifo_backStall <= in_stall_in or not (SE_out_redist2_stall_entry_aunroll_o21_9_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist2_stall_entry_aunroll_o21_9_fifo_and0 <= redist2_stall_entry_aunroll_o21_9_fifo_valid_out;
    SE_out_redist2_stall_entry_aunroll_o21_9_fifo_and1 <= redist0_stall_entry_aunroll_o4_9_fifo_valid_out and SE_out_redist2_stall_entry_aunroll_o21_9_fifo_and0;
    SE_out_redist2_stall_entry_aunroll_o21_9_fifo_and2 <= i_store_unnamed_conv2d3x35_conv2d3x3_out_o_valid and SE_out_redist2_stall_entry_aunroll_o21_9_fifo_and1;
    SE_out_redist2_stall_entry_aunroll_o21_9_fifo_wireValid <= SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_V0 and SE_out_redist2_stall_entry_aunroll_o21_9_fifo_and2;

    -- bubble_join_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x(BITJOIN,51)
    bubble_join_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_q <= i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_7 & i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_6 & i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_5 & i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_4 & i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3 & i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_2 & i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_1;

    -- bubble_select_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x(BITSELECT,52)
    bubble_select_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_q(31 downto 0));
    bubble_select_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_q(32 downto 32));
    bubble_select_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_q(64 downto 33));
    bubble_select_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_q(128 downto 65));
    bubble_select_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_q(160 downto 129));
    bubble_select_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_q(224 downto 161));
    bubble_select_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_q(225 downto 225));

    -- redist1_stall_entry_aunroll_o20_7_5(REG,37)
    redist1_stall_entry_aunroll_o20_7_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o20_7_5_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o20_7_5_backEN = "1") THEN
                redist1_stall_entry_aunroll_o20_7_5_q <= STD_LOGIC_VECTOR(SR_SE_redist1_stall_entry_aunroll_o20_7_5_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_aunroll_o20_7_6(REG,38)
    redist1_stall_entry_aunroll_o20_7_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o20_7_6_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o20_7_6_backEN = "1") THEN
                redist1_stall_entry_aunroll_o20_7_6_q <= STD_LOGIC_VECTOR(redist1_stall_entry_aunroll_o20_7_5_q);
            END IF;
        END IF;
    END PROCESS;

    -- i_store_unnamed_conv2d3x35_conv2d3x3(BLACKBOX,15)@7
    -- in in_i_stall@20000000
    -- out out_lsu_unnamed_conv2d3x35_o_active@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@9
    -- out out_unnamed_conv2d3x35_avm_address@20000000
    -- out out_unnamed_conv2d3x35_avm_burstcount@20000000
    -- out out_unnamed_conv2d3x35_avm_byteenable@20000000
    -- out out_unnamed_conv2d3x35_avm_enable@20000000
    -- out out_unnamed_conv2d3x35_avm_read@20000000
    -- out out_unnamed_conv2d3x35_avm_write@20000000
    -- out out_unnamed_conv2d3x35_avm_writedata@20000000
    thei_store_unnamed_conv2d3x35_conv2d3x3 : i_store_unnamed_conv2d3x35_conv2d3x3115
    PORT MAP (
        in_flush => in_flush,
        in_i_address => redist1_stall_entry_aunroll_o20_7_6_q,
        in_i_predicate => bubble_select_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_c,
        in_i_stall => SE_out_redist2_stall_entry_aunroll_o21_9_fifo_backStall,
        in_i_valid => SE_in_i_store_unnamed_conv2d3x35_conv2d3x3_V0,
        in_i_writedata => bubble_select_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_b,
        in_unnamed_conv2d3x35_avm_readdata => in_unnamed_conv2d3x35_avm_readdata,
        in_unnamed_conv2d3x35_avm_readdatavalid => in_unnamed_conv2d3x35_avm_readdatavalid,
        in_unnamed_conv2d3x35_avm_waitrequest => in_unnamed_conv2d3x35_avm_waitrequest,
        in_unnamed_conv2d3x35_avm_writeack => in_unnamed_conv2d3x35_avm_writeack,
        out_lsu_unnamed_conv2d3x35_o_active => i_store_unnamed_conv2d3x35_conv2d3x3_out_lsu_unnamed_conv2d3x35_o_active,
        out_o_stall => i_store_unnamed_conv2d3x35_conv2d3x3_out_o_stall,
        out_o_valid => i_store_unnamed_conv2d3x35_conv2d3x3_out_o_valid,
        out_unnamed_conv2d3x35_avm_address => i_store_unnamed_conv2d3x35_conv2d3x3_out_unnamed_conv2d3x35_avm_address,
        out_unnamed_conv2d3x35_avm_burstcount => i_store_unnamed_conv2d3x35_conv2d3x3_out_unnamed_conv2d3x35_avm_burstcount,
        out_unnamed_conv2d3x35_avm_byteenable => i_store_unnamed_conv2d3x35_conv2d3x3_out_unnamed_conv2d3x35_avm_byteenable,
        out_unnamed_conv2d3x35_avm_enable => i_store_unnamed_conv2d3x35_conv2d3x3_out_unnamed_conv2d3x35_avm_enable,
        out_unnamed_conv2d3x35_avm_read => i_store_unnamed_conv2d3x35_conv2d3x3_out_unnamed_conv2d3x35_avm_read,
        out_unnamed_conv2d3x35_avm_write => i_store_unnamed_conv2d3x35_conv2d3x3_out_unnamed_conv2d3x35_avm_write,
        out_unnamed_conv2d3x35_avm_writedata => i_store_unnamed_conv2d3x35_conv2d3x3_out_unnamed_conv2d3x35_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,3)
    out_lsu_unnamed_conv2d3x35_o_active <= i_store_unnamed_conv2d3x35_conv2d3x3_out_lsu_unnamed_conv2d3x35_o_active;

    -- bubble_join_redist2_stall_entry_aunroll_o21_9_fifo(BITJOIN,62)
    bubble_join_redist2_stall_entry_aunroll_o21_9_fifo_q <= redist2_stall_entry_aunroll_o21_9_fifo_data_out;

    -- bubble_select_redist2_stall_entry_aunroll_o21_9_fifo(BITSELECT,63)
    bubble_select_redist2_stall_entry_aunroll_o21_9_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist2_stall_entry_aunroll_o21_9_fifo_q(31 downto 0));

    -- redist7_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_7_2_0(REG,48)
    redist7_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_7_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_7_2_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_backEN = "1") THEN
                redist7_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_7_2_0_q <= STD_LOGIC_VECTOR(bubble_select_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_h);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_7_2_1(REG,49)
    redist7_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_7_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_7_2_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_backEN = "1") THEN
                redist7_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_7_2_1_q <= STD_LOGIC_VECTOR(redist7_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_7_2_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_6_2_0(REG,46)
    redist6_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_6_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_6_2_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_backEN = "1") THEN
                redist6_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_6_2_0_q <= STD_LOGIC_VECTOR(bubble_select_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_g);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_6_2_1(REG,47)
    redist6_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_6_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_6_2_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_backEN = "1") THEN
                redist6_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_6_2_1_q <= STD_LOGIC_VECTOR(redist6_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_6_2_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_5_2_0(REG,44)
    redist5_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_5_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_5_2_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_backEN = "1") THEN
                redist5_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_5_2_0_q <= STD_LOGIC_VECTOR(bubble_select_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_f);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_5_2_1(REG,45)
    redist5_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_5_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_5_2_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_backEN = "1") THEN
                redist5_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_5_2_1_q <= STD_LOGIC_VECTOR(redist5_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_5_2_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_4_2_0(REG,42)
    redist4_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_4_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_4_2_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_backEN = "1") THEN
                redist4_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_4_2_0_q <= STD_LOGIC_VECTOR(bubble_select_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_e);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_4_2_1(REG,43)
    redist4_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_4_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_4_2_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_backEN = "1") THEN
                redist4_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_4_2_1_q <= STD_LOGIC_VECTOR(redist4_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_4_2_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0(REG,40)
    redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_backEN = "1") THEN
                redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_q <= STD_LOGIC_VECTOR(bubble_select_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_d);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1(REG,41)
    redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_backEN = "1") THEN
                redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_q <= STD_LOGIC_VECTOR(redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_redist0_stall_entry_aunroll_o4_9_fifo(BITJOIN,59)
    bubble_join_redist0_stall_entry_aunroll_o4_9_fifo_q <= redist0_stall_entry_aunroll_o4_9_fifo_data_out;

    -- bubble_select_redist0_stall_entry_aunroll_o4_9_fifo(BITSELECT,60)
    bubble_select_redist0_stall_entry_aunroll_o4_9_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist0_stall_entry_aunroll_o4_9_fifo_q(63 downto 0));

    -- dupName_0_sync_out_x(GPOUT,7)@9
    out_c0_exe13 <= bubble_select_redist0_stall_entry_aunroll_o4_9_fifo_b;
    out_c0_exe3256 <= redist3_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_3_2_1_q;
    out_c0_exe4257 <= redist4_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_4_2_1_q;
    out_c0_exe5258 <= redist5_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_5_2_1_q;
    out_c0_exe6259 <= redist6_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_6_2_1_q;
    out_c0_exe7260 <= redist7_i_sfc_c0_for_end69_loopexit_loopexit_conv2d3x3_c0_enter238_conv2d3x3_aunroll_x_out_c0_exit253_7_2_1_q;
    out_unnamed_conv2d3x33 <= bubble_select_redist2_stall_entry_aunroll_o21_9_fifo_b;
    out_valid_out <= SE_out_redist2_stall_entry_aunroll_o21_9_fifo_V0;

    -- ext_sig_sync_out(GPOUT,14)
    out_unnamed_conv2d3x35_avm_address <= i_store_unnamed_conv2d3x35_conv2d3x3_out_unnamed_conv2d3x35_avm_address;
    out_unnamed_conv2d3x35_avm_enable <= i_store_unnamed_conv2d3x35_conv2d3x3_out_unnamed_conv2d3x35_avm_enable;
    out_unnamed_conv2d3x35_avm_read <= i_store_unnamed_conv2d3x35_conv2d3x3_out_unnamed_conv2d3x35_avm_read;
    out_unnamed_conv2d3x35_avm_write <= i_store_unnamed_conv2d3x35_conv2d3x3_out_unnamed_conv2d3x35_avm_write;
    out_unnamed_conv2d3x35_avm_writedata <= i_store_unnamed_conv2d3x35_conv2d3x3_out_unnamed_conv2d3x35_avm_writedata;
    out_unnamed_conv2d3x35_avm_byteenable <= i_store_unnamed_conv2d3x35_conv2d3x3_out_unnamed_conv2d3x35_avm_byteenable;
    out_unnamed_conv2d3x35_avm_burstcount <= i_store_unnamed_conv2d3x35_conv2d3x3_out_unnamed_conv2d3x35_avm_burstcount;

    -- sync_out(GPOUT,22)@0
    out_stall_out <= SE_stall_entry_aunroll_backStall;

END normal;
