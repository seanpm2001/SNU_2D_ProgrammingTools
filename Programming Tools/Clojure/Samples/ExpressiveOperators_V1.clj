(->> (range 10)
     (map inc)
     (filter even?))
;; => (2 4 6 8 10)

;; This can also be achieved more efficiently using transducers:

(sequence (comp (map inc)
                (filter even?))
          (range 10))
;; => (2 4 6 8 10)

