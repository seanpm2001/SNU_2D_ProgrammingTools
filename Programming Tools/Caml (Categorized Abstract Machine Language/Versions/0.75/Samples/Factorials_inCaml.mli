# Start of script

# Factorials in caml

# Version1

let rec fact n = if n=0 then 1 else n * fact(n - 1);;

# Version2

let rec fact = function
  | 0 -> 1
  | n -> n * fact(n - 1);;
  
# Version3

 # fact 12;;
 - : int = 479001600
 
 # End of script
 