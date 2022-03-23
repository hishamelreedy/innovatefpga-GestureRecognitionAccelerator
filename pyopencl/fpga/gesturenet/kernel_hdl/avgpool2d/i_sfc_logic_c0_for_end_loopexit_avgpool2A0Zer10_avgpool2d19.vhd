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

-- VHDL created from i_sfc_logic_c0_for_end_loopexit_avgpool2d_c0_enter10_avgpool2d19
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

entity i_sfc_logic_c0_for_end_loopexit_avgpool2d_c0_enter10_avgpool2d19 is
    port (
        in_c0_eni3_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni3_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni3_2 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni3_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi113_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi113_1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_for_end_loopexit_avgpool2d_c0_enter10_avgpool2d19;

architecture normal of i_sfc_logic_c0_for_end_loopexit_avgpool2d_c0_enter10_avgpool2d19 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component floatComponent_i_sfc_logic_c0_for_end_loopexit_avgpool2d_c0_enter10_avgpool2d19_A0Z8744ck26742c246j2x65 is
        port (
            in_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_primWireOut : out std_logic_vector(31 downto 0);  -- Floating Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component floatComponent_i_sfc_logic_c0_for_end_loopexit_avgpool2d_c0_enter10_avgpool2d19_A0Z16oe0cp36cd0oq3cdj6z is
        port (
            in_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            out_primWireOut : out std_logic_vector(31 downto 0);  -- Floating Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c_float_0_000000e_00_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv6_avgpool2d_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_div_avgpool2d_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_select4_avgpool2d_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select4_avgpool2d_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_conv6_avgpool2d_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_select4_avgpool2d_q_21_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_select4_avgpool2d_q_21_mem_reset0 : std_logic;
    signal redist0_i_select4_avgpool2d_q_21_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_select4_avgpool2d_q_21_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist0_i_select4_avgpool2d_q_21_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist0_i_select4_avgpool2d_q_21_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_select4_avgpool2d_q_21_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_select4_avgpool2d_q_21_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist0_i_select4_avgpool2d_q_21_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist0_i_select4_avgpool2d_q_21_rdcnt_i : signal is true;
    signal redist0_i_select4_avgpool2d_q_21_rdcnt_eq : std_logic;
    attribute preserve of redist0_i_select4_avgpool2d_q_21_rdcnt_eq : signal is true;
    signal redist0_i_select4_avgpool2d_q_21_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist0_i_select4_avgpool2d_q_21_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist0_i_select4_avgpool2d_q_21_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist0_i_select4_avgpool2d_q_21_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_select4_avgpool2d_q_21_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_select4_avgpool2d_q_21_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_select4_avgpool2d_q_21_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_select4_avgpool2d_q_21_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist0_i_select4_avgpool2d_q_21_sticky_ena_q : signal is true;
    signal redist0_i_select4_avgpool2d_q_21_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_sync_in_aunroll_x_in_i_valid_33_mem_reset0 : std_logic;
    signal redist2_sync_in_aunroll_x_in_i_valid_33_mem_ia : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_sync_in_aunroll_x_in_i_valid_33_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist2_sync_in_aunroll_x_in_i_valid_33_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist2_sync_in_aunroll_x_in_i_valid_33_mem_iq : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_sync_in_aunroll_x_in_i_valid_33_mem_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_sync_in_aunroll_x_in_i_valid_33_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist2_sync_in_aunroll_x_in_i_valid_33_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist2_sync_in_aunroll_x_in_i_valid_33_rdcnt_i : signal is true;
    signal redist2_sync_in_aunroll_x_in_i_valid_33_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist2_sync_in_aunroll_x_in_i_valid_33_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist2_sync_in_aunroll_x_in_i_valid_33_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist2_sync_in_aunroll_x_in_i_valid_33_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_sync_in_aunroll_x_in_i_valid_33_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_sync_in_aunroll_x_in_i_valid_33_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_sync_in_aunroll_x_in_i_valid_33_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_sync_in_aunroll_x_in_i_valid_33_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist2_sync_in_aunroll_x_in_i_valid_33_sticky_ena_q : signal is true;
    signal redist2_sync_in_aunroll_x_in_i_valid_33_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- redist2_sync_in_aunroll_x_in_i_valid_33_notEnable(LOGICAL,30)
    redist2_sync_in_aunroll_x_in_i_valid_33_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist2_sync_in_aunroll_x_in_i_valid_33_nor(LOGICAL,31)
    redist2_sync_in_aunroll_x_in_i_valid_33_nor_q <= not (redist2_sync_in_aunroll_x_in_i_valid_33_notEnable_q or redist2_sync_in_aunroll_x_in_i_valid_33_sticky_ena_q);

    -- redist2_sync_in_aunroll_x_in_i_valid_33_mem_last(CONSTANT,27)
    redist2_sync_in_aunroll_x_in_i_valid_33_mem_last_q <= "011110";

    -- redist2_sync_in_aunroll_x_in_i_valid_33_cmp(LOGICAL,28)
    redist2_sync_in_aunroll_x_in_i_valid_33_cmp_b <= STD_LOGIC_VECTOR("0" & redist2_sync_in_aunroll_x_in_i_valid_33_rdcnt_q);
    redist2_sync_in_aunroll_x_in_i_valid_33_cmp_q <= "1" WHEN redist2_sync_in_aunroll_x_in_i_valid_33_mem_last_q = redist2_sync_in_aunroll_x_in_i_valid_33_cmp_b ELSE "0";

    -- redist2_sync_in_aunroll_x_in_i_valid_33_cmpReg(REG,29)
    redist2_sync_in_aunroll_x_in_i_valid_33_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_sync_in_aunroll_x_in_i_valid_33_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist2_sync_in_aunroll_x_in_i_valid_33_cmpReg_q <= STD_LOGIC_VECTOR(redist2_sync_in_aunroll_x_in_i_valid_33_cmp_q);
        END IF;
    END PROCESS;

    -- redist2_sync_in_aunroll_x_in_i_valid_33_sticky_ena(REG,32)
    redist2_sync_in_aunroll_x_in_i_valid_33_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_sync_in_aunroll_x_in_i_valid_33_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist2_sync_in_aunroll_x_in_i_valid_33_nor_q = "1") THEN
                redist2_sync_in_aunroll_x_in_i_valid_33_sticky_ena_q <= STD_LOGIC_VECTOR(redist2_sync_in_aunroll_x_in_i_valid_33_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_sync_in_aunroll_x_in_i_valid_33_enaAnd(LOGICAL,33)
    redist2_sync_in_aunroll_x_in_i_valid_33_enaAnd_q <= redist2_sync_in_aunroll_x_in_i_valid_33_sticky_ena_q and VCC_q;

    -- redist2_sync_in_aunroll_x_in_i_valid_33_rdcnt(COUNTER,25)
    -- low=0, high=31, step=1, init=0
    redist2_sync_in_aunroll_x_in_i_valid_33_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_sync_in_aunroll_x_in_i_valid_33_rdcnt_i <= TO_UNSIGNED(0, 5);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist2_sync_in_aunroll_x_in_i_valid_33_rdcnt_i <= redist2_sync_in_aunroll_x_in_i_valid_33_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist2_sync_in_aunroll_x_in_i_valid_33_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist2_sync_in_aunroll_x_in_i_valid_33_rdcnt_i, 5)));

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist2_sync_in_aunroll_x_in_i_valid_33_wraddr(REG,26)
    redist2_sync_in_aunroll_x_in_i_valid_33_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_sync_in_aunroll_x_in_i_valid_33_wraddr_q <= "11111";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist2_sync_in_aunroll_x_in_i_valid_33_wraddr_q <= STD_LOGIC_VECTOR(redist2_sync_in_aunroll_x_in_i_valid_33_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist2_sync_in_aunroll_x_in_i_valid_33_mem(DUALMEM,24)
    redist2_sync_in_aunroll_x_in_i_valid_33_mem_ia <= STD_LOGIC_VECTOR(in_i_valid);
    redist2_sync_in_aunroll_x_in_i_valid_33_mem_aa <= redist2_sync_in_aunroll_x_in_i_valid_33_wraddr_q;
    redist2_sync_in_aunroll_x_in_i_valid_33_mem_ab <= redist2_sync_in_aunroll_x_in_i_valid_33_rdcnt_q;
    redist2_sync_in_aunroll_x_in_i_valid_33_mem_reset0 <= not (resetn);
    redist2_sync_in_aunroll_x_in_i_valid_33_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 5,
        numwords_a => 32,
        width_b => 1,
        widthad_b => 5,
        numwords_b => 32,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist2_sync_in_aunroll_x_in_i_valid_33_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist2_sync_in_aunroll_x_in_i_valid_33_mem_reset0,
        clock1 => clock,
        address_a => redist2_sync_in_aunroll_x_in_i_valid_33_mem_aa,
        data_a => redist2_sync_in_aunroll_x_in_i_valid_33_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist2_sync_in_aunroll_x_in_i_valid_33_mem_ab,
        q_b => redist2_sync_in_aunroll_x_in_i_valid_33_mem_iq
    );
    redist2_sync_in_aunroll_x_in_i_valid_33_mem_q <= redist2_sync_in_aunroll_x_in_i_valid_33_mem_iq(0 downto 0);

    -- i_conv6_avgpool2d(BLACKBOX,6)@0
    -- out out_primWireOut@11
    thei_conv6_avgpool2d : floatComponent_i_sfc_logic_c0_for_end_loopexit_avgpool2d_c0_enter10_avgpool2d19_A0Z8744ck26742c246j2x65
    PORT MAP (
        in_0 => in_c0_eni3_3,
        out_primWireOut => i_conv6_avgpool2d_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist1_i_conv6_avgpool2d_out_primWireOut_1(DELAY,11)
    redist1_i_conv6_avgpool2d_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_conv6_avgpool2d_out_primWireOut, xout => redist1_i_conv6_avgpool2d_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist0_i_select4_avgpool2d_q_21_notEnable(LOGICAL,20)
    redist0_i_select4_avgpool2d_q_21_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist0_i_select4_avgpool2d_q_21_nor(LOGICAL,21)
    redist0_i_select4_avgpool2d_q_21_nor_q <= not (redist0_i_select4_avgpool2d_q_21_notEnable_q or redist0_i_select4_avgpool2d_q_21_sticky_ena_q);

    -- redist0_i_select4_avgpool2d_q_21_mem_last(CONSTANT,17)
    redist0_i_select4_avgpool2d_q_21_mem_last_q <= "010000";

    -- redist0_i_select4_avgpool2d_q_21_cmp(LOGICAL,18)
    redist0_i_select4_avgpool2d_q_21_cmp_b <= STD_LOGIC_VECTOR("0" & redist0_i_select4_avgpool2d_q_21_rdcnt_q);
    redist0_i_select4_avgpool2d_q_21_cmp_q <= "1" WHEN redist0_i_select4_avgpool2d_q_21_mem_last_q = redist0_i_select4_avgpool2d_q_21_cmp_b ELSE "0";

    -- redist0_i_select4_avgpool2d_q_21_cmpReg(REG,19)
    redist0_i_select4_avgpool2d_q_21_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_select4_avgpool2d_q_21_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist0_i_select4_avgpool2d_q_21_cmpReg_q <= STD_LOGIC_VECTOR(redist0_i_select4_avgpool2d_q_21_cmp_q);
        END IF;
    END PROCESS;

    -- redist0_i_select4_avgpool2d_q_21_sticky_ena(REG,22)
    redist0_i_select4_avgpool2d_q_21_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_select4_avgpool2d_q_21_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist0_i_select4_avgpool2d_q_21_nor_q = "1") THEN
                redist0_i_select4_avgpool2d_q_21_sticky_ena_q <= STD_LOGIC_VECTOR(redist0_i_select4_avgpool2d_q_21_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_i_select4_avgpool2d_q_21_enaAnd(LOGICAL,23)
    redist0_i_select4_avgpool2d_q_21_enaAnd_q <= redist0_i_select4_avgpool2d_q_21_sticky_ena_q and VCC_q;

    -- redist0_i_select4_avgpool2d_q_21_rdcnt(COUNTER,15)
    -- low=0, high=17, step=1, init=0
    redist0_i_select4_avgpool2d_q_21_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_select4_avgpool2d_q_21_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist0_i_select4_avgpool2d_q_21_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist0_i_select4_avgpool2d_q_21_rdcnt_i = TO_UNSIGNED(16, 5)) THEN
                redist0_i_select4_avgpool2d_q_21_rdcnt_eq <= '1';
            ELSE
                redist0_i_select4_avgpool2d_q_21_rdcnt_eq <= '0';
            END IF;
            IF (redist0_i_select4_avgpool2d_q_21_rdcnt_eq = '1') THEN
                redist0_i_select4_avgpool2d_q_21_rdcnt_i <= redist0_i_select4_avgpool2d_q_21_rdcnt_i + 15;
            ELSE
                redist0_i_select4_avgpool2d_q_21_rdcnt_i <= redist0_i_select4_avgpool2d_q_21_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist0_i_select4_avgpool2d_q_21_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist0_i_select4_avgpool2d_q_21_rdcnt_i, 5)));

    -- c_float_0_000000e_00(FLOATCONSTANT,4)
    c_float_0_000000e_00_q <= "00000000000000000000000000000000";

    -- i_select4_avgpool2d(MUX,8)@0 + 1
    i_select4_avgpool2d_s <= in_c0_eni3_1;
    i_select4_avgpool2d_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_select4_avgpool2d_q <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (i_select4_avgpool2d_s) IS
                WHEN "0" => i_select4_avgpool2d_q <= c_float_0_000000e_00_q;
                WHEN "1" => i_select4_avgpool2d_q <= in_c0_eni3_2;
                WHEN OTHERS => i_select4_avgpool2d_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist0_i_select4_avgpool2d_q_21_wraddr(REG,16)
    redist0_i_select4_avgpool2d_q_21_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_select4_avgpool2d_q_21_wraddr_q <= "10001";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist0_i_select4_avgpool2d_q_21_wraddr_q <= STD_LOGIC_VECTOR(redist0_i_select4_avgpool2d_q_21_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist0_i_select4_avgpool2d_q_21_mem(DUALMEM,14)
    redist0_i_select4_avgpool2d_q_21_mem_ia <= STD_LOGIC_VECTOR(i_select4_avgpool2d_q);
    redist0_i_select4_avgpool2d_q_21_mem_aa <= redist0_i_select4_avgpool2d_q_21_wraddr_q;
    redist0_i_select4_avgpool2d_q_21_mem_ab <= redist0_i_select4_avgpool2d_q_21_rdcnt_q;
    redist0_i_select4_avgpool2d_q_21_mem_reset0 <= not (resetn);
    redist0_i_select4_avgpool2d_q_21_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 5,
        numwords_a => 18,
        width_b => 32,
        widthad_b => 5,
        numwords_b => 18,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist0_i_select4_avgpool2d_q_21_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist0_i_select4_avgpool2d_q_21_mem_reset0,
        clock1 => clock,
        address_a => redist0_i_select4_avgpool2d_q_21_mem_aa,
        data_a => redist0_i_select4_avgpool2d_q_21_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist0_i_select4_avgpool2d_q_21_mem_ab,
        q_b => redist0_i_select4_avgpool2d_q_21_mem_iq
    );
    redist0_i_select4_avgpool2d_q_21_mem_q <= redist0_i_select4_avgpool2d_q_21_mem_iq(31 downto 0);

    -- redist0_i_select4_avgpool2d_q_21_outputreg(DELAY,13)
    redist0_i_select4_avgpool2d_q_21_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist0_i_select4_avgpool2d_q_21_mem_q, xout => redist0_i_select4_avgpool2d_q_21_outputreg_q, clk => clock, aclr => resetn );

    -- i_div_avgpool2d(BLACKBOX,7)@12
    -- in in_0@21
    -- out out_primWireOut@33
    thei_div_avgpool2d : floatComponent_i_sfc_logic_c0_for_end_loopexit_avgpool2d_c0_enter10_avgpool2d19_A0Z16oe0cp36cd0oq3cdj6z
    PORT MAP (
        in_0 => redist0_i_select4_avgpool2d_q_21_outputreg_q,
        in_1 => redist1_i_conv6_avgpool2d_out_primWireOut_1_q,
        out_primWireOut => i_div_avgpool2d_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,3)@33
    out_c0_exi113_0 <= GND_q;
    out_c0_exi113_1 <= i_div_avgpool2d_out_primWireOut;
    out_o_valid <= redist2_sync_in_aunroll_x_in_i_valid_33_mem_q;

END normal;
