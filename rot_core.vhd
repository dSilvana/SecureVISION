----------------------------------------------------------------------------------
-- Engineer: Daniella Li Calzi

-- Design Name: 
-- Module Name: rot_core - Behavioral
-- Project Name: SecureVISION
-- Target Devices: Zybo Z7-20
-- Tool Versions: Vivado 2020.2
-- Description: RoT FSM that maps all connections between AES decrypt, side channel modules, and glitch detection modules.
-- Also handles status registers 
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
use work.aes_package.all;
library UNISIM;
use UNISIM.VComponents.all;

entity rot_core is
  Port (clk : in std_logic;
        reset : in std_logic;
        vauxp14 : in std_logic; -- JA1 board pin N16 (external auxiliary analog input)
        vauxn14 : in std_logic; -- JA7 board pin N15 (external auxiliary analog input)
        nvm_key_in : in std_logic_vector(127 downto 0); --key stored in NVM
        prsn_flag : in std_logic; --person detected flag from object detection software
        
        -- AXI Stream
        s_axis_tdata : in std_logic_vector(127 downto 0);
        s_axis_tvalid : in std_logic;
        s_axis_tready : out std_logic;
        s_axis_tlast : in std_logic;
        
        --LEDs 
        volt_fail : out std_logic; --LED pin for glitch detect
            --bitstream_auth_fail : out std_logic; --LED for failed authentication of the bitstream
        app_auth_fail : out std_logic; --LED for failed authentication of the application software
        person_detected : out std_logic;
        
        --Status
        cpu_rst_out : out std_logic; --active low
        rot_status : out std_logic_vector(4 downto 0) --AXI status to PS
        );
end rot_core;

architecture Behavioral of rot_core is
    signal glitch_detected : std_logic; --alarm flag from glitch module 
    --signal decrypt_fail : std_logic; --Decrypt Flag
    
    
    --Internal byte registers
    signal rot_reg : std_logic_vector(127 downto 0); 
    signal rot_reg_next : std_logic_vector(127 downto 0);
    
    --RoT Status Signals
    signal rot_idle : std_logic; --RoT ready and waiting for more bytes
    signal rot_busy : std_logic; 
    signal rot_pass : std_logic; --decrypt & auth pass
    signal rot_fail : std_logic; --decrypt or auth fail
    signal rot_alarm : std_logic; --glitch
    
    --AES Decrypt Signals 
    signal aes_ciphertext_in : STD_LOGIC_VECTOR (127 downto 0); 
    signal aes_plaintext_out : STD_LOGIC_VECTOR (127 downto 0);
    signal aes_start : std_logic;
    signal aes_decrypt_done : std_logic;
    signal aes_key_in : std_logic_vector(127 downto 0);
    
    --Authentication module signals
    signal auth_pass_o : std_logic; --pass flag
    signal auth_fail_o : std_logic; --Authentication fail flag
    
    signal sha_aes_pt_block_in : std_logic_vector(127 downto 0);
    signal sha_block_ready : std_logic := '0';
    signal sha_block_valid : std_logic := '0';
    signal sha_hash_valid : std_logic := '0';
    signal sha_error : std_logic := '0';
    signal start_sha : std_logic := '0';
    
    --Multi block auth
    signal block_count : integer range 0 to 4 := 0;
    signal block_count_next : integer range 0 to 4 := 0;
    signal auth_in_progress : std_logic := '0';
    
    type rot_state_type is (idle, init, decrypt_wait, authen_start, authen_wait, done, alarm);
        signal current_state, next_state: rot_state_type;
begin

rot_status(0) <= rot_idle;
rot_status(1) <= rot_busy;
rot_status(2) <= rot_pass;
rot_status(3) <= rot_fail;
rot_status(4) <= rot_alarm;

aes_key_in <= nvm_key_in;

inst_glitch : entity work.Top_Glitch_Detection
    port map(
        clk => clk,
        vauxp14 => vauxp14,
        vauxn14 => vauxn14,
        glitch_led => volt_fail,
        glitch_detected => glitch_detected);

