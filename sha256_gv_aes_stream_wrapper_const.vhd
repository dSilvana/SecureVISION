---------------------------------------------------------------------------------------------------------------------------
-- This wraper is an adapter meant to take 128 bit plaintext blocks and feed them into the open source core
--
-- Added:
--	- Converting from 128 bit blocks to 32 bit words
--      - Comparing against EXPECTED_HASH_C
--      - Handshake from AES to SHA (not implemented just set up groundwork)
--	- Outputting the hash
-- Updated:
--	- Port names
------------------------------ COPYRIGHT NOTICE -----------------------------------------------------------------------
--                                                                   
--      This file is part of the SHA256 HASH CORE project http://opencores.org/project,sha256_hash_core
--                                                                   
--      Author(s):      Jonny Doin, jdoin@opencores.org, jonnydoin@gridvortex.com, jonnydoin@gmail.com
--                                                                   
--      Copyright (C) 2016 Jonny Doin
--      -----------------------------
--                                                                   
--      This source file may be used and distributed without restriction provided that this copyright statement is not    
--      removed from the file and that any derivative work contains the original copyright notice and the associated 
--      disclaimer. 
--                                                                   
--      This source file is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser 
--      General Public License as published by the Free Software Foundation; either version 2.1 of the License, or 
--      (at your option) any later version.
--                                                                   
--      This source is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
--      warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more  
--      details.
--
---------------------------------------------------------------------------------------------------------------------------



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sha256_gv_aes_stream_wrapper_const is
  port (
    clk   : in  std_logic;  -- Input system clock
    rst   : in  std_logic;  -- active-high reset

    start_msg         : in  std_logic;                 -- 1-cycle pulse: begin hashing a new message
    --message_len_bytes : in  unsigned(31 downto 0);     -- message_len_bytes is the exact plaintext length in bytes, used to tell gv_end_i this is the last word of the message
						       -- and used to tell gv_bites_i how many bytes in the last 32 bit word are real

-- Incoming plaintext stream in 128 bit blocks, this is for handshaking with AES. Not implemented.

    sha_aes_pt_block_valid : in  std_logic;                    -- 1-cycle pulse when sha_aes_pt_block_in valid when there is a block inside.
    sha_aes_pt_block_in    : in  std_logic_vector(127 downto 0); -- Plaintext block in, connect to AES out
    sha_aes_pt_block_ready : out std_logic;                    -- request next 128-bit block, should tell aes when to send next block

-- wrapper outputs digest + pass/fail
    --hash_out    : out std_logic_vector(255 downto 0);  -- outputs the hash
    hash_valid  : out std_logic;                       -- 1 when hash_out/pass/fail are valid
    hash_pass_o      : out std_logic;		       -- outputs pass flag 1
    hash_fail_o      : out std_logic; 		       -- outputs fail flag 1

    -- Forwarded error from the GV core
    hash_error_o     : out std_logic
  );
end entity;

architecture rtl of sha256_gv_aes_stream_wrapper_const is

  -- PLACEHOLDER HASH HARDCODE this is the digest we expect for authentication
  constant EXPECTED_HASH_C : std_logic_vector(255 downto 0) :=
    x"00154035781E0D09A104712E20F0F3D1AD9131BEFB0707EE2E4C154B7D327947";
    
  constant message_len_bytes : unsigned(31 downto 0) := to_unsigned(7172661, 32);
  
  -- gv_sha256 ports
  -- CORE-REQUIRED: These signals exist ONLY because gv_sha256 has these ports.
  -- CORE-REQUIRED: gv_sha256 input is a 32-bit word stream with a handshake.

  signal gv_di_i      : std_logic_vector(31 downto 0);
  signal gv_bytes_i   : std_logic_vector(1 downto 0);
  signal gv_start_i   : std_logic;
  signal gv_end_i     : std_logic;
  signal gv_di_req_o  : std_logic;
  signal gv_di_wr_i   : std_logic;
  signal gv_do_valid  : std_logic;
  signal gv_err       : std_logic;

  -- Core outputs digest as 8 separate 32-bit word
  signal H0, H1, H2, H3, H4, H5, H6, H7 : std_logic_vector(31 downto 0);
  signal digest_256 : std_logic_vector(255 downto 0);

  
  type st_t is (ST_IDLE, ST_WAIT_BLOCK, ST_SEND_WORDS, ST_WAIT_HASH);
  signal st : st_t := ST_IDLE;

