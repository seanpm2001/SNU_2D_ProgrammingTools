      (defun right-number?
        ((x) (when (orelse (== x 42) (== x 276709)))
          'true)
        ((_) 'false))

