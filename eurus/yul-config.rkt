#lang rosette
(provide (prefix-out config: (all-defined-out)))

(define vm-default-bitvector-size 256)
(define vm-default-bitvector (bitvector vm-default-bitvector-size))
(define vm-memory-book-size 400)
(define vm-storage-book-size 400)
(define vm-register-size 400)

(define mgr-address-book-size 10)