#lang racket

; Author: Jaan Soulier
; Student Number: 101189819

; Exercise 1

; (define exercise-1-1 (lambda (x y z) (x y z))) ; valid
; (define exercise-1-2 (lambda () 10)) ; valid
; (define exercise-1-3 (lambda (x) x)) ; valid
; (define exercise-1-4 (lambda (x y) x)) ; valid

; (exercise-1-1 + 1 2)
; (exercise-1-2)
; (exercise-1-3 1)
; (exercise-1-4 1 2)

; Exercise 2

; ((lambda (x y) (+ x (* x y))) 1 2) ; 3
; ((lambda (x y) ; 4/4 + 49/4 = 53/4
;     (+ x ; 1 = 4/4
;         ((lambda (z)
;             (+ (* 3 z) (/ 1 z))) ; 12 + 1/4 = 49/4
;         (* y y)))) ; 4
; 1 2)

; Exercise 3

; (define (square x) (* x x))
; square ; #<procedure:square>
; (square 5) ; 25

; (define sq (lambda (x) (* x x)))
; sq ; #<procedure:sq>
; (sq 5) ; 25

; (define (make-adder num) (lambda (x) (+ x num)))
; make-adder ; #<procedure:make-adder>
; (make-adder 3) ; #<procedure:...>
; ((make-adder 3) 7) ; 10

; (define plus3 (make-adder 3))
; plus3 ; #<procedure:...>
; (plus3 7) ; 10

; Exercise 4

(define (build-naturals n) (build-list n (lambda (x) x)))
(define (build-rationals n) (build-list n (lambda (x) (/ 1 (+ x 1)))))
(define (build-evens n) (build-list n (lambda (x) (* x 2))))

(build-naturals 5)
(build-rationals 5)
(build-evens 5)
