----------------------------------------------------------------------------------
-- Testbench adapted by Sydney Henninger from code written by engineer: Daniella Li Calzi
-- 
-- Design Name: aes_128_kat_GFSbox_tb
-- Module Name: aes_128_kat_GFSbox_tb - Behavioral
-- Project Name: SecureVision
-- Target Devices: Zybo Z7-20 SoC
-- Tool Versions: Vivado 2020.2
--
-- Description: This is a testbench adapted from and using aes_decrypt_controller_tb as a base. This now drives the keys and cyphertext for the GFSbox KAT tests and compares the output with the expected hex plaintext values.
-- Most of the logic remains the same from the origional test, but this file runs multiple tests at once instead of a single test.
--
-- Dependencies: All AES files that are not testbenches, must right click files in vivado and set all to VHDL 2008 to run the testbenches
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
-- OUTPUT:
-- aes_128_kat_GFSbox_tb.vhd:88:9:@0ms:(report note): Running GFSbox
-- aes_128_kat_GFSbox_tb.vhd:106:9:@25ns:(report note): Running GFSbox COUNT = 0
-- aes_128_kat_GFSbox_tb.vhd:125:9:@175ns:(report note): done decryption
-- aes_128_kat_GFSbox_tb.vhd:127:9:@175ns:(report note): PLAINTEXT_OUT (expected) = F34481EC3CC627BACD5DC3FB08F273E6
-- aes_128_kat_GFSbox_tb.vhd:128:9:@175ns:(report note): PLAINTEXT_OUT (actual)   = F34481EC3CC627BACD5DC3FB08F273E6
-- aes_128_kat_GFSbox_tb.vhd:131:13:@175ns:(report note): Correct plaintext output
-- aes_128_kat_GFSbox_tb.vhd:136:9:@175ns:(report note): Running GFSbox COUNT = 1
-- aes_128_kat_GFSbox_tb.vhd:155:9:@325ns:(report note): done decryption
-- aes_128_kat_GFSbox_tb.vhd:157:9:@325ns:(report note): PLAINTEXT_OUT (expected) = 9798C4640BAD75C7C3227DB910174E72
-- aes_128_kat_GFSbox_tb.vhd:158:9:@325ns:(report note): PLAINTEXT_OUT (actual)   = 9798C4640BAD75C7C3227DB910174E72
-- aes_128_kat_GFSbox_tb.vhd:161:13:@325ns:(report note): Correct plaintext output
-- aes_128_kat_GFSbox_tb.vhd:166:9:@325ns:(report note): Running GFSbox COUNT = 2
-- aes_128_kat_GFSbox_tb.vhd:185:9:@475ns:(report note): done decryption
-- aes_128_kat_GFSbox_tb.vhd:187:9:@475ns:(report note): PLAINTEXT_OUT (expected) = 96AB5C2FF612D9DFAAE8C31F30C42168
-- aes_128_kat_GFSbox_tb.vhd:188:9:@475ns:(report note): PLAINTEXT_OUT (actual)   = 96AB5C2FF612D9DFAAE8C31F30C42168
-- aes_128_kat_GFSbox_tb.vhd:191:13:@475ns:(report note): Correct plaintext output
-- aes_128_kat_GFSbox_tb.vhd:196:9:@475ns:(report note): Running GFSbox COUNT = 3
-- aes_128_kat_GFSbox_tb.vhd:215:9:@625ns:(report note): done decryption
-- aes_128_kat_GFSbox_tb.vhd:217:9:@625ns:(report note): PLAINTEXT_OUT (expected) = 6A118A874519E64E9963798A503F1D35
-- aes_128_kat_GFSbox_tb.vhd:218:9:@625ns:(report note): PLAINTEXT_OUT (actual)   = 6A118A874519E64E9963798A503F1D35
-- aes_128_kat_GFSbox_tb.vhd:221:13:@625ns:(report note): Correct plaintext output
-- aes_128_kat_GFSbox_tb.vhd:226:9:@625ns:(report note): Running GFSbox COUNT = 4
-- aes_128_kat_GFSbox_tb.vhd:245:9:@775ns:(report note): done decryption
-- aes_128_kat_GFSbox_tb.vhd:247:9:@775ns:(report note): PLAINTEXT_OUT (expected) = CB9FCEEC81286CA3E989BD979B0CB284
-- aes_128_kat_GFSbox_tb.vhd:248:9:@775ns:(report note): PLAINTEXT_OUT (actual)   = CB9FCEEC81286CA3E989BD979B0CB284
-- aes_128_kat_GFSbox_tb.vhd:251:13:@775ns:(report note): Correct plaintext output
-- aes_128_kat_GFSbox_tb.vhd:256:9:@775ns:(report note): Running GFSbox COUNT = 5
-- aes_128_kat_GFSbox_tb.vhd:275:9:@925ns:(report note): done decryption
-- aes_128_kat_GFSbox_tb.vhd:277:9:@925ns:(report note): PLAINTEXT_OUT (expected) = B26AEB1874E47CA8358FF22378F09144
-- aes_128_kat_GFSbox_tb.vhd:278:9:@925ns:(report note): PLAINTEXT_OUT (actual)   = B26AEB1874E47CA8358FF22378F09144
-- aes_128_kat_GFSbox_tb.vhd:281:13:@925ns:(report note): Correct plaintext output
-- aes_128_kat_GFSbox_tb.vhd:286:9:@925ns:(report note): Running GFSbox COUNT = 6
-- aes_128_kat_GFSbox_tb.vhd:305:9:@1075ns:(report note): done decryption
-- aes_128_kat_GFSbox_tb.vhd:307:9:@1075ns:(report note): PLAINTEXT_OUT (expected) = 58C8E00B2631686D54EAB84B91F0ACA1
-- aes_128_kat_GFSbox_tb.vhd:308:9:@1075ns:(report note): PLAINTEXT_OUT (actual)   = 58C8E00B2631686D54EAB84B91F0ACA1
-- aes_128_kat_GFSbox_tb.vhd:311:13:@1075ns:(report note): Correct plaintext output
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.aes_package.all;

