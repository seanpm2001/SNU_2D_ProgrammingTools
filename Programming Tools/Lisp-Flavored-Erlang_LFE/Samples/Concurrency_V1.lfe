(defmodule messenger-back
 (export (print-result 0) (send-message 2)))

(defun print-result ()
  (receive
    ((tuple pid msg)
      (io:format "Received message: '~s'~n" (list msg))
      (io:format "Sending message to process ~p ...~n" (list pid))
      (! pid (tuple msg))
      (print-result))))

(defun send-message (calling-pid msg)
  (let ((spawned-pid (spawn 'messenger-back 'print-result ())))
    (! spawned-pid (tuple calling-pid msg))))
