#lang rosette
(require rosette/lib/destruct)

(struct org (a b))
(struct orgk (a b))

(define xample (orgk 1 (org 1 2)))

(destruct xample
  [(orgk a b) (printf "matched\n")]
  [_ (printf "not matched")]
)