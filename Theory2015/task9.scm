(define (g x)
    (let ((temp (car (cadadr x))))
    (begin (set-car! x (* 2 temp)) (set-cdr! x `(6 7)) x)))

(g `(1 (2 (5)) 5 (5)))