; Start of script
(defun factorial (n)
   (loop for i from 1 to n
         for fac = 1 then (* fac i)
         finally (return fac)))
; End of script
