#lang racket

; Question 1
(define (lowest-exponent base bound)
    (define (find-lowest-exponent exponent)
        (
            if (>= (expt base exponent) bound) exponent
            (find-lowest-exponent (+ exponent 1))
        )
    )
    (find-lowest-exponent 0)
)

; (lowest-exponent 3 27) ; 3
; (lowest-exponent 3 28) ; 4

; Question 2
(define (find-abundant n)
    (define (is-divisor divisor n) (integer? (/ n divisor)))
    (define (divisor-or-zero divisor n) (if (is-divisor divisor n) divisor 0))
    (define (sum-divisors x)
        (
            if (<= x 0) 0
            (+ (divisor-or-zero x n) (sum-divisors (- x 1)))
        )
    )
    (define (is-abundant n) (> (sum-divisors n) (* 2 n)))
    (define (abundant-to-list n) (if (is-abundant n) (list n) empty))
    (
        if (<= n 0) empty
        (append (abundant-to-list n) (find-abundant (- n 1)))
    )
)

(find-abundant 24) ; (24, 20, 18, 12)
