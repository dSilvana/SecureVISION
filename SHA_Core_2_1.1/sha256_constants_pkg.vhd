--------------------------------------------------------
-- Combined the Ki and Kt modules into a package
--------------------------------------------------------
-- 
-- Author:          Jonny Doin, jdoin@opencores.org, jonnydoin@gmail.com, jonnydoin@gridvortex.com
-- 
-- Create Date:     09:56:30 05/06/2016  
-- Module Name:     sha256_kt_rom - RTL
-- Project Name:    sha256 processor
-- Target Devices:  Spartan-6
-- Tool versions:   ISE 14.7
-- Description: 
--
--      This is the 64 words coefficients rom for the block hash core.f
--      It is modelled as an asynchronous addressable ROM memory.
--      Depending on the fabrication process and technology, this memory can be implemented
--      as a OTP, a MUX, a fixed LUT or a combinational function.
--
-----------------------------------------------------------------------------------------------------------------------
-- Author:          Jonny Doin, jdoin@opencores.org, jonnydoin@gmail.com, jonnydoin@gridvortex.com
-- 
-- Create Date:     09:56:30 05/06/2016  
-- Module Name:     sha256_Ki_rom
-- Project Name:    sha256 processor
-- Target Devices:  Spartan-6
-- Tool versions:   ISE 14.7
-- Description: 
--
--      Initial values for the hash result registers.
--      This module is modelled as a fixed value function.
--      It can be implemented as a local constant fixed value.
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
--
-----------------------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package sha256_constants_pkg is

    -- Added shared 32-bit word type for SHA-256 constants
    subtype sha256_word_t is std_logic_vector(31 downto 0);

    -- Added array type for the 8 initial SHA-256 hash constants
    type sha256_init_array_t is array (0 to 7) of sha256_word_t;

    -- Added array type for the 64 SHA-256 round constants
    type sha256_k_array_t is array (0 to 63) of sha256_word_t;

    --=============================================================================================
    -- CONSTANTS FOR Ki VALUES
    --=============================================================================================
    constant SHA256_INIT_C : sha256_init_array_t := (
        0 => x"6A09E667",
        1 => x"BB67AE85",
        2 => x"3C6EF372",
        3 => x"A54FF53A",
        4 => x"510E527F",
        5 => x"9B05688C",
        6 => x"1F83D9AB",
        7 => x"5BE0CD19"
    );

    --=============================================================================================
    -- COEFFICIENTS SHA-256 round constants from kt_rom
    --=============================================================================================

    constant SHA256_K_C : sha256_k_array_t := (
         0 => x"428a2f98",
         1 => x"71374491",
         2 => x"b5c0fbcf",
         3 => x"e9b5dba5",
         4 => x"3956c25b",
         5 => x"59f111f1",
         6 => x"923f82a4",
         7 => x"ab1c5ed5",
         8 => x"d807aa98",
         9 => x"12835b01",
        10 => x"243185be",
        11 => x"550c7dc3",
        12 => x"72be5d74",
        13 => x"80deb1fe",
        14 => x"9bdc06a7",
        15 => x"c19bf174",
        16 => x"e49b69c1",
        17 => x"efbe4786",
        18 => x"0fc19dc6",
        19 => x"240ca1cc",
        20 => x"2de92c6f",
        21 => x"4a7484aa",
        22 => x"5cb0a9dc",
        23 => x"76f988da",
        24 => x"983e5152",
        25 => x"a831c66d",
        26 => x"b00327c8",
        27 => x"bf597fc7",
        28 => x"c6e00bf3",
        29 => x"d5a79147",
        30 => x"06ca6351",
        31 => x"14292967",
        32 => x"27b70a85",
        33 => x"2e1b2138",
        34 => x"4d2c6dfc",
        35 => x"53380d13",
        36 => x"650a7354",
        37 => x"766a0abb",
        38 => x"81c2c92e",
        39 => x"92722c85",
        40 => x"a2bfe8a1",
        41 => x"a81a664b",
        42 => x"c24b8b70",
        43 => x"c76c51a3",
        44 => x"d192e819",
        45 => x"d6990624",
        46 => x"f40e3585",
        47 => x"106aa070",
        48 => x"19a4c116",
        49 => x"1e376c08",
        50 => x"2748774c",
        51 => x"34b0bcb5",
        52 => x"391c0cb3",
        53 => x"4ed8aa4a",
        54 => x"5b9cca4f",
        55 => x"682e6ff3",
        56 => x"748f82ee",
        57 => x"78a5636f",
        58 => x"84c87814",
        59 => x"8cc70208",
        60 => x"90befffa",
        61 => x"a4506ceb",
        62 => x"bef9a3f7",
        63 => x"c67178f2"
    );

end package;

package body sha256_constants_pkg is
end package body;