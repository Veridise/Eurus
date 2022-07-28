#lang rosette
(require json
    (prefix-in tokamak: "../tokamak.rkt") ; shared
    (prefix-in utils: "./utils.rkt")
    (prefix-in comp: "./components.rkt")
    "./parser.rkt" "./vm.rkt"
)
(provide (all-defined-out))

(define manager%
    (class object%
        (super-new)
        (field

            ; every account or vm should have an entry in balance book,
            ; but only vm has entry in address book (pure account doesn't)
            [address-book (make-hash)] ; address -> vm
            [balance-book (make-hash)] ; address -> balance (bv256), unsigned

            ; eurus_prank_once
            [preset-sender null]
        )

        (define/public (new-balance-account arg-address [arg-value (bv 0 256)])
            (when (hash-has-key? balance-book arg-address)
                (tokamak:exit "[new-balance-account] manager already has a balance account at ~a." arg-address))
            (hash-set! balance-book arg-address arg-value)
        )

        (define/public (deploy arg-yul arg-config arg-address arg-nickname)
            (define tmp-config (if (string? arg-config)
                ; string, load in firsst
                (string->jsexpr (file->string arg-config))
                ; (fixme) something else, just use as it is
                arg-config
            ))

            (define tmp-yul-str (if (string? arg-yul)
                ; string, load in first
                (file->string arg-yul)
                ; (fixme) something else, just use as it is
                arg-yul
            ))

            ; update linkersymbol
            ; (let ([ls (hash-ref arg-config "linker-symbol")])
            ;     (for ([k (hash-keys ls)])
            ;         (printf "# [debug] replacing: ~a\n" k)
            ;         (set! tmp-yul-str 
            ;             (string-replace 
            ;                 tmp-yul-str 
            ;                 (format "~a" k)
            ;                 (format "~a" (hash-ref ls k))
            ;             )
            ;         )
            ;     )
            ; )

            (define tmp-yul (parse-yul-json 
                (string->jsexpr tmp-yul-str)
                (hash-ref arg-config "linker-symbol") ; update linkersymbol
            ))

            (define tmp-vm (new vm%))
            (send tmp-vm deploy tmp-yul tmp-config) ; deploy

            (hash-set! address-book arg-address tmp-vm) ; add to address book at given address
            (when (not (hash-has-key? balance-book arg-address))
                ; (fixme) if there's already an account in the balance book, you don't need to create it again
                ; just leave it as it is
                (hash-set! balance-book arg-address (bv 0 256)) ; create balance account
            )
            (set-field! vm-manager tmp-vm this) ; link the manager to the vm's `vm-manager` field
            (set-field! vm-address tmp-vm arg-address)
            (set-field! vm-nickname tmp-vm arg-nickname)
        )

        (define/public (get-vm arg-address)
            (hash-ref address-book arg-address)
        )

        (define/public (get-balance arg-address)
            (hash-ref balance-book arg-address)
        )

        (define/public (mint arg-address arg-value)
            ; (printf "[debug] mint | addr: ~a, val: ~a\n" arg-address arg-value)
            (let ([v0 (get-balance arg-address)])
                (hash-set! balance-book arg-address (bvadd v0 arg-value))
            )
        )

        ; (note) if this transfer operation fails (e.g., not enough balance), it returns #f, otherwise #t
        (define/public (transfer arg-from arg-to arg-value)
            ; (printf "[debug] transfer | from: ~a, to: ~a, val: ~a\n" arg-from arg-to arg-value)
            (if (bvzero? arg-value)
                ; do nothing and save
                #t
                ; else do something
                (let ([vfrom (get-balance arg-from)] [vto (get-balance arg-to)])
                    (if (bvuge vfrom arg-value)
                        ; enough balance
                        (let ([xfrom (bvsub vfrom arg-value)] [xto (bvadd vto arg-value)])
                            (hash-set! balance-book arg-from xfrom)
                            (hash-set! balance-book arg-to xto)
                            #t
                        )
                        ; not enough balance
                        #f
                    )
                )
            )
        )

        ; returns #t if the balance>=value
        (define/public (check-balance arg-address arg-value)
            (let ([v (get-balance arg-address)])
                (bvuge v arg-value)
            )
        )

        ; this is supposed to be called by vms invoking `call` method
        (define/public (call arg-address arg-callpack [arg-codescope 'dispatcher])
            ; (printf "# calldata is: ~a\n" (comp:callpack-calldata arg-callpack))

            (define arg-callpack0 (if (null? preset-sender)
                ; use original callpack
                (comp:callpack
                    (comp:callpack-caller arg-callpack)
                    (comp:callpack-origin arg-callpack)
                    (comp:callpack-gas arg-callpack)
                    (comp:callpack-wei arg-callpack)
                    (comp:callpack-calldata arg-callpack)
                    (comp:callpack-cntx arg-callpack)
                )
                ; use prank caller set by eurus_prank_once
                (let ([sender preset-sender])
                    (set! preset-sender null) ; don't forget to clear it after use
                    (comp:callpack
                        sender
                        sender
                        (comp:callpack-gas arg-callpack)
                        (comp:callpack-wei arg-callpack)
                        (comp:callpack-calldata arg-callpack)
                        (comp:callpack-cntx arg-callpack)
                    )
                )
            ))

            (define v0 (comp:callpack-wei arg-callpack0)) ; value to send
            (define caller0 (comp:callpack-caller arg-callpack0)) ; this is the caller, but arg-address is the callee
            ; first check balance of caller
            (when (not (check-balance caller0 v0))
                (tokamak:exit "[call] caller does not have enough balance, required: >= ~a, current: ~a, caller: ~a\n" v0 (get-balance caller0) caller0))
            ; then settle balance
            (transfer caller0 arg-address v0)
            ; then execute the call
            (cond
                [(empty? (comp:callpack-calldata arg-callpack0))
                    ; empty call, this could just be exec. of transfer
                    ; if you are here, then the transfer is successful
                    (comp:ret 'normal (list 
                        ; a memory chunk of bv #t
                        (append
                            (for/list ([i (range 7)]) (bv 0 8))
                            (list (bv 1 8))
                        )
                    )) 
                ]
                [else
                    ; it's not free lunch, you need to execute
                    (define vm0 (get-vm arg-address))
                    (cond
                        [(equal? 'constructor arg-codescope)
                            ; call constructor
                            (send vm0 construct arg-callpack0)
                        ]
                        [(equal? 'dispatcher arg-codescope)
                            ; directly return the memory
                            (send vm0 dispatch arg-callpack0)
                        ]
                        [else (tokamak:exit "[call] unknown codescope, got: ~a." arg-codescope)]
                    )

                ]
            )
        )

        ; this is supposed to be called by vms invoking `delegatecall` method
        (define/public (call-with-context arg-address arg-callpack arg-rstack arg-param)
            (let ([vm0 (get-vm arg-address)])
                (send vm0 dispatch-with-context arg-callpack arg-rstack arg-param) ; directly return the memory
            )
        )

    )
)