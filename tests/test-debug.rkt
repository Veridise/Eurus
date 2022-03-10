#lang rosette
(require json)
(require "./zhash.rkt")
(require "./yul-manager.rkt")
(require "./yul-config.rkt")
(require "./yul-utils.rkt")
(require "./yul-vm.rkt")
(require "./yul-parser.rkt")
(require "./yul-grammar.rkt")

(define my-json (string->jsexpr (file->string "./tests/SimpleYulTest0.json")))
(define my-config (string->jsexpr (file->string "./tests/SimpleYulTest0.config.json")))
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