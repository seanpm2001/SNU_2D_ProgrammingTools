(let loop ((n 1))
  (if (> n 10)
      '()
      (cons n
	    (loop (+ n 1)))))

===> (1 2 3 4 5 6 7 8 9 10)