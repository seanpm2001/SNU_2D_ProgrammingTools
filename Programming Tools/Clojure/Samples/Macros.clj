(def bit-bucket-writer
  (proxy [java.io.Writer] []
    (write [buf] nil)
    (close []    nil)
    (flush []    nil)))

(defmacro noprint
  "Evaluates the given `forms` with all printing to `*out*` silenced."
  [& forms]
  `(binding [*out* bit-bucket-writer]
     ~@forms))

(noprint
  (println "Hello, nobody!"))
;; => nil
