fun fact n = let
  fun fac 0 = 1
    | fac n = n * fac (n - 1)
  in
    if (n < 0) then raise Domain else fac n
  end
