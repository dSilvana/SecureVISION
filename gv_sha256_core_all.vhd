---------------------------------------------------------------------------------
-- Combined files into a single core
-----------------------------------------------------------------------------------------------------------------------
-- Author:          Jonny Doin, jdoin@opencores.org, jonnydoin@gmail.com, jonnydoin@gridvortex.com
-- 
-- Create Date:     09:56:30 05/04/2016
-- Module Name:     sha256_padding - RTL
-- Project Name:    sha256 processor
-- Target Devices:  Spartan-6
-- Tool versions:   ISE 14.7
-- Description: 
--
--      This is the byte padding datapath logic for the sha256 processor. 
--      The padding of the last block is controlled by the byte lane selectors and the last words selectors.
--      These control signals are generated at the Control Logic block of the SHA256 processor. 
--      A consistency check error signal is generated, to flag illegal control conditions.
--      This block is a fully combinational circuit, with 2 layers of logic. 
--
------------------------------ COPYRIGHT NOTICE -----------------------------------------------------------------------
--                                                                   
--      This file is part of the SHA256 HASH CORE project http://opencores.org/project,sha256_hash_core
--                                                                   
--      Author(s):      Jonny Doin, jdoin@opencores.org, jonnydoin@gridvortex.com, jonnydoin@gmail.com
--                                                                   
--      Copyright (C) 2016 Jonny Doin
--      -----------------------------
--                                                                   
--      This source file may be used and distributed without restriction provided that this copyright statement is not    
--      removed from the file and that any derivative work contains the original copyright notice and the associated 
--      disclaimer. 
--                                                                   
--      This source file is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser 
--      General Public License as published by the Free Software Foundation; either version 2.1 of the License, or 
--      (at your option) any later version.
--                                                                   
--      This source is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
--      warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more  
--      details.
--
--      You should have received a copy of the GNU Lesser General Public License along with this source; if not, download 
--      it from http://www.gnu.org/licenses/lgpl.txt
--                                                                   
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Author:          Jonny Doin, jdoin@opencores.org, jonnydoin@gmail.com, jonnydoin@gridvortex.com
-- 
-- Create Date:     09:56:30 05/06/2016  
-- Module Name:     sha256_msg_sch - RTL
-- Project Name:    sha256 processor
-- Target Devices:  Spartan-6
-- Tool versions:   ISE 14.7
-- Description: 
--
--      This is the message scheduler datapath for the sha256 processor.
--                                                                
--------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Author:          Jonny Doin, jdoin@opencores.org, jonnydoin@gmail.com, jonnydoin@gridvortex.com
-- 
-- Create Date:     09:56:30 05/06/2016  
-- Module Name:     sha256_hash_core - RTL
-- Project Name:    sha256 processor
-- Target Devices:  Spartan-6
-- Tool versions:   ISE 14.7
-- Description: 
--
--      This is the 256bit single-cycle hash core processing logic for each of the 64 block steps. 
--      The combinational depth of this block is 8 layers of logic and adders.
--      This module will be the largest limitation of the synthesis top operating frequency.
--      If extra pipelining is needed, the control logic must account for the extra clock delays.
--
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Author:          Jonny Doin, jdoin@opencores.org, jonnydoin@gmail.com, jonnydoin@gridvortex.com
-- 
-- Create Date:     09:56:30 05/06/2016  
-- Module Name:     sha256_regs - RTL
-- Project Name:    sha256 processor
-- Target Devices:  Spartan-6
-- Tool versions:   ISE 14.7
-- Description: 
--
--      The regs block has the output result registers for the SHA256 processor.
--      It is a single-cycle 256bit Accumulator for the block hash results, and can be implemented
--      as a 32bit MUX and a 32bit carry chain for each register.
--
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Author:          Jonny Doin, jdoin@opencores.org, jonnydoin@gmail.com, jonnydoin@gridvortex.com
-- 
-- Create Date:     09:56:30 05/06/2016  
-- Module Name:     sha256_control - RTL
-- Project Name:    sha256 hash engine
-- Target Devices:  Spartan-6
-- Tool versions:   ISE 14.7
-- Description: 
--
--      This is the control path logic for the GV_SHA256 fast engine.
--
--      It is a fully synchronous design, with all signals synchronous to the rising edge of the system clock.
--      The sequencer state machine controls the hash datapath modules, generating addresses for the coefficients ROM, load/enable signals for the 
--      message schedule, hash core and output registers circuit blocks, and control signals for the input padding logic.
--
--      The SHA256 hash core follows the FIPS-180-4 logic description for the SHA-256 algorithm, optimized as a single-cycle per iteration engine. 
--                                                                                              
--      This implementation follows the implementation guidelines of the NIST Cryptographic Toolkit, and the NIST Approved Algorithms notes. 
--
--      RELEVANT NIST PUBLICATIONS
--      Link to Document                                                               | Description
--      ------------------------------------------------------------------------------ | ---------------------------------------------------------
--      http://csrc.nist.gov/publications/fips/fips140-2/fips1402.pdf                  | SECURITY REQUIREMENTS FOR CRYPTOGRAPHIC MODULES           
--      http://csrc.nist.gov/groups/ST/toolkit/index.html                              | NIST CRYPTOGRAPHIC TOOLKIT                                
--      http://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.180-4.pdf                      | Secure Hash Standard (SHS) SHA-256                        
--      http://csrc.nist.gov/publications/fips/fips198-1/FIPS-198-1_final.pdf          | The Keyed-Hash Message Authentication Code (HMAC)         
--      http://csrc.nist.gov/groups/ST/toolkit/documents/Examples/SHA256.pdf           | SHA-256 verification test vectors                         
--      http://csrc.nist.gov/groups/ST/toolkit/documents/Examples/SHA2_Additional.pdf  | Additional SHA-256 corner case verification test vectors  
--                                                                                             
--      RELEVANT RFCs
--      Link to PDF document                       | Description
--      ------------------------------------------ | ---------------------------------------------------------
--      https://tools.ietf.org/pdf/rfc2104.pdf     | RFC2104 - HMAC: Keyed-Hashing for Message Authentication
--      https://tools.ietf.org/pdf/rfc4231.pdf     | RFC4231 - Identifiers and Test Vectors for HMAC-SHA-256
--      https://tools.ietf.org/pdf/rfc4868.pdf     | RFC4868 - Using HMAC-SHA-256, HMAC-SHA-384, and HMAC-SHA-512 with IPsec
---------------------------------------------------------------------------------------------------------------------------------------------------------------
--      SHA256 ENGINE
--      =============
--
--      The setup of all circuit blocks is performed in a single extra clock cycle, besides the 64 steps needed to compute a hash block operation, 
--      resulting in a 65-cycle per block hash computation processor. Heavy pipelining is implemented to suppress control path operations logic steps. 
--      The engine is internally implemented as a 256-bit machine, with all combinational operations performed as a single-cycle operation on each
--      64 steps of the hash algorithm. Wide transfers of 256-bit data are also performed as single-cycle operations. 
--
--      The data input accepts 16 consecutive 32bit words for a total of 64 bytes per block, one word per clock cycle. The input signal 'wr_i' can be
--      used as a flow control input to hold the processor to wait for slower data.
--
--      A hash computation starts with a 'start_i' pulse that resets the processor. A pulse of the 'end_i' signal marks the last input data word. The
--      core will pad the last block according to the SHA256 rules, and present the results of the hash computation at the output registers, raising the
--      'data_valid' signal to mark the end of the computation. The hash results are available at the 256-bit output port.
--
--      The following waveforms describe the detailed operation for message start, update and end, with internal signals and FSM states. 
--
--      BEGIN BLOCK (1st block) - showing lookahead Wt and Kt
--      ======================
--
--      The hash operation starts with a 'start' sync pulse, which causes the RESET of the processor. The processor comes out of RESET only after 'start' is
--      released. 
--      The DATA_INPUT state is signalled by the data request signal 'di_req' going HIGH. The processor will latch 16 words from the 'di' port, at every 
--      rising edge of the system clock. At the end of the block input, the 'di_req' signal goes LOW. 
--      The input data can be held by bringing the 'ack' input LOW. When the 'ack' input is held LOW, it includes a wait state in the whole processor, to
--      cope with slow inputs or to allow periodic fetches of input data from multiple data sources. 
--
-----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- Author:          Jonny Doin, jdoin@opencores.org, jonnydoin@gmail.com, jonnydoin@gridvortex.com
-- 
-- Create Date:     01:21:32 05/05/2016 
-- Design Name:     gv_sha256
-- Module Name:     GV_SHA256 toplevel
-- Project Name:    GV_SHA256 engine
-- Target Devices:  Spartan-6 LX45
-- Tool versions:   ISE 14.7
-- Description: 
--
--      This is the gv_sha256 engine top level.
--      The gv_sha256 is a stream hash engine, i.e., the data words are hashed as a stream of words read from an input bus, with
--      control inputs for BEGIN/END of the message data stream. The input bus is a 32bit word bus, with a byte lane selector to signalize
--      how many bytes are valid in the last word. 
--
--      The core is a structural integration of the logic blocks for the SHA256 engine, with the internal datapath and controlpath wires.
--
--      Written in synthesizable VHDL, the hash engine is a low resource, area-efficient implementation of the FIPS-180-4 SHA256 hash algorithm.
--      Designed around the core registers and combinational hash functions as a 768bit-wide engine, the engine takes 64+1 clocks to 
--      compute a hash block.
--
--      It is designed for stand-alone ASIC functions and 32-bit bus interfaces for generic processor integration.
--
--      The data input port is organized as a 32bit word write register, with flow control and begin/end signals.
--      The 256bit result register is organized as 8 x 32bit registers that can be read simultaneously.
--
--      This implementation is a conservative implementation of the approved FIPS-180-4 algorithm, with a fair compromise of resources, 
--      comprising of only 32 registers of 32bit words for the hash engine, with a single-cycle combinational logic for each algorithm step.
--      The combinational logic depth of the engine is 10 logic layers. For a process with 650ps of average (Tpd + Tsu), this core can
--      be synthesized to 75MHz system clock. 
--
--      The GV_SHA256 is a basic cryptographic block, used by almost all encryption and digital signature schemes. 
--
--      Applications include low-cost CyberPhysical Systems and also fast backend crypto functions for realtime hashing of packet data.
--      It is used in the GridVortex CyberSec IP, as a base for the fused HMAC-SHA256, HKDF, HMAC-SHA256-DRBG, and the SP-800 TRNG Entropy Source.
--
-----------------------------------------------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity sha256_padding is
    port (
        words_sel_i : in std_logic_vector (1 downto 0) := (others => 'U');      -- selector for bitcnt insertion at the last block
        one_insert_i : in std_logic;                                            -- insert a leading one in the padding
        bytes_ena_i : in std_logic_vector (3 downto 0) := (others => 'U');      -- byte lane selector lines
        bitlen_i : in std_logic_vector (63 downto 0) := (others => 'U');        -- 64bit message bit length
        di_i : in std_logic_vector (31 downto 0) := (others => 'U');            -- big endian input message words
        do_o : out std_logic_vector (31 downto 0);                              -- padded output words
        hash_error_o : out std_logic                                                 -- '1' if error in the byte_ena selectors
    );
