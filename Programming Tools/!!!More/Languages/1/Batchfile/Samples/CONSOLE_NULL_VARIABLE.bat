C:\>set MyVar=
C:\>echo %MyVar%
%MyVar%

C:\>if "%MyVar%"=="" (echo MyVar is not defined) else (echo MyVar is %MyVar%)
MyVar is %MyVar%
