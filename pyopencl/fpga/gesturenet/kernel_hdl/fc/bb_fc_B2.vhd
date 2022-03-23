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

-- VHDL created from bb_fc_B2
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

entity bb_fc_B2 is
    port (
        in_c1_exe14_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_idxprom2_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_lsu_unnamed_fc5_sts_stream_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_sizex : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stream_reset : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc4_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_unnamed_fc5_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_fc5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_fc5_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_unnamed_fc5_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc5_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_unnamed_fc5_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_fc5_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_fc5_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc5_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc5_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_fc5_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_fc_B2;

architecture normal of bb_fc_B2 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_fc_B2_stall_region is
        port (
            in_c1_exe14 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_idxprom2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_lsu_unnamed_fc5_streset_stream_reset : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lsu_unnamed_fc5_sts_stream_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_sizex : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc4 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_unnamed_fc5_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_fc5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc5_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_unnamed_fc5_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc5_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component fc_B2_branch is
        port (
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component fc_B2_merge is
        port (
            in_c1_exe14_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_idxprom2_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_fc4_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe14 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_idxprom2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_fc4 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_fc_B2_stall_region_out_lsu_unnamed_fc5_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B2_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B2_stall_region_out_unnamed_fc5_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_fc_B2_stall_region_out_unnamed_fc5_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_fc_B2_stall_region_out_unnamed_fc5_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fc_B2_stall_region_out_unnamed_fc5_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B2_stall_region_out_unnamed_fc5_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B2_stall_region_out_unnamed_fc5_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_fc_B2_stall_region_out_unnamed_fc5_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_fc_B2_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_B2_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_B2_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_B2_merge_out_c1_exe14 : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_B2_merge_out_idxprom2 : STD_LOGIC_VECTOR (63 downto 0);
    signal fc_B2_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal fc_B2_merge_out_unnamed_fc4 : STD_LOGIC_VECTOR (31 downto 0);
    signal fc_B2_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- fc_B2_branch(BLACKBOX,3)
    thefc_B2_branch : fc_B2_branch
    PORT MAP (
        in_stall_in_0 => in_stall_in_0,
        in_valid_in => bb_fc_B2_stall_region_out_valid_out,
        out_stall_out => fc_B2_branch_out_stall_out,
        out_valid_out_0 => fc_B2_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- fc_B2_merge(BLACKBOX,4)
    thefc_B2_merge : fc_B2_merge
    PORT MAP (
        in_c1_exe14_0 => in_c1_exe14_0,
        in_idxprom2_0 => in_idxprom2_0,
        in_stall_in => bb_fc_B2_stall_region_out_stall_out,
        in_unnamed_fc4_0 => in_unnamed_fc4_0,
        in_valid_in_0 => in_valid_in_0,
        out_c1_exe14 => fc_B2_merge_out_c1_exe14,
        out_idxprom2 => fc_B2_merge_out_idxprom2,
        out_stall_out_0 => fc_B2_merge_out_stall_out_0,
        out_unnamed_fc4 => fc_B2_merge_out_unnamed_fc4,
        out_valid_out => fc_B2_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_fc_B2_stall_region(BLACKBOX,2)
    thebb_fc_B2_stall_region : bb_fc_B2_stall_region
    PORT MAP (
        in_c1_exe14 => fc_B2_merge_out_c1_exe14,
        in_flush => in_flush,
        in_idxprom2 => fc_B2_merge_out_idxprom2,
        in_lsu_unnamed_fc5_streset_stream_reset => in_stream_reset,
        in_lsu_unnamed_fc5_sts_stream_size => in_lsu_unnamed_fc5_sts_stream_size,
        in_output_im => in_output_im,
        in_sizex => in_sizex,
        in_stall_in => fc_B2_branch_out_stall_out,
        in_unnamed_fc4 => fc_B2_merge_out_unnamed_fc4,
        in_unnamed_fc5_avm_readdata => in_unnamed_fc5_avm_readdata,
        in_unnamed_fc5_avm_readdatavalid => in_unnamed_fc5_avm_readdatavalid,
        in_unnamed_fc5_avm_waitrequest => in_unnamed_fc5_avm_waitrequest,
        in_unnamed_fc5_avm_writeack => in_unnamed_fc5_avm_writeack,
        in_valid_in => fc_B2_merge_out_valid_out,
        out_lsu_unnamed_fc5_o_active => bb_fc_B2_stall_region_out_lsu_unnamed_fc5_o_active,
        out_stall_out => bb_fc_B2_stall_region_out_stall_out,
        out_unnamed_fc5_avm_address => bb_fc_B2_stall_region_out_unnamed_fc5_avm_address,
        out_unnamed_fc5_avm_burstcount => bb_fc_B2_stall_region_out_unnamed_fc5_avm_burstcount,
        out_unnamed_fc5_avm_byteenable => bb_fc_B2_stall_region_out_unnamed_fc5_avm_byteenable,
        out_unnamed_fc5_avm_enable => bb_fc_B2_stall_region_out_unnamed_fc5_avm_enable,
        out_unnamed_fc5_avm_read => bb_fc_B2_stall_region_out_unnamed_fc5_avm_read,
        out_unnamed_fc5_avm_write => bb_fc_B2_stall_region_out_unnamed_fc5_avm_write,
        out_unnamed_fc5_avm_writedata => bb_fc_B2_stall_region_out_unnamed_fc5_avm_writedata,
        out_valid_out => bb_fc_B2_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- out_lsu_unnamed_fc5_o_active(GPOUT,19)
    out_lsu_unnamed_fc5_o_active <= bb_fc_B2_stall_region_out_lsu_unnamed_fc5_o_active;

    -- out_stall_out_0(GPOUT,20)
    out_stall_out_0 <= fc_B2_merge_out_stall_out_0;

    -- out_unnamed_fc5_avm_address(GPOUT,21)
    out_unnamed_fc5_avm_address <= bb_fc_B2_stall_region_out_unnamed_fc5_avm_address;

    -- out_unnamed_fc5_avm_burstcount(GPOUT,22)
    out_unnamed_fc5_avm_burstcount <= bb_fc_B2_stall_region_out_unnamed_fc5_avm_burstcount;

    -- out_unnamed_fc5_avm_byteenable(GPOUT,23)
    out_unnamed_fc5_avm_byteenable <= bb_fc_B2_stall_region_out_unnamed_fc5_avm_byteenable;

    -- out_unnamed_fc5_avm_enable(GPOUT,24)
    out_unnamed_fc5_avm_enable <= bb_fc_B2_stall_region_out_unnamed_fc5_avm_enable;

    -- out_unnamed_fc5_avm_read(GPOUT,25)
    out_unnamed_fc5_avm_read <= bb_fc_B2_stall_region_out_unnamed_fc5_avm_read;

    -- out_unnamed_fc5_avm_write(GPOUT,26)
    out_unnamed_fc5_avm_write <= bb_fc_B2_stall_region_out_unnamed_fc5_avm_write;

    -- out_unnamed_fc5_avm_writedata(GPOUT,27)
    out_unnamed_fc5_avm_writedata <= bb_fc_B2_stall_region_out_unnamed_fc5_avm_writedata;

    -- out_valid_out_0(GPOUT,28)
    out_valid_out_0 <= fc_B2_branch_out_valid_out_0;

END normal;
