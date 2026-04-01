----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Daniella Li Calzi
-- 
-- Design Name: 
-- Module Name: InvMixColumns - Behavioral
-- Project Name: SecureVision 2025
-- Target Devices: Zybo Z7-20
-- Tool Versions: Viviado 2020.2
-- Description: performs invmixcolumns on the ciphertext register and the mask register
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
           mxc_out : out STD_LOGIC_VECTOR (127 downto 0);
           mxc_in_m : in STD_LOGIC_VECTOR (127 downto 0);
           mxc_out_m : out STD_LOGIC_VECTOR (127 downto 0));
end InvMixColumns;

architecture Behavioral of InvMixColumns is
    signal c0, c1, c2, c3 : std_logic_vector(31 downto 0);
    signal r0, r1, r2, r3 : std_logic_vector(31 downto 0);
    
    signal c0_m, c1_m, c2_m, c3_m : std_logic_vector(31 downto 0);
    signal r0_m, r1_m, r2_m, r3_m : std_logic_vector(31 downto 0);
    
begin
    -- splits 128 bit state into four 32 bit columns
    c0 <= mxc_in(127 downto 96);
    c1 <= mxc_in(95 downto 64);
    c2 <= mxc_in(63 downto 32);
    c3 <= mxc_in(31 downto 0);

    -- applys existing inverse mix column function
    r0 <= inv_mix_column_word(c0);
    r1 <= inv_mix_column_word(c1);
    r2 <= inv_mix_column_word(c2);
    r3 <= inv_mix_column_word(c3);

    -- MASK splits 128 bit state into four 32 bit columns
    c0_m <= mxc_in_m(127 downto 96);
    c1_m <= mxc_in_m(95 downto 64);
    c2_m <= mxc_in_m(63 downto 32);
    c3_m <= mxc_in_m(31 downto 0);

    -- MASK applys existing inverse mix column function
    r0_m <= inv_mix_column_word(c0_m);
    r1_m <= inv_mix_column_word(c1_m);
    r2_m <= inv_mix_column_word(c2_m);
    r3_m <= inv_mix_column_word(c3_m);

    -- packs columns back into 128 bit state
    mxc_out <= r0 & r1 & r2 & r3;
    mxc_out_m <= r0_m & r1_m & r2_m & r3_m;
    
end Behavioral;
