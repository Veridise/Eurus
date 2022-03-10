#lang rosette
(require json)
(require "./yul-parser.rkt")
(require "./yul-grammar.rkt")

(define my-json (string->jsexpr (file->string "./tests/SimpleYulTest0.json")))
(define res (parse-yul-json my-json))