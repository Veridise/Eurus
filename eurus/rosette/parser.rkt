#lang rosette
; this parses the Yul json file into internal structs, so that rosette's destruct can handle it
(require 
    (prefix-in tokamak: "../tokamak.rkt") ; shared
    (prefix-in yul: "./grammar.rkt")
    (prefix-in utils: "./utils.rkt")
)
(provide (all-defined-out))

; arg-submap: hash for string to substitute (now it's just for string)
(define (parse-yul-json arg-node arg-submap)
    (match arg-node
        [(list "start" m-object)
            (yul:start 
                (parse-yul-json m-object arg-submap)
            )
        ]

        [(list "yul_object" m-string-literal m-code (list "yul_object" m0-res ...))
            ; constructor object
            (yul:cobj
                (parse-yul-json m-string-literal arg-submap)
                (parse-yul-json m-code arg-submap)
                (parse-yul-json (list-ref arg-node 3) arg-submap)
            )
        ]

        [(list "yul_object" m-string-literal m-code)
            ; dispatcher object
            (yul:dobj
                (parse-yul-json m-string-literal arg-submap)
                (parse-yul-json m-code arg-submap)
            )
        ]
        [(list "yul_object" m-string-literal m-code)
            ; alternative dispatcher object
            ; no data field there
            (yul:dobj
                (parse-yul-json m-string-literal arg-submap)
                (parse-yul-json m-code arg-submap)
                null
            )
        ]

        [(list "yul_code" m-block)
            (yul:code 
                (parse-yul-json m-block arg-submap)
            )
        ]

        [(list-rest "yul_block" ms-statement)
            (yul:block 
                (for/list ([m ms-statement]) (parse-yul-json m arg-submap))
            )
        ]

        [(list "yul_statement" m)
            (yul:statement 
                (parse-yul-json m arg-submap)
            )
        ]

        [(list "yul_function_definition" m-yul-identifier m-arglist m-retlist m-block)
            (yul:fundef
                (parse-yul-json m-yul-identifier arg-submap)
                (parse-yul-json m-arglist arg-submap)
                (parse-yul-json m-retlist arg-submap)
                (parse-yul-json m-block arg-submap)
            )
        ]
        ; yul_function_definition variant: no ret list
        [(list "yul_function_definition" m-yul-identifier (list "yul_function_arg_list" m0) m-block)
            (yul:fundef
                (parse-yul-json m-yul-identifier arg-submap)
                (parse-yul-json (list "yul_function_arg_list" m0) arg-submap)
                null
                (parse-yul-json m-block arg-submap)
            )
        ]
        ; yul_function_definition variant: no arg list
        [(list "yul_function_definition" m-yul-identifier (list "yul_function_ret_list" m0) m-block)
            (yul:fundef
                (parse-yul-json m-yul-identifier arg-submap)
                null
                (parse-yul-json (list "yul_function_arg_list" m0) arg-submap)
                (parse-yul-json m-block arg-submap)
            )
        ]
        ; yul_function_definition variant: no arg and ret list
        [(list "yul_function_definition" m-yul-identifier m-block)
            (yul:fundef
                (parse-yul-json m-yul-identifier arg-submap)
                null
                null
                (parse-yul-json m-block arg-submap)
            )
        ]

        [(list "yul_variable_declaration" m-yul-typed-identifier-list m-expression)
            (yul:vardec
                (parse-yul-json m-yul-typed-identifier-list arg-submap)
                (parse-yul-json m-expression arg-submap)
            )
        ]
        ; yul_variable_declaration variant: no expression
        [(list "yul_variable_declaration" m-yul-typed-identifier-list)
            (yul:vardec
                (parse-yul-json m-yul-typed-identifier-list arg-submap)
                null
            )
        ]

        [(list "yul_assignment" m-identifier-list m-expression)
            (yul:assignment
                (parse-yul-json m-identifier-list arg-submap)
                (parse-yul-json m-expression arg-submap)
            )
        ]

        [(list "yul_expression" m)
            (yul:expression 
                (parse-yul-json m arg-submap)
            )
        ]

        [(list "yul_if" m-expression m-block)
            (yul:if
                (parse-yul-json m-expression arg-submap)
                (parse-yul-json m-block arg-submap)
            )
        ]

        [(list-rest "yul_switch" m-expression ms)
            (define case-list (for/list ([m ms] #:when (equal? "yul_case" (list-ref m 0))) m))
            (define default-list (for/list ([m ms] #:when (equal? "yul_default" (list-ref m 0))) m))
            (when (> (length default-list) 1) 
                (tokamak:exit "# [exception]: more than one default branches, got: ~a." (length default-list)))
            (yul:switch
                (parse-yul-json m-expression arg-submap)
                (for/list ([m case-list]) (parse-yul-json m arg-submap))
                (if (empty? default-list)
                    ; nothing in default
                    (yul:default (yul:block null))
                    ; there's something in default
                    (parse-yul-json (list-ref default-list 0) arg-submap)
                )
            )
        ]

        [(list "yul_case" m-literal m-block)
            (yul:case
                (parse-yul-json m-literal arg-submap)
                (parse-yul-json m-block arg-submap)
            )
        ]

        [(list "yul_default" m-block)
            (yul:default
                (parse-yul-json m-block arg-submap)
            )
        ]

        [(list "yul_for_loop" m-init-block m-expression m-post-block m-body-block)
            (yul:forloop
                (parse-yul-json m-init-block arg-submap)
                (parse-yul-json m-expression arg-submap)
                (parse-yul-json m-post-block arg-submap)
                (parse-yul-json m-body-block arg-submap)
            )
        ]

        [(list "yul_break") (yul:break null)]
        [(list "yul_continue") (yul:continue null)]
        [(list "yul_leave") (yul:leave null)]

        [(list-rest "yul_function_call" m-identifier ms-expression)
            (yul:funcall
                (parse-yul-json m-identifier arg-submap)
                (for/list ([m ms-expression]) (parse-yul-json m arg-submap))
            )
        ]

        ; terminal
        [(list "yul_identifier" m)
            (yul:id m)
        ]

        ; unwrap
        [(list-rest "yul_identifier_list" ms)
            (for/list ([m ms]) (parse-yul-json m arg-submap))
        ]

        [(list "yul_type_name" m)
            (yul:type m)
        ]

        ; unwrap
        [(list-rest "yul_typed_identifier_list" ms)
            (define tmp-ids (list))
            (define tmp-types (list))
            (for ([i (range (length ms))] #:when (equal? "yul_identifier" (car (list-ref ms i))))
                (set! tmp-ids (utils:rcons (list-ref ms i) tmp-ids)) ; identifier
                (if (< (+ 1 i) (length ms))
                    (if (equal? "yul_type_name" (car (list-ref ms (+ 1 i))))
                        (set! tmp-types (utils:rcons (list-ref ms (+ 1 i)) tmp-types)) ; type name
                        (set! tmp-types (utils:rcons null tmp-types)) ; no type
                    )
                    (set! tmp-types (utils:rcons null tmp-types)) ; no type
                )
            )
            (for/list ([m0 tmp-ids] [m1 tmp-types])
                (if (null? m1)
                    (parse-yul-json m0 arg-submap) ; only id
                    (yul:tid (parse-yul-json m0 arg-submap) (parse-yul-json m1 arg-submap)) ; typed id
                )
            )
        ]

        ; delegate to yul_typed_identifier_list
        [(list "yul_function_arg_list" m)
            (parse-yul-json m arg-submap)
        ]

        ; delegate to yul_typed_identifier_list
        [(list "yul_function_ret_list" m)
            (parse-yul-json m arg-submap)
        ]

        [(list "yul_literal" m)
            (yul:literal
                (parse-yul-json m arg-submap)
                null
            )
        ]

        [(list "yul_literal" m-res m-type)
            (yul:literal
                (parse-yul-json m-res arg-submap)
                (parse-yul-json m-type arg-submap)
            )
        ]

        [(list "yul_number_literal" m)
            (yul:number
                (parse-yul-json m arg-submap)
            )
        ]

        ; terminal, convert to decimal number directly
        [(list "yul_hex_number" m)
            ; (yul:hex (string->number (substring m 2) 16))
            (string->number (substring m 2) 16)
        ]

        ; terminal, convert to decimal number directly
        [(list "yul_dec_number" m)
            ; (yul:dec (string->number m 10))
            (string->number m 10)
        ]

        ; terminal
        [(list "yul_string_literal" m)
            (if (hash-has-key? arg-submap m)
                ; there's such key, use new string
                (yul:string (hash-ref arg-submap m))
                ; no such key, use original
                (yul:string m)
            )
        ]

        ; terminal
        [(list "yul_true_literal" m)
            (yul:true null)
        ]

        ; terminal
        [(list "yul_false_literal" m)
            (yul:false null)
        ]

        ; otherwise, exit right now for debugging, this is not supposed to appear
        [_ (tokamak:exit "# [exception][yul-parser]: unsupported node, got: ~a." arg-node)]
    )
)