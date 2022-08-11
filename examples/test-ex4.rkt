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
(env:setup "./ex/" "ex4" shared-config)

; =============================== ;
; ======== general tests ======== ;
; =============================== ;
(env:balance (env:@account "deployer"))
(env:mint (env:@account "deployer") 99)
(env:balance (env:@account "deployer"))
(env:transfer (env:@account "deployer") (env:@account "ex4") 80)
(env:balance (env:@account "deployer"))
(env:balance (env:@account "ex4"))
(env:transfer (env:@account "deployer") (env:@account "ex4") 100)
(env:balance (env:@account "deployer"))
(env:balance (env:@account "ex4"))

; ======================= ;
; ======== start ======== ;
; ======================= ;
(env:call (env:@account "deployer") (env:@vm "ex4") "testBalance" 
    ($ (env:@account "deployer")) #:decode? #t)

(env:call (env:@account "deployer") (env:@vm "ex4") "testTransfer" 
    ($ (env:@account "attacker") 24) #:decode? #t)

(env:balance (env:@account "deployer"))
(env:balance (env:@account "attacker"))
