(defconstant +year-size+ 365)

(defun birthday-paradox (probability number-of-people)
  (let ((new-probability (* (/ (- +year-size+ number-of-people)
                               +year-size+)
                            probability)))
    (if (< new-probability 0.5)
        (1+ number-of-people)
        (birthday-paradox new-probability (1+ number-of-people)))))
