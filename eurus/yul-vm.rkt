#lang rosette
; (note)(fixme) according to the syntax of Yul, you can actually define a function within a function, which is not supported here for the present
(require rosette/lib/destruct) ; match syntax in rosette
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
            (destruct arg-node
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
                    (destruct m
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
            (when (symbolic? arg-node) (println-and-exit "# [exception]: arg-node can't be symbolic."))
            (when (not (yul:funcall? arg-node)) (println-and-exit (format "# [exception]: node to call should be yul_function_call, got: ~a." (struct-type arg-node))))
            ; first perform auto pilot to locate the target function definition using the provided identifier
            
            ; - first find the function in the corresponding function book
            (define target-function-book (cond
                [(equal? 'constructor (param-code-scope arg-param)) constructor-function-book]
                [(equal? 'dispatcher (param-code-scope arg-param)) dispatcher-function-book]
                [else (println-and-exit (format "# [exception] unsupported param-code-scope, got: ~a." (param-code-scope arg-param)))]
            ))
            (define target-function-name (yul:id-res (yul:funcall-id arg-node))) ; grab the target function name
            ; (printf "# [debug] target-function-name is: ~a\n" target-function-name)
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
        ; calling a user defined function
        ; (note) this won't check the function name matching between the def-node and call-node, it assumes that they are matched already
        (define/public (do-user-call arg-def-node arg-call-node #:arg-rstack [arg-rstack (list)] #:arg-param [arg-param (default-param)])
            ; first do the arity checking
            (define def-arg-ids (yul:fundef-args arg-def-node))
            (define def-ret-ids (yul:fundef-rets arg-def-node))

            (define call-arg-exprs (yul:funcall-expressions arg-call-node)) ; these are expressions and needs to be evaluated first
            (when (not (equal? (length def-arg-ids) (length call-arg-exprs))) (println-and-exit "# [exception]: arity mismatch for function calls."))

            ; then evaluate the call args to get the final value first
            (define call-arg-rets (for/list ([p call-arg-exprs]) (interpret p #:arg-rstack arg-rstack #:arg-param (copy-param arg-param)))) ; (note) these are ret objects
            (define call-arg-values (for/list ([p call-arg-rets]) (list-ref (ret-values p) 0))) ; (fixme) the ret-values can only be a list of size 1, but we are not checking here

            ; then initialize the function scope and map the call args values onto it (binding to def-arg-ids)
            (define local-register (make-register))
            (for ([xid def-arg-ids] [v call-arg-values])
                ; since rstack-make-var operates on stack, you need to wrap the local register into a list as a fake stack
                (destruct xid
                    ; xid could be yul:id or yul:tid
                    [(yul:id id)
                        (rstack-make-var (list local-register) id #:arg-val v)
                    ]
                    [(yul:tid id type)
                        (rstack-make-var (list local-register) id #:arg-val v)
                    ]
                    [_ (println-and-exit (format "# [exception]: args could only be yul:id or yul:tid, got: ~a." (struct-type xid)))]
                )
            )
            ; also initialize def-ret-ids in the function scope
            (for ([xid def-ret-ids])
                (destruct xid
                    ; xid could be yul:id or yul:tid
                    [(yul:id id)
                        (rstack-make-var (list local-register) id) ; use default value
                    ]
                    [(yul:tid id type)
                        (rstack-make-var (list local-register) id) ; use default value
                    ]
                    [_ (println-and-exit (format "# [exception]: rets could only be yul:id or yul:tid, got: ~a." (struct-type xid)))]
                )
            )

            ; then you can finally call this function by interpreting the block with preset scope
            (define def-block-node (yul:fundef-block arg-def-node))
            ; (important) the scope here is created and managed from the function definition level, so a block need NOT create any new scope
            (define block-ret (interpret def-block-node 
                #:arg-rstack (cons local-register arg-rstack) 
                #:arg-param (copy-param arg-param #:new-block-scope #f)
            ))
            ; (note)(important)(fixme) the Yul syntax doesn't have an explicit return in a function block 
            ;                          (there's one in EVM dialect but that one ends EXECUTION and return, which will directly return to the top level(?)),
            ;                          so here we need to actively return if the return list is not empty
            ; - (note) the ret-mode is inherited from block-ret
            (if (null? def-ret-ids)
                ; nothing to return
                (ret (ret-mode block-ret) (void))
                ; something to return, grab all of them from the local register
                (ret (ret-mode block-ret) (for/list ([xid def-ret-ids]) 
                    (destruct xid
                        [(yul:id id)
                            (rstack-read-var (list local-register) id)
                        ]
                        [(yul:tid id type)
                            (rstack-read-var (list local-register) id)
                        ]
                        [_ (println-and-exit "# [exception]: you should not reach here.")] ; would've been detected before
                    )
                ))
            )
        )
        ; calling a builtin function
        (define/public (do-builtin-call arg-function arg-call-node #:arg-rstack [arg-rstack (list)] #:arg-param [arg-param (default-param)])
             ; first do the arity checking
            (define call-arg-exprs (yul:funcall-expressions arg-call-node)) ; these are expressions and needs to be evaluated first
            ; +1 for passing additional callpack argument for every builtin function
            (when (not (equal? (procedure-arity arg-function) (+ 1 (length call-arg-exprs)))) (println-and-exit "# [exception]: arity mismatch for function calls."))

            ; then evaluate the call args to get the final value first
            (define call-arg-rets (for/list ([p call-arg-exprs]) (interpret p #:arg-rstack arg-rstack #:arg-param (copy-param arg-param)))) ; (note) these are ret objects
            (define call-arg-values (for/list ([p call-arg-rets]) (list-ref (ret-values p) 0))) ; (fixme) the ret-values can only be a list of size 1, but we are not checking here

            ; then directly evaluate the function
            ; (note) attach the callpack because some builtin function needs to read the callpack info, e.g., `calldata*` series
            (define res (apply arg-function (cons (param-callpack arg-param) call-arg-values)))

            res
        )
        ; - arg-rstack: stack of local registers, with priority (first higher), pass on by (cons new old-list)
        ;               local variables will be stored and tracked, a single register is a fully functional zhash
        ; -             see more details for scoping rules: https://docs.soliditylang.org/en/v0.8.11/yul.html#scoping-rules
        (define/public (interpret arg-node #:arg-rstack [arg-rstack (list)] #:arg-param [arg-param (default-param)])
            (when (symbolic? arg-node) (println-and-exit "# [exception]: arg-node can't be symbolic."))
            (do-interpret arg-node #:arg-rstack arg-rstack #:arg-param arg-param) ; (note) param here is direct shadowing, not copy-param
        )
        (define/public (do-interpret arg-node #:arg-rstack [arg-rstack (list)] #:arg-param [arg-param (default-param)])
            (destruct arg-node
                
                ; a yul_block creates a new scope
                [(yul:block m-statements)
                    (let* ([local-register (make-register)]
                           [curr-ret (ret 'normal (void))]
                           [curr-mode (ret-mode curr-ret)])
                        (for ([m m-statements])
                            (cond
                                [(equal? 'normal curr-mode) 
                                    (set! curr-ret (if (param-new-block-scope arg-param)
                                        (do-interpret m #:arg-rstack (cons local-register arg-rstack) #:arg-param (copy-param arg-param)) ; standalone block, create a new scope
                                        (do-interpret m #:arg-rstack arg-rstack #:arg-param (copy-param arg-param)) ; attached block, scope is managed by upper level, usually for function definition and loop
                                    ))
                                    (set! curr-mode (ret-mode curr-ret)) ; update curr-mode
                                ] ; normal, just move and execute the next iteration
                                [(equal? 'continue curr-mode) (void)] ; do nothing, keep the return mode
                                [(equal? 'break curr-mode) (void)] ; do nothing, keep the return mode
                                [(equal? 'leave curr-mode) (void)] ; do nothing, keep the return mode
                                [(equal? 'return curr-mode) (void)] ; do nothing, keep the return mode
                                ; this usually means there are some implementation errors
                                [else (println-and-exit (format "# [exception]: unknown return mode, got: ~a." curr-mode))]
                            )
                        )
                        ; return the most recent ret object
                        curr-ret
                    )
                ]

                [(yul:assignment m-ids m-expression)
                    (define ret-expression (do-interpret m-expression #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))) ; RHS of assignment, a ret object
                    (define ids (for/list ([p m-ids]) (yul:id-res p))) ; LHS of assignment, a list of ids (this can only be id, not tid, according to grammar)

                    ; make sure you cut all the paths where number of returned values doesn't match the number of ids
                    (when (not (equal? (length ids) (length (ret-values ret-expression)))) (println-and-exit "# [exception]: arity mismatch in assignment."))

                    ; (note) there will be contract violation if ?? from (range ??) is symbolic
                    ; assign each value to its corresponding id
                    (for ([i (range (length ids))])
                        (define i-id (list-ref ids i))
                        (define i-ret (list-ref (ret-values ret-expression) i))
                        (rstack-write-var arg-rstack i-id i-ret)
                    )

                    ; return normally
                    (ret 'normal (void))
                ]

                ; transfer executionship to call/do-call for auto pilot
                [(yul:funcall m-id m-expressions)
                    (call arg-node #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))
                ]

                [(yul:if m-expression m-block)
                    (define ret-expression (do-interpret m-expression #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))) ; RHS of assignment, a ret object
                    ; make sure the expression only returns 1 value
                    (when (not (equal? 1 (length (ret-values ret-expression)))) (println-and-exit "# [exception]: arity mismatch in if condition, should be 1."))

                    ; (note)(important) need to convert the condition to actual bool so that `if` can correctly pick up the branch condition
                    (if (bitvector->bool (car (ret-values ret-expression)))
                        ; true, go
                        (do-interpret m-block #:arg-rstack arg-rstack #:arg-param (copy-param arg-param)) ; deligate to block interpretation
                        ; (note) there's no else in Yul
                        (ret 'normal (void))
                    )
                ]

                ; (todo)
                [(yul:switch m-expression m-cases m-default)
                    (define ret-expression (do-interpret m-expression #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))) ; switch condition, a ret object
                    ; make sure the expression only returns 1 value
                    (when (not (equal? 1 (length (ret-values ret-expression)))) (println-and-exit "# [exception]: arity mismatch in switch condition, should be 1."))

                    (let ([v (car (ret-values ret-expression))]
                          [hit #f] [curr-ret (ret 'normal (void))])
                        (for ([c0 (rcons m-default m-cases)])
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
                ]

                ; (todo)
                [(yul:forloop m-init m-expression m-post m-body)
                    (println-and-exit "# [exception]: forloop is under construction.")
                ]

                ; for variable declaration, the expression can be missing, which is different than assignment
                [(yul:vardec m-ids m-expression)
                    (define ids (for/list ([p m-ids]) (yul:id-res p))) ; LHS of assignment, a list of ids (this can only be id, not tid, according to grammar)
                    (define ret-expression (if (null? m-expression)
                        ; no expression is provided, return default value(s) of equal arity with ids, as initialized/default value
                        (ret 'normal (for/list ([_ (length ids)]) (bv 0 yul-default-bitvector)))
                        ; has expression, interpret it first
                        (do-interpret m-expression #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))
                    ))

                    ; make sure you cut all the paths where number of returned values doesn't match the number of ids
                    (when (not (equal? (length ids) (length (ret-values ret-expression)))) (println-and-exit "# [exception]: arity mismatch in variable declaration."))

                    ; (note) there will be contract violation if ?? from (range ??) is symbolic
                    ; assign each value to its corresponding id
                    (for ([i (range (length ids))])
                        (define i-id (list-ref ids i))
                        (define i-ret (list-ref (ret-values ret-expression) i))
                        (rstack-make-var arg-rstack i-id #:arg-val i-ret) ; this should be `make` since it's declaring something not just assigning
                    )

                    ; return normally
                    (ret 'normal (void))
                ]

                ; (note) for a yul_identifier that is interpreted by itself here, it's only for reading (RHS)
                ;        since those in LHS will be intercepted by the parent node already
                [(yul:id m)
                    (define v (rstack-read-var arg-rstack m))
                    ; return normally
                    (ret 'normal (list v))
                ]

                ; (note) interpret always starts from yul_code on top, not yul_object
                [(yul:code m-block) (do-interpret m-block #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))] ; pass on
                [(yul:statement m) (do-interpret m #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))] ; pass on
                [(yul:expression m) (do-interpret m #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))] ; pass on
                [(yul:literal m m-type) (do-interpret m #:arg-rstack arg-rstack #:arg-param (copy-param arg-param))] ; pass on
                [(yul:number m) (ret 'normal (list (bv m yul-default-bitvector)))]

                [(yul:true m) (ret 'normal (list (bool->bitvector #t yul-default-bitvector)))]
                [(yul:false m) (ret 'normal (list (bool->bitvector #f yul-default-bitvector)))]
                [(yul:string m) (ret 'normal (list m))]

                [(yul:leave m) (ret 'leave (void))]

                ; (note) yul:case is not a unit for interpretation, it's decomposed in yul:switch interpretation

                ; you can't interpret a function definition, use call instead
                ; why? because there are also interpretable codes on the same level as function definitions
                ; and when calling constructor, we are actually calling the interpret method, which should not "call" the function definition
                [(yul:fundef m-id m-args m-rets m-block) (println-and-exit (format "# [exception]: you can't interpret a function definition."))]
                ; otherwise, exit right now for debugging, this is not supposed to appear
                [_ (println-and-exit (format "# [exception][do-interpret]: unsupported node, got: ~a." (struct-type arg-node)))]
            )
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
    )
)