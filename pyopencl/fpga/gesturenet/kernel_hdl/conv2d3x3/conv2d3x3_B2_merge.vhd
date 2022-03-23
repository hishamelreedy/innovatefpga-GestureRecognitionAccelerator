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

-- VHDL created from conv2d3x3_B2_merge
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

entity conv2d3x3_B2_merge is
    port (
        in_c0_exe11_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe11_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe121212_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe121212_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe121813_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe121813_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe214_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe214_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe315_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe315_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe416_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe416_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe517_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe517_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe618_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe618_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe719_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe719_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv_0 : in std_logic_vector(2 downto 0);  -- ufix3
        in_fpgaindvars_iv_1 : in std_logic_vector(2 downto 0);  -- ufix3
        in_i_0235_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_0235_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_1159_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_1159_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_210_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_210_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_37_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_l_37_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im_addr_0227_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_0227_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_11411_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_11411_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_tmp_36_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_tmp_36_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d3x32_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d3x32_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe121212 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe121813 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe214 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe315 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe416 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe517 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe618 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe719 : out std_logic_vector(0 downto 0);  -- ufix1
        out_fpgaindvars_iv : out std_logic_vector(2 downto 0);  -- ufix3
        out_i_0235 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_1159 : out std_logic_vector(31 downto 0);  -- ufix32
        out_k_210 : out std_logic_vector(31 downto 0);  -- ufix32
        out_l_37 : out std_logic_vector(31 downto 0);  -- ufix32
        out_output_im_addr_0227 : out std_logic_vector(63 downto 0);  -- ufix64
        out_output_im_addr_11411 : out std_logic_vector(63 downto 0);  -- ufix64
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_tmp_36 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_unnamed_conv2d3x32 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end conv2d3x3_B2_merge;

architecture normal of conv2d3x3_B2_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe11_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe11_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe121212_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe121212_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe121813_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe121813_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c1_exe214_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe214_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe315_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe315_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe416_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe416_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe517_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe517_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe618_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe618_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe719_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe719_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fpgaindvars_iv_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fpgaindvars_iv_mux_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_0235_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_0235_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal j_1159_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal j_1159_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal k_210_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal k_210_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal l_37_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal l_37_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal output_im_addr_0227_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal output_im_addr_0227_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal output_im_addr_11411_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal output_im_addr_11411_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_36_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_36_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal unnamed_conv2d3x32_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_conv2d3x32_mux_q : STD_LOGIC_VECTOR (31 downto 0);
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

    -- out_c0_exe11(GPOUT,55)
    out_c0_exe11 <= c0_exe11_mux_q;

    -- c0_exe121212_mux(MUX,3)
    c0_exe121212_mux_s <= in_valid_in_0;
    c0_exe121212_mux_combproc: PROCESS (c0_exe121212_mux_s, in_c0_exe121212_1, in_c0_exe121212_0)
    BEGIN
        CASE (c0_exe121212_mux_s) IS
            WHEN "0" => c0_exe121212_mux_q <= in_c0_exe121212_1;
            WHEN "1" => c0_exe121212_mux_q <= in_c0_exe121212_0;
            WHEN OTHERS => c0_exe121212_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c0_exe121212(GPOUT,56)
    out_c0_exe121212 <= c0_exe121212_mux_q;

    -- c1_exe121813_mux(MUX,4)
    c1_exe121813_mux_s <= in_valid_in_0;
    c1_exe121813_mux_combproc: PROCESS (c1_exe121813_mux_s, in_c1_exe121813_1, in_c1_exe121813_0)
    BEGIN
        CASE (c1_exe121813_mux_s) IS
            WHEN "0" => c1_exe121813_mux_q <= in_c1_exe121813_1;
            WHEN "1" => c1_exe121813_mux_q <= in_c1_exe121813_0;
            WHEN OTHERS => c1_exe121813_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c1_exe121813(GPOUT,57)
    out_c1_exe121813 <= c1_exe121813_mux_q;

    -- c1_exe214_mux(MUX,5)
    c1_exe214_mux_s <= in_valid_in_0;
    c1_exe214_mux_combproc: PROCESS (c1_exe214_mux_s, in_c1_exe214_1, in_c1_exe214_0)
    BEGIN
        CASE (c1_exe214_mux_s) IS
            WHEN "0" => c1_exe214_mux_q <= in_c1_exe214_1;
            WHEN "1" => c1_exe214_mux_q <= in_c1_exe214_0;
            WHEN OTHERS => c1_exe214_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c1_exe214(GPOUT,58)
    out_c1_exe214 <= c1_exe214_mux_q;

    -- c1_exe315_mux(MUX,6)
    c1_exe315_mux_s <= in_valid_in_0;
    c1_exe315_mux_combproc: PROCESS (c1_exe315_mux_s, in_c1_exe315_1, in_c1_exe315_0)
    BEGIN
        CASE (c1_exe315_mux_s) IS
            WHEN "0" => c1_exe315_mux_q <= in_c1_exe315_1;
            WHEN "1" => c1_exe315_mux_q <= in_c1_exe315_0;
            WHEN OTHERS => c1_exe315_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c1_exe315(GPOUT,59)
    out_c1_exe315 <= c1_exe315_mux_q;

    -- c1_exe416_mux(MUX,7)
    c1_exe416_mux_s <= in_valid_in_0;
    c1_exe416_mux_combproc: PROCESS (c1_exe416_mux_s, in_c1_exe416_1, in_c1_exe416_0)
    BEGIN
        CASE (c1_exe416_mux_s) IS
            WHEN "0" => c1_exe416_mux_q <= in_c1_exe416_1;
            WHEN "1" => c1_exe416_mux_q <= in_c1_exe416_0;
            WHEN OTHERS => c1_exe416_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c1_exe416(GPOUT,60)
    out_c1_exe416 <= c1_exe416_mux_q;

    -- c1_exe517_mux(MUX,8)
    c1_exe517_mux_s <= in_valid_in_0;
    c1_exe517_mux_combproc: PROCESS (c1_exe517_mux_s, in_c1_exe517_1, in_c1_exe517_0)
    BEGIN
        CASE (c1_exe517_mux_s) IS
            WHEN "0" => c1_exe517_mux_q <= in_c1_exe517_1;
            WHEN "1" => c1_exe517_mux_q <= in_c1_exe517_0;
            WHEN OTHERS => c1_exe517_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c1_exe517(GPOUT,61)
    out_c1_exe517 <= c1_exe517_mux_q;

    -- c1_exe618_mux(MUX,9)
    c1_exe618_mux_s <= in_valid_in_0;
    c1_exe618_mux_combproc: PROCESS (c1_exe618_mux_s, in_c1_exe618_1, in_c1_exe618_0)
    BEGIN
        CASE (c1_exe618_mux_s) IS
            WHEN "0" => c1_exe618_mux_q <= in_c1_exe618_1;
            WHEN "1" => c1_exe618_mux_q <= in_c1_exe618_0;
            WHEN OTHERS => c1_exe618_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c1_exe618(GPOUT,62)
    out_c1_exe618 <= c1_exe618_mux_q;

    -- c1_exe719_mux(MUX,10)
    c1_exe719_mux_s <= in_valid_in_0;
    c1_exe719_mux_combproc: PROCESS (c1_exe719_mux_s, in_c1_exe719_1, in_c1_exe719_0)
    BEGIN
        CASE (c1_exe719_mux_s) IS
            WHEN "0" => c1_exe719_mux_q <= in_c1_exe719_1;
            WHEN "1" => c1_exe719_mux_q <= in_c1_exe719_0;
            WHEN OTHERS => c1_exe719_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_c1_exe719(GPOUT,63)
    out_c1_exe719 <= c1_exe719_mux_q;

    -- fpgaindvars_iv_mux(MUX,11)
    fpgaindvars_iv_mux_s <= in_valid_in_0;
    fpgaindvars_iv_mux_combproc: PROCESS (fpgaindvars_iv_mux_s, in_fpgaindvars_iv_1, in_fpgaindvars_iv_0)
    BEGIN
        CASE (fpgaindvars_iv_mux_s) IS
            WHEN "0" => fpgaindvars_iv_mux_q <= in_fpgaindvars_iv_1;
            WHEN "1" => fpgaindvars_iv_mux_q <= in_fpgaindvars_iv_0;
            WHEN OTHERS => fpgaindvars_iv_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_fpgaindvars_iv(GPOUT,64)
    out_fpgaindvars_iv <= fpgaindvars_iv_mux_q;

    -- i_0235_mux(MUX,12)
    i_0235_mux_s <= in_valid_in_0;
    i_0235_mux_combproc: PROCESS (i_0235_mux_s, in_i_0235_1, in_i_0235_0)
    BEGIN
        CASE (i_0235_mux_s) IS
            WHEN "0" => i_0235_mux_q <= in_i_0235_1;
            WHEN "1" => i_0235_mux_q <= in_i_0235_0;
            WHEN OTHERS => i_0235_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_i_0235(GPOUT,65)
    out_i_0235 <= i_0235_mux_q;

    -- j_1159_mux(MUX,52)
    j_1159_mux_s <= in_valid_in_0;
    j_1159_mux_combproc: PROCESS (j_1159_mux_s, in_j_1159_1, in_j_1159_0)
    BEGIN
        CASE (j_1159_mux_s) IS
            WHEN "0" => j_1159_mux_q <= in_j_1159_1;
            WHEN "1" => j_1159_mux_q <= in_j_1159_0;
            WHEN OTHERS => j_1159_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_j_1159(GPOUT,66)
    out_j_1159 <= j_1159_mux_q;

    -- k_210_mux(MUX,53)
    k_210_mux_s <= in_valid_in_0;
    k_210_mux_combproc: PROCESS (k_210_mux_s, in_k_210_1, in_k_210_0)
    BEGIN
        CASE (k_210_mux_s) IS
            WHEN "0" => k_210_mux_q <= in_k_210_1;
            WHEN "1" => k_210_mux_q <= in_k_210_0;
            WHEN OTHERS => k_210_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_k_210(GPOUT,67)
    out_k_210 <= k_210_mux_q;

    -- l_37_mux(MUX,54)
    l_37_mux_s <= in_valid_in_0;
    l_37_mux_combproc: PROCESS (l_37_mux_s, in_l_37_1, in_l_37_0)
    BEGIN
        CASE (l_37_mux_s) IS
            WHEN "0" => l_37_mux_q <= in_l_37_1;
            WHEN "1" => l_37_mux_q <= in_l_37_0;
            WHEN OTHERS => l_37_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_l_37(GPOUT,68)
    out_l_37 <= l_37_mux_q;

    -- output_im_addr_0227_mux(MUX,76)
    output_im_addr_0227_mux_s <= in_valid_in_0;
    output_im_addr_0227_mux_combproc: PROCESS (output_im_addr_0227_mux_s, in_output_im_addr_0227_1, in_output_im_addr_0227_0)
    BEGIN
        CASE (output_im_addr_0227_mux_s) IS
            WHEN "0" => output_im_addr_0227_mux_q <= in_output_im_addr_0227_1;
            WHEN "1" => output_im_addr_0227_mux_q <= in_output_im_addr_0227_0;
            WHEN OTHERS => output_im_addr_0227_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_output_im_addr_0227(GPOUT,69)
    out_output_im_addr_0227 <= output_im_addr_0227_mux_q;

    -- output_im_addr_11411_mux(MUX,77)
    output_im_addr_11411_mux_s <= in_valid_in_0;
    output_im_addr_11411_mux_combproc: PROCESS (output_im_addr_11411_mux_s, in_output_im_addr_11411_1, in_output_im_addr_11411_0)
    BEGIN
        CASE (output_im_addr_11411_mux_s) IS
            WHEN "0" => output_im_addr_11411_mux_q <= in_output_im_addr_11411_1;
            WHEN "1" => output_im_addr_11411_mux_q <= in_output_im_addr_11411_0;
            WHEN OTHERS => output_im_addr_11411_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_output_im_addr_11411(GPOUT,70)
    out_output_im_addr_11411 <= output_im_addr_11411_mux_q;

    -- valid_or(LOGICAL,82)
    valid_or_q <= in_valid_in_0 or in_valid_in_1;

    -- stall_out(LOGICAL,78)
    stall_out_q <= valid_or_q and in_stall_in;

    -- out_stall_out_0(GPOUT,71)
    out_stall_out_0 <= stall_out_q;

    -- stall_out_1_specific(LOGICAL,79)
    stall_out_1_specific_q <= in_valid_in_0 or stall_out_q;

    -- out_stall_out_1(GPOUT,72)
    out_stall_out_1 <= stall_out_1_specific_q;

    -- tmp_36_mux(MUX,80)
    tmp_36_mux_s <= in_valid_in_0;
    tmp_36_mux_combproc: PROCESS (tmp_36_mux_s, in_tmp_36_1, in_tmp_36_0)
    BEGIN
        CASE (tmp_36_mux_s) IS
            WHEN "0" => tmp_36_mux_q <= in_tmp_36_1;
            WHEN "1" => tmp_36_mux_q <= in_tmp_36_0;
            WHEN OTHERS => tmp_36_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_tmp_36(GPOUT,73)
    out_tmp_36 <= tmp_36_mux_q;

    -- unnamed_conv2d3x32_mux(MUX,81)
    unnamed_conv2d3x32_mux_s <= in_valid_in_0;
    unnamed_conv2d3x32_mux_combproc: PROCESS (unnamed_conv2d3x32_mux_s, in_unnamed_conv2d3x32_1, in_unnamed_conv2d3x32_0)
    BEGIN
        CASE (unnamed_conv2d3x32_mux_s) IS
            WHEN "0" => unnamed_conv2d3x32_mux_q <= in_unnamed_conv2d3x32_1;
            WHEN "1" => unnamed_conv2d3x32_mux_q <= in_unnamed_conv2d3x32_0;
            WHEN OTHERS => unnamed_conv2d3x32_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_unnamed_conv2d3x32(GPOUT,74)
    out_unnamed_conv2d3x32 <= unnamed_conv2d3x32_mux_q;

    -- out_valid_out(GPOUT,75)
    out_valid_out <= valid_or_q;

END normal;
