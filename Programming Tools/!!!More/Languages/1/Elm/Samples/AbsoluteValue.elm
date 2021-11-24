-- If-expressions are used to branch on `Bool` values
absoluteValue : number -> number
absoluteValue number =
    if number < 0 then negate number else number

