(define (left tree) (cadr tree))

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

(define my-tree
    (make-tree 1
    (make-tree 3
        (make-tree 5
           (empty-tree)
            (empty-tree))
        (make-tree 6
           (make-tree 8 (empty-tree) (empty-tree))
           (empty-tree)))
    (make-tree 9
        (empty-tree)
        (make-tree 7
           (make-tree 2 (empty-tree) (empty-tree))
           (make-tree 1 (empty-tree) (empty-tree))))))


(define (list-paths-root tree)
    (define (helper current-tree current-path)
        (cond
            ((leaf? current-tree) (list
                                (append current-path
                                    (list (value current-tree)))))
            ((tree-empty? current-tree) '())
            (else (append (helper (left current-tree)
                                (append current-path
                                        (list (value current-tree))))
                            (helper (right current-tree)
                                    (append current-path
                                            (list (value current-tree))))))))
    (helper tree '()))

(define (tree-max-sum tree)
    (apply max (map (lambda (path) (apply + path)) (list-paths-root tree))))


(tree-max-sum my-tree)
