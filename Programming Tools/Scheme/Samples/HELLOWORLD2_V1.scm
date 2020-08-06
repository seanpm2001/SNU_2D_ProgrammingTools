(let ((hello1 (lambda (p) (display "Hello world" p) (newline p))))
  (hello1 (current-output-port)))