(ns day1.core)
(defn big [st n] (> (count st ) n))

(defn collection-type [col] (cond   (= (str (type col)) "class clojure.lang.PersistentVector") "Vector" 
                                    (= (str (type col)) "class clojure.lang.PersistentList") "List" 
                                    :else "something else")
)
