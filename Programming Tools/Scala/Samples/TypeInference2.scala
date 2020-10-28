def factorial(x: Int): Int =
  if (x == 0)
    1
  else
    x*factorial(x - 1)
