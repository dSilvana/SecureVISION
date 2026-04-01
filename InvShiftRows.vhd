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
-- does masking too
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.aes_package.all;

entity InvShiftRows is
  Port (
     sr_in : in std_logic_vector(127 downto 0); -- Incoming initial bytes from controller
     sr_out : out block_state_type; --Outgoing bytes array
     sr_in_m : in std_logic_vector(127 downto 0); 
     sr_out_m : out block_state_type
  );
end InvShiftRows;

architecture Behavioral of InvShiftRows is 
     type word_rows is array (0 to 3) of STD_LOGIC_VECTOR (31 downto 0); -- creates 4 rows of 32 bits
     signal init_row : word_rows;
     signal shifted_row : word_rows;
     signal bytes : block_state_type;
     
     signal bytes_m : block_state_type;
     signal shifted_row_m : word_rows;
     signal init_row_m : word_rows;
     
begin
       bytes <= pack_state_array(sr_in);
       bytes_m <= pack_state_array(sr_in_m);
            
       -- Organize the bytes of the 4x4 array into 4 individual rows and concatinates them
       init_row(0) <= bytes(0) & bytes(4) & bytes(8) & bytes(12);
       init_row(1) <= bytes(1) & bytes(5) & bytes(9) & bytes(13);
       init_row(2) <= bytes(2) & bytes(6) & bytes(10) & bytes(14);
       init_row(3) <= bytes(3) & bytes(7) & bytes(11) & bytes(15);

       -- performs the shift rotations for each row
       shifted_row(0) <= init_row(0); -- row 0 doesnt get any shifts
       shifted_row(1) <= std_logic_vector(rotate_right(unsigned(init_row(1)), 8)); -- row 1 gets shifted right by 8 bits
       shifted_row(2) <= std_logic_vector(rotate_right(unsigned(init_row(2)), 16)); -- row 2 gets shifted right by 16 bits 
       shifted_row(3) <= std_logic_vector(rotate_right(unsigned(init_row(3)), 24)); -- row 3 gets shifted right by 24 bits
       
        -- MASKED Organize the bytes of the 4x4 array into 4 individual rows and concatinates them
       init_row_m(0) <= bytes_m(0) & bytes_m(4) & bytes_m(8) & bytes_m(12);
       init_row_m(1) <= bytes_m(1) & bytes_m(5) & bytes_m(9) & bytes_m(13);
       init_row_m(2) <= bytes_m(2) & bytes_m(6) & bytes_m(10) & bytes_m(14);
       init_row_m(3) <= bytes_m(3) & bytes_m(7) & bytes_m(11) & bytes_m(15);
       
       -- MASKED performs the shift rotations for each row
       shifted_row_m(0) <= init_row_m(0); -- row 0 doesnt get any shifts
       shifted_row_m(1) <= std_logic_vector(rotate_right(unsigned(init_row_m(1)), 8)); -- row 1 gets shifted right by 8 bits
       shifted_row_m(2) <= std_logic_vector(rotate_right(unsigned(init_row_m(2)), 16)); -- row 2 gets shifted right by 16 bits 
       shifted_row_m(3) <= std_logic_vector(rotate_right(unsigned(init_row_m(3)), 24)); -- row 3 gets shifted right by 24 bits
       
       -- reorganizes all 4 rows back into the proper state array but with final rotated values
       final_state: for i in 0 to 3 generate
            sr_out(i) <= shifted_row(i)(31 downto 24);
            sr_out(i + 4) <= shifted_row(i)(23 downto 16);
            sr_out(i + 8) <= shifted_row(i)(15 downto 8);
            sr_out(i + 12) <= shifted_row(i)(7  downto 0);
            
            sr_out_m(i) <= shifted_row_m(i)(31 downto 24);
            sr_out_m(i + 4) <= shifted_row_m(i)(23 downto 16);
            sr_out_m(i + 8) <= shifted_row_m(i)(15 downto 8);
            sr_out_m(i + 12) <= shifted_row_m(i)(7  downto 0);
        end generate final_state;
        
end Behavioral;
