
-- ============================================================================
-- FILE: aes_key_expansion_eic_tb.vhd
-- TITLE: AES-128 Key Expansion (Inverse Cipher Round Key Schedule) Test Bench
-- PROJECT: SecureVISION – Secure AES Hardware Cryptography
-- AUTHOR: SecureVISION Project Team (Self-Implemented)
-- DATE: November 2025
--
-- DESCRIPTION:
-- 	
--   This testbench feeds a 128 bit key into aes_key_expansion_eic, after recieving the filled eic_keys array, this testbench prints the round keys in hex.
--   This code uses example hexadecimal Cipher Key = 2b 7e 15 16 28 ae d2 a6 ab f7 15 88 09 cf 4f 3c  from the nist.fips.197 publication to test the key schedule eic output.
--   Output key order seems to match the expected output behavior for the eic key schedule and the requirements of the aes_eic.vhd inverse cipher where:
--   key 0 matches the table, rounds 1-9 are pre-mixed, and the round 10 key matches the table.
--  
-- NOTE: 
-- There does not seem to be a full table out there for eic key values? The tables I found were all with keys that were not pre-mixed. Since this is the case, this still seems to be outputting as expected.
-- There are two pdf's from nist that both have tables for the regular key expansion using this key. I would recommend using the redacted pdf because the values are the same for both but you can use ctrl f to easily search for the
-- round key values in the redacted version. The other pdf has the table inserted as an image.
-- If using ghdl and you've finished running this, press ctrl c to exit.
--
-- OUTPUT: 
-- aes_key_expansion_eic_tb.vhd:92:9:@0ms:(report note): === AES-128 EIC Key Expansion Test ===
-- aes_key_expansion_eic_tb.vhd:99:9:@20ns:(report note): Input key: 2B7E151628AED2A6ABF7158809CF4F3C
-- aes_key_expansion_eic_tb.vhd:103:13:@20ns:(report note): Round 0: 2b7e1516 28aed2a6 abf71588 09cf4f3c
-- aes_key_expansion_eic_tb.vhd:103:13:@20ns:(report note): Round 1: 2b3708a7 f262d405 bc3ebdbf 4b617d62
-- aes_key_expansion_eic_tb.vhd:103:13:@20ns:(report note): Round 2: cc7505eb 3e17d1ee 82296c51 c9481133
-- aes_key_expansion_eic_tb.vhd:103:13:@20ns:(report note): Round 3: 7c1f13f7 4208c219 c021ae48 0969bf7b
-- aes_key_expansion_eic_tb.vhd:103:13:@20ns:(report note): Round 4: 90884413 d280860a 12a12842 1bc89739
-- aes_key_expansion_eic_tb.vhd:103:13:@20ns:(report note): Round 5: 6ea30afc bc238cf6 ae82a4b4 b54a338d
-- aes_key_expansion_eic_tb.vhd:103:13:@20ns:(report note): Round 6: 6efcd876 d2df5480 7c5df034 c917c3b9
-- aes_key_expansion_eic_tb.vhd:103:13:@20ns:(report note): Round 7: 12c07647 c01f22c7 bc42d2f3 7555114a
-- aes_key_expansion_eic_tb.vhd:103:13:@20ns:(report note): Round 8: df7d925a 1f62b09d a320626e d6757324
-- aes_key_expansion_eic_tb.vhd:103:13:@20ns:(report note): Round 9: 0c7b5a63 1319eafe b0398890 664cfbb4
-- aes_key_expansion_eic_tb.vhd:103:13:@20ns:(report note): Round 10: d014f9a8 c9ee2589 e13f0cc8 b6630ca6
-- aes_key_expansion_eic_tb.vhd:110:9:@20ns:(report note): === End of Key Expansion ===
-- 
-- ============================================================================


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.aes_package.all;  

entity aes_key_expansion_eic_tb is
end aes_key_expansion_eic_tb;

