----------------------------------------------------------------------------------
-- Engineer: Daniella Li Calzi
-- 
-- Create Date: 10/17/2025 12:50:22 AM
-- Module Name: aes_decrypt_controller - Behavioral
-- Project Name: SecureVISION 
-- Target Devices: Zybo Z7-020
-- Tool Versions: Vivado 2020.2
-- Description: top-level AES controller
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.02 - File updated 12/16
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.aes_package.all;

entity aes_decrypt_controller is
    Port (
        clk  : in  STD_LOGIC;
        reset : in STD_LOGIC; --active high

	--Control/Flags
        start : in  STD_LOGIC;
        key_ready : in STD_LOGIC;
        ciphertext_ready : in STD_LOGIC;
        aes_decrypt_done : out STD_LOGIC;

        key_in : in std_logic_vector(127 downto 0);

	-- Text input and output
        ciphertext_in  : in  STD_LOGIC_VECTOR(127 downto 0); --ciphertext
        plaintext_out  : out STD_LOGIC_VECTOR(127 downto 0); --plaintext
        byte_reg_value : out STD_LOGIC_VECTOR(127 downto 0)
    );
end aes_decrypt_controller;

architecture Behavioral of aes_decrypt_controller is

    type state_type is (idle, key_expand, init, rounds, final, complete);
    signal current_state, next_state : state_type;

    signal rounds_counter : integer range 0 to 10;

     -- State as bytes (4x4), updated from byte_reg and byte_next to state_reg and state_next to store state as a 4x4 byte array
    signal state_reg  : block_state_type;
    signal state_next : block_state_type;

    -- EIC key schedule words (dw[0..43])
    signal eic_keys    : round_key_type;
    signal round_keys  : round_key_128_array; -- changed round key to round keys to prevent a conflict

    -- Selected 128-bit round key, added this for explicit selected key
    signal round_key_sel : std_logic_vector(127 downto 0);

    -- EqInvCipher datapath signals
    signal sb_out        : block_state_type;               -- InvSubBytes output
    signal sr_out        : block_state_type;               -- InvShiftRows output
    signal mix_out_vec   : std_logic_vector(127 downto 0); -- InvMixColumns output (vector)
    signal mix_out_arr   : block_state_type;               -- InvMixColumns output (array) 

    signal ark_in_state  : block_state_type;              -- muxed input to AddRoundKey
    signal ark_out       : block_state_type;              -- AddRoundKey output

begin

    -- instantiates aes_key_expansion
    inst_key_expand : entity work.aes_key_expansion_eic
        port map (
            key_in   => key_in,
            eic_keys => eic_keys
        );

    round_keys <= separate_round_keys(eic_keys); -- moved, renamed to round keys instead of round key

    -- Selects round key explicitly (depends on state)
    round_key_sel <= round_keys(10) when current_state = init else
                     round_keys(0)  when current_state = final else
                     round_keys(rounds_counter);

    -- Signals for InvSubBytes
    inst_InvSubBytes : entity work.InvSubBytes
        port map (
            sb_in  => state_reg, -- changed to state_reg from sr_out
            sb_out => sb_out
        );

    -- Signals for InvShiftRows
    inst_InvShiftRows : entity work.InvShiftRows
        port map (
            sr_in  => unpack_state_array(sb_out),   -- vector in, changed from byte_reg, feeds output of sb
            sr_out => sr_out                        -- array out
        );

    -- Signals for InvMixColumns
    inst_InvMixColumns : entity work.InvMixColumns  -- Feeds in output of InvShiftRows
        port map (
            mxc_in  => unpack_state_array(sr_out),
            mxc_out => mix_out_vec
        );

    mix_out_arr <= pack_state_array(mix_out_vec); 

    -- AddRoundKey input mux
    -- init:  state_reg (ciphertext) XOR with key10
    -- rounds: InvMixColumns output XOR with key[round]
    -- final: InvShiftRows output XOR with key0   (no InvMixColumns in last round)

    ark_in_state <= state_reg    when current_state = init   else
                    sr_out       when current_state = final  else
                    mix_out_arr; -- rounds

    -- Signals for add round key
    inst_AddRoundKey : entity work.AddRoundKey
        port map (
            init_state_bytes => ark_in_state,
            round_key_128    => round_key_sel,
            next_state_bytes => ark_out
        );

     -- Outputs, removed from FSM and moved here
    byte_reg_value <= unpack_state_array(state_reg);
    plaintext_out  <= unpack_state_array(state_reg);

    -- State Register, changed logic slightly
    process(clk, reset)
    begin
        if reset = '1' then
            current_state  <= idle;
            state_reg      <= (others => (others => '0')); -- byte reg replaced with state_reg, byte next removed
            rounds_counter <= 0;

        elsif rising_edge(clk) then
            current_state <= next_state; 
            state_reg     <= state_next; -- byte reg and byte next replaced with state reg and state next

            if current_state = init then -- Old set to 9 when current_state = idle, new set to 9 when current state = init
                rounds_counter <= 9;
            elsif current_state = rounds then
                rounds_counter <= rounds_counter - 1;
            else
                rounds_counter <= rounds_counter;
            end if;
        end if;
    end process;

    -- FSM for entire AES Decryption
    process(current_state, start, key_ready, ciphertext_ready,
            rounds_counter, ciphertext_in, state_reg, ark_out)
    begin
        next_state <= current_state;
        state_next <= state_reg;
        aes_decrypt_done <= '0';
	-- removed addrk_out

        case current_state is

            when idle =>
	        -- waits for start signal
                if start = '1' and ciphertext_ready = '1' then
	            --loads ciphertext in
                    state_next <= pack_state_array(ciphertext_in); -- changed from byte_next to state_next, sends ciphertext_in to my package function to be sliced
                    next_state <= key_expand;
                end if;

            when key_expand =>
	    -- Round key seperation moved out, byte_reg_value no longer assigned 
                if key_ready = '1' then
                    next_state <= init;
                end if;

            when init =>
                -- Take ciphertext state and XOR with the last round key
                state_next <= ark_out;  -- changed from byte_next <= byte_reg XOR round_key(10), manual XOR output replaced by ark_out
                next_state <= rounds;

            when rounds =>

                -- InvShiftRows > InvSubBytes > AddRoundKey(round_key(round)) > InvMixColumns
                -- uses round keys 9 down to 1

                state_next <= ark_out;

                if rounds_counter = 1 then
                    next_state <= final;
                end if;

            when final =>

                state_next <= ark_out; -- changed from byte_next <= unpack_state_array(sb_out) XOR round_key(0)
                next_state <= complete;

	    -- removed plaintext_out <= byte_reg
            when complete =>
                aes_decrypt_done <= '1';
                if start = '0' then
                    next_state <= idle;
                end if;

        end case;
    end process;

end Behavioral;
