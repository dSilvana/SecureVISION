---------------------------------------------------------------------------------
-- Testbench adapted by Sydney Henninger from code written by engineer: Daniella Li Calzi
-- 
-- Design Name: aes_128_kat_ECBVarTxt_tb
-- Module Name: aaes_128_kat_ECBVarTxt_tb - Behavioral
-- Project Name: SecureVision
-- Target Devices: Zybo Z7-20 SoC
-- Tool Versions: Vivado 2020.2
--
-- Description: This is a testbench adapted from and using aes_decrypt_controller_tb as a base. This now drives the keys and cyphertext for the ECBVarTxt KAT tests and compares the output with the expected hex plaintext value of zero.
-- Most of the logic remains the same from the origional test, but this file stores multiple tests using an array and runs them back to back instead of a single test.
--
-- Dependencies: All AES files that are not testbenches, must right click files in vivado and set all to VHDL 2008 to run the testbenches for some reason.
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- OUTPUT:
-- aes_128_kat_ECBVarTxt_tb.vhd:343:9:@0ms:(report note): Running KeyTest
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@25ns:(report note): Running ECBVarTxt128 COUNT = 0
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@175ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@175ns:(report note): PLAINTEXT_OUT (expected) = 80000000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@175ns:(report note): PLAINTEXT_OUT (actual)   = 80000000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@175ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@175ns:(report note): Running ECBVarTxt128 COUNT = 1
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@325ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@325ns:(report note): PLAINTEXT_OUT (expected) = C0000000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@325ns:(report note): PLAINTEXT_OUT (actual)   = C0000000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@325ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@325ns:(report note): Running ECBVarTxt128 COUNT = 2
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@475ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@475ns:(report note): PLAINTEXT_OUT (expected) = E0000000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@475ns:(report note): PLAINTEXT_OUT (actual)   = E0000000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@475ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@475ns:(report note): Running ECBVarTxt128 COUNT = 3
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@625ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@625ns:(report note): PLAINTEXT_OUT (expected) = F0000000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@625ns:(report note): PLAINTEXT_OUT (actual)   = F0000000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@625ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@625ns:(report note): Running ECBVarTxt128 COUNT = 4
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@775ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@775ns:(report note): PLAINTEXT_OUT (expected) = F8000000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@775ns:(report note): PLAINTEXT_OUT (actual)   = F8000000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@775ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@775ns:(report note): Running ECBVarTxt128 COUNT = 5
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@925ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@925ns:(report note): PLAINTEXT_OUT (expected) = FC000000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@925ns:(report note): PLAINTEXT_OUT (actual)   = FC000000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@925ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@925ns:(report note): Running ECBVarTxt128 COUNT = 6
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@1075ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@1075ns:(report note): PLAINTEXT_OUT (expected) = FE000000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@1075ns:(report note): PLAINTEXT_OUT (actual)   = FE000000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@1075ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@1075ns:(report note): Running ECBVarTxt128 COUNT = 7
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@1225ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@1225ns:(report note): PLAINTEXT_OUT (expected) = FF000000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@1225ns:(report note): PLAINTEXT_OUT (actual)   = FF000000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@1225ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@1225ns:(report note): Running ECBVarTxt128 COUNT = 8
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@1375ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@1375ns:(report note): PLAINTEXT_OUT (expected) = FF800000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@1375ns:(report note): PLAINTEXT_OUT (actual)   = FF800000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@1375ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@1375ns:(report note): Running ECBVarTxt128 COUNT = 9
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@1525ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@1525ns:(report note): PLAINTEXT_OUT (expected) = FFC00000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@1525ns:(report note): PLAINTEXT_OUT (actual)   = FFC00000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@1525ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@1525ns:(report note): Running ECBVarTxt128 COUNT = 10
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@1675ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@1675ns:(report note): PLAINTEXT_OUT (expected) = FFE00000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@1675ns:(report note): PLAINTEXT_OUT (actual)   = FFE00000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@1675ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@1675ns:(report note): Running ECBVarTxt128 COUNT = 11
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@1825ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@1825ns:(report note): PLAINTEXT_OUT (expected) = FFF00000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@1825ns:(report note): PLAINTEXT_OUT (actual)   = FFF00000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@1825ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@1825ns:(report note): Running ECBVarTxt128 COUNT = 12
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@1975ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@1975ns:(report note): PLAINTEXT_OUT (expected) = FFF80000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@1975ns:(report note): PLAINTEXT_OUT (actual)   = FFF80000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@1975ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@1975ns:(report note): Running ECBVarTxt128 COUNT = 13
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@2125ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@2125ns:(report note): PLAINTEXT_OUT (expected) = FFFC0000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@2125ns:(report note): PLAINTEXT_OUT (actual)   = FFFC0000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@2125ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@2125ns:(report note): Running ECBVarTxt128 COUNT = 14
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@2275ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@2275ns:(report note): PLAINTEXT_OUT (expected) = FFFE0000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@2275ns:(report note): PLAINTEXT_OUT (actual)   = FFFE0000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@2275ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@2275ns:(report note): Running ECBVarTxt128 COUNT = 15
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@2425ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@2425ns:(report note): PLAINTEXT_OUT (expected) = FFFF0000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@2425ns:(report note): PLAINTEXT_OUT (actual)   = FFFF0000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@2425ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@2425ns:(report note): Running ECBVarTxt128 COUNT = 16
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@2575ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@2575ns:(report note): PLAINTEXT_OUT (expected) = FFFF8000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@2575ns:(report note): PLAINTEXT_OUT (actual)   = FFFF8000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@2575ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@2575ns:(report note): Running ECBVarTxt128 COUNT = 17
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@2725ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@2725ns:(report note): PLAINTEXT_OUT (expected) = FFFFC000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@2725ns:(report note): PLAINTEXT_OUT (actual)   = FFFFC000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@2725ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@2725ns:(report note): Running ECBVarTxt128 COUNT = 18
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@2875ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@2875ns:(report note): PLAINTEXT_OUT (expected) = FFFFE000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@2875ns:(report note): PLAINTEXT_OUT (actual)   = FFFFE000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@2875ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@2875ns:(report note): Running ECBVarTxt128 COUNT = 19
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@3025ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@3025ns:(report note): PLAINTEXT_OUT (expected) = FFFFF000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@3025ns:(report note): PLAINTEXT_OUT (actual)   = FFFFF000000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@3025ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@3025ns:(report note): Running ECBVarTxt128 COUNT = 20
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@3175ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@3175ns:(report note): PLAINTEXT_OUT (expected) = FFFFF800000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@3175ns:(report note): PLAINTEXT_OUT (actual)   = FFFFF800000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@3175ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@3175ns:(report note): Running ECBVarTxt128 COUNT = 21
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@3325ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@3325ns:(report note): PLAINTEXT_OUT (expected) = FFFFFC00000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@3325ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFC00000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@3325ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@3325ns:(report note): Running ECBVarTxt128 COUNT = 22
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@3475ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@3475ns:(report note): PLAINTEXT_OUT (expected) = FFFFFE00000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@3475ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFE00000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@3475ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@3475ns:(report note): Running ECBVarTxt128 COUNT = 23
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@3625ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@3625ns:(report note): PLAINTEXT_OUT (expected) = FFFFFF00000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@3625ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFF00000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@3625ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@3625ns:(report note): Running ECBVarTxt128 COUNT = 24
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@3775ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@3775ns:(report note): PLAINTEXT_OUT (expected) = FFFFFF80000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@3775ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFF80000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@3775ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@3775ns:(report note): Running ECBVarTxt128 COUNT = 25
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@3925ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@3925ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFC0000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@3925ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFC0000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@3925ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@3925ns:(report note): Running ECBVarTxt128 COUNT = 26
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@4075ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@4075ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFE0000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@4075ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFE0000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@4075ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@4075ns:(report note): Running ECBVarTxt128 COUNT = 27
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@4225ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@4225ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFF0000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@4225ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFF0000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@4225ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@4225ns:(report note): Running ECBVarTxt128 COUNT = 28
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@4375ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@4375ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFF8000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@4375ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFF8000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@4375ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@4375ns:(report note): Running ECBVarTxt128 COUNT = 29
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@4525ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@4525ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFC000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@4525ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFC000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@4525ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@4525ns:(report note): Running ECBVarTxt128 COUNT = 30
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@4675ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@4675ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFE000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@4675ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFE000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@4675ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@4675ns:(report note): Running ECBVarTxt128 COUNT = 31
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@4825ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@4825ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFF000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@4825ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFF000000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@4825ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@4825ns:(report note): Running ECBVarTxt128 COUNT = 32
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@4975ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@4975ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFF800000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@4975ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFF800000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@4975ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@4975ns:(report note): Running ECBVarTxt128 COUNT = 33
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@5125ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@5125ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFC00000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@5125ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFC00000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@5125ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@5125ns:(report note): Running ECBVarTxt128 COUNT = 34
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@5275ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@5275ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFE00000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@5275ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFE00000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@5275ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@5275ns:(report note): Running ECBVarTxt128 COUNT = 35
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@5425ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@5425ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFF00000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@5425ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFF00000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@5425ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@5425ns:(report note): Running ECBVarTxt128 COUNT = 36
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@5575ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@5575ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFF80000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@5575ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFF80000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@5575ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@5575ns:(report note): Running ECBVarTxt128 COUNT = 37
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@5725ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@5725ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFC0000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@5725ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFC0000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@5725ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@5725ns:(report note): Running ECBVarTxt128 COUNT = 38
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@5875ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@5875ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFE0000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@5875ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFE0000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@5875ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@5875ns:(report note): Running ECBVarTxt128 COUNT = 39
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@6025ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@6025ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFF0000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@6025ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFF0000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@6025ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@6025ns:(report note): Running ECBVarTxt128 COUNT = 40
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@6175ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@6175ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFF8000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@6175ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFF8000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@6175ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@6175ns:(report note): Running ECBVarTxt128 COUNT = 41
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@6325ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@6325ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFC000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@6325ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFC000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@6325ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@6325ns:(report note): Running ECBVarTxt128 COUNT = 42
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@6475ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@6475ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFE000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@6475ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFE000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@6475ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@6475ns:(report note): Running ECBVarTxt128 COUNT = 43
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@6625ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@6625ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFF000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@6625ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFF000000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@6625ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@6625ns:(report note): Running ECBVarTxt128 COUNT = 44
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@6775ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@6775ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFF800000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@6775ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFF800000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@6775ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@6775ns:(report note): Running ECBVarTxt128 COUNT = 45
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@6925ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@6925ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFC00000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@6925ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFC00000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@6925ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@6925ns:(report note): Running ECBVarTxt128 COUNT = 46
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@7075ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@7075ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFE00000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@7075ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFE00000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@7075ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@7075ns:(report note): Running ECBVarTxt128 COUNT = 47
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@7225ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@7225ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFF00000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@7225ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFF00000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@7225ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@7225ns:(report note): Running ECBVarTxt128 COUNT = 48
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@7375ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@7375ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFF80000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@7375ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFF80000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@7375ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@7375ns:(report note): Running ECBVarTxt128 COUNT = 49
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@7525ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@7525ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFC0000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@7525ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFC0000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@7525ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@7525ns:(report note): Running ECBVarTxt128 COUNT = 50
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@7675ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@7675ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFE0000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@7675ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFE0000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@7675ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@7675ns:(report note): Running ECBVarTxt128 COUNT = 51
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@7825ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@7825ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFF0000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@7825ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFF0000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@7825ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@7825ns:(report note): Running ECBVarTxt128 COUNT = 52
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@7975ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@7975ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFF8000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@7975ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFF8000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@7975ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@7975ns:(report note): Running ECBVarTxt128 COUNT = 53
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@8125ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@8125ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFC000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@8125ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFC000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@8125ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@8125ns:(report note): Running ECBVarTxt128 COUNT = 54
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@8275ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@8275ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFE000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@8275ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFE000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@8275ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@8275ns:(report note): Running ECBVarTxt128 COUNT = 55
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@8425ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@8425ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFF000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@8425ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFF000000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@8425ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@8425ns:(report note): Running ECBVarTxt128 COUNT = 56
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@8575ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@8575ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFF800000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@8575ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFF800000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@8575ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@8575ns:(report note): Running ECBVarTxt128 COUNT = 57
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@8725ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@8725ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFC00000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@8725ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFC00000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@8725ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@8725ns:(report note): Running ECBVarTxt128 COUNT = 58
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@8875ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@8875ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFE00000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@8875ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFE00000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@8875ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@8875ns:(report note): Running ECBVarTxt128 COUNT = 59
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@9025ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@9025ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFF00000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@9025ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFF00000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@9025ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@9025ns:(report note): Running ECBVarTxt128 COUNT = 60
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@9175ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@9175ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFF80000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@9175ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFF80000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@9175ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@9175ns:(report note): Running ECBVarTxt128 COUNT = 61
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@9325ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@9325ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFC0000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@9325ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFC0000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@9325ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@9325ns:(report note): Running ECBVarTxt128 COUNT = 62
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@9475ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@9475ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFE0000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@9475ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFE0000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@9475ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@9475ns:(report note): Running ECBVarTxt128 COUNT = 63
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@9625ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@9625ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFF0000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@9625ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFF0000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@9625ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@9625ns:(report note): Running ECBVarTxt128 COUNT = 64
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@9775ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@9775ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFF8000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@9775ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFF8000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@9775ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@9775ns:(report note): Running ECBVarTxt128 COUNT = 65
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@9925ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@9925ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFC000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@9925ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFC000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@9925ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@9925ns:(report note): Running ECBVarTxt128 COUNT = 66
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@10075ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@10075ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFE000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@10075ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFE000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@10075ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@10075ns:(report note): Running ECBVarTxt128 COUNT = 67
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@10225ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@10225ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFF000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@10225ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFF000000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@10225ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@10225ns:(report note): Running ECBVarTxt128 COUNT = 68
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@10375ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@10375ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFF800000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@10375ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFF800000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@10375ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@10375ns:(report note): Running ECBVarTxt128 COUNT = 69
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@10525ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@10525ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFC00000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@10525ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFC00000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@10525ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@10525ns:(report note): Running ECBVarTxt128 COUNT = 70
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@10675ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@10675ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFE00000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@10675ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFE00000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@10675ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@10675ns:(report note): Running ECBVarTxt128 COUNT = 71
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@10825ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@10825ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFF00000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@10825ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFF00000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@10825ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@10825ns:(report note): Running ECBVarTxt128 COUNT = 72
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@10975ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@10975ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFF80000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@10975ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFF80000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@10975ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@10975ns:(report note): Running ECBVarTxt128 COUNT = 73
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@11125ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@11125ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFC0000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@11125ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFC0000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@11125ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@11125ns:(report note): Running ECBVarTxt128 COUNT = 74
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@11275ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@11275ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFE0000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@11275ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFE0000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@11275ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@11275ns:(report note): Running ECBVarTxt128 COUNT = 75
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@11425ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@11425ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFF0000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@11425ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFF0000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@11425ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@11425ns:(report note): Running ECBVarTxt128 COUNT = 76
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@11575ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@11575ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFF8000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@11575ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFF8000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@11575ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@11575ns:(report note): Running ECBVarTxt128 COUNT = 77
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@11725ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@11725ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFC000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@11725ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFC000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@11725ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@11725ns:(report note): Running ECBVarTxt128 COUNT = 78
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@11875ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@11875ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFE000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@11875ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFE000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@11875ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@11875ns:(report note): Running ECBVarTxt128 COUNT = 79
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@12025ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@12025ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFF000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@12025ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFF000000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@12025ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@12025ns:(report note): Running ECBVarTxt128 COUNT = 80
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@12175ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@12175ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFF800000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@12175ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFF800000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@12175ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@12175ns:(report note): Running ECBVarTxt128 COUNT = 81
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@12325ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@12325ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFC00000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@12325ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFC00000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@12325ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@12325ns:(report note): Running ECBVarTxt128 COUNT = 82
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@12475ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@12475ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFE00000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@12475ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFE00000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@12475ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@12475ns:(report note): Running ECBVarTxt128 COUNT = 83
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@12625ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@12625ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFF00000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@12625ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFF00000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@12625ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@12625ns:(report note): Running ECBVarTxt128 COUNT = 84
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@12775ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@12775ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFF80000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@12775ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFF80000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@12775ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@12775ns:(report note): Running ECBVarTxt128 COUNT = 85
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@12925ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@12925ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFC0000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@12925ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFC0000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@12925ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@12925ns:(report note): Running ECBVarTxt128 COUNT = 86
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@13075ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@13075ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFE0000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@13075ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFE0000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@13075ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@13075ns:(report note): Running ECBVarTxt128 COUNT = 87
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@13225ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@13225ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFF0000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@13225ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFF0000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@13225ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@13225ns:(report note): Running ECBVarTxt128 COUNT = 88
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@13375ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@13375ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFF8000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@13375ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFF8000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@13375ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@13375ns:(report note): Running ECBVarTxt128 COUNT = 89
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@13525ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@13525ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFC000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@13525ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFC000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@13525ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@13525ns:(report note): Running ECBVarTxt128 COUNT = 90
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@13675ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@13675ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFE000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@13675ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFE000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@13675ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@13675ns:(report note): Running ECBVarTxt128 COUNT = 91
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@13825ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@13825ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFF000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@13825ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFF000000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@13825ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@13825ns:(report note): Running ECBVarTxt128 COUNT = 92
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@13975ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@13975ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFF800000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@13975ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFF800000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@13975ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@13975ns:(report note): Running ECBVarTxt128 COUNT = 93
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@14125ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@14125ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFC00000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@14125ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFC00000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@14125ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@14125ns:(report note): Running ECBVarTxt128 COUNT = 94
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@14275ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@14275ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFE00000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@14275ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFE00000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@14275ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@14275ns:(report note): Running ECBVarTxt128 COUNT = 95
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@14425ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@14425ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFF00000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@14425ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFF00000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@14425ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@14425ns:(report note): Running ECBVarTxt128 COUNT = 96
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@14575ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@14575ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFF80000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@14575ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFF80000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@14575ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@14575ns:(report note): Running ECBVarTxt128 COUNT = 97
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@14725ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@14725ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFC0000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@14725ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFC0000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@14725ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@14725ns:(report note): Running ECBVarTxt128 COUNT = 98
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@14875ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@14875ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFE0000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@14875ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFE0000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@14875ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@14875ns:(report note): Running ECBVarTxt128 COUNT = 99
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@15025ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@15025ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFF0000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@15025ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFF0000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@15025ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@15025ns:(report note): Running ECBVarTxt128 COUNT = 100
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@15175ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@15175ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFF8000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@15175ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFF8000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@15175ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@15175ns:(report note): Running ECBVarTxt128 COUNT = 101
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@15325ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@15325ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFC000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@15325ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFC000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@15325ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@15325ns:(report note): Running ECBVarTxt128 COUNT = 102
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@15475ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@15475ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFE000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@15475ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFE000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@15475ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@15475ns:(report note): Running ECBVarTxt128 COUNT = 103
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@15625ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@15625ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFF000000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@15625ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFF000000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@15625ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@15625ns:(report note): Running ECBVarTxt128 COUNT = 104
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@15775ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@15775ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFF800000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@15775ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFF800000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@15775ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@15775ns:(report note): Running ECBVarTxt128 COUNT = 105
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@15925ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@15925ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFFC00000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@15925ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFFC00000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@15925ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@15925ns:(report note): Running ECBVarTxt128 COUNT = 106
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@16075ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@16075ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFFE00000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@16075ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFFE00000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@16075ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@16075ns:(report note): Running ECBVarTxt128 COUNT = 107
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@16225ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@16225ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFFF00000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@16225ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFFF00000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@16225ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@16225ns:(report note): Running ECBVarTxt128 COUNT = 108
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@16375ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@16375ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFFF80000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@16375ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFFF80000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@16375ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@16375ns:(report note): Running ECBVarTxt128 COUNT = 109
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@16525ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@16525ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFFFC0000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@16525ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFFFC0000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@16525ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@16525ns:(report note): Running ECBVarTxt128 COUNT = 110
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@16675ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@16675ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFFFE0000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@16675ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFFFE0000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@16675ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@16675ns:(report note): Running ECBVarTxt128 COUNT = 111
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@16825ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@16825ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@16825ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@16825ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@16825ns:(report note): Running ECBVarTxt128 COUNT = 112
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@16975ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@16975ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFFFF8000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@16975ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFFFF8000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@16975ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@16975ns:(report note): Running ECBVarTxt128 COUNT = 113
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@17125ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@17125ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFFFFC000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@17125ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFFFFC000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@17125ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@17125ns:(report note): Running ECBVarTxt128 COUNT = 114
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@17275ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@17275ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFFFFE000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@17275ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFFFFE000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@17275ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@17275ns:(report note): Running ECBVarTxt128 COUNT = 115
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@17425ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@17425ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@17425ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@17425ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@17425ns:(report note): Running ECBVarTxt128 COUNT = 116
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@17575ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@17575ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFFFFF800
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@17575ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFFFFF800
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@17575ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@17575ns:(report note): Running ECBVarTxt128 COUNT = 117
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@17725ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@17725ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFFFFFC00
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@17725ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFFFFFC00
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@17725ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@17725ns:(report note): Running ECBVarTxt128 COUNT = 118
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@17875ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@17875ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFFFFFE00
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@17875ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFFFFFE00
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@17875ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@17875ns:(report note): Running ECBVarTxt128 COUNT = 119
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@18025ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@18025ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@18025ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@18025ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@18025ns:(report note): Running ECBVarTxt128 COUNT = 120
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@18175ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@18175ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@18175ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@18175ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@18175ns:(report note): Running ECBVarTxt128 COUNT = 121
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@18325ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@18325ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@18325ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@18325ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@18325ns:(report note): Running ECBVarTxt128 COUNT = 122
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@18475ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@18475ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@18475ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@18475ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@18475ns:(report note): Running ECBVarTxt128 COUNT = 123
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@18625ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@18625ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@18625ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@18625ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@18625ns:(report note): Running ECBVarTxt128 COUNT = 124
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@18775ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@18775ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@18775ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@18775ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@18775ns:(report note): Running ECBVarTxt128 COUNT = 125
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@18925ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@18925ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@18925ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@18925ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@18925ns:(report note): Running ECBVarTxt128 COUNT = 126
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@19075ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@19075ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@19075ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@19075ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarTxt_tb.vhd:359:13:@19075ns:(report note): Running ECBVarTxt128 COUNT = 127
-- aes_128_kat_ECBVarTxt_tb.vhd:379:13:@19225ns:(report note): done decryption
-- aes_128_kat_ECBVarTxt_tb.vhd:381:13:@19225ns:(report note): PLAINTEXT_OUT (expected) = FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
-- aes_128_kat_ECBVarTxt_tb.vhd:382:13:@19225ns:(report note): PLAINTEXT_OUT (actual)   = FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
-- aes_128_kat_ECBVarTxt_tb.vhd:385:17:@19225ns:(report note): Correct plaintext output
---------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.aes_package.all;

