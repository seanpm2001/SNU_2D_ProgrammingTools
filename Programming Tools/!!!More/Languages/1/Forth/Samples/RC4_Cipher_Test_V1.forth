hex
create AKey   61 c, 8A c, 63 c, D2 c, FB c,
: test   cr   0 DO  rc4_byte . LOOP  cr ;
AKey 5 rc4_init
2C F9 4C EE DC  5 test   \ output should be: F1 38 29 C9 DE
