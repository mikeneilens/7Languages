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
;day 3 accont using map
(def acc1 {:account 1 :balance (ref 0)})
(def acc2 {:account 2 :balance (ref 0)})
(def acc3 {:account 3 :balance (ref 0)})
(def accs [acc1 acc2 acc3])
;function to get the accountNo for an account
(defn accountNo [account] (let [{thisAccountNo :account} account] thisAccountNo))
;function to get an account from the vector
(defn getAccount [inputAccounts inputAccountNo] 
  (let [account (first (filter #(= inputAccountNo (accountNo %)) inputAccounts ))] 
    account ))
;function to credit an account
(defn credit [account value] (let [{balance :balance} account] (dosync (ref-set balance (+ @balance value)) )))
(defn debit [account value] (credit account (- 0 value)))
;credit an account in the vector - provide function to credit or debit
(defn creditAccount [inputAccounts inputAccountNo f val] 
  (let [account (getAccount inputAccounts inputAccountNo)] (f account val) ))

(creditAccount accs 1 credit 2)
accs
(creditAccount accs 1 debit 3)
accs