end sha256_padding;

architecture rtl of sha256_padding is
    -- byte lane wires 
    signal BL0 : std_logic_vector (7 downto 0);                                 -- byte lane 0 (MSB)
    signal BL1 : std_logic_vector (7 downto 0);                                 -- byte lane 1 (1SB)
    signal BL2 : std_logic_vector (7 downto 0);                                 -- byte lane 2 (2SB)
    signal BL3 : std_logic_vector (7 downto 0);                                 -- byte lane 3 (LSB)
    -- selectors
    signal one_insert : std_logic;                                              -- leading one padding
    signal B_ena : std_logic_vector (3 downto 0);                               -- byte lane selectors
    signal W_sel : std_logic_vector (1 downto 0);                               -- last words selector
    -- padded words
    signal W_pad : std_logic_vector (31 downto 0);                              -- padding mux output
    signal W_out : std_logic_vector (31 downto 0);                              -- output word
    -- ones insertion muxes
    signal BL0_top_bit : std_logic;
    signal BL1_top_bit : std_logic;
    signal BL2_top_bit : std_logic;
    signal BL3_top_bit : std_logic;
    -- bit length words
    signal bitlen_hi : std_logic_vector (31 downto 0);
    signal bitlen_lo : std_logic_vector (31 downto 0);
    -- error indication
    signal bsel_error : std_logic;
    signal wsel_error : std_logic;
    signal err : std_logic;
begin
    --=============================================================================================
    -- INPUT LOGIC
    --=============================================================================================
    -- copy the input ports into the internal wires
    
    -- byte lanes are internally spliced from the 32bit input word
    BL0 <= di_i(31 downto 24);
    BL1 <= di_i(23 downto 16);
    BL2 <= di_i(15 downto 8);
    BL3 <= di_i(7 downto 0);
    
    -- bitlen words spliced from the 64bit bitlen input word
    bitlen_hi <= bitlen_i(63 downto 32);
    bitlen_lo <= bitlen_i(31 downto 0);
    
    -- byte lane selectors
    one_insert <= one_insert_i;
    B_ena <= bytes_ena_i;
    W_sel <= words_sel_i;
    
    --=============================================================================================
    -- PADDING LOGIC
    --=============================================================================================
    -- The last block padding logic is implemented as a stream insertion into the input words datapath.
    
    -- top bit for the padding bytes. one_insert controls whether a leading one will be inserted on the leading pad byte.
    BL0_top_bit <= one_insert and (not B_ena(0));
    BL1_top_bit <= one_insert and (B_ena(0) and not B_ena(1));
    BL2_top_bit <= one_insert and (B_ena(1) and not B_ena(2));
    BL3_top_bit <= one_insert and (B_ena(2) and not B_ena(3));
    
    -- byte lane padding muxes
    W_pad(31 downto 24) <= BL0 when B_ena(0) = '1' else (BL0_top_bit & b"0000000");
    W_pad(23 downto 16) <= BL1 when B_ena(1) = '1' else (BL1_top_bit & b"0000000");
    W_pad(15 downto 8)  <= BL2 when B_ena(2) = '1' else (BL2_top_bit & b"0000000");
    W_pad(7 downto 0)   <= BL3 when B_ena(3) = '1' else (BL3_top_bit & b"0000000");
    
    --=============================================================================================
    -- BIT COUNTER INSERTION LOGIC
    --=============================================================================================
    -- At the end of the last block, the 64bit message length is inserted as the last 2 words.
    
    W_out <=    bitlen_hi   when W_sel = b"01" else
                bitlen_lo   when W_sel = b"10" else
                W_pad;
    
    --=============================================================================================
    -- ERROR INDICATION LOGIC
    --=============================================================================================
    -- Invalid selectors conditions are flagged as errors
    
    -- byte lane selectors error: priority encoder
    bsel_error <=   '1' when (B_ena(3) = '1') and ((B_ena(2) = '0') or (B_ena(1) = '0') or (B_ena(0) = '0')) else
                    '1' when (B_ena(2) = '1') and ((B_ena(1) = '0') or (B_ena(0) = '0')) else
                    '1' when (B_ena(1) = '1') and  (B_ena(0) = '0') else
                    '0';
                    
    -- word selector error: invalid code B"11"
    wsel_error <=   '1' when W_sel = b"11" else '0';
    
    err <= bsel_error or wsel_error;
    
    --=============================================================================================
    -- OUTPUT LOGIC
    --=============================================================================================
    -- connect output ports
    do_o_proc:      do_o <= W_out;
    error_o_proc:   hash_error_o <= err;
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity sha256_msg_sch is
    port (  
        clk_i : in std_logic := 'U';                                            -- system clock
        ce_i : in std_logic := 'U';                                             -- clock input to word shifter
        ld_i : in std_logic := 'U';                                             -- transparent load input to output
        M_i : in std_logic_vector (31 downto 0) := (others => 'U');             -- big endian input message words
        Wt_o : out std_logic_vector (31 downto 0)                               -- message schedule output words
    );                      
end sha256_msg_sch;

