(ns sevenlangs.core-test
  (:require [clojure.test :refer :all]
            [sevenlangs.core :refer :all]))

(deftest big-test-long-three
	(is (= (big "This is a loooooong string" 3) true)))

(deftest big-test-not-three
	(is (= (big "no" 3) false)))

(deftest collection-type-test-vector
		(is (= (collection-type [:1 :2 :3]) :vector)))

(deftest collection-type-test-map
		(is (= (collection-type {:1 "one", :2 "two", :3 "three"}) :map)))

(deftest collection-type-test-set
		(is (= (collection-type #{:1 :2 :3}) :set)))

(deftest collection-type-test-list
		(is (= (collection-type '(:1 :2 :3)) :list)))

(deftest size-test-zero
		(is (= (size []) 0)))

(deftest size-test-five
		(is (= (size [:a :b :c :d :e]) 5)))

(deftest accounts-test-new

		(is (= (count @accounts) 0))
		(def josh (new-account))
		(is (= (@accounts josh) 0))
		(is (= (count @accounts) 1))
		(credit josh 1000)
		(is (= (@accounts josh) 1000))
		(debit josh 100)
		(is (= (@accounts josh) 900))

)

;i couldn't get this to work correctly as a seperate test
;(deftest accounts-test-credit-debit
;		(is (= (count @accounts) 1))
;		(def josh (new-account))
;		(credit josh 1000)
;		(is (= (@accounts josh) 1000))
;		(debit josh 100)
;		(is (= (@accounts josh) 900))
;)