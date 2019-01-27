(ns day3.core)
;cache example
(defn create [] (atom {}))
(defn get [cache key] (@cache key))

(defn put 
  ([cache value-map]
    (swap! cache merge value-map))
  ([cache key value]
    (swap! cache assoc key value)))

(def aCache (create))
(put aCache :quote "I'm your father, Luke.")
(println (str "Cached item: " (get aCache :quote)))
;Used first function to add value-map to the cache instead of providing a key/value pair.
(put aCache {:quote2 "Hello world."})
(println (str "Cached item: " (get aCache :quote2)))

(defn twice [x] (* 2 x))
(def tribble (agent 1))
@tribble
(send tribble twice) ;does this asynch but so fast you can't tell.
@tribble

ice [x]
  (do 
    (Thread/sleep 5000)
    (* 2 x)))
(send tribble slow-twice)
@tribble
@tribble 'after five seconds should see tribble turn to 4.
(await tribble) ;this will block until slow-twice completes on this thread.

(def finer-things (future (Thread/sleep 5000) "take time"))
@finer-things ;If you enter this straight away you will see a 5 sec deley before you get the text back

;Exercise for day 3
(def account1 (ref 0))
(def account2 (ref 0))
(def account3 (ref 0))
(def accounts [account1 account2 account3])
(defn credit[account value] (dosync (ref-set account (+ @account value))))
(defn debit[account value] (dosync (ref-set account (- @account value))))
;functions operating on the vector instead of each ref
(defn credit2[accountVector position value]
  (let [account (accountVector position)]
    (credit account value)))
(defn debit2[accountVector position value]
  (let [account (accountVector position)]
    (debit account value)))
