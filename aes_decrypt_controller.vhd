

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.aes_package.all;


entity aes_decrypt_controller is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC; --active high
           
           --Control/Flags
           aes_start : in STD_LOGIC;
           --aes_key_ready : in STD_LOGIC;
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
    signal mxc_mask_out : std_logic_vector(127 downto 0);
    
    -- Signals for AddRoundKey
    signal round_key : round_key_128_array; 
    signal addrk_out : std_logic_vector(127 downto 0); --addroundkey input bytes
    signal addrk_reg : std_logic_vector(127 downto 0); 
    signal rk_mask_out : std_logic_vector(127 downto 0);
    signal rk_mask_val : round_key_128_array;
    
    
    -- Signals for InvShiftRows
    signal sr_out : block_state_type;
    signal sr_mask_out : block_state_type;
    
    -- Signals for InvSubBytes
    signal sb_out : block_state_type;
    signal sb_mask_out : block_state_type;
    
    -- signals for TRNG Masking
    signal mask_enable : STD_LOGIC;
    signal mask_reg : STD_LOGIC_VECTOR (127 downto 0); 
    signal mask_next : std_logic_vector (127 downto 0);
    signal mask_out : std_logic_vector (127 downto 0);
    
    
type state_type is (idle, key_expand, init, rounds, rounds_pipe, final, complete);
    signal current_state, next_state: state_type;

begin

    -- Instantiates aes_key_expansion
    inst_key_expand : entity work.aes_key_expansion_eic
    port map (
        key_in => key_in, -- 128 bit input key
        eic_keys => eic_keys -- internal signal that holds expanded keys
    );
    
    
    -- Instantiates InvShiftRows for ciphertext and mask reg
    inst_InvShiftRows : entity work.InvShiftRows
    port map(
        sr_in => byte_reg, 
        sr_out => sr_out,
        sr_in_m => mask_reg, 
        sr_out_m => sr_mask_out
    );
    
    -- Instantiates InvSubBytes for masking and Ciphertext
    inst_InvSubBytes : entity work.InvSubBytes
    port map(
        sb_in       => sr_out,
        mask_in     => sr_mask_out,
        fresh_mask  => pack_state_array(mask_out),
        sb_out      => sb_out,
        sb_mask_out => sb_mask_out
    );
    
    -- Instantiates AddRoundKey
    inst_AddRoundKey : entity work.AddRoundKey
    port map (
            round_key => round_key,
            round_sel => rounds_counter,
            addrk_in => sb_out,
            addrk_out => addrk_out
    );
    
    -- Instantiates InvMixColumns for ciphertext and masking
    inst_InvMixColumns : entity work.InvMixColumns
    port map (
            mxc_in => addrk_out,
            mxc_out => mxc_out,
            mxc_in_m => rk_mask_out,
            mxc_out_m => mxc_mask_out
    );

    -- Instantiates RanMaskGen
    inst_TRNGMaskGen : entity work.TRNG
    port map (
        clk => clk,
        reset => reset,
        clk_enable => mask_enable,
        trng_mask_out => mask_out
    );
    
    
    -- Instantiates AddRoundKey for masking
    inst_AddRoundKey_mask : entity work.AddRoundKey
    port map (
            round_key => rk_mask_val,
            round_sel => rounds_counter,
            addrk_in => sb_mask_out,
            addrk_out => rk_mask_out
    );
    
    
-- State Register
process (clk)
    begin
        if rising_edge(clk) then
            current_state <= next_state;
            byte_reg <= byte_next;
            mask_reg <= mask_next;
            mask_enable <= '0'; --enable mask gen
            
            if (current_state = rounds) and (rounds_counter > 0) then
                mask_enable <= '1';

            elsif (current_state = rounds_pipe) and (rounds_counter > 0) then
                rounds_counter <= rounds_counter - 1;
                mask_enable <= '1';

            elsif (current_state = idle) or (current_state = complete) then
                rounds_counter <= 9;
                mask_enable <= '1';
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
            mask_next <= (others => '0');
            --load <= '1'; -- loads the mask seed 
            --enable <= '1';            
          
        else
            next_state <= current_state;
            aes_decrypt_done <= '0';
            byte_next <= byte_reg;
            --byte_next <= byte_reg;
            mask_next <= mask_reg;
            --load <= '0';
            
            
        case current_state is
        
            when idle =>
            --enable <= '1'; --enable mask gen 
            -- waits for start signal 
                if aes_start = '1' then
                    -- loads the ciphertext in
                    byte_next <= mask_out xor ciphertext_in;
                    mask_next <= mask_out;
                    next_state <= key_expand;
               end if;
                
            when key_expand =>
               round_key <= separate_round_keys(eic_keys);
               rk_mask_val <= (others => x"00000000000000000000000000000000");
               --if (aes_key_ready = '1') then
                    next_state <= init;
                --end if;
                
            when init => 
                -- Takes ciphertext state and XOR with the last round key
                addrk_reg <= byte_reg XOR round_key(10);
                byte_next <= addrk_reg;
                next_state <= rounds;
            
            
            when rounds =>
                if rounds_counter > 0 then
                --first half: InvShiftRows + InvSubBytes only
                -- addrk_out is available here from AddRoundKey
                    next_state <= rounds_pipe;
                end if;
                if rounds_counter = 0 then
                    next_state <= final;
                end if;

            when rounds_pipe =>
            -- Second half: latch InvMixColumns result
                byte_next <= mxc_out XOR mxc_mask_out XOR mask_out;
                mask_next <= mask_out;
                next_state <= rounds;
                    
            when final => 
                byte_next <= unpack_state_array(sb_out) XOR round_key(0);
                mask_next <= unpack_state_array(sb_mask_out);
                next_state <= complete;
             
            when complete =>
                aes_decrypt_done <= '1';
                plaintext_out <= byte_reg xor mask_reg;
                
                --if aes_start = '0' then
                    next_state <= idle;
                --end if;
            
            
                
     end case;
     
     end if;
     
end process;

end Behavioral;
