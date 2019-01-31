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
(defn debit [account value] (credit account (- 0 value)))

(defn changeBalance[accounts position changeFunction value]
  (let [account (accounts position)]
    (changeFunction account value)))

;tests!
(changeBalance accounts 1 credit 2)
(def balance (accounts 1))
(str "balance is £"  @balance)

(changeBalance accounts 1 debit 3)
(def balance (accounts 1))
(str "balance is £"  @balance)

;day 3 accont using map
(def account1 {:accountNo 1 :balance (ref 0)})
(def account2 {:accountNo 2 :balance (ref 0)})
(def account3 {:accountNo 3 :balance (ref 0)})
(def accounts [account1 account2 account3])
(defn printAccount[account] 
  (let [{accountNo :accountNo balance :balance} account] 
    (str "AccountNo: " accountNo " Balance = £" @balance   ) )  )

;function to get the accountNo for an account
(defn getAccountNo [account] (let [{accountNo :accountNo} account] accountNo))

;function to get an account from the vector
(defn getAccount [accounts accountNo] 
  (let [account (first (filter #(= accountNo (getAccountNo %)) accounts ))] 
    account ))

;function to credit an account
(defn credit [account value] 
  (let [{balance :balance} account] 
    (dosync (ref-set balance (+ @balance value)) )))
(defn debit [account value] (credit account (- 0 value)))

;change the balance of an account - provide function to credit or debit
(defn changeBalance [accounts accountNo changeFunction amount] 
  (let [account (getAccount accounts accountNo)] 
    (if account (changeFunction account amount) (str "AccountNo " accountNo " not found") )))

;tests!
(changeBalance accounts 1 credit 2)
(printAccount  (getAccount accounts 1) )
(changeBalance accounts 1 debit 3)
(printAccount  (getAccount accounts 1) )
(changeBalance accounts 4 debit 3)