architecture rtl of sha256_msg_sch is
    -- datapath pipeline 
    signal r0 : unsigned (31 downto 0) := (others => '0');              -- internal message register
    signal r1 : unsigned (31 downto 0) := (others => '0');              -- internal message register
    signal r2 : unsigned (31 downto 0) := (others => '0');              -- internal message register
    signal r3 : unsigned (31 downto 0) := (others => '0');              -- internal message register
    signal r4 : unsigned (31 downto 0) := (others => '0');              -- internal message register
    signal r5 : unsigned (31 downto 0) := (others => '0');              -- internal message register
    signal r6 : unsigned (31 downto 0) := (others => '0');              -- internal message register
    signal r7 : unsigned (31 downto 0) := (others => '0');              -- internal message register
    signal r8 : unsigned (31 downto 0) := (others => '0');              -- internal message register
    signal r9 : unsigned (31 downto 0) := (others => '0');              -- internal message register
    signal r10 : unsigned (31 downto 0) := (others => '0');             -- internal message register
    signal r11 : unsigned (31 downto 0) := (others => '0');             -- internal message register
    signal r12 : unsigned (31 downto 0) := (others => '0');             -- internal message register
    signal r13 : unsigned (31 downto 0) := (others => '0');             -- internal message register
    signal r14 : unsigned (31 downto 0) := (others => '0');             -- internal message register
    signal r15 : unsigned (31 downto 0) := (others => '0');             -- internal message register
    -- input mux feedback
    signal next_M : unsigned (31 downto 0);                             -- sum feedback
    -- word shifter wires
    signal next_r0 : unsigned (31 downto 0);
    signal next_r1 : unsigned (31 downto 0);
    signal next_r2 : unsigned (31 downto 0);
    signal next_r3 : unsigned (31 downto 0);
    signal next_r4 : unsigned (31 downto 0);
    signal next_r5 : unsigned (31 downto 0);
    signal next_r6 : unsigned (31 downto 0);
    signal next_r7 : unsigned (31 downto 0);
    signal next_r8 : unsigned (31 downto 0);
    signal next_r9 : unsigned (31 downto 0);
    signal next_r10 : unsigned (31 downto 0);
    signal next_r11 : unsigned (31 downto 0);
    signal next_r12 : unsigned (31 downto 0);
    signal next_r13 : unsigned (31 downto 0);
    signal next_r14 : unsigned (31 downto 0);
    signal next_r15 : unsigned (31 downto 0);
    -- internal modulo adders
    signal sum0 : unsigned (31 downto 0);               -- modulo adder r1 + sum1
    signal sum1 : unsigned (31 downto 0);               -- modulo adder s0 + sum2
    signal sum2 : unsigned (31 downto 0);               -- modulo adder s1 + r10
    -- lower sigma functions
    signal s0 : unsigned (31 downto 0);                 -- lower sigma0 function
    signal s1 : unsigned (31 downto 0);                 -- lower sigma1 function
begin
    --=============================================================================================
    -- MESSAGE SCHEDULER LOGIC
    --=============================================================================================
    -- This logic implements the 256 bytes message schedule as a folded 16 word circular word shifter.
    -- The Add-Rotate-Xor functions s0 and s1 are implemented and fed back to the word shifter.
    -- To avoid a datapath pipeline delay insertion, the output is taken from the r0 input, rather than
    -- the registered r0 output. This lookahead reduces one clock cycle in the overall hash computation,
    -- but increases the combinational path from the input to the processor core.
    -- The next_r0 combinational function has 5 layers of logic, including 3 carry chains.
    
    -- word shifter register transfer logic
    word_shifter_proc: process (clk_i, ce_i) is
    begin
        if clk_i'event and clk_i = '1' then
            if ce_i = '1' then
                r0 <= next_r0;
                r1 <= next_r1;
                r2 <= next_r2;
                r3 <= next_r3;
                r4 <= next_r4;
                r5 <= next_r5;
                r6 <= next_r6;
                r7 <= next_r7;
                r8 <= next_r8;
                r9 <= next_r9;
                r10 <= next_r10;
                r11 <= next_r11;
                r12 <= next_r12;
                r13 <= next_r13;
                r14 <= next_r14;
                r15 <= next_r15;
            end if;
        end if;
    end process word_shifter_proc;
    
    -- input mux 
    next_r0_proc: next_r0 <= unsigned(M_i) when ld_i = '1' else next_M;
    next_m_proc:  next_M <= sum0;
    
    -- word shifter wires
    next_r15_proc: next_r15 <= r0;
    next_r14_proc: next_r14 <= r15;
    next_r13_proc: next_r13 <= r14;
    next_r12_proc: next_r12 <= r13;
    next_r11_proc: next_r11 <= r12;
    next_r10_proc: next_r10 <= r11;
    next_r9_proc: next_r9 <= r10;
    next_r8_proc: next_r8 <= r9;
    next_r7_proc: next_r7 <= r8;
    next_r6_proc: next_r6 <= r7;
    next_r5_proc: next_r5 <= r6;
    next_r4_proc: next_r4 <= r5;
    next_r3_proc: next_r3 <= r4;
    next_r2_proc: next_r2 <= r3;
    next_r1_proc: next_r1 <= r2;
    
    -- adders 
    sum0_proc: sum0 <= sum1 + r1;
    sum1_proc: sum1 <= sum2 + s0;
    sum2_proc: sum2 <= r10 + s1;
    
    -- lower sigma functions
    s0_proc: s0 <= (B"000" & r2(31 downto 3)) xor (r2(17 downto 0) & r2(31 downto 18)) xor (r2(6 downto 0) & r2(31 downto 7));
    s1_proc: s1 <= (B"0000000000" & r15(31 downto 10)) xor (r15(18 downto 0) & r15(31 downto 19)) xor (r15(16 downto 0) & r15(31 downto 17));
    
    --=============================================================================================
    -- OUTPUT LOGIC
    --=============================================================================================
    -- connect output ports
    Wt_o_proc:      Wt_o <= std_logic_vector(next_r0);  -- message scheduler output look ahead
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity sha256_hash_core is
    port (  
        clk_i : in std_logic := 'U';                                    -- system clock
        ce_i : in std_logic := 'U';                                     -- clock enable from control logic
        ld_i : in std_logic := 'U';                                     -- parallel load internal registers with input words
        A_i : in std_logic_vector (31 downto 0) := (others => 'U');     -- input for reg A
        B_i : in std_logic_vector (31 downto 0) := (others => 'U');     -- input for reg B
        C_i : in std_logic_vector (31 downto 0) := (others => 'U');     -- input for reg C
        D_i : in std_logic_vector (31 downto 0) := (others => 'U');     -- input for reg D
        E_i : in std_logic_vector (31 downto 0) := (others => 'U');     -- input for reg E
        F_i : in std_logic_vector (31 downto 0) := (others => 'U');     -- input for reg F
        G_i : in std_logic_vector (31 downto 0) := (others => 'U');     -- input for reg G
        H_i : in std_logic_vector (31 downto 0) := (others => 'U');     -- input for reg H
        A_o : out std_logic_vector (31 downto 0) := (others => 'U');    -- output for reg A
        B_o : out std_logic_vector (31 downto 0) := (others => 'U');    -- output for reg B
        C_o : out std_logic_vector (31 downto 0) := (others => 'U');    -- output for reg C
        D_o : out std_logic_vector (31 downto 0) := (others => 'U');    -- output for reg D
        E_o : out std_logic_vector (31 downto 0) := (others => 'U');    -- output for reg E
        F_o : out std_logic_vector (31 downto 0) := (others => 'U');    -- output for reg F
        G_o : out std_logic_vector (31 downto 0) := (others => 'U');    -- output for reg G
        H_o : out std_logic_vector (31 downto 0) := (others => 'U');    -- output for reg H
        Kt_i : in std_logic_vector (31 downto 0) := (others => 'U');    -- coefficients for the 64 steps of the message schedule
        Wt_i : in std_logic_vector (31 downto 0) := (others => 'U')     -- message schedule words for the 64 steps
    );                      
end sha256_hash_core;

