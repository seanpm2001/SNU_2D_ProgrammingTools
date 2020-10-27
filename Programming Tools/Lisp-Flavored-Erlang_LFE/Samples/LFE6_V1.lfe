      (defun universal-server ()
        (receive
          ((tuple 'become func)
           (funcall func))))
