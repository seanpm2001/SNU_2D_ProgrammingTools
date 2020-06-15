# Start of script

# Numerical derivatives in caml

# Version1

let d delta f x =
  (f (x +. delta) -. f (x -. delta)) /. (2. *. delta);;
  
# Version2

# let d = d (sqrt epsilon_float);;
val d : (float -> float) -> float -> float = <fun>

# Version3

# d (fun x -> x *. x *. x -. x -. 1.) 3.;;
- : float = 26.

# Version4

# let f' = d (fun x -> x *. x *. x -. x -. 1.) ;;
val f' : float -> float = <fun>

# End of script
