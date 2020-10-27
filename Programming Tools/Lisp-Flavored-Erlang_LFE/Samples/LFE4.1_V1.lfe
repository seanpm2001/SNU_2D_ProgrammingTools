      (defun sum (l) (sum l 0))
      (defun sum
        (('() total) total)
        ((`(,h . ,t) total) (sum t (+ h total))))
