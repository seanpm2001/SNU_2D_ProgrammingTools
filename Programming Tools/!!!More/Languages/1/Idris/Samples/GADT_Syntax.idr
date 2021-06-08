data Tree : Type -> Type where
    Node : Tree a -> Tree a -> Tree a
    Leaf : a -> Tree a
