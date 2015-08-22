#lang racket
; https://github.com/hristozov/fpkn1415/tree/master/assignments/01#Първи-вариант

(define (octify n)
  (cond
   ((zero? n) 0)
   ((zero? (quotient n 8)) n)
   (else  (+ (* 10 (octify (quotient n 8))) (remainder n 8)))))

(define (same-digits? a)
    (define (helper first a)
        (cond 
            ((= 0 a) #t)
            ((equal? first (remainder a 10)) (helper first (quotient a 10)))
            (else #f)
        )
    )

    (helper (remainder a 10) (quotient a 10))
)

(define (hw a b)
    (define (helper current result)
        (cond
            ((> current b) result)
            ((same-digits? (octify current)) (helper (+ current 1) (+ result 1)))
            (else (helper (+ current 1) result))
        )
    )
    (helper a 0)
)

(hw 1 65)