      (defun universal-server ()
        (receive
          (`#(become ,func)
            (funcall func))))
