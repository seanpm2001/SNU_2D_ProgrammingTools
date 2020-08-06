(define (find-first func lst)
  (call-with-current-continuation
   (lambda (return-immediately)
     (for-each (lambda (x)
		 (if (func x)
		     (return-immediately x)))
	       lst)
     #f)))

(find-first integer? '(1/2 3/4 5.6 7 8/9 10 11))
===> 7
(find-first zero? '(1 2 3 4))
===> #f