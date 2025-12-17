-- ============================================================================
-- FILE: aes_package.vhd
-- TITLE: AES-128 Shared Package (Types, S-Boxes, GF(2^8) Math Utilities)
-- PROJECT: SecureVISION – Secure AES Hardware Cryptography
-- AUTHOR: SecureVISION Project Team (Self-Implemented)
-- DATE: November 2025
--
-- DESCRIPTION:
--   Shared package file containing AES-specific data types, utility functions,
--   and lookup tables used by both the key expansion and inverse cipher:
--
-- 	Type definitions:
--              state_type (16 bytes arranged as a 4×4 AES state matrix)
--              round_key_type (44 × 32-bit round key words)
--
--       Constants:
--              SBOX      (AES SubBytes lookup table)
--              INV_SBOX  (AES Inverse SubBytes lookup table)
--
--        Functions:
--         	xtime()      — multiplies by 2 in GF(2^8)
--              gf_mult()    — full GF(2^8) multiply used by MixColumns logic
--
-- This is a package with the SBOXes and Helper Functions used by inverse cipher, key schedule, and mix columns.
-- This package was created so that all of the fiddly bits of code were in one place.
-- Other files can use this package by putting work.aes_package.all at the top.
-- Contains: Common types for the AES state and the round keys, the S-Box and Inverse S-Box as ROM look up tables, and the two finute filed functions used in mix columns: 
-- xtime which multiplies a byte by 2, and gf_mult which multiplies a byte by any 8-bit constant.
--
-- SELF-IMPLEMENTATION / PROVENANCE:
--   All lookup tables and arithmetic operations implemented directly from
--   FIPS-197 Appendix A (S-box tables) and Appendix B (GF multiplication).
--   No third-party or vendor-encrypted IP cores used.
--
-- COMPATIBILITY / VALIDATION:
-- Matches NIST S-Box and Inverse S-Box exactly
--
-- ============================================================================


-- Library headers. These should be allowed as they are not aes specific libraries.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Package declaration: contains types, constants, and function names.
-- This is where the variables are declared

package aes_package is 

    type block_state_type is array(0 to 15) of std_logic_vector(7 downto 0); 		-- AES block state: 16 bytes (4x4 byte matrix), each byte stored separately.
    type round_key_type is array(0 to 43) of std_logic_vector(31 downto 0); 	-- This stores all of the expanded round keys. 44 because 44 = 32 bits. Gets filled by key expansion. This is four words x (Nr + 1), NR = 10
    type round_key_128_array is array (0 to 10) of std_logic_vector(127 downto 0); 
    
    type sbox_type is array(0 to 255) of std_logic_vector(7 downto 0); 		-- Defines a new data type that is an array of 256 elements for the sbox. Each element is an 8 bit, 1 byte vector so every index in this array holds an 8-bit output
    type inv_sbox_type is array(0 to 255) of std_logic_vector(7 downto 0);	-- Defines a new data type that is an array of 256 elements for the inverse sbox. Each element is an 8 bit, 1 byte vector so every index in this array holds an 8-bit output


