-----------------------------------------------------------------------------------------------------
-- Author: SecureVision Team 14
-- Updated port names for better labeling
-- Testbench: SHA-256 "a"*60
-- This length tests the SHA-256 two-block padding
-- NOTE: The wrapper compares against EXPECTED_HASH_C for a*80
-- so hash_pass_o will be 0 and hash_fail_o will be 1 even when hash_out is correct.
-- Change the hash in the wrapper before testing
---------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_sha256_gv_a60 is
end entity;

architecture sim of tb_sha256_gv_a60 is
  constant CLK_PERIOD : time := 10 ns;

  signal clk : std_logic := '0';
  signal rst : std_logic := '1';

  signal start_msg         : std_logic := '0';
  signal message_len_bytes : unsigned(31 downto 0) := (others => '0');

 
  signal sha_aes_pt_block_valid : std_logic := '0';
  signal sha_aes_pt_block_in   : std_logic_vector(127 downto 0) := (others => '0');
  signal sha_aes_pt_block_ready : std_logic;

  -- Wrapper outputs
  signal hash_out   : std_logic_vector(255 downto 0);
  signal hash_valid : std_logic;
  signal hash_pass_o     : std_logic;
  signal hash_fail_o     : std_logic;
  signal hash_error_o    : std_logic;

  -- SHA-256 digest for 60 bytes of a
  constant EXPECTED_HASH_60 : std_logic_vector(255 downto 0) :=
    x"11EE391211C6256460B6ED375957FADD8061CAFBB31DAF967DB875AEBD5AAAD4";

  -- 16 bytes of a (0x61), this will be fed through using a loop
  constant A_BLOCK_16B : std_logic_vector(127 downto 0) :=
    x"61616161616161616161616161616161";

-- last input, mimics aes output
  constant A_BLOCK_LAST_12B : std_logic_vector(127 downto 0) :=
    x"61616161616161616161616100000000";

begin
  clk <= not clk after CLK_PERIOD/2;

  dut : entity work.sha256_gv_aes_stream_wrapper_const
    port map (
      clk => clk,
      rst => rst,
      start_msg => start_msg,
      message_len_bytes => message_len_bytes,
      sha_aes_pt_block_valid => sha_aes_pt_block_valid,
      sha_aes_pt_block_in => sha_aes_pt_block_in,
      sha_aes_pt_block_ready => sha_aes_pt_block_ready,
      hash_out => hash_out,
      hash_valid => hash_valid,
      hash_pass_o => hash_pass_o,
      hash_fail_o => hash_fail_o,
      hash_error_o => hash_error_o 
    );

  stim : process
    procedure pulse_start is
    begin
      start_msg <= '1';
      wait until rising_edge(clk);
      start_msg <= '0';
    end procedure;

    -- Uses the wrapper's ready/valid handshake:
    procedure send_block(block128 : std_logic_vector(127 downto 0)) is
    begin
      while sha_aes_pt_block_ready /= '1' loop
        wait until rising_edge(clk);
      end loop;

      sha_aes_pt_block_in    <= block128;
      sha_aes_pt_block_valid <= '1';
      wait until rising_edge(clk);
      sha_aes_pt_block_valid <= '0';
      wait until rising_edge(clk);
    end procedure;

  begin
    -- Reset
    rst <= '1';
    wait for 10*CLK_PERIOD;
    wait until rising_edge(clk);
    rst <= '0';
    wait until rising_edge(clk);

    -- Starts hashing a 60-byte message
    message_len_bytes <= to_unsigned(60, 32);
    pulse_start;

    -- Sends 60 bytes as 128-bit blocks:
    for i in 0 to 2 loop
      send_block(A_BLOCK_16B);
    end loop;
    send_block(A_BLOCK_LAST_12B);

    -- Waits for digest
    while hash_valid /= '1' loop
      wait until rising_edge(clk);
    end loop;

    -- Core should not error
    assert hash_error_o = '0' report "FAIL: hash_error_o asserted" severity failure;

    -- Prints hash
    report "Computed hash = " & to_hstring(hash_out) severity note;
    report "Expected hash = " & to_hstring(EXPECTED_HASH_60) severity note;

    -- Verifies hash matches expected 
    assert hash_out = EXPECTED_HASH_60
      report "FAIL: hash mismatch"
      severity failure;

    report "PASS: hash_out matches SHA-256('a'*60)" severity note;

    
    if hash_pass_o = '1' then
      report "NOTE: hash_pass_o=1" severity note;
    elsif hash_fail_o = '1' then
      report "NOTE: hash_fail_o = 1" severity note;
    else
      report "NOTE: neither hash_pass_o nor hash_fail_o asserted" severity note;
    end if;

    wait;
  end process;

end architecture;