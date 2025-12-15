-- ============================================================================
-- FILE: aes_key_expansion_eic.vhd
-- TITLE: AES-128 Key Expansion (Inverse Cipher Round Key Schedule)
-- PROJECT: SecureVISION – Secure AES Hardware Cryptography
-- AUTHOR: SecureVISION Project Team (Self-Implemented)
-- DATE: November 2025
--
-- DESCRIPTION:
--   Generates all 44 round words (4 x (Nr + 1)) for AES-128, and produces
--   the key schedule formatted specifically for decryption, including:
--   Standard RotWord() and SubWord()
--   XOR with RCON constants per FIPS-197 specification
--   InvMixColumns applied to intermediate round keys (rounds 1-9 only)
--
--   Output key order matches the requirements of the aes_eic.vhd inverse cipher.
--
-- SELF-IMPLEMENTATION / PROVENANCE:
-- Fully self-implemented AES key scheduler.
--
--
-- NOTES:
-- This is the Equivalent Inverse Cipher Key expansion. I picked the modified key schedule dw. 
-- I picked this because this mode seems to be better for hardware implementations of AES
-- ============================================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.aes_package.all;

-- Input a 128 bit key Nk = 4. 
-- The output is the modified key schedule, 44 words each 32 bit as round_key_type.
-- FIPS key schedule w[i] with size 4(Nr +1) = 4*(10 + 1) = 44 words 

entity aes_key_expansion_eic is
    Port (
        key_in     : in  std_logic_vector(127 downto 0);
        eic_keys    : out round_key_type
    );
end aes_key_expansion_eic;

architecture Behavioral of aes_key_expansion_eic is

-- This is the 10 round constants for aes 128 as defined in FIPS PUB 197 Table 5

    type rcon_type is array(0 to 9) of std_logic_vector(7 downto 0);
    constant RCON : rcon_type := (
        x"01", x"02", x"04", x"08", x"10", x"20", x"40", x"80", x"1b", x"36"
    );


-- RotWord rotates the 4-byte word left one byte. This should turn [a0,a1,a2,a3] into [a1,a2,a3,a0]. 

    function rot_word(word_in : std_logic_vector(31 downto 0)) return std_logic_vector is
    begin
        return word_in(23 downto 0) & word_in(31 downto 24);
    end function;

-- Sub word applies the forward S-Box to each byte for key expansion

    function sub_word(word_in : std_logic_vector(31 downto 0)) return std_logic_vector is
        variable result : std_logic_vector(31 downto 0);
    begin
        result(31 downto 24) := SBOX(to_integer(unsigned(word_in(31 downto 24))));
        result(23 downto 16) := SBOX(to_integer(unsigned(word_in(23 downto 16))));
        result(15 downto 8)  := SBOX(to_integer(unsigned(word_in(15 downto 8))));
        result(7 downto 0)   := SBOX(to_integer(unsigned(word_in(7 downto 0))));
        return result;
    end function;
    
    
-------------------------------------------------------------------------------------------------
-- This applies the inverse mix columns matrix to a 32 bit word that is treated as a column. Each column of the state is a word.

    function inv_mix_column_word(word_in : std_logic_vector(31 downto 0)) return std_logic_vector is
        variable s0, s1, s2, s3 : std_logic_vector(7 downto 0);
        variable result : std_logic_vector(31 downto 0);
    begin
        s0 := word_in(31 downto 24);
        s1 := word_in(23 downto 16);
        s2 := word_in(15 downto 8);
        s3 := word_in(7 downto 0);

        result(31 downto 24) := gf_mult(x"0e", s0) xor gf_mult(x"0b", s1) xor gf_mult(x"0d", s2) xor gf_mult(x"09", s3);
        result(23 downto 16) := gf_mult(x"09", s0) xor gf_mult(x"0e", s1) xor gf_mult(x"0b", s2) xor gf_mult(x"0d", s3);
        result(15 downto 8)  := gf_mult(x"0d", s0) xor gf_mult(x"09", s1) xor gf_mult(x"0e", s2) xor gf_mult(x"0b", s3);
        result(7 downto 0)   := gf_mult(x"0b", s0) xor gf_mult(x"0d", s1) xor gf_mult(x"09", s2) xor gf_mult(x"0e", s3);

        return result;
    end function;
--------------------------------------------------------------------------------

begin

-- This process generates w and then derives dw (FIPS PUB 197 EQINVCIPHER()) where dw replaces w. This is combinational so changing 
-- key_in should allow for calculation of new keys.

    process(key_in)
        variable w : round_key_type;
        variable dw : round_key_type;
        variable temp : std_logic_vector(31 downto 0);
    begin

-- Seeds the first for words of 4 from the 128-bit input key. 

        w(0) := key_in(127 downto 96); 	-- {K0, K1, K2, K3}	
        w(1) := key_in(95 downto 64);	-- {K4, K5, K6, K7}
        w(2) := key_in(63 downto 32); 	-- {K8, K9, Ka, Kb}
        w(3) := key_in(31 downto 0);	-- {Kc, Kd, Ke, Kf}

-- This is the key expansion for w(4) to w(43). 

        for i in 4 to 43 loop
            temp := w(i - 1);

            if (i mod 4) = 0 then
                temp := rot_word(temp);
                temp := sub_word(temp);
                temp(31 downto 24) := temp(31 downto 24) xor RCON((i / 4) - 1);
            end if;

            w(i) := w(i - 4) xor temp;
        end loop;

-- These are the dw for the Equivalent Inverse Cipher. 
-- The first and last round keys are the same in dw and w here
-- Stores the first 4 words and the last 4 words for decryption-specific key expansion

        dw(0)  := w(0);
        dw(1)  := w(1);
        dw(2)  := w(2);
        dw(3)  := w(3);
        dw(40) := w(40);
        dw(41) := w(41);
        dw(42) := w(42);
        dw(43) := w(43);

-- Applies inverse MixColumns to the remaining round keys (for decryption)
-- for internal rounds 1..9, apply InvMixColumns to each round key to produce dw. 
-- The round keys are pre-mixed to keep the one matrix per round structure.

        for round in 1 to 9 loop
            for i in 0 to 3 loop
                dw(round * 4 + i) := inv_mix_column_word(w(round * 4 + i));
            end loop;
        end loop;

        eic_keys <= dw; -- Outputs the expanded round keys for decryption
    end process;

end Behavioral;
