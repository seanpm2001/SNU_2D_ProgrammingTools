fun fac (0 : int) : int = 1
  | fac (n : int) : int = n * fac (n - 1)