architecture rtl of sha256_hash_core is
    -- core registers
    signal reg_a : unsigned (31 downto 0) := (others => '0');
    signal reg_b : unsigned (31 downto 0) := (others => '0');
    signal reg_c : unsigned (31 downto 0) := (others => '0');
    signal reg_d : unsigned (31 downto 0) := (others => '0');
    signal reg_e : unsigned (31 downto 0) := (others => '0');
    signal reg_f : unsigned (31 downto 0) := (others => '0');
    signal reg_g : unsigned (31 downto 0) := (others => '0');
    signal reg_h : unsigned (31 downto 0) := (others => '0');
    -- combinational inputs
    signal next_reg_a : unsigned (31 downto 0);
    signal next_reg_b : unsigned (31 downto 0);
    signal next_reg_c : unsigned (31 downto 0);
    signal next_reg_d : unsigned (31 downto 0);
    signal next_reg_e : unsigned (31 downto 0);
    signal next_reg_f : unsigned (31 downto 0);
    signal next_reg_g : unsigned (31 downto 0);
    signal next_reg_h : unsigned (31 downto 0);
    -- internal modulo adders
    signal sum0 : unsigned (31 downto 0);
    signal sum1 : unsigned (31 downto 0);
    signal sum2 : unsigned (31 downto 0);
    signal sum3 : unsigned (31 downto 0);
    signal sum4 : unsigned (31 downto 0);
    signal sum5 : unsigned (31 downto 0);
    signal sum6 : unsigned (31 downto 0);
    -- upper sigma functions
    signal SIG0 : unsigned (31 downto 0);
    signal SIG1 : unsigned (31 downto 0);
    -- Ch and Maj functions
    signal Ch : unsigned (31 downto 0);
    signal Maj : unsigned (31 downto 0);
begin
    --=============================================================================================
    -- HASH BLOCK CORE LOGIC
    --=============================================================================================
    -- The hash core block implements the hash kernel operation that is used in each of the 64 block hash steps. 
    -- All operations for a kernel step execute in a single clock cycle.
    -- The longest combinational path is the 'next_reg_a', with 12 logic layers total, including the upstream 
    -- datapath from the message scheduler. 
    
    -- core register transfer logic
    core_regs_proc: process (clk_i, ce_i) is
    begin
        if clk_i'event and clk_i = '1' then
            if ce_i = '1' then
                reg_a <= next_reg_a;
                reg_b <= next_reg_b;
                reg_c <= next_reg_c;
                reg_d <= next_reg_d;
                reg_e <= next_reg_e;
                reg_f <= next_reg_f;
                reg_g <= next_reg_g;
                reg_h <= next_reg_h;
            end if;
        end if;
    end process core_regs_proc;

    --=============================================================================================
    --  COMBINATIONAL LOGIC
    --=============================================================================================
    -- word rotation and bit manipulation for each cycle
    
    -- input muxes and word shifter wires
    next_reg_a_proc: next_reg_a <= unsigned(A_i) when ld_i = '1' else sum0;
    next_reg_b_proc: next_reg_b <= unsigned(B_i) when ld_i = '1' else reg_a;
    next_reg_c_proc: next_reg_c <= unsigned(C_i) when ld_i = '1' else reg_b;
    next_reg_d_proc: next_reg_d <= unsigned(D_i) when ld_i = '1' else reg_c;
    next_reg_e_proc: next_reg_e <= unsigned(E_i) when ld_i = '1' else sum2;
    next_reg_f_proc: next_reg_f <= unsigned(F_i) when ld_i = '1' else reg_e;
    next_reg_g_proc: next_reg_g <= unsigned(G_i) when ld_i = '1' else reg_f;
    next_reg_h_proc: next_reg_h <= unsigned(H_i) when ld_i = '1' else reg_g;
    
    -- adders for the ARX functions
    sum0_proc: sum0 <= sum1 + sum3;
    sum1_proc: sum1 <= SIG0 + Maj;
    sum2_proc: sum2 <= sum3 + reg_d;
    sum3_proc: sum3 <= sum4 + SIG1;
    sum4_proc: sum4 <= sum5 + unsigned(Wt_i);
    sum5_proc: sum5 <= sum6 + unsigned(Kt_i);
    sum6_proc: sum6 <= reg_h + Ch;
    
    -- upper sigma functions
    SIG0_proc: SIG0 <= (reg_a(1 downto 0) & reg_a(31 downto 2)) xor (reg_a(12 downto 0) & reg_a(31 downto 13)) xor (reg_a(21 downto 0) & reg_a(31 downto 22));
    SIG1_proc: SIG1 <= (reg_e(5 downto 0) & reg_e(31 downto 6)) xor (reg_e(10 downto 0) & reg_e(31 downto 11)) xor (reg_e(24 downto 0) & reg_e(31 downto 25));
    
    -- Maj and Ch functions
    Maj_proc: Maj <= (reg_a and reg_b) xor (reg_a and reg_c) xor (reg_b and reg_c);
    Ch_proc:  Ch <= (reg_e and reg_f) xor ((not reg_e) and reg_g);
    
    --=============================================================================================
    -- OUTPUT LOGIC
    --=============================================================================================
    -- connect output ports
    A_o_proc:       A_o <= std_logic_vector(reg_a);
    B_o_proc:       B_o <= std_logic_vector(reg_b);
    C_o_proc:       C_o <= std_logic_vector(reg_c);
    D_o_proc:       D_o <= std_logic_vector(reg_d);
    E_o_proc:       E_o <= std_logic_vector(reg_e);
    F_o_proc:       F_o <= std_logic_vector(reg_f);
    G_o_proc:       G_o <= std_logic_vector(reg_g);
    H_o_proc:       H_o <= std_logic_vector(reg_h);
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sha256_regs is
    port (  
        clk_i : in std_logic := 'U';                                            -- system clock
        ce_i : in std_logic := 'U';                                             -- clock enable from control logic
        ld_i : in std_logic := 'U';                                             -- internal mux selection from control logic
        A_i : in std_logic_vector (31 downto 0) := (others => 'U');
        B_i : in std_logic_vector (31 downto 0) := (others => 'U');
        C_i : in std_logic_vector (31 downto 0) := (others => 'U');
        D_i : in std_logic_vector (31 downto 0) := (others => 'U');
        E_i : in std_logic_vector (31 downto 0) := (others => 'U');
        F_i : in std_logic_vector (31 downto 0) := (others => 'U');
        G_i : in std_logic_vector (31 downto 0) := (others => 'U');
        H_i : in std_logic_vector (31 downto 0) := (others => 'U');
        K0_i : in std_logic_vector (31 downto 0) := (others => 'U');
        K1_i : in std_logic_vector (31 downto 0) := (others => 'U');
        K2_i : in std_logic_vector (31 downto 0) := (others => 'U');
        K3_i : in std_logic_vector (31 downto 0) := (others => 'U');
        K4_i : in std_logic_vector (31 downto 0) := (others => 'U');
        K5_i : in std_logic_vector (31 downto 0) := (others => 'U');
        K6_i : in std_logic_vector (31 downto 0) := (others => 'U');
        K7_i : in std_logic_vector (31 downto 0) := (others => 'U');
        N0_o : out std_logic_vector (31 downto 0) := (others => 'U');
        N1_o : out std_logic_vector (31 downto 0) := (others => 'U');
        N2_o : out std_logic_vector (31 downto 0) := (others => 'U');
        N3_o : out std_logic_vector (31 downto 0) := (others => 'U');
        N4_o : out std_logic_vector (31 downto 0) := (others => 'U');
        N5_o : out std_logic_vector (31 downto 0) := (others => 'U');
        N6_o : out std_logic_vector (31 downto 0) := (others => 'U');
        N7_o : out std_logic_vector (31 downto 0) := (others => 'U');
        H0_o : out std_logic_vector (31 downto 0) := (others => 'U');
        H1_o : out std_logic_vector (31 downto 0) := (others => 'U');
        H2_o : out std_logic_vector (31 downto 0) := (others => 'U');
        H3_o : out std_logic_vector (31 downto 0) := (others => 'U');
        H4_o : out std_logic_vector (31 downto 0) := (others => 'U');
        H5_o : out std_logic_vector (31 downto 0) := (others => 'U');
        H6_o : out std_logic_vector (31 downto 0) := (others => 'U');
        H7_o : out std_logic_vector (31 downto 0) := (others => 'U')
    );                      
end sha256_regs;

