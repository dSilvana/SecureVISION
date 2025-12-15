----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Design Name: 
-- Module Name: InvMixColumns - Behavioral
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
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.aes_package.all;

entity InvMixColumns is
    Port ( mxc_in : in STD_LOGIC_VECTOR (127 downto 0);
           mxc_out : out STD_LOGIC_VECTOR (127 downto 0));
end InvMixColumns;

architecture Behavioral of InvMixColumns is
    signal c0, c1, c2, c3 : std_logic_vector(31 downto 0);
    signal r0, r1, r2, r3 : std_logic_vector(31 downto 0);
    
begin

    -- splits 128 bit state into four 32 bit columns
    c0 <= mxc_in(127 downto 96);
    c1 <= mxc_in(95  downto 64);
    c2 <= mxc_in(63  downto 32);
    c3 <= mxc_in(31  downto 0);

    -- applys existing inverse mix column function
    r0 <= inv_mix_column_word(c0);
    r1 <= inv_mix_column_word(c1);
    r2 <= inv_mix_column_word(c2);
    r3 <= inv_mix_column_word(c3);

    -- packs columns back into 128 bit state
    mxc_out <= r0 & r1 & r2 & r3;

end Behavioral;
