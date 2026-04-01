----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Daniella Li Calzi
-- 
-- Create Date: 02/03/2026 05:29:18 PM
-- Design Name: 
-- Module Name: TRNG - Behavioral
-- Project Name: SecureVision
-- Target Devices: Zybo Z7-20
-- Tool Versions: Viviado 2020.2
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- Output of the last inverter feeds back to the first through an enable gate.
--
-- One ring oscillator grouping
-- AND LUT output goes to inverter 0 input
--inverter i output goes to inverter i+1 input
--last inverter output feeds back into AND LUT input
--AND LUT second input is the enable
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;
use IEEE.std_logic_misc.all;

entity TRNG is
  Port (
    clk : in std_logic;
    reset : in std_logic;
    clk_enable : in std_logic;
    trng_mask_out : out std_logic_vector (127 downto 0)
    );
end TRNG;


architecture Behavioral of TRNG is
    constant numInverters : integer := 9; --Number of inverters per Ring Oscillator 
    constant numRingOsc : integer := 16; --Total number of Ring Oscillators 
    
    signal enable : std_logic; -- signal for AND gate LUT
    
    signal ring_out_vec : std_logic_vector(numRingOsc - 1 downto 0);
    signal ranNum_reg : std_logic_vector(127 downto 0) := (others => '0');

begin

enable <= clk_enable;

    process(clk)
        variable raw_bit : std_logic;
    begin
    
        if rising_edge(clk) then
           if reset = '1' then
                ranNum_reg <= (others => '0');
           elsif clk_enable = '1' then
                raw_bit := xor_reduce(ring_out_vec);
                ranNum_reg <= ranNum_reg(126 downto 0) & raw_bit;
           end if;
        end if;
    end process;

    trng_mask_out <= ranNum_reg;
    
-- Generate ring oscillators in generate
gen_ringosc : for r in 0 to numRingOsc - 1 generate
    signal node : std_logic_vector(numInverters downto 0);
    
    
    begin

  --LUT: 6-input Look-Up Table as AND gate
        LUT6_AND_inst : LUT6
        generic map(
            INIT => x"8888888888888888")
        port map (
            O => node(0),  -- I0 and I1
            I0 => node(numInverters),   -- Signal input from previous inverter
            I1 => enable,   -- LUT enable input
            I2 => '0',   -- LUT input
            I3 => '0',   -- LUT input
            I4 => '0',   -- LUT input
            I5 => '0'   -- LUT input
        );
    
        
    -- Generate inverters in series
    gen_inverters : for i in 0 to numInverters - 1 generate 
        begin
        
        --LUT: 6-input Look-Up Table with inverted output/ this is basically just one inverter
        LUT6_NOT_inst : LUT6
        generic map(
            INIT => x"5555555555555555") --Whatever boolean value thats input from I0 => output is the opposite
        port map (
            O => node(i+1),  -- LUT inverted output (O = NOT(I0))
            I0 => node(i),   -- Signal input from previous inverter
            I1 => '0',   -- LUT input
            I2 => '0',   -- LUT input
            I3 => '0',   -- LUT input
            I4 => '0',   -- LUT input
            I5 => '0'   -- LUT input
        );
    
    end generate;
    ring_out_vec(r) <= node(numInverters);
    
end generate;

end Behavioral;

