#lang rosette
(require "../eurus/yul-utils.rkt")

(define l0 (list 1 2 3 4))
(define l1 (list 1 #f (bv 3 4)))

(define-symbolic x0 integer?)
(define x1 (+ 1 x0))
(define x2 (list-ref l0 x0))
(define x3 (list-ref l1 x0))

(printf "x0: ~a\n" (decomposible? x0))
(printf "x1: ~a\n" (decomposible? x1))
(printf "x2: ~a\n" (decomposible? x2))
(printf "x3: ~a\n" (decomposible? x3))

(define (test-func x)
  (cond
    ; using symbolic? here will cause the program to get stuck in an infinite loop
    [(decomposible? x) (for/all ([x0 x #:exhaustive]) (test-func x0))]
    [else 9]
  )
)