      (defun sum (l) (sum l 0))
      (defun sum
        (('() total) total)
        (((cons h t) total) (sum t (+ h total))))
