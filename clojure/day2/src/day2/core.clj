(ns day2.core)

;; a simple loop with recur
(loop [x 1] (if (= x 10) x (recur (inc x))))

;;the loop used for recursion in the book
(defn size [v] 
  (loop [listOfData v, counter 0]
     (if (empty? listOfData) 
       counter 
       (recur (rest listOfData) (inc counter)) ) )
  )

;;The :when example with an anonymous function
(for [x colors, y toys, :when (#(< (count %) 4) y)   ] (str "I like " x " " y)) 


;fibinacci
(fib-pair [3 5])
(nth (map first (iterate fib-pair [1 1])) 70) ;the example in the book fails as its too big!

;factorial
(defn factorial [n] (apply * (take n (iterate inc 1))))


;Compass
(def directions [:north :south :east :west])

(defn turn [base amount] (rem (+ base amount) (count directions)))

(defprotocol Compass 
  (direction [c])
  (left [c])
  (right [c]))

(defrecord SimpleCompass [bearing] 
  Compass
  (direction [_] (directions bearing))
  (left [_] (SimpleCompass. (turn bearing 3)))
  (right [_] (SimpleCompass. (turn bearing 1)))
  Object 
  (toString [this] (str "/" (direction this) "/")))

;dayt 2 exercises
(defmacro unless [test body elseBody] (list 'if (list 'not test) body elseBody))
(unless false (println "danger danger") (println "OK"))
(unless true (println "danger danger") (println "OK"))

(defprotocol Dog
  (sayName[c] ))
(defrecord Labrador [name] 
  Dog
  (sayName[_] (str "wuff, I am called " name)))
(def jimmyTheDog (Labrador. "jimmy"))
(sayName jimmyTheDog)


