----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Design Name: 
-- Module Name: tb_InvSubBytes - Behavioral
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


entity tb_InvSubBytes is
--  Port ( );
end tb_InvSubBytes;

architecture Behavioral of tb_InvSubBytes is
    signal sb_input_tb : block_state_type;
    signal sb_output_tb : block_state_type;  
    signal sb_vector_input_tb : std_logic_vector(127 downto 0);
    signal sb_vector_output_tb : std_logic_vector(127 downto 0);
    
begin
     sb_input_tb <= pack_state_array(sb_vector_input_tb);
     sb_vector_output_tb <= unpack_state_array(sb_output_tb);
     
    uut : entity work.InvSubBytes
        port map (
        sb_in => sb_input_tb,
        sb_out => sb_output_tb
        );
        
    stim : process
    begin
        sb_vector_input_tb <= x"53812cf8b1adb476ce4f37315e44cf5e";
        
        
        wait for 10 ns;
            report "done processing InvSubBytes";
            
        wait;
    end process;
end Behavioral;