-- Renamed entity
entity aes_128_kat_GFSbox_tb is
--  Port ( );
end aes_128_kat_GFSbox_tb;

-- changed name 
architecture Behavioral of aes_128_kat_GFSbox_tb is
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal start : STD_LOGIC := '0';
    signal key_ready : STD_LOGIC := '0';
    signal ciphertext_ready : STD_LOGIC := '0';
    signal aes_decrypt_done : STD_LOGIC;  
    signal key_in : std_logic_vector(127 downto 0) := (others => '0'); 
    signal ciphertext_in : STD_LOGIC_VECTOR (127 downto 0) := (others => '0');
    signal plaintext_out : STD_LOGIC_VECTOR (127 downto 0):= (others => '0'); 
    
    constant CLK_PERIOD : time := 10 ns;

    -- changed:this will now be updated per-test (COUNT) inside the process
    signal EXPECTED_PLAINTEXT : std_logic_vector(127 downto 0) :=
        x"f34481ec3cc627bacd5dc3fb08f273e6";
    
    component aes_decrypt_controller is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC; --active high
           
           --Control/Flags
           start : in STD_LOGIC;
           key_ready : in STD_LOGIC;
           ciphertext_ready : in STD_LOGIC;
           aes_decrypt_done : out STD_LOGIC;
           
           key_in : in std_logic_vector(127 downto 0);
           
           -- Text input and output          
           ciphertext_in : in STD_LOGIC_VECTOR (127 downto 0):= (others => '0'); --ciphertext
           plaintext_out : out STD_LOGIC_VECTOR (127 downto 0):= (others => '0')); --plaintext
           
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
           plaintext_out => plaintext_out
        );
        
    stim : process
    begin
        
        -- Change 2: Prints required suite label before running GFSbox
       
        report "Running GFSbox";

      
        -- Changed to Initialize / global reset once at start 
       
        wait until rising_edge(clk);
        reset <= '1';

        start <= '0';
        key_ready <= '0';
        ciphertext_ready <= '0';
        wait until rising_edge(clk);

        reset <= '0';
        wait until rising_edge(clk);

	-- Runs GFSbox tests:

        report "Running GFSbox COUNT = 0";
        key_in <= x"00000000000000000000000000000000";
        ciphertext_in <= x"0336763e966d92595a567cc9ce537f5e";
        EXPECTED_PLAINTEXT <= x"f34481ec3cc627bacd5dc3fb08f273e6";

        wait until rising_edge(clk);
        start <= '1';
        ciphertext_ready <= '1';
        wait until rising_edge(clk);

        key_ready <= '1';
        wait until rising_edge(clk);

        start <= '0';
        ciphertext_ready <= '0';
        key_ready <= '0';
        wait until rising_edge(clk);

        wait until aes_decrypt_done = '1';
        report "done decryption";

        report "PLAINTEXT_OUT (expected) = " & to_hstring(EXPECTED_PLAINTEXT);
        report "PLAINTEXT_OUT (actual)   = " & to_hstring(plaintext_out);

        if plaintext_out = EXPECTED_PLAINTEXT then
            report "Correct plaintext output";
        else
            report "Wrong plaintext output";
        end if;

        report "Running GFSbox COUNT = 1";
        key_in <= x"00000000000000000000000000000000";
        ciphertext_in <= x"a9a1631bf4996954ebc093957b234589";
        EXPECTED_PLAINTEXT <= x"9798c4640bad75c7c3227db910174e72";

        wait until rising_edge(clk);
        start <= '1';
        ciphertext_ready <= '1';
        wait until rising_edge(clk);

        key_ready <= '1';
        wait until rising_edge(clk);

        start <= '0';
        ciphertext_ready <= '0';
        key_ready <= '0';
        wait until rising_edge(clk);

        wait until aes_decrypt_done = '1';
        report "done decryption";

        report "PLAINTEXT_OUT (expected) = " & to_hstring(EXPECTED_PLAINTEXT);
        report "PLAINTEXT_OUT (actual)   = " & to_hstring(plaintext_out);

        if plaintext_out = EXPECTED_PLAINTEXT then
            report "Correct plaintext output";
        else
            report "Wrong plaintext output";
        end if;

        report "Running GFSbox COUNT = 2";
        key_in <= x"00000000000000000000000000000000";
        ciphertext_in <= x"ff4f8391a6a40ca5b25d23bedd44a597";
        EXPECTED_PLAINTEXT <= x"96ab5c2ff612d9dfaae8c31f30c42168";

        wait until rising_edge(clk);
        start <= '1';
        ciphertext_ready <= '1';
        wait until rising_edge(clk);

        key_ready <= '1';
        wait until rising_edge(clk);

        start <= '0';
        ciphertext_ready <= '0';
        key_ready <= '0';
        wait until rising_edge(clk);

        wait until aes_decrypt_done = '1';
        report "done decryption";

        report "PLAINTEXT_OUT (expected) = " & to_hstring(EXPECTED_PLAINTEXT);
        report "PLAINTEXT_OUT (actual)   = " & to_hstring(plaintext_out);

        if plaintext_out = EXPECTED_PLAINTEXT then
            report "Correct plaintext output";
        else
            report "Wrong plaintext output";
        end if;

        report "Running GFSbox COUNT = 3";
        key_in <= x"00000000000000000000000000000000";
        ciphertext_in <= x"dc43be40be0e53712f7e2bf5ca707209";
        EXPECTED_PLAINTEXT <= x"6a118a874519e64e9963798a503f1d35";

        wait until rising_edge(clk);
        start <= '1';
        ciphertext_ready <= '1';
        wait until rising_edge(clk);

        key_ready <= '1';
        wait until rising_edge(clk);

        start <= '0';
        ciphertext_ready <= '0';
        key_ready <= '0';
        wait until rising_edge(clk);

        wait until aes_decrypt_done = '1';
        report "done decryption";

        report "PLAINTEXT_OUT (expected) = " & to_hstring(EXPECTED_PLAINTEXT);
        report "PLAINTEXT_OUT (actual)   = " & to_hstring(plaintext_out);

        if plaintext_out = EXPECTED_PLAINTEXT then
            report "Correct plaintext output";
        else
            report "Wrong plaintext output";
        end if;

        report "Running GFSbox COUNT = 4";
        key_in <= x"00000000000000000000000000000000";
        ciphertext_in <= x"92beedab1895a94faa69b632e5cc47ce";
        EXPECTED_PLAINTEXT <= x"cb9fceec81286ca3e989bd979b0cb284";

        wait until rising_edge(clk);
        start <= '1';
        ciphertext_ready <= '1';
        wait until rising_edge(clk);

        key_ready <= '1';
        wait until rising_edge(clk);

        start <= '0';
        ciphertext_ready <= '0';
        key_ready <= '0';
        wait until rising_edge(clk);

        wait until aes_decrypt_done = '1';
        report "done decryption";

        report "PLAINTEXT_OUT (expected) = " & to_hstring(EXPECTED_PLAINTEXT);
        report "PLAINTEXT_OUT (actual)   = " & to_hstring(plaintext_out);

        if plaintext_out = EXPECTED_PLAINTEXT then
            report "Correct plaintext output";
        else
            report "Wrong plaintext output";
        end if;

        report "Running GFSbox COUNT = 5";
        key_in <= x"00000000000000000000000000000000";
        ciphertext_in <= x"459264f4798f6a78bacb89c15ed3d601";
        EXPECTED_PLAINTEXT <= x"b26aeb1874e47ca8358ff22378f09144";

        wait until rising_edge(clk);
        start <= '1';
        ciphertext_ready <= '1';
        wait until rising_edge(clk);

        key_ready <= '1';
        wait until rising_edge(clk);

        start <= '0';
        ciphertext_ready <= '0';
        key_ready <= '0';
        wait until rising_edge(clk);

        wait until aes_decrypt_done = '1';
        report "done decryption";

        report "PLAINTEXT_OUT (expected) = " & to_hstring(EXPECTED_PLAINTEXT);
        report "PLAINTEXT_OUT (actual)   = " & to_hstring(plaintext_out);

        if plaintext_out = EXPECTED_PLAINTEXT then
            report "Correct plaintext output";
        else
            report "Wrong plaintext output";
        end if;

        report "Running GFSbox COUNT = 6";
        key_in <= x"00000000000000000000000000000000";
        ciphertext_in <= x"08a4e2efec8a8e3312ca7460b9040bbf";
        EXPECTED_PLAINTEXT <= x"58c8e00b2631686d54eab84b91f0aca1";

        wait until rising_edge(clk);
        start <= '1';
        ciphertext_ready <= '1';
        wait until rising_edge(clk);

        key_ready <= '1';
        wait until rising_edge(clk);

        start <= '0';
        ciphertext_ready <= '0';
        key_ready <= '0';
        wait until rising_edge(clk);

        wait until aes_decrypt_done = '1';
        report "done decryption";

        report "PLAINTEXT_OUT (expected) = " & to_hstring(EXPECTED_PLAINTEXT);
        report "PLAINTEXT_OUT (actual)   = " & to_hstring(plaintext_out);

        if plaintext_out = EXPECTED_PLAINTEXT then
            report "Correct plaintext output";
        else
            report "Wrong plaintext output";
        end if;

        
        -- End
        
        wait;
    end process;
end Behavioral;