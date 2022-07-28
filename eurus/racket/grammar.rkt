#lang racket
; yul grammar: https://docs.soliditylang.org/en/latest/yul.html
(provide (all-defined-out))

; formats:
; - all fields use struct names, unless
;   - two or more fields are of the same struct, so you use semantic name to tell them apart
;   - the field is a collection/list, so you add `s` to the end of the struct name
;   - only one trivial (anonymous) field is there, so you use `res`
(struct start (object) #:mutable #:transparent #:reflection-name 'yul:start)
(struct cobj (name code dobj) #:mutable #:transparent #:reflection-name 'yul:cobj) ; top-level constructor object
(struct dobj (name code) #:mutable #:transparent #:reflection-name 'yul:dobj) ; sub-level dispatcher object
(struct code (block) #:mutable #:transparent #:reflection-name 'yul:code)
(struct block (statements) #:mutable #:transparent #:reflection-name 'yul:block) ; statements is a list
(struct statement (res) #:mutable #:transparent #:reflection-name 'yul:statement)
(struct fundef (id args rets block) #:mutable #:transparent #:reflection-name 'yul:fundef) ; FunctionDefinition, args and rets are both list of tids/ids
(struct vardec (ids expression) #:mutable #:transparent #:reflection-name 'yul:vardec) ; VariableDeclaration, ids is a list of tids/ids
(struct assignment (ids expression) #:mutable #:transparent #:reflection-name 'yul:assignment) ; ids is a list of ids
(struct expression (res) #:mutable #:transparent #:reflection-name 'yul:expression)
(struct if (expression block) #:mutable #:transparent #:reflection-name 'yul:if)
(struct switch (expression cases default) #:mutable #:transparent #:reflection-name 'yul:switch)
(struct case (literal block) #:mutable #:transparent #:reflection-name 'yul:case)
(struct default (block) #:mutable #:transparent #:reflection-name 'yul:default)
(struct forloop (init expression post body) #:mutable #:transparent #:reflection-name 'yul:forloop) ; init, post and body are all block
(struct break (res) #:mutable #:transparent #:reflection-name 'yul:break)  ; res is null
(struct continue (res) #:mutable #:transparent #:reflection-name 'yul:continue)  ; res is null
(struct leave (res) #:mutable #:transparent #:reflection-name 'yul:leave) ; res is null
(struct funcall (id expressions) #:mutable #:transparent #:reflection-name 'yul:funcall) ; FunctionCall, expressions is a list
(struct id (res) #:mutable #:transparent #:reflection-name 'yul:id) ; Identifier
(struct type (res) #:mutable #:transparent #:reflection-name 'yul:type) ; TypeName, res is originally id, but here it's extracted directly
(struct tid (id type) #:mutable #:transparent #:reflection-name 'yul:tid) ; id-type pair
(struct literal (res type) #:mutable #:transparent #:reflection-name 'yul:literal) ; type may not be useful here
(struct number (res) #:mutable #:transparent #:reflection-name 'yul:number) ; NumberLiteral
(struct string (res) #:mutable #:transparent #:reflection-name 'yul:string) ; StringLiteral, res is null
(struct true (res) #:mutable #:transparent #:reflection-name 'yul:true) ; TrueLiteral, res is null
(struct false (res) #:mutable #:transparent #:reflection-name 'yul:false) ; FalseLiteral, res is null
; (struct hex (res) #:mutable #:transparent #:reflection-name 'yul:hex) ; HexNumber
; (struct dec (res) #:mutable #:transparent #:reflection-name 'yul:dec) ; DecimalNumber
