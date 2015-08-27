#lang racket

(define L '((("a" ("b")) "c") ("d")) )

(let (
        (a (caaar L))
        (b (car (cadaar L)))
        (c (cadar L))
        (d (caadr L))
    )
    (display (list a b (list c) d))
)