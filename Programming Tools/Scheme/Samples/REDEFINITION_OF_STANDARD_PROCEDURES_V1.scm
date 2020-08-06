(set! +
      (let ((original+ +))
        (lambda args
          (apply (if (or (null? args) (string? (car args)))
                     string-append
                     original+)
                 args))))
(+ 1 2 3)
===> 6
(+ "1" "2" "3")
===> "123"