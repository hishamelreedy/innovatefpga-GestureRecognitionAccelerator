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

-- VHDL created from bb_maxpool2d_B2
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

entity bb_maxpool2d_B2 is
    port (
        in_c0_exe11_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe11_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv_0 : in std_logic_vector(2 downto 0);  -- ufix3
        in_fpgaindvars_iv_1 : in std_logic_vector(2 downto 0);  -- ufix3
        in_i_0107_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_0107_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_1611_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_1611_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_24_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_k_24_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_memcoalesce_input_im_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_input_im_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_input_im_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_mul2212_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul2212_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul2413_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul2413_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im_addr_0115_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_0115_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_179_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_im_addr_179_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_size : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_tmp_23_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_tmp_23_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe117 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_cmp9_phi_decision18_xor_RM : out std_logic_vector(0 downto 0);  -- ufix1
        out_fpgaindvars_iv_next : out std_logic_vector(2 downto 0);  -- ufix3
        out_i_0107 : out std_logic_vector(31 downto 0);  -- ufix32
        out_inc30 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_1611 : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_input_im_load_0_avm_address : out std_logic_vector(30 downto 0);  -- ufix31
        out_memcoalesce_input_im_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_memcoalesce_input_im_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_input_im_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_input_im_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_mul2212 : out std_logic_vector(31 downto 0);  -- ufix32
        out_mul2413 : out std_logic_vector(31 downto 0);  -- ufix32
        out_output_im_addr_0115 : out std_logic_vector(63 downto 0);  -- ufix64
        out_output_im_addr_179 : out std_logic_vector(63 downto 0);  -- ufix64
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_maxpool2d_B2;

architecture normal of bb_maxpool2d_B2 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_maxpool2d_B2_stall_region is
        port (
            in_c0_exe11 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_i_0107 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_im : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_input_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_1611 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_input_im_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_mul2212 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul2413 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im_addr_0115 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_179 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_tmp_23 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe117 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_cmp9_phi_decision18_xor_RM : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_fpgaindvars_iv_next : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_i_0107 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_inc30 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_1611 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_address : out std_logic_vector(30 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_input_im_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_mul2212 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_mul2413 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_output_im_addr_0115 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_output_im_addr_179 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_maxpool2d0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component maxpool2d_B2_branch is
        port (
            in_c0_exe11 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe117 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_cmp9_phi_decision18_xor_RM : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_next : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_i_0107 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_inc30 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_1611 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul2212 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul2413 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im_addr_0115 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_179 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_maxpool2d0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe117 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_cmp9_phi_decision18_xor_RM : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_fpgaindvars_iv_next : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_i_0107 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_inc30 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_1611 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_mul2212 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_mul2413 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_output_im_addr_0115 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_output_im_addr_179 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component maxpool2d_B2_merge is
        port (
            in_c0_exe11_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe11_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_0 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_1 : in std_logic_vector(2 downto 0);  -- Fixed Point
            in_i_0107_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_0107_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_1611_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_1611_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_24_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_k_24_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul2212_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul2212_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul2413_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul2413_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_im_addr_0115_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_0115_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_179_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_output_im_addr_179_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_tmp_23_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_tmp_23_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_fpgaindvars_iv : out std_logic_vector(2 downto 0);  -- Fixed Point
            out_i_0107 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_1611 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_k_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_mul2212 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_mul2413 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_output_im_addr_0115 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_output_im_addr_179 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_tmp_23 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_maxpool2d_B2_stall_region_out_c0_exe11 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_c1_exe117 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_cmp9_phi_decision18_xor_RM : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_fpgaindvars_iv_next : STD_LOGIC_VECTOR (2 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_i_0107 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_inc30 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_j_1611 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_memcoalesce_input_im_load_0_avm_address : STD_LOGIC_VECTOR (30 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_memcoalesce_input_im_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_memcoalesce_input_im_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_memcoalesce_input_im_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_memcoalesce_input_im_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_memcoalesce_input_im_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_memcoalesce_input_im_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_mul2212 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_mul2413 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_output_im_addr_0115 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_output_im_addr_179 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_unnamed_maxpool2d0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B2_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B2_branch_out_c0_exe11 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B2_branch_out_c1_exe117 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_branch_out_cmp9_phi_decision18_xor_RM : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B2_branch_out_fpgaindvars_iv_next : STD_LOGIC_VECTOR (2 downto 0);
    signal maxpool2d_B2_branch_out_i_0107 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_branch_out_inc30 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_branch_out_j_1611 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_branch_out_mul2212 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_branch_out_mul2413 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_branch_out_output_im_addr_0115 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B2_branch_out_output_im_addr_179 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B2_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B2_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B2_branch_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B2_merge_out_c0_exe11 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B2_merge_out_fpgaindvars_iv : STD_LOGIC_VECTOR (2 downto 0);
    signal maxpool2d_B2_merge_out_i_0107 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_out_j_1611 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_out_k_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_out_mul2212 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_out_mul2413 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_out_output_im_addr_0115 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B2_merge_out_output_im_addr_179 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B2_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B2_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B2_merge_out_tmp_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B2_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- maxpool2d_B2_merge(BLACKBOX,36)
    themaxpool2d_B2_merge : maxpool2d_B2_merge
    PORT MAP (
        in_c0_exe11_0 => in_c0_exe11_0,
        in_c0_exe11_1 => in_c0_exe11_1,
        in_fpgaindvars_iv_0 => in_fpgaindvars_iv_0,
        in_fpgaindvars_iv_1 => in_fpgaindvars_iv_1,
        in_i_0107_0 => in_i_0107_0,
        in_i_0107_1 => in_i_0107_1,
        in_j_1611_0 => in_j_1611_0,
        in_j_1611_1 => in_j_1611_1,
        in_k_24_0 => in_k_24_0,
        in_k_24_1 => in_k_24_1,
        in_mul2212_0 => in_mul2212_0,
        in_mul2212_1 => in_mul2212_1,
        in_mul2413_0 => in_mul2413_0,
        in_mul2413_1 => in_mul2413_1,
        in_output_im_addr_0115_0 => in_output_im_addr_0115_0,
        in_output_im_addr_0115_1 => in_output_im_addr_0115_1,
        in_output_im_addr_179_0 => in_output_im_addr_179_0,
        in_output_im_addr_179_1 => in_output_im_addr_179_1,
        in_stall_in => bb_maxpool2d_B2_stall_region_out_stall_out,
        in_tmp_23_0 => in_tmp_23_0,
        in_tmp_23_1 => in_tmp_23_1,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_c0_exe11 => maxpool2d_B2_merge_out_c0_exe11,
        out_fpgaindvars_iv => maxpool2d_B2_merge_out_fpgaindvars_iv,
        out_i_0107 => maxpool2d_B2_merge_out_i_0107,
        out_j_1611 => maxpool2d_B2_merge_out_j_1611,
        out_k_24 => maxpool2d_B2_merge_out_k_24,
        out_mul2212 => maxpool2d_B2_merge_out_mul2212,
        out_mul2413 => maxpool2d_B2_merge_out_mul2413,
        out_output_im_addr_0115 => maxpool2d_B2_merge_out_output_im_addr_0115,
        out_output_im_addr_179 => maxpool2d_B2_merge_out_output_im_addr_179,
        out_stall_out_0 => maxpool2d_B2_merge_out_stall_out_0,
        out_stall_out_1 => maxpool2d_B2_merge_out_stall_out_1,
        out_tmp_23 => maxpool2d_B2_merge_out_tmp_23,
        out_valid_out => maxpool2d_B2_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_maxpool2d_B2_stall_region(BLACKBOX,2)
    thebb_maxpool2d_B2_stall_region : bb_maxpool2d_B2_stall_region
    PORT MAP (
        in_c0_exe11 => maxpool2d_B2_merge_out_c0_exe11,
        in_flush => in_flush,
        in_fpgaindvars_iv => maxpool2d_B2_merge_out_fpgaindvars_iv,
        in_i_0107 => maxpool2d_B2_merge_out_i_0107,
        in_input_im => in_input_im,
        in_input_size => in_input_size,
        in_j_1611 => maxpool2d_B2_merge_out_j_1611,
        in_k_24 => maxpool2d_B2_merge_out_k_24,
        in_memcoalesce_input_im_load_0_avm_readdata => in_memcoalesce_input_im_load_0_avm_readdata,
        in_memcoalesce_input_im_load_0_avm_readdatavalid => in_memcoalesce_input_im_load_0_avm_readdatavalid,
        in_memcoalesce_input_im_load_0_avm_waitrequest => in_memcoalesce_input_im_load_0_avm_waitrequest,
        in_memcoalesce_input_im_load_0_avm_writeack => in_memcoalesce_input_im_load_0_avm_writeack,
        in_mul2212 => maxpool2d_B2_merge_out_mul2212,
        in_mul2413 => maxpool2d_B2_merge_out_mul2413,
        in_output_im_addr_0115 => maxpool2d_B2_merge_out_output_im_addr_0115,
        in_output_im_addr_179 => maxpool2d_B2_merge_out_output_im_addr_179,
        in_output_size => in_output_size,
        in_stall_in => maxpool2d_B2_branch_out_stall_out,
        in_tmp_23 => maxpool2d_B2_merge_out_tmp_23,
        in_valid_in => maxpool2d_B2_merge_out_valid_out,
        out_c0_exe11 => bb_maxpool2d_B2_stall_region_out_c0_exe11,
        out_c1_exe117 => bb_maxpool2d_B2_stall_region_out_c1_exe117,
        out_cmp9_phi_decision18_xor_RM => bb_maxpool2d_B2_stall_region_out_cmp9_phi_decision18_xor_RM,
        out_fpgaindvars_iv_next => bb_maxpool2d_B2_stall_region_out_fpgaindvars_iv_next,
        out_i_0107 => bb_maxpool2d_B2_stall_region_out_i_0107,
        out_inc30 => bb_maxpool2d_B2_stall_region_out_inc30,
        out_j_1611 => bb_maxpool2d_B2_stall_region_out_j_1611,
        out_memcoalesce_input_im_load_0_avm_address => bb_maxpool2d_B2_stall_region_out_memcoalesce_input_im_load_0_avm_address,
        out_memcoalesce_input_im_load_0_avm_burstcount => bb_maxpool2d_B2_stall_region_out_memcoalesce_input_im_load_0_avm_burstcount,
        out_memcoalesce_input_im_load_0_avm_byteenable => bb_maxpool2d_B2_stall_region_out_memcoalesce_input_im_load_0_avm_byteenable,
        out_memcoalesce_input_im_load_0_avm_enable => bb_maxpool2d_B2_stall_region_out_memcoalesce_input_im_load_0_avm_enable,
        out_memcoalesce_input_im_load_0_avm_read => bb_maxpool2d_B2_stall_region_out_memcoalesce_input_im_load_0_avm_read,
        out_memcoalesce_input_im_load_0_avm_write => bb_maxpool2d_B2_stall_region_out_memcoalesce_input_im_load_0_avm_write,
        out_memcoalesce_input_im_load_0_avm_writedata => bb_maxpool2d_B2_stall_region_out_memcoalesce_input_im_load_0_avm_writedata,
        out_mul2212 => bb_maxpool2d_B2_stall_region_out_mul2212,
        out_mul2413 => bb_maxpool2d_B2_stall_region_out_mul2413,
        out_output_im_addr_0115 => bb_maxpool2d_B2_stall_region_out_output_im_addr_0115,
        out_output_im_addr_179 => bb_maxpool2d_B2_stall_region_out_output_im_addr_179,
        out_stall_out => bb_maxpool2d_B2_stall_region_out_stall_out,
        out_unnamed_maxpool2d0 => bb_maxpool2d_B2_stall_region_out_unnamed_maxpool2d0,
        out_valid_out => bb_maxpool2d_B2_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- maxpool2d_B2_branch(BLACKBOX,35)
    themaxpool2d_B2_branch : maxpool2d_B2_branch
    PORT MAP (
        in_c0_exe11 => bb_maxpool2d_B2_stall_region_out_c0_exe11,
        in_c1_exe117 => bb_maxpool2d_B2_stall_region_out_c1_exe117,
        in_cmp9_phi_decision18_xor_RM => bb_maxpool2d_B2_stall_region_out_cmp9_phi_decision18_xor_RM,
        in_fpgaindvars_iv_next => bb_maxpool2d_B2_stall_region_out_fpgaindvars_iv_next,
        in_i_0107 => bb_maxpool2d_B2_stall_region_out_i_0107,
        in_inc30 => bb_maxpool2d_B2_stall_region_out_inc30,
        in_j_1611 => bb_maxpool2d_B2_stall_region_out_j_1611,
        in_mul2212 => bb_maxpool2d_B2_stall_region_out_mul2212,
        in_mul2413 => bb_maxpool2d_B2_stall_region_out_mul2413,
        in_output_im_addr_0115 => bb_maxpool2d_B2_stall_region_out_output_im_addr_0115,
        in_output_im_addr_179 => bb_maxpool2d_B2_stall_region_out_output_im_addr_179,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_unnamed_maxpool2d0 => bb_maxpool2d_B2_stall_region_out_unnamed_maxpool2d0,
        in_valid_in => bb_maxpool2d_B2_stall_region_out_valid_out,
        out_c0_exe11 => maxpool2d_B2_branch_out_c0_exe11,
        out_c1_exe117 => maxpool2d_B2_branch_out_c1_exe117,
        out_cmp9_phi_decision18_xor_RM => maxpool2d_B2_branch_out_cmp9_phi_decision18_xor_RM,
        out_fpgaindvars_iv_next => maxpool2d_B2_branch_out_fpgaindvars_iv_next,
        out_i_0107 => maxpool2d_B2_branch_out_i_0107,
        out_inc30 => maxpool2d_B2_branch_out_inc30,
        out_j_1611 => maxpool2d_B2_branch_out_j_1611,
        out_mul2212 => maxpool2d_B2_branch_out_mul2212,
        out_mul2413 => maxpool2d_B2_branch_out_mul2413,
        out_output_im_addr_0115 => maxpool2d_B2_branch_out_output_im_addr_0115,
        out_output_im_addr_179 => maxpool2d_B2_branch_out_output_im_addr_179,
        out_stall_out => maxpool2d_B2_branch_out_stall_out,
        out_valid_out_0 => maxpool2d_B2_branch_out_valid_out_0,
        out_valid_out_1 => maxpool2d_B2_branch_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exe11(GPOUT,37)
    out_c0_exe11 <= maxpool2d_B2_branch_out_c0_exe11;

    -- out_c1_exe117(GPOUT,38)
    out_c1_exe117 <= maxpool2d_B2_branch_out_c1_exe117;

    -- out_cmp9_phi_decision18_xor_RM(GPOUT,39)
    out_cmp9_phi_decision18_xor_RM <= maxpool2d_B2_branch_out_cmp9_phi_decision18_xor_RM;

    -- out_fpgaindvars_iv_next(GPOUT,40)
    out_fpgaindvars_iv_next <= maxpool2d_B2_branch_out_fpgaindvars_iv_next;

    -- out_i_0107(GPOUT,41)
    out_i_0107 <= maxpool2d_B2_branch_out_i_0107;

    -- out_inc30(GPOUT,42)
    out_inc30 <= maxpool2d_B2_branch_out_inc30;

    -- out_j_1611(GPOUT,43)
    out_j_1611 <= maxpool2d_B2_branch_out_j_1611;

    -- out_memcoalesce_input_im_load_0_avm_address(GPOUT,44)
    out_memcoalesce_input_im_load_0_avm_address <= bb_maxpool2d_B2_stall_region_out_memcoalesce_input_im_load_0_avm_address;

    -- out_memcoalesce_input_im_load_0_avm_burstcount(GPOUT,45)
    out_memcoalesce_input_im_load_0_avm_burstcount <= bb_maxpool2d_B2_stall_region_out_memcoalesce_input_im_load_0_avm_burstcount;

    -- out_memcoalesce_input_im_load_0_avm_byteenable(GPOUT,46)
    out_memcoalesce_input_im_load_0_avm_byteenable <= bb_maxpool2d_B2_stall_region_out_memcoalesce_input_im_load_0_avm_byteenable;

    -- out_memcoalesce_input_im_load_0_avm_enable(GPOUT,47)
    out_memcoalesce_input_im_load_0_avm_enable <= bb_maxpool2d_B2_stall_region_out_memcoalesce_input_im_load_0_avm_enable;

    -- out_memcoalesce_input_im_load_0_avm_read(GPOUT,48)
    out_memcoalesce_input_im_load_0_avm_read <= bb_maxpool2d_B2_stall_region_out_memcoalesce_input_im_load_0_avm_read;

    -- out_memcoalesce_input_im_load_0_avm_write(GPOUT,49)
    out_memcoalesce_input_im_load_0_avm_write <= bb_maxpool2d_B2_stall_region_out_memcoalesce_input_im_load_0_avm_write;

    -- out_memcoalesce_input_im_load_0_avm_writedata(GPOUT,50)
    out_memcoalesce_input_im_load_0_avm_writedata <= bb_maxpool2d_B2_stall_region_out_memcoalesce_input_im_load_0_avm_writedata;

    -- out_mul2212(GPOUT,51)
    out_mul2212 <= maxpool2d_B2_branch_out_mul2212;

    -- out_mul2413(GPOUT,52)
    out_mul2413 <= maxpool2d_B2_branch_out_mul2413;

    -- out_output_im_addr_0115(GPOUT,53)
    out_output_im_addr_0115 <= maxpool2d_B2_branch_out_output_im_addr_0115;

    -- out_output_im_addr_179(GPOUT,54)
    out_output_im_addr_179 <= maxpool2d_B2_branch_out_output_im_addr_179;

    -- out_stall_out_0(GPOUT,55)
    out_stall_out_0 <= maxpool2d_B2_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,56)
    out_stall_out_1 <= maxpool2d_B2_merge_out_stall_out_1;

    -- out_valid_out_0(GPOUT,57)
    out_valid_out_0 <= maxpool2d_B2_branch_out_valid_out_0;

    -- out_valid_out_1(GPOUT,58)
    out_valid_out_1 <= maxpool2d_B2_branch_out_valid_out_1;

END normal;
