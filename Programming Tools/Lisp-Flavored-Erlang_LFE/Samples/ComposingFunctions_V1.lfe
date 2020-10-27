(defun compose (f g)
  (lambda (x)
   (funcall f
     (funcall g x))))

(defun check ()
  (let* ((sin-asin (compose #'sin/1 #'asin/1))
         (expected (sin (asin 0.5)))
         (compose-result (funcall sin-asin 0.5)))
    (io:format "Expected answer: ~p~n" (list expected))
    (io:format "Answer with compose: ~p~n" (list compose-result))))
