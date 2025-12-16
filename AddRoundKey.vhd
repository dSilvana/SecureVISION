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
-- Revision 0.02 - File Updated 12/16
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.aes_package.all;

entity AddRoundKey is
  Port (
    init_state_bytes : in  block_state_type;
    round_key_128    : in  std_logic_vector(127 downto 0); -- changed because I added a new function to seperate round keys
    next_state_bytes : out block_state_type
  );
end AddRoundKey;

-- Takes 128 bit key, cuts the key into 16 bytes for the round, alignes each byte correctly and xors with the state. Xors byte by byte

architecture Behavioral of AddRoundKey is
begin
    gen_ark : for i in 0 to 15 generate 		-- loops 16 times, one for every key byte
        next_state_bytes(i) <=				-- Takes data byte number i
            init_state_bytes(i) xor			-- XOR's the state byte with the key byte slice
            round_key_128(127 - 8*i downto 120 - 8*i);  -- Selects 8 bits (1 byte slice)
    end generate;
end Behavioral;
