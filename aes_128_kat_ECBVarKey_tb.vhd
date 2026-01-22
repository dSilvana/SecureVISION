----------------------------------------------------------------------------------
-- Testbench adapted by Sydney Henninger from code written by engineer: Daniella Li Calzi
-- 
-- Design Name: aes_128_kat_ECBVarKey_tb
-- Module Name: aaes_128_kat_ECBVarKey_tb - Behavioral
-- Project Name: SecureVision
-- Target Devices: Zybo Z7-20 SoC
-- Tool Versions: Vivado 2020.2
--
-- Description: This is a testbench adapted from and using aes_decrypt_controller_tb as a base. This now drives the keys and cyphertext for the ECBVarKey KAT tests and compares the output with the expected hex plaintext value of zero.
-- Most of the logic remains the same from the origional test, but this file stores multiple tests using an array and runs them back to back instead of a single test.
--
-- Dependencies: All AES files that are not testbenches, must right click files in vivado and set all to VHDL 2008 to run the testbenches for some reason.
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
-- OUTPUT:
-- aes_128_kat_ECBVarKey_tb.vhd:338:9:@0ms:(report note): Running KeyTest
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@25ns:(report note): Running KeySbox COUNT = 0
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@175ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@175ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@175ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@175ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@175ns:(report note): Running KeySbox COUNT = 1
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@325ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@325ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@325ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@325ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@325ns:(report note): Running KeySbox COUNT = 2
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@475ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@475ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@475ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@475ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@475ns:(report note): Running KeySbox COUNT = 3
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@625ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@625ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@625ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@625ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@625ns:(report note): Running KeySbox COUNT = 4
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@775ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@775ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@775ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@775ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@775ns:(report note): Running KeySbox COUNT = 5
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@925ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@925ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@925ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@925ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@925ns:(report note): Running KeySbox COUNT = 6
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@1075ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@1075ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@1075ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@1075ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@1075ns:(report note): Running KeySbox COUNT = 7
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@1225ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@1225ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@1225ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@1225ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@1225ns:(report note): Running KeySbox COUNT = 8
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@1375ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@1375ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@1375ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@1375ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@1375ns:(report note): Running KeySbox COUNT = 9
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@1525ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@1525ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@1525ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@1525ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@1525ns:(report note): Running KeySbox COUNT = 10
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@1675ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@1675ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@1675ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@1675ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@1675ns:(report note): Running KeySbox COUNT = 11
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@1825ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@1825ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@1825ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@1825ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@1825ns:(report note): Running KeySbox COUNT = 12
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@1975ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@1975ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@1975ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@1975ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@1975ns:(report note): Running KeySbox COUNT = 13
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@2125ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@2125ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@2125ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@2125ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@2125ns:(report note): Running KeySbox COUNT = 14
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@2275ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@2275ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@2275ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@2275ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@2275ns:(report note): Running KeySbox COUNT = 15
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@2425ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@2425ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@2425ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@2425ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@2425ns:(report note): Running KeySbox COUNT = 16
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@2575ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@2575ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@2575ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@2575ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@2575ns:(report note): Running KeySbox COUNT = 17
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@2725ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@2725ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@2725ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@2725ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@2725ns:(report note): Running KeySbox COUNT = 18
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@2875ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@2875ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@2875ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@2875ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@2875ns:(report note): Running KeySbox COUNT = 19
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@3025ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@3025ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@3025ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@3025ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@3025ns:(report note): Running KeySbox COUNT = 20
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@3175ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@3175ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@3175ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@3175ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@3175ns:(report note): Running KeySbox COUNT = 21
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@3325ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@3325ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@3325ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@3325ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@3325ns:(report note): Running KeySbox COUNT = 22
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@3475ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@3475ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@3475ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@3475ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@3475ns:(report note): Running KeySbox COUNT = 23
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@3625ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@3625ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@3625ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@3625ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@3625ns:(report note): Running KeySbox COUNT = 24
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@3775ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@3775ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@3775ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@3775ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@3775ns:(report note): Running KeySbox COUNT = 25
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@3925ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@3925ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@3925ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@3925ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@3925ns:(report note): Running KeySbox COUNT = 26
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@4075ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@4075ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@4075ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@4075ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@4075ns:(report note): Running KeySbox COUNT = 27
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@4225ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@4225ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@4225ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@4225ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@4225ns:(report note): Running KeySbox COUNT = 28
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@4375ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@4375ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@4375ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@4375ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@4375ns:(report note): Running KeySbox COUNT = 29
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@4525ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@4525ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@4525ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@4525ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@4525ns:(report note): Running KeySbox COUNT = 30
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@4675ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@4675ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@4675ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@4675ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@4675ns:(report note): Running KeySbox COUNT = 31
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@4825ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@4825ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@4825ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@4825ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@4825ns:(report note): Running KeySbox COUNT = 32
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@4975ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@4975ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@4975ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@4975ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@4975ns:(report note): Running KeySbox COUNT = 33
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@5125ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@5125ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@5125ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@5125ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@5125ns:(report note): Running KeySbox COUNT = 34
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@5275ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@5275ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@5275ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@5275ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@5275ns:(report note): Running KeySbox COUNT = 35
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@5425ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@5425ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@5425ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@5425ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@5425ns:(report note): Running KeySbox COUNT = 36
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@5575ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@5575ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@5575ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@5575ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@5575ns:(report note): Running KeySbox COUNT = 37
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@5725ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@5725ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@5725ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@5725ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@5725ns:(report note): Running KeySbox COUNT = 38
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@5875ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@5875ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@5875ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@5875ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@5875ns:(report note): Running KeySbox COUNT = 39
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@6025ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@6025ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@6025ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@6025ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@6025ns:(report note): Running KeySbox COUNT = 40
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@6175ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@6175ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@6175ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@6175ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@6175ns:(report note): Running KeySbox COUNT = 41
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@6325ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@6325ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@6325ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@6325ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@6325ns:(report note): Running KeySbox COUNT = 42
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@6475ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@6475ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@6475ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@6475ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@6475ns:(report note): Running KeySbox COUNT = 43
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@6625ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@6625ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@6625ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@6625ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@6625ns:(report note): Running KeySbox COUNT = 44
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@6775ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@6775ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@6775ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@6775ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@6775ns:(report note): Running KeySbox COUNT = 45
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@6925ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@6925ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@6925ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@6925ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@6925ns:(report note): Running KeySbox COUNT = 46
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@7075ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@7075ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@7075ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@7075ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@7075ns:(report note): Running KeySbox COUNT = 47
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@7225ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@7225ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@7225ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@7225ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@7225ns:(report note): Running KeySbox COUNT = 48
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@7375ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@7375ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@7375ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@7375ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@7375ns:(report note): Running KeySbox COUNT = 49
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@7525ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@7525ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@7525ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@7525ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@7525ns:(report note): Running KeySbox COUNT = 50
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@7675ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@7675ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@7675ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@7675ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@7675ns:(report note): Running KeySbox COUNT = 51
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@7825ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@7825ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@7825ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@7825ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@7825ns:(report note): Running KeySbox COUNT = 52
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@7975ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@7975ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@7975ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@7975ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@7975ns:(report note): Running KeySbox COUNT = 53
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@8125ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@8125ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@8125ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@8125ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@8125ns:(report note): Running KeySbox COUNT = 54
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@8275ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@8275ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@8275ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@8275ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@8275ns:(report note): Running KeySbox COUNT = 55
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@8425ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@8425ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@8425ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@8425ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@8425ns:(report note): Running KeySbox COUNT = 56
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@8575ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@8575ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@8575ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@8575ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@8575ns:(report note): Running KeySbox COUNT = 57
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@8725ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@8725ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@8725ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@8725ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@8725ns:(report note): Running KeySbox COUNT = 58
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@8875ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@8875ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@8875ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@8875ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@8875ns:(report note): Running KeySbox COUNT = 59
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@9025ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@9025ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@9025ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@9025ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@9025ns:(report note): Running KeySbox COUNT = 60
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@9175ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@9175ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@9175ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@9175ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@9175ns:(report note): Running KeySbox COUNT = 61
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@9325ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@9325ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@9325ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@9325ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@9325ns:(report note): Running KeySbox COUNT = 62
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@9475ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@9475ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@9475ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@9475ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@9475ns:(report note): Running KeySbox COUNT = 63
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@9625ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@9625ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@9625ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@9625ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@9625ns:(report note): Running KeySbox COUNT = 64
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@9775ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@9775ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@9775ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@9775ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@9775ns:(report note): Running KeySbox COUNT = 65
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@9925ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@9925ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@9925ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@9925ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@9925ns:(report note): Running KeySbox COUNT = 66
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@10075ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@10075ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@10075ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@10075ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@10075ns:(report note): Running KeySbox COUNT = 67
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@10225ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@10225ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@10225ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@10225ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@10225ns:(report note): Running KeySbox COUNT = 68
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@10375ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@10375ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@10375ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@10375ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@10375ns:(report note): Running KeySbox COUNT = 69
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@10525ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@10525ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@10525ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@10525ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@10525ns:(report note): Running KeySbox COUNT = 70
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@10675ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@10675ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@10675ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@10675ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@10675ns:(report note): Running KeySbox COUNT = 71
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@10825ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@10825ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@10825ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@10825ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@10825ns:(report note): Running KeySbox COUNT = 72
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@10975ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@10975ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@10975ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@10975ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@10975ns:(report note): Running KeySbox COUNT = 73
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@11125ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@11125ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@11125ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@11125ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@11125ns:(report note): Running KeySbox COUNT = 74
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@11275ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@11275ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@11275ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@11275ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@11275ns:(report note): Running KeySbox COUNT = 75
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@11425ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@11425ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@11425ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@11425ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@11425ns:(report note): Running KeySbox COUNT = 76
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@11575ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@11575ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@11575ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@11575ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@11575ns:(report note): Running KeySbox COUNT = 77
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@11725ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@11725ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@11725ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@11725ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@11725ns:(report note): Running KeySbox COUNT = 78
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@11875ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@11875ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@11875ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@11875ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@11875ns:(report note): Running KeySbox COUNT = 79
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@12025ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@12025ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@12025ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@12025ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@12025ns:(report note): Running KeySbox COUNT = 80
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@12175ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@12175ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@12175ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@12175ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@12175ns:(report note): Running KeySbox COUNT = 81
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@12325ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@12325ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@12325ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@12325ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@12325ns:(report note): Running KeySbox COUNT = 82
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@12475ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@12475ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@12475ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@12475ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@12475ns:(report note): Running KeySbox COUNT = 83
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@12625ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@12625ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@12625ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@12625ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@12625ns:(report note): Running KeySbox COUNT = 84
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@12775ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@12775ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@12775ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@12775ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@12775ns:(report note): Running KeySbox COUNT = 85
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@12925ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@12925ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@12925ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@12925ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@12925ns:(report note): Running KeySbox COUNT = 86
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@13075ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@13075ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@13075ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@13075ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@13075ns:(report note): Running KeySbox COUNT = 87
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@13225ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@13225ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@13225ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@13225ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@13225ns:(report note): Running KeySbox COUNT = 88
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@13375ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@13375ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@13375ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@13375ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@13375ns:(report note): Running KeySbox COUNT = 89
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@13525ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@13525ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@13525ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@13525ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@13525ns:(report note): Running KeySbox COUNT = 90
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@13675ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@13675ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@13675ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@13675ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@13675ns:(report note): Running KeySbox COUNT = 91
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@13825ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@13825ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@13825ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@13825ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@13825ns:(report note): Running KeySbox COUNT = 92
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@13975ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@13975ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@13975ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@13975ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@13975ns:(report note): Running KeySbox COUNT = 93
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@14125ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@14125ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@14125ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@14125ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@14125ns:(report note): Running KeySbox COUNT = 94
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@14275ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@14275ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@14275ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@14275ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@14275ns:(report note): Running KeySbox COUNT = 95
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@14425ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@14425ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@14425ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@14425ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@14425ns:(report note): Running KeySbox COUNT = 96
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@14575ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@14575ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@14575ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@14575ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@14575ns:(report note): Running KeySbox COUNT = 97
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@14725ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@14725ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@14725ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@14725ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@14725ns:(report note): Running KeySbox COUNT = 98
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@14875ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@14875ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@14875ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@14875ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@14875ns:(report note): Running KeySbox COUNT = 99
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@15025ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@15025ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@15025ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@15025ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@15025ns:(report note): Running KeySbox COUNT = 100
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@15175ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@15175ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@15175ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@15175ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@15175ns:(report note): Running KeySbox COUNT = 101
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@15325ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@15325ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@15325ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@15325ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@15325ns:(report note): Running KeySbox COUNT = 102
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@15475ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@15475ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@15475ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@15475ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@15475ns:(report note): Running KeySbox COUNT = 103
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@15625ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@15625ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@15625ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@15625ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@15625ns:(report note): Running KeySbox COUNT = 104
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@15775ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@15775ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@15775ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@15775ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@15775ns:(report note): Running KeySbox COUNT = 105
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@15925ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@15925ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@15925ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@15925ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@15925ns:(report note): Running KeySbox COUNT = 106
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@16075ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@16075ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@16075ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@16075ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@16075ns:(report note): Running KeySbox COUNT = 107
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@16225ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@16225ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@16225ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@16225ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@16225ns:(report note): Running KeySbox COUNT = 108
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@16375ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@16375ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@16375ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@16375ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@16375ns:(report note): Running KeySbox COUNT = 109
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@16525ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@16525ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@16525ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@16525ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@16525ns:(report note): Running KeySbox COUNT = 110
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@16675ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@16675ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@16675ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@16675ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@16675ns:(report note): Running KeySbox COUNT = 111
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@16825ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@16825ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@16825ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@16825ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@16825ns:(report note): Running KeySbox COUNT = 112
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@16975ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@16975ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@16975ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@16975ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@16975ns:(report note): Running KeySbox COUNT = 113
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@17125ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@17125ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@17125ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@17125ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@17125ns:(report note): Running KeySbox COUNT = 114
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@17275ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@17275ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@17275ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@17275ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@17275ns:(report note): Running KeySbox COUNT = 115
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@17425ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@17425ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@17425ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@17425ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@17425ns:(report note): Running KeySbox COUNT = 116
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@17575ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@17575ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@17575ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@17575ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@17575ns:(report note): Running KeySbox COUNT = 117
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@17725ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@17725ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@17725ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@17725ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@17725ns:(report note): Running KeySbox COUNT = 118
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@17875ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@17875ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@17875ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@17875ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@17875ns:(report note): Running KeySbox COUNT = 119
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@18025ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@18025ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@18025ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@18025ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@18025ns:(report note): Running KeySbox COUNT = 120
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@18175ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@18175ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@18175ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@18175ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@18175ns:(report note): Running KeySbox COUNT = 121
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@18325ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@18325ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@18325ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@18325ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@18325ns:(report note): Running KeySbox COUNT = 122
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@18475ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@18475ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@18475ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@18475ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@18475ns:(report note): Running KeySbox COUNT = 123
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@18625ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@18625ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@18625ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@18625ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@18625ns:(report note): Running KeySbox COUNT = 124
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@18775ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@18775ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@18775ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@18775ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@18775ns:(report note): Running KeySbox COUNT = 125
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@18925ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@18925ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@18925ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@18925ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@18925ns:(report note): Running KeySbox COUNT = 126
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@19075ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@19075ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@19075ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@19075ns:(report note): Correct plaintext output
-- aes_128_kat_ECBVarKey_tb.vhd:354:13:@19075ns:(report note): Running KeySbox COUNT = 127
-- aes_128_kat_ECBVarKey_tb.vhd:374:13:@19225ns:(report note): done decryption
-- aes_128_kat_ECBVarKey_tb.vhd:376:13:@19225ns:(report note): PLAINTEXT_OUT (expected) = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:377:13:@19225ns:(report note): PLAINTEXT_OUT (actual)   = 00000000000000000000000000000000
-- aes_128_kat_ECBVarKey_tb.vhd:380:17:@19225ns:(report note): Correct plaintext output
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.aes_package.all;

