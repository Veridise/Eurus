#lang rosette
(require json
    (prefix-in env: "../eurus/rosette/env.rkt")
)
(error-print-width 1000000) ; option to print more for a symbolic value (rather than truncate it)

; turn on verbose
(env:verbose #t)
; shortcuts for list and pair construction
(define (: x y) (cons x y))
(define ($ . l) (apply list l))

; =================================== ;
; ======== account addresses ======== ;
; =================================== ;
(env:account "deployer" (env:rand-account) 0)
(env:account "attacker" (env:rand-account) 0)

; =========================================== ;
; ======== vm configuration (shared) ======== ;
; =========================================== ;
(define shared-config (make-hash ($
    (: "linker-symbol" (make-hash ($
        ; no linker symbol to add
    )))
)))

; ===================================== ;
; ======== contract deployment ======== ;
; ===================================== ;
(env:setup "./symex/" "symex0" shared-config)

; ======================= ;
; ======== start ======== ;
; ======================= ;
(env:call (env:@account "deployer") (env:@vm "symex0") "constructor" ($ ))
(env:call (env:@account "deployer") (env:@vm "symex0") "add" ($ 45 19) #:decode? #t)
(env:call (env:@account "deployer") (env:@vm "symex0") "test0" ($ ) #:decode? concat)
; (env:call (env:@account "deployer") (env:@vm "symex0") "test0" ($ ) #:decode? #f)
; (env:call (env:@account "deployer") (env:@vm "symex0") "test2" ($ ))
; (env:call (env:@account "deployer") (env:@vm "symex0") "test4" ($ ) #:decode? #t)
