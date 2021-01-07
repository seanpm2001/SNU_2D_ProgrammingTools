(defun power (x n)
  (loop with result = 1
        while (plusp n)
        when (oddp n) do (setf result (* result x))
        do (setf x (* x x)
                 n (truncate n 2))
        finally (return result)))
