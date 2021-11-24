-- This is a single line comment.

{-
This is a multi-line comment.
It is {- nestable. -}
-}

-- Here we define a value named `greeting`. The type is inferred as a `String`.
greeting =
    "Hello World!"

 -- It is best to add type annotations to top-level declarations.
hello : String
hello =
    "Hi there."

-- Functions are declared the same way, with arguments following the function name.
add x y =
    x + y

-- Again, it is best to add type annotations.
hypotenuse : Float -> Float -> Float
hypotenuse a b =
    sqrt (a^2 + b^2)

-- We can create lambda functions with the `\[arg] -> [expression]` syntax.
hello : String -> String
hello = \s -> "Hi, " ++ s

-- Function declarations may have the anonymous parameter names denoted by `_`, which are matched but not used in the body. 
const : a -> b -> a
const k _ = k


-- Functions are also curried; here we've curried the multiplication 
-- infix operator with a `2`
multiplyBy2 : number -> number
multiplyBy2 =
    (*) 2

-- If-expressions are used to branch on `Bool` values
absoluteValue : number -> number
absoluteValue number =
    if number < 0 then negate number else number

 -- Records are used to hold values with named fields
book : { title : String, author : String, pages : Int }
book =
    { title = "Steppenwolf"
    , author = "Hesse"
    , pages = 237 
    }

-- Record access is done with `.`
title : String
title =
    book.title

-- Record access `.` can also be used as a function
author : String
author =
    .author book

-- We can create tagged unions with the `type` keyword.
-- The following value represents a binary tree.
type Tree a
    = Empty
    | Node a (Tree a) (Tree a)

-- It is possible to inspect these types with case-expressions.
depth : Tree a -> Int
depth tree =
    case tree of
        Empty ->  0
        Node _ left right ->
            1 + max (depth left) (depth right)
