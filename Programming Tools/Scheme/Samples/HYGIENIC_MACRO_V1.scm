;; Define a macro to implement a variant of "if" with a multi-expression
;; true branch and no false branch.
(define-syntax when
  (syntax-rules ()
    ((when pred exp exps ...)
      (if pred (begin exp exps ...)))))