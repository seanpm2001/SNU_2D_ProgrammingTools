#lang typed/racket

(: fact (Integer -> Integer))
(define (fact n)
  (if (zero? n) 1 (* n (fact (- n 1)))))
