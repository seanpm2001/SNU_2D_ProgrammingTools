C:\>set foo="this string is enclosed in quotation marks"

C:\>echo "test 1 %foo%"
"test 1 "this string is enclosed in quotation marks""

C:\>eventcreate /T Warning /ID 1 /L System /SO "Source" /D "Example: %foo%"
ERROR: Invalid Argument/Option - 'string'.
Type "EVENTCREATE /?" for usage.

