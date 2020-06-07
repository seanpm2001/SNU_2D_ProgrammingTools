# Nim Wiki examples
# Hello World V1
echo("Hello, world!")
# Procedure can be called with no parentheses
echo "Hello, World!"
# Hello World V2
stdout.write("Hello, world!")
## This is documentation single line comment
# Reverse capability
proc reverse(s: string): string =
  for i in countdown(s.high, 0):
    result.add s[i]
let str1 = "Reverse This!"
echo "Reversed: ", reverse(str1)
# Integer stropping
var `type`: int
# Meta programming
template genType(name, fieldname: untyped, fieldtype: typedesc) =
  type
    name = object
      fieldname: fieldtype
genType(Test, foo, int)
var x = Test(foo: 4566)
echo(x.foo) # 4566
# FFI (Foreign Function Interface)
proc printf(formatstr: cstring) {.header: "<stdio.h>", varargs.}
printf("%s %d\n", "foo", 5)
# File version: 1 (October 25th 2019)
# First version: 1 (October 25th 2019)
# Examples from: https://en.wikipedia.org/wiki/Nim_(programming_language)