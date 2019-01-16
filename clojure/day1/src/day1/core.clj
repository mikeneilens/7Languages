(ns day1.core)
(defn big [[st n]] (> (count st ) n))

(defn collection-type [col] (cond   (= (type col) "clojure.lang.PersistentVector") "Vector" 
                                    (= (type col) "clojure.lang.PersistentList") "List" 
                                    :else "something else")
)