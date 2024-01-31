#lang racket

; Author: Jaan Soulier
; Student Number: 101189819

; Question 1
(define (lowest-exponent base bound)
    ; Recursive procecure for finding lowest exponent
    (define (find-lowest-exponent exponent)
        (
            ; Check if (base ^ exponent) > bound
            if (>= (expt base exponent) bound) exponent
            ; If less than bound, try the next exponent
            (find-lowest-exponent (+ exponent 1))
        )
    )
    ; Start checks at zero
    (find-lowest-exponent 0)
)

; (lowest-exponent 3 0) ; 0
; (lowest-exponent 3 27) ; 3
; (lowest-exponent 3 28) ; 4

; Question 2
(define (find-abundant n)
    ; Procedure for checking if divisor divides n into a whole number
    (define (is-divisor divisor n) (integer? (/ n divisor)))
    ; Procedure for getting the divisor value if it is a divisor or zero
    (define (divisor-or-zero divisor n) (if (is-divisor divisor n) divisor 0))
    ; Recursive procedure for summing all the divisors of x
    (define (sum-divisors x)
        (
            if (<= x 0) 0
            ; Add the divisor or zero and recursively add the lower divisors
            (+ (divisor-or-zero x n) (sum-divisors (- x 1)))
        )
    )
    ; Procedure for checking if n is abundant
    (define (is-abundant n) (> (sum-divisors n) (* 2 n)))
    ; Procedure for getting the abundant value as a list if it is abundant or empty
    (define (abundant-to-list n) (if (is-abundant n) (list n) empty))
    (
        if (<= n 0) empty
        ; Add the abundant or empty and recursively add the lower abundants
        (append (abundant-to-list n) (find-abundant (- n 1)))
    )
)

; (find-abundant 24) ; (24, 20, 18, 12)

; Question 3
(define (increasing-order? alist)
    ; Recursive procedure for checking if all previous elements are less than or equal elements in alist
    (define (check-increasing previous alist)
        (
            cond
            ; If empty list return true
            [(empty? alist) #t]
            ; If current is less than previous return false
            [(< (car alist) previous) #f]
            ; Check the next element and change previous to current
            [else (check-increasing (car alist) (cdr alist))]
        )
    )
    (
        if (empty? alist) #t
        ; Assign previous and the remaining
        (check-increasing (car alist) (cdr alist))
    )
)

; (increasing-order? empty) ; true
; (increasing-order? (cons 11 empty)) ; true
; (increasing-order? (cons 3 (cons 7 (cons 9 (cons 19 empty))))) ; true
; (increasing-order? (cons -7 (cons -7 (cons 8 empty)))) ; true
; (increasing-order? (cons 1 (cons 4 (cons 2 empty))))  ; false

; Question 4
(define (get-vowels-sc astring)
    ; Procedure for checking if a character is a vowel
    (define (is-vowel? c) (member (char-downcase c) (list #\a #\e #\i #\o #\u)))
    ; Procedure for switching the case of a character
    (define (switch-case c) (if (char-upper-case? c) (char-downcase c) (char-upcase c)))
    ; Procedure for getting the character as a list if it is a vowel or empty. Swaps the case of the character
    (define (vowel-to-list c) (if (is-vowel? c) (list (switch-case c)) empty))
    ; Recursive procedure for getting the vowels from clist and swapping the case
    (define (add-vowels-sc clist)
        (
            if (empty? clist) empty
            ; Add the case-switched vowel or empty and add the remaining vowels
            (append (vowel-to-list (car clist)) (add-vowels-sc (cdr clist)))
        )
    )
    ; Get the string as a list, get the vowels, then get the vowel list as a string
    (list->string (add-vowels-sc (string->list astring)))
)

; (get-vowels-sc "A big hello world!") ; aIEOO
; (get-vowels-sc "SYSC2100") ; empty
