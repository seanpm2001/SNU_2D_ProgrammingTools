 ;; expansion of UNTIL makes liberal use of DO
 (defmacro until (expression &body body)
   `(do () (,expression) ,@body))

 ;; macrolet establishes lexical operator binding for DO
 (macrolet ((do (...) ... something else ...))
   (until (= (random 10) 0) (write-line "Hello")))
