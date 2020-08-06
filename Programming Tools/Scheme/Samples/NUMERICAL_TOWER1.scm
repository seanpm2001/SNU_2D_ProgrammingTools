;; Sum of three rational real numbers and two rational complex numbers
(define x (+ 1/3 1/4 -1/5 -1/3i 405/50+2/3i))
x
===> 509/60+1/3i
;; Check for exactness.
(exact? x)
===> #t