  (defvar *stashed*) ;; will hold a function

  (tagbody
    (setf *stashed* (lambda () (go some-label)))
    (go end-label) ;; skip the (print "Hello")
   some-label
    (print "Hello")
   end-label)
  -> NIL
