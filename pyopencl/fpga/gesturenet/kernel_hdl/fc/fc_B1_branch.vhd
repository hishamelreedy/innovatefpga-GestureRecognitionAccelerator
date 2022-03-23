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

-- VHDL created from fc_B1_branch
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

entity fc_B1_branch is
    port (
        in_c0_exe11 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_exe2 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_for_end20_loopexit_loopexit_LC_COND : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_06_LC_OuterPHI : in std_logic_vector(31 downto 0);  -- ufix32
        in_idxprom3 : in std_logic_vector(63 downto 0);  -- ufix64
        in_j_13_LC_InnerPHI : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c1_exe2 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_i_06_LC_OuterPHI : out std_logic_vector(31 downto 0);  -- ufix32
        out_idxprom3 : out std_logic_vector(63 downto 0);  -- ufix64
        out_j_13_LC_InnerPHI : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end fc_B1_branch;

architecture normal of fc_B1_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe11_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c1_exe1_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe2_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_B1_branch_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_B1_branch_enable_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal for_end20_loopexit_loopexit_LC_COND_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_06_LC_OuterPHI_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal idxprom3_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal j_13_LC_InnerPHI_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal not_stall_in_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_in_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_fc1_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal valid_0_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_1_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_0_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_1_and_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_in_1(LOGICAL,23)
    not_stall_in_1_q <= not (in_stall_in_1);

    -- for_end20_loopexit_loopexit_LC_COND_cmp(LOGICAL,7)
    for_end20_loopexit_loopexit_LC_COND_cmp_q <= not (in_for_end20_loopexit_loopexit_LC_COND);

    -- valid_out_1_and(LOGICAL,42)
    valid_out_1_and_q <= in_valid_in and for_end20_loopexit_loopexit_LC_COND_cmp_q;

    -- valid_1_reg(REG,40)
    valid_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_1_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (fc_B1_branch_enable_q = "1") THEN
                valid_1_reg_q <= valid_out_1_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_1(LOGICAL,25)
    not_valid_1_q <= not (valid_1_reg_q);

    -- not_valid_or_not_stall_1(LOGICAL,27)
    not_valid_or_not_stall_1_q <= not_valid_1_q or not_stall_in_1_q;

    -- not_stall_in_0(LOGICAL,22)
    not_stall_in_0_q <= not (in_stall_in_0);

    -- valid_out_0_and(LOGICAL,41)
    valid_out_0_and_q <= in_valid_in and in_for_end20_loopexit_loopexit_LC_COND;

    -- valid_0_reg(REG,39)
    valid_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_0_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (fc_B1_branch_enable_q = "1") THEN
                valid_0_reg_q <= valid_out_0_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_0(LOGICAL,24)
    not_valid_0_q <= not (valid_0_reg_q);

    -- not_valid_or_not_stall_0(LOGICAL,26)
    not_valid_or_not_stall_0_q <= not_valid_0_q or not_stall_in_0_q;

    -- fc_B1_branch_enable(LOGICAL,5)
    fc_B1_branch_enable_q <= not_valid_or_not_stall_0_q and not_valid_or_not_stall_1_q;

    -- c0_exe11_reg(REG,2)
    c0_exe11_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe11_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (fc_B1_branch_enable_q = "1") THEN
                c0_exe11_reg_q <= in_c0_exe11;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe11(GPOUT,28)
    out_c0_exe11 <= c0_exe11_reg_q;

    -- c1_exe1_reg(REG,3)
    c1_exe1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe1_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (fc_B1_branch_enable_q = "1") THEN
                c1_exe1_reg_q <= STD_LOGIC_VECTOR(in_c1_exe1);
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe1(GPOUT,29)
    out_c1_exe1 <= c1_exe1_reg_q;

    -- c1_exe2_reg(REG,4)
    c1_exe2_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe2_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (fc_B1_branch_enable_q = "1") THEN
                c1_exe2_reg_q <= STD_LOGIC_VECTOR(in_c1_exe2);
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe2(GPOUT,30)
    out_c1_exe2 <= c1_exe2_reg_q;

    -- i_06_LC_OuterPHI_reg(REG,8)
    i_06_LC_OuterPHI_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_06_LC_OuterPHI_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (fc_B1_branch_enable_q = "1") THEN
                i_06_LC_OuterPHI_reg_q <= in_i_06_LC_OuterPHI;
            END IF;
        END IF;
    END PROCESS;

    -- out_i_06_LC_OuterPHI(GPOUT,31)
    out_i_06_LC_OuterPHI <= i_06_LC_OuterPHI_reg_q;

    -- idxprom3_reg(REG,9)
    idxprom3_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            idxprom3_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (fc_B1_branch_enable_q = "1") THEN
                idxprom3_reg_q <= in_idxprom3;
            END IF;
        END IF;
    END PROCESS;

    -- out_idxprom3(GPOUT,32)
    out_idxprom3 <= idxprom3_reg_q;

    -- j_13_LC_InnerPHI_reg(REG,21)
    j_13_LC_InnerPHI_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            j_13_LC_InnerPHI_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (fc_B1_branch_enable_q = "1") THEN
                j_13_LC_InnerPHI_reg_q <= in_j_13_LC_InnerPHI;
            END IF;
        END IF;
    END PROCESS;

    -- out_j_13_LC_InnerPHI(GPOUT,33)
    out_j_13_LC_InnerPHI <= j_13_LC_InnerPHI_reg_q;

    -- fc_B1_branch_enable_not(LOGICAL,6)
    fc_B1_branch_enable_not_q <= not (fc_B1_branch_enable_q);

    -- out_stall_out(GPOUT,34)
    out_stall_out <= fc_B1_branch_enable_not_q;

    -- unnamed_fc1_reg(REG,38)
    unnamed_fc1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            unnamed_fc1_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (fc_B1_branch_enable_q = "1") THEN
                unnamed_fc1_reg_q <= STD_LOGIC_VECTOR(in_unnamed_fc1);
            END IF;
        END IF;
    END PROCESS;

    -- out_unnamed_fc1(GPOUT,35)
    out_unnamed_fc1 <= unnamed_fc1_reg_q;

    -- out_valid_out_0(GPOUT,36)
    out_valid_out_0 <= valid_0_reg_q;

    -- out_valid_out_1(GPOUT,37)
    out_valid_out_1 <= valid_1_reg_q;

END normal;
