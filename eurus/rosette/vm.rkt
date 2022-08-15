#lang rosette
(require sha
    (prefix-in tokamak: "../tokamak.rkt") ; shared
    (prefix-in config: "../config.rkt") ; shared
    (prefix-in yul: "./grammar.rkt")
    (prefix-in comp: "./components.rkt")
    (prefix-in utils: "./utils.rkt")
    "./mhash.rkt"
)
(provide (all-defined-out))

(define vm%
    (class object%
        (super-new)
        (field
            [yul-builtin-function-book null]

            [memory-book null]
            [storage-book null]

            ; temp book to deal with immutable
            [immutable-book null]

            ; constructor components
            [constructor-node null]
            [constructor-function-book null] ; stores entry nodes of different functions, name -> node

            ; dispatcher components
            [dispatcher-node null]
            [dispatcher-function-book null] ; stores entry nodes of different functions, name -> node

            [vm-manager null] ; set by manager deploying this vm, maintain a link to the manager
            [vm-address null] ; set by manager deploying this vm, maintain the address of this vm
            [vm-nickname null] ; set by manager deploying this vm, maintain a nickname (alias) for easy output
            [vm-abimap null] ; abi mapping, function name / function sig (when there are same names) -> { in: ..., out: ..., sig: ..., name: ... }

            ; (fixme) stateful variables
            [last-returndata (list )] ; for modeling op such as `returndatasize` and `returndatacopy`
            [init-timestamp (current-seconds)]
            [is-revert-trigged #f]
        )

        ; ========================================== ;
        ; ========== deployment utilities ========== ;
        ; ========================================== ;
        (define/public (deploy arg-node arg-config #:arg-param [arg-param (comp:default-param)])
            (initialize-yul-builtin-function-book) ; initialize builtin functions
            (set! constructor-node null)
            (set! dispatcher-node null)
            (set! constructor-function-book (make-hash)) ; just for indexing
            (set! dispatcher-function-book (make-hash)) ; just for indexing

            ; read config and parse abi map
            (set! vm-abimap (make-hash))
            (for ([pre-ent (hash-ref arg-config "abi-json")])
                (define ent (make-hash (hash->list pre-ent))) ; convert to mutable hash so that you can use hash-set!
                (let ([t0 (hash-ref ent 'type)])
                    (cond
                        [(or (equal? "constructor" t0) (equal? "function" t0))
                            (define name0 (if (equal? "constructor" t0) "constructor" (hash-ref ent 'name)))

                            (define in0 (for/list ([p (hash-ref! ent 'inputs null)])
                                (hash-ref p 'internalType) ; (fixme) should i use internalType or type?
                            ))
                            (define out0 (for/list ([p (hash-ref! ent 'outputs null)])
                                (hash-ref p 'internalType) ; (fixme) should i use internalType or type?
                            ))
                            (define sig0 (format "~a(~a)" name0 (string-join
                                (for/list ([p (hash-ref! ent 'inputs null)])
                                    (hash-ref p 'internalType) ; (fixme) should i use internalType or type?
                                )
                                ","
                            )))
                            (define ent0 (make-hash (list
                                (cons "in" in0) (cons "out" out0) (cons "sig" sig0) (cons "name" name0)
                            )))

                            ; determine key
                            (define key0
                                (cond
                                    [(hash-has-key? vm-abimap name0)
                                        ; name already exists, use sig
                                        (cond
                                            [(null? (hash-ref vm-abimap name0))
                                                ; main function name has been cleared, do nothing, use sig
                                                sig0
                                            ]
                                            [else
                                                ; entry is still not cleared, clear it before return
                                                (define ent1 (hash-ref vm-abimap name0))
                                                (hash-set! vm-abimap (hash-ref ent1 "sig") ent1)
                                                (hash-set! vm-abimap name0 null)
                                                sig0
                                            ]
                                        )
                                    ]
                                    [else name0] ; name is not occupied
                                )
                            )

                            ; set
                            (hash-set! vm-abimap key0 ent0)
                        ]
                        [else (void)] ; else do nothing
                    )
                )
            )
            ; delete null abi map
            (for ([key0 (hash-keys vm-abimap)])
                (when (null? (hash-ref vm-abimap key0))
                    (hash-remove! vm-abimap key0)
                )
            )

            ; (note) memory and storage models are address based, but differ:
            ;        - every memory location is a bitvector with 8 bits / 1 byte.
            ;        - every storage location is a bitvector with 256 bits / 32 bytes.
            ;        - see mstore/mload/sstore/sload for details: https://docs.soliditylang.org/en/v0.8.11/yul.html#evm-dialect
            ; ======> racket version
            ; (set! memory-book (make-hash)) ; see details in the memory management utilities
            ; (set! storage-book (make-hash)) ; see details in the storage management utilities
            ; <======
            ; ======> rosette version
            (set! memory-book (make-mhash config:memory-book-size)) ; see details in the memory management utilities
            (set! storage-book (make-mhash config:storage-book-size)) ; see details in the storage management utilities
            ; <======
            (set! immutable-book (make-hash))
            (do-deploy arg-node #:arg-param (comp:copy-param arg-param #:code-scope 'start))
        )
        (define/public (do-deploy arg-node #:arg-param [arg-param (comp:default-param)])
            (match arg-node
                ; top-level entrance
                [(yul:start m-object)
                    ; explicitly changing the code scope to 'constructor
                    ; process the constructor object
                    (do-deploy m-object #:arg-param (comp:copy-param arg-param #:code-scope 'constructor))
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
                    (do-deploy m-code #:arg-param (comp:copy-param arg-param))

                    ; then process the dispatcher object
                    ; explicitly changing the code scope to 'dispatcher
                    ; process the dispatcher object
                    (do-deploy m-dobj #:arg-param (comp:copy-param arg-param #:code-scope 'dispatcher))
                ]

                ; usually this is the dispatcher object
                ; - m-code is the dispatcher code
                [(yul:dobj m-name m-code)
                    ; remove the yul_function_definition from the dispatcher node
                    (define d-code (yul:code (yul:block
                        (filter (lambda (x) (not (yul:fundef? (yul:statement-res x))) )
                            (yul:block-statements (yul:code-block m-code))))))

                    ; set dispatcher node
                    (set! dispatcher-node d-code)

                    ; process the dispatcher code
                    (do-deploy m-code #:arg-param (comp:copy-param arg-param))
                ]

                ; pass on
                [(yul:code m-block) (do-deploy m-block #:arg-param (comp:copy-param arg-param))]
                [(yul:block m-statements) (for ([m m-statements]) (do-deploy m #:arg-param (comp:copy-param arg-param)))]

                [(yul:statement m)
                    (match m
                        [(yul:fundef m-id m-args m-rets m-block)
                            ; add the function node into corresponding components (constructor or dispatcher)
                            (let ([v (yul:id-res m-id)])
                                (cond
                                    [(equal? 'constructor (comp:param-code-scope arg-param))
                                        ; constructor scope
                                        (hash-set! constructor-function-book v m) ; add the function entry node
                                    ]
                                    [(equal? 'dispatcher (comp:param-code-scope arg-param))
                                        ; dispatcher scope
                                        (hash-set! dispatcher-function-book v m) ; add the function entry node
                                    ]
                                    [else (tokamak:exit "[~a:do-deploy] unsupported code-scope, got: ~a."
                                        vm-nickname (comp:param-code-scope arg-param))
                                    ]
                                )
                            )
                        ]

                        ; otherwise for the deploy call we do nothing
                        [_ null]
                    )
                ]

                ; otherwise, exit right now for debugging, this is not supposed to appear
                [_ (tokamak:exit "[~a:do-deploy] unsupported node, got: ~a." vm-nickname arg-node)]
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
                (tokamak:exit "[~a:construct] constructor-node is null." vm-nickname)
                ; no need to change code-scope since that only works for deploy mode
                (do-construct arg-callpack)
            )
        )
        (define/public (do-construct arg-callpack)
            ; use the default arg-rstack (an empty list, no stack)
            ; need to specify the code scope since it will be used to locate the function book
            (interpret constructor-node
                #:arg-callpack arg-callpack
                #:arg-param (comp:copy-param (comp:default-param) #:code-scope 'constructor))
        )

        ; ========================================== ;
        ; ========== dispatcher utilities ========== ;
        ; ========================================== ;
        (define/public (dispatch arg-callpack)
            ; check the avability of the dispatcher code
            (if (null? dispatcher-node)
                (tokamak:exit "[~a:dispatch] dispatcher-node is null." vm-nickname)
                ; no need to change code-scope since that only works for deploy mode
                (do-dispatch arg-callpack)
            )
        )

        (define/public (do-dispatch arg-callpack)
            (interpret dispatcher-node
                #:arg-callpack arg-callpack
                #:arg-param (comp:copy-param (comp:default-param) #:code-scope 'dispatcher))
        )

        ; for delegatecall to library
        ; (note) you need param since you may inherit the block scope option
        (define/public (dispatch-with-context arg-callpack arg-rstack arg-param)
            ; check the avability of the dispatcher code
            (if (null? dispatcher-node)
                (tokamak:exit "[~a:dispatch-with-context] dispatcher-node is null." vm-nickname)
                ; no need to change code-scope since that only works for deploy mode
                (do-dispatch-with-context arg-callpack arg-rstack arg-param)
            )
        )

        ; for delegatecall to library
        ; (note) you need param since you may inherit the block scope option
        (define/public (do-dispatch-with-context arg-callpack arg-rstack arg-param)
            (interpret dispatcher-node
                #:arg-callpack arg-callpack
                #:arg-rstack arg-rstack
                #:arg-param (comp:copy-param (comp:default-param) #:code-scope 'dispatcher))
        )

        ; ============================================== ;
        ; ========== interpretation utilities ========== ;
        ; ============================================== ;
        (define/public (call arg-node
                             #:arg-callpack [arg-callpack null]
                             #:arg-rstack [arg-rstack (list)]
                             #:arg-param [arg-param (comp:default-param)])
            ; first find the function in the corresponding function book
            (define target-function-book
                (let ([tmp-code-scope (comp:param-code-scope arg-param)])
                    (cond
                        [(equal? 'constructor tmp-code-scope) constructor-function-book]
                        [(equal? 'dispatcher tmp-code-scope) dispatcher-function-book]
                        [else (tokamak:exit "[~a:call] unsupported code-scope, got: ~a." vm-nickname tmp-code-scope)]
                    )
                )
            )

            (define target-function-name
                (let ([tmp-id (yul:funcall-id arg-node)])
                    (yul:id-res tmp-id)
                )
            )

            ; (printf "[debug:~a] target-function-name is: ~a\n" vm-nickname target-function-name)

            (define tmp-ret
                (cond
                    ; it's a user defined function
                    [(hash-has-key? target-function-book target-function-name)
                        (define target-def-node (hash-ref target-function-book target-function-name))
                        (define tmp-ret (do-user-call target-def-node arg-node
                            #:arg-callpack arg-callpack
                            #:arg-rstack arg-rstack
                            #:arg-param (comp:copy-param arg-param))
                        )
                        tmp-ret
                    ]
                    ; it's a builtin function
                    [(hash-has-key? yul-builtin-function-book target-function-name)
                        (define target-function (hash-ref yul-builtin-function-book target-function-name))
                        (define tmp-ret (do-builtin-call target-function arg-node
                            #:arg-callpack arg-callpack
                            #:arg-rstack arg-rstack
                            #:arg-param (comp:copy-param arg-param))
                        )
                        tmp-ret
                    ]
                    ; it's not found anywhere available, terminate
                    [else (tokamak:exit "[~a:call] can't find the target function, got: ~a." vm-nickname target-function-name)]
                )
            )

            ; return
            tmp-ret
        )
        ; calling a user defined function
        ; (note) this won't check the function name matching between the def-node and call-node, it assumes that they are matched already
        (define/public (do-user-call arg-def-node arg-call-node
                                     #:arg-callpack [arg-callpack null]
                                     #:arg-rstack [arg-rstack (list)]
                                     #:arg-param [arg-param (comp:default-param)])
            ; first do the arity checking
            (define def-arg-ids (yul:fundef-args arg-def-node))
            (define def-ret-ids (yul:fundef-rets arg-def-node))

            (define call-arg-exprs (yul:funcall-expressions arg-call-node))

            ; arity checking
            (when (not (equal? (length def-arg-ids) (length call-arg-exprs)))
                (tokamak:exit "[~a:do-user-call] arity mismatch for user function calls." vm-nickname))

            ; then evaluate the call args to get the final value first
            (define call-arg-rets
                (for/list ([p call-arg-exprs])
                    (interpret p #:arg-callpack arg-callpack #:arg-rstack arg-rstack #:arg-param (comp:copy-param arg-param))
                )
            )

            (define call-arg-values (call-args-extraction call-arg-rets))

            ; then initialize the function scope and map the call args values onto it (binding to def-arg-ids)
            (define local-register (make-register))

            ; install arguments
            (for ([xid def-arg-ids] [v call-arg-values])
                (call-install-args local-register xid v)
            )

            ; install return variables
            (for ([xid def-ret-ids])
                (call-install-rets local-register xid)
            )

            ; then you can finally call this function by interpreting the block with preset scope
            (define def-block-node (yul:fundef-block arg-def-node))

            ; (important) the scope here is created and managed from the function definition level, so a block need NOT create any new scope
            (define block-ret
                (interpret def-block-node
                    #:arg-callpack arg-callpack
                    #:arg-rstack (cons local-register arg-rstack)
                    #:arg-param (comp:copy-param arg-param #:new-block-scope #f)
                )
            )

            ; (note)(important)(fixme) the Yul syntax doesn't have an explicit return in a function block
            ;                          (there's one in EVM dialect but that one ends EXECUTION and return, which will directly return to the top level(?)),
            ;                          so here we need to actively return if the return list is not empty
            ; (fixme) don't know what to do if the return defined in function signature is different with the actual returned data from `return` call
            ; - (note) the ret-mode is inherited from block-ret
            (define tmp-ret
                (if (null? def-ret-ids)
                    ; nothing is defined (in the function signature) to return, then return the block-ret
                    block-ret
                    ; something to return, grab all of them from the local register
                    (comp:ret (comp:ret-mode block-ret) (for/list ([xid def-ret-ids])
                        (call-read-rets local-register xid)
                    ))
                )
            )

            ; return
            tmp-ret
        )
        ; calling a builtin function
        (define/public (do-builtin-call arg-function arg-call-node
                                        #:arg-callpack [arg-callpack null]
                                        #:arg-rstack [arg-rstack (list)]
                                        #:arg-param [arg-param (comp:default-param)])

            (define call-arg-exprs (yul:funcall-expressions arg-call-node)) ; these are expressions and needs to be evaluated first

            ; arity checking
            ; +3 for passing additional callpack + rstack + param arguments for every builtin function
            (when (not (equal? (procedure-arity arg-function) (+ 3 (length call-arg-exprs))))
                (tokamak:exit "[~a:do-builtin-call] arity mismatch for builtin function calls." vm-nickname))

            ; then evaluate the call args to get the final value
            (define call-arg-rets
                (for/list ([p call-arg-exprs])
                    (interpret p #:arg-callpack arg-callpack #:arg-rstack arg-rstack #:arg-param (comp:copy-param arg-param))
                )
            )

            (define call-arg-values (call-args-extraction call-arg-rets))

            ; then directly evaluate the function
            (define tmp-ret (apply arg-function
                (append
                    (list arg-callpack arg-rstack arg-param)
                    call-arg-values
                )
            ))

            ; return
            tmp-ret
        )

        ; helper function for do-user-call and do-builtin-call
        ; extract the 1st element from a list
        ; this also checks that the list only contains 1 element
        (define (call-args-extraction arg-rets)
            ; arg-rets is call-arg-rets
            (for/list ([p arg-rets])
                (let ([vs (comp:ret-values p)])
                    (when (not (equal? 1 (length vs)))
                        (tokamak:exit "[~a:call-args-extraction] every call argument should evaluate to only 1 value." vm-nickname))
                    (list-ref vs 0)
                )
            )
        )

        ; helper function for do-user-call
        (define (call-install-args local-register xid v)
            (match xid
                [(yul:id id) (rstack-make-var (list local-register) id v)]
                [(yul:tid id type) (rstack-make-var (list local-register) id v)]
                [_ (tokamak:exit "[~a:call-install-args] args could only be yul:id or yul:tid, got: ~a." vm-nickname (utils:struct-type xid))]
            )
        )

        ; helper function for do-user-call
        (define (call-install-rets local-register xid)
            (match xid
                [(yul:id id) (rstack-make-var (list local-register) id (bv 0 256))]
                [(yul:tid id type) (rstack-make-var (list local-register) id (bv 0 256))]
                [_ (tokamak:exit "[~a:call-install-rets] rets could only be yul:id or yul:tid, got: ~a." vm-nickname (utils:struct-type xid))]
            )
        )

        ; helper function for do-user-call
        (define (call-read-rets local-register xid)
            (match xid
                [(yul:id id) (rstack-read-var (list local-register) id)]
                [(yul:tid id type) (rstack-read-var (list local-register) id)]
                [_ (tokamak:exit "[~a:call-read-rets] rets could only be yul:id or yul:tid, got: ~a." vm-nickname (utils:struct-type xid))]
            )
        )

        ; execute statement and return a pair of (new) ret and mode
        (define (process-execute-block-statement arg-statement arg-local-register arg-curr-ret arg-callpack arg-rstack arg-param)
            (let ([arg-curr-mode (comp:ret-mode arg-curr-ret)])
                (cond
                    ; normal, just move and execute the next iteration
                    [(equal? 'normal arg-curr-mode)
                        (define tmp-curr-ret (if (comp:param-new-block-scope arg-param)
                            (do-interpret arg-statement
                                #:arg-callpack arg-callpack
                                #:arg-rstack (cons arg-local-register arg-rstack)
                                #:arg-param (comp:copy-param arg-param)) ; standalone block, create a new scope
                            (do-interpret arg-statement
                                #:arg-callpack arg-callpack
                                #:arg-rstack arg-rstack
                                #:arg-param (comp:copy-param arg-param)) ; attached block, scope is managed by upper level, usually for function definition and loop
                        ))
                        tmp-curr-ret
                    ]
                    [(equal? 'continue arg-curr-mode) arg-curr-ret] ; do nothing, keep the return mode
                    [(equal? 'break arg-curr-mode) arg-curr-ret] ; do nothing, keep the return mode
                    [(equal? 'leave arg-curr-mode) arg-curr-ret] ; do nothing, keep the return mode
                    [(equal? 'return arg-curr-mode) arg-curr-ret] ; do nothing, keep the return mode
                    [(equal? 'revert arg-curr-mode) arg-curr-ret] ; do nothing, keep the return mode
                    [(equal? 'synthesis arg-curr-mode) arg-curr-ret] ; do nothing, keep the return mode
                    ; this usually means there are some implementation errors
                    [else (tokamak:exit "[~a:process-execute-block-statement] unknown return mode, got: ~v." vm-nickname arg-curr-mode)]
                )
            )
        )

        ; write a list of values into corresponding slots of ids in stack
        (define (process-write-values-to-ids arg-vals arg-ids arg-rstack)
            ; make sure length of ids matches length of values
            (when (not (equal? (length arg-ids) (length arg-vals)))
                (tokamak:exit "[~a:process-write-values-to-ids] arity mismatch in assignment." vm-nickname))
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
            (when (not (equal? (length arg-ids) (length arg-vals)))
                (tokamak:exit "[~a:process-make-values-to-ids] arity mismatch in assignment." vm-nickname))
            ; assign each value to its corresponding id
            (for ([i (range (length arg-ids))])
                (define i-id (list-ref arg-ids i))
                (define i-val (list-ref arg-vals i))
                (rstack-make-var arg-rstack i-id i-val)
            )
        )

        ; (fixme) this procedure needs lifting
        (define (process-execute-switch arg-values arg-cases arg-default arg-callpack arg-rstack arg-param)
            (let ([v (car arg-values)] [hit #f] [curr-ret (comp:ret 'normal null)])
                (for ([c0 (utils:rcons arg-default arg-cases)])
                    (when (not hit)
                        (cond
                            [(yul:case? c0)
                                ; case
                                (define lret (do-interpret (yul:case-literal c0)
                                    #:arg-callpack arg-callpack
                                    #:arg-rstack arg-rstack
                                    #:arg-param (comp:copy-param arg-param))) ; literal ret value
                                ; (fixme) not checking arity here, assume it would be fine
                                (when (equal? v (car (comp:ret-values lret)))
                                    ; hit
                                    (set! hit #t)
                                    (set! curr-ret (do-interpret (yul:case-block c0)
                                        #:arg-callpack arg-callpack
                                        #:arg-rstack arg-rstack
                                        #:arg-param (comp:copy-param arg-param)))
                                )
                            ]
                            [(yul:default? c0)
                                ; hit
                                (set! hit #t)
                                (set! curr-ret (do-interpret (yul:default-block c0)
                                    #:arg-callpack arg-callpack
                                    #:arg-rstack arg-rstack
                                    #:arg-param (comp:copy-param arg-param)))
                            ]
                            [else (tokamak:exit "[~a:process-execute-switch] unknown switch branch, got: ~a." vm-nickname c0)]
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
        (define/public (interpret arg-node #:arg-callpack [arg-callpack null] #:arg-rstack [arg-rstack (list)] #:arg-param [arg-param (comp:default-param)])
            (do-interpret arg-node #:arg-callpack arg-callpack #:arg-rstack arg-rstack #:arg-param arg-param) ; (note) param here is direct shadowing, not copy-param
        )
        (define/public (do-interpret arg-node #:arg-callpack arg-callpack #:arg-rstack [arg-rstack (list)] #:arg-param [arg-param (comp:default-param)])
            ; (printf "[debug] interpreting ~a\n" (utils:struct-type arg-node))

            (match arg-node

                [(yul:block m-statements)
                    ; a yul_block creates a new scope
                    (let* ([local-register (make-register)] [curr-ret (comp:ret 'normal null)])
                        (for ([m m-statements])
                            (let ([curr-mode (comp:ret-mode curr-ret)] [curr-values (comp:ret-values curr-ret)])
                                ; construct a ret instance
                                (set! curr-ret
                                    (process-execute-block-statement
                                        m local-register (comp:ret curr-mode curr-values) arg-callpack arg-rstack arg-param
                                    )
                                )
                            )
                        )
                        ; return
                        curr-ret
                    )
                ]

                [(yul:assignment m-ids m-expression)
                    ; RHS of assignment, a ret object
                    (define r-expression (do-interpret m-expression
                        #:arg-callpack arg-callpack
                        #:arg-rstack arg-rstack
                        #:arg-param (comp:copy-param arg-param)))
                    (define r-values (comp:ret-values r-expression))

                    ; LHS of assignment, a list of ids
                    ; (this can only be id, not tid, according to grammar)
                    (define ids
                        (for/list ([p m-ids])
                            (yul:id-res p)
                        )
                    )

                    ; write values to ids
                    (process-write-values-to-ids r-values ids arg-rstack)

                    ; (printf "# [debug:~a] assign, id: ~a, vals: ~a\n" vm-nickname ids r-values)

                    ; return normally
                    (comp:ret 'normal null)
                ]

                [(yul:funcall m-id m-expressions)
                    ; transfer executionship to call for auto pilot
                    (call arg-node
                        #:arg-callpack arg-callpack
                        #:arg-rstack arg-rstack
                        #:arg-param (comp:copy-param arg-param))
                ]

                [(yul:if m-expression m-block)
                    ; RHS of assignment, a ret object
                    (define r-expression (do-interpret m-expression
                        #:arg-callpack arg-callpack
                        #:arg-rstack arg-rstack
                        #:arg-param (comp:copy-param arg-param)))
                    (define r-values (comp:ret-values r-expression))

                    ; make sure the expression only returns 1 value
                    (when (not (equal? 1 (length r-values)))
                        (tokamak:exit "[~a:yul:if] arity mismatch in if condition, should be 1." vm-nickname))

                    ; (note)(important) need to convert the condition to actual bool so that `if` can correctly pick up the branch condition
                    (define tmp-ret
                        (if (utils:bitvector->bool (car r-values))
                            ; true, go
                            ; delegate to block interpretation
                            (do-interpret m-block
                                #:arg-callpack arg-callpack
                                #:arg-rstack arg-rstack
                                #:arg-param (comp:copy-param arg-param))
                            ; (note) there's no else in Yul
                            (comp:ret 'normal null)
                        )
                    )
                    ; return
                    tmp-ret
                ]

                [(yul:switch m-expression m-cases m-default)
                    ; switch condition, a ret object
                    (define r-expression (do-interpret m-expression
                        #:arg-callpack arg-callpack
                        #:arg-rstack arg-rstack
                        #:arg-param (comp:copy-param arg-param)))
                    (define r-values (comp:ret-values r-expression))

                    ; make sure the expression only returns 1 value
                    (when (not (equal? 1 (length r-values)))
                        (tokamak:exit "[~a:yul:switch] arity mismatch in switch condition, should be 1." vm-nickname))

                    (define tmp-ret (process-execute-switch r-values m-cases m-default arg-callpack arg-rstack arg-param))
                    ; return
                    tmp-ret
                ]

                ; (note) all the component block in for loop do not create any new scope
                ;        instead, the new scope here is managed by the for loop itself
                [(yul:forloop m-init m-expression m-post m-body)
                    ; a for loop creates a new scope
                    (let* ([local-register (make-register)])
                        (do-interpret m-init
                            #:arg-callpack arg-callpack
                            #:arg-rstack (cons local-register arg-rstack)
                            #:arg-param (comp:copy-param arg-param #:new-block-scope #f))

                        (define r-cond (do-interpret m-expression
                            #:arg-callpack arg-callpack
                            #:arg-rstack (cons local-register arg-rstack)
                            #:arg-param (comp:copy-param arg-param)))
                        (define r-values (comp:ret-values r-cond))

                        (define (do-forloop)
                            (define r-cond (do-interpret m-expression
                                #:arg-callpack arg-callpack
                                #:arg-rstack (cons local-register arg-rstack)
                                #:arg-param (comp:copy-param arg-param)))
                            (define r-values (comp:ret-values r-cond))
                            (when (utils:bitvector->bool (car r-values))
                                ; hit, go for loop body
                                (define r-body (do-interpret m-body
                                    #:arg-callpack arg-callpack
                                    #:arg-rstack (cons local-register arg-rstack)
                                    #:arg-param (comp:copy-param arg-param #:new-block-scope #f)))
                                ; then interpret the post condition, only when mode is normal
                                (let ([rb-mode (comp:ret-mode r-body)])
                                    (cond
                                        [(or (equal? 'normal rb-mode) (equal? 'continue rb-mode))
                                            ; evaluate the post block
                                            (do-interpret m-post
                                                #:arg-callpack arg-callpack
                                                #:arg-rstack (cons local-register arg-rstack)
                                                #:arg-param (comp:copy-param arg-param #:new-block-scope #f))
                                            ; recursive call again
                                            (do-forloop)
                                        ]
                                        [(or (equal? 'break rb-mode) (equal? 'return rb-mode)) (equal? 'leave rb-mode)
                                            ; pass return the returned value
                                            r-body
                                        ]
                                        [else (tokamak:exit "[~a:do-forloop] unsupported return mode in for loop, got: ~a." vm-nickname rb-mode)]
                                    )
                                )
                            )
                            ; else: the cond is not satisfied, just exit for loop and return
                            ; here nothing has been executed yet, so jus return null
                            (comp:ret 'normal null)
                        )

                        (do-forloop)
                    )
                ]

                ; for variable declaration, the expression can be missing, which is different than assignment
                [(yul:vardec m-ids m-expression)

                    ; LHS of assignment, a list of ids
                    ; (this can only be id, not tid, according to grammar)
                    (define ids (for/list ([p m-ids]) (yul:id-res p)))

                    (define r-expression
                        (cond
                            [(null? m-expression) (comp:ret 'normal (for/list ([_ (length ids)]) (bv 0 256)))]
                            ; has expression, interpret it first
                            [else (do-interpret m-expression
                                #:arg-callpack arg-callpack
                                #:arg-rstack arg-rstack
                                #:arg-param (comp:copy-param arg-param))]
                        )
                    )

                    (define r-values (comp:ret-values r-expression))

                    ; make values to ids
                    (process-make-values-to-ids r-values ids arg-rstack)

                    ; (printf "# [debug:~a] vardec, id: ~a, vals: ~a\n" vm-nickname ids r-values)

                    ; return normally
                    (comp:ret 'normal null)
                ]

                ; (note) for a yul_identifier that is interpreted by itself here, it's only for reading (RHS)
                ;        since those in LHS will be intercepted by the parent node already
                [(yul:id m)
                    (define v (rstack-read-var arg-rstack m))
                    ; return normally
                    (comp:ret 'normal (list v))
                ]

                ; (note) interpret always starts from yul_code on top, not yul_object
                ; pass on
                [(yul:code m-block) (do-interpret m-block
                    #:arg-callpack arg-callpack
                    #:arg-rstack arg-rstack
                    #:arg-param (comp:copy-param arg-param))]

                ; pass on
                [(yul:statement m) (do-interpret m
                    #:arg-callpack arg-callpack
                    #:arg-rstack arg-rstack
                    #:arg-param (comp:copy-param arg-param))]

                ; pass on
                [(yul:expression m) (do-interpret m
                    #:arg-callpack arg-callpack
                    #:arg-rstack arg-rstack
                    #:arg-param (comp:copy-param arg-param))]

                ; pass on
                [(yul:literal m m-type) (do-interpret m
                    #:arg-callpack arg-callpack
                    #:arg-rstack arg-rstack
                    #:arg-param (comp:copy-param arg-param))]

                [(yul:number m) (comp:ret 'normal (list (bv m 256)))]

                [(yul:true m) (comp:ret 'normal (list (bool->bitvector #t 256)))] ; no need to lift, it's already true
                [(yul:false m) (comp:ret 'normal (list (bool->bitvector #f 256)))] ; no need to lift, it's already false

                ; (note) you need to convert string into bv
                ;        since there's something like `add("string", 10)` in YUL
                [(yul:string m)
                    (comp:ret 'normal (list
                        (utils:simple-encode-string m)
                    ))
                ]

                [(yul:leave m) (comp:ret 'leave null)] ; no need to lift, it's already 'leave
                [(yul:break m) (comp:ret 'break null)] ; no need to lift, it's already 'break

                ; you can't interpret a function definition, use call instead
                ; why? because there are also interpretable codes on the same level as function definitions
                ; and when calling constructor, we are actually calling the interpret method, which should not "call" the function definition
                [(yul:fundef m-id m-args m-rets m-block) (tokamak:exit "[~a:yul:fundef] you can't interpret a function definition." vm-nickname)]

                ; otherwise, exit right now for debugging, this is not supposed to appear
                ; (note) yul:case is not a unit for interpretation, it's decomposed in yul:switch interpretation
                [_ (tokamak:exit "[~a:do-interpret] unsupported node, got: ~a." vm-nickname (utils:struct-type arg-node))]
            )

        )

        ; ================================================================== ;
        ; ========== memory/storage/register management utilities ========== ;
        ; ================================================================== ;
        ; we use "register" to refer to represent memory, storage and (local) scope
        ; ======> racket version
        ; (define (make-register) (make-hash))
        ; <======
        ; ======> rosette version
        (define (make-register) (make-mhash config:register-size))
        ; <======

        (define (rstack-make-var arg-rstack arg-id arg-val)
            (when (null? arg-rstack) (tokamak:exit "[~a:rstack-make-var] arg-rstack is empty." vm-nickname))
            (let ([reg (car arg-rstack)])
                ; ======> racket version
                ; (hash-set! reg arg-id arg-val)
                ; <======
                ; ======> rosette version
                (for*/all ([reg0 reg #:exhaustive] [id0 arg-id #:exhaustive] [val0 arg-val #:exhaustive])
                    (mhash-set! reg0 id0 val0))
                ; <======
            )
        )

        (define (rstack-write-var arg-rstack arg-id arg-val)
            (when (null? arg-rstack) (tokamak:exit "[~a:rstack-write-var] arg-rstack is empty." vm-nickname))
            (let ([reg (car arg-rstack)] [rr (cdr arg-rstack)])
                ; ======> racket version
                ; (if (hash-has-key? reg arg-id)
                ;     ; has key, proceed
                ;     (hash-set! reg arg-id arg-val)
                ;     ; no key, fall back to previous register
                ;     (rstack-write-var rr arg-id arg-val)
                ; )
                ; <======
                ; ======> rosette version
                (for*/all ([reg0 reg #:exhaustive] [id0 arg-id #:exhaustive] [val0 arg-val #:exhaustive])
                    (if (mhash-has-key? reg0 id0)
                        (mhash-set! reg0 id0 val0)
                        (rstack-write-var rr id0 val0)
                    )
                )
                ; <======
            )
        )

        (define (rstack-read-var arg-rstack arg-id)
            (when (null? arg-rstack) (tokamak:exit "[~a:rstack-read-var] arg-rstack is empty." vm-nickname))
            (let ([reg (car arg-rstack)] [rr (cdr arg-rstack)])
                ; ======> racket version
                ; (if (hash-has-key? reg arg-id)
                ;     ; has key, read and return
                ;     (hash-ref reg arg-id)
                ;     ; no key, go to the next register if possible
                ;     (rstack-read-var rr arg-id)
                ; )
                ; <======
                ; ======> rosette version
                (for*/all ([reg0 reg #:exhaustive] [id0 arg-id #:exhaustive])
                    (if (mhash-has-key? reg0 id0)
                        (mhash-ref reg0 id0)
                        (rstack-read-var rr id0)
                    )
                )
                ; <======
            )
        )

        ; ================================================ ;
        ; ========== builtin function utilities ========== ;
        ; ================================================ ;
        ; we assume that every builtin function only has ONE return value
        ; all function has 3 additional arguments, cp: callpack, rs: rstack, pm: param
        (define/public (initialize-yul-builtin-function-book)
            (set! yul-builtin-function-book (make-hash))

            (hash-set! yul-builtin-function-book "mstore" (lambda (cp rs pm p v) (comp:ret 'normal (list
                ; (note) here v can be string, in that case, you need to encode string
                (let ([p0 (bitvector->natural p)])
                    (for ([i (range p0 (+ 32 p0))]
                          [j (utils:bitvector-split v 8)])
                        ; ======> racket version
                        ; (hash-set! memory-book i j)
                        ; <======
                        ; ======> rosette version
                        (for*/all ([i0 i #:exhaustive] [j0 j #:exhaustive])
                            (mhash-set! memory-book i0 j0))
                        ; <======
                    )
                    ; returns null
                    null
                )
            ))))
            (hash-set! yul-builtin-function-book "mload" (lambda (cp rs pm p) (comp:ret 'normal (list
                (let ([p0 (bitvector->natural p)])
                    (apply concat (for/list ([i (range p0 (+ 32 p0))]) ; 32 * 8bit = 256bit
                        ; ======> racket version
                        ; (when (not (hash-has-key? memory-book i))
                        ;     ; make sure the key exists
                        ;     ; (note) for memory the default bv is 8bit/1byte
                        ;     (hash-set! memory-book i (bv 0 8)))
                        ; (hash-ref memory-book i)
                        ; <======
                        ; ======> rosette version
                        (for/all ([i0 i #:exhaustive])
                            ; (note) don't use secure-key since it will set mvoid, not bv
                            (when (not (mhash-has-key? memory-book i0))
                                (mhash-set! memory-book i0 (bv 0 8)))
                            (mhash-ref memory-book i0)
                        )
                        ; <======
                    ))
                )
            ))))

            (hash-set! yul-builtin-function-book "sstore" (lambda (cp rs pm p v) (comp:ret 'normal (list
                (let ([p0 (bitvector->natural p)])
                    ; ======> racket version
                    ; (hash-set! storage-book p0 v)
                    ; <======
                    ; ======> rosette version
                    (for*/all ([p1 p0 #:exhaustive] [v0 v #:exhaustive])
                        (mhash-set! storage-book p1 v0))
                    ; <======
                    ; returns null
                    null
                )
            ))))
            (hash-set! yul-builtin-function-book "sload" (lambda (cp rs pm p) (comp:ret 'normal (list
                (let ([p0 (bitvector->natural p)])
                    ; ======> racket version
                    ; (when (not (hash-has-key? storage-book p0))
                    ;     ; make sure the key exists
                    ;     ; (note) for storage the default bv is 256bit
                    ;     (hash-set! storage-book p0 (bv 0 256)))
                    ; (hash-ref storage-book p0)
                    ; <======
                    ; ======> rosette version
                    (for/all ([p1 p0 #:exhaustive])
                        (when (not (mhash-has-key? storage-book p1))
                            (mhash-set! storage-book p1 (bv 0 256)))
                        (mhash-ref storage-book p1)
                    )
                    ; <======
                )
            ))))


            (hash-set! yul-builtin-function-book "eq" (lambda (cp rs pm x y) (comp:ret 'normal (list
                (bool->bitvector (bveq x y))
            ))))
            (hash-set! yul-builtin-function-book "add" (lambda (cp rs pm x y) (comp:ret 'normal (list
                (bvadd x y)
            ))))
            (hash-set! yul-builtin-function-book "sub" (lambda (cp rs pm x y) (comp:ret 'normal (list
                (bvsub x y)
            ))))
            (hash-set! yul-builtin-function-book "mul" (lambda (cp rs pm x y) (comp:ret 'normal (list
                (bvmul x y)
            ))))
            (hash-set! yul-builtin-function-book "div" (lambda (cp rs pm x y) (comp:ret 'normal (list
                (if (bvzero? y) (bv 0 256) (bvudiv x y))
            ))))
            (hash-set! yul-builtin-function-book "sdiv" (lambda (cp rs pm x y) (comp:ret 'normal (list
                (if (bvzero? y) (bv 0 256) (bvsdiv x y))
            ))))
            (hash-set! yul-builtin-function-book "and" (lambda (cp rs pm x y) (comp:ret 'normal (list
                (bvand x y)
            ))))
            (hash-set! yul-builtin-function-book "or" (lambda (cp rs pm x y) (comp:ret 'normal (list
                (bvor x y)
            ))))
            (hash-set! yul-builtin-function-book "not" (lambda (cp rs pm x) (comp:ret 'normal (list
                (bvnot x)
            ))))
            ; (note) rosette semantics is a bit different than Yul's
            (hash-set! yul-builtin-function-book "shr" (lambda (cp rs pm x y) (comp:ret 'normal (list
                (bvlshr y x)
            ))))
            ; (note) rosette semantics is a bit different than Yul's
            (hash-set! yul-builtin-function-book "shl" (lambda (cp rs pm x y) (comp:ret 'normal (list
                (bvshl y x)
            ))))

            ; (fixme) this may be wrong
            (hash-set! yul-builtin-function-book "mod" (lambda (cp rs pm x y) (comp:ret 'normal (list
                (if (bvzero? y) (bv 0 256) (bvurem x y))
            ))))


            (hash-set! yul-builtin-function-book "iszero" (lambda (cp rs pm x) (comp:ret 'normal (list
                (bool->bitvector (bvzero? x) 256)
            ))))
            (hash-set! yul-builtin-function-book "lt" (lambda (cp rs pm x y) (comp:ret 'normal (list
                (bool->bitvector (bvult x y) 256)
            ))))
            (hash-set! yul-builtin-function-book "gt" (lambda (cp rs pm x y) (comp:ret 'normal (list
                (bool->bitvector (bvugt x y) 256)
            ))))
            (hash-set! yul-builtin-function-book "slt" (lambda (cp rs pm x y) (comp:ret 'normal (list
                (bool->bitvector (bvslt x y) 256)
            ))))
            (hash-set! yul-builtin-function-book "sgt" (lambda (cp rs pm x y) (comp:ret 'normal (list
                (bool->bitvector (bvsgt x y) 256)
            ))))


            ; (fixme) needs to return something meaningful, using 0 for the present
            ; see: https://docs.soliditylang.org/en/latest/yul.html#memoryguard
            (hash-set! yul-builtin-function-book "memoryguard" (lambda (cp rs pm x) (comp:ret 'normal (list
                ; (bv 0 256)
                ; don't return 0 the address may overlap with some fixed operations,
                ; e.g., `finalize_allocation` overwrites address 64, which may overlap your first argument if you set guard to 0
                ; (bv 1024 256) ; 0x400
                ; (bv 65536 256) ; 0x10000
                (bv 4096 256) ; 0x1000
            ))))
            ; (fixme) need to actually model this
            (hash-set! yul-builtin-function-book "gas" (lambda (cp rs pm) (comp:ret 'normal (list
                (bv 0 256)
            ))))
            ; (fixme) iszero(extcodesize(expr_142_address)) mainly checks whether there's contract deployed in the target address
            ;         we temporarily set it to 1 for now, but in practice we can implement this by calling the zhash in manager
            (hash-set! yul-builtin-function-book "extcodesize" (lambda (cp rs pm a) (comp:ret 'normal (list
                (bv 1 256)
            ))))

            ; (fixme) I just return a random chain id, need to read the doc to properly model this
            (hash-set! yul-builtin-function-book "chainid" (lambda (cp rs pm) (comp:ret 'normal (list
                (bv 49 256)
            ))))
            ; (fixme) I just return a random chain id, need to read the doc to properly model this
            (hash-set! yul-builtin-function-book "timestamp" (lambda (cp rs pm) (comp:ret 'normal (list
                (begin
                    (set! init-timestamp (add1 init-timestamp))
                    (bv init-timestamp 256)
                )
            ))))

            ; (fixme)
            (hash-set! yul-builtin-function-book "setimmutable" (lambda (cp rs pm offset name value) (comp:ret 'normal (list
                ; write to memory (skipped, not modeled)
                ; write to immutabe-book
                (let ([name0 (utils:simple-decode-string name)])
                    ; string in YUL is encoded, so you need to decode it herer
                    (hash-set! immutable-book name0 value)
                    ; return
                    null
                )
            ))))

            ; (fixme)
            (hash-set! yul-builtin-function-book "loadimmutable" (lambda (cp rs pm name) (comp:ret 'normal (list
                (let ([name0 (utils:simple-decode-string name)])
                    ; string in YUL is encoded, so you need to decode it herer
                    (hash-ref immutable-book name0)
                )
            ))))

            ; based on my understanding, this returns a snippet of memory, and the total number of bits could be other than 256-bit based
            ; (note) you don't need to wrap a list out of the memory, since this is called at the end of external function (?)
            (hash-set! yul-builtin-function-book "return" (lambda (cp rs pm p s) (comp:ret 'return
                (let ([p0 (bitvector->natural p)] [s0 (bitvector->natural s)])
                    (for/list ([i (range p0 (+ s0 p0))])
                        ; ======> racket version
                        ; (when (not (hash-has-key? memory-book i))
                        ;     ; make sure the key exists
                        ;     ; (note) for memory the default bv is 8bit/1byte
                        ;     (hash-set! memory-book i (bv 0 8)))
                        ; (hash-ref memory-book i)
                        ; <======
                        ; ======> rosette version
                        (for*/all ([i0 i #:exhaustive])
                            (when (not (mhash-has-key? memory-book i0))
                                (mhash-set! memory-book i0 (bv 0 8)))
                            (mhash-ref memory-book i0)
                        )
                        ; <======
                    )
                )
            )))

            ; (fixme) here we use sha256 instead of keccak256
            (hash-set! yul-builtin-function-book "keccak256" (lambda (cp rs pm p n) (comp:ret 'normal (list
                (let ([p0 (bitvector->natural p)] [n0 (bitvector->natural n)])
                    ; first read mem[p...(p+n))
                    (define l0 (for/list ([i (range p0 (+ p0 n0))])
                        ; ======> racket version
                        ; ; (fixme) bytes can't accept negative integers, so we are converting it to natural here
                        ; ;         since this keccak is used for consistent addressing and there's no groundtruth
                        ; ;         required, so this should be fine
                        ; (bitvector->natural (hash-ref memory-book i))
                        ; <======
                        ; ======> rosette version (fixme)
                        (for/all ([i0 i #:exhaustive])
                            (bitvector->natural (mhash-ref memory-book i0)))
                        ; <======
                    ))

                    (when (symbolic? l0)
                        (tokamak:exit "[~a:keccak256] symbolic index is not supported." vm-nickname))

                    ; then convert to bytes
                    (define b0 (apply bytes l0))
                    (define k0 (sha256 b0))
                    (define l1 (bytes->list k0))
                    (define r0 (apply concat (for/list ([i l1]) (bv i 8))))
                    r0
                )
            ))))

            ; address is string, need to convert to number first
            (hash-set! yul-builtin-function-book "address" (lambda (cp rs pm) (comp:ret 'normal (list
                (if (equal? 'execution (comp:callpack-cntx cp))
                    ; use the caller's address
                    (bv (string->number (comp:callpack-caller cp) 16) 256)
                    ; use the current vm's address
                    (bv (string->number vm-address 16) 256)
                )
            ))))

            ; address is string, need to convert to number first
            (hash-set! yul-builtin-function-book "caller" (lambda (cp rs pm) (comp:ret 'normal (list
                (let ([caller (string->number (comp:callpack-caller cp) 16)])
                    (bv caller 256)
                )
            ))))
            (hash-set! yul-builtin-function-book "origin" (lambda (cp rs pm) (comp:ret 'normal (list
                (let ([origin (string->number (comp:callpack-origin cp) 16)])
                    (bv origin 256)
                )
            ))))
            (hash-set! yul-builtin-function-book "callvalue" (lambda (cp rs pm) (comp:ret 'normal (list
                (let ([wei (comp:callpack-wei cp)])
                    ; wei is bv alreaady
                    wei
                )
            ))))
            (hash-set! yul-builtin-function-book "calldatasize" (lambda (cp rs pm) (comp:ret 'normal (list
                (let ([cd (comp:callpack-calldata cp)])
                    (bv (length cd) 256)
                )
            ))))
            (hash-set! yul-builtin-function-book "calldataload" (lambda (cp rs pm x) (comp:ret 'normal (list
                (let ([cd (comp:callpack-calldata cp)])
                    (let ([im (drop cd (bitvector->natural x))])
                        (apply concat
                            (if (> (length im) 32)
                                ; sufficient call data
                                (take im 32)
                                ; insufficient call data, take the list and complete to 32 bytes
                                (append
                                    im
                                    (for/list ([_ (range (- 32 (length im)))])
                                        (bv 0 8) ; call data is stored in memory, so this should use 8bit/1byte
                                    )
                                )
                            )

                        )
                    )
                )
            ))))
            (hash-set! yul-builtin-function-book "calldatacopy" (lambda (cp rs pm t f s) (comp:ret 'normal (list
                (let ([cd (comp:callpack-calldata cp)])
                    (let ([t0 (bitvector->natural t)] [f0 (bitvector->natural f)] [s0 (bitvector->natural s)])
                        (for ([cdaddr (range f0 (+ s0 f0))] [memaddr (range t0 (+ s0 t0))])
                            ; ======> racket version
                            ; (hash-set! memory-book memaddr (list-ref cd cdaddr))
                            ; <======
                            ; ======> rosette version
                            (mhash-set! memory-book memaddr (list-ref cd cdaddr))
                            ; <======
                        )
                        ; returns null
                        null
                    )
                )
            ))))
            (hash-set! yul-builtin-function-book "returndatasize" (lambda (cp rs pm) (comp:ret 'normal (list
                (bv (length last-returndata) 256)
            ))))
            (hash-set! yul-builtin-function-book "returndatacopy" (lambda (cp rs pm t f s) (comp:ret 'normal (list
                (let ([t0 (bitvector->natural t)] [f0 (bitvector->natural f)] [s0 (bitvector->natural s)])
                    (for ([i (range f0 (+ f0 s0))] [j (range t0 (+ t0 s0))])
                        ; ======> racket version
                        ; (hash-set! memory-book j (list-ref last-returndata i))
                        ; <======
                        ; ======> rosette version
                        (mhash-set! memory-book j (list-ref last-returndata i))
                        ; <======
                    )
                    ; return null
                    null
                )
            ))))

            (hash-set! yul-builtin-function-book "call" (lambda (cp rs pm g a v in insize out outsize) (comp:ret 'normal (list
                (let ([g0 g] [a0 (bitvector->natural a)] [v0 v]
                      [in0 (bitvector->natural in)] [insize0 (bitvector->natural insize)]
                      [out0 (bitvector->natural out)] [outsize0 (bitvector->natural outsize)])
                    ; (note) the in0...(in0+insize0) memory has already been abi encoded in Yul, so this forms a good callpack
                    ;        and no need to call `construct-calldata` any more
                    (define tmp-calldata (for/list ([i (range in0 (+ in0 insize0))])
                        ; ======> racket version
                        ; (when (not (hash-has-key? memory-book i))
                        ;     ; make sure the key exists
                        ;     ; (note) for memory the default bv is 8bit/1byte
                        ;     (hash-set! memory-book i (bv 0 8)))
                        ; (hash-ref memory-book i)
                        ; <======
                        ; ======> rosette version
                        (for/all ([i0 i #:exhaustive])
                            (when (not (mhash-has-key? memory-book i0))
                                (mhash-set! memory-book i0 (bv 0 8)))
                            (mhash-ref memory-book i0)
                        )
                        ; <======
                    ))
                    ; (printf "CALLDATA is: ~a.\n" tmp-calldata)
                    (define tmp-callpack (comp:callpack vm-address (comp:callpack-origin cp) g0 v0 tmp-calldata (comp:callpack-cntx cp))) ; inherit the context
                    (define ret0 (send vm-manager call (utils:number->address a0) tmp-callpack)) ; ret0 is a ret struct instance
                    (define ret0-values (comp:ret-values ret0)) ; ret0-values is a chunk of memory
                    ; (when (not (equal? 1 (length ret0-values))) (tokamak:exit "[~a:function:call] call should only have one return." vm-nickname))
                    ; (define ret0-v (car ret0-values))
                    (define ret0-v ret0-values)
                    (set! last-returndata ret0-v) ; (fixme) update the last returndata
                    (define ret0-size (length ret0-v))
                    ; (note)(important) about how to handle memory copying and overwrite, see the bottom of EVM Dialect document at:
                    ;                   https://docs.soliditylang.org/en/latest/yul.html#evm-dialect
                    ; sync up to the smaller chunk of memory, in short
                    (for ([i (range out0 (+ out0 outsize0))] [j (range ret0-size)])
                        ; ======> racket version
                        ; (hash-set! memory-book i (list-ref ret0-v j))
                        ; <======
                        ; ======> rosette version
                        (for*/all ([i0 i #:exhaustive] [v0 ret0-v #:exhaustive] [j0 j #:exhaustive])
                            (mhash-set! memory-book i0 (list-ref v0 j0)))
                        ; <======
                    )
                    ; (fixme) return 0 on error (e.g., out of gas) and return 1 on success, currently we only return 1
                    (bv 1 256)
                )
            ))))

            ; (fixme) may be wrong, this is a quick impl.
            (hash-set! yul-builtin-function-book "delegatecall" (lambda (cp rs pm g a in insize out outsize) (comp:ret 'normal (list
                (let ([g0 g] [a0 (bitvector->natural a)]
                      [in0 (bitvector->natural in)] [insize0 (bitvector->natural insize)]
                      [out0 (bitvector->natural out)] [outsize0 (bitvector->natural outsize)])
                    ; (note) the in0...(in0+insize0) memory has already been abi encoded in Yul, so this forms a good callpack
                    ;        and no need to call `construct-calldata` any more
                    (define tmp-calldata (for/list ([i (range in0 (+ in0 insize0))])
                        ; ======> racket version
                        ; (when (not (hash-has-key? memory-book i))
                        ;     ; make sure the key exists
                        ;     ; (note) for memory the default bv is 8bit/1byte
                        ;     (hash-set! memory-book i (bv 0 8)))
                        ; (hash-ref memory-book i)
                        ; <======
                        ; ======> rosette version
                        (for/all ([i0 i #:exhaustive])
                            (when (not (mhash-has-key? memory-book i0))
                                (mhash-set! memory-book i0 (bv 0 8)))
                            (mhash-ref memory-book i0)
                        )
                        ; <======
                    ))
                    ; (printf "CALLDATA is: ~a.\n" tmp-calldata)
                    ; keep the original caller and callvalue
                    (define tmp-callpack (comp:callpack (comp:callpack-caller cp) (comp:callpack-origin cp) g0 (comp:callpack-wei cp) tmp-calldata 'execution)) ; set context to 'execution
                    (define ret0 (send vm-manager call-with-context (utils:number->address a0) tmp-callpack rs pm)) ; ret0 is a ret struct instance
                    (define ret0-values (comp:ret-values ret0)) ; ret0-values is a chunk of memory
                    ; (when (not (equal? 1 (length ret0-values))) (tokamak:exit "[~a:function:delegatecall] call should only have one return." vm-nickname))
                    ; (define ret0-v (car ret0-values))
                    (define ret0-v ret0-values)
                    (set! last-returndata ret0-v) ; (fixme) update the last returndata
                    (define ret0-size (length ret0-v))
                    ; (note)(important) about how to handle memory copying and overwrite, see the bottom of EVM Dialect document at:
                    ;                   https://docs.soliditylang.org/en/latest/yul.html#evm-dialect
                    ; sync up to the smaller chunk of memory, in short
                    (for ([i (range out0 (+ out0 outsize0))] [j (range ret0-size)])
                        ; ======> racket version
                        ; (hash-set! memory-book i (list-ref ret0-v j))
                        ; <======
                        ; ======> rosette version
                        (for*/all ([i0 i #:exhaustive] [v0 ret0-v #:exhaustive] [j0 j #:exhaustive])
                            (mhash-set! memory-book i0 (list-ref v0 j0)))
                        ; <======
                    )
                    ; (fixme) return 0 on error (e.g., out of gas) and return 1 on success, currently we only return 1
                    (bv 1 256)
                )
            ))))

            ; (fixme) basically same to call, but with some difference that should be further fixed
            ;         no v (wei) is passed
            (hash-set! yul-builtin-function-book "staticcall" (lambda (cp rs pm g a in insize out outsize) (comp:ret 'normal (list
                (let ([g0 g] [a0 (bitvector->natural a)] [v0 (bv 0 256)]
                      [in0 (bitvector->natural in)] [insize0 (bitvector->natural insize)]
                      [out0 (bitvector->natural out)] [outsize0 (bitvector->natural outsize)])
                    ; (note) the in0...(in0+insize0) memory has already been abi encoded in Yul, so this forms a good callpack
                    ;        and no need to call `construct-calldata` any more
                    (define tmp-calldata (for/list ([i (range in0 (+ in0 insize0))])
                        ; ======> racket version
                        ; (when (not (hash-has-key? memory-book i))
                        ;     ; make sure the key exists
                        ;     ; (note) for memory the default bv is 8bit/1byte
                        ;     (hash-set! memory-book i (bv 0 8)))
                        ; (hash-ref memory-book i)
                        ; <======
                        ; ======> rosette version
                        (for/all ([i0 i #:exhaustive])
                            (when (not (mhash-has-key? memory-book i0))
                                (mhash-set! memory-book i0 (bv 0 8)))
                            (mhash-ref memory-book i0)
                        )
                        ; <======
                    ))
                    (define tmp-callpack (comp:callpack vm-address (comp:callpack-origin cp) g0 v0 tmp-calldata (comp:callpack-cntx cp))) ; inherit the context
                    (define ret0 (send vm-manager call (utils:number->address a0) tmp-callpack)) ; ret0 is a ret struct instance
                    (define ret0-values (comp:ret-values ret0)) ; ret0-values is a chunk of memory
                    ; (when (not (equal? 1 (length ret0-values))) (tokamak:exit "[~a:function:staticcall] staticcall should only have one return." vm-nickname))
                    ; (define ret0-v (car ret0-values))
                    (define ret0-v ret0-values)
                    (set! last-returndata ret0-v) ; (fixme) update the last returndata
                    (define ret0-size (length ret0-v))
                    ; (note)(important) about how to handle memory copying and overwrite, see the bottom of EVM Dialect document at:
                    ;                   https://docs.soliditylang.org/en/latest/yul.html#evm-dialect
                    ; sync up to the smaller chunk of memory, in short
                    (for ([i (range out0 (+ out0 outsize0))] [j (range ret0-size)])
                        ; ======> racket version
                        ; (hash-set! memory-book i (list-ref ret0-v j))
                        ; <======
                        ; ======> rosette version
                        (for*/all ([i0 i #:exhaustive] [v0 ret0-v #:exhaustive] [j0 j #:exhaustive])
                            (mhash-set! memory-book i0 (list-ref v0 j0)))
                        ; <======
                    )
                    ; (fixme) return 0 on error (e.g., out of gas) and return 1 on success, currently we only return 1
                    (bv 1 256)
                )
            ))))

            (hash-set! yul-builtin-function-book "balance" (lambda (cp rs pm a) (comp:ret 'normal (list
                (send vm-manager get-balance (utils:number->address (bitvector->natural a)))
            ))))

            ; (note) the manager will replace linkersymbol("abcd") with linkersymbol("wxyz")
            ;        where wxyz is an address string without 0x prefix
            ; x is bv256
            (hash-set! yul-builtin-function-book "linkersymbol" (lambda (cp rs pm x) (comp:ret 'normal (list
                (bv (string->number (utils:simple-decode-string x) 16) 256)
            ))))

            ; (fixme) intentionally undefined zone, relax as you develop
            (hash-set! yul-builtin-function-book "revert" (lambda (cp rs pm s n)
                ; (note) in rosette mode, the path to this revert is cut,
                ;        unless it's translated to other specific types, e.g., eurus_dispatcher_revert
                ; ======> racket version
                ; (tokamak:exit "[~a:function:revert] message is: ~a." vm-nickname (eurus-extract-simple-string s n))
                ; <======
                ; ======> rosette version
                (set! is-revert-trigged #t)
                (assert #f)
                ; <======
            ))
            (hash-set! yul-builtin-function-book "dataoffset" (lambda (cp rs pm x) (tokamak:exit "[~a] dataoffset needs to be defined." vm-nickname)))
            (hash-set! yul-builtin-function-book "datasize" (lambda (cp rs pm x) (tokamak:exit "[~a] datasize needs to be defined." vm-nickname)))
            (hash-set! yul-builtin-function-book "codecopy" (lambda (cp rs pm t f s) (tokamak:exit "[~a] datasize needs to be defined." vm-nickname)))

            (hash-set! yul-builtin-function-book "log0" (lambda (cp rs pm p s) (comp:ret 'normal null)))
            (hash-set! yul-builtin-function-book "log1" (lambda (cp rs pm p s t1) (comp:ret 'normal null)))
            (hash-set! yul-builtin-function-book "log2" (lambda (cp rs pm p s t1 t2) (comp:ret 'normal null)))
            (hash-set! yul-builtin-function-book "log3" (lambda (cp rs pm p s t1 t2 t3) (comp:ret 'normal null)))
            (hash-set! yul-builtin-function-book "log4" (lambda (cp rs pm p s t1 t2 t3 t4) (comp:ret 'normal null)))

            ; ============================================ ;
            ; Eurus debugging/developing APIs -- Yul Level ;
            ; ============================================ ;

            (hash-set! yul-builtin-function-book "eurus_log1" (lambda (cp rs pm x) (printf "> [~a:eurus:log1] ~a.\n" vm-nickname x) (comp:ret 'normal null)))
            (hash-set! yul-builtin-function-book "eurus_log2" (lambda (cp rs pm x y) (printf "> [~a:eurus:log2] ~a: ~a.\n" vm-nickname x y) (comp:ret 'normal null)))
            (hash-set! yul-builtin-function-book "eurus_callpack" (lambda (cp rs pm) (comp:ret 'normal (list cp))))
            (hash-set! yul-builtin-function-book "eurus_memory" (lambda (cp rs pm x y) (comp:ret 'normal (list
                (let ([x0 (bitvector->natural x)] [y0 (bitvector->natural y)])
                    (for/list ([i (range x0 (+ x0 y0))])
                        (hash-ref memory-book i null)
                    )
                )
            ))))

            ; ================================================= ;
            ; Eurus debugging/developing APIs -- Solidity Level ;
            ; ================================================= ;

            ; s: start memory location of tag, n: size
            (hash-set! yul-builtin-function-book "eurus_says" (lambda (cp rs pm s n)
                (printf "> [~a:eurus:says] ~a.\n" vm-nickname (eurus-extract-simple-string s n))
                (comp:ret 'normal null)
            ))

            (hash-set! yul-builtin-function-book "eurus_dispatcher_revert" (lambda (cp rs pm)
                (tokamak:exit "[~a:eurus:dispatcher-revert] dispatcher reverted due to invalid calldata." vm-nickname)
            ))
            (hash-set! yul-builtin-function-book "eurus_dispatcher_miss" (lambda (cp rs pm s)
                (tokamak:exit "[~a:eurus:dispatcher-miss] cannot find target selector, got: ~a." vm-nickname s)
            ))

            ; s: start memory location of tag, n: size, x: condition
            (hash-set! yul-builtin-function-book "eurus_assume" (lambda (cp rs pm s n x)
                ; ======> racket version
                ; (tokamak:exit "[~a:eurus:assume] symbolic utilities not supported in racket mode." vm-nickname)
                ; <======
                ; ======> racket version
                (printf "> [~a:eurus:assume] ~a.\n" vm-nickname (eurus-extract-simple-string s n))
                (assume (bitvector->bool x))
                (comp:ret 'normal null)
                ; <======
            ))

            ; s: start memory location of tag, n: size, x: condition
            ; solving for a counterexample, i.e., (solve (! cond))
            ; (optional) if no counterexample is found, add cond to assume
            (hash-set! yul-builtin-function-book "eurus_assert" (lambda (cp rs pm s n x)
                ; ======> racket version
                ; (tokamak:exit "[~a:eurus:assert] symbolic utilities not supported in racket mode." vm-nickname)
                ; <======
                ; ======> racket version
                (printf "# [debug] eurus_assert gets: ~a\n" x)
                (define ret0 (solve (assert (! (bitvector->bool x)))))
                (cond
                    [(unsat? ret0)
                        ; verified
                        (printf "> [~a:eurus:assert] ~a\n(verified)\n" vm-nickname (eurus-extract-simple-string s n))
                    ]
                    [else
                        ; found a counterexample
                        (printf "> [~a:eurus:assert] ~a\n~a\n" vm-nickname (eurus-extract-simple-string s n) ret0)
                        ; (exit 0)
                    ]
                )
                (comp:ret 'normal null)
                ; <======
            ))

            (hash-set! yul-builtin-function-book "eurus_synthesize" (lambda (cp rs pm s n x)
                (define ret0 (solve (assert (bitvector->bool x))))
                (printf "> [~a:eurus:synthesize] ~a\n~a\n" vm-nickname (eurus-extract-simple-string s n) ret0)
                ; (comp:ret 'normal null)
                ; (note) special: return the solution
                (comp:ret 'synthesis ret0)
            ))

            (hash-set! yul-builtin-function-book "eurus_prank_once" (lambda (cp rs pm addr)
                ; (printf "> [~a] eurus_prank_once: ~a\n" vm-nic addr)
                (printf "> [~a:eurus:prank_once] ~a\n" vm-nickname addr)
                ; (set-field! preset-sender vm-manager addr)
                (set-field! preset-sender vm-manager (utils:number->address (bitvector->natural addr)))
                (comp:ret 'normal null)
            ))

            (hash-set! yul-builtin-function-book "eurus_symbolic_uint256" (lambda (cp rs pm s n)
                ; ======> racket version
                ; (tokamak:exit "[~a:eurus:assert:symbolic:uint256] symbolic utilities not supported in racket mode." vm-nickname)
                ; <======
                ; ======> racket version
                (define id (format "esym:uint256:~a" (eurus-extract-simple-string s n)))
                (printf "> [~a] created symboic variable ~a\n" vm-nickname id)
                (comp:ret 'normal (list
                    (tokamak:symbolic* (string->symbol id) 'bv256)
                ))
                ; <======
            ))
            (hash-set! yul-builtin-function-book "eurus_symbolic_address" (lambda (cp rs pm s n)
                ; ======> racket version
                ; (tokamak:exit "[~a:eurus:assert:symbolic:address] symbolic utilities not supported in racket mode." vm-nickname)
                ; <======
                ; ======> racket version
                (define id (format "esym:address:~a" (eurus-extract-simple-string s n)))
                (tokamak:exit "[~a:eurus:symbolic:address] racket/rosette version doesn't support symbolic variables: ~a." vm-nickname id)
                ; <======
            ))
            (hash-set! yul-builtin-function-book "eurus_symbolic_bool" (lambda (cp rs pm s n)
                ; ======> racket version
                ; (tokamak:exit "[~a:eurus:assert:symbolic:bool] symbolic utilities not supported in racket mode." vm-nickname)
                ; <======
                ; ======> racket version
                (define id (format "esym:bool:~a" (eurus-extract-simple-string s n)))
                (printf "> [~a] created symboic variable ~a\n" vm-nickname id)
                (comp:ret 'normal (list
                    (tokamak:symbolic* (string->symbol id) 'bv256)
                ))
                ; <======
            ))

            ; s: start memory location of tag, n: size, x: condition
            (hash-set! yul-builtin-function-book "rosette_assume" (lambda (cp rs pm s n x)
                ; ======> racket version
                ; (tokamak:exit "[~a:rosette:assume] symbolic utilities not supported in racket mode." vm-nickname)
                ; <======
                ; ======> racket version
                (printf "> [~a:rosette:assume] ~a.\n" vm-nickname (eurus-extract-simple-string s n))
                (assume (bitvector->bool x))
                (comp:ret 'normal null)
                ; <======
            ))

            ; s: start memory location of tag, n: size, x: condition
            (hash-set! yul-builtin-function-book "rosette_assert" (lambda (cp rs pm s n x)
                ; ======> racket version
                ; (tokamak:exit "[~a:rosette:assert] symbolic utilities not supported in racket mode." vm-nickname)
                ; <======
                ; ======> racket version
                (printf "> [~a:rosette:assert] ~a.\n" vm-nickname (eurus-extract-simple-string s n))
                (assert (bitvector->bool x))
                (comp:ret 'normal null)
                ; <======
            ))

            ; s: start memory location of tag, n: size, x: condition
            (hash-set! yul-builtin-function-book "rosette_cex" (lambda (cp rs pm s n x)
                ; ======> racket version
                ; (tokamak:exit "[~a:rosette:cex] symbolic utilities not supported in racket mode." vm-nickname)
                ; <======
                ; ======> racket version
                (define ret0 (solve (assert (! (bitvector->bool x)))))
                (printf "> [~a:rosette:cex] ~a\n~a\n" vm-nickname (eurus-extract-simple-string s n) ret0)
                (comp:ret 'normal null)
                ; <======
            ))

            ; s: start memory location of tag, n: size, x: condition
            (hash-set! yul-builtin-function-book "rosette_solve" (lambda (cp rs pm s n x)
                ; ======> racket version
                ; (tokamak:exit "[~a:rosette:solve] symbolic utilities not supported in racket mode." vm-nickname)
                ; <======
                ; ======> racket version
                (define ret0 (solve (assert (bitvector->bool x))))
                (printf "> [~a:rosette:solve] ~a\n~a\n" vm-nickname (eurus-extract-simple-string s n) ret0)
                (comp:ret 'normal null)
                ; <======
            ))
        )

        ; extract simple (and short) strings from provide memory
        ; (note) this is usually used for eurus built in function for tag string extraction
        ;        don't use it for other purpose
        ; s: start memory location, n: size
        (define (eurus-extract-simple-string s n)
            (let ([s0 (bitvector->natural s)] [n0 (bitvector->natural n)])
                (list->bytes
                    ; (fixme) take the right-most 32 bytes, and dump the first several (e.g. 64) bytes of string meta data
                    ;         this does not work well for long strings, so try not to say too much here
                    ; also filter out those \0 paddings
                    (filter
                        positive?
                        (take-right
                            (for/list ([i (range s0 (+ s0 n0))])
                                ; ======> racket version
                                ; (bitvector->natural (hash-ref memory-book i))
                                ; <======
                                ; ======> rosette version
                                (for/all ([i0 i #:exhaustive])
                                    (bitvector->natural (mhash-ref memory-book i)))
                                ; <======
                            )
                            32
                        )
                    )
                )
            )
        )
    )
)