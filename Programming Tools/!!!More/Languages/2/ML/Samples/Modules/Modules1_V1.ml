signature ARITH =
sig
        type t
        val zero : t
        val succ : t -> t
        val sum : t * t -> t
end
