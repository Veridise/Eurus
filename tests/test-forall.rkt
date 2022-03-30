#lang rosette
(struct tt (v) #:transparent)
(struct rr (a b) #:transparent)

(define-symbolic x0 integer?)
(define x9 9)

(define t0 (tt x0))
(define t1 (tt 9))

(define r0 (rr 1 x0))

(define xlist (list 0 1 2 3))
(define xx (list-ref xlist x0))
(define r1 (rr 1 xx))

(printf "top\n")
(for/all ([v r1]) (printf "~a\n" v))

(printf "top-ex\n")
(for/all ([v r1 #:exhaustive]) (printf "~a\n" v))

(printf "bottom\n")
(for/all ([v (rr-b r1)]) (printf "~a\n" v))

(printf "bottom-ex\n")
(for/all ([v (rr-b r1) #:exhaustive]) (printf "~a\n" v))

(printf "atom-all\n")
(for/all ([v x0 #:exhaustive]) (printf "~a\n" v))

(printf "not-symbolic\n")
(for/all ([v x9 #:exhaustive]) (printf "~a\n" v))