-- 16 x 16 sbox grids. Should be complient with fips pub 197 tables 4 for SBOX() and 6 for INVSBOX()
-- Creates global constants named SBOX and INV_SBOX

    constant SBOX : sbox_type := (												-- Used for encryption
        x"63", x"7c", x"77", x"7b", x"f2", x"6b", x"6f", x"c5", x"30", x"01", x"67", x"2b", x"fe", x"d7", x"ab", x"76",
        x"ca", x"82", x"c9", x"7d", x"fa", x"59", x"47", x"f0", x"ad", x"d4", x"a2", x"af", x"9c", x"a4", x"72", x"c0",
        x"b7", x"fd", x"93", x"26", x"36", x"3f", x"f7", x"cc", x"34", x"a5", x"e5", x"f1", x"71", x"d8", x"31", x"15",
        x"04", x"c7", x"23", x"c3", x"18", x"96", x"05", x"9a", x"07", x"12", x"80", x"e2", x"eb", x"27", x"b2", x"75",
        x"09", x"83", x"2c", x"1a", x"1b", x"6e", x"5a", x"a0", x"52", x"3b", x"d6", x"b3", x"29", x"e3", x"2f", x"84",
        x"53", x"d1", x"00", x"ed", x"20", x"fc", x"b1", x"5b", x"6a", x"cb", x"be", x"39", x"4a", x"4c", x"58", x"cf",
        x"d0", x"ef", x"aa", x"fb", x"43", x"4d", x"33", x"85", x"45", x"f9", x"02", x"7f", x"50", x"3c", x"9f", x"a8",
        x"51", x"a3", x"40", x"8f", x"92", x"9d", x"38", x"f5", x"bc", x"b6", x"da", x"21", x"10", x"ff", x"f3", x"d2",
        x"cd", x"0c", x"13", x"ec", x"5f", x"97", x"44", x"17", x"c4", x"a7", x"7e", x"3d", x"64", x"5d", x"19", x"73",
        x"60", x"81", x"4f", x"dc", x"22", x"2a", x"90", x"88", x"46", x"ee", x"b8", x"14", x"de", x"5e", x"0b", x"db",
        x"e0", x"32", x"3a", x"0a", x"49", x"06", x"24", x"5c", x"c2", x"d3", x"ac", x"62", x"91", x"95", x"e4", x"79",
        x"e7", x"c8", x"37", x"6d", x"8d", x"d5", x"4e", x"a9", x"6c", x"56", x"f4", x"ea", x"65", x"7a", x"ae", x"08",
        x"ba", x"78", x"25", x"2e", x"1c", x"a6", x"b4", x"c6", x"e8", x"dd", x"74", x"1f", x"4b", x"bd", x"8b", x"8a",
        x"70", x"3e", x"b5", x"66", x"48", x"03", x"f6", x"0e", x"61", x"35", x"57", x"b9", x"86", x"c1", x"1d", x"9e",
        x"e1", x"f8", x"98", x"11", x"69", x"d9", x"8e", x"94", x"9b", x"1e", x"87", x"e9", x"ce", x"55", x"28", x"df",
        x"8c", x"a1", x"89", x"0d", x"bf", x"e6", x"42", x"68", x"41", x"99", x"2d", x"0f", x"b0", x"54", x"bb", x"16"
    );


    constant INV_SBOX : inv_sbox_type := (											-- Used for decryption
        x"52", x"09", x"6a", x"d5", x"30", x"36", x"a5", x"38", x"bf", x"40", x"a3", x"9e", x"81", x"f3", x"d7", x"fb",
        x"7c", x"e3", x"39", x"82", x"9b", x"2f", x"ff", x"87", x"34", x"8e", x"43", x"44", x"c4", x"de", x"e9", x"cb",
        x"54", x"7b", x"94", x"32", x"a6", x"c2", x"23", x"3d", x"ee", x"4c", x"95", x"0b", x"42", x"fa", x"c3", x"4e",
        x"08", x"2e", x"a1", x"66", x"28", x"d9", x"24", x"b2", x"76", x"5b", x"a2", x"49", x"6d", x"8b", x"d1", x"25",
        x"72", x"f8", x"f6", x"64", x"86", x"68", x"98", x"16", x"d4", x"a4", x"5c", x"cc", x"5d", x"65", x"b6", x"92",
        x"6c", x"70", x"48", x"50", x"fd", x"ed", x"b9", x"da", x"5e", x"15", x"46", x"57", x"a7", x"8d", x"9d", x"84",
        x"90", x"d8", x"ab", x"00", x"8c", x"bc", x"d3", x"0a", x"f7", x"e4", x"58", x"05", x"b8", x"b3", x"45", x"06",
        x"d0", x"2c", x"1e", x"8f", x"ca", x"3f", x"0f", x"02", x"c1", x"af", x"bd", x"03", x"01", x"13", x"8a", x"6b",
        x"3a", x"91", x"11", x"41", x"4f", x"67", x"dc", x"ea", x"97", x"f2", x"cf", x"ce", x"f0", x"b4", x"e6", x"73",
        x"96", x"ac", x"74", x"22", x"e7", x"ad", x"35", x"85", x"e2", x"f9", x"37", x"e8", x"1c", x"75", x"df", x"6e",
        x"47", x"f1", x"1a", x"71", x"1d", x"29", x"c5", x"89", x"6f", x"b7", x"62", x"0e", x"aa", x"18", x"be", x"1b",
        x"fc", x"56", x"3e", x"4b", x"c6", x"d2", x"79", x"20", x"9a", x"db", x"c0", x"fe", x"78", x"cd", x"5a", x"f4",
        x"1f", x"dd", x"a8", x"33", x"88", x"07", x"c7", x"31", x"b1", x"12", x"10", x"59", x"27", x"80", x"ec", x"5f",
        x"60", x"51", x"7f", x"a9", x"19", x"b5", x"4a", x"0d", x"2d", x"e5", x"7a", x"9f", x"93", x"c9", x"9c", x"ef",
        x"a0", x"e0", x"3b", x"4d", x"ae", x"2a", x"f5", x"b0", x"c8", x"eb", x"bb", x"3c", x"83", x"53", x"99", x"61",
        x"17", x"2b", x"04", x"7e", x"ba", x"77", x"d6", x"26", x"e1", x"69", x"14", x"63", x"55", x"21", x"0c", x"7d"
    );

    
    
    function gf_mult(a, b : std_logic_vector(7 downto 0)) return std_logic_vector;   -- full GF(2^8) multiply used by MixColumns logic
    function xtime(a : std_logic_vector(7 downto 0)) return std_logic_vector;	  -- multiplies by 2 in GF(2^8)
    function inv_mix_column_word(word_in : std_logic_vector(31 downto 0)) return std_logic_vector;
    function pack_state_array(vector : std_logic_vector(127 downto 0)) return block_state_type;
    function unpack_state_array(state_array : block_state_type) return std_logic_vector;
    function separate_round_keys(eic_keys : round_key_type) return round_key_128_array; 
    
