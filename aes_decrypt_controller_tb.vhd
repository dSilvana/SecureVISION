----------------------------------------------------------------------------------
-- Engineer: Daniella Li Calzi
-- 
-- Design Name: aes_decrypt_controller_tb
-- Module Name: aes_decrypt_controller_tb - Behavioral
-- Project Name: SecureVision
-- Target Devices: Zybo Z7-20 SoC
-- Tool Versions: Vivado 2020.2
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

entity aes_decrypt_controller_tb is
--  Port ( );
end aes_decrypt_controller_tb;

architecture Behavioral of aes_decrypt_controller_tb is
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal start : STD_LOGIC := '0';
    signal key_ready : STD_LOGIC := '0';
    signal ciphertext_ready : STD_LOGIC := '0';
    signal aes_decrypt_done : STD_LOGIC;  
    signal key_in : std_logic_vector(127 downto 0) := (others => '0'); 
    signal ciphertext_in : STD_LOGIC_VECTOR (127 downto 0) := (others => '0');
    signal plaintext_out : STD_LOGIC_VECTOR (127 downto 0); 
    signal byte_reg_value : STD_LOGIC_VECTOR (127 downto 0);
    
    constant CLK_PERIOD : time := 10 ns;
    
    component aes_decrypt_controller is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC; --active high
           
           --Control/Flags
           start : in STD_LOGIC;
           key_ready : in STD_LOGIC;
           ciphertext_ready : in STD_LOGIC;
           aes_decrypt_done : out STD_LOGIC;
           
           key_in : in std_logic_vector(127 downto 0);
           byte_reg_value : out STD_LOGIC_VECTOR (127 downto 0);
           
           -- Text input and output          
           ciphertext_in : in STD_LOGIC_VECTOR (127 downto 0); --ciphertext
           plaintext_out : out STD_LOGIC_VECTOR (127 downto 0)); --plaintext
           
    end component;
   
begin
    clk <= not clk after CLK_PERIOD / 2;
    
    uut : entity work.aes_decrypt_controller
        port map (
           clk => clk,
           reset => reset,
           start => start,
           key_ready => key_ready,
           ciphertext_ready => ciphertext_ready,
           aes_decrypt_done => aes_decrypt_done,
           key_in => key_in,   
           ciphertext_in => ciphertext_in,
           plaintext_out => plaintext_out,
           byte_reg_value => byte_reg_value
        );
        
    stim : process
    begin
  
        reset <= '1';
        start <= '0';
        key_ready <= '0';
        ciphertext_ready <= '0';
        wait until rising_edge(clk);
        
        key_in <= x"2b7e151628aed2a6abf7158809cf4f3c";
        ciphertext_in <= x"3925841d02dc09fbdc118597196a0b32";
        
        reset <= '0';
        start <= '1';
        ciphertext_ready <= '1';
        wait until rising_edge(clk);
    
        key_ready <= '1';
        wait until rising_edge(clk);
        
        start <= '0';
        ciphertext_ready <= '0';
        key_ready <= '0';
        --wait for 1 * CLK_PERIOD;
        
        wait until aes_decrypt_done = '1';
            report "done decryption";
            
       
        if plaintext_out = x"3243f6a8885a308d313198a2e0370734" then
            report "Correct plaintext output";
        else 
            report "Wrong plaintext output";
        end if;
            
        wait;
    end process;
end Behavioral;


