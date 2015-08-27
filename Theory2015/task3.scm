#lang racket
(define (fact n)
    (cond 
        ((= n 1) 1)
        (* n (fact (- n 1)))
    )
)

(define (plus1 x)
    (+ 1 x)
)

(define (accumulate term accum-func initial a next b)
  (define (accumulate-helper c)
    (if (> c b)
        initial
        (accum-func (term c) (accumulate-helper (next c)))))
  (accumulate-helper a))

(define (right-helper i m)
    (accumulate (lambda (x) (+ x i)) * 1 0 plus1 m)
)
(define (right m n)
    (accumulate (lambda (i) (/ 1 (right-helper i m))) + 0 1 plus1 n)
)

(define (left m n)
    ( * (/ 1 m)
        ( - (/ 1 (fact m))
            (/ 1 (accumulate (lambda (x) (+ x n)) * 1 1 plus1 m))
        )
    )
)

(define (check m n)
    (= (left m n) (right m n))
)


(check 1 2)