(defclass person ()
  ((name :initarg :name :accessor person-name)
   (age  :initarg :age  :accessor person-age))
  (:documentation "The class PERSON with slots NAME and AGE."))

(defmethod display ((object person) stream)
  "Displaying a PERSON object to an output stream."
  (with-slots (name age) object
    (format stream "~a (~a)" name age)))

(defparameter *group*
  (list (make-instance 'person :name "Bob"   :age 33)
        (make-instance 'person :name "Chris" :age 16)
        (make-instance 'person :name "Ash"   :age 23))
  "A list of PERSON objects.")

(dolist (person (sort (copy-list *group*)
                      #'>
                      :key #'person-age))
  (display person *standard-output*)
  (terpri))
