-- Date        : Feb 16, 2026
-- File        : bus_types_pkg.vhd     
-- Designer    : Salah Nasriddinov
-- Description : This file implements a package to be used

-------------------------------------------------------------------------
-- Description: This file contains a skeleton for some types that 381 students
-- may want to use. This file is guarenteed to compile first, so if any types,
-- constants, functions, etc., etc., are wanted, students should declare them
-- here.
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package RISCV_types is

	-- 32 inputs x 32-bite wide
	type reg_outs_t is array(31 downto 0) of std_logic_vector(31 downto 0); -- type for signal 

	-- 16 inputs x 32-bite wide
	type alu_outs_t is array(15 downto 0) of std_logic_vector(31 downto 0); -- type for signal 


    type Fetch_decode_data_t is record 
        PC   : std_logic_vector(31 downto 0); -- PC value for auipc, branch, jal, jalr
        Inst : std_logic_vector(31 downto 0); -- Instruction to decode
    end record Fetch_decode_data_t;

    type Decode_execute_data_t is record
        RegWr         : std_logic; -- reg write enable
        branch        : std_logic;
        jal           : std_logic;     
        jalr          : std_logic;
        ALU_mem       : std_logic;
        ALU_src       : std_logic;
        ALU_A_src     : std_logic;
        ALU_op        : std_logic_vector(1 downto 0);
        lui           : std_logic;                    
        DMemWr        : std_logic; --mem write enable 
        PC            : std_logic_vector(31 downto 0);
        DATA_TO_READ1 : std_logic_vector(31 downto 0);
        DATA_TO_READ2 : std_logic_vector(31 downto 0);
        Extended_imm  : std_logic_vector(31 downto 0);
        func3         : std_logic_vector(2 downto 0);
        func7_5       : std_logic;
    end record Decode_execute_data_t;

    type Execute_memory_data_t is record
        RegWr          : std_logic;  -- reg write enabl
        branch         : std_logic;
        jal            : std_logic;
        jalr           : std_logic;
        ALU_mem        : std_logic;
        DMemWr         : std_logic;  -- mem write enable
        Alu_eq         : std_logic; 
        Alu_lt         : std_logic; 
        Alu_ltu        : std_logic; 
        Alu_get        : std_logic; 
        Alu_geu        : std_logic; 
        PC             : std_logic_vector(31 downto 0);
        ALU_out        : std_logic_vector(31 downto 0);
        DATA_TO_READ2  : std_logic_vector(31 downto 0);
        func3          : std_logic_vector(2 downto 0);
    end record Execute_memory_data_t;


    type Memory_wback_data_t is record
        RegWr          : std_logic;  -- reg write enable
        ALU_mem        : std_logic;
        ALU_out        : std_logic_vector(31 downto 0);
        DMemOut        : std_logic_vector(31 downto 0);
    end record Memory_wback_data_t;

end package RISCV_types;



