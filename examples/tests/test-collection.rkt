#lang rosette
(require json)
(require "./eurus/zhash.rkt")
(require "./eurus/yul-manager.rkt")
(require "./eurus/yul-config.rkt")
(require "./eurus/yul-utils.rkt")
(require "./eurus/yul-vm.rkt")
(require "./eurus/yul-parser.rkt")
(require "./eurus/yul-grammar.rkt")
(require "./eurus/yul-components.rkt")

(define server-path "./examples/collection-test/MyMapping1.eurus.json")
(define config-path "./examples/vm-shared-config.json")

; debugger
(define debugger-addr #x47)

; manager
(define mgr0 (new yul-manager%))

; initialization
(printf "# initializing server...\n")
(define server-addr #x999)
(send mgr0 deploy server-path config-path server-addr) ; deploy server
(define server-vm (send mgr0 get-vm server-addr)) ; get vm
(define cp-server-constructor (let (
  [gas 0] [wei 0] [cd (construct-calldata "constructor()" (list ))])
  (callpack debugger-addr gas wei cd))) ; construct callpack
(send server-vm construct cp-server-constructor) ; call server constructor

; call method
(printf "# calling server...\n")
(define cp-server-method (let (
  [gas 0] [wei 0] [cd (construct-calldata "fetch(address)" (list (cons "address" 9)))])
  (callpack debugger-addr gas wei cd))) ; construct callpack
(define ret0 (send server-vm dispatch cp-server-method)) ; get result
(define res0 (apply concat (car (ret-values ret0)))) ; assemble readable result
