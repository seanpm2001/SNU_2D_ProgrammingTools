;; call a function (code)
(+ 1 1)
;; => 2

;; quote the function call
;; (turning code into data, which is a list of symbols)
(quote (+ 1 1))
;; => (+ 1 1)

;; get the first element on the list
;; (operating on code as data)
(first (quote (+ 1 1)))
;; => +

;; get the last element on the list
;; (operating on code as data)
(last (quote (+ 1 1)))
;; => 1

;; get a new list by replacing the symbols on the original list
;; (manipulating code as data)
(map (fn [form]
       (case form
         1 'one
         + 'plus))
     (quote (+ 1 1)))
;; => (plus one one)
