(defun get-answer (library)
  (gethash 'answer library 42))

(defun the-answer-1 (library)
  (format nil "The answer is ~A" (get-answer library)))
;;;; Returns "The answer is 42" if ANSWER not present in LIBRARY

(defun the-answer-2 (library)
  (multiple-value-bind (answer sure-p)
      (get-answer library)
    (if (not sure-p)
        "I don't know"
     (format nil "The answer is ~A" answer))))
;;;; Returns "I don't know" if ANSWER not present in LIBRARY
