(let ((hello1 (lambda (p) (display "Hello world" p) (newline p))))
  (call-with-output-file "helloworldoutputfile" hello1))