-- Message length tracking, how many real bytes still left to send
  signal remaining_bytes : unsigned(31 downto 0) := (others => '0');

  -- Store the current 128-bit plaintext block here
  signal cur_block : std_logic_vector(127 downto 0) := (others => '0');

  -- Tracking for current block
  signal cur_block_bytes : integer := 0;  -- how many bytes in this block are real (0..16)
  signal words_to_send_i : integer := 0;  -- how many 32-bit words we must send (1..4)
  signal last_word_i     : integer := 0;  -- last word index (0..3)
  signal word_index_i    : integer := 0;  -- current word index we are sending
  signal is_last_block   : std_logic := '0';

  -- drive-one-cycle start pulse request
  signal start_pulse_req : std_logic := '0';

  -- Registered outputs held stable until next start/reset
  signal hash_valid_r : std_logic := '0';
  --signal hash_out_r   : std_logic_vector(255 downto 0) := (others => '0');
  signal pass_r       : std_logic := '0';
  signal fail_r       : std_logic := '0';

  --signal message_len_bytes :  unsigned(31 downto 0);
  -- helper to pick a 32-bit word out of a 128-bit block
  -- selects a 32-bit word from a 128-bit block 
  -- this assumes big-endian word order (word0 = top 32 bits)

  function sel_word(block128 : std_logic_vector(127 downto 0); idx : integer)
    return std_logic_vector is
  begin
    case idx is
      when 0 => return block128(127 downto 96);
      when 1 => return block128(95  downto 64);
      when 2 => return block128(63  downto 32);
      when others => return block128(31 downto 0);
    end case;
  end function;

 -- 2-bit code telling how many bytes are valid in the FINAL 32-bit word of the message.
 -- bytes_i encoding used by GV core on the FINAL word only

  function enc_bytes_i(valid_bytes_in_last_word : integer) return std_logic_vector is
  begin
    case valid_bytes_in_last_word is
      when 1 => return "01";
      when 2 => return "10";
      when 3 => return "11";
      when others => return "00"; -- 4 bytes
    end case;
  end function;

begin

