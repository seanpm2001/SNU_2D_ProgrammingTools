(defun switch-to-next-window-in-split ()
  (set-window-buffer (next-window) (other-buffer)))

(advice-add 'split-window-below :before #'switch-to-next-window-in-split)
