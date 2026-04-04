-- Date        : April 3, 2026
-- File        : Memory_wback_register.vhd   
-- Designer    : Salah Nasriddinov
-- Description : This file implements a memory/write-back stage register 

library IEEE;
use IEEE.std_logic_1164.all;
use work.RISCV_types.all; -- use the types

entity Memory_wback_register is
    port(i_memory_wback_register : in Memory_wback_data_t;
         o_memory_wback_register : out Memory_wback_data_t;
         i_stall                 : in std_logic;
         i_reset                 : in std_logic;
         i_clk                   : in std_logic); -- clock
end entity Memory_wback_register;

architecture structural of Memory_wback_register is

    component N_bit_register is
        generic(N : integer; Reset_value : std_logic_vector);
        port(i_CLK  : in std_logic;						   -- Clock input
           i_RST    : in std_logic;						   -- Reset input
           i_WE     : in std_logic;   					   -- All register connected
           i_D      : in std_logic_vector(N-1 downto 0);   -- Data value input
           o_Q      : out std_logic_vector(N-1 downto 0)); -- Data value output
    end component N_bit_register;   

    -- memory/write-back stage register
    -- 66 bits total:
    signal s_Memory_wback_data_in  : std_logic_vector(65 downto 0);     
    signal s_Memory_wback_data_out : std_logic_vector(65 downto 0);     

begin

    -- Control : REG_WE  (0)
    -- Control : ALU/Mem (1)
    -- DATA    : ALU_out (32 bits) (33 downto 2)
    -- DATA    : MEM_out (32 bits) (65 downto 34)
    s_Memory_wback_data_in(0)            <= i_memory_wback_register.RegWr;
    s_Memory_wback_data_in(1)            <= i_memory_wback_register.ALU_mem;
    s_Memory_wback_data_in(33 downto 2)  <= i_memory_wback_register.ALU_out;
    s_Memory_wback_data_in(65 downto 34) <= i_memory_wback_register.DMemOut;

    Memory_wback_register_inst: N_bit_register
        generic map(N => 66, Reset_value => (65 downto 0 => '0'))
        port map(
                 i_CLK => i_clk,
                 i_RST => i_reset,                 -- reset the pipeline to 0
                 i_WE  => not i_stall,             -- always write unless stalled
                 i_D   => s_Memory_wback_data_in,  -- all the inputs  are contained in this signal
                 o_Q   => s_Memory_wback_data_out  -- all the outputs are contained in this signal
             );

    o_memory_wback_register.RegWr   <= s_Memory_wback_data_out(0);             
    o_memory_wback_register.ALU_mem <= s_Memory_wback_data_out(1);             
    o_memory_wback_register.ALU_out <= s_Memory_wback_data_out(33 downto 2);   
    o_memory_wback_register.DMemOut <= s_Memory_wback_data_out(65 downto 34);  

end architecture structural;



