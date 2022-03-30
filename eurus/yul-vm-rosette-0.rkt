#lang rosette
(require rosette/lib/destruct) ; match syntax in rosette
; (fixme) according to the syntax of Yul, you can actually define a function within a function, 
;         which is not supported / fully tested here for the present
(require sha)
(require "./zhash.rkt")
(require "./yul-config.rkt")
(require "./yul-utils.rkt")
(require "./yul-grammar.rkt")
(require "./yul-components.rkt")
(provide (all-defined-out))

(define yul-vm%
    (class object%
        (super-new)
        (field
            ; default bits for yul is always 256 according to documentation
            [yul-default-bitvector (bitvector config:vm-default-bitvector-size)]
            [yul-builtin-function-book null]

            [memory-book null]
            [storage-book null]

            ; constructor components
            [constructor-node null]
            [constructor-function-book null] ; stores entry nodes of different functions, name -> node

            ; dispatcher components
            [dispatcher-node null]
            [dispatcher-function-book null] ; stores entry nodes of different functions, name -> node

            [vm-config null] ; external configuration provided by the user
            [vm-manager null] ; set by manager deploying this vm, maintain a link to the manager
            [vm-address null] ; set by manager deploying this vm, maintain the address of this vm

            ; (fixme) stateful variables
            [last-returndata (list )] ; for modeling op such as `returndatasize` and `returndatacopy`
        )

        ; ========================================== ;
        ; ========== deployment utilities ========== ;
        ; ========================================== ;
        ; deploy a yul contract node into the vm, called when initializing so data should NOT be symbolic
        ; - arg-node: the top-level yul node
        ; - arg-config: state tracker mainly recording whether the current scope is constructor or dispatcher
        ;   - could store more different trackers in the future
        ; functionalities of the deploy call:
        ; - clear up constructor and dispatcher components
        ; - discover and store the constructor related components: node, map and book
        ; - discover and store the dispatcher related components: node, map and book
        ; - (note) the deploy call doesn't initialize the contract (i.e. call the constructor)
        ;          you need to explicitly call the do-constructor for this
        (define/public (deploy arg-node arg-config #:arg-param [arg-param (default-param)])
            (when (symbolic? arg-node) (println-and-exit "# [exception]: arg-node can't be symbolic."))
            (initialize-yul-builtin-function-book) ; initialize builtin functions
            (set! constructor-node null)
            (set! dispatcher-node null)
            (set! constructor-function-book (make-hash)) ; just for indexing, no need to use the symbolic zhash
            (set! dispatcher-function-book (make-hash)) ; just for indexing, no need to use the symbolic zhash
            (set! vm-config arg-config) ; load vm configuration from the user
            ; (note) memory and storage models are address based, but differ:
            ;        - every memory location is a bitvector with 8 bits / 1 byte.
            ;        - every storage location is a bitvector with 256 bits / 32 bytes.
            ;        - see mstore/mload/sstore/sload for details: https://docs.soliditylang.org/en/v0.8.11/yul.html#evm-dialect
            ; (note) register model is variable based, which means every location is a default yul bitvector with 256 bits / 32 bytes.
            (set! memory-book (make-zhash config:vm-memory-book-size #:iv (bv 0 8) #:ev zvoid)) ; see details in the memory management utilities
            (set! storage-book (make-zhash config:vm-storage-book-size #:iv (bv 0 yul-default-bitvector) #:ev zvoid)) ; see details in the storage management utilities
            (do-deploy arg-node #:arg-param (copy-param arg-param #:code-scope 'start))
        )
        (define/public (do-deploy arg-node #:arg-param [arg-param (default-param)])
            (match arg-node
                ; top-level entrance
                [(yul:start m-object) 
                    ; explicitly changing the code scope to 'constructor
                    ; process the constructor object
                    (do-deploy m-object #:arg-param (copy-param arg-param #:code-scope 'constructor))
                ]

                ; usually this is the main contract object
                ; - m-code is the constructor already
                ; - m-dobj is the dispatcher
                [(yul:cobj m-name m-code m-dobj)
                    ; remove the yul_function_definition from the constructor node
                    (define c-code (yul:code (yul:block 
                        (filter (lambda (x) (not (yul:fundef? (yul:statement-res x))) ) 
                            (yul:block-statements (yul:code-block m-code))))))

                    ; set constructor node
                    (set! constructor-node c-code)

                    ; first process the constructor code
                    ; no need to change parameter
                    (do-deploy m-code #:arg-param (copy-param arg-param))

                    ; then process the dispatcher object
                    ; explicitly changing the code scope to 'dispatcher
                    ; process the dispatcher object
                    (do-deploy m-dobj #:arg-param (copy-param arg-param #:code-scope 'dispatcher))
                ]

                ; usually this is the dispatcher object
                ; - m-code is the dispatcher code
                ; - m-data is the "meteadata" (not sure what this is but it won't be modeled in the vm here)
                [(yul:dobj m-name m-code m-data)
                    ; remove the yul_function_definition from the dispatcher node
                    (define d-code (yul:code (yul:block 
                        (filter (lambda (x) (not (yul:fundef? (yul:statement-res x))) ) 
                            (yul:block-statements (yul:code-block m-code))))))
                    ; set dispatcher node
                    (set! dispatcher-node d-code)
                    ; process the dispatcher code
                    (do-deploy m-code #:arg-param (copy-param arg-param))
                ]

                ; pass on
                [(yul:code m-block) (do-deploy m-block #:arg-param (copy-param arg-param))]
                [(yul:block m-statements) (for ([m m-statements]) (do-deploy m #:arg-param (copy-param arg-param)))]

                [(yul:statement m)
                    (match m
                        [(yul:fundef m-id m-args m-rets m-block)
                            ; add the function node into corresponding components (constructor or dispatcher)
                            (let ([v (yul:id-res m-id)])
                                (cond
                                    [(equal? 'constructor (param-code-scope arg-param))
                                        ; constructor scope
                                        (hash-set! constructor-function-book v m) ; add the function entry node
                                    ]
                                    [(equal? 'dispatcher (param-code-scope arg-param))
                                        ; dispatcher scope
                                        (hash-set! dispatcher-function-book v m) ; add the function entry node
                                    ]
                                    [else (println-and-exit (format "# [exception] unsupported code-scope, got: ~a." (param-code-scope arg-param)))]
                                )
                            )
                        ]

                        ; otherwise for the deploy call we do nothing
                        [_ (void)]
                    )
                ]

                ; otherwise, exit right now for debugging, this is not supposed to appear
                [_ (println-and-exit (format "# [exception][do-deploy]: unsupported node, got: ~a." arg-node))]
            )
        )

        ; =========================================== ;
        ; ========== constructor utilities ========== ;
        ; =========================================== ;
        ; call the constructor code to initialize a contract
        ; this will execute the constructor-node directly
        ; - (note) need to explicitly call deploy first before calling this
        (define/public (construct arg-callpack)
            ; check the avability of the constructor code
            (if (null? constructor-node)
                (println-and-exit (format "# [exception]: constructor-node is null."))
                ; no need to change code-scope since that only works for deploy mode
                (do-construct arg-callpack)
            )
        )
        (define/public (do-construct arg-callpack)
            ; use the default arg-rstack (an empty list, no stack)
            ; need to specify the code scope since it will be used to locate the function book
            (interpret constructor-node #:arg-param (copy-param (default-param) #:code-scope 'constructor #:callpack arg-callpack))
        )

        ; ========================================== ;
        ; ========== dispatcher utilities ========== ;
        ; ========================================== ;
        (define/public (dispatch arg-callpack)
            ; check the avability of the dispatcher code
            (if (null? dispatcher-node)
                (println-and-exit (format "# [exception]: dispatcher-node is null."))
                ; no need to change code-scope since that only works for deploy mode
                (do-dispatch arg-callpack)
            )
        )

        (define/public (do-dispatch arg-callpack)
            (interpret dispatcher-node #:arg-param (copy-param (default-param) #:code-scope 'dispatcher #:callpack arg-callpack))
        )

        ; ============================================== ;
        ; ========== interpretation utilities ========== ;
        ; ============================================== ;
        (define/public (call arg-node #:arg-rstack [arg-rstack (list)] #:arg-param [arg-param (default-param)])
            (check-type arg-node yul:funcall? union?)
            (cond ; ==== start: lift arg-node ====
                [(decomposible? arg-node) ; ==== start: decompose arg-node ====
                    (cond ; ==== start: lift arg-param ====
                        [(decomposible? arg-param) ; ==== start: decompose arg-param ====
                            (for*/all ([dnode arg-node #:exhaustive] [dparam arg-param #:exhaustive])
                                (check-type dnode yul:funcall?)
                                (check-type dparam param?)
                                (call dnode #:arg-rstack arg-rstack #:arg-param dparam)
                            )
                        ] ; ==== end: decompose arg-param ====
                        [else ; ==== start: normal arg-param ====
                            (for/all ([dnode arg-node #:exhaustive])
                                (check-type dnode yul:funcall?)
                                (check-type arg-param param?)
                                (call dnode #:arg-rstack arg-rstack #:arg-param arg-param)
                            )
                        ] ; ==== end: normal arg-param ====
                    ) ; ==== end: lift arg-param ====
                    
                ] ; ==== end: decompose arg-node ====
                [else ; ==== start: normal arg-node ====
                    (cond ; ==== start: lift arg-param ====
                        [(decomposible? arg-param) ; ==== start: decompose arg-param ====
                            (for/all ([dparam arg-param #:exhaustive])
                                (check-type arg-node yul:funcall?)
                                (check-type dparam param?)
                                (call arg-node #:arg-rstack arg-rstack #:arg-param dparam)
                            )
                        ] ; ==== end: decompose arg-param ====
                        [else ; ==== start: normal arg-param ====
                            (check-type arg-node yul:funcall?)
                            (check-type arg-param param?)

                            ; first find the function in the corresponding function book
                            (define target-function-book 
                                (let ([tmp-code-scope (param-code-scope arg-param)])
                                    (check-type tmp-code-scope symbol?) ; this must NOT be symbolic
                                    (cond
                                        [(equal? 'constructor tmp-code-scope) constructor-function-book]
                                        [(equal? 'dispatcher tmp-code-scope) dispatcher-function-book]
                                        [else (println-and-exit (format "# [exception] unsupported code-scope, got: ~a." tmp-code-scope))]
                                    )
                                )
                            )
                            (check-type target-function-book hash?)

                            (define target-function-name
                                (let ([tmp-id (yul:funcall-id arg-node)])
                                    (cond
                                        [(decomposible? tmp-id)
                                            (for/all ([d0 tmp-id #:exhaustive])
                                                (check-type d0 yul:id?)
                                                (yul:id-res d0)
                                            )
                                        ]
                                        [else
                                            (check-type tmp-id yul:id?)
                                            (yul:id-res tmp-id)
                                        ]
                                    )
                                )
                            )
                            (check-type target-function-name string? union?)

                            ; (printf "# [debug] target-function-name is: ~a\n" target-function-name)

                            (define tmp-ret
                                (cond
                                    [(decomposible? target-function-name)
                                        (for/all ([d0 target-function-name #:exhaustive])
                                            (check-type d0 string?)
                                            (process-target-function-call target-function-book d0 arg-node arg-rstack arg-param)
                                        )
                                    ]
                                    [else
                                        (check-type target-function-name string?)
                                        (process-target-function-call target-function-book target-function-name arg-node arg-rstack arg-param)
                                    ]
                                )
                            )
                            (check-type tmp-ret ret? union?)
                            ; return
                            tmp-ret
                        ] ; ==== end: normal arg-param ====
                    ) ; ==== end: lift arg-param ====
                ] ; ==== end: normal arg-node ====
            ) ; ==== end: lift arg-node ====
        )
        ; calling a user defined function
        ; (note) this won't check the function name matching between the def-node and call-node, it assumes that they are matched already
        (define/public (do-user-call arg-def-node arg-call-node #:arg-rstack [arg-rstack (list)] #:arg-param [arg-param (default-param)])
            ; (note) all arguments are concrete based on lifting principles, 
            ;        except for arg-param which may contain symbolic callpack
            (check-type arg-def-node yul:fundef?)
            (check-type arg-call-node yul:funcall?)

            ; first do the arity checking
            (define def-arg-ids (yul:fundef-args arg-def-node))
            (check-type def-arg-ids list? union?)
            (define def-ret-ids (yul:fundef-rets arg-def-node))
            (check-type def-ret-ids list? union?)

            (define call-arg-exprs (yul:funcall-expressions arg-call-node))
            (check-type call-arg-exprs list? union?)
            
            ; arity checking
            (cond
                [(decomposible? call-arg-exprs)
                    (cond
                        [(decomposible? def-arg-ids)
                            (for*/all ([d0 call-arg-exprs #:exhaustive] [d1 def-arg-ids #:exhaustive])
                                (check-type d0 list?)
                                (check-type d1 list?)
                                (process-user-call-check d1 d0)
                            )
                        ]
                        [else
                            (check-type def-arg-ids list?)
                            (for/all ([d0 call-arg-exprs #:exhaustive])
                                (check-type d0 list?)
                                (process-user-call-check def-arg-ids d0)
                            )
                        ]
                    )
                ]
                [else
                    (check-type call-arg-exprs list?)
                    (cond
                        [(decomposible? def-arg-ids)
                            (for/all ([d1 def-arg-ids #:exhaustive])
                                (check-type d1 list?)
                                (process-user-call-check d1 call-arg-exprs)
                            )
                        ]
                        [else
                            (check-type def-arg-ids list?)
                            (process-user-call-check def-arg-ids call-arg-exprs)
                        ]
                    )
                ]
            )

            ; then evaluate the call args to get the final value first
            (define call-arg-rets
                (cond
                    [(decomposible? call-arg-exprs)
                        (for/all ([d0 call-arg-exprs #:exhaustive])
                            (check-type d0 list?)
                            (for/list ([p d0])
                                (interpret p #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))
                            )
                        )
                    ]
                    [else
                        (check-type call-arg-exprs list?)
                        (for/list ([p call-arg-exprs])
                            (interpret p #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))
                        )
                    ]
                )
            )
            (check-type call-arg-rets list? union?)

            (define call-arg-values (call-args-extraction call-arg-rets))
            (check-type call-arg-values list? union?)

            ; then initialize the function scope and map the call args values onto it (binding to def-arg-ids)
            (define local-register (make-register))

            ; install arguments
            (cond
                [(decomposible? def-arg-ids)
                    (cond
                        [(decomposible? call-arg-values)
                            (for*/all ([d1 def-arg-ids] [d0 call-arg-values])
                                (check-type d1 list?)
                                (check-type d0 list?)
                                (for ([xid d1] [v d0])
                                    (call-install-args local-register xid v)
                                )
                            )
                        ]
                        [else
                            (check-type call-arg-values list?)
                            (for/all ([d1 def-arg-ids #:exhaustive])
                                (check-type d1 list?)
                                (for ([xid d1] [v call-arg-values])
                                    (call-install-args local-register xid v)
                                )
                            )
                        ]
                    )
                ]
                [else
                    (cond
                        [(decomposible? call-arg-values)
                            (for/all ([d0 call-arg-values #:exhaustive])
                                (check-type d0 list?)
                                (for ([xid def-arg-ids] [v d0])
                                    (call-install-args local-register xid v)
                                )
                            )
                        ]
                        [else
                            (check-type def-arg-ids list?)
                            (check-type call-arg-values list?)
                            ; (note)(fixme) how do we combine two symbolic elements? maybe this already is working?
                            (for ([xid def-arg-ids] [v call-arg-values])
                                (call-install-args local-register xid v)
                            )
                        ]
                    )
                ]
            )

            ; install return variables
            (cond
                [(decomposible? def-ret-ids)
                    (for/all ([d0 def-ret-ids #:exhaustive])
                        (check-type d0 list?)
                        (for ([xid d0])
                            (call-install-rets local-register xid)
                        )
                    )
                ]
                [else
                    (check-type def-ret-ids list?)
                    (for ([xid def-ret-ids])
                        (call-install-rets local-register xid)
                    )
                ]
            )

            ; then you can finally call this function by interpreting the block with preset scope
            (define def-block-node (yul:fundef-block arg-def-node))
            (check-type def-block-node yul:block? union?)

            ; (important) the scope here is created and managed from the function definition level, so a block need NOT create any new scope
            (define block-ret 
                (cond
                    [(decomposible? def-block-node)
                        (for/all ([d0 def-block-node #:exhaustive])
                            (check-type d0 yul:block?)
                            (interpret def-block-node 
                                #:arg-rstack (cons local-register arg-rstack) 
                                #:arg-param (copy-param arg-param #:new-block-scope #f)
                            )
                        )
                    ]
                    [else
                        (check-type def-block-node yul:block?)
                        (interpret def-block-node 
                            #:arg-rstack (cons local-register arg-rstack) 
                            #:arg-param (copy-param arg-param #:new-block-scope #f)
                        )
                    ]
                )
            )
            (check-type block-ret ret? union?)

            ; (note)(important)(fixme) the Yul syntax doesn't have an explicit return in a function block 
            ;                          (there's one in EVM dialect but that one ends EXECUTION and return, which will directly return to the top level(?)),
            ;                          so here we need to actively return if the return list is not empty
            ; - (note) the ret-mode is inherited from block-ret
            (define tmp-ret
                (for*/all ([d0 def-ret-ids #:exhaustive] [d1 block-ret #:exhaustive])
                    (check-type d0 list?)
                    (check-type d1 ret?)
                    (if (null? d0)
                        ; nothing to return
                        (ret (ret-mode d1) (void))
                        ; something to return, grab all of them from the local register
                        (ret (ret-mode d1) (for/list ([xid d0]) 
                            (for/all ([d2 xid #:exhaustive])
                                (check-type d2 yul:tid? yul:id?)
                                (call-read-rets local-register d2)
                            )
                        ))
                    )
                )
            )
            (check-type tmp-ret ret? union?)

            ; return
            tmp-ret
        )
        ; calling a builtin function
        (define/public (do-builtin-call arg-function arg-call-node #:arg-rstack [arg-rstack (list)] #:arg-param [arg-param (default-param)])
            ; (note) all arguments are concrete based on lifting principles, 
            ;        except for arg-param which may contain symbolic callpack
            (check-type arg-function procedure?) ; yes lambda is procedure typed
            (check-type arg-call-node yul:funcall?)

            (define call-arg-exprs (yul:funcall-expressions arg-call-node)) ; these are expressions and needs to be evaluated first
            (check-type call-arg-exprs list? union?)

            ; arity checking
            (cond
                [(decomposible? call-arg-exprs)
                    (for/all ([dexprs call-arg-exprs #:exhaustive])
                        (check-type dexprs list?)
                        (process-builtin-call-check arg-function dexprs)
                    )
                ]
                [else
                    (check-type call-arg-exprs list?)
                    (process-builtin-call-check arg-function call-arg-exprs)
                ]
            )

            ; then evaluate the call args to get the final value
            (define call-arg-rets
                (cond
                    [(decomposible? call-arg-exprs)
                        (for/all ([d0 call-arg-exprs #:exhaustive])
                            (check-type d0 list?)
                            (for/list ([p d0])
                                (interpret p #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))
                            )
                        )
                    ]
                    [else
                        (check-type call-arg-exprs list?)
                        (for/list ([p call-arg-exprs])
                            (interpret p #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))
                        )
                    ]
                )
            )
            (check-type call-arg-exprs list? union?)

            (define call-arg-values (call-args-extraction call-arg-rets))
            (check-type call-arg-values list? union?)

            ; then directly evaluate the function
            ; (note) attach the callpack because some builtin function needs to read the callpack info, e.g., `calldata*` series
            (define tmp-ret (apply arg-function (cons (param-callpack arg-param) call-arg-values)))
            (check-type tmp-ret ret? union?)

            ; return
            tmp-ret
        )

        ; helper function for do-user-call and do-builtin-call
        (define (call-args-extraction arg-rets)
            ; arg-rets is call-arg-rets

            ; extract the 1st element from a list
            ; this also checks that the list only contains 1 element
            (define (check-and-extract arg-values)
                (check-type arg-values list? union?)
                (cond
                    [(decomposible? arg-values)
                        (for/all ([d0 arg-values #:exhaustive])
                            (check-type d0 list?)
                            (check-and-extract d0)
                        )
                    ]
                    [else
                        (check-type arg-values list?)
                        (when (not (equal? 1 (length arg-values))) (println-and-exit "# [exception]: every call argument should evaluate to only 1 value."))
                        (list-ref arg-values 0)
                    ]
                )
            )

            (check-type arg-rets list? union?)
            (define call-arg-values
                (cond
                    [(decomposible? arg-rets)
                        (for/all ([d1 arg-rets #:exhaustive])
                            (check-type d1 list?)
                            (for/list ([p d1])
                                (cond
                                    [(decomposible? p)
                                        (for/all ([d0 p #:exhaustive])
                                            (check-type d0 ret?)
                                            (let ([vs (ret-values p)])
                                                (check-type vs list? union?)
                                                (check-and-extract vs)
                                            )
                                        )
                                    ]
                                    [else
                                        (check-type p ret?)
                                        (let ([vs (ret-values p)])
                                            (check-type vs list? union?)
                                            (check-and-extract vs)
                                        )
                                    ]
                                )
                            )
                        )
                    ]
                    [else
                        (check-type arg-rets list?)
                        (for/list ([p arg-rets])
                            (cond
                                [(decomposible? p)
                                    (for/all ([d0 p #:exhaustive])
                                        (check-type d0 ret?)
                                        (let ([vs (ret-values p)])
                                            (check-type vs list? union?)
                                            (check-and-extract vs)
                                        )
                                    )
                                ]
                                [else
                                    (check-type p ret?)
                                    (let ([vs (ret-values p)])
                                        (check-type vs list? union?)
                                        (check-and-extract vs)
                                    )
                                ]
                            )
                        )
                    ]
                )
            )
            (check-type call-arg-values list? union?)

            call-arg-values
        )

        ; helper function for do-user-call
        (define (call-install-args local-register xid v)
            (cond
                [(decomposible? xid)
                    (cond
                        [(decomposible? v)
                            (for*/all ([xid0 xid #:exhaustive] [v0 v #:exhaustive])
                                ; check-type v0 anything
                                (check-type xid0 yul:tid? yul:id?)
                                (call-install-args local-register xid0 v0)
                            )
                        ]
                        [else
                            ; check-type v anything
                            (for/all ([xid0 xid #:exhaustive])
                                (check-type xid0 yul:tid? yul:id?)
                                (call-install-args local-register xid0 v)
                            )
                        ]
                    )
                ]
                [else
                    (check-type xid yul:tid? yul:id?)
                    (cond
                        [(decomposible? v)
                            (for/all ([v0 v #:exhaustive])
                                ; check-type v0 anything
                                (call-install-args local-register xid v0)
                            )
                        ]
                        [else
                            ; check-type v anything
                            ; since rstack-make-var operates on stack, you need to wrap the local register into a list as a fake stack
                            (destruct xid
                                ; xid could be yul:id or yul:tid
                                [(yul:id id)
                                    (check-type id string? union?)
                                    (cond
                                        [(decomposible? id)
                                            (for/all ([id0 id #:exhaustive])
                                                (check-type id0 string?)
                                                (rstack-make-var (list local-register) id0 #:arg-val v)
                                            )
                                        ]
                                        [else
                                            (check-type id string?)
                                            (rstack-make-var (list local-register) id #:arg-val v)
                                        ]
                                    )
                                ]
                                [(yul:tid id type)
                                    (check-type id string? union?)
                                    (cond
                                        [(decomposible? id)
                                            (for/all ([id0 id #:exhaustive])
                                                (check-type id0 string?)
                                                (rstack-make-var (list local-register) id0 #:arg-val v)
                                            )
                                        ]
                                        [else
                                            (check-type id string?)
                                            (rstack-make-var (list local-register) id #:arg-val v)
                                        ]
                                    )
                                ]
                                [_ (println-and-exit (format "# [exception]: args could only be yul:id or yul:tid, got: ~a." (struct-type xid)))]
                            )
                        ]
                    )
                ]
            )
        )

        ; helper function for do-user-call
        (define (call-install-rets local-register xid)
            (cond
                [(decomposible? xid)
                    (for/all ([xid0 xid #:exhaustive])
                        (check-type xid0 yul:tid? yul:id?)
                        (call-install-rets local-register xid0)
                    )
                ]
                [else
                    (check-type xid yul:tid? yul:id?)
                    (destruct xid
                        ; xid could be yul:id or yul:tid
                        [(yul:id id)
                            (check-type id string? union?)
                            (cond
                                [(decomposible? id)
                                    (for/all ([id0 id #:exhaustive])
                                        (check-type id0 string?)
                                        (rstack-make-var (list local-register) id0) ; use default value
                                    )
                                ]
                                [else
                                    (check-type id string?)
                                    (rstack-make-var (list local-register) id) ; use default value
                                ]
                            )
                        ]
                        [(yul:tid id type)
                            (check-type id string? union?)
                            (cond
                                [(decomposible? id)
                                    (for/all ([id0 id #:exhaustive])
                                        (check-type id0 string?)
                                        (rstack-make-var (list local-register) id0) ; use default value
                                    )
                                ]
                                [else
                                    (check-type id string?)
                                    (rstack-make-var (list local-register) id) ; use default value
                                ]
                            )
                        ]
                        [_ (println-and-exit (format "# [exception]: rets could only be yul:id or yul:tid, got: ~a." (struct-type xid)))]
                    )
                ]
            )
        )

        ; helper function for do-user-call
        (define (call-read-rets local-register xid)
            (cond
                [(decomposible? xid)
                    (for/all ([xid0 xid #:exhaustive])
                        (check-type xid0 yul:tid? yul:id?)
                        (call-install-rets local-register xid0)
                    )
                ]
                [else
                    (check-type xid yul:tid? yul:id?)
                    (destruct xid
                        ; xid could be yul:id or yul:tid
                        [(yul:id id)
                            (check-type id string? union?)
                            (cond
                                [(decomposible? id)
                                    (for/all ([id0 id #:exhaustive])
                                        (check-type id0 string?)
                                        (rstack-read-var (list local-register) id0)
                                    )
                                ]
                                [else
                                    (check-type id string?)
                                    (rstack-read-var (list local-register) id)
                                ]
                            )
                        ]
                        [(yul:tid id type)
                            (check-type id string? union?)
                            (cond
                                [(decomposible? id)
                                    (for/all ([id0 id #:exhaustive])
                                        (check-type id0 string?)
                                        (rstack-read-var (list local-register) id0)
                                    )
                                ]
                                [else
                                    (check-type id string?)
                                    (rstack-read-var (list local-register) id)
                                ]
                            )
                        ]
                        [_ (println-and-exit (format "# [exception]: rets could only be yul:id or yul:tid, got: ~a." (struct-type xid)))]
                    )
                ]
            )
        )

        ; ========== interpreter process series: start ========== ;
        ; these are helper functions for easy/neat symbolic executions
        ; (note) the process series doesn't need to check argument types
        ; (note) the process series doesn't need to lift anything

        ; (note) this one is for `do-user-call` procedure
        (define (process-user-call-check arg-ids arg-exprs)
            ; arity checking
            (when (not (equal? (length arg-ids) (length arg-exprs))) (println-and-exit "# [exception]: arity mismatch for user function calls."))
        )

        ; (note) this one is for `do-builtin-call` procedure
        (define (process-builtin-call-check arg-function arg-exprs)
            ; arity checking
            ; +1 for passing additional callpack argument for every builtin function
            (when (not (equal? (procedure-arity arg-function) (+ 1 (length arg-exprs)))) (println-and-exit "# [exception]: arity mismatch for builtin function calls."))
        )

        ; (note) this one is for `call` procedure
        (define (process-target-function-call target-function-book target-function-name arg-node arg-rstack arg-param)
            (cond 
                ; it's a user defined function
                [(hash-has-key? target-function-book target-function-name) 
                    (define target-def-node (hash-ref target-function-book target-function-name))
                    ; (do-user-call target-def-node arg-node #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))
                    (define tmp-ret (do-user-call target-def-node arg-node #:arg-rstack arg-rstack #:arg-param (copy-param arg-param)))
                    ; (printf "# [debug] ~a returns: ~a\n" target-function-name tmp-ret)
                    tmp-ret
                ]
                ; it's a builtin function
                [(hash-has-key? yul-builtin-function-book target-function-name)
                    (define target-function (hash-ref yul-builtin-function-book target-function-name))
                    ; (do-builtin-call target-function arg-node #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))
                    (define tmp-ret (do-builtin-call target-function arg-node #:arg-rstack arg-rstack #:arg-param (copy-param arg-param)))
                    ; (printf "# [debug] ~a returns: ~a\n" target-function-name tmp-ret)
                    tmp-ret
                ]
                ; it's not found anywhere available, terminate
                [else (println-and-exit (format "# [exception]: can't find the target function, got: ~a." target-function-name))]
            )
        )

        ; execute statement and return a pair of (new) ret and mode
        (define (process-execute-block-statement arg-statement arg-local-register arg-curr-ret arg-rstack arg-param)
            (let ([arg-curr-mode (ret-mode arg-curr-ret)])
                (cond
                    [(equal? 'normal arg-curr-mode) 
                        (define tmp-curr-ret (if (param-new-block-scope arg-param)
                            (do-interpret arg-statement #:arg-rstack (cons arg-local-register arg-rstack) #:arg-param (copy-param arg-param)) ; standalone block, create a new scope
                            (do-interpret arg-statement #:arg-rstack arg-rstack #:arg-param (copy-param arg-param)) ; attached block, scope is managed by upper level, usually for function definition and loop
                        ))
                        (check-type tmp-curr-ret ret? union?)
                        (check-type (ret-mode tmp-curr-ret) symbol? union?)
                        tmp-curr-ret
                    ] ; normal, just move and execute the next iteration
                    [(equal? 'continue arg-curr-mode) arg-curr-ret] ; do nothing, keep the return mode
                    [(equal? 'break arg-curr-mode) arg-curr-ret] ; do nothing, keep the return mode
                    [(equal? 'leave arg-curr-mode) arg-curr-ret] ; do nothing, keep the return mode
                    [(equal? 'return arg-curr-mode) arg-curr-ret] ; do nothing, keep the return mode
                    [(equal? 'revert arg-curr-mode) arg-curr-ret] ; do nothing, keep the return mode
                    ; this usually means there are some implementation errors
                    [else (println-and-exit (format "# [exception]: unknown return mode, got: ~v." arg-curr-mode))]
                )
            )
        )

        ; extract a yul:id list into a plain id list
        (define (process-extract-ids arg-ids)
            (for/list ([p arg-ids])
                (check-type p yul:id?)
                (yul:id-res p)
            )
        )

        ; write a list of values into corresponding slots of ids in stack
        (define (process-write-values-to-ids arg-vals arg-ids arg-rstack)
            ; make sure length of ids matches length of values
            (when (not (equal? (length arg-ids) (length arg-vals))) (println-and-exit "# [exception]: arity mismatch in assignment."))
            ; assign each value to its corresponding id
            (for ([i (range (length arg-ids))])
                (define i-id (list-ref arg-ids i))
                (define i-val (list-ref arg-vals i))
                (rstack-write-var arg-rstack i-id i-val)
            )
        )

        ; write a list of values into corresponding slots of ids in stack
        (define (process-make-values-to-ids arg-vals arg-ids arg-rstack)
            ; make sure length of ids matches length of values
            (when (not (equal? (length arg-ids) (length arg-vals))) (println-and-exit "# [exception]: arity mismatch in assignment."))
            ; assign each value to its corresponding id
            (for ([i (range (length arg-ids))])
                (define i-id (list-ref arg-ids i))
                (define i-val (list-ref arg-vals i))
                (rstack-make-var arg-rstack i-id #:arg-val i-val)
            )
        )

        (define (process-execute-if arg-values arg-block arg-rstack arg-param)
            ; make sure the expression only returns 1 value
            (when (not (equal? 1 (length arg-values))) (println-and-exit "# [exception]: arity mismatch in if condition, should be 1."))

            ; (note)(important) need to convert the condition to actual bool so that `if` can correctly pick up the branch condition
            (if (bitvector->bool (car arg-values))
                ; true, go
                (do-interpret arg-block #:arg-rstack arg-rstack #:arg-param (copy-param arg-param)) ; deligate to block interpretation
                ; (note) there's no else in Yul
                (ret 'normal (void))
            )
        )

        (define (process-execute-switch-check arg-values)
            ; make sure the expression only returns 1 value
            (when (not (equal? 1 (length arg-values))) (println-and-exit "# [exception]: arity mismatch in switch condition, should be 1."))
        )

        ; (fixme) this procedure needs lifting
        (define (process-execute-switch arg-values arg-cases arg-default arg-rstack arg-param)
            (let ([v (car arg-values)] [hit #f] [curr-ret (ret 'normal (void))])
                (for ([c0 (rcons arg-default arg-cases)])
                    (when (not hit)
                        (cond 
                            [(yul:case? c0)
                                ; case
                                (begin
                                    (define lret (do-interpret (yul:case-literal c0) #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))) ; literal ret value
                                    ; (fixme) not checking arity here, assume it would be fine
                                    (when (equal? v (car (ret-values lret)))
                                        ; hit
                                        (set! hit #t)
                                        (set! curr-ret (do-interpret (yul:case-block c0) #:arg-rstack arg-rstack #:arg-param (copy-param arg-param)))
                                    )
                                )
                            ]
                            [(yul:default? c0)
                                ; hit
                                (set! hit #t)
                                (set! curr-ret (do-interpret (yul:default-block c0) #:arg-rstack arg-rstack #:arg-param (copy-param arg-param)))
                            ]
                            [else (println-and-exit (format "# [exeption]: unknown switch branch, got: ~a." c0))]
                        )
                    )
                )
                ; return normally
                curr-ret
            )
        )

        ; ========== interpreter process series: end ========== ;

        ; - arg-rstack: stack of local registers, with priority (first higher), pass on by (cons new old-list)
        ;               local variables will be stored and tracked, a single register is a fully functional zhash
        ;               see more details for scoping rules: https://docs.soliditylang.org/en/v0.8.11/yul.html#scoping-rules
        (define/public (interpret arg-node #:arg-rstack [arg-rstack (list)] #:arg-param [arg-param (default-param)])
            (do-interpret arg-node #:arg-rstack arg-rstack #:arg-param arg-param) ; (note) param here is direct shadowing, not copy-param
        )
        (define/public (do-interpret arg-node #:arg-rstack [arg-rstack (list)] #:arg-param [arg-param (default-param)])
            ; (printf "# [debug] interpreting ~a\n" (struct-type arg-node))
            (cond ; ==== start: lift arg-node ====
                [(decomposible? arg-node) ; ==== start: decompose arg-node ====
                    (for/all ([dnode arg-node #:exhaustive]) (do-interpret dnode #:arg-rstack arg-rstack #:arg-param arg-param))
                ] ; ==== end: decompose arg-node ====
                [else ; ==== start: normal arg-node ====
                    (match arg-node ; ==== start: match arg-node ====

                        [(yul:block m-statements)
                            ; a yul_block creates a new scope
                            (check-type m-statements list? union?)
                            (let* ([local-register (make-register)] [curr-ret (ret 'normal (void))])
                                (cond ; ==== start: lift m-statements ====
                                    [(decomposible? m-statements) ; ==== start: decompose m-statements ====
                                        (for/all ([d0 m-statements #:exhaustive])
                                            (check-type d0 list?)
                                            (for ([m d0])
                                                (check-type m yul:statement? union?)
                                                (cond ; ==== start: lift m ====
                                                    [(decomposible? m) ; ==== start: decompose m ====
                                                        (for/all ([d1 m #:exhaustive])
                                                            (check-type d1 yul:statement?)
                                                            (let ([curr-mode (ret-mode curr-ret)] [curr-values (ret-values curr-ret)])
                                                                (check-type curr-mode symbol? union?)
                                                                (check-type curr-values void? list? union?)
                                                                (cond ; ==== start: lift curr-mode ====
                                                                    [(decomposible? curr-mode) ; ==== start: decompose curr-mode ====
                                                                        (for/all ([d2 curr-mode #:exhaustive])
                                                                            (check-type d2 symbol?)
                                                                            ; construct a ret instance
                                                                            (set! curr-ret (process-execute-block-statement d1 local-register (ret d2 curr-values) arg-rstack arg-param))
                                                                        )
                                                                    ] ; ==== end: decompose curr-mode ====
                                                                    [else ; ==== start: normal curr-mode ====
                                                                        (check-type curr-mode symbol?)
                                                                        (set! curr-ret (process-execute-block-statement d1 local-register curr-ret arg-rstack arg-param))
                                                                    ] ; ==== end: normal curr-mode ====
                                                                ) ; ==== end: lift curr-mode ====
                                                            )
                                                        )
                                                    ] ; ==== end: decompose m ====
                                                    [else ; ==== start: normal m ====
                                                        (check-type m yul:statement?)
                                                        (let ([curr-mode (ret-mode curr-ret)] [curr-values (ret-values curr-ret)])
                                                            (check-type curr-mode symbol? union?)
                                                            (check-type curr-values void? list? union?)
                                                            (cond ; ==== start: lift curr-mode ====
                                                                [(decomposible? curr-mode) ; ==== start: decompose curr-mode ====
                                                                    (for/all ([d2 curr-mode #:exhaustive])
                                                                        (check-type d2 symbol?)
                                                                        ; construct a ret instance
                                                                        (set! curr-ret (process-execute-block-statement m local-register (ret d2 curr-values) arg-rstack arg-param))
                                                                    )
                                                                ] ; ==== end: decompose curr-mode ====
                                                                [else ; ==== start: normal curr-mode ====
                                                                    (check-type curr-mode symbol?)
                                                                    (set! curr-ret (process-execute-block-statement m local-register curr-ret arg-rstack arg-param))
                                                                ] ; ==== end: normal curr-mode ====
                                                            ) ; ==== end: lift curr-mode ====
                                                        )
                                                    ]; ==== end: normal m ====
                                                ) ; ==== end: lift m ====
                                            )
                                        )
                                    ] ; ==== end: decompose m-statements ====
                                    [else ; ==== start: normal m-statements ====
                                        (check-type m-statements list?)
                                        (for ([m m-statements])
                                            (check-type m yul:statement? union?)
                                            (cond  ; ==== start: lift m ====
                                                [(decomposible? m) ; ==== start: decompose m ====
                                                    (for/all ([d1 m #:exhaustive])
                                                        (check-type d1 yul:statement?)
                                                        (let ([curr-mode (ret-mode curr-ret)] [curr-values (ret-values curr-ret)])
                                                            (check-type curr-mode symbol? union?)
                                                            (check-type curr-values void? list? union?)
                                                            (cond  ; ==== start: lift curr-mode ====
                                                                [(decomposible? curr-mode) ; ==== start: decompose curr-mode ====
                                                                    (for/all ([d2 curr-mode #:exhaustive])
                                                                        (check-type d2 symbol?)
                                                                        ; construct a ret instance
                                                                        (set! curr-ret (process-execute-block-statement d1 local-register (ret d2 curr-values) arg-rstack arg-param))
                                                                    )
                                                                ] ; ==== end: decompose curr-mode ====
                                                                [else ; ==== start: normal curr-mode ====
                                                                    (check-type curr-mode symbol?)
                                                                    (set! curr-ret (process-execute-block-statement d1 local-register curr-ret arg-rstack arg-param))
                                                                ] ; ==== end: normal curr-mode ====
                                                            ) ; ==== end: lift curr-mode ====
                                                        )
                                                    )
                                                ] ; ==== end: decompose m ====
                                                [else ; ==== start: normal m ====
                                                    (check-type m yul:statement?)
                                                    (let ([curr-mode (ret-mode curr-ret)] [curr-values (ret-values curr-ret)])
                                                        (check-type curr-mode symbol? union?)
                                                        (check-type curr-values void? list? union?)
                                                        (cond ; ==== start: lift curr-mode ====
                                                            [(decomposible? curr-mode) ; ==== start: decompose curr-mode ====
                                                                (for/all ([d2 curr-mode #:exhaustive])
                                                                    (check-type d2 symbol?)
                                                                    ; construct a ret instance
                                                                    (set! curr-ret (process-execute-block-statement m local-register (ret d2 curr-values) arg-rstack arg-param))
                                                                )
                                                            ] ; ==== end : decompose curr-mode ====
                                                            [else ; ==== start: normal curr-mode ====
                                                                (check-type curr-mode symbol?)
                                                                (set! curr-ret (process-execute-block-statement m local-register curr-ret arg-rstack arg-param))
                                                            ] ; ==== end: normal curr-mode ====
                                                        ) ; ==== end: lift curr-mode ====
                                                    )
                                                ] ; ==== end: normal m ====
                                            ) ; ==== end: lift m ====
                                        )
                                    ] ; ==== end: normal m-statements ====
                                ) ; ==== end: lift m-statements ====
                                ; return
                                (check-type curr-ret ret? union?)
                                curr-ret
                            )
                        ]

                        [(yul:assignment m-ids m-expression)
                            (check-type m-ids list? union?)
                            (check-type m-expression yul:expression? union?)

                            (define r-expression (do-interpret m-expression #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))) ; RHS of assignment, a ret object
                            (check-type r-expression ret? union?)

                            (define r-values
                                (cond
                                    [(decomposible? r-expression)
                                        (for/all ([d0 r-expression #:exhaustive])
                                            (check-type d0 ret?)
                                            (ret-values d0)
                                        )
                                    ]
                                    [else
                                        (check-type r-expression ret?)
                                        (ret-values r-expression)
                                    ]
                                )
                            )
                            (check-type r-values list? union?)

                            ; LHS of assignment, a list of ids 
                            ; (this can only be id, not tid, according to grammar)
                            (define ids
                                (cond 
                                    [(decomposible? m-ids)
                                        (for/all ([d0 m-ids #:exhaustive])
                                            (check-type d0 list?)
                                            (process-extract-ids d0)
                                        )
                                    ]
                                    [else
                                        (check-type m-ids list?)
                                        (process-extract-ids m-ids)
                                    ]
                                    
                                )
                            )
                            (check-type ids list? union?)

                            (cond 
                                [(decomposible? r-values)
                                    (cond 
                                        [(decomposible? ids)
                                            (for*/all ([d0 r-values #:exhaustive] [d1 ids #:exhaustive])
                                                (check-type d0 list?)
                                                (check-type d1 list?)
                                                (process-write-values-to-ids d0 d1 arg-rstack)
                                            )
                                        ]
                                        [else
                                            (for/all ([d0 r-values #:exhaustive])
                                                (check-type d0 list?)
                                                (check-type ids list?)
                                                (process-write-values-to-ids d0 ids arg-rstack)
                                            )
                                        ]
                                    )
                                ]
                                [else
                                    (cond 
                                        [(decomposible? ids)
                                            (for/all ([d1 ids #:exhaustive])
                                                (check-type r-values list?)
                                                (check-type d1 list?)
                                                (process-write-values-to-ids r-values d1 arg-rstack)
                                            )
                                        ]
                                        [else
                                            (check-type r-values list?)
                                            (check-type ids list?)
                                            (process-write-values-to-ids r-values ids arg-rstack)
                                        ]
                                    )
                                ]
                            )

                            ; return normally
                            (ret 'normal (void))
                        ]

                        [(yul:funcall m-id m-expressions)
                            ; transfer executionship to call for auto pilot
                            (check-type m-id yul:id? union?)
                            (check-type m-expressions list? union?)
                            (call arg-node #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))
                        ]

                        [(yul:if m-expression m-block)
                            (check-type m-expression yul:expression? union?)
                            (check-type m-block yul:block? union?)

                            (define r-expression (do-interpret m-expression #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))) ; RHS of assignment, a ret object
                            (check-type r-expression ret? union?)

                            (define r-values
                                (cond 
                                    [(decomposible? r-expression)
                                        (for/all ([d0 r-expression #:exhaustive])
                                            (check-type d0 ret?)
                                            (ret-values d0)
                                        )
                                    ]
                                    [else
                                        (check-type r-expression ret?)
                                        (ret-values r-expression)
                                    ]
                                )
                            )
                            (check-type r-values list? union?)

                            (define tmp-ret
                                (cond 
                                    [(decomposible? r-values)
                                        (for/all ([d0 r-values #:exhaustive])
                                            (check-type d0 list?)
                                            (process-execute-if d0 m-block arg-rstack arg-param)
                                        )
                                    ]
                                    [else
                                        (check-type r-values list?)
                                        (process-execute-if r-values m-block arg-rstack arg-param)
                                    ]
                                )
                            )
                            (check-type tmp-ret ret? union?)
                            
                            ; return
                            tmp-ret
                        ]

                        [(yul:switch m-expression m-cases m-default)
                            (check-type m-expression yul:expression? union?)
                            (check-type m-cases list? union?)
                            (check-type m-default yul:default? union?)

                            (define r-expression (do-interpret m-expression #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))) ; switch condition, a ret object
                            (check-type r-expression ret? union?)

                            (define r-values
                                (cond 
                                    [(decomposible? r-expression)
                                        (for/all ([d0 r-expression #:exhaustive])
                                            (check-type d0 ret?)
                                            (ret-values d0)
                                        )
                                    ]
                                    [else
                                        (check-type r-expression ret?)
                                        (ret-values r-expression)
                                    ]
                                )
                            )

                            (cond 
                                [(decomposible? r-values)
                                    (for/all ([d0 r-values #:exhaustive])
                                        (check-type d0 list?)
                                        (process-execute-switch-check d0)
                                    )
                                ]
                                [else
                                    (check-type r-values list?)
                                    (process-execute-switch-check r-values)
                                ]
                            )

                            (define tmp-ret
                                (cond 
                                    [(decomposible? r-values)
                                        (cond 
                                            [(decomposible? m-cases)
                                                (for*/all ([d0 r-values #:exhaustive] [d1 m-cases #:exhaustive])
                                                    (check-type d0 list?)
                                                    (check-type d1 list?)
                                                    (process-execute-switch d0 d1 m-default arg-rstack arg-param)
                                                )
                                            ]
                                            [else
                                                (for/all ([d0 r-values #:exhaustive])
                                                    (check-type d0 list?)
                                                    (check-type m-cases list?)
                                                    (process-execute-switch d0 m-cases m-default arg-rstack arg-param)
                                                )
                                            ]
                                        )
                                    ]
                                    [else
                                        (cond 
                                            [(decomposible? m-cases)
                                                (for/all ([d1 m-cases #:exhaustive])
                                                    (check-type r-values list?)
                                                    (check-type d1 list?)
                                                    (process-execute-switch r-values d1 m-default arg-rstack arg-param)
                                                )
                                            ]
                                            [else
                                                (check-type r-values list?)
                                                (check-type m-cases list?)
                                                (process-execute-switch r-values m-cases m-default arg-rstack arg-param)
                                            ]
                                        )
                                    ]
                                )
                            )
                            (check-type tmp-ret ret? union?)
                            
                            ; return
                            tmp-ret
                        ]

                        ; (todo)
                        [(yul:forloop m-init m-expression m-post m-body)
                            (println-and-exit "# [exception]: forloop is under construction.")
                        ]

                        ; for variable declaration, the expression can be missing, which is different than assignment
                        [(yul:vardec m-ids m-expression)
                            (check-type m-ids list? union?)
                            (check-type m-expression null? yul:expression? union?) ; expression of variable declaration can be null

                            ; LHS of assignment, a list of ids 
                            ; (this can only be id, not tid, according to grammar)
                            (define ids
                                (cond 
                                    [(decomposible? m-ids)
                                        (for/all ([d0 m-ids #:exhaustive])
                                            (check-type d0 list?)
                                            (process-extract-ids d0)
                                        )
                                    ]
                                    [else
                                        (check-type m-ids list?)
                                        (process-extract-ids m-ids)
                                    ]
                                )
                            )
                            (check-type ids list? union?)

                            (define r-expression 
                                (cond 
                                    [(decomposible? m-expression)
                                        (for/all ([d1 m-expression #:exhaustive])
                                            (cond 
                                                [(null? d1)
                                                    ; no expression is provided, return default value(s) of equal arity with ids, as initialized/default value
                                                    (cond 
                                                        [(decomposible? ids)
                                                            (for/all ([d0 ids #:exhaustive])
                                                                (check-type d0 list?)
                                                                (ret 'normal (for/list ([_ (length d0)]) (bv 0 yul-default-bitvector)))
                                                            )
                                                        ]
                                                        [else
                                                            (check-type ids list?)
                                                            (ret 'normal (for/list ([_ (length ids)]) (bv 0 yul-default-bitvector)))
                                                        ]
                                                    )
                                                ]
                                                [else
                                                    (check-type d1 yul:expression?)
                                                    ; has expression, interpret it first
                                                    (do-interpret d1 #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))
                                                ]
                                            )
                                        )
                                    ]
                                    [else
                                        (cond 
                                            [(null? m-expression)
                                                ; no expression is provided, return default value(s) of equal arity with ids, as initialized/default value
                                                (cond 
                                                    [(decomposible? ids)
                                                        (for/all ([d0 ids #:exhaustive])
                                                            (check-type d0 list?)
                                                            (ret 'normal (for/list ([_ (length d0)]) (bv 0 yul-default-bitvector)))
                                                        )
                                                    ]
                                                    [else
                                                        (check-type ids list?)
                                                        (ret 'normal (for/list ([_ (length ids)]) (bv 0 yul-default-bitvector)))
                                                    ]
                                                )
                                            ]
                                            [else
                                                ; has expression, interpret it first
                                                (do-interpret m-expression #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))
                                            ]
                                        )
                                    ]
                                )
                            )
                            (check-type r-expression null? ret? union?) ; expression of variable declaration can be null

                            (define r-values
                                (cond 
                                    [(decomposible? r-expression)
                                        (for/all ([d0 r-expression #:exhaustive])
                                            (check-type d0 ret?)
                                            (ret-values d0)
                                        )
                                    ]
                                    [else
                                        (check-type r-expression ret?)
                                        (ret-values r-expression)
                                    ]
                                )
                            )
                            (check-type r-values list? union?)
                            
                            (cond 
                                [(decomposible? r-values)
                                    (cond 
                                        [(decomposible? ids)
                                            (for*/all ([d0 r-values #:exhaustive] [d1 ids #:exhaustive])
                                                (check-type d0 list?)
                                                (check-type d1 list?)
                                                (process-make-values-to-ids d0 d1 arg-rstack)
                                            )
                                        ]
                                        [else
                                            (for/all ([d0 r-values #:exhaustive])
                                                (check-type d0 list?)
                                                (check-type ids list?)
                                                (process-make-values-to-ids d0 ids arg-rstack)
                                            )
                                        ]
                                    )
                                ]
                                [else
                                    (cond 
                                        [(decomposible? ids)
                                            (for/all ([d1 ids #:exhaustive])
                                                (check-type r-values list?)
                                                (check-type d1 list?)
                                                (process-make-values-to-ids r-values d1 arg-rstack)
                                            )
                                        ]
                                        [else
                                            (check-type r-values list?)
                                            (check-type ids list?)
                                            (process-make-values-to-ids r-values ids arg-rstack)
                                        ]
                                    )
                                ]
                            )

                            ; return normally
                            (ret 'normal (void))
                        ]

                        ; (note) for a yul_identifier that is interpreted by itself here, it's only for reading (RHS)
                        ;        since those in LHS will be intercepted by the parent node already
                        [(yul:id m)
                            (check-type m string? union?)

                            (define v 
                                (cond 
                                    [(decomposible? m)
                                        (for/all ([d0 m #:exhaustive])
                                            (check-type d0 string?)
                                            (rstack-read-var arg-rstack d0)
                                        )
                                    ]
                                    [else
                                        (check-type m string?)
                                        (rstack-read-var arg-rstack m)
                                    ]
                                )
                            )
                            ; check-type: anything

                            ; return normally
                            (ret 'normal (list v))
                        ]

                        ; (note) interpret always starts from yul_code on top, not yul_object
                        [(yul:code m-block) (do-interpret m-block #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))] ; pass on
                        [(yul:statement m) (do-interpret m #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))] ; pass on
                        [(yul:expression m) (do-interpret m #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))] ; pass on
                        [(yul:literal m m-type) (do-interpret m #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))] ; pass on

                        [(yul:number m) 
                            (check-type m number? union?)
                            (cond 
                                [(decomposible? m)
                                    (for/all ([d0 m #:exhaustive])
                                        (check-type d0 number?)
                                        (ret 'normal (list (bv d0 yul-default-bitvector)))
                                    )
                                ]
                                [else
                                    (check-type m number?)
                                    (ret 'normal (list (bv m yul-default-bitvector)))
                                ]
                            )
                        ]

                        [(yul:true m) (ret 'normal (list (bool->bitvector #t yul-default-bitvector)))] ; no need to lift, it's already true
                        [(yul:false m) (ret 'normal (list (bool->bitvector #f yul-default-bitvector)))] ; no need to lift, it's already false
                        [(yul:string m) 
                            (check-type m string? union?)
                            (cond 
                                [(decomposible? m)
                                    (for/all ([d0 m #:exhaustive])
                                        (check-type d0 string?)
                                        (ret 'normal (list d0))
                                    )
                                ]
                                [else
                                    (check-type m string?)
                                    (ret 'normal (list m))
                                ]
                            )
                        ]

                        [(yul:leave m) (ret 'leave (void))] ; no need to lift, it's already 'leave

                        ; (note) yul:case is not a unit for interpretation, it's decomposed in yul:switch interpretation

                        ; you can't interpret a function definition, use call instead
                        ; why? because there are also interpretable codes on the same level as function definitions
                        ; and when calling constructor, we are actually calling the interpret method, which should not "call" the function definition
                        [(yul:fundef m-id m-args m-rets m-block) (println-and-exit (format "# [exception]: you can't interpret a function definition."))]
                        
                        ; otherwise, exit right now for debugging, this is not supposed to appear
                        [_ (println-and-exit (format "# [exception][do-interpret]: unsupported node, got: ~a." (struct-type arg-node)))]
                    ) ; ==== end: match arg-node ====
                ] ; ==== end: normal arg-node ====
            ) ; ==== end: lift arg-node ====
        )

        ; ================================================================== ;
        ; ========== memory/storage/register management utilities ========== ;
        ; ================================================================== ;
        ; overview
        ; - register uses a hash model: a key must be made before read/write, otherwise it doesn't exist at all
        ; - memory and storage use exploration based model: a key will be "discovered" (with default value, i.e., 0) when being read or written
        ;   that is to say, memory and storage units exist at all times, and the zhash only keeps track of those that are involved in the computation

        (define (make-register) (make-zhash config:vm-register-size #:iv zvoid #:ev zvoid))
        ; this add a variable into the registers, with given values if specified, otherwise with default values (bitvector 0)
        ; - arg-registers: a register stack
        ; - this creates variables in the register on top of the stack
        ; - (note)(fixme) for now, if the variable already exists, this will overwrite, but what's the corresponding behavior in Solidity/Yul
        ;                 when you have `let` for two same variables in the same scope?
        (define (rstack-make-var arg-rstack arg-id #:arg-val [arg-val (bv 0 yul-default-bitvector)])
            (when (null? arg-rstack) (println-and-exit "# [exception][rstack-make-var]: arg-rstack is empty."))
            (let ([reg (car arg-rstack)]) ; get the top register of the stack
                (zhash-set! reg arg-id arg-val)
            )
        )
        ; ; this writes the arg-val into a slot specified by arg-id
        ; ; - will check whether arg-id exists or not first
        ; ; - (note) if arg-id doesn't exist, the corresponding path should be terminated
        ; (define (rstack-write-var arg-rstack arg-id arg-val)
        ;     (when (null? arg-rstack) (println-and-exit "# [exception][rstack-write-var]: arg-rstack is empty."))
        ;     (printf "# [debug] writing to id: ~a\n" arg-id)
        ;     (printf "# [debug] zhash-has-key?: ~a\n" (zhash-has-key? (car arg-rstack) arg-id))
        ;     (printf "# [debug] zhash-keys: ~a\n" (zhash-keys (car arg-rstack)))
        ;     (let ([reg (car arg-rstack)]) ; get the top register of the stack
        ;         (if (zhash-has-key? reg arg-id)
        ;             ; has key, proceed
        ;             (zhash-set! reg arg-id arg-val)
        ;             ; no key, it's an error, terminate this path
        ;             (assert #f)
        ;         )
        ;     )
        ; )
        ; this writes the arg-val into a slot specified by arg-id
        ; - will check whether arg-id exists or not first
        ; - (note) if arg-id doesn't exist in the current top register, it will go to the next register, until the end
        (define (rstack-write-var arg-rstack arg-id arg-val)
            (when (null? arg-rstack) (println-and-exit "# [exception][rstack-write-var]: arg-rstack is empty."))
            ; (printf "# [debug] writing to id: ~a\n" arg-id)
            ; (printf "# [debug] zhash-has-key?: ~a\n" (zhash-has-key? (car arg-rstack) arg-id))
            ; (printf "# [debug] zhash-keys: ~a\n" (zhash-keys (car arg-rstack)))
            (let ([reg (car arg-rstack)]
                  [rr (cdr arg-rstack)]) ; get the top register of the stack
                (if (zhash-has-key? reg arg-id)
                    ; has key, proceed
                    (zhash-set! reg arg-id arg-val)
                    ; no key, fall back, but if this is the last, terminate
                    (if (null? rr)
                        ; empty stack already, terminate this path
                        (assert #f)
                        ; there are still registers, go to the next one
                        (rstack-write-var rr arg-id arg-val)
                    )
                )
            )
        )
        ; this reads the arg-id and returns its stored value
        ; - (note) if arg-id is not in the current top register, it will go to the next register, until the end
        ; - if none of the register has the arg-id, the path will be terminated
        (define (rstack-read-var arg-rstack arg-id)
            (when (null? arg-rstack) (println-and-exit "# [exception][rstack-read-var]: arg-rstack is empty."))
            (let ([reg (car arg-rstack)]
                  [rr (cdr arg-rstack)])
                (if (zhash-has-key? reg arg-id)
                    ; has key, read and return
                    (zhash-ref reg arg-id)
                    ; no key, go to the next register if possible
                    (if (null? rr)
                        ; empty stack already, terminate this path
                        (assert #f)
                        ; there are still registers, go to the next one
                        (rstack-read-var rr arg-id)
                    )
                )
            )
        )

        ; ================================================ ;
        ; ========== builtin function utilities ========== ;
        ; ================================================ ;
        ; we assume that every builtin function only has ONE return value
        (define/public (initialize-yul-builtin-function-book)
            (set! yul-builtin-function-book (make-hash))

            (hash-set! yul-builtin-function-book "mstore" (lambda (cp p v) (ret 'normal (list
                (let ([p0 (bitvector->integer p)])
                    (for ([i (range p0 (+ 32 p0))]
                          [j (bitvector-split v 8)])
                        (zhash-set! memory-book i j)
                    )
                    (void) ; returns void
                )
            ))))
            (hash-set! yul-builtin-function-book "mload" (lambda (cp p) (ret 'normal (list
                (let ([p0 (bitvector->integer p)])
                    (apply concat (for/list ([i (range p0 (+ 32 p0))])
                        (zhash-secure-key! memory-book i) ; make sure the key exists
                        (zhash-ref memory-book i)
                    ))
                )
            ))))

            (hash-set! yul-builtin-function-book "sstore" (lambda (cp p v) (ret 'normal (list
                (let ([p0 (bitvector->integer p)])
                    (zhash-set! storage-book p0 v)
                    (void) ; returns void
                )
            ))))
            (hash-set! yul-builtin-function-book "sload" (lambda (cp p) (ret 'normal (list
                (let ([p0 (bitvector->integer p)])
                    (zhash-secure-key! storage-book p0) ; make sure the key exists
                    (zhash-ref storage-book p0)
                )
            ))))


            (hash-set! yul-builtin-function-book "eq" (lambda (cp x y) (ret 'normal (list 
                (bool->bitvector (bveq x y))
            ))))
            (hash-set! yul-builtin-function-book "add" (lambda (cp x y) (ret 'normal (list 
                (bvadd x y)
            ))))
            (hash-set! yul-builtin-function-book "sub" (lambda (cp x y) (ret 'normal (list 
                (bvsub x y)
            ))))
            (hash-set! yul-builtin-function-book "and" (lambda (cp x y) (ret 'normal (list 
                (bvand x y)
            ))))
            (hash-set! yul-builtin-function-book "or" (lambda (cp x y) (ret 'normal (list 
                (bvor x y)
            ))))
            (hash-set! yul-builtin-function-book "not" (lambda (cp x) (ret 'normal (list
                (bvnot x)
            ))))
            ; (note) rosette semantics is a bit different than Yul's
            (hash-set! yul-builtin-function-book "shr" (lambda (cp x y) (ret 'normal (list 
                (bvlshr y x)
            ))))
            ; (note) rosette semantics is a bit different than Yul's
            (hash-set! yul-builtin-function-book "shl" (lambda (cp x y) (ret 'normal (list 
                (bvshl y x)
            ))))


            (hash-set! yul-builtin-function-book "iszero" (lambda (cp x) (ret 'normal (list
                (bool->bitvector (bvzero? x) yul-default-bitvector)
            ))))
            (hash-set! yul-builtin-function-book "lt" (lambda (cp x y) (ret 'normal (list
                (bool->bitvector (bvult x y) yul-default-bitvector)
            ))))
            (hash-set! yul-builtin-function-book "gt" (lambda (cp x y) (ret 'normal (list 
                (bool->bitvector (bvugt x y) yul-default-bitvector)
            ))))
            (hash-set! yul-builtin-function-book "slt" (lambda (cp x y) (ret 'normal (list 
                (bool->bitvector (bvslt x y) yul-default-bitvector)
            ))))


            ; (fixme) needs to return something meaningful, using 0 for the present
            ; see: https://docs.soliditylang.org/en/latest/yul.html#memoryguard
            (hash-set! yul-builtin-function-book "memoryguard" (lambda (cp x) (ret 'normal (list
                (bv 0 yul-default-bitvector)
            ))))
            ; (fixme) need to actually model this
            (hash-set! yul-builtin-function-book "gas" (lambda (cp) (ret 'normal (list
                (bv 0 yul-default-bitvector)
            ))))
            ; (fixme) iszero(extcodesize(expr_142_address)) mainly checks whether there's contract deployed in the target address
            ;         we temporarily set it to 1 for now, but in practice we can implement this by calling the zhash in manager
            (hash-set! yul-builtin-function-book "extcodesize" (lambda (cp a) (ret 'normal (list
                (bv 1 yul-default-bitvector)
            ))))

            ; based on my understanding, this returns a snippet of memory, and the total number of bits could be other than 256-bit based
            (hash-set! yul-builtin-function-book "return" (lambda (cp p s) (ret 'return (list
                (let ([p0 (bitvector->integer p)] [s0 (bitvector->integer s)])
                    (for/list ([i (range p0 (+ s0 p0))])
                        (zhash-secure-key! memory-book i) ; make sure the key exists
                        (zhash-ref memory-book i)
                    )
                )
            ))))

            ; (fixme) here we use sha256 instead of keccak256
            (hash-set! yul-builtin-function-book "keccak256" (lambda (cp p n) (ret 'return (list
                (let ([p0 (bitvector->integer p)] [n0 (bitvector->integer n)])
                    ; first read mem[p...(p+n))
                    (define l0 (for/list ([i (range p0 (+ p0 n0))])
                        (bitvector->integer (zhash-ref memory-book i))
                    ))
                    ; then convert to bytes
                    (define b0 (apply bytes l0))
                    (define k0 (sha256 b0))
                    (define l1 (bytes->list k0))
                    (define r0 (apply concat (for/list ([i l1]) (bv i 8))))
                    r0
                )
            ))))

            (hash-set! yul-builtin-function-book "address" (lambda (cp) (ret 'normal (list
                (bv vm-address yul-default-bitvector)
            ))))
            (hash-set! yul-builtin-function-book "caller" (lambda (cp) (ret 'normal (list
                (bv (callpack-caller cp) yul-default-bitvector)
            ))))
            (hash-set! yul-builtin-function-book "callvalue" (lambda (cp) (ret 'normal (list
                (bv (callpack-wei cp) yul-default-bitvector)
            ))))
            (hash-set! yul-builtin-function-book "calldatasize" (lambda (cp) (ret 'normal (list 
                (bv (length (callpack-calldata cp)) yul-default-bitvector)
            ))))
            (hash-set! yul-builtin-function-book "calldataload" (lambda (cp x) (ret 'normal (list
                (apply concat (take (drop (callpack-calldata cp) (bitvector->integer x)) 32))
            ))))
            (hash-set! yul-builtin-function-book "calldatacopy" (lambda (cp t f s) (ret 'normal (list
                (let ([t0 (bitvector->integer t)] [f0 (bitvector->integer f)] [s0 (bitvector->integer s)] [cd0 (callpack-calldata cp)])
                    (for ([cdaddr (range f0 (+ s0 f0))] [memaddr (range t0 (+ s0 t0))])
                        (zhash-set! memory-book memaddr (list-ref cd0 cdaddr))
                    )
                    (void) ; returns void
                )
            ))))
            (hash-set! yul-builtin-function-book "returndatasize" (lambda (cp) (ret 'normal (list 
                (bv (length last-returndata) yul-default-bitvector)
            ))))

            (hash-set! yul-builtin-function-book "call" (lambda (cp g a v in insize out outsize) (ret 'normal (list
                (let ([g0 (bitvector->integer g)] [a0 (bitvector->integer a)] [v0 (bitvector->integer v)]
                      [in0 (bitvector->integer in)] [insize0 (bitvector->integer insize)]
                      [out0 (bitvector->integer out)] [outsize0 (bitvector->integer outsize)])
                    ; (note) the in0...(in0+insize0) memory has already been abi encoded in Yul, so this forms a good callpack
                    ;        and no need to call `construct-calldata` any more
                    (define tmp-calldata (for/list ([i (range in0 (+ in0 insize0))])
                        (zhash-ref memory-book i)
                    ))
                    (define tmp-callpack (callpack vm-address g0 v0 tmp-calldata))
                    (define ret0 (send vm-manager call a0 tmp-callpack)) ; ret0 is a ret struct instance
                    (define ret0-values (ret-values ret0)) ; ret0-values is a chunk of memory
                    (when (not (equal? 1 (length ret0-values))) (println-and-exit "# [exception] call should only have one return."))
                    (define ret0-v (car ret0-values))
                    (set! last-returndata ret0-v) ; (fixme) update the last returndata
                    (define ret0-size (length ret0-v))
                    ; (note)(important) about how to handle memory copying and overwrite, see the bottom of EVM Dialect document at:
                    ;                   https://docs.soliditylang.org/en/latest/yul.html#evm-dialect
                    ; sync up to the smaller chunk of memory, in short
                    (for ([i (range out0 (+ out0 outsize0))] [j (range ret0-size)])
                        (zhash-set! memory-book i (list-ref ret0-v j))
                    )
                    ; (fixme) return 0 on error (e.g., out of gas) and return 1 on success, currently we only return 1
                    (bv 1 yul-default-bitvector)
                )
            ))))

            ; (fixme) basically same to call, but with some difference that should be further fixed
            ;         no v (wei) is passed
            (hash-set! yul-builtin-function-book "staticcall" (lambda (cp g a in insize out outsize) (ret 'normal (list
                (let ([g0 (bitvector->integer g)] [a0 (bitvector->integer a)] [v0 0]
                      [in0 (bitvector->integer in)] [insize0 (bitvector->integer insize)]
                      [out0 (bitvector->integer out)] [outsize0 (bitvector->integer outsize)])
                    ; (note) the in0...(in0+insize0) memory has already been abi encoded in Yul, so this forms a good callpack
                    ;        and no need to call `construct-calldata` any more
                    (define tmp-calldata (for/list ([i (range in0 (+ in0 insize0))])
                        (zhash-ref memory-book i)
                    ))
                    (define tmp-callpack (callpack vm-address g0 v0 tmp-calldata))
                    (define ret0 (send vm-manager call a0 tmp-callpack)) ; ret0 is a ret struct instance
                    (define ret0-values (ret-values ret0)) ; ret0-values is a chunk of memory
                    (when (not (equal? 1 (length ret0-values))) (println-and-exit "# [exception] staticcall should only have one return."))
                    (define ret0-v (car ret0-values))
                    (set! last-returndata ret0-v) ; (fixme) update the last returndata
                    (define ret0-size (length ret0-v))
                    ; (note)(important) about how to handle memory copying and overwrite, see the bottom of EVM Dialect document at:
                    ;                   https://docs.soliditylang.org/en/latest/yul.html#evm-dialect
                    ; sync up to the smaller chunk of memory, in short
                    (for ([i (range out0 (+ out0 outsize0))] [j (range ret0-size)])
                        (zhash-set! memory-book i (list-ref ret0-v j))
                    )
                    ; (fixme) return 0 on error (e.g., out of gas) and return 1 on success, currently we only return 1
                    (bv 1 yul-default-bitvector)
                )
            ))))

            ; (fixme) intentionally undefined zone, relax as you develop
            (hash-set! yul-builtin-function-book "revert" (lambda (cp x y) (println-and-exit "# [exception] revert needs to be defined.")))
            (hash-set! yul-builtin-function-book "dataoffset" (lambda (cp x) (println-and-exit "# [exception] dataoffset needs to be defined.")))
            (hash-set! yul-builtin-function-book "datasize" (lambda (cp x) (println-and-exit "# [exception] datasize needs to be defined.")))
            (hash-set! yul-builtin-function-book "codecopy" (lambda (cp t f s) (println-and-exit "# [exception] datasize needs to be defined.")))

            ; the Eurus debugging builtin functions
            (hash-set! yul-builtin-function-book "eurus_print" (lambda (cp x y) (printf "# [eurus_print] ~a: ~a.\n" x y) (ret 'normal (list (void)))))
        )

        (define/public (update-yul-builtin-function-book function-name f)
            (hash-set! yul-builtin-function-book function-name f)
        )
    )
)