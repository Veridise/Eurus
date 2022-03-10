#lang racket
; this parses the Yul json file into internal structs, so that rosette's destruct can handle it
(require "./yul-utils.rkt")
(require "./yul-grammar.rkt")
(provide (all-defined-out))

(define (parse-yul-json arg-node)
    (match arg-node
        [(list "start" m-object)
            (yul:start 
                (parse-yul-json m-object)
            )
        ]

        [(list "yul_object" m-string-literal m-code (list "yul_object" m0-res ...))
            ; constructor object
            (yul:cobj
                (parse-yul-json m-string-literal)
                (parse-yul-json m-code)
                (parse-yul-json (list-ref arg-node 3))
            )
        ]

        [(list "yul_object" m-string-literal m-code (list "yul_data" m0-res ...))
            ; dispatcher object
            (yul:dobj
                (parse-yul-json m-string-literal)
                (parse-yul-json m-code)
                (parse-yul-json (list-ref arg-node 3))
            )
        ]

        [(list "yul_data" m0 m1)
            (yul:data
                (parse-yul-json m0)
                (parse-yul-json m1)
            )
        ]

        [(list "yul_code" m-block)
            (yul:code 
                (parse-yul-json m-block)
            )
        ]

        [(list-rest "yul_block" ms-statement)
            (yul:block 
                (for/list ([m ms-statement]) (parse-yul-json m))
            )
        ]

        [(list "yul_statement" m)
            (yul:statement 
                (parse-yul-json m)
            )
        ]

        [(list "yul_function_definition" m-yul-identifier m-arglist m-retlist m-block)
            (yul:fundef
                (parse-yul-json m-yul-identifier)
                (parse-yul-json m-arglist)
                (parse-yul-json m-retlist)
                (parse-yul-json m-block)
            )
        ]
        ; yul_function_definition variant: no ret list
        [(list "yul_function_definition" m-yul-identifier (list "yul_function_arg_list" m0) m-block)
            (yul:fundef
                (parse-yul-json m-yul-identifier)
                (parse-yul-json (list "yul_function_arg_list" m0))
                null
                (parse-yul-json m-block)
            )
        ]
        ; yul_function_definition variant: no arg list
        [(list "yul_function_definition" m-yul-identifier (list "yul_function_ret_list" m0) m-block)
            (yul:fundef
                (parse-yul-json m-yul-identifier)
                null
                (parse-yul-json (list "yul_function_arg_list" m0))
                (parse-yul-json m-block)
            )
        ]
        ; yul_function_definition variant: no arg and ret list
        [(list "yul_function_definition" m-yul-identifier m-block)
            (yul:fundef
                (parse-yul-json m-yul-identifier)
                null
                null
                (parse-yul-json m-block)
            )
        ]

        [(list "yul_variable_declaration" m-yul-typed-identifier-list m-expression)
            (yul:vardec
                (parse-yul-json m-yul-typed-identifier-list)
                (parse-yul-json m-expression)
            )
        ]
        ; yul_variable_declaration variant: no expression
        [(list "yul_variable_declaration" m-yul-typed-identifier-list)
            (yul:vardec
                (parse-yul-json m-yul-typed-identifier-list)
                null
            )
        ]

        [(list "yul_assignment" m-identifier-list m-expression)
            (yul:assignment
                (parse-yul-json m-identifier-list)
                (parse-yul-json m-expression)
            )
        ]

        [(list "yul_expression" m)
            (yul:expression 
                (parse-yul-json m)
            )
        ]

        [(list "yul_if" m-expression m-block)
            (yul:if
                (parse-yul-json m-expression)
                (parse-yul-json m-block)
            )
        ]

        [(list-rest "yul_switch" m-expression ms)
            (define case-list (for/list ([m ms] #:when (equal? "yul_case" (list-ref m 0))) m))
            (define default-list (for/list ([m ms] #:when (equal? "yul_default" (list-ref m 0))) m))
            (when (> (length default-list) 1) (println-and-exit (format "# [exception]: more than one default branches, got: ~a." (length default-list))))
            (yul:switch
                (parse-yul-json m-expression)
                (for/list ([m case-list]) (parse-yul-json m))
                (parse-yul-json (list-ref default-list 0))
            )
        ]

        [(list "yul_case" m-literal m-block)
            (yul:case
                (parse-yul-json m-literal)
                (parse-yul-json m-block)
            )
        ]

        [(list "yul_default" m-block)
            (yul:default
                (parse-yul-json m-block)
            )
        ]

        [(list "yul_for_loop" m-init-block m-expression m-post-block m-body-block)
            (yul:forloop
                (parse-yul-json m-init-block)
                (parse-yul-json m-expression)
                (parse-yul-json m-post-block)
                (parse-yul-json m-body-block)
            )
        ]

        [(list "yul_break") (yul:break null)]
        [(list "yul_continue") (yul:continue null)]
        [(list "yul_leave") (yul:leave null)]

        [(list-rest "yul_function_call" m-identifier ms-expression)
            (yul:funcall
                (parse-yul-json m-identifier)
                (for/list ([m ms-expression]) (parse-yul-json m))
            )
        ]

        ; terminal
        [(list "yul_identifier" m)
            (yul:id m)
        ]

        ; unwrap
        [(list-rest "yul_identifier_list" ms)
            (for/list ([m ms]) (parse-yul-json m))
        ]

        [(list "yul_type_name" m)
            (yul:type m)
        ]

        ; unwrap
        [(list-rest "yul_typed_identifier_list" ms)
            (define tmp-ids (list))
            (define tmp-types (list))
            (for ([i (range (length ms))] #:when (equal? "yul_identifier" (car (list-ref ms i))))
                (set! tmp-ids (rcons (list-ref ms i) tmp-ids)) ; identifier
                (if (< (+ 1 i) (length ms))
                    (if (equal? "yul_type_name" (car (list-ref ms (+ 1 i))))
                        (set! tmp-types (rcons (list-ref ms (+ 1 i)) tmp-types)) ; type name
                        (set! tmp-types (rcons null tmp-types)) ; no type
                    )
                    (set! tmp-types (rcons null tmp-types)) ; no type
                )
            )
            (for/list ([m0 tmp-ids] [m1 tmp-types])
                (if (null? m1)
                    (parse-yul-json m0) ; only id
                    (yul:tid (parse-yul-json m0) (parse-yul-json m1)) ; typed id
                )
            )
        ]

        ; delegate to yul_typed_identifier_list
        [(list "yul_function_arg_list" m)
            (parse-yul-json m)
        ]

        ; delegate to yul_typed_identifier_list
        [(list "yul_function_ret_list" m)
            (parse-yul-json m)
        ]

        [(list "yul_literal" m)
            (yul:literal
                (parse-yul-json m)
                null
            )
        ]

        [(list "yul_literal" m-res m-type)
            (yul:literal
                (parse-yul-json m-res)
                (parse-yul-json m-type)
            )
        ]

        [(list "yul_number_literal" m)
            (yul:number
                (parse-yul-json m)
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
            (yul:string m)
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
        [_ (println-and-exit (format "# [exception][yul-parser]: unsupported node, got: ~a." arg-node))]
    )
)