architecture rtl of sha256_regs is
    -- output result registers 
    signal reg_H0 : unsigned (31 downto 0) := (others => '0');
    signal reg_H1 : unsigned (31 downto 0) := (others => '0');
    signal reg_H2 : unsigned (31 downto 0) := (others => '0');
    signal reg_H3 : unsigned (31 downto 0) := (others => '0');
    signal reg_H4 : unsigned (31 downto 0) := (others => '0');
    signal reg_H5 : unsigned (31 downto 0) := (others => '0');
    signal reg_H6 : unsigned (31 downto 0) := (others => '0');
    signal reg_H7 : unsigned (31 downto 0) := (others => '0');
    -- word shifter wires
    signal next_reg_H0 : unsigned (31 downto 0);
    signal next_reg_H1 : unsigned (31 downto 0);
    signal next_reg_H2 : unsigned (31 downto 0);
    signal next_reg_H3 : unsigned (31 downto 0);
    signal next_reg_H4 : unsigned (31 downto 0);
    signal next_reg_H5 : unsigned (31 downto 0);
    signal next_reg_H6 : unsigned (31 downto 0);
    signal next_reg_H7 : unsigned (31 downto 0);
    -- internal modulo adders
    signal sum0 : unsigned (31 downto 0);
    signal sum1 : unsigned (31 downto 0);
    signal sum2 : unsigned (31 downto 0);
    signal sum3 : unsigned (31 downto 0);
    signal sum4 : unsigned (31 downto 0);
    signal sum5 : unsigned (31 downto 0);
    signal sum6 : unsigned (31 downto 0);
    signal sum7 : unsigned (31 downto 0);
begin
    --=============================================================================================
    -- OUTPUT RESULT REGISTERS LOGIC
    --=============================================================================================
    -- The output result registers hold the intermediate values for the hash update blocks, and also the final 256bit hash value. 
    --
    
    -- output register transfer logic
    out_regs_proc: process (clk_i, ce_i) is
    begin
        if clk_i'event and clk_i = '1' then
            if ce_i = '1' then
                reg_H0 <= next_reg_H0;
                reg_H1 <= next_reg_H1;
                reg_H2 <= next_reg_H2;
                reg_H3 <= next_reg_H3;
                reg_H4 <= next_reg_H4;
                reg_H5 <= next_reg_H5;
                reg_H6 <= next_reg_H6;
                reg_H7 <= next_reg_H7;
            end if;
        end if;
    end process out_regs_proc;
    
    -- input muxes
    next_reg_H0_proc: next_reg_H0 <= unsigned(K0_i) when ld_i = '1' else sum0;
    next_reg_H1_proc: next_reg_H1 <= unsigned(K1_i) when ld_i = '1' else sum1;
    next_reg_H2_proc: next_reg_H2 <= unsigned(K2_i) when ld_i = '1' else sum2;
    next_reg_H3_proc: next_reg_H3 <= unsigned(K3_i) when ld_i = '1' else sum3;
    next_reg_H4_proc: next_reg_H4 <= unsigned(K4_i) when ld_i = '1' else sum4;
    next_reg_H5_proc: next_reg_H5 <= unsigned(K5_i) when ld_i = '1' else sum5;
    next_reg_H6_proc: next_reg_H6 <= unsigned(K6_i) when ld_i = '1' else sum6;
    next_reg_H7_proc: next_reg_H7 <= unsigned(K7_i) when ld_i = '1' else sum7;
    
    -- adders 
    sum0_proc: sum0 <= reg_H0 + unsigned(A_i);
    sum1_proc: sum1 <= reg_H1 + unsigned(B_i);
    sum2_proc: sum2 <= reg_H2 + unsigned(C_i);
    sum3_proc: sum3 <= reg_H3 + unsigned(D_i);
    sum4_proc: sum4 <= reg_H4 + unsigned(E_i);
    sum5_proc: sum5 <= reg_H5 + unsigned(F_i);
    sum6_proc: sum6 <= reg_H6 + unsigned(G_i);
    sum7_proc: sum7 <= reg_H7 + unsigned(H_i);
    
    --=============================================================================================
    -- OUTPUT LOGIC
    --=============================================================================================
    -- connect output ports
    H0_o_proc:      H0_o <= std_logic_vector(reg_H0);
    H1_o_proc:      H1_o <= std_logic_vector(reg_H1);
    H2_o_proc:      H2_o <= std_logic_vector(reg_H2);
    H3_o_proc:      H3_o <= std_logic_vector(reg_H3);


    H4_o_proc:      H4_o <= std_logic_vector(reg_H4);
    H5_o_proc:      H5_o <= std_logic_vector(reg_H5);
    H6_o_proc:      H6_o <= std_logic_vector(reg_H6);
    H7_o_proc:      H7_o <= std_logic_vector(reg_H7);
    
    N0_o_proc:      N0_o <= std_logic_vector(next_reg_H0);
    N1_o_proc:      N1_o <= std_logic_vector(next_reg_H1);
    N2_o_proc:      N2_o <= std_logic_vector(next_reg_H2);
    N3_o_proc:      N3_o <= std_logic_vector(next_reg_H3);
    N4_o_proc:      N4_o <= std_logic_vector(next_reg_H4);
    N5_o_proc:      N5_o <= std_logic_vector(next_reg_H5);
    N6_o_proc:      N6_o <= std_logic_vector(next_reg_H6);
    N7_o_proc:      N7_o <= std_logic_vector(next_reg_H7);
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sha256_control is
    port (  
        -- inputs
        clk_i : in std_logic := 'U';                                    -- system clock
        ce_i : in std_logic := 'U';                                     -- core clock enable
        start_i : in std_logic := 'U';                                  -- reset the processor and start a new hash
        end_i : in std_logic := 'U';                                    -- marks end of last block data input
        wr_i  : in std_logic := 'U';                                    -- input word write/hold control
        bytes_i : in std_logic_vector (1 downto 0) := (others => 'U');  -- valid bytes in input word
        error_i : in std_logic := 'U';                                  -- datapath error input from other modules
        -- output control signals
        bitlen_o : out std_logic_vector (63 downto 0);                  -- message bit length
        words_sel_o : out std_logic_vector (1 downto 0);                -- bitlen insertion control
        Kt_addr_o : out std_logic_vector (5 downto 0);                  -- address for the Kt coefficients ROM
        sch_ld_o : out std_logic;                                       -- load/recirculate words for message scheduler
        core_ld_o : out std_logic;                                      -- load all registers for hash core
        oregs_ld_o : out std_logic;                                     -- load output registers
        sch_ce_o : out std_logic;                                       -- clock enable for message scheduler logic block
        core_ce_o : out std_logic;                                      -- clock enable for hash core logic block
        oregs_ce_o : out std_logic;                                     -- clock enable for output regs logic block
        bytes_ena_o : out std_logic_vector (3 downto 0);                -- byte lane selectors for padding logic block
        one_insert_o : out std_logic;                                   -- insert leading '1' in the padding
        di_req_o : out std_logic;                                       -- external data request by the 'di_i' port
        data_valid_o : out std_logic;                                   -- operation finished. output data is valid
        hash_error_o : out std_logic                                         -- operation aborted. output data is not valid
    );                      
end sha256_control;

