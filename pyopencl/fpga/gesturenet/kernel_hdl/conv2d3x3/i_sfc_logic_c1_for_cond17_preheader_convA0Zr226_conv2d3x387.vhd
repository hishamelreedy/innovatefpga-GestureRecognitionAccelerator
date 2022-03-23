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

-- VHDL created from i_sfc_logic_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3x387
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

entity i_sfc_logic_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3x387 is
    port (
        in_c1_eni6_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni6_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni6_2 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni6_3 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni6_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni6_5 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni6_6 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni6_7 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni6_8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni6_9 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni6_10 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni6_11 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni6_12 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi1228_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi1228_1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3x387;

architecture normal of i_sfc_logic_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3x387 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component floatComponent_i_sfc_logic_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3A0Zcp36cd0oq3cd06oq3cz0 is
        port (
            in_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            out_primWireOut : out std_logic_vector(31 downto 0);  -- Floating Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;




    component floatComponent_i_sfc_logic_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3A0Z16oe0cp36cd0oq3cdj6z is
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
    signal c_float_0_000000e_00_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add63_1_a_conv2d3x3_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add63_2_a_conv2d3x3_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add63_a_conv2d3x3_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul62_1_conv2d3x3_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul62_2_conv2d3x3_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul62_conv2d3x3_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_or_cond2_1_p_conv2d3x3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond2_1_p_conv2d3x3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_or_cond2_2_p_conv2d3x3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond2_2_p_conv2d3x3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_or_cond2_p_conv2d3x3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_cond2_p_conv2d3x3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_mul62_conv2d3x3_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_i_mul62_2_conv2d3x3_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_i_mul62_1_conv2d3x3_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_i_add63_a_conv2d3x3_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_i_add63_1_a_conv2d3x3_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_sync_in_aunroll_x_in_c1_eni6_9_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_sync_in_aunroll_x_in_c1_eni6_11_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_sync_in_aunroll_x_in_c1_eni6_12_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_sync_in_aunroll_x_in_i_valid_53_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_or_cond2_2_p_conv2d3x3_q_31_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_or_cond2_2_p_conv2d3x3_q_31_mem_reset0 : std_logic;
    signal redist0_i_or_cond2_2_p_conv2d3x3_q_31_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_or_cond2_2_p_conv2d3x3_q_31_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist0_i_or_cond2_2_p_conv2d3x3_q_31_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist0_i_or_cond2_2_p_conv2d3x3_q_31_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_or_cond2_2_p_conv2d3x3_q_31_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_or_cond2_2_p_conv2d3x3_q_31_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist0_i_or_cond2_2_p_conv2d3x3_q_31_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist0_i_or_cond2_2_p_conv2d3x3_q_31_rdcnt_i : signal is true;
    signal redist0_i_or_cond2_2_p_conv2d3x3_q_31_rdcnt_eq : std_logic;
    attribute preserve of redist0_i_or_cond2_2_p_conv2d3x3_q_31_rdcnt_eq : signal is true;
    signal redist0_i_or_cond2_2_p_conv2d3x3_q_31_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist0_i_or_cond2_2_p_conv2d3x3_q_31_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist0_i_or_cond2_2_p_conv2d3x3_q_31_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist0_i_or_cond2_2_p_conv2d3x3_q_31_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_or_cond2_2_p_conv2d3x3_q_31_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_or_cond2_2_p_conv2d3x3_q_31_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_or_cond2_2_p_conv2d3x3_q_31_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_or_cond2_2_p_conv2d3x3_q_31_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist0_i_or_cond2_2_p_conv2d3x3_q_31_sticky_ena_q : signal is true;
    signal redist0_i_or_cond2_2_p_conv2d3x3_q_31_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_or_cond2_1_p_conv2d3x3_q_16_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_or_cond2_1_p_conv2d3x3_q_16_mem_reset0 : std_logic;
    signal redist1_i_or_cond2_1_p_conv2d3x3_q_16_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_or_cond2_1_p_conv2d3x3_q_16_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist1_i_or_cond2_1_p_conv2d3x3_q_16_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist1_i_or_cond2_1_p_conv2d3x3_q_16_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_or_cond2_1_p_conv2d3x3_q_16_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_or_cond2_1_p_conv2d3x3_q_16_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist1_i_or_cond2_1_p_conv2d3x3_q_16_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist1_i_or_cond2_1_p_conv2d3x3_q_16_rdcnt_i : signal is true;
    signal redist1_i_or_cond2_1_p_conv2d3x3_q_16_rdcnt_eq : std_logic;
    attribute preserve of redist1_i_or_cond2_1_p_conv2d3x3_q_16_rdcnt_eq : signal is true;
    signal redist1_i_or_cond2_1_p_conv2d3x3_q_16_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist1_i_or_cond2_1_p_conv2d3x3_q_16_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist1_i_or_cond2_1_p_conv2d3x3_q_16_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist1_i_or_cond2_1_p_conv2d3x3_q_16_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_or_cond2_1_p_conv2d3x3_q_16_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_or_cond2_1_p_conv2d3x3_q_16_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_or_cond2_1_p_conv2d3x3_q_16_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_or_cond2_1_p_conv2d3x3_q_16_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist1_i_or_cond2_1_p_conv2d3x3_q_16_sticky_ena_q : signal is true;
    signal redist1_i_or_cond2_1_p_conv2d3x3_q_16_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_sync_in_aunroll_x_in_c1_eni6_10_9_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_sync_in_aunroll_x_in_c1_eni6_10_9_mem_reset0 : std_logic;
    signal redist8_sync_in_aunroll_x_in_c1_eni6_10_9_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_sync_in_aunroll_x_in_c1_eni6_10_9_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist8_sync_in_aunroll_x_in_c1_eni6_10_9_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist8_sync_in_aunroll_x_in_c1_eni6_10_9_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_sync_in_aunroll_x_in_c1_eni6_10_9_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_sync_in_aunroll_x_in_c1_eni6_10_9_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist8_sync_in_aunroll_x_in_c1_eni6_10_9_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist8_sync_in_aunroll_x_in_c1_eni6_10_9_rdcnt_i : signal is true;
    signal redist8_sync_in_aunroll_x_in_c1_eni6_10_9_rdcnt_eq : std_logic;
    attribute preserve of redist8_sync_in_aunroll_x_in_c1_eni6_10_9_rdcnt_eq : signal is true;
    signal redist8_sync_in_aunroll_x_in_c1_eni6_10_9_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist8_sync_in_aunroll_x_in_c1_eni6_10_9_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist8_sync_in_aunroll_x_in_c1_eni6_10_9_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist8_sync_in_aunroll_x_in_c1_eni6_10_9_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_sync_in_aunroll_x_in_c1_eni6_10_9_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_sync_in_aunroll_x_in_c1_eni6_10_9_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_sync_in_aunroll_x_in_c1_eni6_10_9_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_sync_in_aunroll_x_in_c1_eni6_10_9_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist8_sync_in_aunroll_x_in_c1_eni6_10_9_sticky_ena_q : signal is true;
    signal redist8_sync_in_aunroll_x_in_c1_eni6_10_9_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist11_sync_in_aunroll_x_in_i_valid_53(DELAY,26)
    redist11_sync_in_aunroll_x_in_i_valid_53 : dspba_delay
    GENERIC MAP ( width => 1, depth => 53, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist11_sync_in_aunroll_x_in_i_valid_53_q, clk => clock, aclr => resetn );

    -- redist0_i_or_cond2_2_p_conv2d3x3_q_31_notEnable(LOGICAL,34)
    redist0_i_or_cond2_2_p_conv2d3x3_q_31_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist0_i_or_cond2_2_p_conv2d3x3_q_31_nor(LOGICAL,35)
    redist0_i_or_cond2_2_p_conv2d3x3_q_31_nor_q <= not (redist0_i_or_cond2_2_p_conv2d3x3_q_31_notEnable_q or redist0_i_or_cond2_2_p_conv2d3x3_q_31_sticky_ena_q);

    -- redist0_i_or_cond2_2_p_conv2d3x3_q_31_mem_last(CONSTANT,31)
    redist0_i_or_cond2_2_p_conv2d3x3_q_31_mem_last_q <= "011010";

    -- redist0_i_or_cond2_2_p_conv2d3x3_q_31_cmp(LOGICAL,32)
    redist0_i_or_cond2_2_p_conv2d3x3_q_31_cmp_b <= STD_LOGIC_VECTOR("0" & redist0_i_or_cond2_2_p_conv2d3x3_q_31_rdcnt_q);
    redist0_i_or_cond2_2_p_conv2d3x3_q_31_cmp_q <= "1" WHEN redist0_i_or_cond2_2_p_conv2d3x3_q_31_mem_last_q = redist0_i_or_cond2_2_p_conv2d3x3_q_31_cmp_b ELSE "0";

    -- redist0_i_or_cond2_2_p_conv2d3x3_q_31_cmpReg(REG,33)
    redist0_i_or_cond2_2_p_conv2d3x3_q_31_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_or_cond2_2_p_conv2d3x3_q_31_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist0_i_or_cond2_2_p_conv2d3x3_q_31_cmpReg_q <= STD_LOGIC_VECTOR(redist0_i_or_cond2_2_p_conv2d3x3_q_31_cmp_q);
        END IF;
    END PROCESS;

    -- redist0_i_or_cond2_2_p_conv2d3x3_q_31_sticky_ena(REG,36)
    redist0_i_or_cond2_2_p_conv2d3x3_q_31_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_or_cond2_2_p_conv2d3x3_q_31_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist0_i_or_cond2_2_p_conv2d3x3_q_31_nor_q = "1") THEN
                redist0_i_or_cond2_2_p_conv2d3x3_q_31_sticky_ena_q <= STD_LOGIC_VECTOR(redist0_i_or_cond2_2_p_conv2d3x3_q_31_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_i_or_cond2_2_p_conv2d3x3_q_31_enaAnd(LOGICAL,37)
    redist0_i_or_cond2_2_p_conv2d3x3_q_31_enaAnd_q <= redist0_i_or_cond2_2_p_conv2d3x3_q_31_sticky_ena_q and VCC_q;

    -- redist0_i_or_cond2_2_p_conv2d3x3_q_31_rdcnt(COUNTER,29)
    -- low=0, high=27, step=1, init=0
    redist0_i_or_cond2_2_p_conv2d3x3_q_31_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_or_cond2_2_p_conv2d3x3_q_31_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist0_i_or_cond2_2_p_conv2d3x3_q_31_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist0_i_or_cond2_2_p_conv2d3x3_q_31_rdcnt_i = TO_UNSIGNED(26, 5)) THEN
                redist0_i_or_cond2_2_p_conv2d3x3_q_31_rdcnt_eq <= '1';
            ELSE
                redist0_i_or_cond2_2_p_conv2d3x3_q_31_rdcnt_eq <= '0';
            END IF;
            IF (redist0_i_or_cond2_2_p_conv2d3x3_q_31_rdcnt_eq = '1') THEN
                redist0_i_or_cond2_2_p_conv2d3x3_q_31_rdcnt_i <= redist0_i_or_cond2_2_p_conv2d3x3_q_31_rdcnt_i + 5;
            ELSE
                redist0_i_or_cond2_2_p_conv2d3x3_q_31_rdcnt_i <= redist0_i_or_cond2_2_p_conv2d3x3_q_31_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist0_i_or_cond2_2_p_conv2d3x3_q_31_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist0_i_or_cond2_2_p_conv2d3x3_q_31_rdcnt_i, 5)));

    -- i_mul62_2_conv2d3x3(BLACKBOX,10)@141
    -- out out_primWireOut@148
    thei_mul62_2_conv2d3x3 : floatComponent_i_sfc_logic_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3A0Z16oe0cp36cd0oq3cdj6z
    PORT MAP (
        in_0 => in_c1_eni6_3,
        in_1 => in_c1_eni6_7,
        out_primWireOut => i_mul62_2_conv2d3x3_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist3_i_mul62_2_conv2d3x3_out_primWireOut_1(DELAY,18)
    redist3_i_mul62_2_conv2d3x3_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul62_2_conv2d3x3_out_primWireOut, xout => redist3_i_mul62_2_conv2d3x3_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- c_float_0_000000e_00(FLOATCONSTANT,4)
    c_float_0_000000e_00_q <= "00000000000000000000000000000000";

    -- redist10_sync_in_aunroll_x_in_c1_eni6_12_8(DELAY,25)
    redist10_sync_in_aunroll_x_in_c1_eni6_12_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni6_12, xout => redist10_sync_in_aunroll_x_in_c1_eni6_12_8_q, clk => clock, aclr => resetn );

    -- i_or_cond2_2_p_conv2d3x3(MUX,13)@149 + 1
    i_or_cond2_2_p_conv2d3x3_s <= redist10_sync_in_aunroll_x_in_c1_eni6_12_8_q;
    i_or_cond2_2_p_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_or_cond2_2_p_conv2d3x3_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_or_cond2_2_p_conv2d3x3_s) IS
                WHEN "0" => i_or_cond2_2_p_conv2d3x3_q <= c_float_0_000000e_00_q;
                WHEN "1" => i_or_cond2_2_p_conv2d3x3_q <= redist3_i_mul62_2_conv2d3x3_out_primWireOut_1_q;
                WHEN OTHERS => i_or_cond2_2_p_conv2d3x3_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist0_i_or_cond2_2_p_conv2d3x3_q_31_wraddr(REG,30)
    redist0_i_or_cond2_2_p_conv2d3x3_q_31_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_or_cond2_2_p_conv2d3x3_q_31_wraddr_q <= "11011";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist0_i_or_cond2_2_p_conv2d3x3_q_31_wraddr_q <= STD_LOGIC_VECTOR(redist0_i_or_cond2_2_p_conv2d3x3_q_31_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist0_i_or_cond2_2_p_conv2d3x3_q_31_mem(DUALMEM,28)
    redist0_i_or_cond2_2_p_conv2d3x3_q_31_mem_ia <= STD_LOGIC_VECTOR(i_or_cond2_2_p_conv2d3x3_q);
    redist0_i_or_cond2_2_p_conv2d3x3_q_31_mem_aa <= redist0_i_or_cond2_2_p_conv2d3x3_q_31_wraddr_q;
    redist0_i_or_cond2_2_p_conv2d3x3_q_31_mem_ab <= redist0_i_or_cond2_2_p_conv2d3x3_q_31_rdcnt_q;
    redist0_i_or_cond2_2_p_conv2d3x3_q_31_mem_reset0 <= not (resetn);
    redist0_i_or_cond2_2_p_conv2d3x3_q_31_mem_dmem : altera_syncram
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
        clocken1 => redist0_i_or_cond2_2_p_conv2d3x3_q_31_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist0_i_or_cond2_2_p_conv2d3x3_q_31_mem_reset0,
        clock1 => clock,
        address_a => redist0_i_or_cond2_2_p_conv2d3x3_q_31_mem_aa,
        data_a => redist0_i_or_cond2_2_p_conv2d3x3_q_31_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist0_i_or_cond2_2_p_conv2d3x3_q_31_mem_ab,
        q_b => redist0_i_or_cond2_2_p_conv2d3x3_q_31_mem_iq
    );
    redist0_i_or_cond2_2_p_conv2d3x3_q_31_mem_q <= redist0_i_or_cond2_2_p_conv2d3x3_q_31_mem_iq(31 downto 0);

    -- redist0_i_or_cond2_2_p_conv2d3x3_q_31_outputreg(DELAY,27)
    redist0_i_or_cond2_2_p_conv2d3x3_q_31_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist0_i_or_cond2_2_p_conv2d3x3_q_31_mem_q, xout => redist0_i_or_cond2_2_p_conv2d3x3_q_31_outputreg_q, clk => clock, aclr => resetn );

    -- redist1_i_or_cond2_1_p_conv2d3x3_q_16_notEnable(LOGICAL,45)
    redist1_i_or_cond2_1_p_conv2d3x3_q_16_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist1_i_or_cond2_1_p_conv2d3x3_q_16_nor(LOGICAL,46)
    redist1_i_or_cond2_1_p_conv2d3x3_q_16_nor_q <= not (redist1_i_or_cond2_1_p_conv2d3x3_q_16_notEnable_q or redist1_i_or_cond2_1_p_conv2d3x3_q_16_sticky_ena_q);

    -- redist1_i_or_cond2_1_p_conv2d3x3_q_16_mem_last(CONSTANT,42)
    redist1_i_or_cond2_1_p_conv2d3x3_q_16_mem_last_q <= "01011";

    -- redist1_i_or_cond2_1_p_conv2d3x3_q_16_cmp(LOGICAL,43)
    redist1_i_or_cond2_1_p_conv2d3x3_q_16_cmp_b <= STD_LOGIC_VECTOR("0" & redist1_i_or_cond2_1_p_conv2d3x3_q_16_rdcnt_q);
    redist1_i_or_cond2_1_p_conv2d3x3_q_16_cmp_q <= "1" WHEN redist1_i_or_cond2_1_p_conv2d3x3_q_16_mem_last_q = redist1_i_or_cond2_1_p_conv2d3x3_q_16_cmp_b ELSE "0";

    -- redist1_i_or_cond2_1_p_conv2d3x3_q_16_cmpReg(REG,44)
    redist1_i_or_cond2_1_p_conv2d3x3_q_16_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_or_cond2_1_p_conv2d3x3_q_16_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist1_i_or_cond2_1_p_conv2d3x3_q_16_cmpReg_q <= STD_LOGIC_VECTOR(redist1_i_or_cond2_1_p_conv2d3x3_q_16_cmp_q);
        END IF;
    END PROCESS;

    -- redist1_i_or_cond2_1_p_conv2d3x3_q_16_sticky_ena(REG,47)
    redist1_i_or_cond2_1_p_conv2d3x3_q_16_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_or_cond2_1_p_conv2d3x3_q_16_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist1_i_or_cond2_1_p_conv2d3x3_q_16_nor_q = "1") THEN
                redist1_i_or_cond2_1_p_conv2d3x3_q_16_sticky_ena_q <= STD_LOGIC_VECTOR(redist1_i_or_cond2_1_p_conv2d3x3_q_16_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_i_or_cond2_1_p_conv2d3x3_q_16_enaAnd(LOGICAL,48)
    redist1_i_or_cond2_1_p_conv2d3x3_q_16_enaAnd_q <= redist1_i_or_cond2_1_p_conv2d3x3_q_16_sticky_ena_q and VCC_q;

    -- redist1_i_or_cond2_1_p_conv2d3x3_q_16_rdcnt(COUNTER,40)
    -- low=0, high=12, step=1, init=0
    redist1_i_or_cond2_1_p_conv2d3x3_q_16_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_or_cond2_1_p_conv2d3x3_q_16_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist1_i_or_cond2_1_p_conv2d3x3_q_16_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist1_i_or_cond2_1_p_conv2d3x3_q_16_rdcnt_i = TO_UNSIGNED(11, 4)) THEN
                redist1_i_or_cond2_1_p_conv2d3x3_q_16_rdcnt_eq <= '1';
            ELSE
                redist1_i_or_cond2_1_p_conv2d3x3_q_16_rdcnt_eq <= '0';
            END IF;
            IF (redist1_i_or_cond2_1_p_conv2d3x3_q_16_rdcnt_eq = '1') THEN
                redist1_i_or_cond2_1_p_conv2d3x3_q_16_rdcnt_i <= redist1_i_or_cond2_1_p_conv2d3x3_q_16_rdcnt_i + 4;
            ELSE
                redist1_i_or_cond2_1_p_conv2d3x3_q_16_rdcnt_i <= redist1_i_or_cond2_1_p_conv2d3x3_q_16_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist1_i_or_cond2_1_p_conv2d3x3_q_16_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist1_i_or_cond2_1_p_conv2d3x3_q_16_rdcnt_i, 4)));

    -- i_mul62_1_conv2d3x3(BLACKBOX,9)@141
    -- out out_primWireOut@148
    thei_mul62_1_conv2d3x3 : floatComponent_i_sfc_logic_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3A0Z16oe0cp36cd0oq3cdj6z
    PORT MAP (
        in_0 => in_c1_eni6_2,
        in_1 => in_c1_eni6_6,
        out_primWireOut => i_mul62_1_conv2d3x3_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist4_i_mul62_1_conv2d3x3_out_primWireOut_1(DELAY,19)
    redist4_i_mul62_1_conv2d3x3_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul62_1_conv2d3x3_out_primWireOut, xout => redist4_i_mul62_1_conv2d3x3_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist9_sync_in_aunroll_x_in_c1_eni6_11_8(DELAY,24)
    redist9_sync_in_aunroll_x_in_c1_eni6_11_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni6_11, xout => redist9_sync_in_aunroll_x_in_c1_eni6_11_8_q, clk => clock, aclr => resetn );

    -- i_or_cond2_1_p_conv2d3x3(MUX,12)@149 + 1
    i_or_cond2_1_p_conv2d3x3_s <= redist9_sync_in_aunroll_x_in_c1_eni6_11_8_q;
    i_or_cond2_1_p_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_or_cond2_1_p_conv2d3x3_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_or_cond2_1_p_conv2d3x3_s) IS
                WHEN "0" => i_or_cond2_1_p_conv2d3x3_q <= c_float_0_000000e_00_q;
                WHEN "1" => i_or_cond2_1_p_conv2d3x3_q <= redist4_i_mul62_1_conv2d3x3_out_primWireOut_1_q;
                WHEN OTHERS => i_or_cond2_1_p_conv2d3x3_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist1_i_or_cond2_1_p_conv2d3x3_q_16_wraddr(REG,41)
    redist1_i_or_cond2_1_p_conv2d3x3_q_16_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_i_or_cond2_1_p_conv2d3x3_q_16_wraddr_q <= "1100";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist1_i_or_cond2_1_p_conv2d3x3_q_16_wraddr_q <= STD_LOGIC_VECTOR(redist1_i_or_cond2_1_p_conv2d3x3_q_16_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist1_i_or_cond2_1_p_conv2d3x3_q_16_mem(DUALMEM,39)
    redist1_i_or_cond2_1_p_conv2d3x3_q_16_mem_ia <= STD_LOGIC_VECTOR(i_or_cond2_1_p_conv2d3x3_q);
    redist1_i_or_cond2_1_p_conv2d3x3_q_16_mem_aa <= redist1_i_or_cond2_1_p_conv2d3x3_q_16_wraddr_q;
    redist1_i_or_cond2_1_p_conv2d3x3_q_16_mem_ab <= redist1_i_or_cond2_1_p_conv2d3x3_q_16_rdcnt_q;
    redist1_i_or_cond2_1_p_conv2d3x3_q_16_mem_reset0 <= not (resetn);
    redist1_i_or_cond2_1_p_conv2d3x3_q_16_mem_dmem : altera_syncram
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
        clocken1 => redist1_i_or_cond2_1_p_conv2d3x3_q_16_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist1_i_or_cond2_1_p_conv2d3x3_q_16_mem_reset0,
        clock1 => clock,
        address_a => redist1_i_or_cond2_1_p_conv2d3x3_q_16_mem_aa,
        data_a => redist1_i_or_cond2_1_p_conv2d3x3_q_16_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist1_i_or_cond2_1_p_conv2d3x3_q_16_mem_ab,
        q_b => redist1_i_or_cond2_1_p_conv2d3x3_q_16_mem_iq
    );
    redist1_i_or_cond2_1_p_conv2d3x3_q_16_mem_q <= redist1_i_or_cond2_1_p_conv2d3x3_q_16_mem_iq(31 downto 0);

    -- redist1_i_or_cond2_1_p_conv2d3x3_q_16_outputreg(DELAY,38)
    redist1_i_or_cond2_1_p_conv2d3x3_q_16_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist1_i_or_cond2_1_p_conv2d3x3_q_16_mem_q, xout => redist1_i_or_cond2_1_p_conv2d3x3_q_16_outputreg_q, clk => clock, aclr => resetn );

    -- i_mul62_conv2d3x3(BLACKBOX,11)@141
    -- out out_primWireOut@148
    thei_mul62_conv2d3x3 : floatComponent_i_sfc_logic_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3A0Z16oe0cp36cd0oq3cdj6z
    PORT MAP (
        in_0 => in_c1_eni6_1,
        in_1 => in_c1_eni6_5,
        out_primWireOut => i_mul62_conv2d3x3_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist2_i_mul62_conv2d3x3_out_primWireOut_1(DELAY,17)
    redist2_i_mul62_conv2d3x3_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul62_conv2d3x3_out_primWireOut, xout => redist2_i_mul62_conv2d3x3_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist7_sync_in_aunroll_x_in_c1_eni6_9_8(DELAY,22)
    redist7_sync_in_aunroll_x_in_c1_eni6_9_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni6_9, xout => redist7_sync_in_aunroll_x_in_c1_eni6_9_8_q, clk => clock, aclr => resetn );

    -- i_or_cond2_p_conv2d3x3(MUX,14)@149 + 1
    i_or_cond2_p_conv2d3x3_s <= redist7_sync_in_aunroll_x_in_c1_eni6_9_8_q;
    i_or_cond2_p_conv2d3x3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_or_cond2_p_conv2d3x3_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_or_cond2_p_conv2d3x3_s) IS
                WHEN "0" => i_or_cond2_p_conv2d3x3_q <= c_float_0_000000e_00_q;
                WHEN "1" => i_or_cond2_p_conv2d3x3_q <= redist2_i_mul62_conv2d3x3_out_primWireOut_1_q;
                WHEN OTHERS => i_or_cond2_p_conv2d3x3_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist8_sync_in_aunroll_x_in_c1_eni6_10_9_notEnable(LOGICAL,56)
    redist8_sync_in_aunroll_x_in_c1_eni6_10_9_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist8_sync_in_aunroll_x_in_c1_eni6_10_9_nor(LOGICAL,57)
    redist8_sync_in_aunroll_x_in_c1_eni6_10_9_nor_q <= not (redist8_sync_in_aunroll_x_in_c1_eni6_10_9_notEnable_q or redist8_sync_in_aunroll_x_in_c1_eni6_10_9_sticky_ena_q);

    -- redist8_sync_in_aunroll_x_in_c1_eni6_10_9_mem_last(CONSTANT,53)
    redist8_sync_in_aunroll_x_in_c1_eni6_10_9_mem_last_q <= "0101";

    -- redist8_sync_in_aunroll_x_in_c1_eni6_10_9_cmp(LOGICAL,54)
    redist8_sync_in_aunroll_x_in_c1_eni6_10_9_cmp_b <= STD_LOGIC_VECTOR("0" & redist8_sync_in_aunroll_x_in_c1_eni6_10_9_rdcnt_q);
    redist8_sync_in_aunroll_x_in_c1_eni6_10_9_cmp_q <= "1" WHEN redist8_sync_in_aunroll_x_in_c1_eni6_10_9_mem_last_q = redist8_sync_in_aunroll_x_in_c1_eni6_10_9_cmp_b ELSE "0";

    -- redist8_sync_in_aunroll_x_in_c1_eni6_10_9_cmpReg(REG,55)
    redist8_sync_in_aunroll_x_in_c1_eni6_10_9_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_sync_in_aunroll_x_in_c1_eni6_10_9_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist8_sync_in_aunroll_x_in_c1_eni6_10_9_cmpReg_q <= STD_LOGIC_VECTOR(redist8_sync_in_aunroll_x_in_c1_eni6_10_9_cmp_q);
        END IF;
    END PROCESS;

    -- redist8_sync_in_aunroll_x_in_c1_eni6_10_9_sticky_ena(REG,58)
    redist8_sync_in_aunroll_x_in_c1_eni6_10_9_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_sync_in_aunroll_x_in_c1_eni6_10_9_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist8_sync_in_aunroll_x_in_c1_eni6_10_9_nor_q = "1") THEN
                redist8_sync_in_aunroll_x_in_c1_eni6_10_9_sticky_ena_q <= STD_LOGIC_VECTOR(redist8_sync_in_aunroll_x_in_c1_eni6_10_9_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_sync_in_aunroll_x_in_c1_eni6_10_9_enaAnd(LOGICAL,59)
    redist8_sync_in_aunroll_x_in_c1_eni6_10_9_enaAnd_q <= redist8_sync_in_aunroll_x_in_c1_eni6_10_9_sticky_ena_q and VCC_q;

    -- redist8_sync_in_aunroll_x_in_c1_eni6_10_9_rdcnt(COUNTER,51)
    -- low=0, high=6, step=1, init=0
    redist8_sync_in_aunroll_x_in_c1_eni6_10_9_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_sync_in_aunroll_x_in_c1_eni6_10_9_rdcnt_i <= TO_UNSIGNED(0, 3);
            redist8_sync_in_aunroll_x_in_c1_eni6_10_9_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist8_sync_in_aunroll_x_in_c1_eni6_10_9_rdcnt_i = TO_UNSIGNED(5, 3)) THEN
                redist8_sync_in_aunroll_x_in_c1_eni6_10_9_rdcnt_eq <= '1';
            ELSE
                redist8_sync_in_aunroll_x_in_c1_eni6_10_9_rdcnt_eq <= '0';
            END IF;
            IF (redist8_sync_in_aunroll_x_in_c1_eni6_10_9_rdcnt_eq = '1') THEN
                redist8_sync_in_aunroll_x_in_c1_eni6_10_9_rdcnt_i <= redist8_sync_in_aunroll_x_in_c1_eni6_10_9_rdcnt_i + 2;
            ELSE
                redist8_sync_in_aunroll_x_in_c1_eni6_10_9_rdcnt_i <= redist8_sync_in_aunroll_x_in_c1_eni6_10_9_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist8_sync_in_aunroll_x_in_c1_eni6_10_9_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist8_sync_in_aunroll_x_in_c1_eni6_10_9_rdcnt_i, 3)));

    -- redist8_sync_in_aunroll_x_in_c1_eni6_10_9_wraddr(REG,52)
    redist8_sync_in_aunroll_x_in_c1_eni6_10_9_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_sync_in_aunroll_x_in_c1_eni6_10_9_wraddr_q <= "110";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist8_sync_in_aunroll_x_in_c1_eni6_10_9_wraddr_q <= STD_LOGIC_VECTOR(redist8_sync_in_aunroll_x_in_c1_eni6_10_9_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist8_sync_in_aunroll_x_in_c1_eni6_10_9_mem(DUALMEM,50)
    redist8_sync_in_aunroll_x_in_c1_eni6_10_9_mem_ia <= STD_LOGIC_VECTOR(in_c1_eni6_10);
    redist8_sync_in_aunroll_x_in_c1_eni6_10_9_mem_aa <= redist8_sync_in_aunroll_x_in_c1_eni6_10_9_wraddr_q;
    redist8_sync_in_aunroll_x_in_c1_eni6_10_9_mem_ab <= redist8_sync_in_aunroll_x_in_c1_eni6_10_9_rdcnt_q;
    redist8_sync_in_aunroll_x_in_c1_eni6_10_9_mem_reset0 <= not (resetn);
    redist8_sync_in_aunroll_x_in_c1_eni6_10_9_mem_dmem : altera_syncram
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
        clocken1 => redist8_sync_in_aunroll_x_in_c1_eni6_10_9_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist8_sync_in_aunroll_x_in_c1_eni6_10_9_mem_reset0,
        clock1 => clock,
        address_a => redist8_sync_in_aunroll_x_in_c1_eni6_10_9_mem_aa,
        data_a => redist8_sync_in_aunroll_x_in_c1_eni6_10_9_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist8_sync_in_aunroll_x_in_c1_eni6_10_9_mem_ab,
        q_b => redist8_sync_in_aunroll_x_in_c1_eni6_10_9_mem_iq
    );
    redist8_sync_in_aunroll_x_in_c1_eni6_10_9_mem_q <= redist8_sync_in_aunroll_x_in_c1_eni6_10_9_mem_iq(31 downto 0);

    -- redist8_sync_in_aunroll_x_in_c1_eni6_10_9_outputreg(DELAY,49)
    redist8_sync_in_aunroll_x_in_c1_eni6_10_9_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist8_sync_in_aunroll_x_in_c1_eni6_10_9_mem_q, xout => redist8_sync_in_aunroll_x_in_c1_eni6_10_9_outputreg_q, clk => clock, aclr => resetn );

    -- i_add63_a_conv2d3x3(BLACKBOX,8)@150
    -- out out_primWireOut@164
    thei_add63_a_conv2d3x3 : floatComponent_i_sfc_logic_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3A0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => redist8_sync_in_aunroll_x_in_c1_eni6_10_9_outputreg_q,
        in_1 => i_or_cond2_p_conv2d3x3_q,
        out_primWireOut => i_add63_a_conv2d3x3_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist5_i_add63_a_conv2d3x3_out_primWireOut_1(DELAY,20)
    redist5_i_add63_a_conv2d3x3_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add63_a_conv2d3x3_out_primWireOut, xout => redist5_i_add63_a_conv2d3x3_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_add63_1_a_conv2d3x3(BLACKBOX,6)@165
    -- out out_primWireOut@179
    thei_add63_1_a_conv2d3x3 : floatComponent_i_sfc_logic_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3A0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => redist5_i_add63_a_conv2d3x3_out_primWireOut_1_q,
        in_1 => redist1_i_or_cond2_1_p_conv2d3x3_q_16_outputreg_q,
        out_primWireOut => i_add63_1_a_conv2d3x3_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist6_i_add63_1_a_conv2d3x3_out_primWireOut_1(DELAY,21)
    redist6_i_add63_1_a_conv2d3x3_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add63_1_a_conv2d3x3_out_primWireOut, xout => redist6_i_add63_1_a_conv2d3x3_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- i_add63_2_a_conv2d3x3(BLACKBOX,7)@180
    -- out out_primWireOut@194
    thei_add63_2_a_conv2d3x3 : floatComponent_i_sfc_logic_c1_for_cond17_preheader_conv2d3x3_c1_enter226_conv2d3A0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => redist6_i_add63_1_a_conv2d3x3_out_primWireOut_1_q,
        in_1 => redist0_i_or_cond2_2_p_conv2d3x3_q_31_outputreg_q,
        out_primWireOut => i_add63_2_a_conv2d3x3_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,3)@194
    out_c1_exi1228_0 <= GND_q;
    out_c1_exi1228_1 <= i_add63_2_a_conv2d3x3_out_primWireOut;
    out_o_valid <= redist11_sync_in_aunroll_x_in_i_valid_53_q;

END normal;
