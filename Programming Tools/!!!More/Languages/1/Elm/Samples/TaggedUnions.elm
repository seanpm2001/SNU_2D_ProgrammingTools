-- We can create tagged unions with the `type` keyword.
-- The following value represents a binary tree.
type Tree a
    = Empty
    | Node a (Tree a) (Tree a)

