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

-- VHDL created from i_sfc_logic_c1_for_cond5_preheader_fc_c1_enter_fc41
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

entity i_sfc_logic_c1_for_cond5_preheader_fc_c1_enter_fc41 is
    port (
        in_c1_eni6_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni6_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni6_2 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni6_3 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni6_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni6_5 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c1_eni6_6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi2_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi2_1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c1_exi2_2 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c1_for_cond5_preheader_fc_c1_enter_fc41;

architecture normal of i_sfc_logic_c1_for_cond5_preheader_fc_c1_enter_fc41 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component floatComponent_i_sfc_logic_c1_for_cond5_preheader_fc_c1_enter_fc41_addBlock_typeA0Zcp36cd0oq3cd06oq3cz0 is
        port (
            in_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            out_primWireOut : out std_logic_vector(31 downto 0);  -- Floating Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component floatComponent_i_sfc_logic_c1_for_cond5_preheader_fc_c1_enter_fc41_multBlock_typA0Z16oe0cp36cd0oq3cdj6z is
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
    signal i_add17_fc_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_do_directly_for_inc18_loopexit_sel_fc_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_do_directly_for_inc18_loopexit_sel_fc_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_mul16_fc_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_tmp_05_lc_outerphi_fc_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_tmp_05_lc_outerphi_fc_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_mul16_fc_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_add17_fc_out_primWireOut_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_sync_in_aunroll_x_in_c1_eni6_4_23_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_sync_in_aunroll_x_in_c1_eni6_6_23_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_sync_in_aunroll_x_in_i_valid_23_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_sync_in_aunroll_x_in_c1_eni6_3_8_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_sync_in_aunroll_x_in_c1_eni6_3_8_mem_reset0 : std_logic;
    signal redist2_sync_in_aunroll_x_in_c1_eni6_3_8_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_sync_in_aunroll_x_in_c1_eni6_3_8_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist2_sync_in_aunroll_x_in_c1_eni6_3_8_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist2_sync_in_aunroll_x_in_c1_eni6_3_8_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_sync_in_aunroll_x_in_c1_eni6_3_8_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_sync_in_aunroll_x_in_c1_eni6_3_8_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist2_sync_in_aunroll_x_in_c1_eni6_3_8_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist2_sync_in_aunroll_x_in_c1_eni6_3_8_rdcnt_i : signal is true;
    signal redist2_sync_in_aunroll_x_in_c1_eni6_3_8_rdcnt_eq : std_logic;
    attribute preserve of redist2_sync_in_aunroll_x_in_c1_eni6_3_8_rdcnt_eq : signal is true;
    signal redist2_sync_in_aunroll_x_in_c1_eni6_3_8_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist2_sync_in_aunroll_x_in_c1_eni6_3_8_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist2_sync_in_aunroll_x_in_c1_eni6_3_8_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist2_sync_in_aunroll_x_in_c1_eni6_3_8_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_sync_in_aunroll_x_in_c1_eni6_3_8_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_sync_in_aunroll_x_in_c1_eni6_3_8_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_sync_in_aunroll_x_in_c1_eni6_3_8_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_sync_in_aunroll_x_in_c1_eni6_3_8_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist2_sync_in_aunroll_x_in_c1_eni6_3_8_sticky_ena_q : signal is true;
    signal redist2_sync_in_aunroll_x_in_c1_eni6_3_8_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_reset0 : std_logic;
    signal redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_sync_in_aunroll_x_in_c1_eni6_5_23_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist4_sync_in_aunroll_x_in_c1_eni6_5_23_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist4_sync_in_aunroll_x_in_c1_eni6_5_23_rdcnt_i : signal is true;
    signal redist4_sync_in_aunroll_x_in_c1_eni6_5_23_rdcnt_eq : std_logic;
    attribute preserve of redist4_sync_in_aunroll_x_in_c1_eni6_5_23_rdcnt_eq : signal is true;
    signal redist4_sync_in_aunroll_x_in_c1_eni6_5_23_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist4_sync_in_aunroll_x_in_c1_eni6_5_23_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist4_sync_in_aunroll_x_in_c1_eni6_5_23_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sync_in_aunroll_x_in_c1_eni6_5_23_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sync_in_aunroll_x_in_c1_eni6_5_23_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sync_in_aunroll_x_in_c1_eni6_5_23_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sync_in_aunroll_x_in_c1_eni6_5_23_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist4_sync_in_aunroll_x_in_c1_eni6_5_23_sticky_ena_q : signal is true;
    signal redist4_sync_in_aunroll_x_in_c1_eni6_5_23_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist6_sync_in_aunroll_x_in_i_valid_23(DELAY,15)
    redist6_sync_in_aunroll_x_in_i_valid_23 : dspba_delay
    GENERIC MAP ( width => 1, depth => 23, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist6_sync_in_aunroll_x_in_i_valid_23_q, clk => clock, aclr => resetn );

    -- i_mul16_fc(BLACKBOX,7)@179
    -- out out_primWireOut@186
    thei_mul16_fc : floatComponent_i_sfc_logic_c1_for_cond5_preheader_fc_c1_enter_fc41_multBlock_typA0Z16oe0cp36cd0oq3cdj6z
    PORT MAP (
        in_0 => in_c1_eni6_1,
        in_1 => in_c1_eni6_2,
        out_primWireOut => i_mul16_fc_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist0_i_mul16_fc_out_primWireOut_1(DELAY,9)
    redist0_i_mul16_fc_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul16_fc_out_primWireOut, xout => redist0_i_mul16_fc_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist2_sync_in_aunroll_x_in_c1_eni6_3_8_notEnable(LOGICAL,23)
    redist2_sync_in_aunroll_x_in_c1_eni6_3_8_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist2_sync_in_aunroll_x_in_c1_eni6_3_8_nor(LOGICAL,24)
    redist2_sync_in_aunroll_x_in_c1_eni6_3_8_nor_q <= not (redist2_sync_in_aunroll_x_in_c1_eni6_3_8_notEnable_q or redist2_sync_in_aunroll_x_in_c1_eni6_3_8_sticky_ena_q);

    -- redist2_sync_in_aunroll_x_in_c1_eni6_3_8_mem_last(CONSTANT,20)
    redist2_sync_in_aunroll_x_in_c1_eni6_3_8_mem_last_q <= "0100";

    -- redist2_sync_in_aunroll_x_in_c1_eni6_3_8_cmp(LOGICAL,21)
    redist2_sync_in_aunroll_x_in_c1_eni6_3_8_cmp_b <= STD_LOGIC_VECTOR("0" & redist2_sync_in_aunroll_x_in_c1_eni6_3_8_rdcnt_q);
    redist2_sync_in_aunroll_x_in_c1_eni6_3_8_cmp_q <= "1" WHEN redist2_sync_in_aunroll_x_in_c1_eni6_3_8_mem_last_q = redist2_sync_in_aunroll_x_in_c1_eni6_3_8_cmp_b ELSE "0";

    -- redist2_sync_in_aunroll_x_in_c1_eni6_3_8_cmpReg(REG,22)
    redist2_sync_in_aunroll_x_in_c1_eni6_3_8_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_sync_in_aunroll_x_in_c1_eni6_3_8_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist2_sync_in_aunroll_x_in_c1_eni6_3_8_cmpReg_q <= STD_LOGIC_VECTOR(redist2_sync_in_aunroll_x_in_c1_eni6_3_8_cmp_q);
        END IF;
    END PROCESS;

    -- redist2_sync_in_aunroll_x_in_c1_eni6_3_8_sticky_ena(REG,25)
    redist2_sync_in_aunroll_x_in_c1_eni6_3_8_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_sync_in_aunroll_x_in_c1_eni6_3_8_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist2_sync_in_aunroll_x_in_c1_eni6_3_8_nor_q = "1") THEN
                redist2_sync_in_aunroll_x_in_c1_eni6_3_8_sticky_ena_q <= STD_LOGIC_VECTOR(redist2_sync_in_aunroll_x_in_c1_eni6_3_8_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_sync_in_aunroll_x_in_c1_eni6_3_8_enaAnd(LOGICAL,26)
    redist2_sync_in_aunroll_x_in_c1_eni6_3_8_enaAnd_q <= redist2_sync_in_aunroll_x_in_c1_eni6_3_8_sticky_ena_q and VCC_q;

    -- redist2_sync_in_aunroll_x_in_c1_eni6_3_8_rdcnt(COUNTER,18)
    -- low=0, high=5, step=1, init=0
    redist2_sync_in_aunroll_x_in_c1_eni6_3_8_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_sync_in_aunroll_x_in_c1_eni6_3_8_rdcnt_i <= TO_UNSIGNED(0, 3);
            redist2_sync_in_aunroll_x_in_c1_eni6_3_8_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist2_sync_in_aunroll_x_in_c1_eni6_3_8_rdcnt_i = TO_UNSIGNED(4, 3)) THEN
                redist2_sync_in_aunroll_x_in_c1_eni6_3_8_rdcnt_eq <= '1';
            ELSE
                redist2_sync_in_aunroll_x_in_c1_eni6_3_8_rdcnt_eq <= '0';
            END IF;
            IF (redist2_sync_in_aunroll_x_in_c1_eni6_3_8_rdcnt_eq = '1') THEN
                redist2_sync_in_aunroll_x_in_c1_eni6_3_8_rdcnt_i <= redist2_sync_in_aunroll_x_in_c1_eni6_3_8_rdcnt_i + 3;
            ELSE
                redist2_sync_in_aunroll_x_in_c1_eni6_3_8_rdcnt_i <= redist2_sync_in_aunroll_x_in_c1_eni6_3_8_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist2_sync_in_aunroll_x_in_c1_eni6_3_8_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist2_sync_in_aunroll_x_in_c1_eni6_3_8_rdcnt_i, 3)));

    -- redist2_sync_in_aunroll_x_in_c1_eni6_3_8_wraddr(REG,19)
    redist2_sync_in_aunroll_x_in_c1_eni6_3_8_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_sync_in_aunroll_x_in_c1_eni6_3_8_wraddr_q <= "101";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist2_sync_in_aunroll_x_in_c1_eni6_3_8_wraddr_q <= STD_LOGIC_VECTOR(redist2_sync_in_aunroll_x_in_c1_eni6_3_8_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist2_sync_in_aunroll_x_in_c1_eni6_3_8_mem(DUALMEM,17)
    redist2_sync_in_aunroll_x_in_c1_eni6_3_8_mem_ia <= STD_LOGIC_VECTOR(in_c1_eni6_3);
    redist2_sync_in_aunroll_x_in_c1_eni6_3_8_mem_aa <= redist2_sync_in_aunroll_x_in_c1_eni6_3_8_wraddr_q;
    redist2_sync_in_aunroll_x_in_c1_eni6_3_8_mem_ab <= redist2_sync_in_aunroll_x_in_c1_eni6_3_8_rdcnt_q;
    redist2_sync_in_aunroll_x_in_c1_eni6_3_8_mem_reset0 <= not (resetn);
    redist2_sync_in_aunroll_x_in_c1_eni6_3_8_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 6,
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
        clocken1 => redist2_sync_in_aunroll_x_in_c1_eni6_3_8_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist2_sync_in_aunroll_x_in_c1_eni6_3_8_mem_reset0,
        clock1 => clock,
        address_a => redist2_sync_in_aunroll_x_in_c1_eni6_3_8_mem_aa,
        data_a => redist2_sync_in_aunroll_x_in_c1_eni6_3_8_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist2_sync_in_aunroll_x_in_c1_eni6_3_8_mem_ab,
        q_b => redist2_sync_in_aunroll_x_in_c1_eni6_3_8_mem_iq
    );
    redist2_sync_in_aunroll_x_in_c1_eni6_3_8_mem_q <= redist2_sync_in_aunroll_x_in_c1_eni6_3_8_mem_iq(31 downto 0);

    -- redist2_sync_in_aunroll_x_in_c1_eni6_3_8_outputreg(DELAY,16)
    redist2_sync_in_aunroll_x_in_c1_eni6_3_8_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist2_sync_in_aunroll_x_in_c1_eni6_3_8_mem_q, xout => redist2_sync_in_aunroll_x_in_c1_eni6_3_8_outputreg_q, clk => clock, aclr => resetn );

    -- i_add17_fc(BLACKBOX,5)@187
    -- out out_primWireOut@201
    thei_add17_fc : floatComponent_i_sfc_logic_c1_for_cond5_preheader_fc_c1_enter_fc41_addBlock_typeA0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => redist2_sync_in_aunroll_x_in_c1_eni6_3_8_outputreg_q,
        in_1 => redist0_i_mul16_fc_out_primWireOut_1_q,
        out_primWireOut => i_add17_fc_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- redist1_i_add17_fc_out_primWireOut_1(DELAY,10)
    redist1_i_add17_fc_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_add17_fc_out_primWireOut, xout => redist1_i_add17_fc_out_primWireOut_1_q, clk => clock, aclr => resetn );

    -- redist4_sync_in_aunroll_x_in_c1_eni6_5_23_notEnable(LOGICAL,33)
    redist4_sync_in_aunroll_x_in_c1_eni6_5_23_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist4_sync_in_aunroll_x_in_c1_eni6_5_23_nor(LOGICAL,34)
    redist4_sync_in_aunroll_x_in_c1_eni6_5_23_nor_q <= not (redist4_sync_in_aunroll_x_in_c1_eni6_5_23_notEnable_q or redist4_sync_in_aunroll_x_in_c1_eni6_5_23_sticky_ena_q);

    -- redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_last(CONSTANT,30)
    redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_last_q <= "010100";

    -- redist4_sync_in_aunroll_x_in_c1_eni6_5_23_cmp(LOGICAL,31)
    redist4_sync_in_aunroll_x_in_c1_eni6_5_23_cmp_b <= STD_LOGIC_VECTOR("0" & redist4_sync_in_aunroll_x_in_c1_eni6_5_23_rdcnt_q);
    redist4_sync_in_aunroll_x_in_c1_eni6_5_23_cmp_q <= "1" WHEN redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_last_q = redist4_sync_in_aunroll_x_in_c1_eni6_5_23_cmp_b ELSE "0";

    -- redist4_sync_in_aunroll_x_in_c1_eni6_5_23_cmpReg(REG,32)
    redist4_sync_in_aunroll_x_in_c1_eni6_5_23_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_sync_in_aunroll_x_in_c1_eni6_5_23_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist4_sync_in_aunroll_x_in_c1_eni6_5_23_cmpReg_q <= STD_LOGIC_VECTOR(redist4_sync_in_aunroll_x_in_c1_eni6_5_23_cmp_q);
        END IF;
    END PROCESS;

    -- redist4_sync_in_aunroll_x_in_c1_eni6_5_23_sticky_ena(REG,35)
    redist4_sync_in_aunroll_x_in_c1_eni6_5_23_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_sync_in_aunroll_x_in_c1_eni6_5_23_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist4_sync_in_aunroll_x_in_c1_eni6_5_23_nor_q = "1") THEN
                redist4_sync_in_aunroll_x_in_c1_eni6_5_23_sticky_ena_q <= STD_LOGIC_VECTOR(redist4_sync_in_aunroll_x_in_c1_eni6_5_23_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_sync_in_aunroll_x_in_c1_eni6_5_23_enaAnd(LOGICAL,36)
    redist4_sync_in_aunroll_x_in_c1_eni6_5_23_enaAnd_q <= redist4_sync_in_aunroll_x_in_c1_eni6_5_23_sticky_ena_q and VCC_q;

    -- redist4_sync_in_aunroll_x_in_c1_eni6_5_23_rdcnt(COUNTER,28)
    -- low=0, high=21, step=1, init=0
    redist4_sync_in_aunroll_x_in_c1_eni6_5_23_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_sync_in_aunroll_x_in_c1_eni6_5_23_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist4_sync_in_aunroll_x_in_c1_eni6_5_23_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist4_sync_in_aunroll_x_in_c1_eni6_5_23_rdcnt_i = TO_UNSIGNED(20, 5)) THEN
                redist4_sync_in_aunroll_x_in_c1_eni6_5_23_rdcnt_eq <= '1';
            ELSE
                redist4_sync_in_aunroll_x_in_c1_eni6_5_23_rdcnt_eq <= '0';
            END IF;
            IF (redist4_sync_in_aunroll_x_in_c1_eni6_5_23_rdcnt_eq = '1') THEN
                redist4_sync_in_aunroll_x_in_c1_eni6_5_23_rdcnt_i <= redist4_sync_in_aunroll_x_in_c1_eni6_5_23_rdcnt_i + 11;
            ELSE
                redist4_sync_in_aunroll_x_in_c1_eni6_5_23_rdcnt_i <= redist4_sync_in_aunroll_x_in_c1_eni6_5_23_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist4_sync_in_aunroll_x_in_c1_eni6_5_23_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist4_sync_in_aunroll_x_in_c1_eni6_5_23_rdcnt_i, 5)));

    -- redist4_sync_in_aunroll_x_in_c1_eni6_5_23_wraddr(REG,29)
    redist4_sync_in_aunroll_x_in_c1_eni6_5_23_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_sync_in_aunroll_x_in_c1_eni6_5_23_wraddr_q <= "10101";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist4_sync_in_aunroll_x_in_c1_eni6_5_23_wraddr_q <= STD_LOGIC_VECTOR(redist4_sync_in_aunroll_x_in_c1_eni6_5_23_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem(DUALMEM,27)
    redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_ia <= STD_LOGIC_VECTOR(in_c1_eni6_5);
    redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_aa <= redist4_sync_in_aunroll_x_in_c1_eni6_5_23_wraddr_q;
    redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_ab <= redist4_sync_in_aunroll_x_in_c1_eni6_5_23_rdcnt_q;
    redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_reset0 <= not (resetn);
    redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 5,
        numwords_a => 22,
        width_b => 32,
        widthad_b => 5,
        numwords_b => 22,
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
        clocken1 => redist4_sync_in_aunroll_x_in_c1_eni6_5_23_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_reset0,
        clock1 => clock,
        address_a => redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_aa,
        data_a => redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_ab,
        q_b => redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_iq
    );
    redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_q <= redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_iq(31 downto 0);

    -- redist5_sync_in_aunroll_x_in_c1_eni6_6_23(DELAY,14)
    redist5_sync_in_aunroll_x_in_c1_eni6_6_23 : dspba_delay
    GENERIC MAP ( width => 1, depth => 23, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni6_6, xout => redist5_sync_in_aunroll_x_in_c1_eni6_6_23_q, clk => clock, aclr => resetn );

    -- i_tmp_05_lc_outerphi_fc(MUX,8)@202
    i_tmp_05_lc_outerphi_fc_s <= redist5_sync_in_aunroll_x_in_c1_eni6_6_23_q;
    i_tmp_05_lc_outerphi_fc_combproc: PROCESS (i_tmp_05_lc_outerphi_fc_s, redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_q, redist1_i_add17_fc_out_primWireOut_1_q)
    BEGIN
        CASE (i_tmp_05_lc_outerphi_fc_s) IS
            WHEN "0" => i_tmp_05_lc_outerphi_fc_q <= redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_q;
            WHEN "1" => i_tmp_05_lc_outerphi_fc_q <= redist1_i_add17_fc_out_primWireOut_1_q;
            WHEN OTHERS => i_tmp_05_lc_outerphi_fc_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist3_sync_in_aunroll_x_in_c1_eni6_4_23(DELAY,12)
    redist3_sync_in_aunroll_x_in_c1_eni6_4_23 : dspba_delay
    GENERIC MAP ( width => 1, depth => 23, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni6_4, xout => redist3_sync_in_aunroll_x_in_c1_eni6_4_23_q, clk => clock, aclr => resetn );

    -- i_do_directly_for_inc18_loopexit_sel_fc(MUX,6)@202
    i_do_directly_for_inc18_loopexit_sel_fc_s <= redist3_sync_in_aunroll_x_in_c1_eni6_4_23_q;
    i_do_directly_for_inc18_loopexit_sel_fc_combproc: PROCESS (i_do_directly_for_inc18_loopexit_sel_fc_s, redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_q, redist1_i_add17_fc_out_primWireOut_1_q)
    BEGIN
        CASE (i_do_directly_for_inc18_loopexit_sel_fc_s) IS
            WHEN "0" => i_do_directly_for_inc18_loopexit_sel_fc_q <= redist4_sync_in_aunroll_x_in_c1_eni6_5_23_mem_q;
            WHEN "1" => i_do_directly_for_inc18_loopexit_sel_fc_q <= redist1_i_add17_fc_out_primWireOut_1_q;
            WHEN OTHERS => i_do_directly_for_inc18_loopexit_sel_fc_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,3)@202
    out_c1_exi2_0 <= GND_q;
    out_c1_exi2_1 <= i_do_directly_for_inc18_loopexit_sel_fc_q;
    out_c1_exi2_2 <= i_tmp_05_lc_outerphi_fc_q;
    out_o_valid <= redist6_sync_in_aunroll_x_in_i_valid_23_q;

END normal;