-- Renamed entity
entity aes_128_kat_ECBVarTxt_tb is
--  Port ( );
end aes_128_kat_ECBVarTxt_tb;

-- changed name
architecture Behavioral of aes_128_kat_ECBVarTxt_tb is
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal start : STD_LOGIC := '0';
    signal key_ready : STD_LOGIC := '0';
    signal ciphertext_ready : STD_LOGIC := '0';
    signal aes_decrypt_done : STD_LOGIC;
    signal key_in : std_logic_vector(127 downto 0) := (others => '0');
    signal ciphertext_in : STD_LOGIC_VECTOR (127 downto 0) := (others => '0');
    signal plaintext_out : STD_LOGIC_VECTOR (127 downto 0):= (others => '0');

    constant CLK_PERIOD : time := 10 ns;

    -- changed. this will now be updated per-test COUNT inside the process
    signal EXPECTED_PLAINTEXT : std_logic_vector(127 downto 0) :=
        x"00000000000000000000000000000000";

    component aes_decrypt_controller is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC; --active high

           --Control/Flags
           start : in STD_LOGIC;
           key_ready : in STD_LOGIC;
           ciphertext_ready : in STD_LOGIC;
           aes_decrypt_done : out STD_LOGIC;

           key_in : in std_logic_vector(127 downto 0);

           -- Text input and output
           ciphertext_in : in STD_LOGIC_VECTOR (127 downto 0):= (others => '0'); --ciphertext
           plaintext_out : out STD_LOGIC_VECTOR (127 downto 0):= (others => '0')); --plaintext

    end component;


    -- ECBVarTxt128 vectors in arrays

    constant NUM_TESTS : integer := 128;

    type keytest_array_t is array (natural range <>) of std_logic_vector(127 downto 0);
   

    -- ECBVarTxt128: KEY is all zeros for all COUNTs
    constant KEYS : keytest_array_t(0 to NUM_TESTS-1) := (
        others => x"00000000000000000000000000000000"
    );

    -- ECBVarTxt128: CIPHERTEXT list
    constant CIPHERS : keytest_array_t(0 to NUM_TESTS-1) := (
        0   => x"3ad78e726c1ec02b7ebfe92b23d9ec34",
        1   => x"aae5939c8efdf2f04e60b9fe7117b2c2",
        2   => x"f031d4d74f5dcbf39daaf8ca3af6e527",
        3   => x"96d9fd5cc4f07441727df0f33e401a36",
        4   => x"30ccdb044646d7e1f3ccea3dca08b8c0",
        5   => x"16ae4ce5042a67ee8e177b7c587ecc82",
        6   => x"b6da0bb11a23855d9c5cb1b4c6412e0a",
        7   => x"db4f1aa530967d6732ce4715eb0ee24b",
        8   => x"a81738252621dd180a34f3455b4baa2f",
        9   => x"77e2b508db7fd89234caf7939ee5621a",
        10  => x"b8499c251f8442ee13f0933b688fcd19",
        11  => x"965135f8a81f25c9d630b17502f68e53",
        12  => x"8b87145a01ad1c6cede995ea3670454f",
        13  => x"8eae3b10a0c8ca6d1d3b0fa61e56b0b2",
        14  => x"64b4d629810fda6bafdf08f3b0d8d2c5",
        15  => x"d7e5dbd3324595f8fdc7d7c571da6c2a",
        16  => x"f3f72375264e167fca9de2c1527d9606",
        17  => x"8ee79dd4f401ff9b7ea945d86666c13b",
        18  => x"dd35cea2799940b40db3f819cb94c08b",
        19  => x"6941cb6b3e08c2b7afa581ebdd607b87",
        20  => x"2c20f439f6bb097b29b8bd6d99aad799",
        21  => x"625d01f058e565f77ae86378bd2c49b3",
        22  => x"c0b5fd98190ef45fbb4301438d095950",
        23  => x"13001ff5d99806efd25da34f56be854b",
        24  => x"3b594c60f5c8277a5113677f94208d82",
        25  => x"e9c0fc1818e4aa46bd2e39d638f89e05",
        26  => x"f8023ee9c3fdc45a019b4e985c7e1a54",
        27  => x"35f40182ab4662f3023baec1ee796b57",
        28  => x"3aebbad7303649b4194a6945c6cc3694",
        29  => x"a2124bea53ec2834279bed7f7eb0f938",
        30  => x"b9fb4399fa4facc7309e14ec98360b0a",
        31  => x"c26277437420c5d634f715aea81a9132",
        32  => x"171a0e1b2dd424f0e089af2c4c10f32f",
        33  => x"7cadbe402d1b208fe735edce00aee7ce",
        34  => x"43b02ff929a1485af6f5c6d6558baa0f",
        35  => x"092faacc9bf43508bf8fa8613ca75dea",
        36  => x"cb2bf8280f3f9742c7ed513fe802629c",
        37  => x"215a41ee442fa992a6e323986ded3f68",
        38  => x"f21e99cf4f0f77cea836e11a2fe75fb1",
        39  => x"95e3a0ca9079e646331df8b4e70d2cd6",
        40  => x"4afe7f120ce7613f74fc12a01a828073",
        41  => x"827f000e75e2c8b9d479beed913fe678",
        42  => x"35830c8e7aaefe2d30310ef381cbf691",
        43  => x"191aa0f2c8570144f38657ea4085ebe5",
        44  => x"85062c2c909f15d9269b6c18ce99c4f0",
        45  => x"678034dc9e41b5a560ed239eeab1bc78",
        46  => x"c2f93a4ce5ab6d5d56f1b93cf19911c1",
        47  => x"1c3112bcb0c1dcc749d799743691bf82",
        48  => x"00c55bd75c7f9c881989d3ec1911c0d4",
        49  => x"ea2e6b5ef182b7dff3629abd6a12045f",
        50  => x"22322327e01780b17397f24087f8cc6f",
        51  => x"c9cacb5cd11692c373b2411768149ee7",
        52  => x"a18e3dbbca577860dab6b80da3139256",
        53  => x"79b61c37bf328ecca8d743265a3d425c",
        54  => x"d2d99c6bcc1f06fda8e27e8ae3f1ccc7",
        55  => x"1bfd4b91c701fd6b61b7f997829d663b",
        56  => x"11005d52f25f16bdc9545a876a63490a",
        57  => x"3a4d354f02bb5a5e47d39666867f246a",
        58  => x"d451b8d6e1e1a0ebb155fbbf6e7b7dc3",
        59  => x"6898d4f42fa7ba6a10ac05e87b9f2080",
        60  => x"b611295e739ca7d9b50f8e4c0e754a3f",
        61  => x"7d33fc7d8abe3ca1936759f8f5deaf20",
        62  => x"3b5e0f566dc96c298f0c12637539b25c",
        63  => x"f807c3e7985fe0f5a50e2cdb25c5109e",
        64  => x"41f992a856fb278b389a62f5d274d7e9",
        65  => x"10d3ed7a6fe15ab4d91acbc7d0767ab1",
        66  => x"21feecd45b2e675973ac33bf0c5424fc",
        67  => x"1480cb3955ba62d09eea668f7c708817",
        68  => x"66404033d6b72b609354d5496e7eb511",
        69  => x"1c317a220a7d700da2b1e075b00266e1",
        70  => x"ab3b89542233f1271bf8fd0c0f403545",
        71  => x"d93eae966fac46dca927d6b114fa3f9e",
        72  => x"1bdec521316503d9d5ee65df3ea94ddf",
        73  => x"eef456431dea8b4acf83bdae3717f75f",
        74  => x"06f2519a2fafaa596bfef5cfa15c21b9",
        75  => x"251a7eac7e2fe809e4aa8d0d7012531a",
        76  => x"3bffc16e4c49b268a20f8d96a60b4058",
        77  => x"e886f9281999c5bb3b3e8862e2f7c988",
        78  => x"563bf90d61beef39f48dd625fcef1361",
        79  => x"4d37c850644563c69fd0acd9a049325b",
        80  => x"b87c921b91829ef3b13ca541ee1130a6",
        81  => x"2e65eb6b6ea383e109accce8326b0393",
        82  => x"9ca547f7439edc3e255c0f4d49aa8990",
        83  => x"a5e652614c9300f37816b1f9fd0c87f9",
        84  => x"14954f0b4697776f44494fe458d814ed",
        85  => x"7c8d9ab6c2761723fe42f8bb506cbcf7",
        86  => x"db7e1932679fdd99742aab04aa0d5a80",
        87  => x"4c6a1c83e568cd10f27c2d73ded19c28",
        88  => x"90ecbe6177e674c98de412413f7ac915",
        89  => x"90684a2ac55fe1ec2b8ebd5622520b73",
        90  => x"7472f9a7988607ca79707795991035e6",
        91  => x"56aff089878bf3352f8df172a3ae47d8",
        92  => x"65c0526cbe40161b8019a2a3171abd23",
        93  => x"377be0be33b4e3e310b4aabda173f84f",
        94  => x"9402e9aa6f69de6504da8d20c4fcaa2f",
        95  => x"123c1f4af313ad8c2ce648b2e71fb6e1",
        96  => x"1ffc626d30203dcdb0019fb80f726cf4",
        97  => x"76da1fbe3a50728c50fd2e621b5ad885",
        98  => x"082eb8be35f442fb52668e16a591d1d6",
        99  => x"e656f9ecf5fe27ec3e4a73d00c282fb3",
        100 => x"2ca8209d63274cd9a29bb74bcd77683a",
        101 => x"79bf5dce14bb7dd73a8e3611de7ce026",
        102 => x"3c849939a5d29399f344c4a0eca8a576",
        103 => x"ed3c0a94d59bece98835da7aa4f07ca2",
        104 => x"63919ed4ce10196438b6ad09d99cd795",
        105 => x"7678f3a833f19fea95f3c6029e2bc610",
        106 => x"3aa426831067d36b92be7c5f81c13c56",
        107 => x"9272e2d2cdd11050998c845077a30ea0",
        108 => x"088c4b53f5ec0ff814c19adae7f6246c",
        109 => x"4010a5e401fdf0a0354ddbcc0d012b17",
        110 => x"a87a385736c0a6189bd6589bd8445a93",
        111 => x"545f2b83d9616dccf60fa9830e9cd287",
        112 => x"4b706f7f92406352394037a6d4f4688d",
        113 => x"b7972b3941c44b90afa7b264bfba7387",
        114 => x"6f45732cf10881546f0fd23896d2bb60",
        115 => x"2e3579ca15af27f64b3c955a5bfc30ba",
        116 => x"34a2c5a91ae2aec99b7d1b5fa6780447",
        117 => x"a4d6616bd04f87335b0e53351227a9ee",
        118 => x"7f692b03945867d16179a8cefc83ea3f",
        119 => x"3bd141ee84a0e6414a26e7a4f281f8a2",
        120 => x"d1788f572d98b2b16ec5d5f3922b99bc",
        121 => x"0833ff6f61d98a57b288e8c3586b85a6",
        122 => x"8568261797de176bf0b43becc6285afb",
        123 => x"f9b0fda0c4a898f5b9e6f661c4ce4d07",
        124 => x"8ade895913685c67c5269f8aae42983e",
        125 => x"39bde67d5c8ed8a8b1c37eb8fa9f5ac0",
        126 => x"5c005e72c1418c44f569f2ea33ba54f3",
        127 => x"3f5b8cc9ea855a0afa7347d23e8d664e"
    );

    -- ECBVarTxt128: PLAINTEXT list
    constant PLAINTEXTS : keytest_array_t(0 to NUM_TESTS-1) := (
        0   => x"80000000000000000000000000000000",
        1   => x"c0000000000000000000000000000000",
        2   => x"e0000000000000000000000000000000",
        3   => x"f0000000000000000000000000000000",
        4   => x"f8000000000000000000000000000000",
        5   => x"fc000000000000000000000000000000",
        6   => x"fe000000000000000000000000000000",
        7   => x"ff000000000000000000000000000000",
        8   => x"ff800000000000000000000000000000",
        9   => x"ffc00000000000000000000000000000",
        10  => x"ffe00000000000000000000000000000",
        11  => x"fff00000000000000000000000000000",
        12  => x"fff80000000000000000000000000000",
        13  => x"fffc0000000000000000000000000000",
        14  => x"fffe0000000000000000000000000000",
        15  => x"ffff0000000000000000000000000000",
        16  => x"ffff8000000000000000000000000000",
        17  => x"ffffc000000000000000000000000000",
        18  => x"ffffe000000000000000000000000000",
        19  => x"fffff000000000000000000000000000",
        20  => x"fffff800000000000000000000000000",
        21  => x"fffffc00000000000000000000000000",
        22  => x"fffffe00000000000000000000000000",
        23  => x"ffffff00000000000000000000000000",
        24  => x"ffffff80000000000000000000000000",
        25  => x"ffffffc0000000000000000000000000",
        26  => x"ffffffe0000000000000000000000000",
        27  => x"fffffff0000000000000000000000000",
        28  => x"fffffff8000000000000000000000000",
        29  => x"fffffffc000000000000000000000000",
        30  => x"fffffffe000000000000000000000000",
        31  => x"ffffffff000000000000000000000000",
        32  => x"ffffffff800000000000000000000000",
        33  => x"ffffffffc00000000000000000000000",
        34  => x"ffffffffe00000000000000000000000",
        35  => x"fffffffff00000000000000000000000",
        36  => x"fffffffff80000000000000000000000",
        37  => x"fffffffffc0000000000000000000000",
        38  => x"fffffffffe0000000000000000000000",
        39  => x"ffffffffff0000000000000000000000",
        40  => x"ffffffffff8000000000000000000000",
        41  => x"ffffffffffc000000000000000000000",
        42  => x"ffffffffffe000000000000000000000",
        43  => x"fffffffffff000000000000000000000",
        44  => x"fffffffffff800000000000000000000",
        45  => x"fffffffffffc00000000000000000000",
        46  => x"fffffffffffe00000000000000000000",
        47  => x"ffffffffffff00000000000000000000",
        48  => x"ffffffffffff80000000000000000000",
        49  => x"ffffffffffffc0000000000000000000",
        50  => x"ffffffffffffe0000000000000000000",
        51  => x"fffffffffffff0000000000000000000",
        52  => x"fffffffffffff8000000000000000000",
        53  => x"fffffffffffffc000000000000000000",
        54  => x"fffffffffffffe000000000000000000",
        55  => x"ffffffffffffff000000000000000000",
        56  => x"ffffffffffffff800000000000000000",
        57  => x"ffffffffffffffc00000000000000000",
        58  => x"ffffffffffffffe00000000000000000",
        59  => x"fffffffffffffff00000000000000000",
        60  => x"fffffffffffffff80000000000000000",
        61  => x"fffffffffffffffc0000000000000000",
        62  => x"fffffffffffffffe0000000000000000",
        63  => x"ffffffffffffffff0000000000000000",
        64  => x"ffffffffffffffff8000000000000000",
        65  => x"ffffffffffffffffc000000000000000",
        66  => x"ffffffffffffffffe000000000000000",
        67  => x"fffffffffffffffff000000000000000",
        68  => x"fffffffffffffffff800000000000000",
        69  => x"fffffffffffffffffc00000000000000",
        70  => x"fffffffffffffffffe00000000000000",
        71  => x"ffffffffffffffffff00000000000000",
        72  => x"ffffffffffffffffff80000000000000",
        73  => x"ffffffffffffffffffc0000000000000",
        74  => x"ffffffffffffffffffe0000000000000",
        75  => x"fffffffffffffffffff0000000000000",
        76  => x"fffffffffffffffffff8000000000000",
        77  => x"fffffffffffffffffffc000000000000",
        78  => x"fffffffffffffffffffe000000000000",
        79  => x"ffffffffffffffffffff000000000000",
        80  => x"ffffffffffffffffffff800000000000",
        81  => x"ffffffffffffffffffffc00000000000",
        82  => x"ffffffffffffffffffffe00000000000",
        83  => x"fffffffffffffffffffff00000000000",
        84  => x"fffffffffffffffffffff80000000000",
        85  => x"fffffffffffffffffffffc0000000000",
        86  => x"fffffffffffffffffffffe0000000000",
        87  => x"ffffffffffffffffffffff0000000000",
        88  => x"ffffffffffffffffffffff8000000000",
        89  => x"ffffffffffffffffffffffc000000000",
        90  => x"ffffffffffffffffffffffe000000000",
        91  => x"fffffffffffffffffffffff000000000",
        92  => x"fffffffffffffffffffffff800000000",
        93  => x"fffffffffffffffffffffffc00000000",
        94  => x"fffffffffffffffffffffffe00000000",
        95  => x"ffffffffffffffffffffffff00000000",
        96  => x"ffffffffffffffffffffffff80000000",
        97  => x"ffffffffffffffffffffffffc0000000",
        98  => x"ffffffffffffffffffffffffe0000000",
        99  => x"fffffffffffffffffffffffff0000000",
        100 => x"fffffffffffffffffffffffff8000000",
        101 => x"fffffffffffffffffffffffffc000000",
        102 => x"fffffffffffffffffffffffffe000000",
        103 => x"ffffffffffffffffffffffffff000000",
        104 => x"ffffffffffffffffffffffffff800000",
        105 => x"ffffffffffffffffffffffffffc00000",
        106 => x"ffffffffffffffffffffffffffe00000",
        107 => x"fffffffffffffffffffffffffff00000",
        108 => x"fffffffffffffffffffffffffff80000",
        109 => x"fffffffffffffffffffffffffffc0000",
        110 => x"fffffffffffffffffffffffffffe0000",
        111 => x"ffffffffffffffffffffffffffff0000",
        112 => x"ffffffffffffffffffffffffffff8000",
        113 => x"ffffffffffffffffffffffffffffc000",
        114 => x"ffffffffffffffffffffffffffffe000",
        115 => x"fffffffffffffffffffffffffffff000",
        116 => x"fffffffffffffffffffffffffffff800",
        117 => x"fffffffffffffffffffffffffffffc00",
        118 => x"fffffffffffffffffffffffffffffe00",
        119 => x"ffffffffffffffffffffffffffffff00",
        120 => x"ffffffffffffffffffffffffffffff80",
        121 => x"ffffffffffffffffffffffffffffffc0",
        122 => x"ffffffffffffffffffffffffffffffe0",
        123 => x"fffffffffffffffffffffffffffffff0",
        124 => x"fffffffffffffffffffffffffffffff8",
        125 => x"fffffffffffffffffffffffffffffffc",
        126 => x"fffffffffffffffffffffffffffffffe",
        127 => x"ffffffffffffffffffffffffffffffff"
    );

