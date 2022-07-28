#lang rosette
(require json
    (prefix-in mgr: "./manager.rkt")
    (prefix-in tokamak: "../tokamak.rkt")
    (prefix-in utils: "./utils.rkt")  
    (prefix-in comp: "./components.rkt")
)
; (provide (all-defined-out))
(provide (rename-out
    [set-verbose verbose]
    [make-vm vm]
    [make-var var]
    [make-account account]
    [make-call call]

    [random-account rand-account]
    [zero-account zero-account]

    [ref-vm @vm]
    [ref-var @var]
    [ref-account @account]

    [mint mint]
    [balance balance]
    [transfer transfer]

    [setup setup]
))

; verbose setting
(define curr-verbose #f)
(define (set-verbose b) (set! curr-verbose b))

; initialization code
(struct workspace (name mgr vms vars accounts alias) #:mutable #:transparent #:reflection-name 'workspace)
(define (make-workspace wsname) (workspace wsname 
    (new mgr:manager%) (make-hash) (make-hash) (make-hash) (make-hash) ))
(define workspace-book (make-hash))
(define curr-wsname "default")
(hash-set! workspace-book curr-wsname (make-workspace curr-wsname)) ; create default workspace

; dynamic env calls
(define (curr-workspace) (hash-ref workspace-book curr-wsname))
(define (curr-mgr) (workspace-mgr (curr-workspace)))
(define (curr-vms) (workspace-vms (curr-workspace)))
(define (curr-vars) (workspace-vars (curr-workspace)))
(define (curr-accounts) (workspace-accounts (curr-workspace)))
; alias is for tracking addr -> account name mapping, it's one to many, 
; i.e., one address can map to multiple nickname
(define (curr-alias) (workspace-alias (curr-workspace)))

; (note) make-?? procedures do not return anything, 
;        only ref-?? procedures return something from workspace

(define (make-var var-name val)
    (when curr-verbose
        (printf "# [env] [~a] making var: ~a\n" curr-wsname var-name))
    (when (hash-has-key? (curr-vars) var-name)
        (tokamak:exit "[env] [~a] variable ~a already exists." curr-wsname var-name))
    (hash-set! (curr-vars) var-name val) ; store into workspace
)
(define (ref-var var-name) (hash-ref (curr-vars) var-name))

; create a virtual machine loaded with given contract
; this doesn't initialize the vm
; |- config
;     |- manager | manager%: manager instance
;     |- contract-addr | number: contract address
;     |- contract-path | string: path to contract json
;     |- config | string: (path to) config json
(define (make-vm vm-name config)
    (when curr-verbose
        (printf "# [env] [~a] making vm: ~a\n" curr-wsname vm-name))
    (when (hash-has-key? (curr-vms) vm-name)
        (tokamak:exit "[env] [~a] vm ~a already exists." curr-wsname vm-name))
    (let ([mgr (curr-mgr)] 
          [contract-addr (hash-ref config "contract-addr")]
          [contract-path (hash-ref config "contract-path")]
          [config (hash-ref config "config")] )
        (send mgr deploy contract-path config contract-addr vm-name)
        (define vm (send mgr get-vm contract-addr))
        (hash-set! (curr-vms) vm-name vm) ; store into workspace
    )
)
(define (ref-vm vm-name) (hash-ref (curr-vms) vm-name))

; create a function call, but don't call it, just return it
; |- config
;     |- caller-addr | string: caller address
;     |- vm | vm%: virtual machine instance
;     |- fkey | string: name or signature of the function
;     |- fvals | list of values: a list of arguments to supply to the call
;     |- gas | number, optional: 0 by default
;     |- wei | number, optional: 0 by default
;     |- decode? | bool or procedure, optional: whether to do abi decode of the result or not
;                                               if a procedure is supplied, apply it on values
(define (make-call caller-addr vm fkey fvals #:gas [gas 0] #:wei [wei 0] #:decode? [decode? #f])
    ; first fetch the actual signature by fkey
    (define vm-name (get-field vm-nickname vm))
    (define vm-address (get-field vm-address vm))
    (define abimap (get-field vm-abimap vm))
    (define fent (hash-ref! abimap fkey null))
    (when (null? fent)
        (if (equal? "constructor" fkey)
            ; this is a library without constructor
            ; then give a fake one
            (set! fent (make-hash (list 
                (cons "sig" "constructor()")
                (cons "in" (list ))
                (cons "out" (list ))
            )))
            ; wrong
            (tokamak:exit "[env] [~a] function name ~a doesn't exist, or it has overloadings; use signature instead." 
                curr-wsname fkey)
        )
    )

    (define fsig (hash-ref fent "sig"))
    (define fin (hash-ref fent "in"))
    (define fout (hash-ref fent "out"))
    (when (not (equal? (length fvals) (length fin)))
        (tokamak:exit "[env] [~a] arguments mismatch for function ~a, got: ~a, expected: ~a."
            curr-wsname fsig (length fvals) (length fin)))
    (define fargs (for/list ([t fin] [v fvals]) (cons t v)))

    (define cp (let ([cd (utils:construct-calldata fsig fargs)])
        (comp:callpack caller-addr caller-addr (bv gas 256) (bv wei 256) cd 'current)
    ))

    (when curr-verbose
        (printf "# [env] [~a] [~a] calling function: ~a | ~a\n" curr-wsname vm-name fsig fvals))
    ; different method for constructor and normal functions
    (define ret0
        (cond
            [(equal? "constructor" fkey)
                ; constructor
                ; (define fun0 (lambda () (send vm construct cp))) ; define call
                ; (fun0) ; execute call
                ; (note) must call via vm so that gas and wei can be processed correctly
                (send (curr-mgr) call vm-address cp 'constructor)
            ]
            [else
                ; normal functions
                ; (define fun0 (lambda () (send vm dispatch cp))) ; define call
                ; (fun0) ; execute call
                ; (note) must call via vm so that gas and wei can be processed correctly
                (send (curr-mgr) call vm-address cp 'dispatcher)
            ]
        )
    )
    ; decoding
    (cond
        ; procedure, apply procedure to values
        [(procedure? decode?) 
            (comp:ret 
                (comp:ret-mode ret0)
                (apply decode? (comp:ret-values ret0))
            )
        ]
        ; #t then decode
        [decode? 
            (decode-ret ret0 fout)
        ]
        ; else don't decode
        [else ret0]
    )
)

(define (decode-ret ret0 otyps)
    (comp:ret 
        (comp:ret-mode ret0) 
        (utils:decode-returndata 
            otyps 
            ; (fixme) can only decode the first since it's illegal to return multiple mem
            ;         if you return multiple values, they will be encoded into the same mem chunk (abi)
            (comp:ret-values ret0)
        )
    )
)

(define (add-alias addr name)
    (when (not (hash-has-key? (curr-alias) addr)) 
        (hash-set! (curr-alias) addr (list )))
    (hash-set! (curr-alias) addr (cons name (hash-ref (curr-alias) addr)))
)
(define (get-alias addr) 
    (string-join (hash-ref (curr-alias) addr) "|")
)

; ========================================= ;
; ======== account related methods ======== ;
; ========================================= ;

; (note) this will create a new account (different from contract)
;        an account is also stored as variable
(define (make-account name addr [val 0])
    (when curr-verbose
        (printf "# [env] [~a] creating account {~a}@{~a} with balance of ~a ...... " curr-wsname name addr val))
    (send (curr-mgr) new-balance-account addr (bv val 256))
    (when (hash-has-key? (curr-accounts) name)
        (tokamak:exit "[env] [~a] account name {~a} already exists." curr-wsname name))
    (hash-set! (curr-accounts) name addr) ; set account
    (add-alias addr name) ; also add alias
    (when curr-verbose
        (printf "done\n"))
)
(define (ref-account name) (hash-ref (curr-accounts) name))

; this creates a random 40 character / 160 bit / 20 byte address, without 0x prefix
(define (random-account) 
    (string-join
        (for/list ([i (range 40)])
            (number->string (random 16) 16)
        )
        ""
    )
)
(define (zero-account) (string-join (for/list ([i (range 40)]) "0") ""))

; ============================================== ;
; ======== built-in EVM address methods ======== ;
; ============================================== ;

; add funds to account
(define (mint addr val) 
    (when curr-verbose
        (printf "# [env] [~a] minting ~a for {~a} ...... " curr-wsname val (get-alias addr)))
    (send (curr-mgr) mint addr (bv val 256))
    (when curr-verbose
        (printf "done\n"))
)

; query balance of an account
(define (balance addr) 
    (when curr-verbose
        (printf "# [env] [~a] checking balance of: {~a} ...... " curr-wsname (get-alias addr)))
    (define ret0 (send (curr-mgr) get-balance addr))
    (when curr-verbose
        (printf "~a\n" (bitvector->natural ret0)))
    ret0
)

; transfer value between two accounts
; (note) if manager transfer call fails (returns #f), we should terminate here
;        since env is for interaction and setup, not for reasoning
(define (transfer from to val) 
    (when curr-verbose
        (printf "# [env] [~a] transfering ~a from {~a} to {~a} ...... " curr-wsname val (get-alias from) (get-alias to)))
    (define ret0 (send (curr-mgr) transfer from to (bv val 256)))
    (when (not ret0)
        (when curr-verbose
            (printf "failed\n"))
        (tokamak:exit "[env] [~a] transfer failed, please fix your script." curr-wsname))
    (when curr-verbose
        (printf "done\n"))
)

; ======================================================== ;
; ======== higher-level wrapper (to be separated) ======== ;
; ======================================================== ;

; one step setup of a virtual machine, this includes:
;   - ??
(define (setup base-path base-name shared-config #:address [address null] #:vm-name [vm-name base-name])
    (define yul-path (path->string (build-path base-path (format "~a.eurus.json" base-name))))
    (define abi-path (path->string (build-path base-path (format "~a.abi.json" base-name))))
    ; combine shared config and vm specific config
    (define vm-config (make-hash (append 
        (hash->list shared-config)
        (list
            (cons "abi-json" (string->jsexpr (file->string abi-path)))
        )
    )))
    ; create account
    (define vm-account (if (null? address)
        ; need to create account
        (begin (make-account vm-name (random-account) 0) (ref-account vm-name))
        ; account already provided
        address
    ))
    ; create vm (don't call constructor)
    (make-vm vm-name (make-hash (list
        (cons "contract-addr" vm-account)
        (cons "contract-path" yul-path)
        (cons "config" vm-config)
    )))
)