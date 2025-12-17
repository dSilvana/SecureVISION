

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
    
    -- Signals for AddRoundKey
    signal round_key : round_key_128_array; 
    signal addrk_out : std_logic_vector(127 downto 0); --addroundkey input bytes
    signal addrk_reg : std_logic_vector(127 downto 0); 
    
    -- Signals for InvShiftRows
    signal sr_out : block_state_type;
    
    -- Signals for InvSubBytes
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

    -- Instantiates AddRoundKey
    inst_AddRoundKey : entity work.AddRoundKey
    port map (
            round_key => round_key,
            round_sel => rounds_counter,
            addrk_in => sb_out,
            addrk_out => addrk_out
    );
    
    -- Instantiates InvMixColumns
    inst_InvMixColumns : entity work.InvMixColumns
    port map (
            mxc_in => addrk_out,
            mxc_out => mxc_out
    );

-- State Register
process (clk)
    begin
        if rising_edge(clk) then
            current_state <= next_state;
            byte_reg <= byte_next;
            
            if (current_state = rounds) and (rounds_counter > 0) then
                rounds_counter <= rounds_counter - 1;
                
            elsif (current_state = idle) or (current_state = complete) then
                rounds_counter <= 9;   
                
            end if;
            
        end if;
    end process;
    
-- FSM for entire AES Decryption
process (all)
    begin
        
       if reset = '1' then
            next_state <= idle;
            aes_decrypt_done <= '0';
            byte_next <= (others => '0');
        else
            next_state <= current_state;
            aes_decrypt_done <= '0';
            byte_next <= byte_reg;
            
            
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
               if (key_ready = '1') then
                    next_state <= init;
                end if;
                
            when init => 
                
                -- Takes ciphertext state and XOR with the last round key
                addrk_reg <= byte_reg XOR round_key(10);
                byte_next <= addrk_reg;
                
                next_state <= rounds;
            
            
            when rounds =>
                -- InvShiftRows > InvSubBytes > AddRoundKey(round_key(round)) > InvMixColumns
                -- uses round keys 9 down to 1
                if rounds_counter > 0 then
                    byte_next <= mxc_out;
                end if;
                
                if rounds_counter = 0 then
                    next_state <= final;
                end if;
                    
            when final => 
                byte_next <= unpack_state_array(sb_out) XOR round_key(0);
                next_state <= complete;
             
            when complete =>
                aes_decrypt_done <= '1';
                plaintext_out <= byte_reg;
                
                if start = '0' then
                    next_state <= idle;
                end if;
            
            
                
     end case;
     
     end if;
     
end process;

end Behavioral;
