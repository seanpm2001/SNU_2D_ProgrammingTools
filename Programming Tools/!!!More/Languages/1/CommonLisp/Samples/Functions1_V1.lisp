 ;; Sorts the list using the > and < function as the relational operator.
 (sort (list 5 2 6 3 1 4) #'>)   ; Returns (6 5 4 3 2 1)
 (sort (list 5 2 6 3 1 4) #'<)   ; Returns (1 2 3 4 5 6)