inst_aes_contr : entity work.aes_decrypt_controller
    port map(
        clk => clk,
        reset => reset,
        aes_start => aes_start,
        --aes_key_ready => aes_key_ready,
        --ciphertext_ready => ciphertext_ready,
        aes_decrypt_done => aes_decrypt_done,
        key_in => aes_key_in,
        ciphertext_in => aes_ciphertext_in,
        plaintext_out => aes_plaintext_out
        );  

inst_sha : entity work.sha256_gv_aes_stream_wrapper_const
    port map(
        clk => clk,
        rst => reset,
        start_msg => start_sha,
        sha_aes_pt_block_valid => sha_block_valid,
        sha_aes_pt_block_in => sha_aes_pt_block_in,
        sha_aes_pt_block_ready => sha_block_ready,
        hash_valid => sha_hash_valid,
        hash_pass_o => auth_pass_o,
        hash_fail_o => auth_fail_o,
        hash_error_o => sha_error
    );    
        
-- State registers
process(clk, reset)
begin
    if reset = '1' then
        current_state <= idle;
        rot_reg <= (others => '0');
        rot_alarm <= '0';
        cpu_rst_out <= '1';
        app_auth_fail <= '0';
        person_detected <= '0';
    elsif rising_edge(clk) then
        current_state <= next_state;
        rot_reg <= rot_reg_next;
        block_count <= block_count_next;
        
        if (glitch_detected = '1') or (auth_fail_o = '1') then
            --cpu_rst_out <= '0';
            rot_alarm <= '1';
        end if;    
    end if;
end process;


process(all)
begin

rot_reg_next <= rot_reg;
next_state <= current_state;   


--Defaults
rot_idle <= '0';
rot_busy <= '0';
rot_pass <= '0';
rot_fail <= '0';

aes_start <= '0';
start_sha <= '0';
sha_block_valid <= '0';
sha_aes_pt_block_in <= (others => '0');
aes_ciphertext_in <= (others => '0');

s_axis_tready <= '0';
block_count_next <= block_count;


if rot_alarm = '1' then
    next_state <= alarm;
else 
    
    case current_state is
    
        when idle => 
            rot_idle <= '1';
            next_state <= init;
          
            
        when init => 
            rot_busy <= '1';
            s_axis_tready <= '1';
            if s_axis_tvalid = '1' then
                aes_ciphertext_in <= s_axis_tdata;
                aes_start <= '1';
                next_state <= decrypt_wait;
            else
                next_state <= init;
            end if;
                
                
        when decrypt_wait =>
            rot_busy <= '1';
            if aes_decrypt_done = '1' then
                rot_reg_next <= aes_plaintext_out;
                next_state <= authen_start;
            else 
                next_state <= decrypt_wait;
            end if;
                
        
        
        when authen_start =>
            rot_busy <= '1';
            start_sha <= '1';
            sha_block_valid <= '1';
            sha_aes_pt_block_in <= rot_reg;
            next_state <= authen_wait;
        
        when authen_wait =>
            rot_busy <= '1';
            
            if sha_hash_valid = '1' then
                if auth_pass_o = '1' then
                    next_state <= done;
                    
                elsif auth_fail_o = '1' then
                    next_state <= alarm;
                end if;
            end if;
            
        when done => 
            next_state <= idle;
            
            
        when alarm =>
           
            rot_reg_next <= (others => '0');
            if glitch_detected = '1' then
                cpu_rst_out <= '0';
                
--            elsif decrypt_fail = '1' then
--                bitstream_auth_fail <= '1';
                
            elsif auth_fail_o = '1' then
                app_auth_fail <= '1';
                cpu_rst_out <= '0';
                
            elsif prsn_flag = '1' then
                person_detected <= '1';
                cpu_rst_out <= '0';
                -- add more code here to erase the object detection algorithm from the processor and put the system in reset
            end if;
    end case;   
    end if;
end process;

end Behavioral;
