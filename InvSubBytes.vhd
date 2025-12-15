----------------------------------------------------------------------------------
-- Company: SecureVISION
-- Engineer: Daniella Li Calzi
-- 
-- Module Name: InvSubBytes - Behavioral
-- Project Name: SecureVISION
-- Target Devices: Zybo-Z7
-- Tool Versions: Vivado 2020.2
-- Description: InvSubBytes on all sixteen bytes using the table INV_SBOX from aes package
-- 
-- Dependencies: INV_SBOX, init_state_bytes
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

entity InvSubBytes is
  Port (sb_in : in block_state_type; -- Incoming bytes array
        sb_out : out block_state_type --Outgoing bytes array
        );
        
end InvSubBytes;

architecture Behavioral of InvSubBytes is

begin

process(sb_in)
  variable index : integer range 0 to 255;
begin 
    
    for i in 0 to 15 loop
        index := to_integer(unsigned(sb_in(i)));
        sb_out(i) <= INV_SBOX(index);
        
    end loop;
    
end process;
end Behavioral;
