#lang racket

(define (zip opperation list1 list2)
    (define size (min (length list1) (length list2)))
    (map (lambda (number1 number2) (opperation number1 number2))
        (take list1 size)
        (take list2 size)        
    )
)

(zip + `(1 2 3 4) `(40 50 60 70 80))