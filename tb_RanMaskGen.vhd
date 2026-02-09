----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/28/2026 02:46:23 PM
-- Design Name: 
-- Module Name: tb_RanMaskGen - Behavioral
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


entity tb_RanMaskGen is
--  Port ( );
end tb_RanMaskGen;

architecture Behavioral of tb_RanMaskGen is

  signal clk : std_logic;
  --signal reset : std_logic := '0';
  signal enable : std_logic := '0';
  signal load : std_logic := '0';

  signal mask_out : std_logic_vector(127 downto 0);
 -- signal done : std_logic;
  
begin

uut : entity work.RanMaskGen
        port map (
            clk => clk,
            --reset => reset,
            enable => enable,
            load => load,
            mask_out => mask_out
            --done => done
        );

clk_process : process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;
    
stim : process
    begin
        -- Initial reset
        --reset <= '0';
        enable <= '0';
        load <= '1';
        wait for 20 ns;

        --reset <= '0';
        enable <= '1';
        load <= '0';
        wait for 20 ns;

        -- Run LFSR
        wait for 200 ns;

        -- Stop
        enable <= '0';
        wait for 50 ns;

        wait;
    end process;
    
end Behavioral;
