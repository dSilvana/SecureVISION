----------------------------------------------------------------------------------------------------------------------
--
-- OUTPUTS:
-- aes_128_mmt_decrypt_tb.vhd:339:9:@0ms:(report note): Running MMT DECRYPT set
-- aes_128_mmt_decrypt_tb.vhd:352:13:@25ns:(report note): Running MMT DECRYPT COUNT = 0
-- aes_128_mmt_decrypt_tb.vhd:382:17:@175ns:(report note):   BLOCK 0 expected = 46F2C98932349C338E9D67F744A1C988
-- aes_128_mmt_decrypt_tb.vhd:385:17:@175ns:(report note):   BLOCK 0 actual   = 46F2C98932349C338E9D67F744A1C988
-- aes_128_mmt_decrypt_tb.vhd:391:13:@185ns:(report note): PLAINTEXT_OUT (expected full) = 46F2C98932349C338E9D67F744A1C988
-- aes_128_mmt_decrypt_tb.vhd:394:13:@185ns:(report note): PLAINTEXT_OUT (actual full)   = 46F2C98932349C338E9D67F744A1C988
-- aes_128_mmt_decrypt_tb.vhd:399:17:@185ns:(report note): Correct plaintext output
-- aes_128_mmt_decrypt_tb.vhd:352:13:@195ns:(report note): Running MMT DECRYPT COUNT = 1
-- aes_128_mmt_decrypt_tb.vhd:382:17:@345ns:(report note):   BLOCK 0 expected = 8C8E6ED8A6BDB3BAABEC78189B7D6101
-- aes_128_mmt_decrypt_tb.vhd:385:17:@345ns:(report note):   BLOCK 0 actual   = 8C8E6ED8A6BDB3BAABEC78189B7D6101
-- aes_128_mmt_decrypt_tb.vhd:382:17:@505ns:(report note):   BLOCK 1 expected = 0D6D168DE2C08EC56F9B9C004A191E21
-- aes_128_mmt_decrypt_tb.vhd:385:17:@505ns:(report note):   BLOCK 1 actual   = 0D6D168DE2C08EC56F9B9C004A191E21
-- aes_128_mmt_decrypt_tb.vhd:391:13:@515ns:(report note): PLAINTEXT_OUT (expected full) = 8C8E6ED8A6BDB3BAABEC78189B7D61010D6D168DE2C08EC56F9B9C004A191E21
-- aes_128_mmt_decrypt_tb.vhd:394:13:@515ns:(report note): PLAINTEXT_OUT (actual full)   = 8C8E6ED8A6BDB3BAABEC78189B7D61010D6D168DE2C08EC56F9B9C004A191E21
-- aes_128_mmt_decrypt_tb.vhd:399:17:@515ns:(report note): Correct plaintext output
-- aes_128_mmt_decrypt_tb.vhd:352:13:@525ns:(report note): Running MMT DECRYPT COUNT = 2
-- aes_128_mmt_decrypt_tb.vhd:382:17:@675ns:(report note):   BLOCK 0 expected = 8838058BD98072B72FD75641EDB21630
-- aes_128_mmt_decrypt_tb.vhd:385:17:@675ns:(report note):   BLOCK 0 actual   = 8838058BD98072B72FD75641EDB21630
-- aes_128_mmt_decrypt_tb.vhd:382:17:@835ns:(report note):   BLOCK 1 expected = 1FEE8323FF8C4BA18EE6A4623C2FDEB3
-- aes_128_mmt_decrypt_tb.vhd:385:17:@835ns:(report note):   BLOCK 1 actual   = 1FEE8323FF8C4BA18EE6A4623C2FDEB3
-- aes_128_mmt_decrypt_tb.vhd:382:17:@995ns:(report note):   BLOCK 2 expected = DF5F8A240A8E7E6D5AE15444614F41FB
-- aes_128_mmt_decrypt_tb.vhd:385:17:@995ns:(report note):   BLOCK 2 actual   = DF5F8A240A8E7E6D5AE15444614F41FB
-- aes_128_mmt_decrypt_tb.vhd:391:13:@1005ns:(report note): PLAINTEXT_OUT (expected full) = 8838058BD98072B72FD75641EDB216301FEE8323FF8C4BA18EE6A4623C2FDEB3DF5F8A240A8E7E6D5AE15444614F41FB
-- aes_128_mmt_decrypt_tb.vhd:394:13:@1005ns:(report note): PLAINTEXT_OUT (actual full)   = 8838058BD98072B72FD75641EDB216301FEE8323FF8C4BA18EE6A4623C2FDEB3DF5F8A240A8E7E6D5AE15444614F41FB
-- aes_128_mmt_decrypt_tb.vhd:399:17:@1005ns:(report note): Correct plaintext output
-- aes_128_mmt_decrypt_tb.vhd:352:13:@1015ns:(report note): Running MMT DECRYPT COUNT = 3
-- aes_128_mmt_decrypt_tb.vhd:382:17:@1165ns:(report note):   BLOCK 0 expected = 6061DF5BCD421FABDB5235FC03250265
-- aes_128_mmt_decrypt_tb.vhd:385:17:@1165ns:(report note):   BLOCK 0 actual   = 6061DF5BCD421FABDB5235FC03250265
-- aes_128_mmt_decrypt_tb.vhd:382:17:@1325ns:(report note):   BLOCK 1 expected = 0448FD8233A0237C5F6F249A63D7DB3E
-- aes_128_mmt_decrypt_tb.vhd:385:17:@1325ns:(report note):   BLOCK 1 actual   = 0448FD8233A0237C5F6F249A63D7DB3E
-- aes_128_mmt_decrypt_tb.vhd:382:17:@1485ns:(report note):   BLOCK 2 expected = 4283AC9A8684A363EF64E760C5886564
-- aes_128_mmt_decrypt_tb.vhd:385:17:@1485ns:(report note):   BLOCK 2 actual   = 4283AC9A8684A363EF64E760C5886564
-- aes_128_mmt_decrypt_tb.vhd:382:17:@1645ns:(report note):   BLOCK 3 expected = 659DA619466851568B32091DF5516F57
-- aes_128_mmt_decrypt_tb.vhd:385:17:@1645ns:(report note):   BLOCK 3 actual   = 659DA619466851568B32091DF5516F57
-- aes_128_mmt_decrypt_tb.vhd:391:13:@1655ns:(report note): PLAINTEXT_OUT (expected full) = 6061DF5BCD421FABDB5235FC032502650448FD8233A0237C5F6F249A63D7DB3E4283AC9A8684A363EF64E760C5886564659DA619466851568B32091DF5516F57
-- aes_128_mmt_decrypt_tb.vhd:394:13:@1655ns:(report note): PLAINTEXT_OUT (actual full)   = 6061DF5BCD421FABDB5235FC032502650448FD8233A0237C5F6F249A63D7DB3E4283AC9A8684A363EF64E760C5886564659DA619466851568B32091DF5516F57
-- aes_128_mmt_decrypt_tb.vhd:399:17:@1655ns:(report note): Correct plaintext output
-- aes_128_mmt_decrypt_tb.vhd:352:13:@1665ns:(report note): Running MMT DECRYPT COUNT = 4
-- aes_128_mmt_decrypt_tb.vhd:382:17:@1815ns:(report note):   BLOCK 0 expected = 3F098AE7E7524DDB556403C5D3D0B10E
-- aes_128_mmt_decrypt_tb.vhd:385:17:@1815ns:(report note):   BLOCK 0 actual   = 3F098AE7E7524DDB556403C5D3D0B10E
-- aes_128_mmt_decrypt_tb.vhd:382:17:@1975ns:(report note):   BLOCK 1 expected = 5DB6C324843CA54A47E34AD9BDBCCC93
-- aes_128_mmt_decrypt_tb.vhd:385:17:@1975ns:(report note):   BLOCK 1 actual   = 5DB6C324843CA54A47E34AD9BDBCCC93
-- aes_128_mmt_decrypt_tb.vhd:382:17:@2135ns:(report note):   BLOCK 2 expected = A645E96F2E98651751F0F1A697398EA8
-- aes_128_mmt_decrypt_tb.vhd:385:17:@2135ns:(report note):   BLOCK 2 actual   = A645E96F2E98651751F0F1A697398EA8
-- aes_128_mmt_decrypt_tb.vhd:382:17:@2295ns:(report note):   BLOCK 3 expected = 01A69079C1808B6A8E3BB02A4CF3292F
-- aes_128_mmt_decrypt_tb.vhd:385:17:@2295ns:(report note):   BLOCK 3 actual   = 01A69079C1808B6A8E3BB02A4CF3292F
-- aes_128_mmt_decrypt_tb.vhd:382:17:@2455ns:(report note):   BLOCK 4 expected = 1A7A05B954571339F7899F9AAA2AE1E9
-- aes_128_mmt_decrypt_tb.vhd:385:17:@2455ns:(report note):   BLOCK 4 actual   = 1A7A05B954571339F7899F9AAA2AE1E9
-- aes_128_mmt_decrypt_tb.vhd:391:13:@2465ns:(report note): PLAINTEXT_OUT (expected full) = 
-- 3F098AE7E7524DDB556403C5D3D0B10E5DB6C324843CA54A47E34AD9BDBCCC93A645E96F2E98651751F0F1A697398EA801A69079C1808B6A8E3BB02A4CF3292F1A7A05B954571339F7899F9AAA2AE1E9
-- aes_128_mmt_decrypt_tb.vhd:394:13:@2465ns:(report note): PLAINTEXT_OUT (actual full)   = 
-- 3F098AE7E7524DDB556403C5D3D0B10E5DB6C324843CA54A47E34AD9BDBCCC93A645E96F2E98651751F0F1A697398EA801A69079C1808B6A8E3BB02A4CF3292F1A7A05B954571339F7899F9AAA2AE1E9
-- aes_128_mmt_decrypt_tb.vhd:399:17:@2465ns:(report note): Correct plaintext output
-- aes_128_mmt_decrypt_tb.vhd:352:13:@2475ns:(report note): Running MMT DECRYPT COUNT = 5
-- aes_128_mmt_decrypt_tb.vhd:382:17:@2625ns:(report note):   BLOCK 0 expected = 3DFE918048F4C0B0B22FBC55E5AF751C
-- aes_128_mmt_decrypt_tb.vhd:385:17:@2625ns:(report note):   BLOCK 0 actual   = 3DFE918048F4C0B0B22FBC55E5AF751C
-- aes_128_mmt_decrypt_tb.vhd:382:17:@2785ns:(report note):   BLOCK 1 expected = F3E6CE348EB9A888795033F6DD216AFB
-- aes_128_mmt_decrypt_tb.vhd:385:17:@2785ns:(report note):   BLOCK 1 actual   = F3E6CE348EB9A888795033F6DD216AFB
-- aes_128_mmt_decrypt_tb.vhd:382:17:@2945ns:(report note):   BLOCK 2 expected = EA65FC8DF41C0CE6C7316A8183D36060
-- aes_128_mmt_decrypt_tb.vhd:385:17:@2945ns:(report note):   BLOCK 2 actual   = EA65FC8DF41C0CE6C7316A8183D36060
-- aes_128_mmt_decrypt_tb.vhd:382:17:@3105ns:(report note):   BLOCK 3 expected = BF19709FE2BEC6D13BBDF1A434CC5B8F
-- aes_128_mmt_decrypt_tb.vhd:385:17:@3105ns:(report note):   BLOCK 3 actual   = BF19709FE2BEC6D13BBDF1A434CC5B8F
-- aes_128_mmt_decrypt_tb.vhd:382:17:@3265ns:(report note):   BLOCK 4 expected = 10AADB368C269D2DC4474A1F8112640F
-- aes_128_mmt_decrypt_tb.vhd:385:17:@3265ns:(report note):   BLOCK 4 actual   = 10AADB368C269D2DC4474A1F8112640F
-- aes_128_mmt_decrypt_tb.vhd:382:17:@3425ns:(report note):   BLOCK 5 expected = E52803B1883CB7756743100A758DD862
-- aes_128_mmt_decrypt_tb.vhd:385:17:@3425ns:(report note):   BLOCK 5 actual   = E52803B1883CB7756743100A758DD862
-- aes_128_mmt_decrypt_tb.vhd:391:13:@3435ns:(report note): PLAINTEXT_OUT (expected full) = 
-- 3DFE918048F4C0B0B22FBC55E5AF751CF3E6CE348EB9A888795033F6DD216AFBEA65FC8DF41C0CE6C7316A8183D36060BF19709FE2BEC6D13BBDF1A434CC5B8F10AADB368C269D2DC4474A1F8112640FE52803B1883CB7756743100A758DD862
-- aes_128_mmt_decrypt_tb.vhd:394:13:@3435ns:(report note): PLAINTEXT_OUT (actual full)   = 
-- 3DFE918048F4C0B0B22FBC55E5AF751CF3E6CE348EB9A888795033F6DD216AFBEA65FC8DF41C0CE6C7316A8183D36060BF19709FE2BEC6D13BBDF1A434CC5B8F10AADB368C269D2DC4474A1F8112640FE52803B1883CB7756743100A758DD862
-- aes_128_mmt_decrypt_tb.vhd:399:17:@3435ns:(report note): Correct plaintext output
-- aes_128_mmt_decrypt_tb.vhd:352:13:@3445ns:(report note): Running MMT DECRYPT COUNT = 6
-- aes_128_mmt_decrypt_tb.vhd:382:17:@3595ns:(report note):   BLOCK 0 expected = 6E19CEC775595C2F768DE3BDA3682FB4
-- aes_128_mmt_decrypt_tb.vhd:385:17:@3595ns:(report note):   BLOCK 0 actual   = 6E19CEC775595C2F768DE3BDA3682FB4
-- aes_128_mmt_decrypt_tb.vhd:382:17:@3755ns:(report note):   BLOCK 1 expected = 026ED1889FC3DE11BC45A2A3E2B22694
-- aes_128_mmt_decrypt_tb.vhd:385:17:@3755ns:(report note):   BLOCK 1 actual   = 026ED1889FC3DE11BC45A2A3E2B22694
-- aes_128_mmt_decrypt_tb.vhd:382:17:@3915ns:(report note):   BLOCK 2 expected = DDAAB3274C81B29204FA034EEDAC564A
-- aes_128_mmt_decrypt_tb.vhd:385:17:@3915ns:(report note):   BLOCK 2 actual   = DDAAB3274C81B29204FA034EEDAC564A
-- aes_128_mmt_decrypt_tb.vhd:382:17:@4075ns:(report note):   BLOCK 3 expected = 7DFE27AABB6FF420F9AA5ABADF15C746
-- aes_128_mmt_decrypt_tb.vhd:385:17:@4075ns:(report note):   BLOCK 3 actual   = 7DFE27AABB6FF420F9AA5ABADF15C746
-- aes_128_mmt_decrypt_tb.vhd:382:17:@4235ns:(report note):   BLOCK 4 expected = 76EFEABD96A7FF2491813BA53CB5AB76
-- aes_128_mmt_decrypt_tb.vhd:385:17:@4235ns:(report note):   BLOCK 4 actual   = 76EFEABD96A7FF2491813BA53CB5AB76
-- aes_128_mmt_decrypt_tb.vhd:382:17:@4395ns:(report note):   BLOCK 5 expected = EACD37255A28DAECBBE580F5EB77F9BC
-- aes_128_mmt_decrypt_tb.vhd:385:17:@4395ns:(report note):   BLOCK 5 actual   = EACD37255A28DAECBBE580F5EB77F9BC
-- aes_128_mmt_decrypt_tb.vhd:382:17:@4555ns:(report note):   BLOCK 6 expected = 0339E0DA59B2B307F52974B6182CB106
-- aes_128_mmt_decrypt_tb.vhd:385:17:@4555ns:(report note):   BLOCK 6 actual   = 0339E0DA59B2B307F52974B6182CB106
-- aes_128_mmt_decrypt_tb.vhd:391:13:@4565ns:(report note): PLAINTEXT_OUT (expected full) = 
-- 6E19CEC775595C2F768DE3BDA3682FB4026ED1889FC3DE11BC45A2A3E2B22694DDAAB3274C81B29204FA034EEDAC564A7DFE27AABB6FF420F9AA5ABADF15C74676EFEABD96A7FF2491813BA53CB5AB76EACD37255A28DAECBBE580F5EB77F9BC0339E0DA59B2B307F52974B6182CB106
-- aes_128_mmt_decrypt_tb.vhd:394:13:@4565ns:(report note): PLAINTEXT_OUT (actual full)   = 
-- 6E19CEC775595C2F768DE3BDA3682FB4026ED1889FC3DE11BC45A2A3E2B22694DDAAB3274C81B29204FA034EEDAC564A7DFE27AABB6FF420F9AA5ABADF15C74676EFEABD96A7FF2491813BA53CB5AB76EACD37255A28DAECBBE580F5EB77F9BC0339E0DA59B2B307F52974B6182CB106
-- aes_128_mmt_decrypt_tb.vhd:399:17:@4565ns:(report note): Correct plaintext output
-- aes_128_mmt_decrypt_tb.vhd:352:13:@4575ns:(report note): Running MMT DECRYPT COUNT = 7
-- aes_128_mmt_decrypt_tb.vhd:382:17:@4725ns:(report note):   BLOCK 0 expected = 398DB04B45A724393E4BAEC86A220F22
-- aes_128_mmt_decrypt_tb.vhd:385:17:@4725ns:(report note):   BLOCK 0 actual   = 398DB04B45A724393E4BAEC86A220F22
-- aes_128_mmt_decrypt_tb.vhd:382:17:@4885ns:(report note):   BLOCK 1 expected = 358DF1BBF0CAB278DCFECF7A3F8F6275
-- aes_128_mmt_decrypt_tb.vhd:385:17:@4885ns:(report note):   BLOCK 1 actual   = 358DF1BBF0CAB278DCFECF7A3F8F6275
-- aes_128_mmt_decrypt_tb.vhd:382:17:@5045ns:(report note):   BLOCK 2 expected = EF45ED9F039BC1F5030C3A0C245FBB6E
-- aes_128_mmt_decrypt_tb.vhd:385:17:@5045ns:(report note):   BLOCK 2 actual   = EF45ED9F039BC1F5030C3A0C245FBB6E
-- aes_128_mmt_decrypt_tb.vhd:382:17:@5205ns:(report note):   BLOCK 3 expected = A0BFF3E2DA0859AC498DB6624A572023
-- aes_128_mmt_decrypt_tb.vhd:385:17:@5205ns:(report note):   BLOCK 3 actual   = A0BFF3E2DA0859AC498DB6624A572023
-- aes_128_mmt_decrypt_tb.vhd:382:17:@5365ns:(report note):   BLOCK 4 expected = DE7C221BF3567F51E98947970DFC581B
-- aes_128_mmt_decrypt_tb.vhd:385:17:@5365ns:(report note):   BLOCK 4 actual   = DE7C221BF3567F51E98947970DFC581B
-- aes_128_mmt_decrypt_tb.vhd:382:17:@5525ns:(report note):   BLOCK 5 expected = 3CA670AB92953D3BDD97DBF5D6BEF8AA
-- aes_128_mmt_decrypt_tb.vhd:385:17:@5525ns:(report note):   BLOCK 5 actual   = 3CA670AB92953D3BDD97DBF5D6BEF8AA
-- aes_128_mmt_decrypt_tb.vhd:382:17:@5685ns:(report note):   BLOCK 6 expected = 2F31500D221198ED9F23B049EAEED676
-- aes_128_mmt_decrypt_tb.vhd:385:17:@5685ns:(report note):   BLOCK 6 actual   = 2F31500D221198ED9F23B049EAEED676
-- aes_128_mmt_decrypt_tb.vhd:382:17:@5845ns:(report note):   BLOCK 7 expected = 83083034B4A5A82A0E49319E368C6F55
-- aes_128_mmt_decrypt_tb.vhd:385:17:@5845ns:(report note):   BLOCK 7 actual   = 83083034B4A5A82A0E49319E368C6F55
-- aes_128_mmt_decrypt_tb.vhd:391:13:@5855ns:(report note): PLAINTEXT_OUT (expected full) = 
-- 398DB04B45A724393E4BAEC86A220F22358DF1BBF0CAB278DCFECF7A3F8F6275EF45ED9F039BC1F5030C3A0C245FBB6EA0BFF3E2DA0859AC498DB6624A572023DE7C221BF3567F51E98947970DFC581B3CA670AB92953D3BDD97DBF5D6BEF8AA2F31500D221198ED9F23B049EAEED67683083034
-- B4A5A82A0E49319E368C6F55
-- aes_128_mmt_decrypt_tb.vhd:394:13:@5855ns:(report note): PLAINTEXT_OUT (actual full)   = 
-- 398DB04B45A724393E4BAEC86A220F22358DF1BBF0CAB278DCFECF7A3F8F6275EF45ED9F039BC1F5030C3A0C245FBB6EA0BFF3E2DA0859AC498DB6624A572023DE7C221BF3567F51E98947970DFC581B3CA670AB92953D3BDD97DBF5D6BEF8AA2F31500D221198ED9F23B049EAEED67683083034B
-- 4A5A82A0E49319E368C6F55
-- aes_128_mmt_decrypt_tb.vhd:399:17:@5855ns:(report note): Correct plaintext output
-- aes_128_mmt_decrypt_tb.vhd:352:13:@5865ns:(report note): Running MMT DECRYPT COUNT = 8
-- aes_128_mmt_decrypt_tb.vhd:382:17:@6015ns:(report note):   BLOCK 0 expected = A2E19C08FA204640B1BC73BEAC58F81A
-- aes_128_mmt_decrypt_tb.vhd:385:17:@6015ns:(report note):   BLOCK 0 actual   = A2E19C08FA204640B1BC73BEAC58F81A
-- aes_128_mmt_decrypt_tb.vhd:382:17:@6175ns:(report note):   BLOCK 1 expected = 7923F3EF2A0AFFCF1568C9179D816CF1
-- aes_128_mmt_decrypt_tb.vhd:385:17:@6175ns:(report note):   BLOCK 1 actual   = 7923F3EF2A0AFFCF1568C9179D816CF1
-- aes_128_mmt_decrypt_tb.vhd:382:17:@6335ns:(report note):   BLOCK 2 expected = BD16B79418F0266F0FF904E06045F276
-- aes_128_mmt_decrypt_tb.vhd:385:17:@6335ns:(report note):   BLOCK 2 actual   = BD16B79418F0266F0FF904E06045F276
-- aes_128_mmt_decrypt_tb.vhd:382:17:@6495ns:(report note):   BLOCK 3 expected = DF187ED72B8F6641B065B854A7D3F152
-- aes_128_mmt_decrypt_tb.vhd:385:17:@6495ns:(report note):   BLOCK 3 actual   = DF187ED72B8F6641B065B854A7D3F152
-- aes_128_mmt_decrypt_tb.vhd:382:17:@6655ns:(report note):   BLOCK 4 expected = B8E153CD77EC605E5B75454245745DC0
-- aes_128_mmt_decrypt_tb.vhd:385:17:@6655ns:(report note):   BLOCK 4 actual   = B8E153CD77EC605E5B75454245745DC0
-- aes_128_mmt_decrypt_tb.vhd:382:17:@6815ns:(report note):   BLOCK 5 expected = E0DCFC616F5246F868B6EE5A1DF56C49
-- aes_128_mmt_decrypt_tb.vhd:385:17:@6815ns:(report note):   BLOCK 5 actual   = E0DCFC616F5246F868B6EE5A1DF56C49
-- aes_128_mmt_decrypt_tb.vhd:382:17:@6975ns:(report note):   BLOCK 6 expected = 06C5C34BC42309D370733E50D9A1ADDC
-- aes_128_mmt_decrypt_tb.vhd:385:17:@6975ns:(report note):   BLOCK 6 actual   = 06C5C34BC42309D370733E50D9A1ADDC
-- aes_128_mmt_decrypt_tb.vhd:382:17:@7135ns:(report note):   BLOCK 7 expected = 3F37CBE4B331AC7D3A920C794484A16B
-- aes_128_mmt_decrypt_tb.vhd:385:17:@7135ns:(report note):   BLOCK 7 actual   = 3F37CBE4B331AC7D3A920C794484A16B
-- aes_128_mmt_decrypt_tb.vhd:382:17:@7295ns:(report note):   BLOCK 8 expected = 05599F46F42046A6DC9063B1D5A8AE1F
-- aes_128_mmt_decrypt_tb.vhd:385:17:@7295ns:(report note):   BLOCK 8 actual   = 05599F46F42046A6DC9063B1D5A8AE1F
-- aes_128_mmt_decrypt_tb.vhd:391:13:@7305ns:(report note): PLAINTEXT_OUT (expected full) = 
-- A2E19C08FA204640B1BC73BEAC58F81A7923F3EF2A0AFFCF1568C9179D816CF1BD16B79418F0266F0FF904E06045F276DF187ED72B8F6641B065B854A7D3F152B8E153CD77EC605E5B75454245745DC0E0DCFC616F5246F868B6EE5A1DF56C4906C5C34BC42309D370733E50D9A1ADDC3F37CBE4
-- B331AC7D3A920C794484A16B05599F46F42046A6DC9063B1D5A8AE1F
-- aes_128_mmt_decrypt_tb.vhd:394:13:@7305ns:(report note): PLAINTEXT_OUT (actual full)   = 
-- A2E19C08FA204640B1BC73BEAC58F81A7923F3EF2A0AFFCF1568C9179D816CF1BD16B79418F0266F0FF904E06045F276DF187ED72B8F6641B065B854A7D3F152B8E153CD77EC605E5B75454245745DC0E0DCFC616F5246F868B6EE5A1DF56C4906C5C34BC42309D370733E50D9A1ADDC3F37CBE4B
-- 331AC7D3A920C794484A16B05599F46F42046A6DC9063B1D5A8AE1F
-- aes_128_mmt_decrypt_tb.vhd:399:17:@7305ns:(report note): Correct plaintext output
-- aes_128_mmt_decrypt_tb.vhd:352:13:@7315ns:(report note): Running MMT DECRYPT COUNT = 9
-- aes_128_mmt_decrypt_tb.vhd:382:17:@7465ns:(report note):   BLOCK 0 expected = 9C29EECB2DE04254FAFB896A994102D1
-- aes_128_mmt_decrypt_tb.vhd:385:17:@7465ns:(report note):   BLOCK 0 actual   = 9C29EECB2DE04254FAFB896A994102D1
-- aes_128_mmt_decrypt_tb.vhd:382:17:@7625ns:(report note):   BLOCK 1 expected = DA30DDB49D82728EB23DBD029901E9B7
-- aes_128_mmt_decrypt_tb.vhd:385:17:@7625ns:(report note):   BLOCK 1 actual   = DA30DDB49D82728EB23DBD029901E9B7
-- aes_128_mmt_decrypt_tb.vhd:382:17:@7785ns:(report note):   BLOCK 2 expected = 5B3D0AEE03F7A05F6C852D8FADA0B5C2
-- aes_128_mmt_decrypt_tb.vhd:385:17:@7785ns:(report note):   BLOCK 2 actual   = 5B3D0AEE03F7A05F6C852D8FADA0B5C2
-- aes_128_mmt_decrypt_tb.vhd:382:17:@7945ns:(report note):   BLOCK 3 expected = 8E8C9AED334FAD11829DF3DFADC5C2E4
-- aes_128_mmt_decrypt_tb.vhd:385:17:@7945ns:(report note):   BLOCK 3 actual   = 8E8C9AED334FAD11829DF3DFADC5C2E4
-- aes_128_mmt_decrypt_tb.vhd:382:17:@8105ns:(report note):   BLOCK 4 expected = 71EB41AF9E48A8A465E03D5EBDB02169
-- aes_128_mmt_decrypt_tb.vhd:385:17:@8105ns:(report note):   BLOCK 4 actual   = 71EB41AF9E48A8A465E03D5EBDB02169
-- aes_128_mmt_decrypt_tb.vhd:382:17:@8265ns:(report note):   BLOCK 5 expected = 15081F3B5A0EBB2308DFC2D28E5A8BA3
-- aes_128_mmt_decrypt_tb.vhd:385:17:@8265ns:(report note):   BLOCK 5 actual   = 15081F3B5A0EBB2308DFC2D28E5A8BA3
-- aes_128_mmt_decrypt_tb.vhd:382:17:@8425ns:(report note):   BLOCK 6 expected = F32ADAE4C3575921BC657B63D46BA5A6
-- aes_128_mmt_decrypt_tb.vhd:385:17:@8425ns:(report note):   BLOCK 6 actual   = F32ADAE4C3575921BC657B63D46BA5A6
-- aes_128_mmt_decrypt_tb.vhd:382:17:@8585ns:(report note):   BLOCK 7 expected = 18880EE9AD8AF3FBA5643A5026FACD7D
-- aes_128_mmt_decrypt_tb.vhd:385:17:@8585ns:(report note):   BLOCK 7 actual   = 18880EE9AD8AF3FBA5643A5026FACD7D
-- aes_128_mmt_decrypt_tb.vhd:382:17:@8745ns:(report note):   BLOCK 8 expected = 667CE599327F936CDDA7E1BB742A33A0
-- aes_128_mmt_decrypt_tb.vhd:385:17:@8745ns:(report note):   BLOCK 8 actual   = 667CE599327F936CDDA7E1BB742A33A0
-- aes_128_mmt_decrypt_tb.vhd:382:17:@8905ns:(report note):   BLOCK 9 expected = 19990B76BE648A6EC725DAED540ED9E7
-- aes_128_mmt_decrypt_tb.vhd:385:17:@8905ns:(report note):   BLOCK 9 actual   = 19990B76BE648A6EC725DAED540ED9E7
-- aes_128_mmt_decrypt_tb.vhd:391:13:@8915ns:(report note): PLAINTEXT_OUT (expected full) = 
-- 9C29EECB2DE04254FAFB896A994102D1DA30DDB49D82728EB23DBD029901E9B75B3D0AEE03F7A05F6C852D8FADA0B5C28E8C9AED334FAD11829DF3DFADC5C2E471EB41AF9E48A8A465E03D5EBDB0216915081F3B5A0EBB2308DFC2D28E5A8BA3F32ADAE4C3575921BC657B63D46BA5A618880EE9A
-- D8AF3FBA5643A5026FACD7D667CE599327F936CDDA7E1BB742A33A019990B76BE648A6EC725DAED540ED9E7
-- aes_128_mmt_decrypt_tb.vhd:394:13:@8915ns:(report note): PLAINTEXT_OUT (actual full)   = 
-- 9C29EECB2DE04254FAFB896A994102D1DA30DDB49D82728EB23DBD029901E9B75B3D0AEE03F7A05F6C852D8FADA0B5C28E8C9AED334FAD11829DF3DFADC5C2E471EB41AF9E48A8A465E03D5EBDB0216915081F3B5A0EBB2308DFC2D28E5A8BA3F32ADAE4C3575921BC657B63D46BA5A618880EE9A
-- D8AF3FBA5643A5026FACD7D667CE599327F936CDDA7E1BB742A33A019990B76BE648A6EC725DAED540ED9E7
-- aes_128_mmt_decrypt_tb.vhd:399:17:@8915ns:(report note): Correct plaintext output
-- aes_128_mmt_decrypt_tb.vhd:409:9:@8925ns:(report note): MMT DECRYPT set finished
-- aes_128_mmt_decrypt_tb.vhd:410:9:@8925ns:(report note): PASS COUNT = 10
-- aes_128_mmt_decrypt_tb.vhd:411:9:@8925ns:(report note): FAIL COUNT = 0
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.aes_package.all;

