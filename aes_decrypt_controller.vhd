----------------------------------------------------------------------------------
-- Engineer: Daniella Li Calzi
-- 
-- Create Date: 10/17/2025 12:50:22 AM
-- Module Name: aes_decrypt_controller - Behavioral
-- Project Name: SecureVISION 
-- Target Devices: Zybo Z7-020
-- Tool Versions: Vivado 2020.2
-- Description: top-level AES controller
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


entity aes_decrypt_controller is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC; --active high
           
           --Control/Flags
           start : in STD_LOGIC;
           key_ready : in STD_LOGIC;
           ciphertext_ready : in STD_LOGIC;
           aes_decrypt_done : out STD_LOGIC;
           
           key_in : in std_logic_vector(127 downto 0);
           byte_reg_value : out STD_LOGIC_VECTOR (127 downto 0);
           
           -- Text input and output          
           ciphertext_in : in STD_LOGIC_VECTOR (127 downto 0); --ciphertext
           plaintext_out : out STD_LOGIC_VECTOR (127 downto 0)); --plaintext
           
                  
end aes_decrypt_controller;

architecture Behavioral of aes_decrypt_controller is

    signal rounds_counter : integer range 0 to 10;
    
    
    signal byte_reg : std_logic_vector(127 downto 0); -- stores current state bytes value
    signal byte_next : std_logic_vector(127 downto 0);  -- stores next state bytes value after transformations
    
    -- signals for Key Expansion 
    signal eic_keys : round_key_type; -- 44 x 32 bit words from key expansion
    
    -- Signals for InvMixColumns
    signal mxc_out : std_logic_vector(127 downto 0); --invmixcolumns output bytes
    signal mxc_in   : std_logic_vector(127 downto 0);
    
    -- Signals for AddRoundKey
    signal round_key : round_key_128_array; 
    signal addrk_out : std_logic_vector(127 downto 0); --addroundkey input bytes
    -- signal addrk_in : std_logic_vector(127 downto 0);
    
    -- Signals for InvShiftRows
    signal sr_out : block_state_type;
    
    -- Signals for InvSubBytes
    signal sb_in : block_state_type;
    signal sb_out : block_state_type;
    
    
type state_type is (idle, key_expand, init, rounds, final, complete);
    signal current_state, next_state: state_type;


begin

    -- Instantiates aes_key_expansion
    inst_key_expand : entity work.aes_key_expansion_eic
    port map (
        key_in => key_in, -- 128 bit input key
        eic_keys => eic_keys -- internal signal that holds expanded keys
    );
    
    
    -- Instantiates InvShiftRows
    inst_InvShiftRows : entity work.InvShiftRows
    port map(
        sr_in => byte_reg, 
        sr_out => sr_out
    );

    -- Instantiates InvSubBytes
    inst_InvSubBytes : entity work.InvSubBytes
    port map(
            sb_in => sr_out,
            sb_out => sb_out
    );

--    -- Instantiates AddRoundKey
--    inst_AddRoundKey : entity work.AddRoundKey
--    port map (
--            round_key => round_key,
--            addrk_in => sb_out,
--            addrk_out => addrk_out
--    );
    
    -- Instantiates InvMixColumns
    inst_InvMixColumns : entity work.InvMixColumns
    port map (
            mxc_in => addrk_out,
            mxc_out => mxc_out
    );

-- State Register

process (clk, reset)
    begin
        if reset = '1' then
            current_state <= idle;
            byte_next <= (others => '0');
            byte_reg <= (others => '0');
            rounds_counter <= 0;
        elsif rising_edge(clk) then
            current_state <= next_state;
            byte_reg <= byte_next;
            if current_state = rounds then
                rounds_counter <= rounds_counter - 1;
            elsif current_state = idle then
                rounds_counter <= 9;   
            end if;
        end if;
    end process;
    
-- FSM for entire AES Decryption
process (current_state, start, key_ready, ciphertext_ready, ciphertext_in, eic_keys, rounds_counter, byte_reg, sb_out)
    begin
        
        next_state <= current_state;
        aes_decrypt_done <= '0';
        byte_next <= byte_reg;
        addrk_out <= (others => '0');
        
        case current_state is
        
            when idle =>
            -- waits for start signal 
                if (start = '1') and (ciphertext_ready = '1') then
                          
                    -- loads the ciphertext in
                    byte_next <= ciphertext_in;
                    next_state <= key_expand;
               end if;
                
                
            when key_expand =>
               
               round_key <= separate_round_keys(eic_keys);
               byte_reg_value <= byte_reg;
               if (key_ready = '1') then
                    next_state <= init;
                end if;
                
            when init => 
                
                -- Take ciphertext state and XOR with the last round key
                byte_next <= byte_reg XOR round_key(10);
                next_state <= rounds;
            
            
            when rounds =>
                
                -- InvShiftRows > InvSubBytes > AddRoundKey(round_key(round)) > InvMixColumns
                -- uses round keys 9 down to 1
                if rounds_counter > 0 then
                    addrk_out <= unpack_state_array(sb_out) xor round_key(rounds_counter);
                    
                    byte_next <= mxc_out;
                end if;
                
                if rounds_counter = 0 then
                    next_state <= final;
                end if;
                    
            when final => 
                byte_next <= unpack_state_array(sb_out) XOR round_key(0);
                next_state <= complete;
             
            when complete =>
                plaintext_out <= byte_reg;
                aes_decrypt_done <= '1';
                
                if start = '0' then
                    next_state <= idle;
                end if;
            
            
                
     end case;
end process;

end Behavioral;

