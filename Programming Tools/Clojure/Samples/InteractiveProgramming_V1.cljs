;; define a var
(def a 42)
;; => #'user/a

;; call a function named `+`
(+ a 8)
;; => 50

;; call a function named `even?`
(even? a)
;; => true

;; define a function that returns the remainder of `n` when divided by 10
(defn foo [n] (rem n 10))
;; => #'user/foo

;; call the function
(foo a)
;; => 2

;; print the docstring of `rem`
(doc rem)
;; =>
-------------------------
clojure.core/rem
([num div])
 remainder of dividing numerator by denominator.

;; print the source of `rem`
(source rem)
;; =>
(defn rem
  "remainder of dividing numerator by denominator."
  {:added "1.0"
   :static true
   :inline (fn [x y] `(. clojure.lang.Numbers (remainder ~x ~y)))}
  [num div]
    (. clojure.lang.Numbers (remainder num div)))