architecture rtl of sha256_control is
    --=============================================================================================
    -- Type definitions
    --=============================================================================================
    -- controller states
    type hash_toplevel_control is 
            (   st_reset,                   -- core reset, initial state
                st_sha_data_input,          -- sha data input
                st_sha_blk_process,         -- sha block process
                st_sha_blk_nxt,             -- sha block next
                st_sha_padding,             -- sha padding    
                st_sha_data_valid,          -- sha data valid
                st_error                    -- fsm locks on error, exit only by reset
            );

    --=============================================================================================
    -- Signals for state machine control
    --=============================================================================================
    signal hash_control_st_reg  : hash_toplevel_control := st_reset;
    signal hash_control_st_next : hash_toplevel_control := st_reset;
  
    --=============================================================================================
    -- Signals for internal operation
    --=============================================================================================
    -- combinational flags: message data input / padding control / block internal process selection
    signal reset : std_logic;
    signal sha_reset : std_logic;
    signal sha_init : std_logic;
    signal wait_run_ce : std_logic;
    -- registered flags: last block, padding control
    signal sha_last_blk_reg : std_logic;
    signal sha_last_blk_next : std_logic;
    signal padding_reg : std_logic;
    signal padding_next : std_logic;
    signal pad_one_reg : std_logic;
    signal pad_one_next : std_logic;
    -- 64 bit message bit counter
    signal msg_bit_cnt_reg : unsigned (63 downto 0);
    signal msg_bit_cnt_next : unsigned (63 downto 0);
    signal bits_to_add : unsigned (5 downto 0);
    signal msg_bit_cnt_ce : std_logic;
    -- sequencer state counter
    signal st_cnt_reg : unsigned (6 downto 0);
    signal st_cnt_next : unsigned (6 downto 0);
    signal st_cnt_ce : std_logic;
    signal st_cnt_clr : std_logic;
    
    --=============================================================================================
    -- Output Control Signals
    --=============================================================================================
    -- unregistered control signals
    signal words_sel : std_logic_vector (1 downto 0);   -- bitlen insertion control
    signal sch_ld : std_logic;                          -- input data load into message scheduler control
    signal core_ld : std_logic;                         -- hash core load data registers control
    signal oregs_ld : std_logic;                        -- load initial value into output regs control
    signal sch_ce : std_logic;                          -- clock enable for message scheduler logic block
    signal core_ce : std_logic;                         -- clock enable for hash core logic block
    signal oregs_ce : std_logic;                        -- clock enable for output regs logic block
    signal bytes_ena : std_logic_vector (3 downto 0);   -- byte lane selectors for padding logic block
    signal one_insert : std_logic;                      -- insert leading one in the padding
    signal di_req : std_logic;                          -- data request
    signal di_wr_window : std_logic;                    -- valid data write window    
    signal data_valid : std_logic;                      -- operation finished. output data is valid
    signal data_input_error : std_logic;                -- data write outside write valid window
    signal bytes_error : std_logic;                     -- bytes selection error
    signal error_lock : std_logic;                      -- error state lock
    signal core_error : std_logic;                      -- operation aborted. output data is not valid
    
begin
    --=============================================================================================
    --  REGISTER TRANSFER PROCESSES
    --=============================================================================================
    -- control fsm register transfer logic
    control_fsm_proc: process (clk_i) is
    begin
        -- FSM state register: sync RESET on 'reset', and sync PRESET on error_i
        if clk_i'event and clk_i = '1' then
            if reset = '1' then
                -- all registered values are reset on master clear
                hash_control_st_reg <= st_reset;
            elsif core_error = '1' then
                -- error latch: lock on the error state
                hash_control_st_reg <= st_error;
            elsif ce_i = '1' then
                -- all registered values are held on master clock enable
                hash_control_st_reg <= hash_control_st_next;
            end if;
        end if;
        -- SHA256 registers, RESET on 'sha_init'
        if clk_i'event and clk_i = '1' then
            if sha_init = '1' then
                -- all SHA256 registered values are reset on SHA master clear
                sha_last_blk_reg <= '0';
                padding_reg <= '0';
            elsif ce_i = '1' then
                -- all registered values are held on master clock enable
                sha_last_blk_reg <= sha_last_blk_next;
                padding_reg <= padding_next;
            end if;
        end if;
    end process control_fsm_proc;

    -- bit counter register transfer logic
    bit_counter_proc: process (clk_i) is
    begin
        -- bit counter
        if clk_i'event and clk_i = '1' then
            if sha_init = '1' then
                msg_bit_cnt_reg <= (others => '0');
            elsif ce_i = '1' and msg_bit_cnt_ce = '1' then
                msg_bit_cnt_reg <= msg_bit_cnt_next;
            end if;
        end if;
    end process bit_counter_proc;

    -- state counter register transfer process
    state_counter_proc: process (clk_i) is
    begin
        -- core state counter
        if clk_i'event and clk_i = '1' then
            if (sha_init = '1') or (st_cnt_clr = '1') then
                st_cnt_reg <= (others => '0');
            elsif (ce_i = '1') and (st_cnt_ce = '1') then
                st_cnt_reg <= st_cnt_next;
            end if;
        end if;
    end process state_counter_proc;
    
    -- one-padding register transfer logic
    pad_one_fsm_proc: process (clk_i) is
    begin
        if clk_i'event and clk_i = '1' then
            if sha_init = '1' then
                -- all registered values are reset on master clear
                pad_one_reg <= '1';
            elsif (ce_i = '1') and (sch_ce = '1') then
                -- one-padding register is clocked synchronous with the message schedule
                pad_one_reg <= pad_one_next;
            end if;
        end if;
    end process pad_one_fsm_proc;

    --=============================================================================================
    --  COMBINATIONAL NEXT-STATE LOGIC
    --=============================================================================================
    -- State and control path combinational logic
    -- The hash_control_st_reg state register controls the SHA256 algorithm.
    control_combi_proc : process (  hash_control_st_reg, sha_last_blk_reg, padding_reg, wait_run_ce, 
                                    end_i, st_cnt_reg, sha_last_blk_next, one_insert, sha_reset ) is
    begin
        -- default logic that applies to all states at each fsm clock --

        -- assign default values to all unchanging combinational outputs (avoid latches)
        hash_control_st_next <= hash_control_st_reg;
        sha_last_blk_next <= sha_last_blk_reg;
        padding_next <= padding_reg;
        -- handshaking
        sha_init <= '0';
        error_lock <= '0';
        di_wr_window <= '0';        
        words_sel <= b"00";
        data_valid <= '0';
        di_req <= '0';              -- data request only during data input
        -- state counter
        st_cnt_clr <= '0';          -- only clear the state counter at the beginning of each block
        st_cnt_ce <= '0';
        -- message scheduler
        sch_ld <= '1';              -- enable pass-thru input through message schedule
        sch_ce <= '0';              -- stop message schedule clock
        -- hash core
        core_ld <= '0';             -- enable internal hash core logic
        core_ce <= '0';             -- core computation enabled only for data input and processing
        -- output registers
        oregs_ld <= '0';            -- defaults for accumulate blk hash
        oregs_ce <= '0';            -- only register init values and end of computation
        case hash_control_st_reg is
        
            when st_reset =>                -- master reset: starts a new hash/hmac processing
                -- moore outputs
                sha_init <= '1';            -- reset SHA256 engine
                oregs_ld <= '1';            -- load initial hash values
                oregs_ce <= '1';            -- latch initial hash values into output registers
                core_ld <= '1';             -- load initial value into core registers
                core_ce <= '1';             -- latch initial value into core registers
                st_cnt_clr <= '1';          -- reset state counter
                di_wr_window <= '1';        -- enable data write window                
                -- next state
                hash_control_st_next <= st_sha_data_input;

            when st_sha_data_input =>       -- message data words are clocked into the processor
                -- moore outputs
                di_req <= '1';              -- request message data
                di_wr_window <= '1';        -- enable data write window                
                sch_ce <= wait_run_ce;      -- hold the message scheduler with data hold
                st_cnt_ce <= wait_run_ce;   -- hold state count with data hold
                core_ce <= wait_run_ce;     -- hold processing clock with data hold
                -- next state
                if wait_run_ce = '1' then
                    if end_i = '1' then 
                        hash_control_st_next <= st_sha_padding;     -- pad incomplete blocks
                    elsif st_cnt_reg = 15 then
                        hash_control_st_next <= st_sha_blk_process; -- process one more block
                    end if;
                end if;

            when st_sha_blk_process =>      -- internal block hash processing
                -- moore outputs
                st_cnt_ce <= '1';           -- enable state counter
                sch_ld <= '0';              -- recirculate scheduler data
                sch_ce <= '1';              -- enable message scheduler clock
                core_ce <= '1';             -- enable processing clock
                -- next state
                if st_cnt_reg = 63 then
                    hash_control_st_next <= st_sha_blk_nxt;
                end if;

            when st_sha_blk_nxt =>          -- prepare for next block
                -- moore outputs
                st_cnt_clr <= '1';          -- reset state counter at the beginning of each block
                sch_ce <= '0';              -- stop the message schedule
                core_ld <= '1';             -- load result value into core registers
                core_ce <= '1';             -- latch result value into core registers
                oregs_ce <= '1';            -- latch core result into regs accumulator
                -- next state
                if sha_last_blk_reg = '1' then
                    hash_control_st_next <= st_sha_data_valid;  -- no hmac operation: publish data valid
                elsif padding_reg = '1' then
                    hash_control_st_next <= st_sha_padding;     -- additional padding block
                else
                    hash_control_st_next <= st_sha_data_input;  -- continue requesting input data
                end if;
            
            when st_sha_padding =>          -- padding of bits on the last message block
                -- moore outputs                
                padding_next <= '1';
                if st_cnt_reg = 16 then     -- if word 16, data block was full: proceed to process this block
                    -- process state #16 in this cycle and proceed to process the rest of the block
                    st_cnt_ce <= '1';           -- enable state counter
                    sch_ld <= '0';              -- recirculate scheduler data
                    sch_ce <= '1';              -- enable message scheduler clock
                    core_ce <= '1';             -- enable processing clock
                    -- next state
                    hash_control_st_next <= st_sha_blk_process;
                else                        -- incomplete block: pad words until data block completes
                    sch_ld <= '1';          -- load padded data into scheduler
                    sch_ce <= '1';          -- enable message scheduler clock
                    core_ce <= '1';         -- enable processing clock
                    st_cnt_ce <= '1';       -- enable state counter
                    if st_cnt_reg = 15 then -- pad up to word 15
                        if sha_last_blk_next = '1' then
                            words_sel <= b"10";  -- insert bitlen lo
                        end if;
                        -- next state
                        hash_control_st_next <= st_sha_blk_process;
                    elsif (one_insert = '0') and (st_cnt_reg = 14) then
                        words_sel <= b"01";     -- insert bitlen hi
                        sha_last_blk_next <= '1';   -- mark this as the last block
                    elsif st_cnt_reg = 13 then
                        sha_last_blk_next <= '1';   -- mark this as the last block
                    end if;
                end if;

            when st_sha_data_valid =>       -- process is finished, waiting for begin command
                -- moore outputs
                data_valid <= '1';          -- output results are valid
                -- wait for core reset with 'start'               

            when st_error =>                -- processing or input error: reset with 'reset' = 1
                -- moore outputs
                error_lock <= '1';          -- lock error state
                st_cnt_clr <= '1';          -- clear state counter
                -- wait for core reset with 'start'               

            when others =>                  -- internal state machine error
                -- next state
                hash_control_st_next <= st_error;

        end case; 
    end process control_combi_proc;

    --=============================================================================================
    --  COMBINATIONAL CONTROL LOGIC
    --=============================================================================================

    -- controller RESET signal logic
    sha_reset_combi_proc:   sha_reset <= '1' when start_i = '1'   else '0';
    reset_combi_proc:       reset <= '1'     when sha_reset = '1' else '0';

    -- pad-one flag register
    pad_one_next_combi_proc: process (bytes_ena, sch_ld, pad_one_reg) is
    begin
        -- after one-insertion, clear the pad-one flag register 
        if (bytes_ena /= b"1111") and (sch_ld = '1') then
            pad_one_next <= '0';
        else 
            pad_one_next <= pad_one_reg;
        end if;
    end process pad_one_next_combi_proc;

    -- padding byte lane selectors
    bytes_ena_combi_proc: process (bytes_i, padding_next, di_req, one_insert, end_i) is
    begin
        if di_req = '1' and end_i /= '1' then
            -- accept only full words before last word
            bytes_ena <= b"1111";
        elsif di_req = '1' and end_i = '1' then
            -- user data: bytes controlled by 'bytes_i'
            case bytes_i is
                when b"01"  => bytes_ena <= b"0001";
                when b"10"  => bytes_ena <= b"0011";
                when b"11"  => bytes_ena <= b"0111";
                when others => bytes_ena <= b"1111";
            end case;
        else
            -- no data input: force zero bits valid
            bytes_ena <= b"0000";
        end if;
    end process bytes_ena_combi_proc;

    -- bit counter next logic
    msg_bit_cnt_next_combi_proc: process (bytes_ena, msg_bit_cnt_reg, bits_to_add) is
    begin
        case bytes_ena is
            when b"0001"    => bits_to_add <= to_unsigned( 8, 6);
            when b"0011"    => bits_to_add <= to_unsigned(16, 6);
            when b"0111"    => bits_to_add <= to_unsigned(24, 6);
            when b"1111"    => bits_to_add <= to_unsigned(32, 6);
            when others     => bits_to_add <= to_unsigned( 0, 6);
        end case;
        msg_bit_cnt_next <= msg_bit_cnt_reg + bits_to_add;
    end process msg_bit_cnt_next_combi_proc;

    -- data input wait/run: insert wait states during data input for 'wr_i' = '0'
    wait_run_ce_proc:       wait_run_ce <= '1' when di_req = '1' and wr_i  = '1' else '0';

    -- padding one-insertion control
    one_insert_proc:        one_insert <= '1' when pad_one_reg = '1' else '0';

    -- bit counter clock enable
    msg_bit_cnt_ce_proc :   msg_bit_cnt_ce <= '1' when wait_run_ce = '1' else '0';

    -- state counter next logic
    st_cnt_next_proc:       st_cnt_next <= st_cnt_reg + 1;

    -- bytes_i error logic
    bytes_error_proc:       bytes_error <= '1' when bytes_i /= b"00" and end_i /= '1' and di_req = '1' and wr_i = '1' else '0';

    -- data input error logic
    data_input_error_proc:  data_input_error <= '1' when wr_i = '1' and di_wr_window /= '1' else '0';

    -- error detection logic
    core_error_combi_proc:  core_error <= '1' when error_i = '1' or error_lock = '1' or bytes_error = '1' or data_input_error = '1' else '0';
    
    --=============================================================================================
    --  OUTPUT LOGIC PROCESSES
    --=============================================================================================
    
    bitlen_o_proc :         bitlen_o        <= std_logic_vector(msg_bit_cnt_reg);
    bytes_ena_o_proc :      bytes_ena_o     <= bytes_ena;
    one_insert_o_proc :     one_insert_o    <= one_insert;
    words_sel_o_proc :      words_sel_o     <= words_sel;
    sch_ce_o_proc :         sch_ce_o        <= sch_ce;
    sch_ld_o_proc :         sch_ld_o        <= sch_ld;
    core_ce_o_proc :        core_ce_o       <= core_ce;
    core_ld_o_proc :        core_ld_o       <= core_ld;
    oregs_ce_o_proc :       oregs_ce_o      <= oregs_ce;
    oregs_ld_o_proc :       oregs_ld_o      <= oregs_ld;
    Kt_addr_o_proc :        Kt_addr_o       <= std_logic_vector(st_cnt_reg(5 downto 0));
    di_req_o_proc :         di_req_o        <= di_req;
    data_valid_o_proc :     data_valid_o    <= data_valid;
    error_o_proc :          hash_error_o         <= core_error;
    
