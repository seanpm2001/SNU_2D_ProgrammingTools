(let ((x 1266778)
      (y 458))
  (multiple-value-bind (quotient remainder)
      (truncate x y)
    (format nil "~A divided by ~A is ~A remainder ~A" x y quotient remainder)))

;;;; => "1266778 divided by 458 is 2765 remainder 408"
