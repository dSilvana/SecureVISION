-- =====================================================================================================
-- OUTPUT:
-- aes_key_expansion_w_tb.vhd:52:9:@0ms:(report note): === AES-128 FORWARD KEY EXPANSION TEST ===
-- aes_key_expansion_w_tb.vhd:58:9:@20ns:(report note): Input key: 2B7E151628AED2A6ABF7158809CF4F3C
-- aes_key_expansion_w_tb.vhd:61:13:@20ns:(report note): Round 0: 2b7e1516 28aed2a6 abf71588 09cf4f3c
-- aes_key_expansion_w_tb.vhd:61:13:@20ns:(report note): Round 1: a0fafe17 88542cb1 23a33939 2a6c7605
-- aes_key_expansion_w_tb.vhd:61:13:@20ns:(report note): Round 2: f2c295f2 7a96b943 5935807a 7359f67f
-- aes_key_expansion_w_tb.vhd:61:13:@20ns:(report note): Round 3: 3d80477d 4716fe3e 1e237e44 6d7a883b
-- aes_key_expansion_w_tb.vhd:61:13:@20ns:(report note): Round 4: ef44a541 a8525b7f b671253b db0bad00
-- aes_key_expansion_w_tb.vhd:61:13:@20ns:(report note): Round 5: d4d1c6f8 7c839d87 caf2b8bc 11f915bc
-- aes_key_expansion_w_tb.vhd:61:13:@20ns:(report note): Round 6: 6d88a37a 110b3efd dbf98641 ca0093fd
-- aes_key_expansion_w_tb.vhd:61:13:@20ns:(report note): Round 7: 4e54f70e 5f5fc9f3 84a64fb2 4ea6dc4f
-- aes_key_expansion_w_tb.vhd:61:13:@20ns:(report note): Round 8: ead27321 b58dbad2 312bf560 7f8d292f
-- aes_key_expansion_w_tb.vhd:61:13:@20ns:(report note): Round 9: ac7766f3 19fadc21 28d12941 575c006e
-- aes_key_expansion_w_tb.vhd:61:13:@20ns:(report note): Round 10: d014f9a8 c9ee2589 e13f0cc8 b6630ca6
-- aes_key_expansion_w_tb.vhd:68:9:@20ns:(report note): === End of Forward Key Expansion ===
-- 
-- Not commented because this is pretty much just a clone of my other testbench.
-- Only real difference is that it outputs w (non-mixed round keys) instead of dw (mixed round keys)
-- 
-- =====================================================================================================


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.aes_package.all;

entity aes_key_expansion_w_tb is
end aes_key_expansion_w_tb;

architecture Behavioral of aes_key_expansion_w_tb is

    signal key_in   : std_logic_vector(127 downto 0);
    signal eic_keys : round_key_type;  -- not used here, but must be connected for the key schedule
    signal enc_keys : round_key_type;  -- this is w

    -- same to_hex_word function:
    function to_hex_word(s : std_logic_vector(31 downto 0)) return string is
        variable result : string(1 to 8);
        variable nibble : std_logic_vector(3 downto 0);
        variable val    : integer;
        variable idx    : integer := 1;
    begin
        for i in 0 to 7 loop
            nibble := s((31 - i*4) downto (28 - i*4));
            val := 0;
            if nibble(3) = '1' then val := val + 8; end if;
            if nibble(2) = '1' then val := val + 4; end if;
            if nibble(1) = '1' then val := val + 2; end if;
            if nibble(0) = '1' then val := val + 1; end if;

            if val < 10 then
                result(idx) := character'val(character'pos('0') + val);
            else
                result(idx) := character'val(character'pos('a') + (val - 10));
            end if;

            idx := idx + 1;
        end loop;
        return result;
    end function;

begin

    uut : entity work.aes_key_expansion_eic
        port map (
            key_in   => key_in,
            eic_keys => eic_keys,
            enc_keys => enc_keys
        );

    stim_proc : process
    begin
        report "=== AES-128 FORWARD KEY EXPANSION TEST ===";

        -- FIPS-197 test key
        key_in <= x"2B7E151628AED2A6ABF7158809CF4F3C";
        wait for 20 ns;

        report "Input key: 2B7E151628AED2A6ABF7158809CF4F3C";

        for round in 0 to 10 loop
            report "Round " & integer'image(round) & ": "
                & to_hex_word(enc_keys(round*4))   & " "
                & to_hex_word(enc_keys(round*4+1)) & " "
                & to_hex_word(enc_keys(round*4+2)) & " "
                & to_hex_word(enc_keys(round*4+3));
        end loop;

        report "=== End of Forward Key Expansion ===";
        wait;
    end process;

end Behavioral;
