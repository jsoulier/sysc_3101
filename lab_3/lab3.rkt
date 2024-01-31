#lang racket

(define (sum-numbers numbers)
    (
        if (empty? numbers) 0
        (+ (car numbers) (sum-numbers (cdr numbers)))
    )
)

(display "Testing sum-numbers")
(newline)
(display "Expected: 0, actual: ")
(sum-numbers empty)
(display "Expected: 21, actual: ")
(sum-numbers (list 1 2 3 4 5 6))
(newline)

(define (average numbers)
    (exact->inexact (/ (sum-numbers numbers) (length numbers)))
)

(display "Testing average")
(newline)
(display "Expected: 3.5, actual: ")
(average (list 1 2 3 4 5 6))
(newline)

(define (occurrences numbers n)
    (define (equals x) (if (= x n) 1 0))
    (
        if (empty? numbers) 0
        (+ (equals (car numbers)) (occurrences (cdr numbers) n))
    )
)

(display "Testing occurrences")
(newline)
(display "Expected: 3, actual: ")
(occurrences '(1 3 5 2 7 5 8 9 5) 5)
(display "Expected: 0, actual: ")
(occurrences '(1 3 5 2 7 5 8 9 5) 6)
(display "Expected: 0, actual: ")
(occurrences empty 1)
(newline)

(define (convert digits)
    (define (recurse digits e)
        (
            if (empty? digits) 0
            (+
                (* (car digits) (expt 10 e))
                (recurse (cdr digits) (+ e 1))
            )
        )
    )
    (recurse digits 0)
)

(display "Testing convert")
(newline)
(display "Expected: 0, actual: ")
(convert empty)
(display "Expected: 3, actual: ")
(convert (list 3))
(display "Expected: 543, actual: ")
(convert (list 3 4 5))
(newline)

(define (convertFC temperatures)
    (define (to-celsius x) (list (* (- x 32) 5/9)))
    (
        if (empty? temperatures) empty
        (append (to-celsius (car temperatures)) (convertFC (cdr temperatures)))
    )
)

(display "Testing convertFC")
(newline)
(display "Expected: '(), actual: ")
(convertFC empty)
(display "Expected: '(0 100 37.0), actual: ")
(convertFC (list 32 212 98.6))
(newline)

(define (eliminate-threshold numbers threshold)
    (define (compare x) (if (> x threshold) empty (list x)))
    (
        if (empty? numbers) empty
        (append (compare (car numbers)) (eliminate-threshold (cdr numbers) threshold))
    )
)

(display "Testing eliminate-threshold")
(newline)
(display "Expected: '(1 2 3 4 4 3 2 1), actual: ")
(eliminate-threshold (list 1 2 3 4 5 6 5 4 3 2 1 20) 4)
(display "Expected: '(), actual: ")
(eliminate-threshold (list 1 2 3 4 5 6 5 4 3 2 1 20) 0)
(display "Expected: '(1 2 3 4 5 6 5 4 3 2 1 20), actual: ")
(eliminate-threshold (list 1 2 3 4 5 6 5 4 3 2 1 20) 25)
(newline)
