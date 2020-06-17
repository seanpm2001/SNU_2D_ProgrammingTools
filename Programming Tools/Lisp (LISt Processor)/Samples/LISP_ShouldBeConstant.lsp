; Start of script
(defun should-be-constant ()
  '(one two three))

(let ((stuff (should-be-constant)))
  (setf (third stuff) 'bizarre))   ; bad!

(should-be-constant)   ; returns (one two bizarre)
; End of script
