; Start of script
(defun factorial (n &optional (acc 1))
   (if (= n 0) acc
       (factorial (- n 1) (* acc n))))
; End of script
