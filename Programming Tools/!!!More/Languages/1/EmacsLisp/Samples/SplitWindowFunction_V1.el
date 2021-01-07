(defun my-split-window-func ()
  (interactive)
  (split-window-below)
  (set-window-buffer (next-window) (other-buffer)))

(global-set-key "\C-x2" 'my-split-window-func )
