structure Rational : ARITH =
struct
        datatype t = Rat of int * int
        val zero = Rat (0, 1)
        fun succ (Rat (a, b)) = Rat (a + b, b)
        fun sum (Rat (a, b), Rat (c, d)) = Rat (a * d + c * b , b * d)
end
