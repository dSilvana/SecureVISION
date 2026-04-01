----------------------------------------------------------------------------------
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
  Port ( sb_in : in block_state_type;
        mask_in : in block_state_type;
        fresh_mask : in block_state_type;
        sb_out : out block_state_type;
        sb_mask_out : out block_state_type);
        
end InvSubBytes;

architecture Behavioral of InvSubBytes is

begin

process(sb_in, mask_in, fresh_mask)
    variable index : integer range 0 to 255;
    variable unmasked_byte : std_logic_vector(7 downto 0);
begin
    for i in 0 to 15 loop
        unmasked_byte := sb_in(i) xor mask_in(i);
        index := to_integer(unsigned(unmasked_byte));

        sb_out(i) <= INV_SBOX(index) xor fresh_mask(i);
        sb_mask_out(i) <= fresh_mask(i);
    end loop;
end process;

end Behavioral;
