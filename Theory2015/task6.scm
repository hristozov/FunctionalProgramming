#lang racket

(define L '("a" ("b" "c") ("d" ("e")) "f" ((("g"))) ("h" ("i" ("j" "k"))) ("m" "n") (("o"))))

(display (car (cddddr L)))
(newline)
(display (cddddr L))
(newline)
(display (cons 
            (caddr L) 
                (cons 
                    (cadddr L) 
                    (cons 
                        (car (cddddr L)) (cdr (cddddr L))))))
(newline)
(display (caaaar (cddddr L)))