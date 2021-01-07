(defun available-shells (&optional (file #p"/etc/shells"))
  (list-matching-lines
   file
   (lambda (line)
     (and (plusp (length line))
          (char= (char line 0) #\/)
          (pathname
           (string-right-trim '(#\space #\tab) line))))))
