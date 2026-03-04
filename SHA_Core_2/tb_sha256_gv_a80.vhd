--------------------------------------------------------------------------------------------------------------------------------------
-- Testbench: hashes 80 bytes of ASCII 'a' using 128-bit block input
-- checks wrapper pass/fail and prints the digest.
-- tb_sha256_gv_a80.vhd:119:5:@1525ns:(report note): Computed hash = 0F45E858FBC4176CDF4E411F88281EDEFC390AE5AFE7DF0F44CD9297F0A64580
-- tb_sha256_gv_a80.vhd:120:5:@1525ns:(report note): Expected hash = 0F45E858FBC4176CDF4E411F88281EDEFC390AE5AFE7DF0F44CD9297F0A64580
-- tb_sha256_gv_a80.vhd:124:7:@1525ns:(report note): PASS: pass_o=1 (wrapper compare matched expected)
--------------------------------------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_sha256_gv_a80 is
end entity;

architecture sim of tb_sha256_gv_a80 is
  constant CLK_PERIOD : time := 10 ns;

  -- Clock/reset
  signal clk : std_logic := '0';
  signal rst : std_logic := '1';

  -- Wrapper control inputs
  signal start_msg         : std_logic := '0';	-- 1-cycle start pulse
  signal message_len_bytes : unsigned(31 downto 0) := (others => '0'); -- total message length in bytes

  -- Meant to mimic aes handshake, 128-bit block streaming interface into wrapper
  signal pt_block_valid : std_logic := '0';
  signal pt_block_in    : std_logic_vector(127 downto 0) := (others => '0');
  signal pt_block_ready : std_logic;

  -- Wrapper outputs
  signal hash_out   : std_logic_vector(255 downto 0);  -- computed digest
  signal hash_valid : std_logic;		       -- digest valid from core
  signal pass_o     : std_logic;		       -- wrapper compare matched EXPECTED_HASH_C
  signal fail_o     : std_logic;		       -- wrapper compare mismatch
  signal error_o    : std_logic;		       -- forwarded core error

-- Expected digest for "a" * 80 matches wrapper's EXPECTED_HASH_C
-- This is compared seperately from the comparason in the wrapper
-- This prints the hash for testing, the wrapper just sets pass or fail

  constant EXPECTED_HASH : std_logic_vector(255 downto 0) :=
    x"0F45E858FBC4176CDF4E411F88281EDEFC390AE5AFE7DF0F44CD9297F0A64580";

 -- One 128-bit block containing sixteen ASCII 'a' bytes. I have this loop to input the a's
  constant A_BLOCK_16B : std_logic_vector(127 downto 0) :=
    x"61616161616161616161616161616161";

begin
  clk <= not clk after CLK_PERIOD/2;

  dut : entity work.sha256_gv_aes_stream_wrapper_const
    port map (
      clk => clk,
      rst => rst,
      start_msg => start_msg,
      message_len_bytes => message_len_bytes,
      pt_block_valid => pt_block_valid,
      pt_block_in => pt_block_in,
      pt_block_ready => pt_block_ready,
      hash_out => hash_out,
      hash_valid => hash_valid,
      pass_o => pass_o,
      fail_o => fail_o,
      error_o => error_o
    );

  stim : process
    -- Pulse start_msg for 1 clock cycle
    procedure pulse_start is
    begin
      start_msg <= '1';
      wait until rising_edge(clk);
      start_msg <= '0';
    end procedure;

    -- Send one 128-bit plaintext block using the wrapper's valid/ready handshake
    -- Wait until pt_block_ready=1, then present pt_block_in and pulse pt_block_valid for 1 cycle.

    procedure send_block(block128 : std_logic_vector(127 downto 0)) is
    begin
      
      while pt_block_ready /= '1' loop
        wait until rising_edge(clk);
      end loop;
      
      -- Present block and assert valid for one clock
      pt_block_in    <= block128;
      pt_block_valid <= '1';
      wait until rising_edge(clk);
      pt_block_valid <= '0';

      wait until rising_edge(clk);
    end procedure;

  begin
    -- reset
    rst <= '1';
    wait for 10*CLK_PERIOD;
    wait until rising_edge(clk);
    rst <= '0';
    wait until rising_edge(clk);

    -- SHA-256 "a"*80 sends 5 blocks of 16 bytes
    message_len_bytes <= to_unsigned(80, 32);    -- sets expcted length to 80 bytes
    pulse_start;

    -- Send 5 x 16-byte blocks of ASCII 'a'
    for i in 0 to 4 loop
      send_block(A_BLOCK_16B);
    end loop;

    -- Wait until hash_valid 
    while hash_valid /= '1' loop
      wait until rising_edge(clk);
    end loop;


    -- checks for error output and reports the error
    assert error_o = '0' report "FAIL: error_o asserted" severity failure;

    -- prints the hashes
    report "Computed hash = " & to_hstring(hash_out) severity note;
    report "Expected hash = " & to_hstring(EXPECTED_HASH) severity note;

    -- uses wrapper outputs to print pass/fail
    if pass_o = '1' then
      report "PASS: pass_o=1 (wrapper compare matched expected)" severity note;
    elsif fail_o = '1' then
      report "FAIL: fail_o=1 (wrapper compare mismatch)" severity error;
      assert false report "FAIL: wrapper reported mismatch" severity failure;
    else
      report "FAIL: hash_valid=1 but neither pass_o nor fail_o asserted" severity error;
      assert false report "FAIL: pass/fail not asserted" severity failure;
    end if;

    wait;
  end process;

end architecture;