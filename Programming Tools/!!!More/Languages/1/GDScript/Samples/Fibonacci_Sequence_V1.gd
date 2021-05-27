func _ready():
	var nterms = 5
	print("Fibonacci sequence:")  
	for i in range(nterms):
		print(FibRecursion(i))
	
func FibRecursion(n):  
   if n <= 1:  
	   return n  
   else:  
	   return(FibRecursion(n-1) + FibRecursion(n-2))
