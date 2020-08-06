;; NB: with-output-to-file is an optional procedure in R5RS
(let ((hello0 (lambda () (display "Hello world") (newline))))
  (with-output-to-file "helloworldoutputfile" hello0))