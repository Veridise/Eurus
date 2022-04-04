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

(define server-path "./examples/interface-test/Server.eurus.json")
(define client-path "./examples/interface-test/Client.eurus.json")
(define config-path "./examples/vm-shared-config.json")

; debugger
(define debugger-addr #x47)

; manager
(define mgr0 (new yul-manager%))

; server initialization
(printf "# initializing server...\n")
(define server-account #x333)
(define server-addr #x999)
(send mgr0 deploy server-path config-path server-addr) ; deploy server
(define server-vm (send mgr0 get-vm server-addr)) ; get vm
(define cp-server-constructor (let (
  [gas 0] [wei 0] [cd (construct-calldata "constructor()" (list ))])
  (callpack debugger-addr gas wei cd))) ; construct callpack
(send server-vm construct cp-server-constructor) ; call server constructor

; call server method
(printf "# calling server...\n")
(define cp-server-addition (let (
  [gas 0] [wei 0] [cd (construct-calldata "addition(uint256,uint256)" (list (cons "uint256" 9) (cons "uint256" 5)))])
  (callpack debugger-addr gas wei cd))) ; construct callpack
(define ret0 (send server-vm dispatch cp-server-addition)) ; get result
(define res0 (apply concat (car (ret-values ret0)))) ; assemble readable result
(printf "# ret0 is: ~a.\n" ret0)

; client initialization
(printf "# initializing client...\n")
(define client-account #x222)
(define client-addr #x111)
(send mgr0 deploy client-path config-path client-addr) ; deploy client
(define client-vm (send mgr0 get-vm client-addr)) ; get vm
(define cp-client-constructor (let (
  [gas 0] [wei 0] [cd (construct-calldata "constructor(uint256)" (list (cons "uint256" server-addr)))])
  (callpack debugger-addr gas wei cd))) ; construct callpack
(send client-vm construct cp-client-constructor) ; call client constructor

; call client method
(printf "# calling client...\n")
(define cp-client-addition (let (
  [gas 0] [wei 0] [cd (construct-calldata "call_addition(uint256,uint256)" (list (cons "uint256" 9) (cons "uint256" 5)))])
  (callpack debugger-addr gas wei cd))) ; construct callpack
(define ret1 (send client-vm dispatch cp-client-addition)) ; get result
(define res1 (apply concat (car (ret-values ret1)))) ; assemble readable result
