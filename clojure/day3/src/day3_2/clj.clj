(ns day3-2.clj)

(def open-for-business? (atom true))
(def haircut-count (atom 0))

(def waiting-room (ref []))
(def waiting-room-size 3)

(defn wait-for-next-customer [] (Thread/sleep (+ 10 (rand-int 21))) )
(defn wait-until-haircut-finshed [] (Thread/sleep 20))

(defn add-customer-to-waiting-room [] 
  (dosync              
    (if (< (count (ensure waiting-room))  waiting-room-size)
      (alter waiting-room conj :customer)
    )
  )
)

(defn get-next-customer-from-waiting-room [] 
  (dosync
    (let [ next-customer (first (ensure waiting-room))]
      (when next-customer
        (alter waiting-room rest)
        next-customer
      )
    )
  )
)

(defn open-shop [duration]
  (Thread/sleep duration)
  (swap! open-for-business? not)
)

(defn add-customers []
  (future
    (while @open-for-business?
      (println "Waiting Room:" @waiting-room)
      (add-customer-to-waiting-room)
      (wait-for-next-customer)
    )
  )
)

(defn cut-hair []
  (future
    (while @open-for-business?
      (when-let [ next-customer (get-next-customer-from-waiting-room) ]
        (wait-until-haircut-finshed)
        (swap! haircut-count inc)
      )
    )
  )
)

(cut-hair)
(add-customers)
(open-shop (* 10 1000))
(println "Number of cuts:" @haircut-count)                      