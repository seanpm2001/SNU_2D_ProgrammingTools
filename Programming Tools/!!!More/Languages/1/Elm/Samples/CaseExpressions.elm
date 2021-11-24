-- It is possible to inspect these types with case-expressions.
depth : Tree a -> Int
depth tree =
    case tree of
        Empty ->  0
        Node _ left right ->
            1 + max (depth left) (depth right)