end rtl;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.sha256_constants_pkg.all;
 
entity gv_sha256 is
    port (
        -- clock and core enable
        clk_i : in std_logic := 'U';                                    -- input system clock
        ce_i : in std_logic := 'U';                                     -- input core clock enable, this appears to be a pause switch when 0

        -- input data
        di_i : in std_logic_vector (31 downto 0) := (others => 'U');    -- plaintext stream input, input the 32 bit word to hash
									-- accepts word when assert di_wr_i = 1 while di_req_o = 1
        bytes_i : in std_logic_vector (1 downto 0) := (others => 'U');  -- valid bytes in input word, tells the core how many bytes are valid in the last 32 bit word

        -- start/end commands
        start_i : in std_logic := 'U';                                  -- reset the engine and start a new hash
        end_i : in std_logic := 'U';                                    -- marks end of last block data input, marks the end of message or last word, assert when the CURRENT accepted word is the FINAL word

        -- handshake
        di_req_o : out std_logic;                                       -- requests data input for next word
        di_wr_i : in std_logic := 'U';                                  -- high for di_i valid, low for hold, this is for writing a word 
        hash_error_o : out std_logic;                                        -- signalizes error. output data is invalid
        do_valid_o : out std_logic;                                     -- when high, the output is valid, this means that the registers contain the digest

        -- 256bit output registers for digest 256 bit = 8 x 32 bit words
        H0_o : out std_logic_vector (31 downto 0);
        H1_o : out std_logic_vector (31 downto 0);
        H2_o : out std_logic_vector (31 downto 0);
        H3_o : out std_logic_vector (31 downto 0);
        H4_o : out std_logic_vector (31 downto 0);
        H5_o : out std_logic_vector (31 downto 0);
        H6_o : out std_logic_vector (31 downto 0);
        H7_o : out std_logic_vector (31 downto 0)
    );                      
