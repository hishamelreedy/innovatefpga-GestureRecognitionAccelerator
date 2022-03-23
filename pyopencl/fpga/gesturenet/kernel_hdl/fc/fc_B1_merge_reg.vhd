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

-- VHDL created from fc_B1_merge_reg
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

entity fc_B1_merge_reg is
    port (
        in_data_in_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_data_in_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_3 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_data_in_4 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_5 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_6 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_0 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_data_out_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_3 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_data_out_4 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_5 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_6 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end fc_B1_merge_reg;

architecture normal of fc_B1_merge_reg is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_B1_merge_reg_data_reg_0_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_B1_merge_reg_data_reg_1_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_B1_merge_reg_data_reg_2_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_B1_merge_reg_data_reg_3_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_B1_merge_reg_data_reg_4_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal fc_B1_merge_reg_data_reg_5_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal fc_B1_merge_reg_data_reg_6_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_B1_merge_reg_valid_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_B1_merge_reg_valid_reg_and_stall_in_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_B1_merge_reg_valid_reg_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_in_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_in_not_or_fc_B1_merge_reg_valid_reg_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- stall_in_not(LOGICAL,14)
    stall_in_not_q <= not (in_stall_in);

    -- fc_B1_merge_reg_valid_reg_not(LOGICAL,13)
    fc_B1_merge_reg_valid_reg_not_q <= not (fc_B1_merge_reg_valid_reg_q);

    -- stall_in_not_or_fc_B1_merge_reg_valid_reg(LOGICAL,15)
    stall_in_not_or_fc_B1_merge_reg_valid_reg_q <= fc_B1_merge_reg_valid_reg_not_q or stall_in_not_q;

    -- fc_B1_merge_reg_valid_reg(REG,11)
    fc_B1_merge_reg_valid_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            fc_B1_merge_reg_valid_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_fc_B1_merge_reg_valid_reg_q = "1") THEN
                fc_B1_merge_reg_valid_reg_q <= in_valid_in;
            END IF;
        END IF;
    END PROCESS;

    -- fc_B1_merge_reg_data_reg_6_x(REG,10)
    fc_B1_merge_reg_data_reg_6_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            fc_B1_merge_reg_data_reg_6_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_fc_B1_merge_reg_valid_reg_q = "1") THEN
                fc_B1_merge_reg_data_reg_6_x_q <= STD_LOGIC_VECTOR(in_data_in_6);
            END IF;
        END IF;
    END PROCESS;

    -- fc_B1_merge_reg_data_reg_5_x(REG,9)
    fc_B1_merge_reg_data_reg_5_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            fc_B1_merge_reg_data_reg_5_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_fc_B1_merge_reg_valid_reg_q = "1") THEN
                fc_B1_merge_reg_data_reg_5_x_q <= in_data_in_5;
            END IF;
        END IF;
    END PROCESS;

    -- fc_B1_merge_reg_data_reg_4_x(REG,8)
    fc_B1_merge_reg_data_reg_4_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            fc_B1_merge_reg_data_reg_4_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_fc_B1_merge_reg_valid_reg_q = "1") THEN
                fc_B1_merge_reg_data_reg_4_x_q <= in_data_in_4;
            END IF;
        END IF;
    END PROCESS;

    -- fc_B1_merge_reg_data_reg_3_x(REG,7)
    fc_B1_merge_reg_data_reg_3_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            fc_B1_merge_reg_data_reg_3_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_fc_B1_merge_reg_valid_reg_q = "1") THEN
                fc_B1_merge_reg_data_reg_3_x_q <= STD_LOGIC_VECTOR(in_data_in_3);
            END IF;
        END IF;
    END PROCESS;

    -- fc_B1_merge_reg_data_reg_2_x(REG,6)
    fc_B1_merge_reg_data_reg_2_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            fc_B1_merge_reg_data_reg_2_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_fc_B1_merge_reg_valid_reg_q = "1") THEN
                fc_B1_merge_reg_data_reg_2_x_q <= in_data_in_2;
            END IF;
        END IF;
    END PROCESS;

    -- fc_B1_merge_reg_data_reg_1_x(REG,5)
    fc_B1_merge_reg_data_reg_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            fc_B1_merge_reg_data_reg_1_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_fc_B1_merge_reg_valid_reg_q = "1") THEN
                fc_B1_merge_reg_data_reg_1_x_q <= STD_LOGIC_VECTOR(in_data_in_1);
            END IF;
        END IF;
    END PROCESS;

    -- fc_B1_merge_reg_data_reg_0_x(REG,4)
    fc_B1_merge_reg_data_reg_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            fc_B1_merge_reg_data_reg_0_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (stall_in_not_or_fc_B1_merge_reg_valid_reg_q = "1") THEN
                fc_B1_merge_reg_data_reg_0_x_q <= in_data_in_0;
            END IF;
        END IF;
    END PROCESS;

    -- dupName_0_sync_out_aunroll_x(GPOUT,3)@1
    out_data_out_0 <= fc_B1_merge_reg_data_reg_0_x_q;
    out_data_out_1 <= fc_B1_merge_reg_data_reg_1_x_q;
    out_data_out_2 <= fc_B1_merge_reg_data_reg_2_x_q;
    out_data_out_3 <= fc_B1_merge_reg_data_reg_3_x_q;
    out_data_out_4 <= fc_B1_merge_reg_data_reg_4_x_q;
    out_data_out_5 <= fc_B1_merge_reg_data_reg_5_x_q;
    out_data_out_6 <= fc_B1_merge_reg_data_reg_6_x_q;
    out_valid_out <= fc_B1_merge_reg_valid_reg_q;

    -- fc_B1_merge_reg_valid_reg_and_stall_in(LOGICAL,12)
    fc_B1_merge_reg_valid_reg_and_stall_in_q <= fc_B1_merge_reg_valid_reg_q and in_stall_in;

    -- sync_out(GPOUT,17)@20000000
    out_stall_out <= fc_B1_merge_reg_valid_reg_and_stall_in_q;

END normal;