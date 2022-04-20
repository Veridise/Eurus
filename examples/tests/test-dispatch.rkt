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

(define yul-path "./examples/SimpleYulTest1.json")
(define config-path "./examples/vm-shared-config.json")

(define mgr0 (new yul-manager%))
(send mgr0 deploy yul-path config-path #x999)

(define vm0 (send mgr0 get-vm #x999))
(send vm0 construct)

(define cd0 (construct-calldata "dispatcher_subtraction(uint256,uint256)" (list (cons "uint256" 9) (cons "uint256" 5))))
(define cp0 (callpack #x101 cd0))

(send vm0 dispatch cp0)