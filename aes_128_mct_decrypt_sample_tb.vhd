-------------------------------------------------------------------------------------------------------------------
-- Author: SecureVision Team 14
--
-- This testbench tests the 100 sample MCT test vectors distributed by NIST
-- Checks for correctness using MCT vectors without using a full implementation of the MCT algorithm
--
-- OUTPUT:
-- aes_128_mct_decrypt_sample_tb.vhd:368:5:@0ms:(report note): Running Monte Carlo DECRYPT set
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@25ns:(report note): Running MCT DECRYPT COUNT = 0
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@160025ns:(report note): done COUNT = 0
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@160025ns:(report note): PLAINTEXT_OUT (expected) = B613B87085FED1BB87F07A574E6D2879
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@160025ns:(report note): PLAINTEXT_OUT (actual)   = B613B87085FED1BB87F07A574E6D2879
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@160025ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@160035ns:(report note): Running MCT DECRYPT COUNT = 1
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@320035ns:(report note): done COUNT = 1
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@320035ns:(report note): PLAINTEXT_OUT (expected) = 5541D7BF6D25C55C0C2296ACBA756E9E
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@320035ns:(report note): PLAINTEXT_OUT (actual)   = 5541D7BF6D25C55C0C2296ACBA756E9E
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@320035ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@320045ns:(report note): Running MCT DECRYPT COUNT = 2
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@480045ns:(report note): done COUNT = 2
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@480045ns:(report note): PLAINTEXT_OUT (expected) = 4C138198D55D0D87D43CDB92FB0B5FC0
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@480045ns:(report note): PLAINTEXT_OUT (actual)   = 4C138198D55D0D87D43CDB92FB0B5FC0
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@480045ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@480055ns:(report note): Running MCT DECRYPT COUNT = 3
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@640055ns:(report note): done COUNT = 3
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@640055ns:(report note): PLAINTEXT_OUT (expected) = 257C07BDCBA57AFF1643DE90B63C0A88
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@640055ns:(report note): PLAINTEXT_OUT (actual)   = 257C07BDCBA57AFF1643DE90B63C0A88
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@640055ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@640065ns:(report note): Running MCT DECRYPT COUNT = 4
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@800065ns:(report note): done COUNT = 4
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@800065ns:(report note): PLAINTEXT_OUT (expected) = 8039BE4E65D218D3E640F88309D01C6F
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@800065ns:(report note): PLAINTEXT_OUT (actual)   = 8039BE4E65D218D3E640F88309D01C6F
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@800065ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@800075ns:(report note): Running MCT DECRYPT COUNT = 5
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@960075ns:(report note): done COUNT = 5
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@960075ns:(report note): PLAINTEXT_OUT (expected) = 0115DCD390855BF5CE32E946A6D5AD38
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@960075ns:(report note): PLAINTEXT_OUT (actual)   = 0115DCD390855BF5CE32E946A6D5AD38
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@960075ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@960085ns:(report note): Running MCT DECRYPT COUNT = 6
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@1120085ns:(report note): done COUNT = 6
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@1120085ns:(report note): PLAINTEXT_OUT (expected) = 71741CCB723348C7F3F9E4A397977BDB
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@1120085ns:(report note): PLAINTEXT_OUT (actual)   = 71741CCB723348C7F3F9E4A397977BDB
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@1120085ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@1120095ns:(report note): Running MCT DECRYPT COUNT = 7
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@1280095ns:(report note): done COUNT = 7
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@1280095ns:(report note): PLAINTEXT_OUT (expected) = 668C9F3DC9E154BD16D61364A99F635D
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@1280095ns:(report note): PLAINTEXT_OUT (actual)   = 668C9F3DC9E154BD16D61364A99F635D
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@1280095ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@1280105ns:(report note): Running MCT DECRYPT COUNT = 8
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@1440105ns:(report note): done COUNT = 8
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@1440105ns:(report note): PLAINTEXT_OUT (expected) = 124B19B2501A540066DDF7943417CBA3
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@1440105ns:(report note): PLAINTEXT_OUT (actual)   = 124B19B2501A540066DDF7943417CBA3
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@1440105ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@1440115ns:(report note): Running MCT DECRYPT COUNT = 9
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@1600115ns:(report note): done COUNT = 9
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@1600115ns:(report note): PLAINTEXT_OUT (expected) = 23E7C95F7ED9017AF339C234B7A8FCC4
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@1600115ns:(report note): PLAINTEXT_OUT (actual)   = 23E7C95F7ED9017AF339C234B7A8FCC4
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@1600115ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@1600125ns:(report note): Running MCT DECRYPT COUNT = 10
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@1760125ns:(report note): done COUNT = 10
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@1760125ns:(report note): PLAINTEXT_OUT (expected) = 7B0E1E1AFE46C1E50785EFB939F8ADE3
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@1760125ns:(report note): PLAINTEXT_OUT (actual)   = 7B0E1E1AFE46C1E50785EFB939F8ADE3
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@1760125ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@1760135ns:(report note): Running MCT DECRYPT COUNT = 11
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@1920135ns:(report note): done COUNT = 11
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@1920135ns:(report note): PLAINTEXT_OUT (expected) = C166AEEBF5182C96D1F3C92CECE9D714
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@1920135ns:(report note): PLAINTEXT_OUT (actual)   = C166AEEBF5182C96D1F3C92CECE9D714
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@1920135ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@1920145ns:(report note): Running MCT DECRYPT COUNT = 12
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@2080145ns:(report note): done COUNT = 12
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@2080145ns:(report note): PLAINTEXT_OUT (expected) = 71968762DC1B41BEBD9EE8B2396B87BE
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@2080145ns:(report note): PLAINTEXT_OUT (actual)   = 71968762DC1B41BEBD9EE8B2396B87BE
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@2080145ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@2080155ns:(report note): Running MCT DECRYPT COUNT = 13
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@2240155ns:(report note): done COUNT = 13
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@2240155ns:(report note): PLAINTEXT_OUT (expected) = 77B0AA88222A785282352BB861EA0CD2
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@2240155ns:(report note): PLAINTEXT_OUT (actual)   = 77B0AA88222A785282352BB861EA0CD2
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@2240155ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@2240165ns:(report note): Running MCT DECRYPT COUNT = 14
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@2400165ns:(report note): done COUNT = 14
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@2400165ns:(report note): PLAINTEXT_OUT (expected) = E65C461CBA6957FE5B5EE5014C899E65
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@2400165ns:(report note): PLAINTEXT_OUT (actual)   = E65C461CBA6957FE5B5EE5014C899E65
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@2400165ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@2400175ns:(report note): Running MCT DECRYPT COUNT = 15
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@2560175ns:(report note): done COUNT = 15
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@2560175ns:(report note): PLAINTEXT_OUT (expected) = A799870CEE001551F3494BDF3C27BD94
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@2560175ns:(report note): PLAINTEXT_OUT (actual)   = A799870CEE001551F3494BDF3C27BD94
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@2560175ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@2560185ns:(report note): Running MCT DECRYPT COUNT = 16
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@2720185ns:(report note): done COUNT = 16
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@2720185ns:(report note): PLAINTEXT_OUT (expected) = F54697576153F97D9FB1A4D164A8538E
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@2720185ns:(report note): PLAINTEXT_OUT (actual)   = F54697576153F97D9FB1A4D164A8538E
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@2720185ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@2720195ns:(report note): Running MCT DECRYPT COUNT = 17
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@2880195ns:(report note): done COUNT = 17
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@2880195ns:(report note): PLAINTEXT_OUT (expected) = F3F1F964B98B3498898C3032E44A308C
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@2880195ns:(report note): PLAINTEXT_OUT (actual)   = F3F1F964B98B3498898C3032E44A308C
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@2880195ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@2880205ns:(report note): Running MCT DECRYPT COUNT = 18
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@3040205ns:(report note): done COUNT = 18
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@3040205ns:(report note): PLAINTEXT_OUT (expected) = 40CCC3A26141900280A3A7B62D4ED8B6
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@3040205ns:(report note): PLAINTEXT_OUT (actual)   = 40CCC3A26141900280A3A7B62D4ED8B6
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@3040205ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@3040215ns:(report note): Running MCT DECRYPT COUNT = 19
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@3200215ns:(report note): done COUNT = 19
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@3200215ns:(report note): PLAINTEXT_OUT (expected) = 7FCF64BD75808BE6199F3FAC0881D4D4
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@3200215ns:(report note): PLAINTEXT_OUT (actual)   = 7FCF64BD75808BE6199F3FAC0881D4D4
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@3200215ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@3200225ns:(report note): Running MCT DECRYPT COUNT = 20
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@3360225ns:(report note): done COUNT = 20
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@3360225ns:(report note): PLAINTEXT_OUT (expected) = 11CA970C169315FF0B54ECDB00BA4547
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@3360225ns:(report note): PLAINTEXT_OUT (actual)   = 11CA970C169315FF0B54ECDB00BA4547
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@3360225ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@3360235ns:(report note): Running MCT DECRYPT COUNT = 21
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@3520235ns:(report note): done COUNT = 21
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@3520235ns:(report note): PLAINTEXT_OUT (expected) = BC02615754B58EB975C26190A3583D28
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@3520235ns:(report note): PLAINTEXT_OUT (actual)   = BC02615754B58EB975C26190A3583D28
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@3520235ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@3520245ns:(report note): Running MCT DECRYPT COUNT = 22
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@3680245ns:(report note): done COUNT = 22
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@3680245ns:(report note): PLAINTEXT_OUT (expected) = 5B12925C7F72AAAFBAE6834A6E9D5AF9
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@3680245ns:(report note): PLAINTEXT_OUT (actual)   = 5B12925C7F72AAAFBAE6834A6E9D5AF9
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@3680245ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@3680255ns:(report note): Running MCT DECRYPT COUNT = 23
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@3840255ns:(report note): done COUNT = 23
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@3840255ns:(report note): PLAINTEXT_OUT (expected) = 7950FFE2537235BFAA38101C2A9E6D42
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@3840255ns:(report note): PLAINTEXT_OUT (actual)   = 7950FFE2537235BFAA38101C2A9E6D42
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@3840255ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@3840265ns:(report note): Running MCT DECRYPT COUNT = 24
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@4000265ns:(report note): done COUNT = 24
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@4000265ns:(report note): PLAINTEXT_OUT (expected) = CDF5C997D8DDCC1DE7CC47ECC47D0819
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@4000265ns:(report note): PLAINTEXT_OUT (actual)   = CDF5C997D8DDCC1DE7CC47ECC47D0819
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@4000265ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@4000275ns:(report note): Running MCT DECRYPT COUNT = 25
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@4160275ns:(report note): done COUNT = 25
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@4160275ns:(report note): PLAINTEXT_OUT (expected) = 8F4D77BCCC4858016B28C2E8F84DD9A3
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@4160275ns:(report note): PLAINTEXT_OUT (actual)   = 8F4D77BCCC4858016B28C2E8F84DD9A3
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@4160275ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@4160285ns:(report note): Running MCT DECRYPT COUNT = 26
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@4320285ns:(report note): done COUNT = 26
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@4320285ns:(report note): PLAINTEXT_OUT (expected) = 561D95847869CCCC81DF7DF65D70808D
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@4320285ns:(report note): PLAINTEXT_OUT (actual)   = 561D95847869CCCC81DF7DF65D70808D
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@4320285ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@4320295ns:(report note): Running MCT DECRYPT COUNT = 27
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@4480295ns:(report note): done COUNT = 27
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@4480295ns:(report note): PLAINTEXT_OUT (expected) = 17B9E6F86EC1CFF22CC6F8E14072BB0F
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@4480295ns:(report note): PLAINTEXT_OUT (actual)   = 17B9E6F86EC1CFF22CC6F8E14072BB0F
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@4480295ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@4480305ns:(report note): Running MCT DECRYPT COUNT = 28
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@4640305ns:(report note): done COUNT = 28
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@4640305ns:(report note): PLAINTEXT_OUT (expected) = 8F959F24FAE93418C2262EC73C6C8E1D
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@4640305ns:(report note): PLAINTEXT_OUT (actual)   = 8F959F24FAE93418C2262EC73C6C8E1D
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@4640305ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@4640315ns:(report note): Running MCT DECRYPT COUNT = 29
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@4800315ns:(report note): done COUNT = 29
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@4800315ns:(report note): PLAINTEXT_OUT (expected) = 2876F3A90B7A60168869D9DE1E455836
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@4800315ns:(report note): PLAINTEXT_OUT (actual)   = 2876F3A90B7A60168869D9DE1E455836
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@4800315ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@4800325ns:(report note): Running MCT DECRYPT COUNT = 30
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@4960325ns:(report note): done COUNT = 30
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@4960325ns:(report note): PLAINTEXT_OUT (expected) = 5C609C0ACDF2E389F19B3E0657706C9C
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@4960325ns:(report note): PLAINTEXT_OUT (actual)   = 5C609C0ACDF2E389F19B3E0657706C9C
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@4960325ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@4960335ns:(report note): Running MCT DECRYPT COUNT = 31
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@5120335ns:(report note): done COUNT = 31
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@5120335ns:(report note): PLAINTEXT_OUT (expected) = 88F537F67481490D20B713FF48B079E5
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@5120335ns:(report note): PLAINTEXT_OUT (actual)   = 88F537F67481490D20B713FF48B079E5
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@5120335ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@5120345ns:(report note): Running MCT DECRYPT COUNT = 32
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@5280345ns:(report note): done COUNT = 32
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@5280345ns:(report note): PLAINTEXT_OUT (expected) = 0B1878FC9406B6C5F2C0085E8C9E0DD9
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@5280345ns:(report note): PLAINTEXT_OUT (actual)   = 0B1878FC9406B6C5F2C0085E8C9E0DD9
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@5280345ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@5280355ns:(report note): Running MCT DECRYPT COUNT = 33
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@5440355ns:(report note): done COUNT = 33
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@5440355ns:(report note): PLAINTEXT_OUT (expected) = 594B9DF3BAD040AFA14E63298945068D
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@5440355ns:(report note): PLAINTEXT_OUT (actual)   = 594B9DF3BAD040AFA14E63298945068D
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@5440355ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@5440365ns:(report note): Running MCT DECRYPT COUNT = 34
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@5600365ns:(report note): done COUNT = 34
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@5600365ns:(report note): PLAINTEXT_OUT (expected) = FCF5FFAFACC372E641B1520FE76D16C7
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@5600365ns:(report note): PLAINTEXT_OUT (actual)   = FCF5FFAFACC372E641B1520FE76D16C7
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@5600365ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@5600375ns:(report note): Running MCT DECRYPT COUNT = 35
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@5760375ns:(report note): done COUNT = 35
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@5760375ns:(report note): PLAINTEXT_OUT (expected) = 67319B7AB394937244B93977BA06C1EE
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@5760375ns:(report note): PLAINTEXT_OUT (actual)   = 67319B7AB394937244B93977BA06C1EE
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@5760375ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@5760385ns:(report note): Running MCT DECRYPT COUNT = 36
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@5920385ns:(report note): done COUNT = 36
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@5920385ns:(report note): PLAINTEXT_OUT (expected) = D956A31188A667EEA44C93582D6AED6F
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@5920385ns:(report note): PLAINTEXT_OUT (actual)   = D956A31188A667EEA44C93582D6AED6F
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@5920385ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@5920395ns:(report note): Running MCT DECRYPT COUNT = 37
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@6080395ns:(report note): done COUNT = 37
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@6080395ns:(report note): PLAINTEXT_OUT (expected) = 04F18289308787F3D936DD2A45C49E22
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@6080395ns:(report note): PLAINTEXT_OUT (actual)   = 04F18289308787F3D936DD2A45C49E22
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@6080395ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@6080405ns:(report note): Running MCT DECRYPT COUNT = 38
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@6240405ns:(report note): done COUNT = 38
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@6240405ns:(report note): PLAINTEXT_OUT (expected) = C925DF60F455B0E27852EFCF9FDDC3D0
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@6240405ns:(report note): PLAINTEXT_OUT (actual)   = C925DF60F455B0E27852EFCF9FDDC3D0
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@6240405ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@6240415ns:(report note): Running MCT DECRYPT COUNT = 39
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@6400415ns:(report note): done COUNT = 39
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@6400415ns:(report note): PLAINTEXT_OUT (expected) = 14C3BCF83483DE973D975DBF249C505E
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@6400415ns:(report note): PLAINTEXT_OUT (actual)   = 14C3BCF83483DE973D975DBF249C505E
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@6400415ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@6400425ns:(report note): Running MCT DECRYPT COUNT = 40
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@6560425ns:(report note): done COUNT = 40
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@6560425ns:(report note): PLAINTEXT_OUT (expected) = A5F3F4AFD0D01B9F4999D27E6386E925
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@6560425ns:(report note): PLAINTEXT_OUT (actual)   = A5F3F4AFD0D01B9F4999D27E6386E925
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@6560425ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@6560435ns:(report note): Running MCT DECRYPT COUNT = 41
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@6720435ns:(report note): done COUNT = 41
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@6720435ns:(report note): PLAINTEXT_OUT (expected) = D94451374478C1BDB4B94EB6908A205E
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@6720435ns:(report note): PLAINTEXT_OUT (actual)   = D94451374478C1BDB4B94EB6908A205E
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@6720435ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@6720445ns:(report note): Running MCT DECRYPT COUNT = 42
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@6880445ns:(report note): done COUNT = 42
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@6880445ns:(report note): PLAINTEXT_OUT (expected) = 9F3C6ED40A32C89D4EE8D4B87C8298C7
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@6880445ns:(report note): PLAINTEXT_OUT (actual)   = 9F3C6ED40A32C89D4EE8D4B87C8298C7
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@6880445ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@6880455ns:(report note): Running MCT DECRYPT COUNT = 43
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@7040455ns:(report note): done COUNT = 43
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@7040455ns:(report note): PLAINTEXT_OUT (expected) = 54AA57CF75650CF6B7CCBD7202469BF7
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@7040455ns:(report note): PLAINTEXT_OUT (actual)   = 54AA57CF75650CF6B7CCBD7202469BF7
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@7040455ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@7040465ns:(report note): Running MCT DECRYPT COUNT = 44
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@7200465ns:(report note): done COUNT = 44
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@7200465ns:(report note): PLAINTEXT_OUT (expected) = 11BC0BE20465848934C0FD7D7CED8BD1
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@7200465ns:(report note): PLAINTEXT_OUT (actual)   = 11BC0BE20465848934C0FD7D7CED8BD1
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@7200465ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@7200475ns:(report note): Running MCT DECRYPT COUNT = 45
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@7360475ns:(report note): done COUNT = 45
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@7360475ns:(report note): PLAINTEXT_OUT (expected) = 69D48F1CA39977F1C05F8CABD5F7E4AC
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@7360475ns:(report note): PLAINTEXT_OUT (actual)   = 69D48F1CA39977F1C05F8CABD5F7E4AC
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@7360475ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@7360485ns:(report note): Running MCT DECRYPT COUNT = 46
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@7520485ns:(report note): done COUNT = 46
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@7520485ns:(report note): PLAINTEXT_OUT (expected) = 2E447E6121162382C182B3EFB27B2D5A
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@7520485ns:(report note): PLAINTEXT_OUT (actual)   = 2E447E6121162382C182B3EFB27B2D5A
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@7520485ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@7520495ns:(report note): Running MCT DECRYPT COUNT = 47
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@7680495ns:(report note): done COUNT = 47
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@7680495ns:(report note): PLAINTEXT_OUT (expected) = 3D99D0DFF0891C38BEC01551B4040E55
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@7680495ns:(report note): PLAINTEXT_OUT (actual)   = 3D99D0DFF0891C38BEC01551B4040E55
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@7680495ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@7680505ns:(report note): Running MCT DECRYPT COUNT = 48
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@7840505ns:(report note): done COUNT = 48
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@7840505ns:(report note): PLAINTEXT_OUT (expected) = 92294BA363ED5B750C066CB6708620EE
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@7840505ns:(report note): PLAINTEXT_OUT (actual)   = 92294BA363ED5B750C066CB6708620EE
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@7840505ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@7840515ns:(report note): Running MCT DECRYPT COUNT = 49
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@8000515ns:(report note): done COUNT = 49
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@8000515ns:(report note): PLAINTEXT_OUT (expected) = CB674DECFFAAE472D3D0710935B02AAE
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@8000515ns:(report note): PLAINTEXT_OUT (actual)   = CB674DECFFAAE472D3D0710935B02AAE
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@8000515ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@8000525ns:(report note): Running MCT DECRYPT COUNT = 50
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@8160525ns:(report note): done COUNT = 50
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@8160525ns:(report note): PLAINTEXT_OUT (expected) = 47CD6A4B2F9B3D610D2BD3FE39FEEC91
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@8160525ns:(report note): PLAINTEXT_OUT (actual)   = 47CD6A4B2F9B3D610D2BD3FE39FEEC91
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@8160525ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@8160535ns:(report note): Running MCT DECRYPT COUNT = 51
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@8320535ns:(report note): done COUNT = 51
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@8320535ns:(report note): PLAINTEXT_OUT (expected) = 65B0B926A5B5B67F6895AF42441F106B
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@8320535ns:(report note): PLAINTEXT_OUT (actual)   = 65B0B926A5B5B67F6895AF42441F106B
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@8320535ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@8320545ns:(report note): Running MCT DECRYPT COUNT = 52
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@8480545ns:(report note): done COUNT = 52
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@8480545ns:(report note): PLAINTEXT_OUT (expected) = 3642FD59024EFB3DC4E5BB268DD9DE04
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@8480545ns:(report note): PLAINTEXT_OUT (actual)   = 3642FD59024EFB3DC4E5BB268DD9DE04
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@8480545ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@8480555ns:(report note): Running MCT DECRYPT COUNT = 53
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@8640555ns:(report note): done COUNT = 53
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@8640555ns:(report note): PLAINTEXT_OUT (expected) = 4E5D32A0E40DD9B830AF0C2904518906
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@8640555ns:(report note): PLAINTEXT_OUT (actual)   = 4E5D32A0E40DD9B830AF0C2904518906
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@8640555ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@8640565ns:(report note): Running MCT DECRYPT COUNT = 54
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@8800565ns:(report note): done COUNT = 54
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@8800565ns:(report note): PLAINTEXT_OUT (expected) = 40A7FF6A6D0EA135245D5B24A0004466
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@8800565ns:(report note): PLAINTEXT_OUT (actual)   = 40A7FF6A6D0EA135245D5B24A0004466
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@8800565ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@8800575ns:(report note): Running MCT DECRYPT COUNT = 55
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@8960575ns:(report note): done COUNT = 55
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@8960575ns:(report note): PLAINTEXT_OUT (expected) = B18E6D37F5292ACD1EAEEE742930952A
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@8960575ns:(report note): PLAINTEXT_OUT (actual)   = B18E6D37F5292ACD1EAEEE742930952A
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@8960575ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@8960585ns:(report note): Running MCT DECRYPT COUNT = 56
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@9120585ns:(report note): done COUNT = 56
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@9120585ns:(report note): PLAINTEXT_OUT (expected) = 42DF9C23BFBC90B787C5CB0DC08E80DC
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@9120585ns:(report note): PLAINTEXT_OUT (actual)   = 42DF9C23BFBC90B787C5CB0DC08E80DC
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@9120585ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@9120595ns:(report note): Running MCT DECRYPT COUNT = 57
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@9280595ns:(report note): done COUNT = 57
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@9280595ns:(report note): PLAINTEXT_OUT (expected) = 589AF99ABBBA45318106D2C1CA7B82B0
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@9280595ns:(report note): PLAINTEXT_OUT (actual)   = 589AF99ABBBA45318106D2C1CA7B82B0
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@9280595ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@9280605ns:(report note): Running MCT DECRYPT COUNT = 58
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@9440605ns:(report note): done COUNT = 58
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@9440605ns:(report note): PLAINTEXT_OUT (expected) = 96F54A5BACEC995C0263226CD443F2C6
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@9440605ns:(report note): PLAINTEXT_OUT (actual)   = 96F54A5BACEC995C0263226CD443F2C6
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@9440605ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@9440615ns:(report note): Running MCT DECRYPT COUNT = 59
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@9600615ns:(report note): done COUNT = 59
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@9600615ns:(report note): PLAINTEXT_OUT (expected) = 84E07CE717C747CB924E42CDF6EC6524
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@9600615ns:(report note): PLAINTEXT_OUT (actual)   = 84E07CE717C747CB924E42CDF6EC6524
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@9600615ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@9600625ns:(report note): Running MCT DECRYPT COUNT = 60
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@9760625ns:(report note): done COUNT = 60
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@9760625ns:(report note): PLAINTEXT_OUT (expected) = 5140A66D02867DDFA8BB014F75D53B83
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@9760625ns:(report note): PLAINTEXT_OUT (actual)   = 5140A66D02867DDFA8BB014F75D53B83
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@9760625ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@9760635ns:(report note): Running MCT DECRYPT COUNT = 61
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@9920635ns:(report note): done COUNT = 61
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@9920635ns:(report note): PLAINTEXT_OUT (expected) = A1570DC8605D7D68F0A2416AA2C3536A
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@9920635ns:(report note): PLAINTEXT_OUT (actual)   = A1570DC8605D7D68F0A2416AA2C3536A
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@9920635ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@9920645ns:(report note): Running MCT DECRYPT COUNT = 62
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@10080645ns:(report note): done COUNT = 62
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@10080645ns:(report note): PLAINTEXT_OUT (expected) = 96AB8BD9091A703A6E6D1A2190F0B5C9
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@10080645ns:(report note): PLAINTEXT_OUT (actual)   = 96AB8BD9091A703A6E6D1A2190F0B5C9
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@10080645ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@10080655ns:(report note): Running MCT DECRYPT COUNT = 63
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@10240655ns:(report note): done COUNT = 63
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@10240655ns:(report note): PLAINTEXT_OUT (expected) = 8418C2CEC9D7CC3825152790F120488F
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@10240655ns:(report note): PLAINTEXT_OUT (actual)   = 8418C2CEC9D7CC3825152790F120488F
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@10240655ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@10240665ns:(report note): Running MCT DECRYPT COUNT = 64
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@10400665ns:(report note): done COUNT = 64
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@10400665ns:(report note): PLAINTEXT_OUT (expected) = 7973673755C8201EC52BDEC30A86191F
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@10400665ns:(report note): PLAINTEXT_OUT (actual)   = 7973673755C8201EC52BDEC30A86191F
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@10400665ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@10400675ns:(report note): Running MCT DECRYPT COUNT = 65
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@10560675ns:(report note): done COUNT = 65
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@10560675ns:(report note): PLAINTEXT_OUT (expected) = 2A92BA991755F3C6AD1EF58681AC3A12
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@10560675ns:(report note): PLAINTEXT_OUT (actual)   = 2A92BA991755F3C6AD1EF58681AC3A12
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@10560675ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@10560685ns:(report note): Running MCT DECRYPT COUNT = 66
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@10720685ns:(report note): done COUNT = 66
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@10720685ns:(report note): PLAINTEXT_OUT (expected) = E3DAA0CFE79594311762CA0D39985DA2
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@10720685ns:(report note): PLAINTEXT_OUT (actual)   = E3DAA0CFE79594311762CA0D39985DA2
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@10720685ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@10720695ns:(report note): Running MCT DECRYPT COUNT = 67
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@10880695ns:(report note): done COUNT = 67
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@10880695ns:(report note): PLAINTEXT_OUT (expected) = 5C2EA8B0B4BD7B50B48ABD7DF8E716F2
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@10880695ns:(report note): PLAINTEXT_OUT (actual)   = 5C2EA8B0B4BD7B50B48ABD7DF8E716F2
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@10880695ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@10880705ns:(report note): Running MCT DECRYPT COUNT = 68
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@11040705ns:(report note): done COUNT = 68
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@11040705ns:(report note): PLAINTEXT_OUT (expected) = F15E39A11ED397378B6DE3D62BDE10C2
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@11040705ns:(report note): PLAINTEXT_OUT (actual)   = F15E39A11ED397378B6DE3D62BDE10C2
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@11040705ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@11040715ns:(report note): Running MCT DECRYPT COUNT = 69
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@11200715ns:(report note): done COUNT = 69
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@11200715ns:(report note): PLAINTEXT_OUT (expected) = D16879EE2FE2C07703E7EBA3E093E911
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@11200715ns:(report note): PLAINTEXT_OUT (actual)   = D16879EE2FE2C07703E7EBA3E093E911
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@11200715ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@11200725ns:(report note): Running MCT DECRYPT COUNT = 70
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@11360725ns:(report note): done COUNT = 70
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@11360725ns:(report note): PLAINTEXT_OUT (expected) = 57AAC9D12DA681F1EF4FC3D07269E159
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@11360725ns:(report note): PLAINTEXT_OUT (actual)   = 57AAC9D12DA681F1EF4FC3D07269E159
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@11360725ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@11360735ns:(report note): Running MCT DECRYPT COUNT = 71
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@11520735ns:(report note): done COUNT = 71
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@11520735ns:(report note): PLAINTEXT_OUT (expected) = F6472D8A7D288DB2262D826FF2F806EE
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@11520735ns:(report note): PLAINTEXT_OUT (actual)   = F6472D8A7D288DB2262D826FF2F806EE
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@11520735ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@11520745ns:(report note): Running MCT DECRYPT COUNT = 72
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@11680745ns:(report note): done COUNT = 72
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@11680745ns:(report note): PLAINTEXT_OUT (expected) = D3EC20AE3257192D51F2CE4E73F87E53
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@11680745ns:(report note): PLAINTEXT_OUT (actual)   = D3EC20AE3257192D51F2CE4E73F87E53
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@11680745ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@11680755ns:(report note): Running MCT DECRYPT COUNT = 73
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@11840755ns:(report note): done COUNT = 73
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@11840755ns:(report note): PLAINTEXT_OUT (expected) = D99891B245282641FB9E91681FCE7EE1
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@11840755ns:(report note): PLAINTEXT_OUT (actual)   = D99891B245282641FB9E91681FCE7EE1
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@11840755ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@11840765ns:(report note): Running MCT DECRYPT COUNT = 74
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@12000765ns:(report note): done COUNT = 74
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@12000765ns:(report note): PLAINTEXT_OUT (expected) = 8F2FA0031BAACB388ED7DA3E7FD62828
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@12000765ns:(report note): PLAINTEXT_OUT (actual)   = 8F2FA0031BAACB388ED7DA3E7FD62828
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@12000765ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@12000775ns:(report note): Running MCT DECRYPT COUNT = 75
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@12160775ns:(report note): done COUNT = 75
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@12160775ns:(report note): PLAINTEXT_OUT (expected) = 80BED13AD5AEBB0783629B03AF2F6897
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@12160775ns:(report note): PLAINTEXT_OUT (actual)   = 80BED13AD5AEBB0783629B03AF2F6897
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@12160775ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@12160785ns:(report note): Running MCT DECRYPT COUNT = 76
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@12320785ns:(report note): done COUNT = 76
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@12320785ns:(report note): PLAINTEXT_OUT (expected) = FAC43DFA16D393580F130B8A955339A6
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@12320785ns:(report note): PLAINTEXT_OUT (actual)   = FAC43DFA16D393580F130B8A955339A6
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@12320785ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@12320795ns:(report note): Running MCT DECRYPT COUNT = 77
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@12480795ns:(report note): done COUNT = 77
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@12480795ns:(report note): PLAINTEXT_OUT (expected) = 60AA3F3683346B09466F1C4C11B376F5
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@12480795ns:(report note): PLAINTEXT_OUT (actual)   = 60AA3F3683346B09466F1C4C11B376F5
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@12480795ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@12480805ns:(report note): Running MCT DECRYPT COUNT = 78
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@12640805ns:(report note): done COUNT = 78
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@12640805ns:(report note): PLAINTEXT_OUT (expected) = E93AC158DA113797BCE2472240C4D7BB
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@12640805ns:(report note): PLAINTEXT_OUT (actual)   = E93AC158DA113797BCE2472240C4D7BB
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@12640805ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@12640815ns:(report note): Running MCT DECRYPT COUNT = 79
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@12800815ns:(report note): done COUNT = 79
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@12800815ns:(report note): PLAINTEXT_OUT (expected) = E96E8432E2EEA1DE7E0CCEADFE5E1623
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@12800815ns:(report note): PLAINTEXT_OUT (actual)   = E96E8432E2EEA1DE7E0CCEADFE5E1623
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@12800815ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@12800825ns:(report note): Running MCT DECRYPT COUNT = 80
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@12960825ns:(report note): done COUNT = 80
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@12960825ns:(report note): PLAINTEXT_OUT (expected) = D99630CB34F06A3A02E9803A029980A2
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@12960825ns:(report note): PLAINTEXT_OUT (actual)   = D99630CB34F06A3A02E9803A029980A2
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@12960825ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@12960835ns:(report note): Running MCT DECRYPT COUNT = 81
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@13120835ns:(report note): done COUNT = 81
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@13120835ns:(report note): PLAINTEXT_OUT (expected) = E5A14B334430768EDF5DD7863EE30678
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@13120835ns:(report note): PLAINTEXT_OUT (actual)   = E5A14B334430768EDF5DD7863EE30678
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@13120835ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@13120845ns:(report note): Running MCT DECRYPT COUNT = 82
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@13280845ns:(report note): done COUNT = 82
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@13280845ns:(report note): PLAINTEXT_OUT (expected) = 49DAB0BC5FB8C387EA9C557D3A35E659
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@13280845ns:(report note): PLAINTEXT_OUT (actual)   = 49DAB0BC5FB8C387EA9C557D3A35E659
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@13280845ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@13280855ns:(report note): Running MCT DECRYPT COUNT = 83
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@13440855ns:(report note): done COUNT = 83
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@13440855ns:(report note): PLAINTEXT_OUT (expected) = 6867E956763A7377A15A4248AB91C829
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@13440855ns:(report note): PLAINTEXT_OUT (actual)   = 6867E956763A7377A15A4248AB91C829
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@13440855ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@13440865ns:(report note): Running MCT DECRYPT COUNT = 84
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@13600865ns:(report note): done COUNT = 84
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@13600865ns:(report note): PLAINTEXT_OUT (expected) = 4F536383BA4E258DD3AB764027A66E39
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@13600865ns:(report note): PLAINTEXT_OUT (actual)   = 4F536383BA4E258DD3AB764027A66E39
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@13600865ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@13600875ns:(report note): Running MCT DECRYPT COUNT = 85
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@13760875ns:(report note): done COUNT = 85
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@13760875ns:(report note): PLAINTEXT_OUT (expected) = E9B6ABC089286834EB9421E71FE98517
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@13760875ns:(report note): PLAINTEXT_OUT (actual)   = E9B6ABC089286834EB9421E71FE98517
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@13760875ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@13760885ns:(report note): Running MCT DECRYPT COUNT = 86
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@13920885ns:(report note): done COUNT = 86
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@13920885ns:(report note): PLAINTEXT_OUT (expected) = 256121DEAD70E6675AD631DD0527FB1A
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@13920885ns:(report note): PLAINTEXT_OUT (actual)   = 256121DEAD70E6675AD631DD0527FB1A
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@13920885ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@13920895ns:(report note): Running MCT DECRYPT COUNT = 87
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@14080895ns:(report note): done COUNT = 87
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@14080895ns:(report note): PLAINTEXT_OUT (expected) = 6BDBCC94EC6497445E4024ACB601741B
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@14080895ns:(report note): PLAINTEXT_OUT (actual)   = 6BDBCC94EC6497445E4024ACB601741B
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@14080895ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@14080905ns:(report note): Running MCT DECRYPT COUNT = 88
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@14240905ns:(report note): done COUNT = 88
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@14240905ns:(report note): PLAINTEXT_OUT (expected) = 44E86F9D48C6699554A3538EB6F55479
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@14240905ns:(report note): PLAINTEXT_OUT (actual)   = 44E86F9D48C6699554A3538EB6F55479
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@14240905ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@14240915ns:(report note): Running MCT DECRYPT COUNT = 89
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@14400915ns:(report note): done COUNT = 89
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@14400915ns:(report note): PLAINTEXT_OUT (expected) = C7C622FEE00A180F3131A57A82ACF7A9
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@14400915ns:(report note): PLAINTEXT_OUT (actual)   = C7C622FEE00A180F3131A57A82ACF7A9
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@14400915ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@14400925ns:(report note): Running MCT DECRYPT COUNT = 90
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@14560925ns:(report note): done COUNT = 90
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@14560925ns:(report note): PLAINTEXT_OUT (expected) = E096B0406E6E8ABB6CED353F1BE40693
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@14560925ns:(report note): PLAINTEXT_OUT (actual)   = E096B0406E6E8ABB6CED353F1BE40693
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@14560925ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@14560935ns:(report note): Running MCT DECRYPT COUNT = 91
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@14720935ns:(report note): done COUNT = 91
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@14720935ns:(report note): PLAINTEXT_OUT (expected) = 73326251DBD89C23B37CAEE2EE6D2D9E
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@14720935ns:(report note): PLAINTEXT_OUT (actual)   = 73326251DBD89C23B37CAEE2EE6D2D9E
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@14720935ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@14720945ns:(report note): Running MCT DECRYPT COUNT = 92
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@14880945ns:(report note): done COUNT = 92
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@14880945ns:(report note): PLAINTEXT_OUT (expected) = 7B2C687D460054AF03709645056407C6
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@14880945ns:(report note): PLAINTEXT_OUT (actual)   = 7B2C687D460054AF03709645056407C6
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@14880945ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@14880955ns:(report note): Running MCT DECRYPT COUNT = 93
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@15040955ns:(report note): done COUNT = 93
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@15040955ns:(report note): PLAINTEXT_OUT (expected) = 8BB9F381438145A96714E238A8864E0B
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@15040955ns:(report note): PLAINTEXT_OUT (actual)   = 8BB9F381438145A96714E238A8864E0B
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@15040955ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@15040965ns:(report note): Running MCT DECRYPT COUNT = 94
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@15200965ns:(report note): done COUNT = 94
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@15200965ns:(report note): PLAINTEXT_OUT (expected) = D59509D08BCFC30E20344B1C4C53F726
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@15200965ns:(report note): PLAINTEXT_OUT (actual)   = D59509D08BCFC30E20344B1C4C53F726
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@15200965ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@15200975ns:(report note): Running MCT DECRYPT COUNT = 95
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@15360975ns:(report note): done COUNT = 95
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@15360975ns:(report note): PLAINTEXT_OUT (expected) = 02E6077D01A352637899D6CE626782AC
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@15360975ns:(report note): PLAINTEXT_OUT (actual)   = 02E6077D01A352637899D6CE626782AC
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@15360975ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@15360985ns:(report note): Running MCT DECRYPT COUNT = 96
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@15520985ns:(report note): done COUNT = 96
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@15520985ns:(report note): PLAINTEXT_OUT (expected) = ED01D9601145C11662986B0827E403EC
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@15520985ns:(report note): PLAINTEXT_OUT (actual)   = ED01D9601145C11662986B0827E403EC
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@15520985ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@15520995ns:(report note): Running MCT DECRYPT COUNT = 97
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@15680995ns:(report note): done COUNT = 97
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@15680995ns:(report note): PLAINTEXT_OUT (expected) = 7D5B1CA06884B5A55E9035FE7D77D4A7
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@15680995ns:(report note): PLAINTEXT_OUT (actual)   = 7D5B1CA06884B5A55E9035FE7D77D4A7
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@15680995ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@15681005ns:(report note): Running MCT DECRYPT COUNT = 98
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@15841005ns:(report note): done COUNT = 98
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@15841005ns:(report note): PLAINTEXT_OUT (expected) = 1A23D371B97E1056E8BC9545C56CAB9E
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@15841005ns:(report note): PLAINTEXT_OUT (actual)   = 1A23D371B97E1056E8BC9545C56CAB9E
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@15841005ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:381:9:@15841015ns:(report note): Running MCT DECRYPT COUNT = 99
-- aes_128_mct_decrypt_sample_tb.vhd:412:9:@16001015ns:(report note): done COUNT = 99
-- aes_128_mct_decrypt_sample_tb.vhd:413:9:@16001015ns:(report note): PLAINTEXT_OUT (expected) = D1D2BFDC58FFCAD2341B095BCE55221E
-- aes_128_mct_decrypt_sample_tb.vhd:414:9:@16001015ns:(report note): PLAINTEXT_OUT (actual)   = D1D2BFDC58FFCAD2341B095BCE55221E
-- aes_128_mct_decrypt_sample_tb.vhd:417:13:@16001015ns:(report note): Correct plaintext output
-- aes_128_mct_decrypt_sample_tb.vhd:432:5:@16001025ns:(report note): Monte Carlo set finished
-- aes_128_mct_decrypt_sample_tb.vhd:433:5:@16001025ns:(report note): PASS COUNT = 100
-- aes_128_mct_decrypt_sample_tb.vhd:434:5:@16001025ns:(report note): FAIL COUNT = 0
--
-------------------------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.aes_package.all;

