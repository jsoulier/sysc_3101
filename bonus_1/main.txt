#lang racket

; --- Answer --- ;

; Helper for converting .e.g 'o' to 'u' or 'x' to empty
(define (canadianize-letter i)
    (
        if (char=? i #\o)
            #\u
        empty
    )
)

; Helper for converting e.g. 'o' to ('o' 'u') or 'x' to ('x')
(define (canadianize-letter-to-list i)
    (
        if (empty? (canadianize-letter i))
            (list i)
        (list i (canadianize-letter i))
    )
)

(define (canadianize-list i)
    (
        if (empty? i)
            empty
        (
            append
            (canadianize-letter-to-list (car i))
            (canadianize-list (cdr i))
        )
    )
)

; --- Sample from Question --- ;

(define (canadianize str) (list->string (canadianize-list (string->list str))))

(canadianize "")
(canadianize "mold")
(canadianize "zoo")