architecture Behavioral of aes_key_expansion_eic_tb is

    
    -- Unit Under Test (UUT). Component declaration. 
    
    component aes_key_expansion_eic is -- The block I am testing
        Port (
            key_in   : in  std_logic_vector(127 downto 0); -- 128 bits. This is the key
            eic_keys : out round_key_type -- This is an array of all of the expanded round keys
        );
    end component;

    -- Signals for connecting to aes_key_expansion_eic
    signal key_in   : std_logic_vector(127 downto 0); -- Sends test key from test to aes_key_expansion_eic
    signal eic_keys : round_key_type; -- Recieves output from aes_key_expansion_eic for use in the testbench for printing

    
	-- Helper function for formatting: convert 32-bit word to hex string for us to read
	-- Loops through the data in chunks of 4 bit nibbles and then it calculates the value.
	-- If the first bit is one, this adds 8, if the second bit is one it adds 4.
	-- If the value is 0-9 this prints a number, 10-15 it prints a-f 
	-- takes 32 bits, breaks these into 8 chunks of 4 bits, converts eah chunk into a hex digit and then 
	-- glues the 8 characters into a string (each of these is a word)
    
    function to_hex_word(s : std_logic_vector(31 downto 0)) return string is
        variable result : string(1 to 8);
        variable nibble : std_logic_vector(3 downto 0);
        variable val    : integer;
        variable idx    : integer := 1;
    begin
        for i in 0 to 7 loop 				-- Loops 8 times
            nibble := s((31 - i*4) downto (28 - i*4));  -- Picks 4 bits from s
            val := 0;
            if nibble(3) = '1' then val := val + 8; end if;
            if nibble(2) = '1' then val := val + 4; end if;
            if nibble(1) = '1' then val := val + 2; end if;
            if nibble(0) = '1' then val := val + 1; end if;

            -- Hex (0–9, a–f), this is where it gets converted to hex characters 
            if val < 10 then
                result(idx) := character'val(character'pos('0') + val); -- stores character in result(idx)
            else
                -- 'a' + (val - 10)
                result(idx) := character'val(character'pos('a') + (val - 10));
            end if;

            idx := idx + 1; 		-- Moves to the next character position in the output string
        end loop;
        return result; 			-- Returns 8 hex characters
    end function;

begin

  
    -- Instantiates the key expansion. 
    
    uut : aes_key_expansion_eic
        port map (
            key_in   => key_in, -- connects the aes_key_expansion_eic's input port to the  key_in inside this tb
            eic_keys => eic_keys -- connects the aes_key_expansion_eic's output port eic_keys to the eic_keys in th inside this testbench
        );

    
    -- Stimulus: Applies the AES-128 cipher key and prints each round key. Drives key_in and prints results
    
    stim_proc : process
    begin
        report "=== AES-128 EIC Key Expansion Test ==="; -- Prints title 

        -- FIPS-197 Appendix A test key:
        -- Cipher Key = 2B 7E 15 16 28 AE D2 A6 AB F7 15 88 09 CF 4F 3C
        key_in <= x"2B7E151628AED2A6ABF7158809CF4F3C";	
        wait for 20 ns;  -- Need this here to prevent odd behavior, program waits 20 ns before reading what was returned in eic_keys and outputing

        report "Input key: 2B7E151628AED2A6ABF7158809CF4F3C"; -- Prints the origional key used

        -- Prints 11 round keys (0-10), four 32-bit words each
	-- Loop goes through the eic_keys array, grabs four 'words' at a time, and uses the helper function to print all four words on the same line with spaces between each word, each round key gets displayed it's own line.
	
        for round in 0 to 10 loop
            report "Round " & integer'image(round) & ": " -- eic_keys(round*4 + n) navigates the array
                & to_hex_word(eic_keys(round*4)) & " "
                & to_hex_word(eic_keys(round*4+1)) & " "
                & to_hex_word(eic_keys(round*4+2)) & " "
                & to_hex_word(eic_keys(round*4+3));
        end loop;

        report "=== End of Key Expansion ==="; -- Prints this to show that the test is over
        wait;
    end process;

end Behavioral;
