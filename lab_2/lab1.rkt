#lang racket

(define (sum-coins p n d q) (+
                             p
                             (* n 5)
                             (* d 10)
                             (* q 25)))

(display "Exercise 1")
(newline)
(sum-coins 1 0 0 0) ; 1
(sum-coins 0 1 0 0) ; 5
(sum-coins 0 0 1 0) ; 10
(sum-coins 0 0 0 1) ; 25
(sum-coins 1 1 1 1) ; 41
(newline)

(define (interest m) (exact-round
                      (cond
                        ((<= m 1000)
                         (* m 0.04))
                        ((and
                          (> m 1000)
                          (<= m 5000))
                         (* m 0.045))
                        ((> m 5000)
                         (* m 0.05)))))

(display "Exercise 2")
(newline)
(interest 500) ; 20
(interest 1000) ; 40
(interest 2000) ; 900
(interest 5000) ; 225
(interest 10000) ; 500
(newline)

(define (balance m) (+
                     m
                     (interest m)))

(display "Exercise 3")
(newline)
(balance 500) ; 520
(balance 1000) ; 1040
(balance 2000) ; 2090
(balance 5000) ; 5225
(balance 10000) ; 10500
(newline)

(define (variable_Interest m) (exact-round
                               (+
                                (*
                                 (min m 1000)
                                 0.04)
                                (*
                                 (max
                                  (min
                                   (- m 1000)
                                   4000) 0)
                                 0.045)
                                (*
                                 (max
                                  (- m 5000)
                                  0)
                                 0.05))))

(display "Exercise 4")
(newline)
(variable_Interest 500) ; 20
(variable_Interest 1000) ; 40
(variable_Interest 2000) ; 85
(variable_Interest 5000) ; 225
(variable_Interest 10000) ; 500
(newline)
