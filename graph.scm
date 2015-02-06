(define (create-graph vertices)
  (map (lambda (v) (list v '())) vertices))

(define (insert! k v a)
  (set-cdr! a (cons (list k v) (cdr a))))

(define (add-vertex! v graph)
  (insert! v '() graph))

(define (add-edge! a b graph)
  (let ((start-vertex (assoc a graph)))
    (set-cdr! start-vertex
              (list (cons b (cadr start-vertex))))))

(define (vertices graph)
  (map car graph))

(define (neighbours v graph)
  (cadr (assoc v graph)))

(define (degree-out v g)
  (length (neighbours v g)))

(define (degree-in v g)
  (length (filter
            (lambda (vertex)
              (member v
                      (neighbours vertex g)))
            (vertices g))))

(define (extend-acyclic p g)
  (let* ((last-vertex (last-element p))
         (neighbours-of-last (neighbours last-vertex g)))
    (map (lambda (neighbour)
           (append p (list neighbour)))
         (filter (lambda (neighbour)
                   (not (member neighbour p)))
                 neighbours-of-last))))

(define (paths-from v g)
    (define result (list (list v)))
    (define (helper current-path)
        (let ((current-vertex (last-element current-path)))
            (if (not (member current-path result))
                (set-cdr! result (cons current-path (cdr result))))
            (map helper (extend-acyclic current-path g))))
    (helper (list v))

    result)
