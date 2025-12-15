----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Design Name: 
-- Module Name: tb_InvShiftRows - Behavioral
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

entity tb_InvShiftRows is
end tb_InvShiftRows;

architecture Behavioral of tb_InvShiftRows is
    signal sr_input_tb : std_logic_vector(127 downto 0);
    signal sr_output_tb : block_state_type;  
    signal sr_vector_output_tb : std_logic_vector(127 downto 0);
    
              
begin

    uut : entity work.InvShiftRows
        port map(
            sr_in => sr_input_tb,
            sr_out => sr_output_tb
        );

    sr_vector_output_tb <= unpack_state_array(sr_output_tb);

    stim_proc: process
    begin
        sr_input_tb <= x"53812cf8b1adb476ce4f37315e44cf5e";
        
        wait for 10 ns;
            report "done processing InvShiftRows";
            
        wait;
    end process;
        
end Behavioral;
