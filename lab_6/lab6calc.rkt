#lang racket

;; SYSC 3101 Winter 2024 Lab 6

;; Calculator language interpreter

; The read-eval-print loop:

(define (calc)
  (display "calc: ")
  (flush-output)
  (print (calc-eval (read)))
  (newline)
  (calc))

; Evaluate an expression:

(define (calc-eval exp)
  (cond ((number? exp) exp)
        ((list? exp) (calc-apply (car exp) (map calc-eval (cdr exp))))
        (else (error "Calc: bad expression: " exp))))

; Apply a function to arguments:

(define (calc-apply fn args)
  (cond
        ((eq? fn 'abs) (if (not (equal? (length args) 1)) (error "Calc: abs requires exactly 1 arg")
                           (abs (car args))))
        ((eq? fn '**) (if (not (equal? (length args) 2)) (error "Calc: ** requires exactly 2 args")
                           (expt (car args) (cadr args))))
        ((eq? fn 'max) (if (empty? args) (error "Calc: max requires 1 or more args")
                           (foldr max (car args) args)))
        ((eq? fn '+) (foldr + 0 args))
        ((eq? fn '-) (cond ((null? args) (error "Calc: no args to -"))
                           ((= (length args) 1) (- (car args)))
                           (else (- (car args) (foldr + 0 (cdr args))))))
        ((eq? fn '*) (foldr * 1 args))
        ((eq? fn '/) (cond ((null? args) (error "Calc: no args to /"))
                           ((= (length args) 1) (/ (car args)))
                           (else (/ (car args) (foldr * 1 (cdr args))))))
        (else (error "Calc: bad operator:" fn))))

(calc)