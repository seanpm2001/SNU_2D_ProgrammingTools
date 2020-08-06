;; Sum of four rational real numbers
(define xr (+ 1/3 1/4 -1/5 405/50))
;; Sum of two rational real numbers
(define xi (+ -1/3 2/3))
xr
===> 8.48333333333333
xi
===> 0.333333333333333
;; Check for exactness.
(exact? xr)
===> #f
(exact? xi)
===> #f
