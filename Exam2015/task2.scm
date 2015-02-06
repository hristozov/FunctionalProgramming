(define (sum-polynoms polynom1 polynom2)
    (define (helper polynom1 polynom2 curret-polynom)
        (cond
            ((null? polynom1) (append curret-polynom polynom2))
            ((null? polynom2) (append curret-polynom polynom1))

            ((<(cdar polynom1) (cdar polynom2))
                (helper
                    polynom1
                    (cdr polynom2)
                    (append curret-polynom (list (car polynom2)))))

            ((>(cdar polynom1) (cdar polynom2))
                (helper
                    (cdr polynom1)
                    polynom2
                    (append curret-polynom (list (car polynom1)))))

            ((=(cdar polynom1) (cdar polynom2))
                (helper
                    (cdr polynom1)
                    (cdr polynom2)
                    (append curret-polynom (list(cons (+ (caar polynom1) (caar polynom2)) (cdar polynom1))))))))
    (helper polynom1 polynom2 (list))
)

;(sum-polynoms
;    (list (cons 2 5) (cons 2 3) (cons 2 2) (cons 3 1) (cons 1 0))
;    (list (cons 1 5) (cons 4 3) (cons 5 2) (cons 2 1) (cons 20 0))
;)

;(sum-polynoms
;    (list (cons 2 5)            (cons 2 2) (cons 3 1) (cons 1 0))
;    (list (cons 1 5) (cons 4 3) (cons 5 2) (cons 2 1) (cons 20 0))
;)

(sum-polynoms
    (list (cons 2 5) (cons 2 2) (cons 3 1) (cons 1 0))
    (list (cons 1 5)            (cons 2 1) (cons 20 0))
)
