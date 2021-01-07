 ;; The 'let' construct creates a scope for local variables. Here
 ;; the variable 'a' is bound to 6 and the variable 'b' is bound
 ;; to 4. Inside the 'let' is a 'body', where the last computed value is returned.
 ;; Here the result of adding a and b is returned from the 'let' expression.
 ;; The variables a and b have lexical scope, unless the symbols have been
 ;; marked as special variables (for instance by a prior DEFVAR).
 (let ((a 6)
       (b 4))
   (+ a b))        ; returns 10
