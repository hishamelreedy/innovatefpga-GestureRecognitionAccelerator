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

-- VHDL created from conv2d3x3_B2_branch
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

entity conv2d3x3_B2_branch is
    port (
        in_c0_exit223_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit223_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit223_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit223_3 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exit223_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit223_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit223_6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit223_7 : in std_logic_vector(2 downto 0);  -- ufix3
        in_c0_exit223_8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit223_9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit223_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe11 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe121212 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe7 : in std_logic_vector(2 downto 0);  -- ufix3
        in_c0_exe8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe121813 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe1230 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_exe214 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe315 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe416 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe517 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe618 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe719 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_0235 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_1159 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im_addr_0227 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_11411 : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d3x32 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit223_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit223_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit223_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit223_3 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit223_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit223_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit223_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit223_7 : out std_logic_vector(2 downto 0);  -- ufix3
        out_c0_exit223_8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit223_9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit223_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe121212 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe7 : out std_logic_vector(2 downto 0);  -- ufix3
        out_c0_exe8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe121813 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe1230 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c1_exe214 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe315 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe416 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe517 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe618 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe719 : out std_logic_vector(0 downto 0);  -- ufix1
        out_i_0235 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_1159 : out std_logic_vector(31 downto 0);  -- ufix32
        out_output_im_addr_0227 : out std_logic_vector(63 downto 0);  -- ufix64
        out_output_im_addr_11411 : out std_logic_vector(63 downto 0);  -- ufix64
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d3x32 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end conv2d3x3_B2_branch;

architecture normal of conv2d3x3_B2_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit223_reg_0_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit223_reg_1_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit223_reg_2_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit223_reg_3_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exit223_reg_4_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit223_reg_5_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit223_reg_6_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit223_reg_7_x_q : STD_LOGIC_VECTOR (2 downto 0);
    signal c0_exit223_reg_8_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit223_reg_9_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit223_reg_10_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe10_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe11_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe121212_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe7_reg_q : STD_LOGIC_VECTOR (2 downto 0);
    signal c0_exe8_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe9_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe121813_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe1230_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe214_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe315_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe416_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe517_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe618_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe719_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d3x3_B2_branch_enable_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_0235_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal j_1159_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal not_stall_in_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_in_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal output_im_addr_0227_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal output_im_addr_11411_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal unnamed_conv2d3x32_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal valid_0_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_1_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_0_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_1_and_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_in_1(LOGICAL,97)
    not_stall_in_1_q <= not (in_stall_in_1);

    -- c0_exe10_cmp(LOGICAL,78)
    c0_exe10_cmp_q <= not (in_c0_exe10);

    -- valid_out_1_and(LOGICAL,108)
    valid_out_1_and_q <= in_valid_in and c0_exe10_cmp_q;

    -- valid_1_reg(REG,106)
    valid_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_1_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                valid_1_reg_q <= valid_out_1_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_1(LOGICAL,99)
    not_valid_1_q <= not (valid_1_reg_q);

    -- not_valid_or_not_stall_1(LOGICAL,101)
    not_valid_or_not_stall_1_q <= not_valid_1_q or not_stall_in_1_q;

    -- not_stall_in_0(LOGICAL,96)
    not_stall_in_0_q <= not (in_stall_in_0);

    -- valid_out_0_and(LOGICAL,107)
    valid_out_0_and_q <= in_valid_in and in_c0_exe10;

    -- valid_0_reg(REG,105)
    valid_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_0_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                valid_0_reg_q <= valid_out_0_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_0(LOGICAL,98)
    not_valid_0_q <= not (valid_0_reg_q);

    -- not_valid_or_not_stall_0(LOGICAL,100)
    not_valid_or_not_stall_0_q <= not_valid_0_q or not_stall_in_0_q;

    -- conv2d3x3_B2_branch_enable(LOGICAL,92)
    conv2d3x3_B2_branch_enable_q <= not_valid_or_not_stall_0_q and not_valid_or_not_stall_1_q;

    -- c0_exit223_reg_0_x(REG,2)
    c0_exit223_reg_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit223_reg_0_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exit223_reg_0_x_q <= in_c0_exit223_0;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit223_0(GPOUT,46)
    out_c0_exit223_0 <= c0_exit223_reg_0_x_q;

    -- c0_exit223_reg_1_x(REG,3)
    c0_exit223_reg_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit223_reg_1_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exit223_reg_1_x_q <= in_c0_exit223_1;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit223_1(GPOUT,47)
    out_c0_exit223_1 <= c0_exit223_reg_1_x_q;

    -- c0_exit223_reg_2_x(REG,4)
    c0_exit223_reg_2_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit223_reg_2_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exit223_reg_2_x_q <= in_c0_exit223_2;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit223_2(GPOUT,48)
    out_c0_exit223_2 <= c0_exit223_reg_2_x_q;

    -- c0_exit223_reg_3_x(REG,5)
    c0_exit223_reg_3_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit223_reg_3_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exit223_reg_3_x_q <= in_c0_exit223_3;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit223_3(GPOUT,49)
    out_c0_exit223_3 <= c0_exit223_reg_3_x_q;

    -- c0_exit223_reg_4_x(REG,6)
    c0_exit223_reg_4_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit223_reg_4_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exit223_reg_4_x_q <= in_c0_exit223_4;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit223_4(GPOUT,50)
    out_c0_exit223_4 <= c0_exit223_reg_4_x_q;

    -- c0_exit223_reg_5_x(REG,7)
    c0_exit223_reg_5_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit223_reg_5_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exit223_reg_5_x_q <= in_c0_exit223_5;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit223_5(GPOUT,51)
    out_c0_exit223_5 <= c0_exit223_reg_5_x_q;

    -- c0_exit223_reg_6_x(REG,8)
    c0_exit223_reg_6_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit223_reg_6_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exit223_reg_6_x_q <= in_c0_exit223_6;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit223_6(GPOUT,52)
    out_c0_exit223_6 <= c0_exit223_reg_6_x_q;

    -- c0_exit223_reg_7_x(REG,9)
    c0_exit223_reg_7_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit223_reg_7_x_q <= "000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exit223_reg_7_x_q <= in_c0_exit223_7;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit223_7(GPOUT,53)
    out_c0_exit223_7 <= c0_exit223_reg_7_x_q;

    -- c0_exit223_reg_8_x(REG,10)
    c0_exit223_reg_8_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit223_reg_8_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exit223_reg_8_x_q <= in_c0_exit223_8;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit223_8(GPOUT,54)
    out_c0_exit223_8 <= c0_exit223_reg_8_x_q;

    -- c0_exit223_reg_9_x(REG,11)
    c0_exit223_reg_9_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit223_reg_9_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exit223_reg_9_x_q <= in_c0_exit223_9;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit223_9(GPOUT,55)
    out_c0_exit223_9 <= c0_exit223_reg_9_x_q;

    -- c0_exit223_reg_10_x(REG,12)
    c0_exit223_reg_10_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit223_reg_10_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exit223_reg_10_x_q <= in_c0_exit223_10;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit223_10(GPOUT,56)
    out_c0_exit223_10 <= c0_exit223_reg_10_x_q;

    -- c0_exe11_reg(REG,79)
    c0_exe11_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe11_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exe11_reg_q <= in_c0_exe11;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe11(GPOUT,57)
    out_c0_exe11 <= c0_exe11_reg_q;

    -- c0_exe121212_reg(REG,80)
    c0_exe121212_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe121212_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exe121212_reg_q <= in_c0_exe121212;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe121212(GPOUT,58)
    out_c0_exe121212 <= c0_exe121212_reg_q;

    -- c0_exe7_reg(REG,81)
    c0_exe7_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe7_reg_q <= "000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exe7_reg_q <= in_c0_exe7;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe7(GPOUT,59)
    out_c0_exe7 <= c0_exe7_reg_q;

    -- c0_exe8_reg(REG,82)
    c0_exe8_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe8_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exe8_reg_q <= in_c0_exe8;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe8(GPOUT,60)
    out_c0_exe8 <= c0_exe8_reg_q;

    -- c0_exe9_reg(REG,83)
    c0_exe9_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe9_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c0_exe9_reg_q <= in_c0_exe9;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe9(GPOUT,61)
    out_c0_exe9 <= c0_exe9_reg_q;

    -- c1_exe121813_reg(REG,84)
    c1_exe121813_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe121813_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c1_exe121813_reg_q <= in_c1_exe121813;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe121813(GPOUT,62)
    out_c1_exe121813 <= c1_exe121813_reg_q;

    -- c1_exe1230_reg(REG,85)
    c1_exe1230_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe1230_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c1_exe1230_reg_q <= STD_LOGIC_VECTOR(in_c1_exe1230);
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe1230(GPOUT,63)
    out_c1_exe1230 <= c1_exe1230_reg_q;

    -- c1_exe214_reg(REG,86)
    c1_exe214_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe214_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c1_exe214_reg_q <= in_c1_exe214;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe214(GPOUT,64)
    out_c1_exe214 <= c1_exe214_reg_q;

    -- c1_exe315_reg(REG,87)
    c1_exe315_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe315_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c1_exe315_reg_q <= in_c1_exe315;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe315(GPOUT,65)
    out_c1_exe315 <= c1_exe315_reg_q;

    -- c1_exe416_reg(REG,88)
    c1_exe416_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe416_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c1_exe416_reg_q <= in_c1_exe416;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe416(GPOUT,66)
    out_c1_exe416 <= c1_exe416_reg_q;

    -- c1_exe517_reg(REG,89)
    c1_exe517_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe517_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c1_exe517_reg_q <= in_c1_exe517;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe517(GPOUT,67)
    out_c1_exe517 <= c1_exe517_reg_q;

    -- c1_exe618_reg(REG,90)
    c1_exe618_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe618_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c1_exe618_reg_q <= in_c1_exe618;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe618(GPOUT,68)
    out_c1_exe618 <= c1_exe618_reg_q;

    -- c1_exe719_reg(REG,91)
    c1_exe719_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe719_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                c1_exe719_reg_q <= in_c1_exe719;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe719(GPOUT,69)
    out_c1_exe719 <= c1_exe719_reg_q;

    -- i_0235_reg(REG,94)
    i_0235_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_0235_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                i_0235_reg_q <= in_i_0235;
            END IF;
        END IF;
    END PROCESS;

    -- out_i_0235(GPOUT,70)
    out_i_0235 <= i_0235_reg_q;

    -- j_1159_reg(REG,95)
    j_1159_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            j_1159_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                j_1159_reg_q <= in_j_1159;
            END IF;
        END IF;
    END PROCESS;

    -- out_j_1159(GPOUT,71)
    out_j_1159 <= j_1159_reg_q;

    -- output_im_addr_0227_reg(REG,102)
    output_im_addr_0227_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            output_im_addr_0227_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                output_im_addr_0227_reg_q <= in_output_im_addr_0227;
            END IF;
        END IF;
    END PROCESS;

    -- out_output_im_addr_0227(GPOUT,72)
    out_output_im_addr_0227 <= output_im_addr_0227_reg_q;

    -- output_im_addr_11411_reg(REG,103)
    output_im_addr_11411_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            output_im_addr_11411_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                output_im_addr_11411_reg_q <= in_output_im_addr_11411;
            END IF;
        END IF;
    END PROCESS;

    -- out_output_im_addr_11411(GPOUT,73)
    out_output_im_addr_11411 <= output_im_addr_11411_reg_q;

    -- conv2d3x3_B2_branch_enable_not(LOGICAL,93)
    conv2d3x3_B2_branch_enable_not_q <= not (conv2d3x3_B2_branch_enable_q);

    -- out_stall_out(GPOUT,74)
    out_stall_out <= conv2d3x3_B2_branch_enable_not_q;

    -- unnamed_conv2d3x32_reg(REG,104)
    unnamed_conv2d3x32_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            unnamed_conv2d3x32_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d3x3_B2_branch_enable_q = "1") THEN
                unnamed_conv2d3x32_reg_q <= STD_LOGIC_VECTOR(in_unnamed_conv2d3x32);
            END IF;
        END IF;
    END PROCESS;

    -- out_unnamed_conv2d3x32(GPOUT,75)
    out_unnamed_conv2d3x32 <= unnamed_conv2d3x32_reg_q;

    -- out_valid_out_0(GPOUT,76)
    out_valid_out_0 <= valid_0_reg_q;

    -- out_valid_out_1(GPOUT,77)
    out_valid_out_1 <= valid_1_reg_q;

END normal;
