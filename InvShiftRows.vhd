----------------------------------------------------------------------------------
-- Engineer: Daniella LiCalzi
-- 
-- Create Date: 11/18/2025 04:40:53 PM
-- Design Name: InvShiftRows
-- Module Name: InvShiftRows - Behavioral
-- Project Name: AES Decryption
-- Target Devices: Zybo Z7 7020
-- Tool Versions: Vivado 2025.1
--
-- Description: implements the AES inverse ShiftRows step for a 128 bit state. 
-- It takes the input state as sixteen bytes in block_state_type, groups them into four 32 bit row words,
-- rotates each row to the right by 0, 8, 16, and 24 bits for rows 0 to 3 using rotate_right 
-- then unpacks the rotated rows back into sixteen bytes on next_state_bytes. 
-- The result is the AES state after the inverse ShiftRows transformation, ready for the next stage of decryption.
-- 
-- Dependencies: aes_package.vhd
-- block_state_type
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

entity InvShiftRows is
  Port (
     state_bytes : in block_state_type; -- Incoming bytes array
     next_state_bytes : out block_state_type --Outgoing bytes array
  );
end InvShiftRows;

architecture Behavioral of InvShiftRows is 
     type word_rows is array (0 to 3) of STD_LOGIC_VECTOR (31 downto 0); -- creates 4 arrays, one for each row
     signal init_row : word_rows;
     signal final_shifted_row : word_rows;
begin
       -- Organize the bytes of the 4x4 array into 4 individual rows and concatinates them
       init_row(0) <= state_bytes(0) & state_bytes(4) & state_bytes(8) & state_bytes(12);
       init_row(1) <= state_bytes(1) & state_bytes(5) & state_bytes(9) & state_bytes(13);
       init_row(2) <= state_bytes(2) & state_bytes(6) & state_bytes(10) & state_bytes(14);
       init_row(3) <= state_bytes(3) & state_bytes(7) & state_bytes(11) & state_bytes(15);

        -- row 0 doesnt get any shifts
       final_shifted_row(0) <= init_row(0);
       
       -- row 1 gets shifted right by 8 bits
       final_shifted_row(1) <= std_logic_vector(rotate_right(unsigned(init_row(1)), 8));
       
       -- row 2 gets shifted right by 16 bits
       final_shifted_row(2) <= std_logic_vector(rotate_right(unsigned(init_row(2)), 16));

        -- row 3 gets shifted right by 24 bits
       final_shifted_row(3) <= std_logic_vector(rotate_right(unsigned(init_row(3)), 24));
       
       
-- reorganizes all 4 rows back into the proper state array but with final rotated values
final_state: for i in 0 to 3 generate
    next_state_bytes(i)      <= final_shifted_row(i)(31 downto 24);
    
    next_state_bytes(i + 4)  <= final_shifted_row(i)(23 downto 16);
    
    next_state_bytes(i + 8)  <= final_shifted_row(i)(15 downto 8);
    
    next_state_bytes(i + 12) <= final_shifted_row(i)(7  downto 0);
    
  end generate final_state;
  
end Behavioral;
