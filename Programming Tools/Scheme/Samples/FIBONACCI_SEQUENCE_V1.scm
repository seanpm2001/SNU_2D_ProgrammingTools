;; Define the Fibonacci sequence:
(define fibs
  (stream-cons 0
    (stream-cons 1
      (stream-map +
        fibs
        (stream-cdr fibs)))))
;; Compute the hundredth number in the sequence:
(stream-ref fibs 99)
===>  218922995834555169026
