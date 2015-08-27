#lang racket

(let (
        (x 5)
        (y 2)
        (z 7)
    )
    (* x y z)
)

((lambda (x y z) (* x y z)) 5 2 7)

(let* (
        (x 7)
        (y (+ x 3))
        (z (+ x y))
    )
    (/ x y z)
)

((lambda (x y z) (/ x y z)) 