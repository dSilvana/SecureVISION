----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/09/2025 03:38:15 PM
-- Design Name: 
-- Module Name: top_xadc_source - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top_Glitch_Detection is
  Port ( clk : in std_logic; -- board clock
        vauxp0 : in std_logic; -- JA board pin N16
        vauxn0 : in std_logic -- JA board pin N15
        alarm : out std_logic --LED pin for glitch alarm
        );
end Top_Glitch_Detection;

architecture Behavioral of Top_Glitch_Detection is
    signal dclk_in : std_logic; -- The clock for the DRP interface
    signal den_in : std_logic; --this gets set to 1 to activate the actual DRP (Dynamic Reconfiguration Enable)
    signal dwe_in : std_logic; -- Dynamic Reconfiguration Write Enable selects write operations
    signal daddr_in : std_logic_vector(6 downto 0); --Dynamic Reconfiguration Address specifies the register to access.
    signal di_in : std_logic_vector(15 downto 0); --Data Input - data to be written.
    signal do_out : std_logic_vector(15 downto 0); --data output-data read from register
    signal drdy_out : std_logic; --Data Ready - Indicates data is valid or write is complete
    
    
    signal normal_voltage : unsigned(11 downto 0); --stores/hold voltage ADC value from status register
    signal over_voltage : std_logic := '0';
    signal under_voltage : std_logic := '0';


begin

    xadc_instance : entity work.xadc_wiz_0
    port map (dclk_in => dclk_in,
              daddr_in => daddr_in,
              den_in => den_in,
              di_in => di_in,
              dwe_in => dwe_in,
              do_out => do_out,
              drdy_out => drdy_out,
              vauxp0 => vauxp0,
              vauxn0 => vauxn0,
              vp_in => '0',
              vn_in => '0',
              reset_in => '0',
              
              busy_out => open,
              channel_out  => open,
              eoc_out => open,
              eos_out => open,
              alarm_out => open
    );

    -- constants 
    dclk_in <= clk;
    daddr_in <= "0010000";
    den_in <= '1';
    di_in <= (others => '0');
    dwe_in <= '0';
    
    --Read Data
    process (clk)
    begin
        if rising_edge(clk) then
            if drdy_out = '1' then
            normal_voltage <= unsigned(do_out(15 downto 4));
            
            
     -- normal code about 3276 = 0xCCC
     -- low threshold ? 2948 = 0xB84
     -- Over voltage threshold 3604 = 0xE14
            
    -- Check to see if value is outside of allowed range and set up flags
                if normal_voltage > to_unsigned(3604, 12) then
                    over_voltage <= '1';
                    --LED logic
                    alarm <= '1';
                    
                elsif normal_voltage < to_unsigned(2948, 12) then
                    under_voltage <= '1';
                    --LED logic
                    
                    
                else
                    over_voltage <= '0';
                    under_voltage <= '0';
                    
                end if;
            end if;
        end if;
    end process;
    
    
    --Shutdown Logic/ Prog_b??


end Behavioral;
