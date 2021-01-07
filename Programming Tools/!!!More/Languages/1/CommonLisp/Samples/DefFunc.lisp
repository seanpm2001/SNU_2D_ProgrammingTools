 (defun square (x)
   "Calculates the square of the single-float x."
   (declare (single-float x) (optimize (speed 3) (debug 0) (safety 1)))
   (the single-float (* x x)))
