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

-- VHDL created from i_sfc_logic_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x179
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

entity i_sfc_logic_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x179 is
    port (
        in_c0_eni6_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni6_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni6_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni6_3 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni6_4 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni6_5 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni6_6 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_input_channels : in std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi142_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi142_1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x179;

architecture normal of i_sfc_logic_c0_for_body14_unifiedlatchblock_switch_conv2d1x1_c0_enter38_conv2d1x179 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_syncbuf_input_channels_sync_buffer7_conv2d1x181 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c_float_0_000000e_00_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_28_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_29_conv2d1x1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_29_conv2d1x1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_30_conv2d1x1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_30_conv2d1x1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_cmp122_rm71_conv2d1x1_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp122_rm71_conv2d1x1_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp122_rm71_conv2d1x1_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp122_rm71_conv2d1x1_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cond_conv2d1x1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cond_conv2d1x1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_not_exitcond40_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select36_conv2d1x1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select36_conv2d1x1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_input_channels_sync_buffer7_conv2d1x1_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal cstAllOWE_uid20_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid21_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid22_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal exp_x_uid23_i_cmp26_conv2d1x1_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid24_i_cmp26_conv2d1x1_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expXIsZero_uid25_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid26_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid27_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid28_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid29_i_cmp26_conv2d1x1_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid29_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid31_i_cmp26_conv2d1x1_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid31_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_y_uid40_i_cmp26_conv2d1x1_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_y_uid41_i_cmp26_conv2d1x1_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expXIsZero_uid42_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid43_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid44_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid45_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid46_i_cmp26_conv2d1x1_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid46_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid48_i_cmp26_conv2d1x1_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid48_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid54_i_cmp26_conv2d1x1_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid54_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracX_uid59_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid61_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (30 downto 0);
    signal efxGTefy_uid63_i_cmp26_conv2d1x1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid63_i_cmp26_conv2d1x1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid63_i_cmp26_conv2d1x1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid63_i_cmp26_conv2d1x1_c : STD_LOGIC_VECTOR (0 downto 0);
    signal efxLTefy_uid64_i_cmp26_conv2d1x1_a : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid64_i_cmp26_conv2d1x1_b : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid64_i_cmp26_conv2d1x1_o : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid64_i_cmp26_conv2d1x1_c : STD_LOGIC_VECTOR (0 downto 0);
    signal signX_uid68_i_cmp26_conv2d1x1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid69_i_cmp26_conv2d1x1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal two_uid70_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal concSXSY_uid71_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sxLTsy_uid72_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xorSigns_uid73_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsy_uid74_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid75_i_cmp26_conv2d1x1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid75_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcYZ_uid76_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcXZ_uid77_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneNonZero_uid78_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rc2_uid79_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsyExpFracCompMux_uid80_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid81_i_cmp26_conv2d1x1_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid81_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid82_i_cmp26_conv2d1x1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid82_i_cmp26_conv2d1x1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_select36_conv2d1x1_q_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_select36_conv2d1x1_q_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_sync_in_aunroll_x_in_c0_eni6_6_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_sync_in_aunroll_x_in_i_valid_4_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist3_sync_in_aunroll_x_in_i_valid_4(DELAY,86)
    redist3_sync_in_aunroll_x_in_i_valid_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist3_sync_in_aunroll_x_in_i_valid_4_q, clk => clock, aclr => resetn );

    -- i_not_exitcond40_conv2d1x1(LOGICAL,14)@0
    i_not_exitcond40_conv2d1x1_q <= in_c0_eni6_1 xor VCC_q;

    -- i_acl_28_conv2d1x1(LOGICAL,8)@0
    i_acl_28_conv2d1x1_q <= in_c0_eni6_2 and i_not_exitcond40_conv2d1x1_q;

    -- i_acl_29_conv2d1x1(MUX,9)@0
    i_acl_29_conv2d1x1_s <= i_acl_28_conv2d1x1_q;
    i_acl_29_conv2d1x1_combproc: PROCESS (i_acl_29_conv2d1x1_s, in_c0_eni6_4, in_c0_eni6_3)
    BEGIN
        CASE (i_acl_29_conv2d1x1_s) IS
            WHEN "0" => i_acl_29_conv2d1x1_q <= in_c0_eni6_4;
            WHEN "1" => i_acl_29_conv2d1x1_q <= in_c0_eni6_3;
            WHEN OTHERS => i_acl_29_conv2d1x1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_30_conv2d1x1(MUX,10)@0 + 1
    i_acl_30_conv2d1x1_s <= in_c0_eni6_1;
    i_acl_30_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_acl_30_conv2d1x1_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_acl_30_conv2d1x1_s) IS
                WHEN "0" => i_acl_30_conv2d1x1_q <= i_acl_29_conv2d1x1_q;
                WHEN "1" => i_acl_30_conv2d1x1_q <= in_c0_eni6_5;
                WHEN OTHERS => i_acl_30_conv2d1x1_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist2_sync_in_aunroll_x_in_c0_eni6_6_1(DELAY,85)
    redist2_sync_in_aunroll_x_in_c0_eni6_6_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni6_6, xout => redist2_sync_in_aunroll_x_in_c0_eni6_6_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_input_channels_sync_buffer7_conv2d1x1(BLACKBOX,16)@0
    thei_syncbuf_input_channels_sync_buffer7_conv2d1x1 : i_syncbuf_input_channels_sync_buffer7_conv2d1x181
    PORT MAP (
        in_buffer_in => in_input_channels,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_input_channels_sync_buffer7_conv2d1x1_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_0gr(CONSTANT,7)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- i_cmp122_rm71_conv2d1x1(COMPARE,11)@0 + 1
    i_cmp122_rm71_conv2d1x1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_0gr_q(31)) & c_i32_0gr_q));
    i_cmp122_rm71_conv2d1x1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_input_channels_sync_buffer7_conv2d1x1_out_buffer_out(31)) & i_syncbuf_input_channels_sync_buffer7_conv2d1x1_out_buffer_out));
    i_cmp122_rm71_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp122_rm71_conv2d1x1_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp122_rm71_conv2d1x1_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp122_rm71_conv2d1x1_a) - SIGNED(i_cmp122_rm71_conv2d1x1_b));
        END IF;
    END PROCESS;
    i_cmp122_rm71_conv2d1x1_c(0) <= i_cmp122_rm71_conv2d1x1_o(33);

    -- i_select36_conv2d1x1(MUX,15)@1 + 1
    i_select36_conv2d1x1_s <= i_cmp122_rm71_conv2d1x1_c;
    i_select36_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_select36_conv2d1x1_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_select36_conv2d1x1_s) IS
                WHEN "0" => i_select36_conv2d1x1_q <= redist2_sync_in_aunroll_x_in_c0_eni6_6_1_q;
                WHEN "1" => i_select36_conv2d1x1_q <= i_acl_30_conv2d1x1_q;
                WHEN OTHERS => i_select36_conv2d1x1_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist0_i_select36_conv2d1x1_q_2(DELAY,83)
    redist0_i_select36_conv2d1x1_q_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_select36_conv2d1x1_q, xout => redist0_i_select36_conv2d1x1_q_2_q, clk => clock, aclr => resetn );

    -- redist1_i_select36_conv2d1x1_q_3(DELAY,84)
    redist1_i_select36_conv2d1x1_q_3 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist0_i_select36_conv2d1x1_q_2_q, xout => redist1_i_select36_conv2d1x1_q_3_q, clk => clock, aclr => resetn );

    -- c_float_0_000000e_00(FLOATCONSTANT,4)
    c_float_0_000000e_00_q <= "00000000000000000000000000000000";

    -- frac_y_uid41_i_cmp26_conv2d1x1(BITSELECT,40)@2
    frac_y_uid41_i_cmp26_conv2d1x1_b <= i_select36_conv2d1x1_q(22 downto 0);

    -- cstZeroWF_uid21_i_cmp26_conv2d1x1(CONSTANT,20)
    cstZeroWF_uid21_i_cmp26_conv2d1x1_q <= "00000000000000000000000";

    -- fracXIsZero_uid44_i_cmp26_conv2d1x1(LOGICAL,43)@2
    fracXIsZero_uid44_i_cmp26_conv2d1x1_q <= "1" WHEN cstZeroWF_uid21_i_cmp26_conv2d1x1_q = frac_y_uid41_i_cmp26_conv2d1x1_b ELSE "0";

    -- cstAllZWE_uid22_i_cmp26_conv2d1x1(CONSTANT,21)
    cstAllZWE_uid22_i_cmp26_conv2d1x1_q <= "00000000";

    -- exp_y_uid40_i_cmp26_conv2d1x1(BITSELECT,39)@2
    exp_y_uid40_i_cmp26_conv2d1x1_b <= i_select36_conv2d1x1_q(30 downto 23);

    -- expXIsZero_uid42_i_cmp26_conv2d1x1(LOGICAL,41)@2
    expXIsZero_uid42_i_cmp26_conv2d1x1_q <= "1" WHEN exp_y_uid40_i_cmp26_conv2d1x1_b = cstAllZWE_uid22_i_cmp26_conv2d1x1_q ELSE "0";

    -- excZ_y_uid46_i_cmp26_conv2d1x1(LOGICAL,45)@2 + 1
    excZ_y_uid46_i_cmp26_conv2d1x1_qi <= expXIsZero_uid42_i_cmp26_conv2d1x1_q and fracXIsZero_uid44_i_cmp26_conv2d1x1_q;
    excZ_y_uid46_i_cmp26_conv2d1x1_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excZ_y_uid46_i_cmp26_conv2d1x1_qi, xout => excZ_y_uid46_i_cmp26_conv2d1x1_q, clk => clock, aclr => resetn );

    -- invExcYZ_uid76_i_cmp26_conv2d1x1(LOGICAL,75)@3
    invExcYZ_uid76_i_cmp26_conv2d1x1_q <= not (excZ_y_uid46_i_cmp26_conv2d1x1_q);

    -- frac_x_uid24_i_cmp26_conv2d1x1(BITSELECT,23)@2
    frac_x_uid24_i_cmp26_conv2d1x1_b <= c_float_0_000000e_00_q(22 downto 0);

    -- fracXIsZero_uid27_i_cmp26_conv2d1x1(LOGICAL,26)@2
    fracXIsZero_uid27_i_cmp26_conv2d1x1_q <= "1" WHEN cstZeroWF_uid21_i_cmp26_conv2d1x1_q = frac_x_uid24_i_cmp26_conv2d1x1_b ELSE "0";

    -- exp_x_uid23_i_cmp26_conv2d1x1(BITSELECT,22)@2
    exp_x_uid23_i_cmp26_conv2d1x1_b <= c_float_0_000000e_00_q(30 downto 23);

    -- expXIsZero_uid25_i_cmp26_conv2d1x1(LOGICAL,24)@2
    expXIsZero_uid25_i_cmp26_conv2d1x1_q <= "1" WHEN exp_x_uid23_i_cmp26_conv2d1x1_b = cstAllZWE_uid22_i_cmp26_conv2d1x1_q ELSE "0";

    -- excZ_x_uid29_i_cmp26_conv2d1x1(LOGICAL,28)@2 + 1
    excZ_x_uid29_i_cmp26_conv2d1x1_qi <= expXIsZero_uid25_i_cmp26_conv2d1x1_q and fracXIsZero_uid27_i_cmp26_conv2d1x1_q;
    excZ_x_uid29_i_cmp26_conv2d1x1_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excZ_x_uid29_i_cmp26_conv2d1x1_qi, xout => excZ_x_uid29_i_cmp26_conv2d1x1_q, clk => clock, aclr => resetn );

    -- invExcXZ_uid77_i_cmp26_conv2d1x1(LOGICAL,76)@3
    invExcXZ_uid77_i_cmp26_conv2d1x1_q <= not (excZ_x_uid29_i_cmp26_conv2d1x1_q);

    -- oneNonZero_uid78_i_cmp26_conv2d1x1(LOGICAL,77)@3
    oneNonZero_uid78_i_cmp26_conv2d1x1_q <= invExcXZ_uid77_i_cmp26_conv2d1x1_q or invExcYZ_uid76_i_cmp26_conv2d1x1_q;

    -- two_uid70_i_cmp26_conv2d1x1(CONSTANT,69)
    two_uid70_i_cmp26_conv2d1x1_q <= "10";

    -- signX_uid68_i_cmp26_conv2d1x1(BITSELECT,67)@3
    signX_uid68_i_cmp26_conv2d1x1_b <= STD_LOGIC_VECTOR(c_float_0_000000e_00_q(31 downto 31));

    -- signY_uid69_i_cmp26_conv2d1x1(BITSELECT,68)@3
    signY_uid69_i_cmp26_conv2d1x1_b <= STD_LOGIC_VECTOR(redist0_i_select36_conv2d1x1_q_2_q(31 downto 31));

    -- concSXSY_uid71_i_cmp26_conv2d1x1(BITJOIN,70)@3
    concSXSY_uid71_i_cmp26_conv2d1x1_q <= signX_uid68_i_cmp26_conv2d1x1_b & signY_uid69_i_cmp26_conv2d1x1_b;

    -- sxLTsy_uid72_i_cmp26_conv2d1x1(LOGICAL,71)@3
    sxLTsy_uid72_i_cmp26_conv2d1x1_q <= "1" WHEN concSXSY_uid71_i_cmp26_conv2d1x1_q = two_uid70_i_cmp26_conv2d1x1_q ELSE "0";

    -- rc2_uid79_i_cmp26_conv2d1x1(LOGICAL,78)@3
    rc2_uid79_i_cmp26_conv2d1x1_q <= sxLTsy_uid72_i_cmp26_conv2d1x1_q and oneNonZero_uid78_i_cmp26_conv2d1x1_q;

    -- expFracX_uid59_i_cmp26_conv2d1x1(BITJOIN,58)@2
    expFracX_uid59_i_cmp26_conv2d1x1_q <= exp_x_uid23_i_cmp26_conv2d1x1_b & frac_x_uid24_i_cmp26_conv2d1x1_b;

    -- expFracY_uid61_i_cmp26_conv2d1x1(BITJOIN,60)@2
    expFracY_uid61_i_cmp26_conv2d1x1_q <= exp_y_uid40_i_cmp26_conv2d1x1_b & frac_y_uid41_i_cmp26_conv2d1x1_b;

    -- efxGTefy_uid63_i_cmp26_conv2d1x1(COMPARE,62)@2 + 1
    efxGTefy_uid63_i_cmp26_conv2d1x1_a <= STD_LOGIC_VECTOR("00" & expFracY_uid61_i_cmp26_conv2d1x1_q);
    efxGTefy_uid63_i_cmp26_conv2d1x1_b <= STD_LOGIC_VECTOR("00" & expFracX_uid59_i_cmp26_conv2d1x1_q);
    efxGTefy_uid63_i_cmp26_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            efxGTefy_uid63_i_cmp26_conv2d1x1_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            efxGTefy_uid63_i_cmp26_conv2d1x1_o <= STD_LOGIC_VECTOR(UNSIGNED(efxGTefy_uid63_i_cmp26_conv2d1x1_a) - UNSIGNED(efxGTefy_uid63_i_cmp26_conv2d1x1_b));
        END IF;
    END PROCESS;
    efxGTefy_uid63_i_cmp26_conv2d1x1_c(0) <= efxGTefy_uid63_i_cmp26_conv2d1x1_o(32);

    -- efxLTefy_uid64_i_cmp26_conv2d1x1(COMPARE,63)@2 + 1
    efxLTefy_uid64_i_cmp26_conv2d1x1_a <= STD_LOGIC_VECTOR("00" & expFracX_uid59_i_cmp26_conv2d1x1_q);
    efxLTefy_uid64_i_cmp26_conv2d1x1_b <= STD_LOGIC_VECTOR("00" & expFracY_uid61_i_cmp26_conv2d1x1_q);
    efxLTefy_uid64_i_cmp26_conv2d1x1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            efxLTefy_uid64_i_cmp26_conv2d1x1_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            efxLTefy_uid64_i_cmp26_conv2d1x1_o <= STD_LOGIC_VECTOR(UNSIGNED(efxLTefy_uid64_i_cmp26_conv2d1x1_a) - UNSIGNED(efxLTefy_uid64_i_cmp26_conv2d1x1_b));
        END IF;
    END PROCESS;
    efxLTefy_uid64_i_cmp26_conv2d1x1_c(0) <= efxLTefy_uid64_i_cmp26_conv2d1x1_o(32);

    -- expFracCompMux_uid75_i_cmp26_conv2d1x1(MUX,74)@3
    expFracCompMux_uid75_i_cmp26_conv2d1x1_s <= signX_uid68_i_cmp26_conv2d1x1_b;
    expFracCompMux_uid75_i_cmp26_conv2d1x1_combproc: PROCESS (expFracCompMux_uid75_i_cmp26_conv2d1x1_s, efxLTefy_uid64_i_cmp26_conv2d1x1_c, efxGTefy_uid63_i_cmp26_conv2d1x1_c)
    BEGIN
        CASE (expFracCompMux_uid75_i_cmp26_conv2d1x1_s) IS
            WHEN "0" => expFracCompMux_uid75_i_cmp26_conv2d1x1_q <= efxLTefy_uid64_i_cmp26_conv2d1x1_c;
            WHEN "1" => expFracCompMux_uid75_i_cmp26_conv2d1x1_q <= efxGTefy_uid63_i_cmp26_conv2d1x1_c;
            WHEN OTHERS => expFracCompMux_uid75_i_cmp26_conv2d1x1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- xorSigns_uid73_i_cmp26_conv2d1x1(LOGICAL,72)@3
    xorSigns_uid73_i_cmp26_conv2d1x1_q <= signX_uid68_i_cmp26_conv2d1x1_b xor signY_uid69_i_cmp26_conv2d1x1_b;

    -- sxEQsy_uid74_i_cmp26_conv2d1x1(LOGICAL,73)@3
    sxEQsy_uid74_i_cmp26_conv2d1x1_q <= not (xorSigns_uid73_i_cmp26_conv2d1x1_q);

    -- sxEQsyExpFracCompMux_uid80_i_cmp26_conv2d1x1(LOGICAL,79)@3
    sxEQsyExpFracCompMux_uid80_i_cmp26_conv2d1x1_q <= sxEQsy_uid74_i_cmp26_conv2d1x1_q and expFracCompMux_uid75_i_cmp26_conv2d1x1_q;

    -- r_uid81_i_cmp26_conv2d1x1(LOGICAL,80)@3 + 1
    r_uid81_i_cmp26_conv2d1x1_qi <= sxEQsyExpFracCompMux_uid80_i_cmp26_conv2d1x1_q or rc2_uid79_i_cmp26_conv2d1x1_q;
    r_uid81_i_cmp26_conv2d1x1_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => r_uid81_i_cmp26_conv2d1x1_qi, xout => r_uid81_i_cmp26_conv2d1x1_q, clk => clock, aclr => resetn );

    -- fracXIsNotZero_uid45_i_cmp26_conv2d1x1(LOGICAL,44)@2
    fracXIsNotZero_uid45_i_cmp26_conv2d1x1_q <= not (fracXIsZero_uid44_i_cmp26_conv2d1x1_q);

    -- cstAllOWE_uid20_i_cmp26_conv2d1x1(CONSTANT,19)
    cstAllOWE_uid20_i_cmp26_conv2d1x1_q <= "11111111";

    -- expXIsMax_uid43_i_cmp26_conv2d1x1(LOGICAL,42)@2
    expXIsMax_uid43_i_cmp26_conv2d1x1_q <= "1" WHEN exp_y_uid40_i_cmp26_conv2d1x1_b = cstAllOWE_uid20_i_cmp26_conv2d1x1_q ELSE "0";

    -- excN_y_uid48_i_cmp26_conv2d1x1(LOGICAL,47)@2 + 1
    excN_y_uid48_i_cmp26_conv2d1x1_qi <= expXIsMax_uid43_i_cmp26_conv2d1x1_q and fracXIsNotZero_uid45_i_cmp26_conv2d1x1_q;
    excN_y_uid48_i_cmp26_conv2d1x1_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excN_y_uid48_i_cmp26_conv2d1x1_qi, xout => excN_y_uid48_i_cmp26_conv2d1x1_q, clk => clock, aclr => resetn );

    -- fracXIsNotZero_uid28_i_cmp26_conv2d1x1(LOGICAL,27)@2
    fracXIsNotZero_uid28_i_cmp26_conv2d1x1_q <= not (fracXIsZero_uid27_i_cmp26_conv2d1x1_q);

    -- expXIsMax_uid26_i_cmp26_conv2d1x1(LOGICAL,25)@2
    expXIsMax_uid26_i_cmp26_conv2d1x1_q <= "1" WHEN exp_x_uid23_i_cmp26_conv2d1x1_b = cstAllOWE_uid20_i_cmp26_conv2d1x1_q ELSE "0";

    -- excN_x_uid31_i_cmp26_conv2d1x1(LOGICAL,30)@2 + 1
    excN_x_uid31_i_cmp26_conv2d1x1_qi <= expXIsMax_uid26_i_cmp26_conv2d1x1_q and fracXIsNotZero_uid28_i_cmp26_conv2d1x1_q;
    excN_x_uid31_i_cmp26_conv2d1x1_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => excN_x_uid31_i_cmp26_conv2d1x1_qi, xout => excN_x_uid31_i_cmp26_conv2d1x1_q, clk => clock, aclr => resetn );

    -- oneIsNaN_uid54_i_cmp26_conv2d1x1(LOGICAL,53)@3 + 1
    oneIsNaN_uid54_i_cmp26_conv2d1x1_qi <= excN_x_uid31_i_cmp26_conv2d1x1_q or excN_y_uid48_i_cmp26_conv2d1x1_q;
    oneIsNaN_uid54_i_cmp26_conv2d1x1_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => oneIsNaN_uid54_i_cmp26_conv2d1x1_qi, xout => oneIsNaN_uid54_i_cmp26_conv2d1x1_q, clk => clock, aclr => resetn );

    -- rPostExc_uid82_i_cmp26_conv2d1x1(MUX,81)@4
    rPostExc_uid82_i_cmp26_conv2d1x1_s <= oneIsNaN_uid54_i_cmp26_conv2d1x1_q;
    rPostExc_uid82_i_cmp26_conv2d1x1_combproc: PROCESS (rPostExc_uid82_i_cmp26_conv2d1x1_s, r_uid81_i_cmp26_conv2d1x1_q, GND_q)
    BEGIN
        CASE (rPostExc_uid82_i_cmp26_conv2d1x1_s) IS
            WHEN "0" => rPostExc_uid82_i_cmp26_conv2d1x1_q <= r_uid81_i_cmp26_conv2d1x1_q;
            WHEN "1" => rPostExc_uid82_i_cmp26_conv2d1x1_q <= GND_q;
            WHEN OTHERS => rPostExc_uid82_i_cmp26_conv2d1x1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_cond_conv2d1x1(MUX,13)@4
    i_cond_conv2d1x1_s <= rPostExc_uid82_i_cmp26_conv2d1x1_q;
    i_cond_conv2d1x1_combproc: PROCESS (i_cond_conv2d1x1_s, c_float_0_000000e_00_q, redist1_i_select36_conv2d1x1_q_3_q)
    BEGIN
        CASE (i_cond_conv2d1x1_s) IS
            WHEN "0" => i_cond_conv2d1x1_q <= c_float_0_000000e_00_q;
            WHEN "1" => i_cond_conv2d1x1_q <= redist1_i_select36_conv2d1x1_q_3_q;
            WHEN OTHERS => i_cond_conv2d1x1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,3)@4
    out_c0_exi142_0 <= GND_q;
    out_c0_exi142_1 <= i_cond_conv2d1x1_q;
    out_o_valid <= redist3_sync_in_aunroll_x_in_i_valid_4_q;

END normal;
