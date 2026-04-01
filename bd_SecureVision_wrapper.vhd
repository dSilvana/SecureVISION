--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
--Date        : Mon Mar 30 19:50:23 2026
--Host        : DESKTOP-UDS885P running 64-bit major release  (build 9200)
--Command     : generate_target bd_SecureVision_wrapper.bd
--Design      : bd_SecureVision_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_SecureVision_wrapper is
  port (
    app_auth_fail_0 : out STD_LOGIC;
    person_detected_0 : out STD_LOGIC;
    vauxn14_0 : in STD_LOGIC;
    vauxp14_0 : in STD_LOGIC;
    volt_fail_0 : out STD_LOGIC
  );
end bd_SecureVision_wrapper;

architecture STRUCTURE of bd_SecureVision_wrapper is
  component bd_SecureVision is
  port (
    vauxp14_0 : in STD_LOGIC;
    vauxn14_0 : in STD_LOGIC;
    volt_fail_0 : out STD_LOGIC;
    app_auth_fail_0 : out STD_LOGIC;
    person_detected_0 : out STD_LOGIC
  );
  end component bd_SecureVision;
begin
bd_SecureVision_i: component bd_SecureVision
     port map (
      app_auth_fail_0 => app_auth_fail_0,
      person_detected_0 => person_detected_0,
      vauxn14_0 => vauxn14_0,
      vauxp14_0 => vauxp14_0,
      volt_fail_0 => volt_fail_0
    );
end STRUCTURE;
