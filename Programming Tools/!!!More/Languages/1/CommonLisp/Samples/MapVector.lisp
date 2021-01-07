 (defmethod add ((a vector) (b vector))
   (map 'vector #'+ a b))
