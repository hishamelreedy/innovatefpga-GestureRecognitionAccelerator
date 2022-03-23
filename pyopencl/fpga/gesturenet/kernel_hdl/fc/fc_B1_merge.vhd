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

-- VHDL created from fc_B1_merge
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

entity fc_B1_merge is
    port (
        in_c0_exe11_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe11_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_i_06_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_06_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_idxprom3_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_idxprom3_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_j_13_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_13_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_tmp_05_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_tmp_05_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_tmp_12_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_tmp_12_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_fc1_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_fc1_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_i_06 : out std_logic_vector(31 downto 0);  -- ufix32
        out_idxprom3 : out std_logic_vector(63 downto 0);  -- ufix64
        out_j_13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_tmp_05 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_tmp_12 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_unnamed_fc1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end fc_B1_merge;

architecture normal of fc_B1_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe11_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe11_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_06_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_06_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal idxprom3_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal idxprom3_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal j_13_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal j_13_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_05_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_05_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_12_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_12_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal unnamed_fc1_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_fc1_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal valid_or_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- c0_exe11_mux(MUX,2)
    c0_exe11_mux_s <= in_valid_in_0;
    c0_exe11_mux_combproc: PROCESS (c0_exe11_mux_s, in_c0_exe11_1, in_c0_exe11_0)
    BEGIN
        CASE (c0_exe11_mux_s) IS
            WHEN "0" => c0_exe11_mux_q <= in_c0_exe11_1;
            WHEN "1" => c0_exe11_mux_q <= in_c0_exe11_0;
            WHEN OTHERS => c0_exe11_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe11(GPOUT,23)
    out_c0_exe11 <= c0_exe11_mux_q;

    -- i_06_mux(MUX,3)
    i_06_mux_s <= in_valid_in_0;
    i_06_mux_combproc: PROCESS (i_06_mux_s, in_i_06_1, in_i_06_0)
    BEGIN
        CASE (i_06_mux_s) IS
            WHEN "0" => i_06_mux_q <= in_i_06_1;
            WHEN "1" => i_06_mux_q <= in_i_06_0;
            WHEN OTHERS => i_06_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_i_06(GPOUT,24)
    out_i_06 <= i_06_mux_q;

    -- idxprom3_mux(MUX,4)
    idxprom3_mux_s <= in_valid_in_0;
    idxprom3_mux_combproc: PROCESS (idxprom3_mux_s, in_idxprom3_1, in_idxprom3_0)
    BEGIN
        CASE (idxprom3_mux_s) IS
            WHEN "0" => idxprom3_mux_q <= in_idxprom3_1;
            WHEN "1" => idxprom3_mux_q <= in_idxprom3_0;
            WHEN OTHERS => idxprom3_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_idxprom3(GPOUT,25)
    out_idxprom3 <= idxprom3_mux_q;

    -- j_13_mux(MUX,22)
    j_13_mux_s <= in_valid_in_0;
    j_13_mux_combproc: PROCESS (j_13_mux_s, in_j_13_1, in_j_13_0)
    BEGIN
        CASE (j_13_mux_s) IS
            WHEN "0" => j_13_mux_q <= in_j_13_1;
            WHEN "1" => j_13_mux_q <= in_j_13_0;
            WHEN OTHERS => j_13_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_j_13(GPOUT,26)
    out_j_13 <= j_13_mux_q;

    -- valid_or(LOGICAL,38)
    valid_or_q <= in_valid_in_0 or in_valid_in_1;

    -- stall_out(LOGICAL,33)
    stall_out_q <= valid_or_q and in_stall_in;

    -- out_stall_out_0(GPOUT,27)
    out_stall_out_0 <= stall_out_q;

    -- stall_out_1_specific(LOGICAL,34)
    stall_out_1_specific_q <= in_valid_in_0 or stall_out_q;

    -- out_stall_out_1(GPOUT,28)
    out_stall_out_1 <= stall_out_1_specific_q;

    -- tmp_05_mux(MUX,35)
    tmp_05_mux_s <= in_valid_in_0;
    tmp_05_mux_combproc: PROCESS (tmp_05_mux_s, in_tmp_05_1, in_tmp_05_0)
    BEGIN
        CASE (tmp_05_mux_s) IS
            WHEN "0" => tmp_05_mux_q <= in_tmp_05_1;
            WHEN "1" => tmp_05_mux_q <= in_tmp_05_0;
            WHEN OTHERS => tmp_05_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_tmp_05(GPOUT,29)
    out_tmp_05 <= tmp_05_mux_q;

    -- tmp_12_mux(MUX,36)
    tmp_12_mux_s <= in_valid_in_0;
    tmp_12_mux_combproc: PROCESS (tmp_12_mux_s, in_tmp_12_1, in_tmp_12_0)
    BEGIN
        CASE (tmp_12_mux_s) IS
            WHEN "0" => tmp_12_mux_q <= in_tmp_12_1;
            WHEN "1" => tmp_12_mux_q <= in_tmp_12_0;
            WHEN OTHERS => tmp_12_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_tmp_12(GPOUT,30)
    out_tmp_12 <= tmp_12_mux_q;

    -- unnamed_fc1_mux(MUX,37)
    unnamed_fc1_mux_s <= in_valid_in_0;
    unnamed_fc1_mux_combproc: PROCESS (unnamed_fc1_mux_s, in_unnamed_fc1_1, in_unnamed_fc1_0)
    BEGIN
        CASE (unnamed_fc1_mux_s) IS
            WHEN "0" => unnamed_fc1_mux_q <= in_unnamed_fc1_1;
            WHEN "1" => unnamed_fc1_mux_q <= in_unnamed_fc1_0;
            WHEN OTHERS => unnamed_fc1_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_unnamed_fc1(GPOUT,31)
    out_unnamed_fc1 <= unnamed_fc1_mux_q;

    -- out_valid_out(GPOUT,32)
    out_valid_out <= valid_or_q;

END normal;
