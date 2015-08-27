#lang racket

(define (stream n)
    (define (helper count)
        (stream-cons
            (* n count) 
            (helper (+ 1 count))
        )
    )
    (helper 1)
)

(define (hw31) 
    (define (helper current)
        (stream-cons
            (stream current)
            (helper (+ 1 current))
        )
    )
    (helper 1)
)
