#lang racket

;; SYSC 3101 A Winter 2024 Lab 5

;; Exercise 1

(define (make-upcounter counter)
  (lambda () 
    (set! counter (+ counter 1))
    counter))

; ; 1, 2 since shared instance
; (define counter1 (make-upcounter 0))
; (counter1) ; 1
; (counter1) ; 2
; ; 1, 1 since unique instances
; ((make-upcounter 0)) ; 1
; ((make-upcounter 0)) ; 1

; ; unique since values don't depend on other instances
; (define counter2 (make-upcounter 10))
; (counter1) ; 3
; (counter2) ; 11
; (counter1) ; 4
; (counter2) ; 12

;; Exercise 2 

(define (make-counter counter)
  
  (define (count-up) 
    (set! counter (+ counter 1))
    counter)
  
  (define (count-down)
    (if (> counter 0)
        (begin (set! counter (- counter 1))
               counter)
        "Counter is 0"))

  (define (dispatch cmd)
    (cond ((eq? cmd 'inc) count-up)
          ((eq? cmd 'dec) count-down)
          (else (error "Unknown command:" cmd))))
  
  dispatch)

; ; dispatch, inc, dec, and reset procedures
; (define counter3 (make-counter 0))
; counter3 ; #<procedure:dispatch>
; (counter3 'inc) ; #<procedure:count-up>
; (counter3 'dec) ; #<procedure:count-down>
; ; (counter3 'reset) ; error

; ; invoke the procedures
; ((counter3 'inc)) ; 1
; ((counter3 'inc)) ; 2
; ((counter3 'dec)) ; 1
; ((counter3 'dec)) ; 0
; ((counter3 'dec)) ; "Counter is 0"
; ; ((counter3 'reset))

;; Exercise 3

(define (make-counter-with-let initial-count)

  (let ((counter initial-count))
 
    (define (count-up)
      (set! counter (+ counter 1))
      counter)
 
    (define (count-down)
      (if (> counter 0)
          (begin (set! counter (- counter 1))
                 counter)
          "Counter is 0"))

    (define (dispatch cmd)
      (cond ((eq? cmd 'inc) count-up)
            ((eq? cmd 'dec) count-down)
            (else (error "Unknown command:" cmd))))
 
    dispatch))

; ; dispatch, inc, dec, and reset procedures
; (define counter3 (make-counter-with-let 0))
; counter3 ; #<procedure:dispatch>
; (counter3 'inc) ; #<procedure:count-up>
; (counter3 'dec) ; #<procedure:count-down>
; ; (counter3 'reset) ; error

; ; invoke the procedures
; ((counter3 'inc)) ; 1
; ((counter3 'inc)) ; 2
; ((counter3 'dec)) ; 1
; ((counter3 'dec)) ; 0
; ((counter3 'dec)) ; "Counter is 0"
; ; ((counter3 'reset))

; Exercise 4

(define (make-counter-ex4 initial-count)

  (let ((counter initial-count))
 
    (define (count-up)
      (set! counter (+ counter 1))
      counter)
 
    (define (count-down)
      (if (> counter 0)
          (begin (set! counter (- counter 1))
                 counter)
          "Counter is 0"))

    (lambda (cmd)
      (cond ((eq? cmd 'inc) count-up)
            ((eq? cmd 'dec) count-down)
            (else (error "Unknown command:" cmd))))))

; ; dispatch, inc, dec, and reset lambdas and procedures
; (define counter3 (make-counter-ex4 0))
; counter3 ; #<procedure:...>
; (counter3 'inc) ; #<procedure:count-up>
; (counter3 'dec) ; #<procedure:count-down>
; ; (counter3 'reset) ; error

; ; invoke the lambdas and procedures
; ((counter3 'inc)) ; 1
; ((counter3 'inc)) ; 2
; ((counter3 'dec)) ; 1
; ((counter3 'dec)) ; 0
; ((counter3 'dec)) ; "Counter is 0"
; ; ((counter3 'reset))

; Exercise 5

(define (make-counter-ex5 initial-count)

  (let ((counter initial-count))
 
    (define (count-up)
      (set! counter (+ counter 1))
      counter)
 
    (define (count-down)
      (if (> counter 0)
          (begin (set! counter (- counter 1))
                 counter)
          "Counter is 0"))

    (define (get) counter)
    (define (reset) (set! counter initial-count) counter)

    (lambda (cmd)
      (cond ((eq? cmd 'inc) count-up)
            ((eq? cmd 'dec) count-down)
            ((eq? cmd 'get) get)
            ((eq? cmd 'reset) reset)
            (else (error "Unknown command:" cmd))))))

; (define counter5 (make-counter-ex5 0))
; ((counter5 'get)) ; 0
; ((counter5 'inc)) ; 1
; ((counter5 'inc)) ; 2
; ((counter5 'dec)) ; 1
; ((counter5 'inc)) ; 2
; ((counter5 'reset)) ; 0

; Exercise 6

(define (make-counter-ex7 initial-count increment)

  (let 
    ((counter initial-count)
    (max-value initial-count))
 
    (define (count-up)
      (set! counter (+ counter increment))
      (set! max-value (max max-value counter))
      counter)
 
    (define (count-down)
      (if (> counter 0)
          (begin (set! counter (- counter 1))
                 counter)
          "Counter is 0"))

    (define (get) counter)
    (define (reset)
      (set! counter initial-count)
      (set! max-value counter)
      counter)
    (define (get-max) max-value)

    (lambda (cmd)
      (cond ((eq? cmd 'inc) count-up)
            ((eq? cmd 'dec) count-down)
            ((eq? cmd 'get) get)
            ((eq? cmd 'reset) reset)
            ((eq? cmd 'max) get-max)
            (else (error "Unknown command:" cmd))))))

; (define counter7 (make-counter-ex7 0 2))
; ((counter7 'inc)) ; 2
; ((counter7 'inc)) ; 4
; ((counter7 'max)) ; 4
; ((counter7 'inc)) ; 6
; ((counter7 'max)) ; 6
; ((counter7 'dec)) ; 5
; ((counter7 'dec)) ; 4
; ((counter7 'max)) ; 6
; ((counter7 'reset)) ; 0
; ((counter7 'max)) ; 0
