fun reverse [] = []
  | reverse (x :: xs) = (reverse xs) @ [x]
