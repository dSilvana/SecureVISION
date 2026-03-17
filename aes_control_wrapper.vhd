----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2026 10:38:49 PM
-- Design Name: 
-- Module Name: aes_control_wrapper - Behavioral
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
use work.aes_package.all;
use IEEE.NUMERIC_STD.ALL;
--library UNISIM;
--use UNISIM.VComponents.all;

entity aes_control_wrapper is
  Port (clk : in std_logic;
        reset : in std_logic;
        start: in std_logic;
        done : out std_logic
        );
        
end aes_control_wrapper;

architecture Behavioral of aes_control_wrapper is
    signal key_in : std_logic_vector(127 downto 0);
    signal ciphertext_in : std_logic_vector(127 downto 0);
    signal plaintext_out : std_logic_vector(127 downto 0);
    signal key_ready : std_logic;
    signal ciphertext_ready : std_logic;
    signal aes_done : std_logic;
    
begin

    key_in <= x"2b7e151628aed2a6abf7158809cf4f3c";
    ciphertext_in <= x"3ad77bb40d7a3660a89ecaf32466ef97";
        
    key_ready <= '1';
    ciphertext_ready <= '1';
        
    inst_aes : entity work.aes_decrypt_controller
        port map (
           clk => clk,
           reset => reset,
           start => start,
           key_ready => key_ready,
           ciphertext_ready => ciphertext_ready,
           aes_decrypt_done => aes_done,
           key_in => key_in,
           ciphertext_in => ciphertext_in,
           plaintext_out => plaintext_out
        );
        
    done <= aes_done;
        
end Behavioral;
