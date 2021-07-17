C:\>set foo=bar | baz
'baz' is not recognized as an internal or external command,
operable program or batch file.

C:\>set foo=bar ^| baz
C:\>echo %foo%
'baz' is not recognized as an internal or external command,
operable program or batch file.

C:\>set foo=bar ^^^| baz
C:\>echo %foo%
bar | baz
