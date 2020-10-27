;; define a var
(def a 42)
;; => #'user/a

;; get a map of all public vars interned in the `user` namespace
(ns-publics 'user)
;; => {a #'user/a}

;; reference the var via `#'` (reader macro) and
;; its associated, namespace-qualified symbol `user/a`
#'user/a
;; => #'user/a

;; de-reference (get the value of) the var
(deref #'user/a)
;; => 42

;; define a function (with a docstring) that
;; returns the remainder of `n` when divided by 10
(defn foo "returns `(rem n 10)`" [n] (rem n 10))
;; => #'user/foo

;; get the metadata of the var `#'user/foo`
(meta #'user/foo)
;; =>
{:arglists ([n]),
 :doc "returns `(rem n 10)`",
 :line 1,
 :column 1,
 :file "user.clj",
 :name foo,
 :ns #namespace[user]}
