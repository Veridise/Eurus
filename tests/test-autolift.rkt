#lang rosette
(require "../eurus/yul-utils.rkt")

(define ^+ (eurus-lift0 +))

(define (m0 arg) (if (integer? arg) (+ 100 arg) 47))
(define ^m0 (eurus-lift0 m0))

(define-symbolic ptr0 integer?)
(define l0 (list 1 #t))
(define v0 (list-ref l0 ptr0))