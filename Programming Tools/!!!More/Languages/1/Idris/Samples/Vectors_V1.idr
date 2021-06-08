total
pairAdd : Num a => Vect n a -> Vect n a -> Vect n a
pairAdd Nil       Nil       = Nil
pairAdd (x :: xs) (y :: ys) = x + y :: pairAdd xs ys
