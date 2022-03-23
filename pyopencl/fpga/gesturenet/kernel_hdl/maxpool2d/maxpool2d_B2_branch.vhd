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

-- VHDL created from maxpool2d_B2_branch
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

entity maxpool2d_B2_branch is
    port (
        in_c0_exe11 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe117 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_cmp9_phi_decision18_xor_RM : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv_next : in std_logic_vector(2 downto 0);  -- ufix3
        in_i_0107 : in std_logic_vector(31 downto 0);  -- ufix32
        in_inc30 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_1611 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul2212 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul2413 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im_addr_0115 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_179 : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_maxpool2d0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe117 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_cmp9_phi_decision18_xor_RM : out std_logic_vector(0 downto 0);  -- ufix1
        out_fpgaindvars_iv_next : out std_logic_vector(2 downto 0);  -- ufix3
        out_i_0107 : out std_logic_vector(31 downto 0);  -- ufix32
        out_inc30 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_1611 : out std_logic_vector(31 downto 0);  -- ufix32
        out_mul2212 : out std_logic_vector(31 downto 0);  -- ufix32
        out_mul2413 : out std_logic_vector(31 downto 0);  -- ufix32
        out_output_im_addr_0115 : out std_logic_vector(63 downto 0);  -- ufix64
        out_output_im_addr_179 : out std_logic_vector(63 downto 0);  -- ufix64
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end maxpool2d_B2_branch;

architecture normal of maxpool2d_B2_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe11_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c1_exe117_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal cmp9_phi_decision18_xor_RM_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fpgaindvars_iv_next_reg_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_0107_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal inc30_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal j_1611_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_branch_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B2_branch_enable_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mul2212_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal mul2413_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal not_stall_in_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_in_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal output_im_addr_0115_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal output_im_addr_179_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal unnamed_maxpool2d0_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_0_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_1_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_0_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_1_and_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_in_1(LOGICAL,29)
    not_stall_in_1_q <= not (in_stall_in_1);

    -- unnamed_maxpool2d0_cmp(LOGICAL,50)
    unnamed_maxpool2d0_cmp_q <= not (in_unnamed_maxpool2d0);

    -- valid_out_1_and(LOGICAL,54)
    valid_out_1_and_q <= in_valid_in and unnamed_maxpool2d0_cmp_q;

    -- valid_1_reg(REG,52)
    valid_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_1_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                valid_1_reg_q <= valid_out_1_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_1(LOGICAL,31)
    not_valid_1_q <= not (valid_1_reg_q);

    -- not_valid_or_not_stall_1(LOGICAL,33)
    not_valid_or_not_stall_1_q <= not_valid_1_q or not_stall_in_1_q;

    -- not_stall_in_0(LOGICAL,28)
    not_stall_in_0_q <= not (in_stall_in_0);

    -- valid_out_0_and(LOGICAL,53)
    valid_out_0_and_q <= in_valid_in and in_unnamed_maxpool2d0;

    -- valid_0_reg(REG,51)
    valid_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_0_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                valid_0_reg_q <= valid_out_0_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_0(LOGICAL,30)
    not_valid_0_q <= not (valid_0_reg_q);

    -- not_valid_or_not_stall_0(LOGICAL,32)
    not_valid_or_not_stall_0_q <= not_valid_0_q or not_stall_in_0_q;

    -- maxpool2d_B2_branch_enable(LOGICAL,24)
    maxpool2d_B2_branch_enable_q <= not_valid_or_not_stall_0_q and not_valid_or_not_stall_1_q;

    -- c0_exe11_reg(REG,2)
    c0_exe11_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe11_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                c0_exe11_reg_q <= in_c0_exe11;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe11(GPOUT,34)
    out_c0_exe11 <= c0_exe11_reg_q;

    -- c1_exe117_reg(REG,3)
    c1_exe117_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe117_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                c1_exe117_reg_q <= STD_LOGIC_VECTOR(in_c1_exe117);
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe117(GPOUT,35)
    out_c1_exe117 <= c1_exe117_reg_q;

    -- cmp9_phi_decision18_xor_RM_reg(REG,4)
    cmp9_phi_decision18_xor_RM_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            cmp9_phi_decision18_xor_RM_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                cmp9_phi_decision18_xor_RM_reg_q <= in_cmp9_phi_decision18_xor_RM;
            END IF;
        END IF;
    END PROCESS;

    -- out_cmp9_phi_decision18_xor_RM(GPOUT,36)
    out_cmp9_phi_decision18_xor_RM <= cmp9_phi_decision18_xor_RM_reg_q;

    -- fpgaindvars_iv_next_reg(REG,5)
    fpgaindvars_iv_next_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            fpgaindvars_iv_next_reg_q <= "000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                fpgaindvars_iv_next_reg_q <= in_fpgaindvars_iv_next;
            END IF;
        END IF;
    END PROCESS;

    -- out_fpgaindvars_iv_next(GPOUT,37)
    out_fpgaindvars_iv_next <= fpgaindvars_iv_next_reg_q;

    -- i_0107_reg(REG,6)
    i_0107_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_0107_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                i_0107_reg_q <= in_i_0107;
            END IF;
        END IF;
    END PROCESS;

    -- out_i_0107(GPOUT,38)
    out_i_0107 <= i_0107_reg_q;

    -- inc30_reg(REG,7)
    inc30_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            inc30_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                inc30_reg_q <= in_inc30;
            END IF;
        END IF;
    END PROCESS;

    -- out_inc30(GPOUT,39)
    out_inc30 <= inc30_reg_q;

    -- j_1611_reg(REG,23)
    j_1611_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            j_1611_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                j_1611_reg_q <= in_j_1611;
            END IF;
        END IF;
    END PROCESS;

    -- out_j_1611(GPOUT,40)
    out_j_1611 <= j_1611_reg_q;

    -- mul2212_reg(REG,26)
    mul2212_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            mul2212_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                mul2212_reg_q <= in_mul2212;
            END IF;
        END IF;
    END PROCESS;

    -- out_mul2212(GPOUT,41)
    out_mul2212 <= mul2212_reg_q;

    -- mul2413_reg(REG,27)
    mul2413_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            mul2413_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                mul2413_reg_q <= in_mul2413;
            END IF;
        END IF;
    END PROCESS;

    -- out_mul2413(GPOUT,42)
    out_mul2413 <= mul2413_reg_q;

    -- output_im_addr_0115_reg(REG,48)
    output_im_addr_0115_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            output_im_addr_0115_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                output_im_addr_0115_reg_q <= in_output_im_addr_0115;
            END IF;
        END IF;
    END PROCESS;

    -- out_output_im_addr_0115(GPOUT,43)
    out_output_im_addr_0115 <= output_im_addr_0115_reg_q;

    -- output_im_addr_179_reg(REG,49)
    output_im_addr_179_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            output_im_addr_179_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (maxpool2d_B2_branch_enable_q = "1") THEN
                output_im_addr_179_reg_q <= in_output_im_addr_179;
            END IF;
        END IF;
    END PROCESS;

    -- out_output_im_addr_179(GPOUT,44)
    out_output_im_addr_179 <= output_im_addr_179_reg_q;

    -- maxpool2d_B2_branch_enable_not(LOGICAL,25)
    maxpool2d_B2_branch_enable_not_q <= not (maxpool2d_B2_branch_enable_q);

    -- out_stall_out(GPOUT,45)
    out_stall_out <= maxpool2d_B2_branch_enable_not_q;

    -- out_valid_out_0(GPOUT,46)
    out_valid_out_0 <= valid_0_reg_q;

    -- out_valid_out_1(GPOUT,47)
    out_valid_out_1 <= valid_1_reg_q;

END normal;
