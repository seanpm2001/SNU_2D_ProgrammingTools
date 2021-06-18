sel=: adverb def 'u # ['
   
quicksort=: verb define
if. 1 >: #y do. y
else.
	(quicksort y <sel e),(y =sel e),quicksort y >sel e=.y{~?#y
end.
)
