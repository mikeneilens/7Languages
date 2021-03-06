(ns day1.core)
(defn big [st n] (> (count st ) n))

(defn big [st n] 
  "A vresion of big that uses a Let to bind stringLength to (count st) before executing the logic"
  (let [stringLength (count st) nCharacters n]  (> stringLength nCharacters ) ))

(defn collection-type [col] (let[ className (type col) ]   
                               (cond   (= className (type [])) "Vector" 
                                       (= className (type '(0))) "List" 
                                        :else "something else")
                             )
 )

;Alternate approach to collection-type using pipe makes it almost readable!
(defn colTypeName [col] (type col))

(defn collection-type [colTypeName]    
                               (cond   (= colTypeName (type [])) "Vector" 
                                       (= colTypeName (type '(0))) "List" 
                                        :else "something else")
                             )

(def myList '(1 2 3))

(->> myList (colTypeName) (collection-type))
