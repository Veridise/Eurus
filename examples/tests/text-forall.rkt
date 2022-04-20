#lang rosette
(define-symbolic ptr0 integer?)
(define-symbolic ptr1 integer?)
(define-symbolic ptr2 integer?)
(define-symbolic ptr3 boolean?)

(define l0 (list 1 2 3 4))
(define l1 (list 5 6 7 8))
(define l2 (list 'a 'b))

(define v0 (list-ref l0 ptr0))
(define v1 (list-ref l1 ptr1))
(define v2 (list-ref l2 ptr2))
(define v3 (if ptr3 (list 1 2) (list 3 4 5)))

;(for*/all ([v00 v0 #:exhaustive] [v11 v1 #:exhaustive])
;  (printf "out: ~a\n" (+ v00 v11)))

(for/all ([v22 v2 #:exhaustive])
  (printf "symbol?: ~a\n" (symbol? v22)))