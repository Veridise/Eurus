#lang rosette
(require "./yul-utils.rkt" "./yul-components.rkt")
(provide (all-defined-out))

; gas=0, wei=0
; returns the created vm
(define (make-vm0 caller-addr mgr config-path contract-addr contract-path constructor-sig constructor-args)
    (send mgr deploy contract-path config-path contract-addr)
    (define vm (send mgr get-vm contract-addr))
    (define cp (let ([gas 0] [wei 0] [cd (construct-calldata constructor-sig constructor-args)])
        (callpack caller-addr gas wei cd)
    ))
    (send vm construct cp)
    vm
)

; create a call, but don't call it, just return it
; gas=0, wei=0
(define (create-call0 caller-addr vm function-sig function-args)
    (define cp (let ([gas 0] [wei 0] [cd (construct-calldata function-sig function-args)])
        (callpack caller-addr gas wei cd)
    ))
    (lambda () (send vm dispatch cp))
)

; create a call and call it
; gas=0, wei=0
(define (make-call0 caller-addr vm function-sig function-args)
    (define cp (let ([gas 0] [wei 0] [cd (construct-calldata function-sig function-args)])
        (callpack caller-addr gas wei cd)
    ))
    (send vm dispatch cp)
)

(define (read-value val) (apply concat (car (ret-values val))))