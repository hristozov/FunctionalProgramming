#lang racket

(define (cont_fraction x n) 
    (define (helper i)
        (cond 
            ((> i n) (expt x 2))
            (else (+ (expt x 2) (/ (expt 2 i) (helper (+ i 1)))))
    ))
    (/ x (helper 1)
))
