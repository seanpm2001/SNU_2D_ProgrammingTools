 ;; Sorts the list according to the first element of each sub-list.
 (sort (list '(9 A) '(3 B) '(4 C)) #'< :key #'first)   ; Returns ((3 B) (4 C) (9 A))
