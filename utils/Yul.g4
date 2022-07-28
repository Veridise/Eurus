// Define a grammar called Yul
grammar Yul;
start : yul_object ;

yul_object : KW_OBJECT yul_string_literal '{' ( yul_code yul_object? ) '}' ;
yul_code : KW_CODE yul_block ;
yul_if : KW_IF yul_expression yul_block ;
yul_switch : KW_SWITCH yul_expression ( yul_case+ yul_default? | yul_default ) ;
yul_case : KW_CASE yul_literal yul_block ; // note: case only accepts literals, not expressions
yul_default : KW_DEFAULT yul_block ;
yul_for_loop : KW_FOR yul_block yul_expression yul_block yul_block ;
yul_break : KW_BREAK ;
yul_continue : KW_CONTINUE ;
yul_leave : KW_LEAVE ;
yul_function_definition : KW_FUNCTION yul_identifier '(' yul_function_arg_list? ')' ( '->' yul_function_ret_list )? yul_block ;
yul_variable_declaration : KW_LET yul_typed_identifier_list ( ':=' yul_expression )? ;

// this two tell apart different matches in yul_function_definition
yul_function_arg_list : yul_typed_identifier_list ;
yul_function_ret_list : yul_typed_identifier_list ;
yul_typed_identifier_list : yul_identifier ( ':' yul_type_name )? ( ',' yul_identifier ( ':' yul_type_name )? )* ;
yul_identifier_list : yul_identifier ( ',' yul_identifier )* ;

yul_block : '{' yul_statement* '}' ;

yul_statement : yul_block
              | yul_expression
              | yul_function_definition
              | yul_variable_declaration
              | yul_assignment
              | yul_if
              | yul_expression
              | yul_switch
              | yul_for_loop
              | yul_break
              | yul_continue
              | yul_leave ;

yul_assignment : yul_identifier_list ':=' yul_expression ;
yul_expression : yul_function_call
               | yul_identifier
               | yul_literal ;
yul_function_call : yul_identifier '(' ( yul_expression ( ',' yul_expression )* )? ')' ;

yul_literal : ( yul_number_literal | yul_string_literal | yul_true_literal | yul_false_literal ) ( ':' yul_type_name )? ;

yul_number_literal : yul_hex_number
                   | yul_dec_number ;
yul_true_literal : TRUE_LITERAL ;
yul_false_literal : FALSE_LITERAL ;

yul_hex_number : HEX_NUMBER ;
yul_dec_number : DEC_NUMBER ;

yul_type_name : ID_LITERAL ;
yul_identifier : ID_LITERAL ;

KW_OBJECT : 'object' ;
KW_CODE : 'code' ;
KW_IF : 'if' ;
KW_SWITCH : 'switch' ;
KW_CASE : 'case' ;
KW_DEFAULT : 'default' ;
KW_FOR : 'for' ;
KW_BREAK : 'break' ;
KW_CONTINUE : 'continue' ;
KW_LEAVE : 'leave' ;
KW_FUNCTION : 'function' ;
KW_LET : 'let' ;

yul_string_literal : STRING_LITERAL ;
STRING_LITERAL : StringLiteralFragment+;
StringLiteralFragment : '"' DoubleQuotedStringCharacter* '"'
                      | '\'' SingleQuotedStringCharacter* '\'' ;
fragment DoubleQuotedStringCharacter : ~["\r\n\\] | ('\\' .) ;
fragment SingleQuotedStringCharacter : ~['\r\n\\] | ('\\' .) ;

ID_LITERAL : IdentifierStart IdentifierPart* ;
fragment IdentifierStart : [a-zA-Z$_] ;
fragment IdentifierPart : [a-zA-Z0-9$_] ;

TRUE_LITERAL : 'true';
FALSE_LITERAL : 'false';

DEC_NUMBER : DecimalDigits DecimalDigits* ;
fragment DecimalDigits : [0-9] [0-9]* ;

HEX_NUMBER : '0x' HexDigits ;
fragment HexDigits : HexCharacter HexCharacter* ;
fragment HexCharacter : [0-9A-Fa-f] ;

COMMENT
	: '/*' .*? '*/' -> channel(HIDDEN) ;
LINE_COMMENT
	: '//' ~[\r\n]* -> channel(HIDDEN) ;
WS
	: [ \t\r\n\u000C]+ -> skip ;