#lang rosette
; required by `bitvector-split` since the two methods are not provided by default rosette
(require (only-in rosette/base/core/bitvector bv-type bv-value))
(require "./yul-config.rkt")
(require "./yul-components.rkt")
(provide (all-defined-out))

; used for forced break out of the execution
(define (println-and-exit msg)
    (printf "~a\n" msg)
    (exit 0)
)

; return the root path of the project
(define (root-path)
    (let ([cc (current-directory)])
        (cond
            [(file-exists? (build-path cc ".root")) cc]
            [(file-exists? (build-path cc "up" ".root")) (build-path cc "up")]
            [else (println-and-exit (format "# [exception] can't find root path via template, please double check and add more."))]
        )
    )
)

; append an element to the end of a list
(define (rcons e l) (reverse (cons e (reverse l))))

; get struct type of an instance
(define (struct-type e)
    (let-values ([(t s) (struct-info e)])
        t
    )
)

; encode every element in the arguments one by one
; returns a list of hex strings (no prefix)
; (fixme) currently we use external wrapper of keccak256 function
;         but eventually we may need a built-in and (potentially) lifted version in rosette
(define (keccak256 . l)
    (define rp (root-path))
    (define q (path->string (build-path rp "utils" "keccak256.py")))
    (define-values (sp out in err)
        ; (note) use `apply` to expand the last argument
        (apply subprocess #f #f #f (find-executable-path "python") q l)
    )
    (define out-str (port->string out))
    (define err-str (port->string err))
    (close-input-port out)
    (close-output-port in)
    (close-input-port err)
    (subprocess-wait sp)
    ; (printf "out is: ~a\n" out-str)
    ; (printf "err is: ~a\n" err-str)
    ; if there's only one argument, return the hash, otherwise wrapped into a list to return
    (if (equal? 1 (length l))
        (string-trim out-str) ; use trim to remove \n
        (string-split out-str "\n")
    )
)

; test whether a is divisible by b
(define (divisible? a b) (zero? (modulo a b)))

; split the given bitvector `b` into a list of `n`-bit bitvectors
; this will throw exception if number of bits in b is not divisible by n
; e.g.:
;   (bv #x025fd3dd 32) --split by 8--> (list (bv #x02 8) (bv #x5f 8) (bv #xd3 8) (bv #xdd 8))
(define (bitvector-split b n)
    (define nbits (bitvector-size (bv-type b)))
    (when (not (divisible? nbits n)) (println-and-exit (format "# [exception] bitvector size is not divisible by target size, got ~a and ~a." nbits n)))
    ; divisible here, move on to extract a list of nbit bvs
    (define nchks (quotient nbits n))
    (define bvlist (for/list ([i nchks])
        (let ([st (* i n)])
            (extract (+ st (- n 1)) st b)
        )
    ))
    ; just return
    (reverse bvlist)
)

; (todo)
(define (construct-calldata fsig args)
    ; construct the function selector
    (define fsig-num (string->number (substring (keccak256 fsig) 0 8) 16))
    (define fsig-bv (bv fsig-num 32)) ; function selector takes up 4 bytes, which is 32 bits
    ; construct a list of bvs
    (define args-bvlist (for/list ([p args])
        (let ([tmp-type (car p)] [tmp-val (cdr p)])
            (cond
                [(equal? "uint256" tmp-type) (integer->bitvector tmp-val (bitvector 256))]
                [(equal? "address" tmp-type) (integer->bitvector tmp-val (bitvector 256))]
                [(equal? "bool" tmp-type) (bool->bitvector tmp-val 256)]
                [else (println-and-exit "# [exception] unsupported type for calldata construction, got: ~a." tmp-type)]
            )
        )
    ))
    ; tear all apart into a mini memory structure with 1 byte (8 bits) per memory location
    (define fsig-mem (bitvector-split fsig-bv 8))
    (define args-mem (flatten
        (for/list ([p args-bvlist])
            (bitvector-split p 8)
        )
    ))
    ; then concatenate them and return
    (append fsig-mem args-mem)
)

; (fixme)(debug)
(define (bitvector-split-256 b n)
    (define nbits 256)
    (when (not (divisible? nbits n)) (println-and-exit (format "# [exception] bitvector size is not divisible by target size, got ~a and ~a." nbits n)))
    ; divisible here, move on to extract a list of nbit bvs
    (define nchks (quotient nbits n))
    (define bvlist (for/list ([i nchks])
        (let ([st (* i n)])
            (extract (+ st (- n 1)) st b)
        )
    ))
    ; just return
    (reverse bvlist)
)

; (fixme)(debug)
(define (construct-calldata-256 fsig args)
    ; construct the function selector
    (define fsig-num (string->number (substring (keccak256 fsig) 0 8) 16))
    (define fsig-bv (bv fsig-num 32)) ; function selector takes up 4 bytes, which is 32 bits
    ; construct a list of bvs
    (define args-bvlist (for/list ([p args])
        (let ([tmp-type (car p)] [tmp-val (cdr p)])
            (cond
                [(equal? "uint256" tmp-type) tmp-val]
                [(equal? "address" tmp-type) tmp-val]
                [(equal? "bool" tmp-type) tmp-val]
                [else (println-and-exit "# [exception] unsupported type for calldata construction, got: ~a." tmp-type)]
            )
        )
    ))
    ; tear all apart into a mini memory structure with 1 byte (8 bits) per memory location
    (define fsig-mem (bitvector-split fsig-bv 8))
    (define args-mem (flatten
        (for/list ([p args-bvlist])
            (bitvector-split-256 p 8)
        )
    ))
    ; then concatenate them and return
    (append fsig-mem args-mem)
)