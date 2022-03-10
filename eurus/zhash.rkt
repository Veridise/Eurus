#lang rosette
(provide (except-out (all-defined-out)
    println-and-exit
))

; forewords (some clarifications for reference)
; 1. a term is a symbolic
; 2. an union is a symbolic
; 3. a list of terms is a symbolic (!!), but it's not a term nor a union
; 4. a union of list is a symbolic, a union, but not a term
; 5. a union is NOT a term, vice versa

; for panic use only
(define (println-and-exit msg)
    (printf "~a\n" msg)
    (exit 0)
)

(define zvoid 'zvoid)
(define (zvoid? obj)
    (cond
        [(symbolic? obj) (for/all ([p obj #:exhaustive]) (zvoid? p))]
        [else (equal? zvoid obj)]
    )
)

; cap - capacity, iv - initial value, ev - empty value, k2i - key to index map, vvec - value vector
(struct zhash (cap iv ev k2i vvec) #:mutable #:transparent #:reflection-name 'zhash)
; by default, k2i is an empty hash, vvec is a vector of default value ev
(define (make-zhash cap #:iv [iv zvoid] #:ev [ev zvoid]) (zhash cap iv ev (make-hash) (make-vector cap iv)))
(define (zhash-keys arg-zhash) (zhash-k2i arg-zhash))
(define (zhash-vals arg-zhash) (zhash-vvec arg-zhash))

; return a copy of a newly constructed list with element in the designated position replaced by given one
; - arg-ind should be concrete, if not concrete, the caller should wrap a for/all first
; - arg-val can be anything
; - arg-list can be symbolic, but by construction, we don't need for/all here
(define (zhash-val-set! arg-zhash arg-ind arg-val)
    (when (or (not (integer? arg-ind)) (symbolic? arg-ind)) (println-and-exit (format "# [zhash-panic] zhash-val-set: arg-ind should be a concrete integer, got: ~a." arg-ind)))
    (let ([vvec (zhash-vvec arg-zhash)])
        (cond
            ; (note) vvec here in rosette can be
            ; - a concrete vector
            ; - a vector of terms, e.g., (list (ite ...) (ite ...)), whose length is fixed
            ; - (note) by construction, it will NOT be a union
            [(vector? vvec) (vector-set! vvec arg-ind arg-val)]
            [else (println-and-exit (format "# [zhash-panic] zhash-val-set: unsupported vector type, got: ~a." vvec))]
        )
    )
)

; check the key-index-map for existence of a key
; - arg-key should be concrete, if not concrete, the caller should wrap a for/all first
(define (zhash-key-exists? arg-zhash arg-key)
    (when (symbolic? arg-key) (println-and-exit (format "# [zhash-panic] zhash-key-exists?: arg-key should be concrete, got: ~a." arg-key)))
    (let ([k2i (zhash-k2i arg-zhash)])
        (hash-has-key? k2i arg-key)
    )
)

; check the **factual** existence of a key
; if the corresponding value of this key is zvoid, it means the key is **factually** non-existent
(define (zhash-has-key? arg-zhash arg-key)
    (cond
        [(symbolic? arg-key) (for/all ([dkey arg-key #:exhaustive]) (zhash-has-key? arg-zhash dkey))]
        [else
            (if (zhash-key-exists? arg-zhash arg-key)
                ; key exists in the key-index-map, check whether it's zvoid/empty-val
                (let ([vvec (zhash-vvec arg-zhash)]
                      [k2i (zhash-k2i arg-zhash)]
                      [ev (zhash-ev arg-zhash)])
                    (if (equal? ev (vector-ref vvec (hash-ref k2i arg-key)))
                        #f ; zvoid/ev will be treated as key doesn't exist
                        #t ; otherwise the key exists
                    )
                )
                ; key doesn't exist in the key-index-map, directly return #f
                #f
            )
        ]
    )
)

; make sure arg-key exists in key-index-map
; if not, add it
(define (zhash-secure-key! arg-zhash arg-key)
    ; (printf "# securing key: ~a\n" arg-key)
    (cond
        [(symbolic? arg-key) (for/all ([dkey arg-key #:exhaustive]) (zhash-secure-key! arg-zhash dkey))]
        [else
            (when (not (zhash-key-exists? arg-zhash arg-key))
                (let ([k2i (zhash-k2i arg-zhash)])
                    (when (>= (hash-count k2i) (zhash-cap arg-zhash)) 
                        (println-and-exit (format "# [zhash-panic] zhash-secure-key!: zhash capacity exceeded, max is ~a, now is ~a" (zhash-cap arg-zhash) (hash-count k2i))))
                    ; (fixme) you probably want to temporarily clear the vc here
                    (hash-set! k2i arg-key (hash-count k2i)) ; add the key to the key-index-map
                )
            )
        ]
    )
)

; (note) if the key doesn't exist, the path will authmatically be cut by rosette, which is expected
(define (zhash-ref arg-zhash arg-key)
    (cond
        [(symbolic? arg-key) (for/all ([dkey arg-key #:exhaustive]) (zhash-ref arg-zhash dkey))]
        [else 
            (let ([vvec (zhash-vvec arg-zhash)]
                  [k2i (zhash-k2i arg-zhash)])
                (vector-ref vvec (hash-ref k2i arg-key))
            )
        ]
    )
)

; (note) if the key doesn't exist, the path will authmatically be cut by rosette, which is expected
; this returns a copy of a newly set val-list
(define (zhash-set! arg-zhash arg-key arg-val)
    ; first secure all the keys
    ; this will update val-list to make sure of sufficient slots before actual filling of values
    (zhash-secure-key! arg-zhash arg-key)
    ; then set the value
    (define (exhaustive-set! ex-key)
        (cond
            [(symbolic? ex-key) (for/all ([dkey ex-key #:exhaustive]) (exhaustive-set! dkey))]
            [else
                (let* ([k2i (zhash-k2i arg-zhash)]
                       [ind (hash-ref k2i ex-key)])
                    (zhash-val-set! arg-zhash ind arg-val)
                )
            ]
        )
    )
    (exhaustive-set! arg-key)
)