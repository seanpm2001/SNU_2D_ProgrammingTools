# Start of script
(lambda (arg) (+ arg 1))
  ((lambda (arg) (+ arg 1)) 5)
(defun foo (a b c d) (+ a b c d))
(setf (fdefinition 'f) #'(lambda (a) (block f b...)))
# End of script
