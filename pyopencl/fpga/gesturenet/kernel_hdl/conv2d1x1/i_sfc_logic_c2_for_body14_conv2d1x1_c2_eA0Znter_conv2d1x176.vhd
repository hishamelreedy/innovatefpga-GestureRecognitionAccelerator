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

-- VHDL created from i_sfc_logic_c2_for_body14_conv2d1x1_c2_enter_conv2d1x176
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

entity i_sfc_logic_c2_for_body14_conv2d1x1_c2_enter_conv2d1x176 is
    port (
        in_c2_eni5_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_eni5_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c2_eni5_2 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c2_eni5_3 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c2_eni5_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_eni5_5 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c2_eni5_6 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c2_eni5_7 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c2_eni5_8 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exi3_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exi3_1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c2_exi3_2 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c2_exi3_3 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c2_for_body14_conv2d1x1_c2_enter_conv2d1x176;

architecture normal of i_sfc_logic_c2_for_body14_conv2d1x1_c2_enter_conv2d1x176 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component floatComponent_i_sfc_logic_c2_for_body14_conv2d1x1_c2_enter_conv2d1x176_addBlockA0Z3d06o00rf00d06of5q0u is
        port (
            in_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            out_primWireOut : out std_logic_vector(31 downto 0);  -- Floating Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;




    component floatComponent_i_sfc_logic_c2_for_body14_conv2d1x1_c2_enter_conv2d1x176_multBlocA0Zp06o303d06o00rf01pzc is
        port (
            in_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            out_primWireOut : out std_logic_vector(31 downto 0);  -- Floating Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;




    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_add24_1_conv2d1x1_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add24_2_conv2d1x1_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add24_conv2d1x1_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul23_1_conv2d1x1_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul23_2_conv2d1x1_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul23_conv2d1x1_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_mul23_conv2d1x1_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_i_add24_conv2d1x1_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_i_add24_1_conv2d1x1_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_sync_in_aunroll_x_in_i_valid_52_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_mem_reset0 : std_logic;
    signal redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_rdcnt_i : signal is true;
    signal redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_rdcnt_eq : std_logic;
    attribute preserve of redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_rdcnt_eq : signal is true;
    signal redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_sticky_ena_q : signal is true;
    signal redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_mem_reset0 : std_logic;
    signal redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_rdcnt_i : signal is true;
    signal redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_rdcnt_eq : std_logic;
    attribute preserve of redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_rdcnt_eq : signal is true;
    signal redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_sticky_ena_q : signal is true;
    signal redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_add24_conv2d1x1_out_primWireOut_30_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_i_add24_conv2d1x1_out_primWireOut_30_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_i_add24_conv2d1x1_out_primWireOut_30_mem_reset0 : std_logic;
    signal redist4_i_add24_conv2d1x1_out_primWireOut_30_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_i_add24_conv2d1x1_out_primWireOut_30_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist4_i_add24_conv2d1x1_out_primWireOut_30_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist4_i_add24_conv2d1x1_out_primWireOut_30_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_i_add24_conv2d1x1_out_primWireOut_30_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_i_add24_conv2d1x1_out_primWireOut_30_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist4_i_add24_conv2d1x1_out_primWireOut_30_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist4_i_add24_conv2d1x1_out_primWireOut_30_rdcnt_i : signal is true;
    signal redist4_i_add24_conv2d1x1_out_primWireOut_30_rdcnt_eq : std_logic;
    attribute preserve of redist4_i_add24_conv2d1x1_out_primWireOut_30_rdcnt_eq : signal is true;
    signal redist4_i_add24_conv2d1x1_out_primWireOut_30_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist4_i_add24_conv2d1x1_out_primWireOut_30_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist4_i_add24_conv2d1x1_out_primWireOut_30_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist4_i_add24_conv2d1x1_out_primWireOut_30_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_add24_conv2d1x1_out_primWireOut_30_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_add24_conv2d1x1_out_primWireOut_30_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_add24_conv2d1x1_out_primWireOut_30_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_add24_conv2d1x1_out_primWireOut_30_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist4_i_add24_conv2d1x1_out_primWireOut_30_sticky_ena_q : signal is true;
    signal redist4_i_add24_conv2d1x1_out_primWireOut_30_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_add24_1_conv2d1x1_out_primWireOut_15_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_i_add24_1_conv2d1x1_out_primWireOut_15_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_i_add24_1_conv2d1x1_out_primWireOut_15_mem_reset0 : std_logic;
    signal redist6_i_add24_1_conv2d1x1_out_primWireOut_15_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_i_add24_1_conv2d1x1_out_primWireOut_15_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist6_i_add24_1_conv2d1x1_out_primWireOut_15_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist6_i_add24_1_conv2d1x1_out_primWireOut_15_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_i_add24_1_conv2d1x1_out_primWireOut_15_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_i_add24_1_conv2d1x1_out_primWireOut_15_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist6_i_add24_1_conv2d1x1_out_primWireOut_15_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist6_i_add24_1_conv2d1x1_out_primWireOut_15_rdcnt_i : signal is true;
    signal redist6_i_add24_1_conv2d1x1_out_primWireOut_15_rdcnt_eq : std_logic;
    attribute preserve of redist6_i_add24_1_conv2d1x1_out_primWireOut_15_rdcnt_eq : signal is true;
    signal redist6_i_add24_1_conv2d1x1_out_primWireOut_15_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist6_i_add24_1_conv2d1x1_out_primWireOut_15_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist6_i_add24_1_conv2d1x1_out_primWireOut_15_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist6_i_add24_1_conv2d1x1_out_primWireOut_15_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_add24_1_conv2d1x1_out_primWireOut_15_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_add24_1_conv2d1x1_out_primWireOut_15_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_add24_1_conv2d1x1_out_primWireOut_15_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_add24_1_conv2d1x1_out_primWireOut_15_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist6_i_add24_1_conv2d1x1_out_primWireOut_15_sticky_ena_q : signal is true;
    signal redist6_i_add24_1_conv2d1x1_out_primWireOut_15_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_sync_in_aunroll_x_in_c2_eni5_6_8_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_sync_in_aunroll_x_in_c2_eni5_6_8_mem_reset0 : std_logic;
    signal redist7_sync_in_aunroll_x_in_c2_eni5_6_8_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_sync_in_aunroll_x_in_c2_eni5_6_8_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist7_sync_in_aunroll_x_in_c2_eni5_6_8_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist7_sync_in_aunroll_x_in_c2_eni5_6_8_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_sync_in_aunroll_x_in_c2_eni5_6_8_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_sync_in_aunroll_x_in_c2_eni5_6_8_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist7_sync_in_aunroll_x_in_c2_eni5_6_8_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist7_sync_in_aunroll_x_in_c2_eni5_6_8_rdcnt_i : signal is true;
    signal redist7_sync_in_aunroll_x_in_c2_eni5_6_8_rdcnt_eq : std_logic;
    attribute preserve of redist7_sync_in_aunroll_x_in_c2_eni5_6_8_rdcnt_eq : signal is true;
    signal redist7_sync_in_aunroll_x_in_c2_eni5_6_8_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist7_sync_in_aunroll_x_in_c2_eni5_6_8_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist7_sync_in_aunroll_x_in_c2_eni5_6_8_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist7_sync_in_aunroll_x_in_c2_eni5_6_8_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_sync_in_aunroll_x_in_c2_eni5_6_8_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_sync_in_aunroll_x_in_c2_eni5_6_8_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_sync_in_aunroll_x_in_c2_eni5_6_8_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_sync_in_aunroll_x_in_c2_eni5_6_8_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist7_sync_in_aunroll_x_in_c2_eni5_6_8_sticky_ena_q : signal is true;
    signal redist7_sync_in_aunroll_x_in_c2_eni5_6_8_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist8_sync_in_aunroll_x_in_i_valid_52(DELAY,19)
    redist8_sync_in_aunroll_x_in_i_valid_52 : dspba_delay
    GENERIC MAP ( width => 1, depth => 52, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist8_sync_in_aunroll_x_in_i_valid_52_q, clk => clock, aclr => resetn );

    -- redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_notEnable(LOGICAL,28)
    redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_nor(LOGICAL,29)
    redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_nor_q <= not (redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_notEnable_q or redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_sticky_ena_q);

    -- redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_mem_last(CONSTANT,25)
    redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_mem_last_q <= "011010";

    -- redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_cmp(LOGICAL,26)
    redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_cmp_b <= STD_LOGIC_VECTOR("0" & redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_rdcnt_q);
    redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_cmp_q <= "1" WHEN redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_mem_last_q = redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_cmp_b ELSE "0";

    -- redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_cmpReg(REG,27)
    redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_cmpReg_q <= STD_LOGIC_VECTOR(redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_cmp_q);
        END IF;
    END PROCESS;

    -- redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_sticky_ena(REG,30)
    redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_nor_q = "1") THEN
                redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_sticky_ena_q <= STD_LOGIC_VECTOR(redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_enaAnd(LOGICAL,31)
    redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_enaAnd_q <= redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_sticky_ena_q and VCC_q;

    -- redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_rdcnt(COUNTER,23)
    -- low=0, high=27, step=1, init=0
    redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_rdcnt_i = TO_UNSIGNED(26, 5)) THEN
                redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_rdcnt_eq <= '1';
            ELSE
                redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_rdcnt_eq <= '0';
            END IF;
            IF (redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_rdcnt_eq = '1') THEN
                redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_rdcnt_i <= redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_rdcnt_i + 5;
            ELSE
                redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_rdcnt_i <= redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_rdcnt_i, 5)));

    -- i_mul23_2_conv2d1x1(BLACKBOX,9)@141
    -- out out_primWireOut@148
    thei_mul23_2_conv2d1x1 : floatComponent_i_sfc_logic_c2_for_body14_conv2d1x1_c2_enter_conv2d1x176_multBlocA0Zp06o303d06o00rf01pzc
    PORT MAP (
        in_0 => in_c2_eni5_8,
        in_1 => in_c2_eni5_3,
        out_primWireOut => i_mul23_2_conv2d1x1_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_inputreg(DELAY,20)
    redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul23_2_conv2d1x1_out_primWireOut, xout => redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_inputreg_q, clk => clock, aclr => resetn );

    -- redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_wraddr(REG,24)
    redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_wraddr_q <= "11011";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_wraddr_q <= STD_LOGIC_VECTOR(redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_mem(DUALMEM,22)
    redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_mem_ia <= STD_LOGIC_VECTOR(redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_inputreg_q);
    redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_mem_aa <= redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_wraddr_q;
    redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_mem_ab <= redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_rdcnt_q;
    redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_mem_reset0 <= not (resetn);
    redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 5,
        numwords_a => 28,
        width_b => 32,
        widthad_b => 5,
        numwords_b => 28,
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
        clocken1 => redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_mem_reset0,
        clock1 => clock,
        address_a => redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_mem_aa,
        data_a => redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_mem_ab,
        q_b => redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_mem_iq
    );
    redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_mem_q <= redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_mem_iq(31 downto 0);

    -- redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_outputreg(DELAY,21)
    redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_mem_q, xout => redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_outputreg_q, clk => clock, aclr => resetn );

    -- redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_notEnable(LOGICAL,40)
    redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_nor(LOGICAL,41)
    redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_nor_q <= not (redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_notEnable_q or redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_sticky_ena_q);

    -- redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_mem_last(CONSTANT,37)
    redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_mem_last_q <= "01011";

    -- redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_cmp(LOGICAL,38)
    redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_cmp_b <= STD_LOGIC_VECTOR("0" & redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_rdcnt_q);
    redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_cmp_q <= "1" WHEN redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_mem_last_q = redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_cmp_b ELSE "0";

    -- redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_cmpReg(REG,39)
    redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_cmpReg_q <= STD_LOGIC_VECTOR(redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_cmp_q);
        END IF;
    END PROCESS;

    -- redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_sticky_ena(REG,42)
    redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_nor_q = "1") THEN
                redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_sticky_ena_q <= STD_LOGIC_VECTOR(redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_enaAnd(LOGICAL,43)
    redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_enaAnd_q <= redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_sticky_ena_q and VCC_q;

    -- redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_rdcnt(COUNTER,35)
    -- low=0, high=12, step=1, init=0
    redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_rdcnt_i = TO_UNSIGNED(11, 4)) THEN
                redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_rdcnt_eq <= '1';
            ELSE
                redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_rdcnt_eq <= '0';
            END IF;
            IF (redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_rdcnt_eq = '1') THEN
                redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_rdcnt_i <= redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_rdcnt_i + 4;
            ELSE
                redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_rdcnt_i <= redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_rdcnt_i, 4)));

    -- i_mul23_1_conv2d1x1(BLACKBOX,8)@141
    -- out out_primWireOut@148
    thei_mul23_1_conv2d1x1 : floatComponent_i_sfc_logic_c2_for_body14_conv2d1x1_c2_enter_conv2d1x176_multBlocA0Zp06o303d06o00rf01pzc
    PORT MAP (
        in_0 => in_c2_eni5_7,
        in_1 => in_c2_eni5_2,
        out_primWireOut => i_mul23_1_conv2d1x1_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_inputreg(DELAY,32)
    redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul23_1_conv2d1x1_out_primWireOut, xout => redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_inputreg_q, clk => clock, aclr => resetn );

    -- redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_wraddr(REG,36)
    redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_wraddr_q <= "1100";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_wraddr_q <= STD_LOGIC_VECTOR(redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_mem(DUALMEM,34)
    redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_mem_ia <= STD_LOGIC_VECTOR(redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_inputreg_q);
    redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_mem_aa <= redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_wraddr_q;
    redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_mem_ab <= redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_rdcnt_q;
    redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_mem_reset0 <= not (resetn);
    redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 4,
        numwords_a => 13,
        width_b => 32,
        widthad_b => 4,
        numwords_b => 13,
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
        clocken1 => redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_mem_reset0,
        clock1 => clock,
        address_a => redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_mem_aa,
        data_a => redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_mem_ab,
        q_b => redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_mem_iq
    );
    redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_mem_q <= redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_mem_iq(31 downto 0);

    -- redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_outputreg(DELAY,33)
    redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_mem_q, xout => redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_outputreg_q, clk => clock, aclr => resetn );

    -- i_mul23_conv2d1x1(BLACKBOX,10)@141
    -- out out_primWireOut@148
    thei_mul23_conv2d1x1 : floatComponent_i_sfc_logic_c2_for_body14_conv2d1x1_c2_enter_conv2d1x176_multBlocA0Zp06o303d06o00rf01pzc
    PORT MAP (
        in_0 => in_c2_eni5_5,
        in_1 => in_c2_eni5_1,
        out_primWireOut => i_mul23_conv2d1x1_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist0_i_mul23_conv2d1x1_out_primWireOut_1(DELAY,11)
    redist0_i_mul23_conv2d1x1_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul23_conv2d1x1_out_primWireOut, xout => redist0_i_mul23_conv2d1x1_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist7_sync_in_aunroll_x_in_c2_eni5_6_8_notEnable(LOGICAL,75)
    redist7_sync_in_aunroll_x_in_c2_eni5_6_8_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist7_sync_in_aunroll_x_in_c2_eni5_6_8_nor(LOGICAL,76)
    redist7_sync_in_aunroll_x_in_c2_eni5_6_8_nor_q <= not (redist7_sync_in_aunroll_x_in_c2_eni5_6_8_notEnable_q or redist7_sync_in_aunroll_x_in_c2_eni5_6_8_sticky_ena_q);

    -- redist7_sync_in_aunroll_x_in_c2_eni5_6_8_mem_last(CONSTANT,72)
    redist7_sync_in_aunroll_x_in_c2_eni5_6_8_mem_last_q <= "0100";

    -- redist7_sync_in_aunroll_x_in_c2_eni5_6_8_cmp(LOGICAL,73)
    redist7_sync_in_aunroll_x_in_c2_eni5_6_8_cmp_b <= STD_LOGIC_VECTOR("0" & redist7_sync_in_aunroll_x_in_c2_eni5_6_8_rdcnt_q);
    redist7_sync_in_aunroll_x_in_c2_eni5_6_8_cmp_q <= "1" WHEN redist7_sync_in_aunroll_x_in_c2_eni5_6_8_mem_last_q = redist7_sync_in_aunroll_x_in_c2_eni5_6_8_cmp_b ELSE "0";

    -- redist7_sync_in_aunroll_x_in_c2_eni5_6_8_cmpReg(REG,74)
    redist7_sync_in_aunroll_x_in_c2_eni5_6_8_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_sync_in_aunroll_x_in_c2_eni5_6_8_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist7_sync_in_aunroll_x_in_c2_eni5_6_8_cmpReg_q <= STD_LOGIC_VECTOR(redist7_sync_in_aunroll_x_in_c2_eni5_6_8_cmp_q);
        END IF;
    END PROCESS;

    -- redist7_sync_in_aunroll_x_in_c2_eni5_6_8_sticky_ena(REG,77)
    redist7_sync_in_aunroll_x_in_c2_eni5_6_8_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_sync_in_aunroll_x_in_c2_eni5_6_8_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist7_sync_in_aunroll_x_in_c2_eni5_6_8_nor_q = "1") THEN
                redist7_sync_in_aunroll_x_in_c2_eni5_6_8_sticky_ena_q <= STD_LOGIC_VECTOR(redist7_sync_in_aunroll_x_in_c2_eni5_6_8_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_sync_in_aunroll_x_in_c2_eni5_6_8_enaAnd(LOGICAL,78)
    redist7_sync_in_aunroll_x_in_c2_eni5_6_8_enaAnd_q <= redist7_sync_in_aunroll_x_in_c2_eni5_6_8_sticky_ena_q and VCC_q;

    -- redist7_sync_in_aunroll_x_in_c2_eni5_6_8_rdcnt(COUNTER,70)
    -- low=0, high=5, step=1, init=0
    redist7_sync_in_aunroll_x_in_c2_eni5_6_8_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_sync_in_aunroll_x_in_c2_eni5_6_8_rdcnt_i <= TO_UNSIGNED(0, 3);
            redist7_sync_in_aunroll_x_in_c2_eni5_6_8_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist7_sync_in_aunroll_x_in_c2_eni5_6_8_rdcnt_i = TO_UNSIGNED(4, 3)) THEN
                redist7_sync_in_aunroll_x_in_c2_eni5_6_8_rdcnt_eq <= '1';
            ELSE
                redist7_sync_in_aunroll_x_in_c2_eni5_6_8_rdcnt_eq <= '0';
            END IF;
            IF (redist7_sync_in_aunroll_x_in_c2_eni5_6_8_rdcnt_eq = '1') THEN
                redist7_sync_in_aunroll_x_in_c2_eni5_6_8_rdcnt_i <= redist7_sync_in_aunroll_x_in_c2_eni5_6_8_rdcnt_i + 3;
            ELSE
                redist7_sync_in_aunroll_x_in_c2_eni5_6_8_rdcnt_i <= redist7_sync_in_aunroll_x_in_c2_eni5_6_8_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist7_sync_in_aunroll_x_in_c2_eni5_6_8_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist7_sync_in_aunroll_x_in_c2_eni5_6_8_rdcnt_i, 3)));

    -- redist7_sync_in_aunroll_x_in_c2_eni5_6_8_wraddr(REG,71)
    redist7_sync_in_aunroll_x_in_c2_eni5_6_8_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_sync_in_aunroll_x_in_c2_eni5_6_8_wraddr_q <= "101";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist7_sync_in_aunroll_x_in_c2_eni5_6_8_wraddr_q <= STD_LOGIC_VECTOR(redist7_sync_in_aunroll_x_in_c2_eni5_6_8_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist7_sync_in_aunroll_x_in_c2_eni5_6_8_mem(DUALMEM,69)
    redist7_sync_in_aunroll_x_in_c2_eni5_6_8_mem_ia <= STD_LOGIC_VECTOR(in_c2_eni5_6);
    redist7_sync_in_aunroll_x_in_c2_eni5_6_8_mem_aa <= redist7_sync_in_aunroll_x_in_c2_eni5_6_8_wraddr_q;
    redist7_sync_in_aunroll_x_in_c2_eni5_6_8_mem_ab <= redist7_sync_in_aunroll_x_in_c2_eni5_6_8_rdcnt_q;
    redist7_sync_in_aunroll_x_in_c2_eni5_6_8_mem_reset0 <= not (resetn);
    redist7_sync_in_aunroll_x_in_c2_eni5_6_8_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 6,
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
        clocken1 => redist7_sync_in_aunroll_x_in_c2_eni5_6_8_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist7_sync_in_aunroll_x_in_c2_eni5_6_8_mem_reset0,
        clock1 => clock,
        address_a => redist7_sync_in_aunroll_x_in_c2_eni5_6_8_mem_aa,
        data_a => redist7_sync_in_aunroll_x_in_c2_eni5_6_8_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist7_sync_in_aunroll_x_in_c2_eni5_6_8_mem_ab,
        q_b => redist7_sync_in_aunroll_x_in_c2_eni5_6_8_mem_iq
    );
    redist7_sync_in_aunroll_x_in_c2_eni5_6_8_mem_q <= redist7_sync_in_aunroll_x_in_c2_eni5_6_8_mem_iq(31 downto 0);

    -- redist7_sync_in_aunroll_x_in_c2_eni5_6_8_outputreg(DELAY,68)
    redist7_sync_in_aunroll_x_in_c2_eni5_6_8_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist7_sync_in_aunroll_x_in_c2_eni5_6_8_mem_q, xout => redist7_sync_in_aunroll_x_in_c2_eni5_6_8_outputreg_q, clk => clock, aclr => resetn );

    -- i_add24_conv2d1x1(BLACKBOX,7)@149
    -- out out_primWireOut@163
    thei_add24_conv2d1x1 : floatComponent_i_sfc_logic_c2_for_body14_conv2d1x1_c2_enter_conv2d1x176_addBlockA0Z3d06o00rf00d06of5q0u
    PORT MAP (
        in_0 => redist7_sync_in_aunroll_x_in_c2_eni5_6_8_outputreg_q,
        in_1 => redist0_i_mul23_conv2d1x1_out_primWireOut_1_q,
        out_primWireOut => i_add24_conv2d1x1_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist3_i_add24_conv2d1x1_out_primWireOut_1(DELAY,14)
    redist3_i_add24_conv2d1x1_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add24_conv2d1x1_out_primWireOut, xout => redist3_i_add24_conv2d1x1_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_add24_1_conv2d1x1(BLACKBOX,5)@164
    -- out out_primWireOut@178
    thei_add24_1_conv2d1x1 : floatComponent_i_sfc_logic_c2_for_body14_conv2d1x1_c2_enter_conv2d1x176_addBlockA0Z3d06o00rf00d06of5q0u
    PORT MAP (
        in_0 => redist3_i_add24_conv2d1x1_out_primWireOut_1_q,
        in_1 => redist2_i_mul23_1_conv2d1x1_out_primWireOut_16_outputreg_q,
        out_primWireOut => i_add24_1_conv2d1x1_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist5_i_add24_1_conv2d1x1_out_primWireOut_1(DELAY,16)
    redist5_i_add24_1_conv2d1x1_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add24_1_conv2d1x1_out_primWireOut, xout => redist5_i_add24_1_conv2d1x1_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_add24_2_conv2d1x1(BLACKBOX,6)@179
    -- out out_primWireOut@193
    thei_add24_2_conv2d1x1 : floatComponent_i_sfc_logic_c2_for_body14_conv2d1x1_c2_enter_conv2d1x176_addBlockA0Z3d06o00rf00d06of5q0u
    PORT MAP (
        in_0 => redist5_i_add24_1_conv2d1x1_out_primWireOut_1_q,
        in_1 => redist1_i_mul23_2_conv2d1x1_out_primWireOut_31_outputreg_q,
        out_primWireOut => i_add24_2_conv2d1x1_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist6_i_add24_1_conv2d1x1_out_primWireOut_15_notEnable(LOGICAL,64)
    redist6_i_add24_1_conv2d1x1_out_primWireOut_15_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist6_i_add24_1_conv2d1x1_out_primWireOut_15_nor(LOGICAL,65)
    redist6_i_add24_1_conv2d1x1_out_primWireOut_15_nor_q <= not (redist6_i_add24_1_conv2d1x1_out_primWireOut_15_notEnable_q or redist6_i_add24_1_conv2d1x1_out_primWireOut_15_sticky_ena_q);

    -- redist6_i_add24_1_conv2d1x1_out_primWireOut_15_mem_last(CONSTANT,61)
    redist6_i_add24_1_conv2d1x1_out_primWireOut_15_mem_last_q <= "01001";

    -- redist6_i_add24_1_conv2d1x1_out_primWireOut_15_cmp(LOGICAL,62)
    redist6_i_add24_1_conv2d1x1_out_primWireOut_15_cmp_b <= STD_LOGIC_VECTOR("0" & redist6_i_add24_1_conv2d1x1_out_primWireOut_15_rdcnt_q);
    redist6_i_add24_1_conv2d1x1_out_primWireOut_15_cmp_q <= "1" WHEN redist6_i_add24_1_conv2d1x1_out_primWireOut_15_mem_last_q = redist6_i_add24_1_conv2d1x1_out_primWireOut_15_cmp_b ELSE "0";

    -- redist6_i_add24_1_conv2d1x1_out_primWireOut_15_cmpReg(REG,63)
    redist6_i_add24_1_conv2d1x1_out_primWireOut_15_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_i_add24_1_conv2d1x1_out_primWireOut_15_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist6_i_add24_1_conv2d1x1_out_primWireOut_15_cmpReg_q <= STD_LOGIC_VECTOR(redist6_i_add24_1_conv2d1x1_out_primWireOut_15_cmp_q);
        END IF;
    END PROCESS;

    -- redist6_i_add24_1_conv2d1x1_out_primWireOut_15_sticky_ena(REG,66)
    redist6_i_add24_1_conv2d1x1_out_primWireOut_15_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_i_add24_1_conv2d1x1_out_primWireOut_15_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist6_i_add24_1_conv2d1x1_out_primWireOut_15_nor_q = "1") THEN
                redist6_i_add24_1_conv2d1x1_out_primWireOut_15_sticky_ena_q <= STD_LOGIC_VECTOR(redist6_i_add24_1_conv2d1x1_out_primWireOut_15_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_i_add24_1_conv2d1x1_out_primWireOut_15_enaAnd(LOGICAL,67)
    redist6_i_add24_1_conv2d1x1_out_primWireOut_15_enaAnd_q <= redist6_i_add24_1_conv2d1x1_out_primWireOut_15_sticky_ena_q and VCC_q;

    -- redist6_i_add24_1_conv2d1x1_out_primWireOut_15_rdcnt(COUNTER,59)
    -- low=0, high=10, step=1, init=0
    redist6_i_add24_1_conv2d1x1_out_primWireOut_15_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_i_add24_1_conv2d1x1_out_primWireOut_15_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist6_i_add24_1_conv2d1x1_out_primWireOut_15_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist6_i_add24_1_conv2d1x1_out_primWireOut_15_rdcnt_i = TO_UNSIGNED(9, 4)) THEN
                redist6_i_add24_1_conv2d1x1_out_primWireOut_15_rdcnt_eq <= '1';
            ELSE
                redist6_i_add24_1_conv2d1x1_out_primWireOut_15_rdcnt_eq <= '0';
            END IF;
            IF (redist6_i_add24_1_conv2d1x1_out_primWireOut_15_rdcnt_eq = '1') THEN
                redist6_i_add24_1_conv2d1x1_out_primWireOut_15_rdcnt_i <= redist6_i_add24_1_conv2d1x1_out_primWireOut_15_rdcnt_i + 6;
            ELSE
                redist6_i_add24_1_conv2d1x1_out_primWireOut_15_rdcnt_i <= redist6_i_add24_1_conv2d1x1_out_primWireOut_15_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist6_i_add24_1_conv2d1x1_out_primWireOut_15_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist6_i_add24_1_conv2d1x1_out_primWireOut_15_rdcnt_i, 4)));

    -- redist6_i_add24_1_conv2d1x1_out_primWireOut_15_inputreg(DELAY,56)
    redist6_i_add24_1_conv2d1x1_out_primWireOut_15_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist5_i_add24_1_conv2d1x1_out_primWireOut_1_q, xout => redist6_i_add24_1_conv2d1x1_out_primWireOut_15_inputreg_q, clk => clock, aclr => resetn );

    -- redist6_i_add24_1_conv2d1x1_out_primWireOut_15_wraddr(REG,60)
    redist6_i_add24_1_conv2d1x1_out_primWireOut_15_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_i_add24_1_conv2d1x1_out_primWireOut_15_wraddr_q <= "1010";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist6_i_add24_1_conv2d1x1_out_primWireOut_15_wraddr_q <= STD_LOGIC_VECTOR(redist6_i_add24_1_conv2d1x1_out_primWireOut_15_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist6_i_add24_1_conv2d1x1_out_primWireOut_15_mem(DUALMEM,58)
    redist6_i_add24_1_conv2d1x1_out_primWireOut_15_mem_ia <= STD_LOGIC_VECTOR(redist6_i_add24_1_conv2d1x1_out_primWireOut_15_inputreg_q);
    redist6_i_add24_1_conv2d1x1_out_primWireOut_15_mem_aa <= redist6_i_add24_1_conv2d1x1_out_primWireOut_15_wraddr_q;
    redist6_i_add24_1_conv2d1x1_out_primWireOut_15_mem_ab <= redist6_i_add24_1_conv2d1x1_out_primWireOut_15_rdcnt_q;
    redist6_i_add24_1_conv2d1x1_out_primWireOut_15_mem_reset0 <= not (resetn);
    redist6_i_add24_1_conv2d1x1_out_primWireOut_15_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 4,
        numwords_a => 11,
        width_b => 32,
        widthad_b => 4,
        numwords_b => 11,
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
        clocken1 => redist6_i_add24_1_conv2d1x1_out_primWireOut_15_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist6_i_add24_1_conv2d1x1_out_primWireOut_15_mem_reset0,
        clock1 => clock,
        address_a => redist6_i_add24_1_conv2d1x1_out_primWireOut_15_mem_aa,
        data_a => redist6_i_add24_1_conv2d1x1_out_primWireOut_15_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist6_i_add24_1_conv2d1x1_out_primWireOut_15_mem_ab,
        q_b => redist6_i_add24_1_conv2d1x1_out_primWireOut_15_mem_iq
    );
    redist6_i_add24_1_conv2d1x1_out_primWireOut_15_mem_q <= redist6_i_add24_1_conv2d1x1_out_primWireOut_15_mem_iq(31 downto 0);

    -- redist6_i_add24_1_conv2d1x1_out_primWireOut_15_outputreg(DELAY,57)
    redist6_i_add24_1_conv2d1x1_out_primWireOut_15_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist6_i_add24_1_conv2d1x1_out_primWireOut_15_mem_q, xout => redist6_i_add24_1_conv2d1x1_out_primWireOut_15_outputreg_q, clk => clock, aclr => resetn );

    -- redist4_i_add24_conv2d1x1_out_primWireOut_30_notEnable(LOGICAL,52)
    redist4_i_add24_conv2d1x1_out_primWireOut_30_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist4_i_add24_conv2d1x1_out_primWireOut_30_nor(LOGICAL,53)
    redist4_i_add24_conv2d1x1_out_primWireOut_30_nor_q <= not (redist4_i_add24_conv2d1x1_out_primWireOut_30_notEnable_q or redist4_i_add24_conv2d1x1_out_primWireOut_30_sticky_ena_q);

    -- redist4_i_add24_conv2d1x1_out_primWireOut_30_mem_last(CONSTANT,49)
    redist4_i_add24_conv2d1x1_out_primWireOut_30_mem_last_q <= "011000";

    -- redist4_i_add24_conv2d1x1_out_primWireOut_30_cmp(LOGICAL,50)
    redist4_i_add24_conv2d1x1_out_primWireOut_30_cmp_b <= STD_LOGIC_VECTOR("0" & redist4_i_add24_conv2d1x1_out_primWireOut_30_rdcnt_q);
    redist4_i_add24_conv2d1x1_out_primWireOut_30_cmp_q <= "1" WHEN redist4_i_add24_conv2d1x1_out_primWireOut_30_mem_last_q = redist4_i_add24_conv2d1x1_out_primWireOut_30_cmp_b ELSE "0";

    -- redist4_i_add24_conv2d1x1_out_primWireOut_30_cmpReg(REG,51)
    redist4_i_add24_conv2d1x1_out_primWireOut_30_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_i_add24_conv2d1x1_out_primWireOut_30_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist4_i_add24_conv2d1x1_out_primWireOut_30_cmpReg_q <= STD_LOGIC_VECTOR(redist4_i_add24_conv2d1x1_out_primWireOut_30_cmp_q);
        END IF;
    END PROCESS;

    -- redist4_i_add24_conv2d1x1_out_primWireOut_30_sticky_ena(REG,54)
    redist4_i_add24_conv2d1x1_out_primWireOut_30_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_i_add24_conv2d1x1_out_primWireOut_30_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist4_i_add24_conv2d1x1_out_primWireOut_30_nor_q = "1") THEN
                redist4_i_add24_conv2d1x1_out_primWireOut_30_sticky_ena_q <= STD_LOGIC_VECTOR(redist4_i_add24_conv2d1x1_out_primWireOut_30_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_i_add24_conv2d1x1_out_primWireOut_30_enaAnd(LOGICAL,55)
    redist4_i_add24_conv2d1x1_out_primWireOut_30_enaAnd_q <= redist4_i_add24_conv2d1x1_out_primWireOut_30_sticky_ena_q and VCC_q;

    -- redist4_i_add24_conv2d1x1_out_primWireOut_30_rdcnt(COUNTER,47)
    -- low=0, high=25, step=1, init=0
    redist4_i_add24_conv2d1x1_out_primWireOut_30_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_i_add24_conv2d1x1_out_primWireOut_30_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist4_i_add24_conv2d1x1_out_primWireOut_30_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist4_i_add24_conv2d1x1_out_primWireOut_30_rdcnt_i = TO_UNSIGNED(24, 5)) THEN
                redist4_i_add24_conv2d1x1_out_primWireOut_30_rdcnt_eq <= '1';
            ELSE
                redist4_i_add24_conv2d1x1_out_primWireOut_30_rdcnt_eq <= '0';
            END IF;
            IF (redist4_i_add24_conv2d1x1_out_primWireOut_30_rdcnt_eq = '1') THEN
                redist4_i_add24_conv2d1x1_out_primWireOut_30_rdcnt_i <= redist4_i_add24_conv2d1x1_out_primWireOut_30_rdcnt_i + 7;
            ELSE
                redist4_i_add24_conv2d1x1_out_primWireOut_30_rdcnt_i <= redist4_i_add24_conv2d1x1_out_primWireOut_30_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist4_i_add24_conv2d1x1_out_primWireOut_30_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist4_i_add24_conv2d1x1_out_primWireOut_30_rdcnt_i, 5)));

    -- redist4_i_add24_conv2d1x1_out_primWireOut_30_inputreg(DELAY,44)
    redist4_i_add24_conv2d1x1_out_primWireOut_30_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist3_i_add24_conv2d1x1_out_primWireOut_1_q, xout => redist4_i_add24_conv2d1x1_out_primWireOut_30_inputreg_q, clk => clock, aclr => resetn );

    -- redist4_i_add24_conv2d1x1_out_primWireOut_30_wraddr(REG,48)
    redist4_i_add24_conv2d1x1_out_primWireOut_30_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_i_add24_conv2d1x1_out_primWireOut_30_wraddr_q <= "11001";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist4_i_add24_conv2d1x1_out_primWireOut_30_wraddr_q <= STD_LOGIC_VECTOR(redist4_i_add24_conv2d1x1_out_primWireOut_30_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist4_i_add24_conv2d1x1_out_primWireOut_30_mem(DUALMEM,46)
    redist4_i_add24_conv2d1x1_out_primWireOut_30_mem_ia <= STD_LOGIC_VECTOR(redist4_i_add24_conv2d1x1_out_primWireOut_30_inputreg_q);
    redist4_i_add24_conv2d1x1_out_primWireOut_30_mem_aa <= redist4_i_add24_conv2d1x1_out_primWireOut_30_wraddr_q;
    redist4_i_add24_conv2d1x1_out_primWireOut_30_mem_ab <= redist4_i_add24_conv2d1x1_out_primWireOut_30_rdcnt_q;
    redist4_i_add24_conv2d1x1_out_primWireOut_30_mem_reset0 <= not (resetn);
    redist4_i_add24_conv2d1x1_out_primWireOut_30_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 5,
        numwords_a => 26,
        width_b => 32,
        widthad_b => 5,
        numwords_b => 26,
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
        clocken1 => redist4_i_add24_conv2d1x1_out_primWireOut_30_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist4_i_add24_conv2d1x1_out_primWireOut_30_mem_reset0,
        clock1 => clock,
        address_a => redist4_i_add24_conv2d1x1_out_primWireOut_30_mem_aa,
        data_a => redist4_i_add24_conv2d1x1_out_primWireOut_30_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist4_i_add24_conv2d1x1_out_primWireOut_30_mem_ab,
        q_b => redist4_i_add24_conv2d1x1_out_primWireOut_30_mem_iq
    );
    redist4_i_add24_conv2d1x1_out_primWireOut_30_mem_q <= redist4_i_add24_conv2d1x1_out_primWireOut_30_mem_iq(31 downto 0);

    -- redist4_i_add24_conv2d1x1_out_primWireOut_30_outputreg(DELAY,45)
    redist4_i_add24_conv2d1x1_out_primWireOut_30_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist4_i_add24_conv2d1x1_out_primWireOut_30_mem_q, xout => redist4_i_add24_conv2d1x1_out_primWireOut_30_outputreg_q, clk => clock, aclr => resetn );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,3)@193
    out_c2_exi3_0 <= GND_q;
    out_c2_exi3_1 <= redist4_i_add24_conv2d1x1_out_primWireOut_30_outputreg_q;
    out_c2_exi3_2 <= redist6_i_add24_1_conv2d1x1_out_primWireOut_15_outputreg_q;
    out_c2_exi3_3 <= i_add24_2_conv2d1x1_out_primWireOut;
    out_o_valid <= redist8_sync_in_aunroll_x_in_i_valid_52_q;

END normal;
