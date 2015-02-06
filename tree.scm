(define (right tree) (caddr tree))

(define (value tree) (car tree))

(define (make-tree value left right)
  (list value left right))

(define (empty-tree) '())

(define (tree-empty? tree)
  (null? tree))

(define (leaf? tree)
  (and (not (tree-empty? tree))
       (tree-empty? (left tree))
       (tree-empty? (right tree))))