begin
    clk <= not clk after CLK_PERIOD / 2;

    uut : entity work.aes_decrypt_controller
        port map (
           clk => clk,
           reset => reset,
           start => start,
           key_ready => key_ready,
           ciphertext_ready => ciphertext_ready,
           aes_decrypt_done => aes_decrypt_done,
           key_in => key_in,
           ciphertext_in => ciphertext_in,
           plaintext_out => plaintext_out
        );

    stim : process
    begin

        report "Running KeyTest";

        -- Changed to Initialize / global reset once at start
        wait until rising_edge(clk);
        reset <= '1';

        start <= '0';
        key_ready <= '0';
        ciphertext_ready <= '0';
        wait until rising_edge(clk);

        reset <= '0';
        wait until rising_edge(clk);

        -- Runs tests loops through arrays and prints results
        for i in 0 to NUM_TESTS-1 loop
            report "Running ECBVarTxt128 COUNT = " & integer'image(i);

            key_in <= KEYS(i);
            ciphertext_in <= CIPHERS(i);
            EXPECTED_PLAINTEXT <= PLAINTEXTS(i);

            wait until rising_edge(clk);
            start <= '1';
            ciphertext_ready <= '1';
            wait until rising_edge(clk);

            key_ready <= '1';
            wait until rising_edge(clk);

            start <= '0';
            ciphertext_ready <= '0';
            key_ready <= '0';
            wait until rising_edge(clk);

            wait until aes_decrypt_done = '1';
            report "done decryption";

            report "PLAINTEXT_OUT (expected) = " & to_hstring(EXPECTED_PLAINTEXT);
            report "PLAINTEXT_OUT (actual)   = " & to_hstring(plaintext_out);

            if plaintext_out = EXPECTED_PLAINTEXT then
                report "Correct plaintext output";
            else
                report "Wrong plaintext output";
            end if;
        end loop;

        -- End
        wait;
    end process;
end Behavioral;
