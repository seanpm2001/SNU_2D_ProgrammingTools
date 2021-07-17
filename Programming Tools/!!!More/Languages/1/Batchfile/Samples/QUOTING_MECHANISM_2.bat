C:\>set foo="this string is enclosed in quotes"

C:\>set foo=%foo:"="""%

C:\>echo "test 1 %foo%"
"test 1 """this string is enclosed in quotes""""

C:\>eventcreate /T Warning /ID 1 /L System /SO "Source" /D "Example: %foo%"
SUCCESS: A 'Warning' type event is created in the 'Source' log/source.
