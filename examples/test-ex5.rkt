; #lang racket
; (require json
;     (prefix-in env: "../eurus/racket/env.rkt")
; )

#lang rosette
(require json
    (prefix-in env: "../eurus/rosette/env.rkt")
)

; turn on verbose
(env:verbose #t)
; shortcuts for list and pair construction
(define (: x y) (cons x y))
(define ($ . l) (apply list l))

; =================================== ;
; ======== account addresses ======== ;
; =================================== ;
(env:account "deployer" (env:rand-account) 131)
(env:account "attacker" (env:rand-account) 0)

(env:account "exlib" (env:rand-account) 0)

; =========================================== ;
; ======== vm configuration (shared) ======== ;
; =========================================== ;
(define shared-config (make-hash ($
    (: "linker-symbol" (make-hash ($
        (: "ex/ex.sol:exlib" (env:@account "exlib"))
    )))
)))

; ===================================== ;
; ======== contract deployment ======== ;
; ===================================== ;
(env:setup "./ex/" "exlib" shared-config #:address (env:@account "exlib"))
(env:setup "./ex/" "ex5" shared-config)

; ======================= ;
; ======== start ======== ;
; ======================= ;
(env:call (env:@account "deployer") (env:@vm "exlib") "constructor" ($ ))
(env:call (env:@account "deployer") (env:@vm "ex5") "constructor" ($ ))
(env:call (env:@account "deployer") (env:@vm "ex5") "sub" ($ 26 9) #:decode? #t)
