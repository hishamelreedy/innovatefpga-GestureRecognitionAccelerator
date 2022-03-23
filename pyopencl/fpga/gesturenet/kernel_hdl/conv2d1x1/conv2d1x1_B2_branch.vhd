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

-- VHDL created from conv2d1x1_B2_branch
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

entity conv2d1x1_B2_branch is
    port (
        in_c1_exit33_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit33_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit33_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit33_3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit33_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit33_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit33_6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit33_7 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exit33_8 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exit33_9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exit33_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exit_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c2_exit_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c2_exit_2 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c2_exit_3 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_exe11 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe134 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c2_exe3 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_i_0115 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_179 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im_addr_0107 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_1611 : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_conv2d1x12 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit33_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit33_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit33_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit33_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit33_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit33_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit33_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit33_7 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exit33_8 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exit33_9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exit33_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exit_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c2_exit_1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c2_exit_2 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c2_exit_3 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c0_exe11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe134 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe9 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c2_exe3 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_i_0115 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_179 : out std_logic_vector(31 downto 0);  -- ufix32
        out_output_im_addr_0107 : out std_logic_vector(63 downto 0);  -- ufix64
        out_output_im_addr_1611 : out std_logic_vector(63 downto 0);  -- ufix64
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_conv2d1x12 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end conv2d1x1_B2_branch;

architecture normal of conv2d1x1_B2_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exit33_reg_0_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exit33_reg_1_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exit33_reg_2_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exit33_reg_3_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exit33_reg_4_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exit33_reg_5_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exit33_reg_6_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exit33_reg_7_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c1_exit33_reg_8_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c1_exit33_reg_9_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exit33_reg_10_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c2_exit_reg_0_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c2_exit_reg_1_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c2_exit_reg_2_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c2_exit_reg_3_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe11_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c1_exe10_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe134_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe9_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c2_exe3_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2d1x1_B2_branch_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal conv2d1x1_B2_branch_enable_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_0115_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal j_179_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal not_stall_in_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_in_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal output_im_addr_0107_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal output_im_addr_1611_reg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal unnamed_conv2d1x12_reg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal valid_0_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_1_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_0_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_1_and_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_in_1(LOGICAL,82)
    not_stall_in_1_q <= not (in_stall_in_1);

    -- c1_exe10_cmp(LOGICAL,73)
    c1_exe10_cmp_q <= not (in_c1_exe10);

    -- valid_out_1_and(LOGICAL,93)
    valid_out_1_and_q <= in_valid_in and c1_exe10_cmp_q;

    -- valid_1_reg(REG,91)
    valid_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_1_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                valid_1_reg_q <= valid_out_1_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_1(LOGICAL,84)
    not_valid_1_q <= not (valid_1_reg_q);

    -- not_valid_or_not_stall_1(LOGICAL,86)
    not_valid_or_not_stall_1_q <= not_valid_1_q or not_stall_in_1_q;

    -- not_stall_in_0(LOGICAL,81)
    not_stall_in_0_q <= not (in_stall_in_0);

    -- valid_out_0_and(LOGICAL,92)
    valid_out_0_and_q <= in_valid_in and in_c1_exe10;

    -- valid_0_reg(REG,90)
    valid_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_0_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                valid_0_reg_q <= valid_out_0_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_0(LOGICAL,83)
    not_valid_0_q <= not (valid_0_reg_q);

    -- not_valid_or_not_stall_0(LOGICAL,85)
    not_valid_or_not_stall_0_q <= not_valid_0_q or not_stall_in_0_q;

    -- conv2d1x1_B2_branch_enable(LOGICAL,77)
    conv2d1x1_B2_branch_enable_q <= not_valid_or_not_stall_0_q and not_valid_or_not_stall_1_q;

    -- c1_exit33_reg_0_x(REG,2)
    c1_exit33_reg_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit33_reg_0_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                c1_exit33_reg_0_x_q <= in_c1_exit33_0;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit33_0(GPOUT,45)
    out_c1_exit33_0 <= c1_exit33_reg_0_x_q;

    -- c1_exit33_reg_1_x(REG,3)
    c1_exit33_reg_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit33_reg_1_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                c1_exit33_reg_1_x_q <= in_c1_exit33_1;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit33_1(GPOUT,46)
    out_c1_exit33_1 <= c1_exit33_reg_1_x_q;

    -- c1_exit33_reg_2_x(REG,4)
    c1_exit33_reg_2_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit33_reg_2_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                c1_exit33_reg_2_x_q <= in_c1_exit33_2;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit33_2(GPOUT,47)
    out_c1_exit33_2 <= c1_exit33_reg_2_x_q;

    -- c1_exit33_reg_3_x(REG,5)
    c1_exit33_reg_3_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit33_reg_3_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                c1_exit33_reg_3_x_q <= in_c1_exit33_3;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit33_3(GPOUT,48)
    out_c1_exit33_3 <= c1_exit33_reg_3_x_q;

    -- c1_exit33_reg_4_x(REG,6)
    c1_exit33_reg_4_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit33_reg_4_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                c1_exit33_reg_4_x_q <= in_c1_exit33_4;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit33_4(GPOUT,49)
    out_c1_exit33_4 <= c1_exit33_reg_4_x_q;

    -- c1_exit33_reg_5_x(REG,7)
    c1_exit33_reg_5_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit33_reg_5_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                c1_exit33_reg_5_x_q <= in_c1_exit33_5;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit33_5(GPOUT,50)
    out_c1_exit33_5 <= c1_exit33_reg_5_x_q;

    -- c1_exit33_reg_6_x(REG,8)
    c1_exit33_reg_6_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit33_reg_6_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                c1_exit33_reg_6_x_q <= in_c1_exit33_6;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit33_6(GPOUT,51)
    out_c1_exit33_6 <= c1_exit33_reg_6_x_q;

    -- c1_exit33_reg_7_x(REG,9)
    c1_exit33_reg_7_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit33_reg_7_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                c1_exit33_reg_7_x_q <= in_c1_exit33_7;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit33_7(GPOUT,52)
    out_c1_exit33_7 <= c1_exit33_reg_7_x_q;

    -- c1_exit33_reg_8_x(REG,10)
    c1_exit33_reg_8_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit33_reg_8_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                c1_exit33_reg_8_x_q <= in_c1_exit33_8;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit33_8(GPOUT,53)
    out_c1_exit33_8 <= c1_exit33_reg_8_x_q;

    -- c1_exit33_reg_9_x(REG,11)
    c1_exit33_reg_9_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit33_reg_9_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                c1_exit33_reg_9_x_q <= in_c1_exit33_9;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit33_9(GPOUT,54)
    out_c1_exit33_9 <= c1_exit33_reg_9_x_q;

    -- c1_exit33_reg_10_x(REG,12)
    c1_exit33_reg_10_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit33_reg_10_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                c1_exit33_reg_10_x_q <= in_c1_exit33_10;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit33_10(GPOUT,55)
    out_c1_exit33_10 <= c1_exit33_reg_10_x_q;

    -- c2_exit_reg_0_x(REG,13)
    c2_exit_reg_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c2_exit_reg_0_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                c2_exit_reg_0_x_q <= in_c2_exit_0;
            END IF;
        END IF;
    END PROCESS;

    -- out_c2_exit_0(GPOUT,56)
    out_c2_exit_0 <= c2_exit_reg_0_x_q;

    -- c2_exit_reg_1_x(REG,14)
    c2_exit_reg_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c2_exit_reg_1_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                c2_exit_reg_1_x_q <= STD_LOGIC_VECTOR(in_c2_exit_1);
            END IF;
        END IF;
    END PROCESS;

    -- out_c2_exit_1(GPOUT,57)
    out_c2_exit_1 <= c2_exit_reg_1_x_q;

    -- c2_exit_reg_2_x(REG,15)
    c2_exit_reg_2_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c2_exit_reg_2_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                c2_exit_reg_2_x_q <= STD_LOGIC_VECTOR(in_c2_exit_2);
            END IF;
        END IF;
    END PROCESS;

    -- out_c2_exit_2(GPOUT,58)
    out_c2_exit_2 <= c2_exit_reg_2_x_q;

    -- c2_exit_reg_3_x(REG,16)
    c2_exit_reg_3_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c2_exit_reg_3_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                c2_exit_reg_3_x_q <= STD_LOGIC_VECTOR(in_c2_exit_3);
            END IF;
        END IF;
    END PROCESS;

    -- out_c2_exit_3(GPOUT,59)
    out_c2_exit_3 <= c2_exit_reg_3_x_q;

    -- c0_exe11_reg(REG,72)
    c0_exe11_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe11_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                c0_exe11_reg_q <= in_c0_exe11;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe11(GPOUT,60)
    out_c0_exe11 <= c0_exe11_reg_q;

    -- c1_exe134_reg(REG,74)
    c1_exe134_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe134_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                c1_exe134_reg_q <= in_c1_exe134;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe134(GPOUT,61)
    out_c1_exe134 <= c1_exe134_reg_q;

    -- c1_exe9_reg(REG,75)
    c1_exe9_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe9_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                c1_exe9_reg_q <= in_c1_exe9;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe9(GPOUT,62)
    out_c1_exe9 <= c1_exe9_reg_q;

    -- c2_exe3_reg(REG,76)
    c2_exe3_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c2_exe3_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                c2_exe3_reg_q <= STD_LOGIC_VECTOR(in_c2_exe3);
            END IF;
        END IF;
    END PROCESS;

    -- out_c2_exe3(GPOUT,63)
    out_c2_exe3 <= c2_exe3_reg_q;

    -- i_0115_reg(REG,79)
    i_0115_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_0115_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                i_0115_reg_q <= in_i_0115;
            END IF;
        END IF;
    END PROCESS;

    -- out_i_0115(GPOUT,64)
    out_i_0115 <= i_0115_reg_q;

    -- j_179_reg(REG,80)
    j_179_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            j_179_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                j_179_reg_q <= in_j_179;
            END IF;
        END IF;
    END PROCESS;

    -- out_j_179(GPOUT,65)
    out_j_179 <= j_179_reg_q;

    -- output_im_addr_0107_reg(REG,87)
    output_im_addr_0107_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            output_im_addr_0107_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                output_im_addr_0107_reg_q <= in_output_im_addr_0107;
            END IF;
        END IF;
    END PROCESS;

    -- out_output_im_addr_0107(GPOUT,66)
    out_output_im_addr_0107 <= output_im_addr_0107_reg_q;

    -- output_im_addr_1611_reg(REG,88)
    output_im_addr_1611_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            output_im_addr_1611_reg_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                output_im_addr_1611_reg_q <= in_output_im_addr_1611;
            END IF;
        END IF;
    END PROCESS;

    -- out_output_im_addr_1611(GPOUT,67)
    out_output_im_addr_1611 <= output_im_addr_1611_reg_q;

    -- conv2d1x1_B2_branch_enable_not(LOGICAL,78)
    conv2d1x1_B2_branch_enable_not_q <= not (conv2d1x1_B2_branch_enable_q);

    -- out_stall_out(GPOUT,68)
    out_stall_out <= conv2d1x1_B2_branch_enable_not_q;

    -- unnamed_conv2d1x12_reg(REG,89)
    unnamed_conv2d1x12_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            unnamed_conv2d1x12_reg_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (conv2d1x1_B2_branch_enable_q = "1") THEN
                unnamed_conv2d1x12_reg_q <= STD_LOGIC_VECTOR(in_unnamed_conv2d1x12);
            END IF;
        END IF;
    END PROCESS;

    -- out_unnamed_conv2d1x12(GPOUT,69)
    out_unnamed_conv2d1x12 <= unnamed_conv2d1x12_reg_q;

    -- out_valid_out_0(GPOUT,70)
    out_valid_out_0 <= valid_0_reg_q;

    -- out_valid_out_1(GPOUT,71)
    out_valid_out_1 <= valid_1_reg_q;

END normal;
