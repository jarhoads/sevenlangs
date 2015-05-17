(ns sevenlangs.core)

;; I'm putting everything from the clojure section in this file
;; I know it's probably not correct to do that


(defn big [st n] (> (count st) n))

(defn collection-type [col] 
	;(let [cols {(type {:m 1}) :map, (type #{:s}) :set, (type [:v]) :vector, (type '(1)) :list}] 
	;	(cols (type col))
	(cond

		(map? col) 
		:map

		(set? col) 
		:set

		(vector? col) 
		:vector

		(list? col)
		:list
	)
)

;; size tail recursion example from the book
(defn size [v]
	(loop [l v
		   c 0]
	(if (empty? l)
		c
		(recur (rest l) (inc c)))))

(defmacro unless-else [test body default] (list 'if (list 'not test) body default))

;; i don't know how this works so i'm going to give up for now
(defprotocol Drive
	(forward [this])
)

(defrecord Car [type]
	Drive

	(forward [this] (str "driving " (:type this)))

	Object
    (toString [this] (str (:type this)))
)

; this one took me longer than i thought it would
; mostly it was figuring out how to use the ref/dosync/alter syntax to 
; update a position in a vector
; so that account#1 is position 0 etc... 
; [20 500 10]
;   | |    |
;act1 act2 act3
;use (def name (new-account)) to add a new account
(def accounts (ref []))

(defn credit [account-name amount] 
	; it took me a while to figure out that using alter already gives the vector
	; i was trying to do things like (assoc accounts/@accounts account-name new-amount)
	; it worked once i removed the accounts reference name and just used the rest of assoc
	(dosync (alter accounts assoc account-name (+ (@accounts account-name) amount)))
)

(defn debit [account-name amount]
	(dosync (alter accounts assoc account-name (- (@accounts account-name) amount)))
)

(defn new-account [] 
	" adds an account into the accounts reference vector and returns the location in the vector "

	; add an account with amount of zero
	(dosync (alter accounts conj 0))

	; return the location in the vector
	(- (count @accounts) 1)
)
