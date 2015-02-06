#lang racket
(define (list-to-stream l)
    (if (null? l)
        empty-stream
        (stream-cons (car l)
                   (list-to-stream (cdr l)))))

(define (merge-streams1 stream1)
    (cond
      ((stream-empty? stream1) empty-stream)
      (else
        (stream-cons (/ 1 (car (stream-first  stream1)))
            (merge-streams1 (stream-rest stream1))))))

(stream->list (merge-streams1 (list-to-stream (list (cons 2 2) (cons 3 4) (cons 5 6) (cons 7 8)))))
