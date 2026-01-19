----------------------------------------------------------------------------------
-- Testbench adapted by Sydney Henninger from code written by engineer: Daniella Li Calzi
-- 
-- Design Name: aes_128_kat_ECBKeySbox_tb
-- Module Name: aes_128_kat_ECBKeySbox_tb - Behavioral
-- Project Name: SecureVision
-- Target Devices: Zybo Z7-20 SoC
-- Tool Versions: Vivado 2020.2
--
-- Description: This is a testbench adapted from and using aes_decrypt_controller_tb as a base. This now drives the keys and cyphertext for the ECBKeySbox KAT tests and compares the output with the expected hex plaintext values.
-- Most of the logic remains the same from the origional test, but this file runs multiple tests at once instead of a single test.
--
-- Dependencies: All AES files that are not testbenches, must right click files in vivado and set all to VHDL 2008 to run the testbenches for some reason.
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
-- OUTPUT:
-- aes_128_kat_ECBKeySbox_tb.vhd:88:9:@0ms:(report note): Running KeySbox
-- aes_128_kat_ECBKeySbox_tb.vhd:106:9:@25ns:(report note): Running KeySbox COUNT = 0
-- aes_128_kat_ECBKeySbox_tb.vhd:125:9:@175ns:(report note): done decryption
-- aes_128_kat_ECBKeySbox_tb.vhd:127:9:@175ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:128:9:@175ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:131:13:@175ns:(report note): Correct plaintext output
-- aes_128_kat_ECBKeySbox_tb.vhd:136:9:@175ns:(report note): Running KeySbox COUNT = 1
-- aes_128_kat_ECBKeySbox_tb.vhd:155:9:@325ns:(report note): done decryption
-- aes_128_kat_ECBKeySbox_tb.vhd:157:9:@325ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:158:9:@325ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:161:13:@325ns:(report note): Correct plaintext output
-- aes_128_kat_ECBKeySbox_tb.vhd:166:9:@325ns:(report note): Running KeySbox COUNT = 2
-- aes_128_kat_ECBKeySbox_tb.vhd:185:9:@475ns:(report note): done decryption
-- aes_128_kat_ECBKeySbox_tb.vhd:187:9:@475ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:188:9:@475ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:191:13:@475ns:(report note): Correct plaintext output
-- aes_128_kat_ECBKeySbox_tb.vhd:196:9:@475ns:(report note): Running KeySbox COUNT = 3
-- aes_128_kat_ECBKeySbox_tb.vhd:215:9:@625ns:(report note): done decryption
-- aes_128_kat_ECBKeySbox_tb.vhd:217:9:@625ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:218:9:@625ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:221:13:@625ns:(report note): Correct plaintext output
-- aes_128_kat_ECBKeySbox_tb.vhd:226:9:@625ns:(report note): Running KeySbox COUNT = 4
-- aes_128_kat_ECBKeySbox_tb.vhd:245:9:@775ns:(report note): done decryption
-- aes_128_kat_ECBKeySbox_tb.vhd:247:9:@775ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:248:9:@775ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:251:13:@775ns:(report note): Correct plaintext output
-- aes_128_kat_ECBKeySbox_tb.vhd:256:9:@775ns:(report note): Running KeySbox COUNT = 5
-- aes_128_kat_ECBKeySbox_tb.vhd:275:9:@925ns:(report note): done decryption
-- aes_128_kat_ECBKeySbox_tb.vhd:277:9:@925ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:278:9:@925ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:281:13:@925ns:(report note): Correct plaintext output
-- aes_128_kat_ECBKeySbox_tb.vhd:286:9:@925ns:(report note): Running KeySbox COUNT = 6
-- aes_128_kat_ECBKeySbox_tb.vhd:305:9:@1075ns:(report note): done decryption
-- aes_128_kat_ECBKeySbox_tb.vhd:307:9:@1075ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:308:9:@1075ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:311:13:@1075ns:(report note): Correct plaintext output
-- aes_128_kat_ECBKeySbox_tb.vhd:316:9:@1075ns:(report note): Running KeySbox COUNT = 7
-- aes_128_kat_ECBKeySbox_tb.vhd:335:9:@1225ns:(report note): done decryption
-- aes_128_kat_ECBKeySbox_tb.vhd:337:9:@1225ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:338:9:@1225ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:341:13:@1225ns:(report note): Correct plaintext output
-- aes_128_kat_ECBKeySbox_tb.vhd:346:9:@1225ns:(report note): Running KeySbox COUNT = 8
-- aes_128_kat_ECBKeySbox_tb.vhd:365:9:@1375ns:(report note): done decryption
-- aes_128_kat_ECBKeySbox_tb.vhd:367:9:@1375ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:368:9:@1375ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:371:13:@1375ns:(report note): Correct plaintext output
-- aes_128_kat_ECBKeySbox_tb.vhd:376:9:@1375ns:(report note): Running KeySbox COUNT = 9
-- aes_128_kat_ECBKeySbox_tb.vhd:395:9:@1525ns:(report note): done decryption
-- aes_128_kat_ECBKeySbox_tb.vhd:397:9:@1525ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:398:9:@1525ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:401:13:@1525ns:(report note): Correct plaintext output
-- aes_128_kat_ECBKeySbox_tb.vhd:406:9:@1525ns:(report note): Running KeySbox COUNT = 10
-- aes_128_kat_ECBKeySbox_tb.vhd:425:9:@1675ns:(report note): done decryption
-- aes_128_kat_ECBKeySbox_tb.vhd:427:9:@1675ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:428:9:@1675ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:431:13:@1675ns:(report note): Correct plaintext output
-- aes_128_kat_ECBKeySbox_tb.vhd:436:9:@1675ns:(report note): Running KeySbox COUNT = 11
-- aes_128_kat_ECBKeySbox_tb.vhd:455:9:@1825ns:(report note): done decryption
-- aes_128_kat_ECBKeySbox_tb.vhd:457:9:@1825ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:458:9:@1825ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:461:13:@1825ns:(report note): Correct plaintext output
-- aes_128_kat_ECBKeySbox_tb.vhd:466:9:@1825ns:(report note): Running KeySbox COUNT = 12
-- aes_128_kat_ECBKeySbox_tb.vhd:485:9:@1975ns:(report note): done decryption
-- aes_128_kat_ECBKeySbox_tb.vhd:487:9:@1975ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:488:9:@1975ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:491:13:@1975ns:(report note): Correct plaintext output
-- aes_128_kat_ECBKeySbox_tb.vhd:496:9:@1975ns:(report note): Running KeySbox COUNT = 13
-- aes_128_kat_ECBKeySbox_tb.vhd:515:9:@2125ns:(report note): done decryption
-- aes_128_kat_ECBKeySbox_tb.vhd:517:9:@2125ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:518:9:@2125ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:521:13:@2125ns:(report note): Correct plaintext output
-- aes_128_kat_ECBKeySbox_tb.vhd:526:9:@2125ns:(report note): Running KeySbox COUNT = 14
-- aes_128_kat_ECBKeySbox_tb.vhd:545:9:@2275ns:(report note): done decryption
-- aes_128_kat_ECBKeySbox_tb.vhd:547:9:@2275ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:548:9:@2275ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:551:13:@2275ns:(report note): Correct plaintext output
-- aes_128_kat_ECBKeySbox_tb.vhd:556:9:@2275ns:(report note): Running KeySbox COUNT = 15
-- aes_128_kat_ECBKeySbox_tb.vhd:575:9:@2425ns:(report note): done decryption
-- aes_128_kat_ECBKeySbox_tb.vhd:577:9:@2425ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:578:9:@2425ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:581:13:@2425ns:(report note): Correct plaintext output
-- aes_128_kat_ECBKeySbox_tb.vhd:586:9:@2425ns:(report note): Running KeySbox COUNT = 16
-- aes_128_kat_ECBKeySbox_tb.vhd:605:9:@2575ns:(report note): done decryption
-- aes_128_kat_ECBKeySbox_tb.vhd:607:9:@2575ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:608:9:@2575ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:611:13:@2575ns:(report note): Correct plaintext output
-- aes_128_kat_ECBKeySbox_tb.vhd:616:9:@2575ns:(report note): Running KeySbox COUNT = 17
-- aes_128_kat_ECBKeySbox_tb.vhd:635:9:@2725ns:(report note): done decryption
-- aes_128_kat_ECBKeySbox_tb.vhd:637:9:@2725ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:638:9:@2725ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:641:13:@2725ns:(report note): Correct plaintext output
-- aes_128_kat_ECBKeySbox_tb.vhd:646:9:@2725ns:(report note): Running KeySbox COUNT = 18
-- aes_128_kat_ECBKeySbox_tb.vhd:665:9:@2875ns:(report note): done decryption
-- aes_128_kat_ECBKeySbox_tb.vhd:667:9:@2875ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:668:9:@2875ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:671:13:@2875ns:(report note): Correct plaintext output
-- aes_128_kat_ECBKeySbox_tb.vhd:676:9:@2875ns:(report note): Running KeySbox COUNT = 19
-- aes_128_kat_ECBKeySbox_tb.vhd:695:9:@3025ns:(report note): done decryption
-- aes_128_kat_ECBKeySbox_tb.vhd:697:9:@3025ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:698:9:@3025ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:701:13:@3025ns:(report note): Correct plaintext output
-- aes_128_kat_ECBKeySbox_tb.vhd:706:9:@3025ns:(report note): Running KeySbox COUNT = 20
-- aes_128_kat_ECBKeySbox_tb.vhd:725:9:@3175ns:(report note): done decryption
-- aes_128_kat_ECBKeySbox_tb.vhd:727:9:@3175ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:728:9:@3175ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBKeySbox_tb.vhd:731:13:@3175ns:(report note): Correct plaintext output
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.aes_package.all;

