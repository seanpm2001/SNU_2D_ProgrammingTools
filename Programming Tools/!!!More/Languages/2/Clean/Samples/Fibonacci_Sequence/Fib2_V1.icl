fibs :: Int Int -> [Int]
fibs x_2 x_1 = [x_2:fibs x_1 (x_2 + x_1)]

fib :: Int -> Int
fib n = (fibs 1 1) !! n

Start = fib 7