-- Concatinates the 8 words together into 256 bits
  digest_256 <= H0 & H1 & H2 & H3 & H4 & H5 & H6 & H7;

  -- drive outputs from registered signals
  --hash_out   <= hash_out_r;
  hash_valid <= hash_valid_r;
  hash_pass_o     <= pass_r;
  hash_fail_o    <= fail_r;

  -- Instantiates gv_sha256
  u_gv : entity work.gv_sha256
    port map (
      clk_i      => clk,
      ce_i       => '1',
      di_i       => gv_di_i,
      bytes_i    => gv_bytes_i,
      start_i    => gv_start_i,
      end_i      => gv_end_i,
      di_req_o   => gv_di_req_o,
      di_wr_i    => gv_di_wr_i,
      hash_error_o     => gv_err,
      do_valid_o => gv_do_valid,
      H0_o       => H0,
      H1_o       => H1,
      H2_o       => H2,
      H3_o       => H3,
      H4_o       => H4,
      H5_o       => H5,
      H6_o       => H6,
      H7_o       => H7
    );
 -- exposes the core error
  hash_error_o <= gv_err;

  -- Core handshake
  -- Only send a word when the core asks (gv_di_req_o = '1')

  comb_out : process(all)
    variable mod4_int : integer;
    variable last_word_valid_bytes : integer;
  begin
    -- defaults
    sha_aes_pt_block_ready <= '0';

    -- defaults for core inputs
    gv_start_i  <= start_pulse_req;
    gv_di_wr_i  <= '0';
    gv_di_i     <= (others => '0');
    gv_end_i    <= '0';
    gv_bytes_i  <= "00";

    case st is
      when ST_WAIT_BLOCK =>
        sha_aes_pt_block_ready <= '1';

      when ST_SEND_WORDS =>
        if gv_di_req_o = '1' then
          gv_di_i    <= sel_word(cur_block, word_index_i);
          gv_di_wr_i <= '1';

          -- if this is the final word of entire message assert end + bytes_i in SAME accepted-word cycle
          if (is_last_block = '1') and (word_index_i = last_word_i) then
            gv_end_i <= '1';

	  -- computes how many bytes are valid in the last word
            mod4_int := cur_block_bytes mod 4;
            if mod4_int = 0 then
              last_word_valid_bytes := 4;
            else
              last_word_valid_bytes := mod4_int;
            end if;

            gv_bytes_i <= enc_bytes_i(last_word_valid_bytes);
          end if;
        end if;

      when others =>
        null;
    end case;
  end process;


  -- SEQUENTIAL STATE / REGISTERS

  seq : process(clk)
    variable rem_int  : integer;
    variable take_int : integer;
    variable wts      : integer;
  begin
    if rising_edge(clk) then
      if rst = '1' then
        st <= ST_IDLE;

        remaining_bytes <= (others => '0');
        cur_block <= (others => '0');

        cur_block_bytes <= 0;
        words_to_send_i <= 0;
        last_word_i <= 0;
        word_index_i <= 0;
        is_last_block <= '0';

        start_pulse_req <= '0';

        hash_valid_r <= '0';
        --hash_out_r   <= (others => '0');
        pass_r       <= '0';
        fail_r       <= '0';

      else
        -- clear start pulse request after one cycle
        start_pulse_req <= '0';

        case st is
          when ST_IDLE =>
            if start_msg = '1' then
              -- Clear previous result + kick gv_start
              hash_valid_r <= '0';
              pass_r       <= '0';
              fail_r       <= '0';

              remaining_bytes <= message_len_bytes;
              start_pulse_req <= '1';      -- 1-cycle pulse (registered)
              st <= ST_WAIT_BLOCK;
            end if;

          when ST_WAIT_BLOCK =>
            if sha_aes_pt_block_valid = '1' then
              cur_block <= sha_aes_pt_block_in;

              rem_int := to_integer(remaining_bytes);
              if rem_int > 16 then
                take_int := 16;
              else
                take_int := rem_int;
              end if;

              cur_block_bytes <= take_int;

              if rem_int <= 16 then
                is_last_block <= '1';
              else
                is_last_block <= '0';
              end if;

              remaining_bytes <= to_unsigned(rem_int - take_int, 32);

              -- words_to_send = ceil(take_int/4)
              wts := (take_int + 3) / 4;
              if wts < 1 then wts := 1; end if;
              if wts > 4 then wts := 4; end if;

              words_to_send_i <= wts;
              last_word_i     <= wts - 1;
              word_index_i    <= 0;

              st <= ST_SEND_WORDS;
            end if;

          when ST_SEND_WORDS =>
            -- advance word index only when we actually write a word
            if gv_di_req_o = '1' then
              if word_index_i = last_word_i then
                if is_last_block = '1' then
                  st <= ST_WAIT_HASH;
                else
                  st <= ST_WAIT_BLOCK;
                end if;
              else
                word_index_i <= word_index_i + 1;
              end if;
            end if;

          when ST_WAIT_HASH =>
            -- LATCH RESULT ONCE and HOLD IT
            if gv_do_valid = '1' then
              --hash_out_r   <= digest_256;
              hash_valid_r <= '1';

              if digest_256 = EXPECTED_HASH_C then
                pass_r <= '1';
                fail_r <= '0';
              else
                pass_r <= '0';
                fail_r <= '1';
              end if;

              st <= ST_IDLE;
            end if;

          when others =>
            st <= ST_IDLE;
        end case;
      end if;
    end if;
  end process;

end architecture;