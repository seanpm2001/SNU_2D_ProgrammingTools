gcd = (x, y) => {
  do {
    z = x % y
    x = y
    y = z
  } while (y !== 0)
  return x
}
