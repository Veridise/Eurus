#lang rosette
(require
    (prefix-in tokamak: "../tokamak.rkt")
)
(provide (all-defined-out))

(define mvoid 'mvoid)
(define (mvoid? obj)
    (tokamak:typed obj concrete?)
    (equal? mvoid obj)
)

; cap: capacity, k2i: key-to-index mapping (a hashmap), vvec: vector of cap for storing values
; mhash can only have string keys, and arbitrary values
(struct mhash (cap k2i vvec) #:mutable #:transparent #:reflection-name 'mhash)
(define (mhash-keys arg-mhash) (mhash-k2i arg-mhash))
(define (mhash-vals arg-mhash) (mhash-vvec arg-mhash))
(define (make-mhash cap)
    (tokamak:typed cap tokamak:cnatural?)
    (let ([k2i (make-hash)] [vvec (make-vector cap mvoid)])
        (mhash cap k2i vvec)
    )
)

(define (mhash-has-key? arg-mhash arg-key)
    (tokamak:typed arg-mhash mhash?)
    (tokamak:typed arg-key string? tokamak:cnatural?)
    (hash-has-key? (mhash-k2i arg-mhash) arg-key)
)

(define (mhash-secure-key! arg-mhash arg-key)
    (tokamak:typed arg-mhash mhash?)
    (tokamak:typed arg-key string? tokamak:cnatural?)
    (when (not (mhash-has-key? arg-mhash arg-key))
        (let ([k2i (mhash-k2i arg-mhash)])
            (tokamak:typed k2i hash?)
            (if (<= (mhash-cap arg-mhash) (hash-count k2i))
                ; cap exceeds
                (tokamak:exit "[mhash-secure-key!] mhash capacity exceeded, max is ~a" (mhash-cap arg-mhash))
                ; cap not exceeds
                (hash-set! k2i arg-key (hash-count k2i))
            )
        )
    )
)

(define (mhash-set! arg-mhash arg-key arg-val)
    (tokamak:typed arg-mhash mhash?)
    (tokamak:typed arg-key string? tokamak:cnatural?)
    ; arg-val can be symbolic
    (mhash-secure-key! arg-mhash arg-key)
    (let* ([k2i (mhash-k2i arg-mhash)] [ind (hash-ref k2i arg-key)])
        (tokamak:typed k2i hash?)
        (tokamak:typed ind tokamak:cnatural?)
        (let ([vvec (mhash-vvec arg-mhash)])
            (tokamak:typed vvec vector?)
            (vector-set! vvec ind arg-val)
        )
    )
)

(define (mhash-ref arg-mhash arg-key)
    (tokamak:typed arg-mhash mhash?)
    (tokamak:typed arg-key string? tokamak:cnatural?)
    (if (mhash-has-key? arg-mhash arg-key)
        ; existent
        (let* ([k2i (mhash-k2i arg-mhash)] [ind (hash-ref k2i arg-key)])
            (tokamak:typed k2i hash?)
            (tokamak:typed ind tokamak:cnatural?)
            (let ([vvec (mhash-vvec arg-mhash)])
                (tokamak:typed vvec vector?)
                (vector-ref vvec ind)
            )
        )
        ; not existent
        (tokamak:exit "[mhash-ref] referenced key not found, got: ~a" arg-key)
    )
)