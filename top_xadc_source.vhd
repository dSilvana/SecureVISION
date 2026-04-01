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
library UNISIM;
use UNISIM.vcomponents.all;
use IEEE.NUMERIC_STD.ALL;

entity Top_Glitch_Detection is
  Port ( clk : in std_logic; -- board clock
        vauxp14 : in std_logic; -- JA1 board pin N16 (external auxiliary analog input)
        vauxn14 : in std_logic; -- JA7 board pin N15 (external auxiliary analog input)
        glitch_led : out std_logic; --LED pin for glitch alarm
        glitch_detected : out std_logic --signal to RoT to reset PS
        );
end Top_Glitch_Detection;

architecture Behavioral of Top_Glitch_Detection is
    signal dclk_in : std_logic; -- The clock for the DRP interface
    signal den_in : std_logic; --this gets set to 1 to activate the actual DRP (Dynamic Reconfiguration Enable)
    signal dwe_in : std_logic; -- Dynamic Reconfiguration Write Enable selects write operations
    signal daddr_in : std_logic_vector(6 downto 0); --Dynamic Reconfiguration Address specifies the register to access.
    signal di_in : std_logic_vector(15 downto 0); --Data Input - data to be written.
    signal do_out : std_logic_vector(15 downto 0); --digital XADC data output-data read from register
    signal drdy_out : std_logic; --Data Ready - Indicates data is valid or write is complete, digital XADC output
    signal eoc_out : std_logic; --end of conversion (active-High at the end of an ADC conversion when the measurement is written to the status registers)
    
    signal normal_voltage : unsigned(11 downto 0); --stores/hold voltage ADC value from status register
    signal over_voltage : std_logic := '0';
    signal under_voltage : std_logic := '0';
    
    component xadc_wiz_0 is
        port (
            daddr_in : in std_logic_vector(6 downto 0);
            den_in : in std_logic;
            di_in : in std_logic_vector(15 downto 0);
            dwe_in : in std_logic;
            do_out : out std_logic_vector(15 downto 0);
            drdy_out : out std_logic;
            dclk_in : in std_logic;
            reset_in : in std_logic;
            vauxp14 : in std_logic;
            vauxn14 : in std_logic;
            busy_out : out std_logic;
            channel_out : out std_logic_vector(4 downto 0);
            eoc_out : out std_logic;
            eos_out : out std_logic;
            alarm_out : out std_logic;
            vp_in : in std_logic;
            vn_in : in std_logic
        );
    end component;


begin

    xadc_instance : xadc_wiz_0
    port map (dclk_in => dclk_in,
              daddr_in => daddr_in,
              den_in => den_in,
              di_in => di_in,
              dwe_in => dwe_in,
              do_out => do_out,
              drdy_out => drdy_out,
              vauxp14 => vauxp14,
              vauxn14 => vauxn14,
              vp_in => '0', -- internal positive input terminal
              vn_in => '0', -- internal negative input terminal
              reset_in => '0',
              
              busy_out => open,
              channel_out  => open,
              eoc_out => eoc_out,
              eos_out => open,
              alarm_out => open
    );

    -- constants 
    dclk_in <= clk;
    daddr_in <= "0011110"; --0x1E (fixed DRP address for Auxiliary Channel 14) ADC Channel 30
    --den_in <= '1';
    di_in <= (others => '0');
    dwe_in <= '0';
    
    glitch_detected <= (glitch_led); --CPU held in reset
    
    --Read Data
    process (clk)
    begin
        if rising_edge(clk) then
            
            if eoc_out = '1' then
                den_in <= '1';
            else
                den_in <= '0';
            end if;
        
            if drdy_out = '1' then
            normal_voltage <= unsigned(do_out(15 downto 4));
            
            
     -- normal code about 3276 = 0xCCC
      --low threshold  2948 = 0xB84
     -- Over voltage threshold 3604 = 0xE14
            
    -- Check to see if value is outside of allowed range and set up flags
                if normal_voltage > to_unsigned(3604, 12) then
                    over_voltage <= '1';
                    --LED logic
                    glitch_led <= '1';
                   
                    
                elsif normal_voltage < to_unsigned(2948, 12) then
                    under_voltage <= '1';
                    --LED logic
                    glitch_led <= '1';
                    
                    
          
                end if;
            end if;
        end if;
    end process;
    

end Behavioral;
