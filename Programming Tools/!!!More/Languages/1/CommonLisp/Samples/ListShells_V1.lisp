
(defun list-matching-lines (file predicate)
  "Returns a list of lines in file, for which the predicate applied to
 the line returns T."
  (with-open-file (stream file)
    (loop for line = (read-line stream nil nil)
          while line
          when (funcall predicate line)
          collect it)))

