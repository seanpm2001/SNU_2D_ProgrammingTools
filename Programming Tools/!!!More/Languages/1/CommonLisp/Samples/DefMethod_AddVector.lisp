 (defmethod add ((a vector) (b number))
   (map 'vector (lambda (n) (+ n b)) a))