end gv_sha256;
 
architecture rtl of gv_sha256 is
    -- internal register data values
    signal R0_data : std_logic_vector (31 downto 0);
    signal R1_data : std_logic_vector (31 downto 0);
    signal R2_data : std_logic_vector (31 downto 0);
    signal R3_data : std_logic_vector (31 downto 0);
    signal R4_data : std_logic_vector (31 downto 0);
    signal R5_data : std_logic_vector (31 downto 0);
    signal R6_data : std_logic_vector (31 downto 0);
    signal R7_data : std_logic_vector (31 downto 0);
    -- initial hash data values
    signal K0_data : std_logic_vector (31 downto 0);
    signal K1_data : std_logic_vector (31 downto 0);
    signal K2_data : std_logic_vector (31 downto 0);
    signal K3_data : std_logic_vector (31 downto 0);
    signal K4_data : std_logic_vector (31 downto 0);
    signal K5_data : std_logic_vector (31 downto 0);
    signal K6_data : std_logic_vector (31 downto 0);
    signal K7_data : std_logic_vector (31 downto 0);
    -- hash result lookahead port
    signal N0_data : std_logic_vector (31 downto 0);
    signal N1_data : std_logic_vector (31 downto 0);
    signal N2_data : std_logic_vector (31 downto 0);
    signal N3_data : std_logic_vector (31 downto 0);
    signal N4_data : std_logic_vector (31 downto 0);
    signal N5_data : std_logic_vector (31 downto 0);
    signal N6_data : std_logic_vector (31 downto 0);
    signal N7_data : std_logic_vector (31 downto 0);
    -- hash result data
    signal H0_data : std_logic_vector (31 downto 0);
    signal H1_data : std_logic_vector (31 downto 0);
    signal H2_data : std_logic_vector (31 downto 0);
    signal H3_data : std_logic_vector (31 downto 0);
    signal H4_data : std_logic_vector (31 downto 0);
    signal H5_data : std_logic_vector (31 downto 0);
    signal H6_data : std_logic_vector (31 downto 0);
    signal H7_data : std_logic_vector (31 downto 0);
    -- message schedule word datapath
    signal Mi_data : std_logic_vector (31 downto 0);
    signal Wt_data : std_logic_vector (31 downto 0);
    -- coefficients ROMs
    signal Kt_data : std_logic_vector (31 downto 0);
    signal Kt_addr : std_logic_vector (5 downto 0);
    -- padding control
    signal words_sel : std_logic_vector (1 downto 0);
    signal bytes_ena : std_logic_vector (3 downto 0);
    signal one_insert : std_logic;
    signal msg_bitlen : std_logic_vector (63 downto 0);
    signal pad_data : std_logic_vector (31 downto 0);
    -- block mux selectors
    signal sch_ld : std_logic;
    signal core_ld : std_logic;
    signal oregs_ld : std_logic;
    -- block clock enables
    signal sch_ce : std_logic;
    signal core_ce : std_logic;
    signal oregs_ce : std_logic;
    -- output data valid / error
    signal data_valid : std_logic;
    signal error_pad : std_logic;
    signal error_ctrl : std_logic;
begin
    --=============================================================================================
    -- INTERNAL COMPONENT INSTANTIATIONS AND CONNECTIONS
    --=============================================================================================
 
    -- control path core logic
    Inst_sha256_control: entity work.sha256_control(rtl)
        port map(
            -- inputs
            clk_i           => clk_i,
            ce_i            => ce_i,
            bytes_i         => bytes_i,
            wr_i            => di_wr_i,
            start_i         => start_i,
            end_i           => end_i,
            error_i         => error_pad,
            -- output control signals
            bitlen_o        => msg_bitlen,
            words_sel_o     => words_sel,
            Kt_addr_o       => Kt_addr,
            sch_ld_o        => sch_ld,
            core_ld_o       => core_ld,
            oregs_ld_o      => oregs_ld,
            sch_ce_o        => sch_ce,
            core_ce_o       => core_ce,
            oregs_ce_o      => oregs_ce,
            one_insert_o    => one_insert,
            bytes_ena_o     => bytes_ena,
            di_req_o        => di_req_o,
            data_valid_o    => data_valid,
            hash_error_o         => error_ctrl
        );
 
    -- datapath: sha256 byte padding
    Inst_sha256_padding: entity work.sha256_padding(rtl) 
        port map(
            words_sel_i     => words_sel,
            one_insert_i    => one_insert,
            bytes_ena_i     => bytes_ena,
            bitlen_i        => msg_bitlen,
            di_i            => di_i,
            do_o            => Mi_data,
            hash_error_o         => error_pad
        );
 
    -- datapath: sha256 message schedule
    Inst_sha256_msg_sch: entity work.sha256_msg_sch(rtl) 
        port map(
            clk_i => clk_i,
            ce_i  => sch_ce,
            ld_i  => sch_ld,
            M_i   => Mi_data,
            Wt_o  => Wt_data
        );
 
    -- datapath: sha256 core logic
    Inst_sha256_hash_core: entity work.sha256_hash_core(rtl) 
        port map( 
            clk_i => clk_i,
            ce_i  => core_ce,
            ld_i  => core_ld,
            -- initial hash data values 
            A_i => N0_data,
            B_i => N1_data,
            C_i => N2_data,
            D_i => N3_data,
            E_i => N4_data,
            F_i => N5_data,
            G_i => N6_data,
            H_i => N7_data,
            -- block hash values
            A_o => R0_data, 
            B_o => R1_data,
            C_o => R2_data,
            D_o => R3_data,
            E_o => R4_data,
            F_o => R5_data,
            G_o => R6_data,
            H_o => R7_data,
            -- key coefficients 
            Kt_i => Kt_data,
            -- message schedule word input
            Wt_i => Wt_data
        );                      
 
    -- datapath: sha256 output registers
    Inst_sha256_regs: entity work.sha256_regs(rtl)
        port map(  
            clk_i => clk_i,
            ce_i  => oregs_ce,
            ld_i =>  oregs_ld,
            -- register data from the core logic
            A_i => R0_data,
            B_i => R1_data,
            C_i => R2_data,
            D_i => R3_data,
            E_i => R4_data,
            F_i => R5_data,
            G_i => R6_data,
            H_i => R7_data,
            -- initial hash values
            K0_i => K0_data,
            K1_i => K1_data,
            K2_i => K2_data,
            K3_i => K3_data,
            K4_i => K4_data,
            K5_i => K5_data,
            K6_i => K6_data,
            K7_i => K7_data,
            -- lookahead output hash values, one pipeline advanced
            N0_o => N0_data,
            N1_o => N1_data,
            N2_o => N2_data,
            N3_o => N3_data,
            N4_o => N4_data,
            N5_o => N5_data,
            N6_o => N6_data,
            N7_o => N7_data,
            -- output hash values
            H0_o => H0_data,
            H1_o => H1_data,
            H2_o => H2_data,
            H3_o => H3_data,
            H4_o => H4_data,
            H5_o => H5_data,
            H6_o => H6_data,
            H7_o => H7_data 
        );
 
     Kt_data <= SHA256_K_C(to_integer(unsigned(Kt_addr)));

    K0_data <= SHA256_INIT_C(0);
    K1_data <= SHA256_INIT_C(1);
    K2_data <= SHA256_INIT_C(2);
    K3_data <= SHA256_INIT_C(3);
    K4_data <= SHA256_INIT_C(4);
    K5_data <= SHA256_INIT_C(5);
    K6_data <= SHA256_INIT_C(6);
    K7_data <= SHA256_INIT_C(7);

 
    --=============================================================================================
    --  OUTPUTS LOGIC
    --=============================================================================================
 
    error_o_proc:       hash_error_o <= error_ctrl;
    do_valid_o_proc:    do_valid_o <= data_valid;
    H0_o_proc:          H0_o <= H0_data;
    H1_o_proc:          H1_o <= H1_data;
    H2_o_proc:          H2_o <= H2_data;
    H3_o_proc:          H3_o <= H3_data;
    H4_o_proc:          H4_o <= H4_data;
    H5_o_proc:          H5_o <= H5_data;
    H6_o_proc:          H6_o <= H6_data;
    H7_o_proc:          H7_o <= H7_data;
 
end rtl;
