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

-- VHDL created from avgpool2d_B1_merge
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

entity avgpool2d_B1_merge is
    port (
        in_c0_exe12_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe12_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe23_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe23_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe35_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe35_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe46_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe46_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv_in_0 : in std_logic_vector(32 downto 0);  -- ufix33
        in_fpgaindvars_iv_in_1 : in std_logic_vector(32 downto 0);  -- ufix33
        in_global_id_09_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_09_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_03_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_03_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_tmp_02_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_tmp_02_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe23 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe35 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe46 : out std_logic_vector(0 downto 0);  -- ufix1
        out_fpgaindvars_iv_in : out std_logic_vector(32 downto 0);  -- ufix33
        out_global_id_09 : out std_logic_vector(31 downto 0);  -- ufix32
        out_i_03 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_tmp_02 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end avgpool2d_B1_merge;

architecture normal of avgpool2d_B1_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe12_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe12_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exe23_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe23_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe35_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe35_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe46_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe46_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fpgaindvars_iv_in_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fpgaindvars_iv_in_mux_q : STD_LOGIC_VECTOR (32 downto 0);
    signal global_id_09_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_09_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_03_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_03_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_02_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_02_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal valid_or_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- c0_exe12_mux(MUX,2)
    c0_exe12_mux_s <= in_valid_in_0;
    c0_exe12_mux_combproc: PROCESS (c0_exe12_mux_s, in_c0_exe12_1, in_c0_exe12_0)
    BEGIN
        CASE (c0_exe12_mux_s) IS
            WHEN "0" => c0_exe12_mux_q <= in_c0_exe12_1;
            WHEN "1" => c0_exe12_mux_q <= in_c0_exe12_0;
            WHEN OTHERS => c0_exe12_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe12(GPOUT,28)
    out_c0_exe12 <= c0_exe12_mux_q;

    -- c0_exe23_mux(MUX,3)
    c0_exe23_mux_s <= in_valid_in_0;
    c0_exe23_mux_combproc: PROCESS (c0_exe23_mux_s, in_c0_exe23_1, in_c0_exe23_0)
    BEGIN
        CASE (c0_exe23_mux_s) IS
            WHEN "0" => c0_exe23_mux_q <= in_c0_exe23_1;
            WHEN "1" => c0_exe23_mux_q <= in_c0_exe23_0;
            WHEN OTHERS => c0_exe23_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe23(GPOUT,29)
    out_c0_exe23 <= c0_exe23_mux_q;

    -- c0_exe35_mux(MUX,4)
    c0_exe35_mux_s <= in_valid_in_0;
    c0_exe35_mux_combproc: PROCESS (c0_exe35_mux_s, in_c0_exe35_1, in_c0_exe35_0)
    BEGIN
        CASE (c0_exe35_mux_s) IS
            WHEN "0" => c0_exe35_mux_q <= in_c0_exe35_1;
            WHEN "1" => c0_exe35_mux_q <= in_c0_exe35_0;
            WHEN OTHERS => c0_exe35_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe35(GPOUT,30)
    out_c0_exe35 <= c0_exe35_mux_q;

    -- c0_exe46_mux(MUX,5)
    c0_exe46_mux_s <= in_valid_in_0;
    c0_exe46_mux_combproc: PROCESS (c0_exe46_mux_s, in_c0_exe46_1, in_c0_exe46_0)
    BEGIN
        CASE (c0_exe46_mux_s) IS
            WHEN "0" => c0_exe46_mux_q <= in_c0_exe46_1;
            WHEN "1" => c0_exe46_mux_q <= in_c0_exe46_0;
            WHEN OTHERS => c0_exe46_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe46(GPOUT,31)
    out_c0_exe46 <= c0_exe46_mux_q;

    -- fpgaindvars_iv_in_mux(MUX,6)
    fpgaindvars_iv_in_mux_s <= in_valid_in_0;
    fpgaindvars_iv_in_mux_combproc: PROCESS (fpgaindvars_iv_in_mux_s, in_fpgaindvars_iv_in_1, in_fpgaindvars_iv_in_0)
    BEGIN
        CASE (fpgaindvars_iv_in_mux_s) IS
            WHEN "0" => fpgaindvars_iv_in_mux_q <= in_fpgaindvars_iv_in_1;
            WHEN "1" => fpgaindvars_iv_in_mux_q <= in_fpgaindvars_iv_in_0;
            WHEN OTHERS => fpgaindvars_iv_in_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_fpgaindvars_iv_in(GPOUT,32)
    out_fpgaindvars_iv_in <= fpgaindvars_iv_in_mux_q;

    -- global_id_09_mux(MUX,7)
    global_id_09_mux_s <= in_valid_in_0;
    global_id_09_mux_combproc: PROCESS (global_id_09_mux_s, in_global_id_09_1, in_global_id_09_0)
    BEGIN
        CASE (global_id_09_mux_s) IS
            WHEN "0" => global_id_09_mux_q <= in_global_id_09_1;
            WHEN "1" => global_id_09_mux_q <= in_global_id_09_0;
            WHEN OTHERS => global_id_09_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_global_id_09(GPOUT,33)
    out_global_id_09 <= global_id_09_mux_q;

    -- i_03_mux(MUX,8)
    i_03_mux_s <= in_valid_in_0;
    i_03_mux_combproc: PROCESS (i_03_mux_s, in_i_03_1, in_i_03_0)
    BEGIN
        CASE (i_03_mux_s) IS
            WHEN "0" => i_03_mux_q <= in_i_03_1;
            WHEN "1" => i_03_mux_q <= in_i_03_0;
            WHEN OTHERS => i_03_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_i_03(GPOUT,34)
    out_i_03 <= i_03_mux_q;

    -- valid_or(LOGICAL,42)
    valid_or_q <= in_valid_in_0 or in_valid_in_1;

    -- stall_out(LOGICAL,39)
    stall_out_q <= valid_or_q and in_stall_in;

    -- out_stall_out_0(GPOUT,35)
    out_stall_out_0 <= stall_out_q;

    -- stall_out_1_specific(LOGICAL,40)
    stall_out_1_specific_q <= in_valid_in_0 or stall_out_q;

    -- out_stall_out_1(GPOUT,36)
    out_stall_out_1 <= stall_out_1_specific_q;

    -- tmp_02_mux(MUX,41)
    tmp_02_mux_s <= in_valid_in_0;
    tmp_02_mux_combproc: PROCESS (tmp_02_mux_s, in_tmp_02_1, in_tmp_02_0)
    BEGIN
        CASE (tmp_02_mux_s) IS
            WHEN "0" => tmp_02_mux_q <= in_tmp_02_1;
            WHEN "1" => tmp_02_mux_q <= in_tmp_02_0;
            WHEN OTHERS => tmp_02_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_tmp_02(GPOUT,37)
    out_tmp_02 <= tmp_02_mux_q;

    -- out_valid_out(GPOUT,38)
    out_valid_out <= valid_or_q;

END normal;
