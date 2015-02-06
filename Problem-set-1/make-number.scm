(define (accumulate term accum-func initial a next b)
  (define (accumulate-helper c)
    (if (> c b)
        initial
        (accum-func (term c) (accumulate-helper (next c)))))
  (accumulate-helper a))


(define (add-i x i)
  (+ x i))

(define (plus1 x)
  (+ x 1))

(define (identity x)
  x)

(define (fact n)
  (accumulate identity * 1 1 plus1 n))

(define (inner-left-magic m i)
    (/ 1 (accumulate (lambda (x) (+ x i)) * 1 0 plus1 m))
)

(define (left-magic m n)
    (accumulate (lambda (i) (inner-left-magic m i)) + 0 1 plus1 n)
)

(define (right-magic m n)
    (* (/ 1 m) (- (/ 1 (fact m)) (/ 1 (accumulate (lambda (x) (+ n x)) * 1 1 plus1 m))))
)

(define (check m n)
    (display (right-magic m n))
    (display "\n")
    (display (left-magic m n))

    (= (right-magic m n)
       (left-magic m n)))
(check 2 3)
