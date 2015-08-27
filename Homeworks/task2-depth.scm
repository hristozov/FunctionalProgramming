#lang racket
(define (depth list)
    (cond 
        ((null? list) 1)
        ((list? (car list)) (max (+ 1 (depth (car list))) (depth (cdr list))))
        (else (depth (cdr list)))
    )
)

(depth '(1 2 3 (4 (5) (6) (7 (8)))))

(define (max-sublist-length list)
    (cond 
        ((null? list) 0)
        ((list? (car list)) (max 
                                (length list) 
                                (max-sublist-length (car list))
                                (max-sublist-length (cdr list))))
        (else (max (length list)
                    (max-sublist-length (cdr list))))
    )
)

(max-sublist-length '(((1))))
(max-sublist-length '((2 3 4) 1))
(max-sublist-length '((2 3 (5 6 7 8 9) 4) 1))