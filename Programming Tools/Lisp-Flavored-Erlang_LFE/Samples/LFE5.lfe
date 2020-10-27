(defun handle_info
  (('ping (= (match-state remote-pid 'undefined) state))
    (gen_server:cast (self) 'ping)
    `#(noreply ,state))
  (('ping state)
   `#(noreply ,state)))
