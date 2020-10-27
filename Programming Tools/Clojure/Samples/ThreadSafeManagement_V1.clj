(def i (atom 0))

(defn generate-unique-id
  "Returns a distinct numeric ID for each call."
  []
  (swap! i inc))
