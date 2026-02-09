--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
--Date        : Mon Dec  8 18:22:22 2025
--Host        : DESKTOP-UDS885P running 64-bit major release  (build 9200)
--Command     : generate_target XADC_wrapper.bd
--Design      : XADC_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity XADC_wrapper is
  port (
    dclk_in_0 : in STD_LOGIC
  );
end XADC_wrapper;

architecture STRUCTURE of XADC_wrapper is
  component XADC is
  port (
    dclk_in_0 : in STD_LOGIC
  );
  end component XADC;
begin
XADC_i: component XADC
     port map (
      dclk_in_0 => dclk_in_0
    );
end STRUCTURE;
