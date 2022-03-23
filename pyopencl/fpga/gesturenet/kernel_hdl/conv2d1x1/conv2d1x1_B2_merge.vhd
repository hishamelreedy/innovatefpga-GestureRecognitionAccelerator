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

-- VHDL created from conv2d1x1_B2_merge
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

entity conv2d1x1_B2_merge is
    port (
        in_c0_exe11_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe11_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_i_0115_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_0115_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_179_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_179_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_24_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_24_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im_addr_0107_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_0107_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_1611_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_1611_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_tmp_23_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_tmp_23_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d1x12_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_conv2d1x12_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_i_0115 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_179 : out std_logic_vector(31 downto 0);  -- ufix32
        out_k_24 : out std_logic_vector(31 downto 0);  -- ufix32
        out_output_im_addr_0107 : out std_logic_vector(63 downto 0);  -- ufix64
        out_output_im_addr_1611 : out std_logic_vector(63 downto 0);  -- ufix64
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_tmp_23 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_unnamed_conv2d1x12 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end conv2d1x1_B2_merge;

architecture normal of conv2d1x1_B2_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe11_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe11_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_0115_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_0115_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal j_179_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal j_179_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal k_24_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal k_24_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal output_im_addr_0107_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal output_im_addr_0107_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal output_im_addr_1611_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal output_im_addr_1611_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_23_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_23_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal unnamed_conv2d1x12_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_conv2d1x12_mux_q : STD_LOGIC_VECTOR (31 downto 0);
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

    -- out_c0_exe11(GPOUT,25)
    out_c0_exe11 <= c0_exe11_mux_q;

    -- i_0115_mux(MUX,3)
    i_0115_mux_s <= in_valid_in_0;
    i_0115_mux_combproc: PROCESS (i_0115_mux_s, in_i_0115_1, in_i_0115_0)
    BEGIN
        CASE (i_0115_mux_s) IS
            WHEN "0" => i_0115_mux_q <= in_i_0115_1;
            WHEN "1" => i_0115_mux_q <= in_i_0115_0;
            WHEN OTHERS => i_0115_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_i_0115(GPOUT,26)
    out_i_0115 <= i_0115_mux_q;

    -- j_179_mux(MUX,23)
    j_179_mux_s <= in_valid_in_0;
    j_179_mux_combproc: PROCESS (j_179_mux_s, in_j_179_1, in_j_179_0)
    BEGIN
        CASE (j_179_mux_s) IS
            WHEN "0" => j_179_mux_q <= in_j_179_1;
            WHEN "1" => j_179_mux_q <= in_j_179_0;
            WHEN OTHERS => j_179_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_j_179(GPOUT,27)
    out_j_179 <= j_179_mux_q;

    -- k_24_mux(MUX,24)
    k_24_mux_s <= in_valid_in_0;
    k_24_mux_combproc: PROCESS (k_24_mux_s, in_k_24_1, in_k_24_0)
    BEGIN
        CASE (k_24_mux_s) IS
            WHEN "0" => k_24_mux_q <= in_k_24_1;
            WHEN "1" => k_24_mux_q <= in_k_24_0;
            WHEN OTHERS => k_24_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_k_24(GPOUT,28)
    out_k_24 <= k_24_mux_q;

    -- output_im_addr_0107_mux(MUX,36)
    output_im_addr_0107_mux_s <= in_valid_in_0;
    output_im_addr_0107_mux_combproc: PROCESS (output_im_addr_0107_mux_s, in_output_im_addr_0107_1, in_output_im_addr_0107_0)
    BEGIN
        CASE (output_im_addr_0107_mux_s) IS
            WHEN "0" => output_im_addr_0107_mux_q <= in_output_im_addr_0107_1;
            WHEN "1" => output_im_addr_0107_mux_q <= in_output_im_addr_0107_0;
            WHEN OTHERS => output_im_addr_0107_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_output_im_addr_0107(GPOUT,29)
    out_output_im_addr_0107 <= output_im_addr_0107_mux_q;

    -- output_im_addr_1611_mux(MUX,37)
    output_im_addr_1611_mux_s <= in_valid_in_0;
    output_im_addr_1611_mux_combproc: PROCESS (output_im_addr_1611_mux_s, in_output_im_addr_1611_1, in_output_im_addr_1611_0)
    BEGIN
        CASE (output_im_addr_1611_mux_s) IS
            WHEN "0" => output_im_addr_1611_mux_q <= in_output_im_addr_1611_1;
            WHEN "1" => output_im_addr_1611_mux_q <= in_output_im_addr_1611_0;
            WHEN OTHERS => output_im_addr_1611_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_output_im_addr_1611(GPOUT,30)
    out_output_im_addr_1611 <= output_im_addr_1611_mux_q;

    -- valid_or(LOGICAL,42)
    valid_or_q <= in_valid_in_0 or in_valid_in_1;

    -- stall_out(LOGICAL,38)
    stall_out_q <= valid_or_q and in_stall_in;

    -- out_stall_out_0(GPOUT,31)
    out_stall_out_0 <= stall_out_q;

    -- stall_out_1_specific(LOGICAL,39)
    stall_out_1_specific_q <= in_valid_in_0 or stall_out_q;

    -- out_stall_out_1(GPOUT,32)
    out_stall_out_1 <= stall_out_1_specific_q;

    -- tmp_23_mux(MUX,40)
    tmp_23_mux_s <= in_valid_in_0;
    tmp_23_mux_combproc: PROCESS (tmp_23_mux_s, in_tmp_23_1, in_tmp_23_0)
    BEGIN
        CASE (tmp_23_mux_s) IS
            WHEN "0" => tmp_23_mux_q <= in_tmp_23_1;
            WHEN "1" => tmp_23_mux_q <= in_tmp_23_0;
            WHEN OTHERS => tmp_23_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_tmp_23(GPOUT,33)
    out_tmp_23 <= tmp_23_mux_q;

    -- unnamed_conv2d1x12_mux(MUX,41)
    unnamed_conv2d1x12_mux_s <= in_valid_in_0;
    unnamed_conv2d1x12_mux_combproc: PROCESS (unnamed_conv2d1x12_mux_s, in_unnamed_conv2d1x12_1, in_unnamed_conv2d1x12_0)
    BEGIN
        CASE (unnamed_conv2d1x12_mux_s) IS
            WHEN "0" => unnamed_conv2d1x12_mux_q <= in_unnamed_conv2d1x12_1;
            WHEN "1" => unnamed_conv2d1x12_mux_q <= in_unnamed_conv2d1x12_0;
            WHEN OTHERS => unnamed_conv2d1x12_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_unnamed_conv2d1x12(GPOUT,34)
    out_unnamed_conv2d1x12 <= unnamed_conv2d1x12_mux_q;

    -- out_valid_out(GPOUT,35)
    out_valid_out <= valid_or_q;

END normal;
