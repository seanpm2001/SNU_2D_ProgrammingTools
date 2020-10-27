;; call an instance method
(.toUpperCase "apple")
;; => "APPLE"

;; call a static method
(System/getProperty "java.vm.version")
;; => "12+33"

;; create an instance of `java.util.HashMap` and
;; add some entries
(doto (java.util.HashMap.)
  (.put "apple" 1)
  (.put "banana" 2))
;; => {"banana" 2, "apple" 1}

;; create an instance of `java.util.ArrayList` and
;; increment its elements with `clojure.core/map`
(def al (doto (java.util.ArrayList.)
          (.add 1)
          (.add 2)
          (.add 3)))

(map inc al)
;; => (2 3 4)

;; show a message dialog using Java Swing
(javax.swing.JOptionPane/showMessageDialog
  nil
  "Hello, World!")
;; => nil

