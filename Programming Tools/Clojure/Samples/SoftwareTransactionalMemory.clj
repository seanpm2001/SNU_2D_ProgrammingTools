(defn run
  [nvecs nitems nthreads niters]
  (let [vec-refs
        (->> (* nvecs nitems)
             (range)
             (into [] (comp (partition-all nitems)
                            (map vec)
                            (map ref))))

        swap
        #(let [v1 (rand-int nvecs)
               v2 (rand-int nvecs)
               i1 (rand-int nitems)
               i2 (rand-int nitems)]
          (dosync
            (let [tmp (nth @(vec-refs v1) i1)]
              (alter (vec-refs v1) assoc i1 (nth @(vec-refs v2) i2))
              (alter (vec-refs v2) assoc i2 tmp))))

        report
        #(->> vec-refs
              (into [] (comp (map deref)
                             (map (fn [v] (prn v) v))
                             cat
                             (distinct)))
              (count)
              (println "Distinct:"))]

    (report)

    (->> #(dotimes [_ niters] (swap))
         (repeat nthreads)
         (apply pcalls)
         (dorun))

    (report)))

(run 100 10 10 100000)
;; =>
[0 1 2 3 4 5 6 7 8 9]
[10 11 12 13 14 15 16 17 18 19]
  ...
[990 991 992 993 994 995 996 997 998 999]
Distinct: 1000

[382 318 466 963 619 22 21 273 45 596]
[808 639 804 471 394 904 952 75 289 778]
  ...
[484 216 622 139 651 592 379 228 242 355]
Distinct: 1000
nil
