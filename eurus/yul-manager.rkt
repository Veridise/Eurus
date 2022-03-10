#lang rosette
(require json)
(require "./zhash.rkt")
(require "./yul-config.rkt")
(require "./yul-utils.rkt")
(require "./yul-vm.rkt")
(require "./yul-parser.rkt")
(provide (all-defined-out))

(define yul-manager%
    (class object%
        (super-new)
        (field

            ; one address can hold at most one contract or EOA, which will be represented by a yul virtual machine (yul-vm)
            ; - (note) the address unit of address 0 is initially set to #f, because an address unit can store a vm object
            ;          which is of different type than boolean
            [address-book (make-zhash config:mgr-address-book-size #:iv #f #:ev #f)]
        )

        (define/public (deploy arg-yul arg-config arg-address)
            (define tmp-yul (if (string? arg-yul)
                ; string, load in first
                (parse-yul-json (string->jsexpr (file->string arg-yul)))
                ; (fixme) something else, just use as it is
                arg-yul
            ))
            (define tmp-config (if (string? arg-config)
                ; string, load in firsst
                (string->jsexpr (file->string arg-config))
                ; (fixme) something else, just use as it is
                arg-config
            ))
            (define tmp-vm (new yul-vm%))
            (send tmp-vm deploy tmp-yul tmp-config) ; deploy

            (zhash-set! address-book arg-address tmp-vm) ; add to address book at given address
            (set-field! vm-manager tmp-vm this) ; link the manager to the vm's `vm-manager` field
            (set-field! vm-address tmp-vm arg-address)
        )

        (define/public (get-vm arg-address)
            (zhash-ref address-book arg-address)
        )

        ; this is supposed to be called by vms invoking `call` method
        (define/public (call arg-address arg-callpack)
            (let ([vm0 (get-vm arg-address)])
                (send vm0 dispatch arg-callpack) ; directly return the memory
            )
        )

    )
)