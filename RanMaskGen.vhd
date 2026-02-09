----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2026 05:31:00 PM
-- Design Name: 
-- Module Name: RanMaskGen - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- shift right each cycle
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.aes_package.all;


entity RanMaskGen is
    Port ( clk : in STD_LOGIC;
           --reset : in STD_LOGIC;
           enable : in STD_LOGIC;
           load : in std_logic;
           mask_out : out STD_LOGIC_VECTOR (127 downto 0)); --Galois LFSR mask
           --done : out STD_LOGIC := '0');
end RanMaskGen;

architecture Behavioral of RanMaskGen is
    signal seed : std_logic_vector (127 downto 0) := x"a7c4f1d3e8b092a5c6f8e1d3a4b092a5";
    signal reg : std_logic_vector (127 downto 0);
    signal taps: std_logic_vector (127 downto 0) := x"a0000014000000000000000000000000"; --bits 127,125,100,98
begin

process(clk)
variable trig_bit : std_logic;
variable s_reg : std_logic_vector (127 downto 0);

begin

    if rising_edge(clk) then
        if load = '1' then
            reg <= seed;
            
            elsif enable = '1' then
                trig_bit := reg(0);
                s_reg := std_logic_vector(rotate_right(unsigned(reg), 1));
            
                    if trig_bit = '1' then 
                    s_reg := s_reg xor taps;
                  
                    end if;
            reg <= s_reg;
          else 
            reg <= reg;  
        end if;
    end if;          
end process;

    mask_out <= reg;
    
end Behavioral;
