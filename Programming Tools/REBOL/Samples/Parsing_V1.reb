Digit: charset [#"0" - #"9"]
Value: [some Digit | "(" Expr ")"]
Product: [Value any [["*"| "/"] Value]]
Sum: [Product any [["+"| "-"] Product]]
Expr: Sum
parse/all "12+13" Expr
