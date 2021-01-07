(defmacro until (test &body body)
  (let ((start-tag (gensym "START"))
        (end-tag   (gensym "END")))
    `(tagbody ,start-tag
              (when ,test (go ,end-tag))
              (progn ,@body)
              (go ,start-tag)
              ,end-tag)))
