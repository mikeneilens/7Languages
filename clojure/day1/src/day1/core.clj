(ns day1.core)
(defn big [st n] (> (count st ) n))

(defn big [st n] 
  "A vresion of big that uses a Let to bind stringLength to (count st) before executing the logic"
  (let [stringLength (count st) nCharacters n]  (> stringLength nCharacters ) ))

(defn collection-type [col] (cond   (= (str (type col)) "class clojure.lang.PersistentVector") "Vector" 
                                    (= (str (type col)) "class clojure.lang.PersistentList") "List" 
                                    :else "something else")
)
