(define a 10)
(define eval-aplus2 (delay (+ a 2)))
(set! a 20)
(force eval-aplus2)
===> 22
(define eval-aplus50 (delay (+ a 50)))
(let ((a 8))
  (force eval-aplus50))
===> 70
(set! a 100)
(force eval-aplus2)
===> 22
