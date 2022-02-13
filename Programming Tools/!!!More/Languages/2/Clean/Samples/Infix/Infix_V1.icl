(^) infixr 8 :: Int Int -> Int
(^) x 0 = 1
(^) x n = x * x ^ (n-1)

