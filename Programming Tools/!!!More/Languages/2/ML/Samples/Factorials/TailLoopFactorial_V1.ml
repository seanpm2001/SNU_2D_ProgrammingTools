fun fact n = let
  fun fac 0 acc = acc
    | fac n acc = fac (n - 1) (n * acc)
  in
    if (n < 0) then raise Domain else fac n 1
  end

