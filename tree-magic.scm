(load "tree.scm")

(define (pre-order tree)
  (if (tree-empty? tree)
      '()
      (append (list (value tree))
              (pre-order (left tree))
              (pre-order (right tree)))))

(define (post-order tree)
  (if (tree-empty? tree)
      '()
      (append (post-order (left tree))
              (post-order (right tree))
              (list (value tree)))))

(define (in-order tree)
  (if (tree-empty? tree)
      '()
      (append (in-order (left tree))
              (list (value tree))
              (in-order (right tree)))))

(define (level tree n)
  (define (helper current-tree current-level)
    (cond
      ((tree-empty? current-tree) '())
      ((= current-level n) (list (value current-tree)))
      (else (append (helper (left current-tree) (+ current-level 1))
                    (helper (right current-tree) (+ current-level 1))))))
  (helper tree 0))

(define (map-tree f tree)
  (if (tree-empty? tree)
    '()
    (make-tree (f (value tree))
      (map-tree f (levelft tree))
      (map-tree f (right tree)))))

(define (contains-path tree path)
  (cond
    ((or (tree-empty? tree) (null? path)) #f)
    ((not (= (value tree) (car path))) #f)
    ((and (leaf? tree) (null? (cdr path)) #t))
    (else (or (contains-path (left tree) (cdr path))
              (contains-path (right tree) (cdr path))))))


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

(define (list-paths-leaves tree)
  (define (helper current-tree current-path)
    (cond
      ((leaf? current-tree) (list
                              (cons (value current-tree)
                                    current-path)))
      ((tree-empty? current-tree) '())
      (else (append (helper (left current-tree)
                            (cons (value current-tree)
                                  current-path))
                    (helper (right current-tree)
                            (cons (value current-tree)
                                  current-path))))))
  (helper tree '()))
