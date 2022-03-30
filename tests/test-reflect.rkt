#lang rosette

(define-symbolic x0 integer?) ; term, constant
(define y0 (+ 1 x0)) ; term, expression
(define xlist (list 1 2 3 4))
(define zlist (list 1 #t))
(define y1 (list-ref xlist x0)) ; ite, conditional symbolic term / term, expression
(define y2 (list-ref zlist x0)) ; union / 