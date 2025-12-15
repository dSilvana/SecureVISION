----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/12/2025 12:44:39 AM
-- Design Name: 
-- Module Name: tb_InvMixColumns - Behavioral
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

entity tb_InvMixColumns is
--  Port ( );
end tb_InvMixColumns;

architecture Behavioral of tb_InvMixColumns is
    signal mxc_input_tb : std_logic_vector(127 downto 0);
    signal mxc_output_tb : std_logic_vector(127 downto 0);
begin

    uut : entity work.InvMixColumns
    port map ( 
        mxc_in => mxc_input_tb,
        mxc_out => mxc_output_tb
    );
    
    stim : process
    begin
        mxc_input_tb <= x"53812cf8b1adb476ce4f37315e44cf5e";
        
        
        wait for 10 ns;
            report "done processing InvMixColumns";
            
        wait;
    end process;
end Behavioral;
