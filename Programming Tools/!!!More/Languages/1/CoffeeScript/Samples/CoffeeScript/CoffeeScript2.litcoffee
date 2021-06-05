gcd = (x, y) ->
  [x, y] = [y, x%y] until y is 0
  x

