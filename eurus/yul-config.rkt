#lang rosette
(provide (prefix-out config: (all-defined-out)))

(define vm-default-bitvector-size 256)
(define vm-default-bitvector (bitvector vm-default-bitvector-size))
(define vm-memory-book-size 200)
(define vm-storage-book-size 200)
(define vm-register-size 200)

(define mgr-address-book-size 10)