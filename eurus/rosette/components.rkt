#lang rosette
(provide (all-defined-out))

; a struct to model the returned object of every Yul ast node
; - mode: 'normal, 'continue, 'break, 'leave, 'return
;   - 'normal: normal execution, no need to change the parent control flow
;   - 'continue: terminate the execution of the current flow and restarts the next iteration (in for loop)
;   - 'break: terminate the execution of the current flow and exit the iteration (in for loop)
;   - 'leave: terminate the execution and exit the function
;     - (note) this signal will propagate all the way back to the function node level
;   - 'return: set by the EVM dialect "return", END EXECUTION and return data to top level caller (?)
;   - 'revert: ???
; - values: the corresponding return values, a list (even for a single value it should be wrapped into a list)
;     - null: means whatever executed has side effects only and does not return anything
(struct ret (mode values) #:mutable #:transparent #:reflection-name 'ret)

; a struct for dispatching function
; - calldata: essentially a list of bitvectors (8 bit / 1 byte per location)
;             about the encoding see ABI Specification or an example: https://ethereum.stackexchange.com/questions/52989/what-is-calldata
;   - caller: string, direct caller
;   - origin: string, original caller that starts the transaction, tx.origin
;   - gas: bv256
;   - wei: bv256
;   - cntx: 'current or 'execution, usually a contract uses 'current, and a delegate call on library uses 'execution
;           'execution context will inherit the caller's context, including address/rstack/etc.
(struct callpack (caller origin gas wei calldata cntx) #:transparent #:reflection-name 'callpack)

; a struct for storing parameters for the vm
; there are two passing modes for reusing the parent parameters
; - inherit: directly copy the parameters
; - reset: reset to default values
(struct param (
    ; parameters for deploy process
    ; - the current code scope: 'start, 'constructor, 'dispatcher
    ; - mode: inherit
    ; - default: 'start
    ; - for both deploy mode and interpret mode
    code-scope 

    ; parameters for interpretation
    ; - by default, a block will create a local scope
    ; - but if the block is attached to a function definition, since the calling mechanism requires
    ;   the scope to be initialized from the function definition level, then in this case a block should NOT create any new scope
    ; - (todo) if the block is attached to a for loop, the local scope is also created and managed on the for loop level
    ;   so also in this case a block should NOT create any new scope
    ; - mode: reset
    ; - default: #t
    ; - interpret mode only
    new-block-scope 
) #:transparent #:reflection-name 'param)
; customized copy method of the param struct with reusing mode integrated
(define (copy-param obj-param #:code-scope [code-scope null] #:new-block-scope [new-block-scope null])
    (define code-scope-0 (if (null? code-scope) (param-code-scope obj-param) code-scope)) ; inherit
    (define new-block-scope-0 (if (null? new-block-scope) #t new-block-scope)) ; reset
    (param code-scope-0 new-block-scope-0)
)
(define (default-param) (param 'start #t))