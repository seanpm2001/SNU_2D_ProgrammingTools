(let ((ev (lambda(n) (display "Evaluating ")
                     (display (if (procedure? n) "procedure" n))
                     (newline) n)))
  ((ev +) (ev 1) (ev 2)))
===> 3