#lang rosette
; required by `bitvector-split` since the two methods are not provided by default rosette
; (require (only-in rosette/base/core/bitvector bv-type))
(require (only-in rosette/base/core/type get-type))
(require "./yul-config.rkt")
(require "./yul-components.rkt")
(provide (all-defined-out))

; used for forced break out of the execution
(define (println-and-exit msg)
    (printf "~a\n" msg)
    (exit 0)
)

; usually for debugging, asserting obj is one of types, otherwise print and exit
; typs is a list of type predicates
(define (check-type-helper obj typs)
    (if (null? typs)
        #f
        (if ((car typs) obj)
            #t
            (check-type-helper obj (cdr typs))
        )
    )
)
(define (check-type obj . typs)
    (if (check-type-helper obj typs)
        #t
        (println-and-exit (format "# [exception]: type checking failed, required types are: ~a, obj is: ~v" typs obj))
    )
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

; encode every element in the arguments one by one
; returns a list of hex strings (no prefix)
; (note) currently we use external wrapper of keccak256 function
;        this method is NOT lifted, so it can only be used in non-symbolic context, e.g., manual calldata construction
; (note) if you want to compute hashing in actual symbolic execution, use the lifted version of sha3
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

; =================================================== ;
; ========== Eurus Lifted Components/Forms ========== ;
; =================================================== ;

; decide whether the given value can be decomposed by `for/all`
; (note) decomposible here means whether `for/all` will reveal new values or not, see comments for more details
(define (decomposible? v)
    (if (symbolic? v)
        ; symbolic
        (cond 
            ; a union is decomposible
            [(union? v) #t]

            ; symbolic constant is not decomposible
            [(constant? v) #f]

            ; for expression, it could be `ite` or other forms (e.g., +/-)
            ; we use reflecting provided publicly by rosette rather than hacking
            [(expression? v)
                (match v
                    ; (fixme) there are more builtin rosette operators that you need to consider
                    ;         e.g., bitvector->integer
                    [(expression op child ...) (or
                        (equal? 'ite* (object-name op))
                        (equal? 'ite (object-name op))
                    )]
                    [_ (println-and-exit "# [exception] you can't reach here.")] ; for debugging in case anyone overrides `expression`
                )
            ]

            ; (note) (important) this category usually corresponds to a collection that contains symbolic values
            ;                    note that `symbolic?` is contagious, it mark a value as symbolic as long as any
            ;                    of its member is symbolic
            ; e.g., a struct instance with a symbolic member belongs to this category, and regarding decomposibility,
            ; since it's for deciding whether one should use `for/all` (and whether new values will be revealed under `for/all`),
            ; this category does not require decomposing because `for/all` reveals no new values
            [else #f]
        )
        ; not symbolic, so not decomposible
        #f
    )
)

; append an element to the end of a list
(define (rcons e l) (reverse (cons e (reverse l))))

; test whether a is divisible by b
(define (divisible? a b) (zero? (modulo a b)))

; get struct type of an instance
; (note) a `union` is also a struct, so we need to lift it to inspect structs inside the union
;        the original `struct-info` is by design not "lifted" because it can't ignore the `union` type
(define (struct-type e) (let-values ([(t s) (struct-info e)]) t))

; get the number of bits for a given bv
; (note) get-type is not provided by rosette by default
(define (bv-size b) (bitvector-size (get-type b)))

; split the given bitvector `b` into a list of `n`-bit bitvectors
; this will throw exception if number of bits in b is not divisible by n
; e.g.:
;   (bv #x025fd3dd 32) --split by 8--> (list (bv #x02 8) (bv #x5f 8) (bv #xd3 8) (bv #xdd 8))
(define (bitvector-split b n)
    (define nbits (bv-size b))
    ; (fixme) change this to false assertion when debugging is done
    (when (not (divisible? nbits n)) (println-and-exit (format "# [exception] bitvector size is not divisible by target size, got ~a and ~a." nbits n)))
    ; (when (not (divisible? nbits n)) (assert #f)) ; cut this path
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

; used for manual construction of calldata for both debugging and synthesis problem setting
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
