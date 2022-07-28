#lang rosette
(require rackunit
    (prefix-in tokamak: "../tokamak.rkt") ; shared
    (prefix-in config: "../config.rkt") ; shared
    (prefix-in comp: "./components.rkt")
)
; forced import of some internal procedure of bv
; (require/expose bv/private/bv (bitvector-size sbv-type)) ; for racket bv
(require (only-in rosette/base/core/type get-type)) ; for rosette bv
(provide (rename-out
    [keccak256 keccak256]
    [number->address number->address]
    [bv8-list->abi-string bv8-list->abi-string]
    [abi-string->bv8-list abi-string->bv8-list]
    [simple-encode-string simple-encode-string]
    [simple-decode-string simple-decode-string]
    [abi-encode abi-encode]
    [abi-decode abi-decode]
    [construct-calldata construct-calldata]
    [decode-returndata decode-returndata]
    [rcons rcons]
    [struct-type struct-type]
    [bitvector-split bitvector-split]
    [bitvector->bool bitvector->bool]
))

; return the root path of the project
(define (root-path)
    (let ([cc (current-directory)])
        (cond
            [(file-exists? (build-path cc ".root")) cc]
            [(file-exists? (build-path cc 'up ".root")) (build-path cc 'up)]
            [else (tokamak:exit "[root-path] can't find root path via template, please double check and add more.")]
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
    ; if there's only one argument, return the hash, otherwise wrapped into a list to return
    (if (equal? 1 (length l))
        (string-trim out-str) ; use trim to remove \n
        (string-split out-str "\n")
    )
)

; convert number to address, with leading zeros padded to 40 characters
(define (number->address d) 
    (format "~a" (~a (number->string d 16)
        #:min-width 40 #:align 'right #:left-pad-string "0")))

; helper function for abi-encode
(define (abi-string->bv8-list s) 
    (define r0 (string->list s))
    (define h0 (for/list ([i (range (/ (length r0) 2))])
        (string
            (list-ref r0 (* 2 i))
            (list-ref r0 (+ 1 (* 2 i)))
        )
    ))
    (define b0 (for/list ([z h0])
        (bv (string->number z 16) 8)
    ))
    b0
)

; return a list of bv8
; each string in l is in a form of: [typ,...], [val,...]
(define (abi-encode . l)
    (define rp (root-path))
    (define q (path->string (build-path rp "utils" "abiencode.py")))
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
    ; if there's only one argument, return the hash, otherwise wrapped into a list to return
    (if (equal? 1 (length l))
        (abi-string->bv8-list (string-trim out-str)) ; use trim to remove \n
        (for/list ([p (string-split out-str "\n")]) (abi-string->bv8-list p))
    )
)

; helper function for abi-decode
; good for **partly** feeding to python's abi-decode
(define (bv8-list->abi-string l)
    (format "b'~a'"
        (string-join
            (for/list ([p l])
                (format "\\x~a"
                    (~a 
                        (number->string (bitvector->natural p) 16) 
                        #:min-width 2 #:align 'right #:left-pad-string "0"
                    )
                )
            )
            ""
        )
    )
)

; each string in l is in a form of: [type,...], mem
; where mem is: b'\x00...'
; (note) all return come as string, the caller need to parse again
(define (abi-decode . l)
    (define rp (root-path))
    (define q (path->string (build-path rp "utils" "abidecode.py")))
    (define-values (sp out in err)
        ; (note) use `apply` to expand the last argument
        (apply subprocess #f #f #f (find-executable-path "python3") q l)
    )
    (define out-str (port->string out))
    (define err-str (port->string err))
    (close-input-port out)
    (close-output-port in)
    (close-input-port err)
    (subprocess-wait sp)
    ; if there's only one argument, return the hash, otherwise wrapped into a list to return
    (if (equal? 1 (length l))
        (string-split (string-trim out-str) "<sep>") ; use trim to remove \n
        (for/list ([p (string-split out-str "\n")]) (string-split p "<sep>"))
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

; in racket version of bv, this function does not exist
(define (bitvector->bool x) (not (bvzero? x)))

; get the number of bits for a given bv
; (note) get-type is not provided by rosette by default
; (define (bv-size b) (bitvector-size (sbv-type b)))
(define (bv-size b) (bitvector-size (get-type b)))

; (fixme) is this right? probably not, this is a simple version
; encode string into utf8 and align to 32 bytes / 256 bits
; pad to left, input string, output bv256
(define (simple-encode-string s)
    (let ([l0 (bytes->list (string->bytes/utf-8 s))])
        (apply concat
            (append
                (for/list ([x l0])
                    (bv x 8)
                )
                ; pad to 32 bytes
                (for/list ([_ (range (- 32 (length l0)))])
                    (bv 0 8)
                )
            )
        )
    )
)
; (fixme) see above
; input bv256, output string
(define (simple-decode-string b)
    (bytes->string/utf-8 (list->bytes 
        (filter
            positive?
            (for/list ([l0 (bitvector-split b 8)])
                (bitvector->natural l0)
            )
        )
    ))
)

; split the given bitvector `b` into a list of `n`-bit bitvectors
; this will throw exception if number of bits in b is not divisible by n
; e.g.:
;   (bv #x025fd3dd 32) --split by 8--> (list (bv #x02 8) (bv #x5f 8) (bv #xd3 8) (bv #xdd 8))
(define (bitvector-split b n)
    (define nbits (bv-size b))
    (when (not (divisible? nbits n)) 
        (tokamak:exit "[bitvector-split] bitvector size is not divisible by target size, got ~a and ~a." nbits n))
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

; (note) calldata has 4 bytes for encoding function signature, but returndata doesn't

; used for manual construction of calldata for both debugging and synthesis problem setting
(define (construct-calldata fsig args)
    ; construct the function selector
    (define fsig-num (string->number (substring (keccak256 fsig) 0 8) 16))
    (define fsig-bv (bv fsig-num 32)) ; function selector takes up 4 bytes, which is 32 bits
    ; (printf "# fsig: ~a\n" fsig-bv)
    ; tear all apart into a mini memory structure with 1 byte (8 bits) per memory location
    (define fsig-mem (bitvector-split fsig-bv 8))

    ; construct the abi encoded arguments
    (define args0 (list )) ; list of types
    (define args1 (list )) ; list of values
    (for ([p args])
        (let ([typ (car p)] [val (cdr p)])
            ; (set! args0 (append args0 (list (format "'~a'" typ))))
            (cond
                [(or (equal? typ "uint256") (equal? typ "uint8") (equal? typ "uint16") (equal? typ "uint64"))
                    (set! args0 (append args0 (list (format "'~a'" typ))))
                    (set! args1 (append args1 (list (format "~a" val))))
                ]
                [(or (equal? typ "int") (equal? typ "int256"))
                    (set! args0 (append args0 (list (format "'~a'" typ))))
                    (set! args1 (append args1 (list (format "~a" val))))
                ]
                ; (fixme) this is wrong
                [(equal? typ "bytes32")
                    (set! args0 (append args0 (list (format "'~a'" typ))))
                    (if (string-prefix? val "0x")
                        ; 0x??, remove 0x
                        (set! args1 (append args1 (list (format "b'~a'" (substring val 2)))))
                        ; ??
                        (set! args1 (append args1 (list (format "b'~a'" val))))
                    )
                ]
                ; (fixme) this is wrong
                [(equal? typ "bytes")
                    (set! args0 (append args0 (list (format "'~a'" typ))))
                    (if (string-prefix? val "0x")
                        ; 0x??, remove 0x
                        (set! args1 (append args1 (list (format "b'~a'" (substring val 2)))))
                        ; ??
                        (set! args1 (append args1 (list (format "b'~a'" val))))
                    )
                ]
                [(equal? typ "bool")
                    (set! args0 (append args0 (list (format "'~a'" typ))))
                    (set! args1 (append args1 (list (if val "True" "False"))))
                ]
                [(equal? typ "string")
                    (set! args0 (append args0 (list (format "'~a'" typ))))
                    (set! args1 (append args1 (list (format "'~a'" val))))
                ]
                [(or (equal? typ "address") (equal? typ "address payable"))
                    (set! args0 (append args0 (list (format "'~a'" "address")))) ; (note) both are address
                     (set! args1 (append args1 (list (format "'0x~a'" val))))
                ]
                [else (tokamak:exit "[construct-calldata] unrecognized type, got: ~a." typ)]
            )
        )
    )
    ; (printf "args0 is: ~a\n" args0)
    ; (printf "args1 is: ~a\n" args1)
    (define s0 (format "[~a], [~a]" (string-join args0 ",") (string-join args1 ",")))
    ; (printf "s0 is: ~a\n" s0)
    (define args-mem (abi-encode s0))
    ; (printf "args-mem is: ~a\n" args-mem)

    ; then concatenate them and return
    (append fsig-mem args-mem)
)

; typs: a list of intended types
; ms: returned data memory chunk, a list of bv8
; return a list of parsed values with corresponding types
(define (decode-returndata typs ms)
    (define ss (bv8-list->abi-string ms))
    (define ll (string-append
        (format "[~a]" (string-join (for/list ([p typs]) (format "'~a'" p)) ","))
        ","
        ss
    ))
    (define rr (abi-decode ll))
    ; (printf "rr returned: ~a\n" rr)
    (when (not (equal? (length rr) (length typs)))
        (tokamak:exit "[decode-returndata] lengths mismatch, typs has ~a, rr has ~a." (length typs) (length rr)))
    (for/list ([t typs] [r rr])
        (cond
            [(equal? "string" t) r]
            [(equal? "address" t) r] ; (fixme) this returns "0x...", and you probably need to remove "0x"
            [(or (equal? "uint256" t) (equal? "uint8" t) (equal? "uint16" t) (equal? "bytes32" t)) (string->number r)]
            [(or (equal? "int256" t) (equal? "int" t)) (string->number r)]
            [(equal? "bool" t) (if (equal? "True" r) #t #f)]
            [else (tokamak:exit "[decode-returndata] unsupported type and value, got: ~a, ~a." t r)]
        )
    )
)