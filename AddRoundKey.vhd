----------------------------------------------------------------------------------
-- Company: SecureVISION
-- Engineer: Daniella Li Calzi
-- 
-- Module Name: AddRoundKey - Behavioral
-- Project Name: SecureVISION
-- Target Devices: Zybo-z7 20
-- Tool Versions: Vivavdo 2020.2
-- Description: xor roundkey with current state 
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

entity AddRoundKey is
  Port (addrk_in : in block_state_type; -- Incoming ciphertext bytes array
        round_key : in round_key_128_array; --in std_logic_vector(127 downto 0);
        round_sel : in integer range 0 to 10;
        addrk_out : out std_logic_vector(127 downto 0) --output as vector
      );
end AddRoundKey;

architecture Behavioral of AddRoundKey is
begin
    
   addrk_out <= unpack_state_array(addrk_in) xor round_key(round_sel);
  
end Behavioral;