-- Renamed entity
entity aes_128_kat_ECBKeySbox_tb is
--  Port ( );
end aes_128_kat_ECBKeySbox_tb;

-- changed name 
architecture Behavioral of aes_128_kat_ECBKeySbox_tb is
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

    -- changed. this will now be updated per-test (COUNT) inside the process
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
        
       
        report "Running KeySbox";

      
        -- Changed to Initialize / global reset once at start 
       
        wait until rising_edge(clk);
        reset <= '1';

        start <= '0';
        key_ready <= '0';
        ciphertext_ready <= '0';
        wait until rising_edge(clk);

        reset <= '0';
        wait until rising_edge(clk);

	-- Runs ECBKeySbox tests:

        report "Running KeySbox COUNT = 0";
        key_in <= x"10a58869d74be5a374cf867cfb473859";
        ciphertext_in <= x"6d251e6944b051e04eaa6fb4dbf78465";
        EXPECTED_PLAINTEXT <= x"00000000000000000000000000000000";

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

        report "Running KeySbox COUNT = 1";
        key_in <= x"caea65cdbb75e9169ecd22ebe6e54675";
        ciphertext_in <= x"6e29201190152df4ee058139def610bb";
        EXPECTED_PLAINTEXT <= x"00000000000000000000000000000000";

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

        report "Running KeySbox COUNT = 2";
        key_in <= x"a2e2fa9baf7d20822ca9f0542f764a41";
        ciphertext_in <= x"c3b44b95d9d2f25670eee9a0de099fa3";
        EXPECTED_PLAINTEXT <= x"00000000000000000000000000000000";

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

        report "Running KeySbox COUNT = 3";
        key_in <= x"b6364ac4e1de1e285eaf144a2415f7a0";
        ciphertext_in <= x"5d9b05578fc944b3cf1ccf0e746cd581";
        EXPECTED_PLAINTEXT <= x"00000000000000000000000000000000";

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

        report "Running KeySbox COUNT = 4";
        key_in <= x"64cf9c7abc50b888af65f49d521944b2";
        ciphertext_in <= x"f7efc89d5dba578104016ce5ad659c05";
        EXPECTED_PLAINTEXT <= x"00000000000000000000000000000000";

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

        report "Running KeySbox COUNT = 5";
        key_in <= x"47d6742eefcc0465dc96355e851b64d9";
        ciphertext_in <= x"0306194f666d183624aa230a8b264ae7";
        EXPECTED_PLAINTEXT <= x"00000000000000000000000000000000";

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

        report "Running KeySbox COUNT = 6";
        key_in <= x"3eb39790678c56bee34bbcdeccf6cdb5";
        ciphertext_in <= x"858075d536d79ccee571f7d7204b1f67";
        EXPECTED_PLAINTEXT <= x"00000000000000000000000000000000";

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

        report "Running KeySbox COUNT = 7";
        key_in <= x"64110a924f0743d500ccadae72c13427";
        ciphertext_in <= x"35870c6a57e9e92314bcb8087cde72ce";
        EXPECTED_PLAINTEXT <= x"00000000000000000000000000000000";

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

        report "Running KeySbox COUNT = 8";
        key_in <= x"18d8126516f8a12ab1a36d9f04d68e51";
        ciphertext_in <= x"6c68e9be5ec41e22c825b7c7affb4363";
        EXPECTED_PLAINTEXT <= x"00000000000000000000000000000000";

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

        report "Running KeySbox COUNT = 9";
        key_in <= x"f530357968578480b398a3c251cd1093";
        ciphertext_in <= x"f5df39990fc688f1b07224cc03e86cea";
        EXPECTED_PLAINTEXT <= x"00000000000000000000000000000000";

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

        report "Running KeySbox COUNT = 10";
        key_in <= x"da84367f325d42d601b4326964802e8e";
        ciphertext_in <= x"bba071bcb470f8f6586e5d3add18bc66";
        EXPECTED_PLAINTEXT <= x"00000000000000000000000000000000";

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

        report "Running KeySbox COUNT = 11";
        key_in <= x"e37b1c6aa2846f6fdb413f238b089f23";
        ciphertext_in <= x"43c9f7e62f5d288bb27aa40ef8fe1ea8";
        EXPECTED_PLAINTEXT <= x"00000000000000000000000000000000";

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

        report "Running KeySbox COUNT = 12";
        key_in <= x"6c002b682483e0cabcc731c253be5674";
        ciphertext_in <= x"3580d19cff44f1014a7c966a69059de5";
        EXPECTED_PLAINTEXT <= x"00000000000000000000000000000000";

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

        report "Running KeySbox COUNT = 13";
        key_in <= x"143ae8ed6555aba96110ab58893a8ae1";
        ciphertext_in <= x"806da864dd29d48deafbe764f8202aef";
        EXPECTED_PLAINTEXT <= x"00000000000000000000000000000000";

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

        report "Running KeySbox COUNT = 14";
        key_in <= x"b69418a85332240dc82492353956ae0c";
        ciphertext_in <= x"a303d940ded8f0baff6f75414cac5243";
        EXPECTED_PLAINTEXT <= x"00000000000000000000000000000000";

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

        report "Running KeySbox COUNT = 15";
        key_in <= x"71b5c08a1993e1362e4d0ce9b22b78d5";
        ciphertext_in <= x"c2dabd117f8a3ecabfbb11d12194d9d0";
        EXPECTED_PLAINTEXT <= x"00000000000000000000000000000000";

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

        report "Running KeySbox COUNT = 16";
        key_in <= x"e234cdca2606b81f29408d5f6da21206";
        ciphertext_in <= x"fff60a4740086b3b9c56195b98d91a7b";
        EXPECTED_PLAINTEXT <= x"00000000000000000000000000000000";

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

        report "Running KeySbox COUNT = 17";
        key_in <= x"13237c49074a3da078dc1d828bb78c6f";
        ciphertext_in <= x"8146a08e2357f0caa30ca8c94d1a0544";
        EXPECTED_PLAINTEXT <= x"00000000000000000000000000000000";

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

        report "Running KeySbox COUNT = 18";
        key_in <= x"3071a2a48fe6cbd04f1a129098e308f8";
        ciphertext_in <= x"4b98e06d356deb07ebb824e5713f7be3";
        EXPECTED_PLAINTEXT <= x"00000000000000000000000000000000";

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

        report "Running KeySbox COUNT = 19";
        key_in <= x"90f42ec0f68385f2ffc5dfc03a654dce";
        ciphertext_in <= x"7a20a53d460fc9ce0423a7a0764c6cf2";
        EXPECTED_PLAINTEXT <= x"00000000000000000000000000000000";

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

        report "Running KeySbox COUNT = 20";
        key_in <= x"febd9a24d8b65c1c787d50a4ed3619a9";
        ciphertext_in <= x"f4a70d8af877f9b02b4c40df57d45b17";
        EXPECTED_PLAINTEXT <= x"00000000000000000000000000000000";

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