entity aes_128_mct_decrypt_sample_tb is
end aes_128_mct_decrypt_sample_tb;

architecture Behavioral of aes_128_mct_decrypt_sample_tb is
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal start : STD_LOGIC := '0';
    signal key_ready : STD_LOGIC := '0';
    signal ciphertext_ready : STD_LOGIC := '0';
    signal aes_decrypt_done : STD_LOGIC;
    signal key_in : std_logic_vector(127 downto 0) := (others => '0');
    signal ciphertext_in : STD_LOGIC_VECTOR (127 downto 0) := (others => '0');
    signal plaintext_out : STD_LOGIC_VECTOR (127 downto 0) := (others => '0');

    constant CLK_PERIOD : time := 10 ns;
    constant NUM_TESTS : integer := 100;

    type test_array_t is array (natural range <>) of std_logic_vector(127 downto 0);

    constant KEYS : test_array_t(0 to NUM_TESTS-1) := (
        0  => x"0c60e7bf20ada9baa9e1ddf0d1540726",
        1  => x"ba735fcfa55378012e11a7a79f392f5f",
        2  => x"ef328870c876bd5d2233310b254c41c1",
        3  => x"a32109e81d2bb0daf60fea99de471e01",
        4  => x"865d0e55d68eca25e04c3409687b1489",
        5  => x"0664b01bb35cd2f6060ccc8a61ab08e6",
        6  => x"07716cc823d98903c83e25ccc77ea5de",
        7  => x"7605700351eac1c43bc7c16f50e9de05",
        8  => x"1089ef3e980b95792d11d20bf976bd58",
        9  => x"02c2f68cc811c1794bcc259fcd6176fb",
        10 => x"21253fd3b6c8c003b8f5e7ab7ac98a3f",
        11 => x"5a2b21c9488e01e6bf700812433127dc",
        12 => x"9b4d8f22bd962d706e83c13eafd8f0c8",
        13 => x"eadb0840618d6cced31d298c96b37776",
        14 => x"9d6ba2c843a7149c51280234f7597ba4",
        15 => x"7b37e4d4f9ce43620a76e735bbd0e5c1",
        16 => x"dcae63d817ce5633f93facea87f75855",
        17 => x"29e8f48f769daf4e668e083be35f0bdb",
        18 => x"da190debcf169bd6ef02380907153b57",
        19 => x"9ad5ce49ae570bd46fa19fbf2a5be3e1",
        20 => x"e51aaaf4dbd78032763ea01322da3735",
        21 => x"f4d03df8cd4495cd7d6a4cc822607272",
        22 => x"48d25caf99f11b7408a82d5881384f5a",
        23 => x"13c0cef3e683b1dbb24eae12efa515a3",
        24 => x"6a903111b5f184641876be0ec53b78e1",
        25 => x"a765f8866d2c4879ffbaf9e2014670f8",
        26 => x"28288f3aa164107894923b0af90ba95b",
        27 => x"7e351abed90ddcb4154d46fca47b29d6",
        28 => x"698cfc46b7cc1346398bbe1de40992d9",
        29 => x"e61963624d25275efbad90dad8651cc4",
        30 => x"ce6f90cb465f474873c44904c62044f2",
        31 => x"920f0cc18bada4c1825f77029150286e",
        32 => x"1afa3b37ff2cedcca2e864fdd9e0518b",
        33 => x"11e243cb6b2a5b0950286ca3557e5c52",
        34 => x"48a9de38d1fa1ba6f1660f8adc3b5adf",
        35 => x"b45c21977d396940b0d75d853b564c18",
        36 => x"d36dbaedceadfa32f46e64f281508df6",
        37 => x"0a3b19fc460b9ddc5022f7aaac3a6099",
        38 => x"0eca9b75768c1a2f89142a80e9fefebb",
        39 => x"c7ef441582d9aacdf146c54f76233d6b",
        40 => x"d32cf8edb65a745accd198f052bf6d35",
        41 => x"76df0c42668a6fc585484a8e31398410",
        42 => x"af9b5d7522f2ae7831f10438a1b3a44e",
        43 => x"30a733a128c066e57f19d080dd313c89",
        44 => x"640d646e5da56a13c8d56df2df77a77e",
        45 => x"75b16f8c59c0ee9afc15908fa39a2caf",
        46 => x"1c65e090fa59996b3c4a1c24766dc803",
        47 => x"32219ef1db4fbae9fdc8afcbc416e559",
        48 => x"0fb84e2e2bc6a6d14308ba9a7012eb0c",
        49 => x"9d91058d482bfda44f0ed62c0094cbe2",
        50 => x"56f64861b78119d69cdea7253524e14c",
        51 => x"113b222a981a24b791f574db0cda0ddd",
        52 => x"748b9b0c3daf92c8f960db9948c51db6",
        53 => x"42c966553fe169f53d8560bfc51cc3b2",
        54 => x"0c9454f5dbecb04d0d2a6c96c14d4ab4",
        55 => x"4c33ab9fb6e21178297737b2614d0ed2",
        56 => x"fdbdc6a843cb3bb537d9d9c6487d9bf8",
        57 => x"bf625a8bfc77ab02b01c12cb88f31b24",
        58 => x"e7f8a31147cdee33311ac00a42889994",
        59 => x"710de94aeb21776f3379e26696cb6b52",
        60 => x"f5ed95adfce630a4a137a0ab60270e76",
        61 => x"a4ad33c0fe604d7b098ca1e415f235f5",
        62 => x"05fa3e089e3d3013f92ee08eb731669f",
        63 => x"9351b5d1972740299743faaf27c1d356",
        64 => x"1749771f5ef08c11b256dd3fd6e19bd9",
        65 => x"6e3a10280b38ac0f777d03fcdc6782c6",
        66 => x"44a8aab11c6d5fc9da63f67a5dcbb8d4",
        67 => x"a7720a7efbf8cbf8cd013c776453e576",
        68 => x"fb5ca2ce4f45b0a8798b810a9cb4f384",
        69 => x"0a029b6f5196279ff2e662dcb76ae346",
        70 => x"db6ae2817e74e7e8f101897f57f90a57",
        71 => x"8cc02b5053d266191e4e4aaf2590eb0e",
        72 => x"7a8706da2efaebab3863c8c0d768ede0",
        73 => x"a96b26741cadf2866991068ea49093b3",
        74 => x"70f3b7c65985d4c7920f97e6bb5eed52",
        75 => x"ffdc17c5422f1fff1cd84dd8c488c57a",
        76 => x"7f62c6ff9781a4f89fbad6db6ba7aded",
        77 => x"85a6fb05815237a090a9dd51fef4944b",
        78 => x"e50cc43302665ca9d6c6c11def47e2be",
        79 => x"0c36056bd8776b3e6a24863faf833505",
        80 => x"e55881593a99cae01428489251dd2326",
        81 => x"3cceb1920e69a0da16c1c8a85344a384",
        82 => x"d96ffaa14a59d654c99c1f2e6da7a5fc",
        83 => x"90b54a1d15e115d323004a53579243a5",
        84 => x"f8d2a34b63db66a4825a081bfc038b8c",
        85 => x"b781c0c8d995432951f17e5bdba5e5b5",
        86 => x"5e376b0850bd2b1dba655fbcc44c60a2",
        87 => x"7b564ad6fdcdcd7ae0b36e61c16b9bb8",
        88 => x"108d864211a95a3ebef34acd776aefa3",
        89 => x"5465e9df596f33abea501943c19fbbda",
        90 => x"93a3cb21b9652ba4db61bc3943334c73",
        91 => x"73357b61d70ba11fb78c890658d74ae0",
        92 => x"000719300cd33d3c04f027e4b6ba677e",
        93 => x"7b2b714d4ad369930780b1a1b3de60b8",
        94 => x"f09282cc09522c3a609453991b582eb3",
        95 => x"25078b1c829def3440a01885570bd995",
        96 => x"27e18c61833ebd573839ce4b356c5b39",
        97 => x"cae05501927b7c415aa1a543128858d5",
        98 => x"b7bb49a1faffc9e4043190bd6fff8c72",
        99 => x"ad989ad04381d9b2ec8d05f8aa9327ec"
    );

    constant CIPHERS : test_array_t(0 to NUM_TESTS-1) := (
        0  => x"b08a29b11a500ea3aca42c36675b9785",
        1  => x"b613b87085fed1bb87f07a574e6d2879",
        2  => x"5541d7bf6d25c55c0c2296acba756e9e",
        3  => x"4c138198d55d0d87d43cdb92fb0b5fc0",
        4  => x"257c07bdcba57aff1643de90b63c0a88",
        5  => x"8039be4e65d218d3e640f88309d01c6f",
        6  => x"0115dcd390855bf5ce32e946a6d5ad38",
        7  => x"71741ccb723348c7f3f9e4a397977bdb",
        8  => x"668c9f3dc9e154bd16d61364a99f635d",
        9  => x"124b19b2501a540066ddf7943417cba3",
        10 => x"23e7c95f7ed9017af339c234b7a8fcc4",
        11 => x"7b0e1e1afe46c1e50785efb939f8ade3",
        12 => x"c166aeebf5182c96d1f3c92cece9d714",
        13 => x"71968762dc1b41bebd9ee8b2396b87be",
        14 => x"77b0aa88222a785282352bb861ea0cd2",
        15 => x"e65c461cba6957fe5b5ee5014c899e65",
        16 => x"a799870cee001551f3494bdf3c27bd94",
        17 => x"f54697576153f97d9fb1a4d164a8538e",
        18 => x"f3f1f964b98b3498898c3032e44a308c",
        19 => x"40ccc3a26141900280a3a7b62d4ed8b6",
        20 => x"7fcf64bd75808be6199f3fac0881d4d4",
        21 => x"11ca970c169315ff0b54ecdb00ba4547",
        22 => x"bc02615754b58eb975c26190a3583d28",
        23 => x"5b12925c7f72aaafbae6834a6e9d5af9",
        24 => x"7950ffe2537235bfaa38101c2a9e6d42",
        25 => x"cdf5c997d8ddcc1de7cc47ecc47d0819",
        26 => x"8f4d77bccc4858016b28c2e8f84dd9a3",
        27 => x"561d95847869cccc81df7df65d70808d",
        28 => x"17b9e6f86ec1cff22cc6f8e14072bb0f",
        29 => x"8f959f24fae93418c2262ec73c6c8e1d",
        30 => x"2876f3a90b7a60168869d9de1e455836",
        31 => x"5c609c0acdf2e389f19b3e0657706c9c",
        32 => x"88f537f67481490d20b713ff48b079e5",
        33 => x"0b1878fc9406b6c5f2c0085e8c9e0dd9",
        34 => x"594b9df3bad040afa14e63298945068d",
        35 => x"fcf5ffafacc372e641b1520fe76d16c7",
        36 => x"67319b7ab394937244b93977ba06c1ee",
        37 => x"d956a31188a667eea44c93582d6aed6f",
        38 => x"04f18289308787f3d936dd2a45c49e22",
        39 => x"c925df60f455b0e27852efcf9fddc3d0",
        40 => x"14c3bcf83483de973d975dbf249c505e",
        41 => x"a5f3f4afd0d01b9f4999d27e6386e925",
        42 => x"d94451374478c1bdb4b94eb6908a205e",
        43 => x"9f3c6ed40a32c89d4ee8d4b87c8298c7",
        44 => x"54aa57cf75650cf6b7ccbd7202469bf7",
        45 => x"11bc0be20465848934c0fd7d7ced8bd1",
        46 => x"69d48f1ca39977f1c05f8cabd5f7e4ac",
        47 => x"2e447e6121162382c182b3efb27b2d5a",
        48 => x"3d99d0dff0891c38bec01551b4040e55",
        49 => x"92294ba363ed5b750c066cb6708620ee",
        50 => x"cb674decffaae472d3d0710935b02aae",
        51 => x"47cd6a4b2f9b3d610d2bd3fe39feec91",
        52 => x"65b0b926a5b5b67f6895af42441f106b",
        53 => x"3642fd59024efb3dc4e5bb268dd9de04",
        54 => x"4e5d32a0e40dd9b830af0c2904518906",
        55 => x"40a7ff6a6d0ea135245d5b24a0004466",
        56 => x"b18e6d37f5292acd1eaeee742930952a",
        57 => x"42df9c23bfbc90b787c5cb0dc08e80dc",
        58 => x"589af99abbba45318106d2c1ca7b82b0",
        59 => x"96f54a5bacec995c0263226cd443f2c6",
        60 => x"84e07ce717c747cb924e42cdf6ec6524",
        61 => x"5140a66d02867ddfa8bb014f75d53b83",
        62 => x"a1570dc8605d7d68f0a2416aa2c3536a",
        63 => x"96ab8bd9091a703a6e6d1a2190f0b5c9",
        64 => x"8418c2cec9d7cc3825152790f120488f",
        65 => x"7973673755c8201ec52bdec30a86191f",
        66 => x"2a92ba991755f3c6ad1ef58681ac3a12",
        67 => x"e3daa0cfe79594311762ca0d39985da2",
        68 => x"5c2ea8b0b4bd7b50b48abd7df8e716f2",
        69 => x"f15e39a11ed397378b6de3d62bde10c2",
        70 => x"d16879ee2fe2c07703e7eba3e093e911",
        71 => x"57aac9d12da681f1ef4fc3d07269e159",
        72 => x"f6472d8a7d288db2262d826ff2f806ee",
        73 => x"d3ec20ae3257192d51f2ce4e73f87e53",
        74 => x"d99891b245282641fb9e91681fce7ee1",
        75 => x"8f2fa0031baacb388ed7da3e7fd62828",
        76 => x"80bed13ad5aebb0783629b03af2f6897",
        77 => x"fac43dfa16d393580f130b8a955339a6",
        78 => x"60aa3f3683346b09466f1c4c11b376f5",
        79 => x"e93ac158da113797bce2472240c4d7bb",
        80 => x"e96e8432e2eea1de7e0cceadfe5e1623",
        81 => x"d99630cb34f06a3a02e9803a029980a2",
        82 => x"e5a14b334430768edf5dd7863ee30678",
        83 => x"49dab0bc5fb8c387ea9c557d3a35e659",
        84 => x"6867e956763a7377a15a4248ab91c829",
        85 => x"4f536383ba4e258dd3ab764027a66e39",
        86 => x"e9b6abc089286834eb9421e71fe98517",
        87 => x"256121dead70e6675ad631dd0527fb1a",
        88 => x"6bdbcc94ec6497445e4024acb601741b",
        89 => x"44e86f9d48c6699554a3538eb6f55479",
        90 => x"c7c622fee00a180f3131a57a82acf7a9",
        91 => x"e096b0406e6e8abb6ced353f1be40693",
        92 => x"73326251dbd89c23b37caee2ee6d2d9e",
        93 => x"7b2c687d460054af03709645056407c6",
        94 => x"8bb9f381438145a96714e238a8864e0b",
        95 => x"d59509d08bcfc30e20344b1c4c53f726",
        96 => x"02e6077d01a352637899d6ce626782ac",
        97 => x"ed01d9601145c11662986b0827e403ec",
        98 => x"7d5b1ca06884b5a55e9035fe7d77d4a7",
        99 => x"1a23d371b97e1056e8bc9545c56cab9e"
    );

    constant PLAINTEXTS : test_array_t(0 to NUM_TESTS-1) := (
        0  => x"b613b87085fed1bb87f07a574e6d2879",
        1  => x"5541d7bf6d25c55c0c2296acba756e9e",
        2  => x"4c138198d55d0d87d43cdb92fb0b5fc0",
        3  => x"257c07bdcba57aff1643de90b63c0a88",
        4  => x"8039be4e65d218d3e640f88309d01c6f",
        5  => x"0115dcd390855bf5ce32e946a6d5ad38",
        6  => x"71741ccb723348c7f3f9e4a397977bdb",
        7  => x"668c9f3dc9e154bd16d61364a99f635d",
        8  => x"124b19b2501a540066ddf7943417cba3",
        9  => x"23e7c95f7ed9017af339c234b7a8fcc4",
        10 => x"7b0e1e1afe46c1e50785efb939f8ade3",
        11 => x"c166aeebf5182c96d1f3c92cece9d714",
        12 => x"71968762dc1b41bebd9ee8b2396b87be",
        13 => x"77b0aa88222a785282352bb861ea0cd2",
        14 => x"e65c461cba6957fe5b5ee5014c899e65",
        15 => x"a799870cee001551f3494bdf3c27bd94",
        16 => x"f54697576153f97d9fb1a4d164a8538e",
        17 => x"f3f1f964b98b3498898c3032e44a308c",
        18 => x"40ccc3a26141900280a3a7b62d4ed8b6",
        19 => x"7fcf64bd75808be6199f3fac0881d4d4",
        20 => x"11ca970c169315ff0b54ecdb00ba4547",
        21 => x"bc02615754b58eb975c26190a3583d28",
        22 => x"5b12925c7f72aaafbae6834a6e9d5af9",
        23 => x"7950ffe2537235bfaa38101c2a9e6d42",
        24 => x"cdf5c997d8ddcc1de7cc47ecc47d0819",
        25 => x"8f4d77bccc4858016b28c2e8f84dd9a3",
        26 => x"561d95847869cccc81df7df65d70808d",
        27 => x"17b9e6f86ec1cff22cc6f8e14072bb0f",
        28 => x"8f959f24fae93418c2262ec73c6c8e1d",
        29 => x"2876f3a90b7a60168869d9de1e455836",
        30 => x"5c609c0acdf2e389f19b3e0657706c9c",
        31 => x"88f537f67481490d20b713ff48b079e5",
        32 => x"0b1878fc9406b6c5f2c0085e8c9e0dd9",
        33 => x"594b9df3bad040afa14e63298945068d",
        34 => x"fcf5ffafacc372e641b1520fe76d16c7",
        35 => x"67319b7ab394937244b93977ba06c1ee",
        36 => x"d956a31188a667eea44c93582d6aed6f",
        37 => x"04f18289308787f3d936dd2a45c49e22",
        38 => x"c925df60f455b0e27852efcf9fddc3d0",
        39 => x"14c3bcf83483de973d975dbf249c505e",
        40 => x"a5f3f4afd0d01b9f4999d27e6386e925",
        41 => x"d94451374478c1bdb4b94eb6908a205e",
        42 => x"9f3c6ed40a32c89d4ee8d4b87c8298c7",
        43 => x"54aa57cf75650cf6b7ccbd7202469bf7",
        44 => x"11bc0be20465848934c0fd7d7ced8bd1",
        45 => x"69d48f1ca39977f1c05f8cabd5f7e4ac",
        46 => x"2e447e6121162382c182b3efb27b2d5a",
        47 => x"3d99d0dff0891c38bec01551b4040e55",
        48 => x"92294ba363ed5b750c066cb6708620ee",
        49 => x"cb674decffaae472d3d0710935b02aae",
        50 => x"47cd6a4b2f9b3d610d2bd3fe39feec91",
        51 => x"65b0b926a5b5b67f6895af42441f106b",
        52 => x"3642fd59024efb3dc4e5bb268dd9de04",
        53 => x"4e5d32a0e40dd9b830af0c2904518906",
        54 => x"40a7ff6a6d0ea135245d5b24a0004466",
        55 => x"b18e6d37f5292acd1eaeee742930952a",
        56 => x"42df9c23bfbc90b787c5cb0dc08e80dc",
        57 => x"589af99abbba45318106d2c1ca7b82b0",
        58 => x"96f54a5bacec995c0263226cd443f2c6",
        59 => x"84e07ce717c747cb924e42cdf6ec6524",
        60 => x"5140a66d02867ddfa8bb014f75d53b83",
        61 => x"a1570dc8605d7d68f0a2416aa2c3536a",
        62 => x"96ab8bd9091a703a6e6d1a2190f0b5c9",
        63 => x"8418c2cec9d7cc3825152790f120488f",
        64 => x"7973673755c8201ec52bdec30a86191f",
        65 => x"2a92ba991755f3c6ad1ef58681ac3a12",
        66 => x"e3daa0cfe79594311762ca0d39985da2",
        67 => x"5c2ea8b0b4bd7b50b48abd7df8e716f2",
        68 => x"f15e39a11ed397378b6de3d62bde10c2",
        69 => x"d16879ee2fe2c07703e7eba3e093e911",
        70 => x"57aac9d12da681f1ef4fc3d07269e159",
        71 => x"f6472d8a7d288db2262d826ff2f806ee",
        72 => x"d3ec20ae3257192d51f2ce4e73f87e53",
        73 => x"d99891b245282641fb9e91681fce7ee1",
        74 => x"8f2fa0031baacb388ed7da3e7fd62828",
        75 => x"80bed13ad5aebb0783629b03af2f6897",
        76 => x"fac43dfa16d393580f130b8a955339a6",
        77 => x"60aa3f3683346b09466f1c4c11b376f5",
        78 => x"e93ac158da113797bce2472240c4d7bb",
        79 => x"e96e8432e2eea1de7e0cceadfe5e1623",
        80 => x"d99630cb34f06a3a02e9803a029980a2",
        81 => x"e5a14b334430768edf5dd7863ee30678",
        82 => x"49dab0bc5fb8c387ea9c557d3a35e659",
        83 => x"6867e956763a7377a15a4248ab91c829",
        84 => x"4f536383ba4e258dd3ab764027a66e39",
        85 => x"e9b6abc089286834eb9421e71fe98517",
        86 => x"256121dead70e6675ad631dd0527fb1a",
        87 => x"6bdbcc94ec6497445e4024acb601741b",
        88 => x"44e86f9d48c6699554a3538eb6f55479",
        89 => x"c7c622fee00a180f3131a57a82acf7a9",
        90 => x"e096b0406e6e8abb6ced353f1be40693",
        91 => x"73326251dbd89c23b37caee2ee6d2d9e",
        92 => x"7b2c687d460054af03709645056407c6",
        93 => x"8bb9f381438145a96714e238a8864e0b",
        94 => x"d59509d08bcfc30e20344b1c4c53f726",
        95 => x"02e6077d01a352637899d6ce626782ac",
        96 => x"ed01d9601145c11662986b0827e403ec",
        97 => x"7d5b1ca06884b5a55e9035fe7d77d4a7",
        98 => x"1a23d371b97e1056e8bc9545c56cab9e",
        99 => x"d1d2bfdc58ffcad2341b095bce55221e"
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
    variable pass_count : integer := 0;
    variable fail_count : integer := 0;

    variable current_key    : std_logic_vector(127 downto 0);
    variable current_cipher : std_logic_vector(127 downto 0);
    variable last_plain     : std_logic_vector(127 downto 0);
begin
    report "Running Monte Carlo DECRYPT set";

    wait until rising_edge(clk);
    reset <= '1';
    start <= '0';
    key_ready <= '0';
    ciphertext_ready <= '0';

    wait until rising_edge(clk);
    reset <= '0';
    wait until rising_edge(clk);

    for i in 0 to NUM_TESTS-1 loop
        report "Running MCT DECRYPT COUNT = " & integer'image(i);

        current_key    := KEYS(i);
        current_cipher := CIPHERS(i);

        for j in 0 to 999 loop
            key_in <= current_key;
            ciphertext_in <= current_cipher;

            wait until rising_edge(clk);
            start <= '1';
            ciphertext_ready <= '1';

            wait until rising_edge(clk);
            key_ready <= '1';

            wait until rising_edge(clk);
            start <= '0';
            ciphertext_ready <= '0';
            key_ready <= '0';

            wait until aes_decrypt_done = '1';

            last_plain := plaintext_out;

            -- for decrypt MCT, feed previous plaintext back in as next ciphertext
            current_cipher := last_plain;

            wait until rising_edge(clk);
        end loop;

        report "done COUNT = " & integer'image(i);
        report "PLAINTEXT_OUT (expected) = " & to_hstring(PLAINTEXTS(i));
        report "PLAINTEXT_OUT (actual)   = " & to_hstring(last_plain);

        if last_plain = PLAINTEXTS(i) then
            report "Correct plaintext output";
            pass_count := pass_count + 1;
        else
            report "Wrong plaintext output" severity error;
            fail_count := fail_count + 1;
        end if;

        -- AES-128 MCT key update
        if i < NUM_TESTS-1 then
            current_key := current_key xor last_plain;
        end if;

        wait until rising_edge(clk);
    end loop;

    report "Monte Carlo set finished";
    report "PASS COUNT = " & integer'image(pass_count);
    report "FAIL COUNT = " & integer'image(fail_count);

    wait;
end process;

end Behavioral;