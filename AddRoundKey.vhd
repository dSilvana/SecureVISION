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
  Port (init_state_bytes : in block_state_type; -- Incoming bytes array
        eic_keys : in round_key_type;
        next_state_bytes : out block_state_type --Outgoing bytes array
      );
end AddRoundKey;

architecture Behavioral of AddRoundKey is

begin

    addroundkey: for i in 0 to 15 generate
    next_state_bytes(i) <= init_state_bytes(i) xor eic_keys(i);
    
  end generate addroundkey;
  
end Behavioral;