entity aes_128_mmt_decrypt_tb is
end aes_128_mmt_decrypt_tb;

architecture Behavioral of aes_128_mmt_decrypt_tb is
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

    constant NUM_TESTS  : integer := 10;
    constant MAX_BLOCKS : integer := 10;  -- longest message here is 10 AES blocks

    type key_array_t is array (natural range <>) of std_logic_vector(127 downto 0);
    type blocks_array_t is array (natural range <>) of integer range 1 to MAX_BLOCKS;
    type msg_array_t is array (natural range <>) of std_logic_vector((MAX_BLOCKS*128)-1 downto 0);

    component aes_decrypt_controller is
    Port (
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;
           key_ready : in STD_LOGIC;
           ciphertext_ready : in STD_LOGIC;
           aes_decrypt_done : out STD_LOGIC;
           key_in : in std_logic_vector(127 downto 0);
           ciphertext_in : in STD_LOGIC_VECTOR (127 downto 0);
           plaintext_out : out STD_LOGIC_VECTOR (127 downto 0)
    );
    end component;

    constant KEYS : key_array_t(0 to NUM_TESTS-1) := (
        0 => x"54b760dd2968f079ac1d5dd20626445d",
        1 => x"bce4c486cc4a12622b9147df9bca452c",
        2 => x"279161759d29e92dc8f1fafd8d45533d",
        3 => x"9ba852520c9fd1eb367b6ad2aed07abd",
        4 => x"cd6a33abb95d7ab92980f9c2b810c90f",
        5 => x"ff71b9f6311a44072ddb1a77488c4870",
        6 => x"8ec6a5a054fea2fc8dafb5939a4bd788",
        7 => x"b53e54b1b09f78abcd6afac1f7e7cda9",
        8 => x"9e79b681c57d7feb7db7e8a6ad41382c",
        9 => x"44f0ee626d0446e0a3924cfb078944bb"
    );

    constant NUM_BLOCKS_PER_TEST : blocks_array_t(0 to NUM_TESTS-1) := (
        0 => 1,
        1 => 2,
        2 => 3,
        3 => 4,
        4 => 5,
        5 => 6,
        6 => 7,
        7 => 8,
        8 => 9,
        9 => 10
    );

    -- Each message is right-padded with zeros out to 10 blocks total.
    -- Real data is stored in the most-significant bits first, block 0 at the far left.
    constant CIPHERS : msg_array_t(0 to NUM_TESTS-1) := (
        0 =>
            x"065bd5a9540d22d5d7b0f75d66cb8b30" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000",

        1 =>
            x"76fa67e121894dbc2ad85ae7f9c5c44d" &
            x"14ccee5b87d5e7708950338f5c84cf58" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000",

        2 =>
            x"1ce69ab7624fed511fb42b8fb639f566" &
            x"d72783f9ab49801651961b048e0f5b7c" &
            x"c0ebb2f514f2d625f927ccc4d5a94593" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000",

        3 =>
            x"6c53489f6a4bd0f7cd15d20f6ebc7e64" &
            x"9fd95b76b107e6daba967c8a9484797f" &
            x"29a8a282ee31c03fae4f8e9b8930d547" &
            x"3c2ed695a347e88b7ccd62376d5ebb41" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000",

        4 =>
            x"33cb1a98ce4be97f5b222aa861c94564" &
            x"3f372687cbf7f8193a7d304e40baceb8" &
            x"77eedfbc05be47437a86bdb1f7f0171b" &
            x"95c6c8b50404a7897332f26fb0f09239" &
            x"91d3a02e926f29babfb52e63d580efff" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000",

        5 =>
            x"19d76b386a7715dec7aad8bb01d126c7" &
            x"385a4387f087faec67718f78274cf4a2" &
            x"d7ec3f7c56885c930bbfff1676d8dd3b" &
            x"0b4e1cdf418c086de6f50700b527cfcc" &
            x"2a81d6ba95e30a526eb4c3dee82af6cc" &
            x"c8c5ab55781db15c57de90995411bff6" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000",

        6 =>
            x"4d6f972946a2e4ca05bfbeecd00535ec" &
            x"e6c81ed963c4167063b1c34b6a185d55" &
            x"04646d81a83cd5bce2101120b2f2bc6a" &
            x"2fa856ae6fff4449ab6218189faa13e7" &
            x"3038e82c5141c3f6276a8a206b9563ca" &
            x"11fa76092779f4deff2e58659047ed4f" &
            x"1a129092095ab75f1cf4b255c69531f4" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000",

        7 =>
            x"447557bd1561b09a082cabdbf49b0612" &
            x"b46c9793db3c987aa4a843ef28b39fa8" &
            x"d46799b019c0566765c5c8cb53f87ff5" &
            x"1ff0c2e65c45df84e9acbfe02163bdba" &
            x"52d0b847706567320bc6ede07f2eaef8" &
            x"6b0f602364f86510eabc58bc9ad1e6f0" &
            x"a6f6df0b83188c01e17744a4e0053a22" &
            x"810e99cf5a1ed3258f203509fdc3c050" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000",

        8 =>
            x"fa2e97bed2f0b76ed2f8c1275f6d50ec" &
            x"fc1131240622ba9da17e5dd0f20a7d67" &
            x"8f537ffc33762524b73e17ac3d8dc322" &
            x"affd679768c66ca430e3f6ab6e70b95f" &
            x"99570e87f02b46ff6b543efff16d339f" &
            x"cbead89b59fea65403bc7418737c47a3" &
            x"01806be66fd7c307d7825da8e1d6496c" &
            x"3921acb7419010b60350fea069f4cf3b" &
            x"b017bfa11a424344e3109d30778fad90" &
            x"00000000000000000000000000000000",

        9 =>
            x"931b2f5f3a5820d53a6beaaa6431083a" &
            x"3488f4eb03b0f5b57ef838e157962310" &
            x"3bd6e6800377538b2e51ef708f3c4956" &
            x"432e8a8ee6a34e190642b26ad8bdae6c" &
            x"2af9a6c7996f3b6004d2671e41f1c9f4" &
            x"0ee03d1c4a52b0a0654a331f15f34dce" &
            x"4acb96bd6507815ca4347a3de11a311b" &
            x"7de5351c9787c4538158e28974ffa83d" &
            x"8296dfe9cd09cd87f7bf4f54d97d28d4" &
            x"788799163408323943b3e72f5eab66c1"
    );

    constant PLAINTEXTS : msg_array_t(0 to NUM_TESTS-1) := (
        0 =>
            x"46f2c98932349c338e9d67f744a1c988" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000",

        1 =>
            x"8c8e6ed8a6bdb3baabec78189b7d6101" &
            x"0d6d168de2c08ec56f9b9c004a191e21" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000",

        2 =>
            x"8838058bd98072b72fd75641edb21630" &
            x"1fee8323ff8c4ba18ee6a4623c2fdeb3" &
            x"df5f8a240a8e7e6d5ae15444614f41fb" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000",

        3 =>
            x"6061df5bcd421fabdb5235fc03250265" &
            x"0448fd8233a0237c5f6f249a63d7db3e" &
            x"4283ac9a8684a363ef64e760c5886564" &
            x"659da619466851568b32091df5516f57" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000",

        4 =>
            x"3f098ae7e7524ddb556403c5d3d0b10e" &
            x"5db6c324843ca54a47e34ad9bdbccc93" &
            x"a645e96f2e98651751f0f1a697398ea8" &
            x"01a69079c1808b6a8e3bb02a4cf3292f" &
            x"1a7a05b954571339f7899f9aaa2ae1e9" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000",

        5 =>
            x"3dfe918048f4c0b0b22fbc55e5af751c" &
            x"f3e6ce348eb9a888795033f6dd216afb" &
            x"ea65fc8df41c0ce6c7316a8183d36060" &
            x"bf19709fe2bec6d13bbdf1a434cc5b8f" &
            x"10aadb368c269d2dc4474a1f8112640f" &
            x"e52803b1883cb7756743100a758dd862" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000",

        6 =>
            x"6e19cec775595c2f768de3bda3682fb4" &
            x"026ed1889fc3de11bc45a2a3e2b22694" &
            x"ddaab3274c81b29204fa034eedac564a" &
            x"7dfe27aabb6ff420f9aa5abadf15c746" &
            x"76efeabd96a7ff2491813ba53cb5ab76" &
            x"eacd37255a28daecbbe580f5eb77f9bc" &
            x"0339e0da59b2b307f52974b6182cb106" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000",

        7 =>
            x"398db04b45a724393e4baec86a220f22" &
            x"358df1bbf0cab278dcfecf7a3f8f6275" &
            x"ef45ed9f039bc1f5030c3a0c245fbb6e" &
            x"a0bff3e2da0859ac498db6624a572023" &
            x"de7c221bf3567f51e98947970dfc581b" &
            x"3ca670ab92953d3bdd97dbf5d6bef8aa" &
            x"2f31500d221198ed9f23b049eaeed676" &
            x"83083034b4a5a82a0e49319e368c6f55" &
            x"00000000000000000000000000000000" &
            x"00000000000000000000000000000000",

        8 =>
            x"a2e19c08fa204640b1bc73beac58f81a" &
            x"7923f3ef2a0affcf1568c9179d816cf1" &
            x"bd16b79418f0266f0ff904e06045f276" &
            x"df187ed72b8f6641b065b854a7d3f152" &
            x"b8e153cd77ec605e5b75454245745dc0" &
            x"e0dcfc616f5246f868b6ee5a1df56c49" &
            x"06c5c34bc42309d370733e50d9a1addc" &
            x"3f37cbe4b331ac7d3a920c794484a16b" &
            x"05599f46f42046a6dc9063b1d5a8ae1f" &
            x"00000000000000000000000000000000",

        9 =>
            x"9c29eecb2de04254fafb896a994102d1" &
            x"da30ddb49d82728eb23dbd029901e9b7" &
            x"5b3d0aee03f7a05f6c852d8fada0b5c2" &
            x"8e8c9aed334fad11829df3dfadc5c2e4" &
            x"71eb41af9e48a8a465e03d5ebdb02169" &
            x"15081f3b5a0ebb2308dfc2d28e5a8ba3" &
            x"f32adae4c3575921bc657b63d46ba5a6" &
            x"18880ee9ad8af3fba5643a5026facd7d" &
            x"667ce599327f936cdda7e1bb742a33a0" &
            x"19990b76be648a6ec725daed540ed9e7"
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
        variable pass_count  : integer := 0;
        variable fail_count  : integer := 0;
        variable actual_msg  : std_logic_vector((MAX_BLOCKS*128)-1 downto 0);
        variable exp_msg     : std_logic_vector((MAX_BLOCKS*128)-1 downto 0);
        variable block_in    : std_logic_vector(127 downto 0);
        variable block_total : integer;
    begin
        report "Running MMT DECRYPT set";

        wait until rising_edge(clk);
        reset <= '1';
        start <= '0';
        key_ready <= '0';
        ciphertext_ready <= '0';

        wait until rising_edge(clk);
        reset <= '0';
        wait until rising_edge(clk);

        for i in 0 to NUM_TESTS-1 loop
            report "Running MMT DECRYPT COUNT = " & integer'image(i);

            actual_msg := (others => '0');
            exp_msg := PLAINTEXTS(i);
            block_total := NUM_BLOCKS_PER_TEST(i);

            for b in 0 to block_total-1 loop
                -- takes block b from the left side of the concatenated message
                block_in := CIPHERS(i)((MAX_BLOCKS*128 - 1) - (b*128) downto (MAX_BLOCKS*128 - 128) - (b*128));

                key_in <= KEYS(i);
                ciphertext_in <= block_in;

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

                -- stores block output back into same message position
                actual_msg((MAX_BLOCKS*128 - 1) - (b*128) downto (MAX_BLOCKS*128 - 128) - (b*128)) := plaintext_out;

                report "  BLOCK " & integer'image(b) & " expected = " &
                       to_hstring(exp_msg((MAX_BLOCKS*128 - 1) - (b*128) downto (MAX_BLOCKS*128 - 128) - (b*128)));

                report "  BLOCK " & integer'image(b) & " actual   = " &
                       to_hstring(plaintext_out);

                wait until rising_edge(clk);
            end loop;

            report "PLAINTEXT_OUT (expected full) = " &
                   to_hstring(exp_msg((MAX_BLOCKS*128)-1 downto (MAX_BLOCKS - block_total)*128));

            report "PLAINTEXT_OUT (actual full)   = " &
                   to_hstring(actual_msg((MAX_BLOCKS*128)-1 downto (MAX_BLOCKS - block_total)*128));

            if actual_msg((MAX_BLOCKS*128)-1 downto (MAX_BLOCKS - block_total)*128) =
               exp_msg((MAX_BLOCKS*128)-1 downto (MAX_BLOCKS - block_total)*128) then
                report "Correct plaintext output";
                pass_count := pass_count + 1;
            else
                report "Wrong plaintext output" severity error;
                fail_count := fail_count + 1;
            end if;

            wait until rising_edge(clk);
        end loop;

        report "MMT DECRYPT set finished";
        report "PASS COUNT = " & integer'image(pass_count);
        report "FAIL COUNT = " & integer'image(fail_count);

        wait;
    end process;

end Behavioral;