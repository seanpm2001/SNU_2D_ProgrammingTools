(let ((hello1 (lambda (p) (display "Hello world" p) (newline p)))
      (output-port (open-output-file "helloworldoutputfile")))
  (hello1 output-port)
  (close-output-port output-port))
