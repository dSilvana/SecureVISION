-- ============================================================================
-- Testbench: sha_256_abc_tb
-- Author: Team 14
--
-- Purpose:
--   This testbench tests the SHA by driving the SHA-256 core with a single 512-bit message block "abc" with SHA-256 padding.
--   This testbench waits for the core to finish, prints the computed digest and then checks to see if it matches the expected hash.
--   The expected hash was double checked on my computer by running a sha command on my PC.
--
-- Notes:
--   * The sha_256_core accepts:
--       - clk: clock
--       - rst: reset configured active-high via generic RESET_VALUE
--       - data_ready: 
--       - n_blocks: number of 512-bit blocks to hash. 1 Here
--       - msg_block_in: 512-bit message block input (16 words * 32 bits)
--       - finished: done flag 
--       - data_out: 256-bit digest output
--   * The padded message is provided directly so the testbench does NOT test
--     any padding/streaming wrapper logic. It only tests the core compression.
--   *The output and hash are displaying in uppercase but I believe that this is happening because it's working with hex. 
--    This should be ok for testing and we might be able to leave it for integration. The command I'm using on my computer for the comparison hash also converts the hash to uppercase. 
-- 
-- OUTPUTS:
-- sha_256_abc_tb.vhd:95:5:@2125ns:(report note): -------------------------------------------
-- sha_256_abc_tb.vhd:96:5:@2125ns:(report note): Computed hash = BA7816BF8F01CFEA414140DE5DAE2223B00361A396177A9CB410FF61F20015AD
-- sha_256_abc_tb.vhd:97:5:@2125ns:(report note): Expected hash = BA7816BF8F01CFEA414140DE5DAE2223B00361A396177A9CB410FF61F20015AD
-- sha_256_abc_tb.vhd:98:5:@2125ns:(report note): -------------------------------------------
-- sha_256_abc_tb.vhd:105:5:@2125ns:(report note): PASS: SHA-256('abc')
--
-- ============================================================================



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.sha_256_pkg.all;

entity sha_256_abc_tb is
end entity;

architecture sim of sha_256_abc_tb is

  signal clk          : std_logic := '0';
  signal rst          : std_logic := '1';
  signal data_ready   : std_logic := '0';
  signal n_blocks     : natural   := 1;
  signal msg_block_in : std_logic_vector(0 to (16*WORD_SIZE)-1) := (others => '0');
  signal finished     : std_logic;
  signal data_out     : std_logic_vector((WORD_SIZE*8)-1 downto 0);

  -- Manually padded "abc" block (512 bits)
  constant ABC_BLOCK : std_logic_vector(0 to 511) :=
    x"6162638000000000000000000000000000000000000000000000000000000000" &
    x"0000000000000000000000000000000000000000000000000000000000000018";

  -- Correct SHA-256 abc hash
  constant EXP_ABC : std_logic_vector(255 downto 0) :=
    x"BA7816BF8F01CFEA414140DE5DAE2223B00361A396177A9CB410FF61F20015AD";

begin

  
  clk <= not clk after 5 ns;

  dut: entity work.sha_256_core
    generic map(
      RESET_VALUE => '1'  -- makes reset active-high
    )
    port map(
      clk          => clk,
      rst          => rst,
      data_ready   => data_ready,
      n_blocks     => n_blocks,
      msg_block_in => msg_block_in,
      finished     => finished,
      data_out     => data_out
    );

  process
  begin
    -- Holds reset
    rst <= '1';
    wait for 100 ns;
    rst <= '0';
    wait until rising_edge(clk);

    -- Loads padded block
    n_blocks     <= 1;
    msg_block_in <= ABC_BLOCK;

    -- Pulses data_ready
    data_ready <= '1';
    wait until rising_edge(clk);
    data_ready <= '0';

    -- Wait for finished
    while finished /= '1' loop
      wait until rising_edge(clk);
    end loop;

    -- Prints actual hash
    report "-------------------------------------------" severity note;
    report "Computed hash = " & to_hstring(data_out) severity note;
    report "Expected hash = " & to_hstring(EXP_ABC) severity note;
    report "-------------------------------------------" severity note;

    -- This checks the actual result
    assert data_out = EXP_ABC
      report "FAIL: SHA-256('abc') mismatch"
      severity failure;

    report "PASS: SHA-256('abc')" severity note;

    wait;
  end process;

end architecture;