end package aes_package;

package body aes_package is

-- contains xtime body and gf_mult body

    function xtime(a : std_logic_vector(7 downto 0)) return std_logic_vector is
        variable result : std_logic_vector(7 downto 0);
    begin
        if a(7) = '1' then						-- If MSB is set, polynomial reduction is needed (xor with 0x1B)
            result := (a(6 downto 0) & '0') xor x"1b";
        else
            result := a(6 downto 0) & '0';
        end if;
        return result;
    end function;


-- This function is used to multiply by any 8 bit value within the field. This is specified by AES FIPS PUB 197
-- Two input bytes a and b. The output is the product of these two bytes within GF(2^8).
-- This is used for mix columns operations

    function gf_mult(a, b : std_logic_vector(7 downto 0)) return std_logic_vector is
        variable result : std_logic_vector(7 downto 0);
        variable temp : std_logic_vector(7 downto 0);
    begin
        result := x"00";
        temp := a;
        for i in 0 to 7 loop				-- Multiply a by each bit of b
            if b(i) = '1' then
                result := result xor temp;
            end if;
            temp := xtime(temp);
        end loop;
        return result;
    end function;

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


    --unpacks 16 bytes array into a 128 bit vector
    function unpack_state_array(state_array : block_state_type) return std_logic_vector is
        variable vector : std_logic_vector(127 downto 0);
    begin
        for i in 0 to 15 loop
            vector(127 - 8*i downto 120 - 8*i) := state_array(i);
        end loop;
        return vector;
    end function;

    -- converts vector into array of 16 bytes
    function pack_state_array(vector : std_logic_vector(127 downto 0)) return block_state_type is
        variable state_array : block_state_type;
    begin
        for i in 0 to 15 loop
            state_array(i) := vector(127 - 8*i downto 120 - 8*i);
        end loop;
        return state_array;
    end function; 


    -- converts eic_keys words into 11 ( 128 bit round keys )
    function separate_round_keys(eic_keys : round_key_type) return round_key_128_array is
        variable round_key : round_key_128_array;
    begin 
        for i in 0 to 10 loop
            round_key(i) := eic_keys(i*4) & eic_keys((i*4)+ 1) & eic_keys((i*4)+ 2) & eic_keys((i*4)+ 3);
        end loop;
            return round_key;
        end function;
        

end package body aes_package;
