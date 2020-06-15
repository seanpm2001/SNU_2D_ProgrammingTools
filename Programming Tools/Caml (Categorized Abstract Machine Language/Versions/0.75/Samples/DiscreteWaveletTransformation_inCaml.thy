# Start of script

# Discrete wavelet transform

# Version1

# let haar l =
   let rec aux l s d = 
     match l, s, d with
       [s], [], d -> s :: d
     | [], s, d -> aux s [] d
     | h1 :: h2 :: t, s, d -> aux t (h1 + h2 :: s) (h1 - h2 :: d)
     | _ -> invalid_arg "haar" 
     in aux l [] [];;
val haar : int list -> int list = <fun>

# Version2

# haar [1; 2; 3; 4; -4; -3; -2; -1];;
   - : int list = [0; 20; 4; 4; -1; -1; -1; -1]

# End of script
