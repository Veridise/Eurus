#lang rosette
(require json)
(require "./eurus/zhash.rkt")
(require "./eurus/yul-manager.rkt")
(require "./eurus/yul-config.rkt")
(require "./eurus/yul-utils.rkt")
(require "./eurus/yul-vm.rkt")
(require "./eurus/yul-parser.rkt")
(require "./eurus/yul-grammar.rkt")

(define my-json (string->jsexpr (file->string "./examples/SimpleYulTest0.json")))
(define my-config (string->jsexpr (file->string "./examples/SimpleYulTest0.config.json")))
(define my-yul (parse-yul-json my-json))

(define my-manager (new yul-manager%))

(define my-vm (new yul-vm%))
(send my-vm deploy my-yul my-config)
; (get-field dispatcher-node my-vm)
(hash-keys (get-field constructor-function-book my-vm))
(hash-keys (get-field dispatcher-function-book my-vm))

; (hash-ref (get-field constructor-function-book my-vm) "constructor_addition")
; (hash-ref (get-field dispatcher-function-book my-vm) "dispatcher_subtraction")

(send my-vm construct)