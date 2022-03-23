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

-- VHDL created from avgpool2d_B1_branch
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

entity avgpool2d_B1_branch is
    port (
        in_c0_exe12 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe17 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_exe23 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe35 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe46 : in std_logic_vector(0 downto 0);  -- ufix1
        in_exitcond_GUARD : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv : in std_logic_vector(32 downto 0);  -- ufix33
        in_global_id_09 : in std_logic_vector(31 downto 0);  -- ufix32
        in_inc : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe17 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c0_exe23 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe35 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe46 : out std_logic_vector(0 downto 0);  -- ufix1
        out_fpgaindvars_iv : out std_logic_vector(32 downto 0);  -- ufix33
        out_global_id_09 : out std_logic_vector(31 downto 0);  -- ufix32
        out_inc : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end avgpool2d_B1_branch;

architecture normal of avgpool2d_B1_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal avgpool2d_B1_branch_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal avgpool2d_B1_branch_enable_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe12_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe17_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe23_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe35_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe46_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exitcond_GUARD_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fpgaindvars_iv_reg_q : STD_LOGIC_VECTOR (32 downto 0);
    signal global_id_09_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal inc_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal not_stall_in_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_in_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_0_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_1_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_0_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_1_and_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_in_1(LOGICAL,26)
    not_stall_in_1_q <= not (in_stall_in_1);

    -- exitcond_GUARD_cmp(LOGICAL,9)
    exitcond_GUARD_cmp_q <= not (in_exitcond_GUARD);

    -- valid_out_1_and(LOGICAL,45)
    valid_out_1_and_q <= in_valid_in and exitcond_GUARD_cmp_q;

    -- valid_1_reg(REG,43)
    valid_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_1_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (avgpool2d_B1_branch_enable_q = "1") THEN
                valid_1_reg_q <= valid_out_1_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_1(LOGICAL,28)
    not_valid_1_q <= not (valid_1_reg_q);

    -- not_valid_or_not_stall_1(LOGICAL,30)
    not_valid_or_not_stall_1_q <= not_valid_1_q or not_stall_in_1_q;

    -- not_stall_in_0(LOGICAL,25)
    not_stall_in_0_q <= not (in_stall_in_0);

    -- valid_out_0_and(LOGICAL,44)
    valid_out_0_and_q <= in_valid_in and in_exitcond_GUARD;

    -- valid_0_reg(REG,42)
    valid_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_0_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (avgpool2d_B1_branch_enable_q = "1") THEN
                valid_0_reg_q <= valid_out_0_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_0(LOGICAL,27)
    not_valid_0_q <= not (valid_0_reg_q);

    -- not_valid_or_not_stall_0(LOGICAL,29)
    not_valid_or_not_stall_0_q <= not_valid_0_q or not_stall_in_0_q;

    -- avgpool2d_B1_branch_enable(LOGICAL,2)
    avgpool2d_B1_branch_enable_q <= not_valid_or_not_stall_0_q and not_valid_or_not_stall_1_q;

    -- c0_exe12_reg(REG,4)
    c0_exe12_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe12_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (avgpool2d_B1_branch_enable_q = "1") THEN
                c0_exe12_reg_q <= in_c0_exe12;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe12(GPOUT,31)
    out_c0_exe12 <= c0_exe12_reg_q;

    -- c0_exe17_reg(REG,5)
    c0_exe17_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe17_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (avgpool2d_B1_branch_enable_q = "1") THEN
                c0_exe17_reg_q <= STD_LOGIC_VECTOR(in_c0_exe17);
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe17(GPOUT,32)
    out_c0_exe17 <= c0_exe17_reg_q;

    -- c0_exe23_reg(REG,6)
    c0_exe23_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe23_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (avgpool2d_B1_branch_enable_q = "1") THEN
                c0_exe23_reg_q <= in_c0_exe23;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe23(GPOUT,33)
    out_c0_exe23 <= c0_exe23_reg_q;

    -- c0_exe35_reg(REG,7)
    c0_exe35_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe35_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (avgpool2d_B1_branch_enable_q = "1") THEN
                c0_exe35_reg_q <= in_c0_exe35;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe35(GPOUT,34)
    out_c0_exe35 <= c0_exe35_reg_q;

    -- c0_exe46_reg(REG,8)
    c0_exe46_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe46_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (avgpool2d_B1_branch_enable_q = "1") THEN
                c0_exe46_reg_q <= in_c0_exe46;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe46(GPOUT,35)
    out_c0_exe46 <= c0_exe46_reg_q;

    -- fpgaindvars_iv_reg(REG,10)
    fpgaindvars_iv_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            fpgaindvars_iv_reg_q <= "000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (avgpool2d_B1_branch_enable_q = "1") THEN
                fpgaindvars_iv_reg_q <= in_fpgaindvars_iv;
            END IF;
        END IF;
    END PROCESS;

    -- out_fpgaindvars_iv(GPOUT,36)
    out_fpgaindvars_iv <= fpgaindvars_iv_reg_q;

    -- global_id_09_reg(REG,11)
    global_id_09_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            global_id_09_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (avgpool2d_B1_branch_enable_q = "1") THEN
                global_id_09_reg_q <= in_global_id_09;
            END IF;
        END IF;
    END PROCESS;

    -- out_global_id_09(GPOUT,37)
    out_global_id_09 <= global_id_09_reg_q;

    -- inc_reg(REG,12)
    inc_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            inc_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (avgpool2d_B1_branch_enable_q = "1") THEN
                inc_reg_q <= in_inc;
            END IF;
        END IF;
    END PROCESS;

    -- out_inc(GPOUT,38)
    out_inc <= inc_reg_q;

    -- avgpool2d_B1_branch_enable_not(LOGICAL,3)
    avgpool2d_B1_branch_enable_not_q <= not (avgpool2d_B1_branch_enable_q);

    -- out_stall_out(GPOUT,39)
    out_stall_out <= avgpool2d_B1_branch_enable_not_q;

    -- out_valid_out_0(GPOUT,40)
    out_valid_out_0 <= valid_0_reg_q;

    -- out_valid_out_1(GPOUT,41)
    out_valid_out_1 <= valid_1_reg_q;

END normal;
