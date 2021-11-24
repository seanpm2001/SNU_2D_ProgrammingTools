-- We can create lambda functions with the `\[arg] -> [expression]` syntax.
hello : String -> String
hello = \s -> "Hi, " ++ s

