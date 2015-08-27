#lang racket

(define (cont_fraction n) 
    (define (helper i)
        (cond 
            ((= i n) (** x 2))
            (else ( + (** 2 i) (/ (** 2 i) (helper i + 1))))
    )
    (/ 1 (helper 0)
)