-- Renamed entity
entity aes_128_kat_ECBVarKey_tb is
--  Port ( );
end aes_128_kat_ECBVarKey_tb;

-- changed name
architecture Behavioral of aes_128_kat_ECBVarKey_tb is
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

    -- changed. this will now be updated per-test (COUNT) inside the process
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


    -- CAT vectors in arrays

    constant NUM_TESTS : integer := 128;

    type keytest_array_t is array (natural range <>) of std_logic_vector(127 downto 0);
    constant ZERO128 : std_logic_vector(127 downto 0) := x"00000000000000000000000000000000";

    constant KEYS : keytest_array_t(0 to NUM_TESTS-1) := (
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

    constant CIPHERS : keytest_array_t(0 to NUM_TESTS-1) := (
        0   => x"0edd33d3c621e546455bd8ba1418bec8",
        1   => x"4bc3f883450c113c64ca42e1112a9e87",
        2   => x"72a1da770f5d7ac4c9ef94d822affd97",
        3   => x"970014d634e2b7650777e8e84d03ccd8",
        4   => x"f17e79aed0db7e279e955b5f493875a7",
        5   => x"9ed5a75136a940d0963da379db4af26a",
        6   => x"c4295f83465c7755e8fa364bac6a7ea5",
        7   => x"b1d758256b28fd850ad4944208cf1155",
        8   => x"42ffb34c743de4d88ca38011c990890b",
        9   => x"9958f0ecea8b2172c0c1995f9182c0f3",
        10  => x"956d7798fac20f82a8823f984d06f7f5",
        11  => x"a01bf44f2d16be928ca44aaf7b9b106b",
        12  => x"b5f1a33e50d40d103764c76bd4c6b6f8",
        13  => x"2637050c9fc0d4817e2d69de878aee8d",
        14  => x"113ecbe4a453269a0dd26069467fb5b5",
        15  => x"97d0754fe68f11b9e375d070a608c884",
        16  => x"c6a0b3e998d05068a5399778405200b4",
        17  => x"df556a33438db87bc41b1752c55e5e49",
        18  => x"90fb128d3a1af6e548521bb962bf1f05",
        19  => x"26298e9c1db517c215fadfb7d2a8d691",
        20  => x"a6cb761d61f8292d0df393a279ad0380",
        21  => x"12acd89b13cd5f8726e34d44fd486108",
        22  => x"95b1703fc57ba09fe0c3580febdd7ed4",
        23  => x"de11722d893e9f9121c381becc1da59a",
        24  => x"6d114ccb27bf391012e8974c546d9bf2",
        25  => x"5ce37e17eb4646ecfac29b9cc38d9340",
        26  => x"18c1b6e2157122056d0243d8a165cddb",
        27  => x"99693e6a59d1366c74d823562d7e1431",
        28  => x"6c7c64dc84a8bba758ed17eb025a57e3",
        29  => x"e17bc79f30eaab2fac2cbbe3458d687a",
        30  => x"1114bc2028009b923f0b01915ce5e7c4",
        31  => x"9c28524a16a1e1c1452971caa8d13476",
        32  => x"ed62e16363638360fdd6ad62112794f0",
        33  => x"5a8688f0b2a2c16224c161658ffd4044",
        34  => x"23f710842b9bb9c32f26648c786807ca",
        35  => x"44a98bf11e163f632c47ec6a49683a89",
        36  => x"0f18aff94274696d9b61848bd50ac5e5",
        37  => x"82408571c3e2424540207f833b6dda69",
        38  => x"303ff996947f0c7d1f43c8f3027b9b75",
        39  => x"7df4daf4ad29a3615a9b6ece5c99518a",
        40  => x"c72954a48d0774db0b4971c526260415",
        41  => x"1df9b76112dc6531e07d2cfda04411f0",
        42  => x"8e4d8e699119e1fc87545a647fb1d34f",
        43  => x"e6c4807ae11f36f091c57d9fb68548d1",
        44  => x"8ebf73aad49c82007f77a5c1ccec6ab4",
        45  => x"4fb288cc2040049001d2c7585ad123fc",
        46  => x"04497110efb9dceb13e2b13fb4465564",
        47  => x"75550e6cb5a88e49634c9ab69eda0430",
        48  => x"b6768473ce9843ea66a81405dd50b345",
        49  => x"cb2f430383f9084e03a653571e065de6",
        50  => x"ff4e66c07bae3e79fb7d210847a3b0ba",
        51  => x"7b90785125505fad59b13c186dd66ce3",
        52  => x"8b527a6aebdaec9eaef8eda2cb7783e5",
        53  => x"43fdaf53ebbc9880c228617d6a9b548b",
        54  => x"53786104b9744b98f052c46f1c850d0b",
        55  => x"b5ab3013dd1e61df06cbaf34ca2aee78",
        56  => x"7470469be9723030fdcc73a8cd4fbb10",
        57  => x"a35a63f5343ebe9ef8167bcb48ad122e",
        58  => x"fd8687f0757a210e9fdf181204c30863",
        59  => x"7a181e84bd5457d26a88fbae96018fb0",
        60  => x"653317b9362b6f9b9e1a580e68d494b5",
        61  => x"995c9dc0b689f03c45867b5faa5c18d1",
        62  => x"77a4d96d56dda398b9aabecfc75729fd",
        63  => x"84be19e053635f09f2665e7bae85b42d",
        64  => x"32cd652842926aea4aa6137bb2be2b5e",
        65  => x"493d4a4f38ebb337d10aa84e9171a554",
        66  => x"d9bff7ff454b0ec5a4a2a69566e2cb84",
        67  => x"3535d565ace3f31eb249ba2cc6765d7a",
        68  => x"f60e91fc3269eecf3231c6e9945697c6",
        69  => x"ab69cfadf51f8e604d9cc37182f6635a",
        70  => x"7866373f24a0b6ed56e0d96fcdafb877",
        71  => x"1ea448c2aac954f5d812e9d78494446a",
        72  => x"acc5599dd8ac02239a0fef4a36dd1668",
        73  => x"d8764468bb103828cf7e1473ce895073",
        74  => x"1b0d02893683b9f180458e4aa6b73982",
        75  => x"96d9b017d302df410a937dcdb8bb6e43",
        76  => x"ef1623cc44313cff440b1594a7e21cc6",
        77  => x"284ca2fa35807b8b0ae4d19e11d7dbd7",
        78  => x"f2e976875755f9401d54f36e2a23a594",
        79  => x"ec198a18e10e532403b7e20887c8dd80",
        80  => x"545d50ebd919e4a6949d96ad47e46a80",
        81  => x"dbdfb527060e0a71009c7bb0c68f1d44",
        82  => x"9cfa1322ea33da2173a024f2ff0d896d",
        83  => x"8785b1a75b0f3bd958dcd0e29318c521",
        84  => x"38f67b9e98e4a97b6df030a9fcdd0104",
        85  => x"192afffb2c880e82b05926d0fc6c448b",
        86  => x"6a7980ce7b105cf530952d74daaf798c",
        87  => x"ea3695e1351b9d6858bd958cf513ef6c",
        88  => x"6da0490ba0ba0343b935681d2cce5ba1",
        89  => x"f0ea23af08534011c60009ab29ada2f1",
        90  => x"ff13806cf19cc38721554d7c0fcdcd4b",
        91  => x"6838af1f4f69bae9d85dd188dcdf0688",
        92  => x"36cf44c92d550bfb1ed28ef583ddf5d7",
        93  => x"d06e3195b5376f109d5c4ec6c5d62ced",
        94  => x"c440de014d3d610707279b13242a5c36",
        95  => x"f0c5c6ffa5e0bd3a94c88f6b6f7c16b9",
        96  => x"3e40c3901cd7effc22bffc35dee0b4d9",
        97  => x"b63305c72bedfab97382c406d0c49bc6",
        98  => x"36bbaab22a6bd4925a99a2b408d2dbae",
        99  => x"307c5b8fcd0533ab98bc51e27a6ce461",
        100 => x"829c04ff4c07513c0b3ef05c03e337b5",
        101 => x"f17af0e895dda5eb98efc68066e84c54",
        102 => x"277167f3812afff1ffacb4a934379fc3",
        103 => x"2cb1dc3a9c72972e425ae2ef3eb597cd",
        104 => x"36aeaa3a213e968d4b5b679d3a2c97fe",
        105 => x"9241daca4fdd034a82372db50e1a0f3f",
        106 => x"c14574d9cd00cf2b5a7f77e53cd57885",
        107 => x"793de39236570aba83ab9b737cb521c9",
        108 => x"16591c0f27d60e29b85a96c33861a7ef",
        109 => x"44fb5c4d4f5cb79be5c174a3b1c97348",
        110 => x"674d2b61633d162be59dde04222f4740",
        111 => x"b4750ff263a65e1f9e924ccfd98f3e37",
        112 => x"62d0662d6eaeddedebae7f7ea3a4f6b6",
        113 => x"70c46bb30692be657f7eaa93ebad9897",
        114 => x"323994cfb9da285a5d9642e1759b224a",
        115 => x"1dbf57877b7b17385c85d0b54851e371",
        116 => x"dfa5c097cdc1532ac071d57b1d28d1bd",
        117 => x"3a0c53fa37311fc10bd2a9981f513174",
        118 => x"ba4f970c0a25c41814bdae2e506be3b4",
        119 => x"2dce3acb727cd13ccd76d425ea56e4f6",
        120 => x"5160474d504b9b3eefb68d35f245f4b3",
        121 => x"41a8a947766635dec37553d9a6c0cbb7",
        122 => x"25d6cfe6881f2bf497dd14cd4ddf445b",
        123 => x"41c78c135ed9e98c096640647265da1e",
        124 => x"5a4d404d8917e353e92a21072c3b2305",
        125 => x"02bc96846b3fdc71643f384cd3cc3eaf",
        126 => x"9ba4a9143f4e5d4048521c4f8877d88e",
        127 => x"a1f6258c877d5fcd8964484538bfc92c"
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

        -- Runs CAT tests loops through arrays and prints results
        for i in 0 to NUM_TESTS-1 loop
            report "Running KeySbox COUNT = " & integer'image(i);

            key_in <= KEYS(i);
            ciphertext_in <= CIPHERS(i);
            EXPECTED_PLAINTEXT <= ZERO128;

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
