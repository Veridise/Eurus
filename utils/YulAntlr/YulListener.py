# Generated from Yul.g4 by ANTLR 4.8
from antlr4 import *
if __name__ is not None and "." in __name__:
    from .YulParser import YulParser
else:
    from YulParser import YulParser

# This class defines a complete listener for a parse tree produced by YulParser.
class YulListener(ParseTreeListener):

    # Enter a parse tree produced by YulParser#start.
    def enterStart(self, ctx:YulParser.StartContext):
        pass

    # Exit a parse tree produced by YulParser#start.
    def exitStart(self, ctx:YulParser.StartContext):
        pass


    # Enter a parse tree produced by YulParser#yul_object.
    def enterYul_object(self, ctx:YulParser.Yul_objectContext):
        pass

    # Exit a parse tree produced by YulParser#yul_object.
    def exitYul_object(self, ctx:YulParser.Yul_objectContext):
        pass


    # Enter a parse tree produced by YulParser#yul_code.
    def enterYul_code(self, ctx:YulParser.Yul_codeContext):
        pass

    # Exit a parse tree produced by YulParser#yul_code.
    def exitYul_code(self, ctx:YulParser.Yul_codeContext):
        pass


    # Enter a parse tree produced by YulParser#yul_if.
    def enterYul_if(self, ctx:YulParser.Yul_ifContext):
        pass

    # Exit a parse tree produced by YulParser#yul_if.
    def exitYul_if(self, ctx:YulParser.Yul_ifContext):
        pass


    # Enter a parse tree produced by YulParser#yul_switch.
    def enterYul_switch(self, ctx:YulParser.Yul_switchContext):
        pass

    # Exit a parse tree produced by YulParser#yul_switch.
    def exitYul_switch(self, ctx:YulParser.Yul_switchContext):
        pass


    # Enter a parse tree produced by YulParser#yul_case.
    def enterYul_case(self, ctx:YulParser.Yul_caseContext):
        pass

    # Exit a parse tree produced by YulParser#yul_case.
    def exitYul_case(self, ctx:YulParser.Yul_caseContext):
        pass


    # Enter a parse tree produced by YulParser#yul_default.
    def enterYul_default(self, ctx:YulParser.Yul_defaultContext):
        pass

    # Exit a parse tree produced by YulParser#yul_default.
    def exitYul_default(self, ctx:YulParser.Yul_defaultContext):
        pass


    # Enter a parse tree produced by YulParser#yul_for_loop.
    def enterYul_for_loop(self, ctx:YulParser.Yul_for_loopContext):
        pass

    # Exit a parse tree produced by YulParser#yul_for_loop.
    def exitYul_for_loop(self, ctx:YulParser.Yul_for_loopContext):
        pass


    # Enter a parse tree produced by YulParser#yul_break.
    def enterYul_break(self, ctx:YulParser.Yul_breakContext):
        pass

    # Exit a parse tree produced by YulParser#yul_break.
    def exitYul_break(self, ctx:YulParser.Yul_breakContext):
        pass


    # Enter a parse tree produced by YulParser#yul_continue.
    def enterYul_continue(self, ctx:YulParser.Yul_continueContext):
        pass

    # Exit a parse tree produced by YulParser#yul_continue.
    def exitYul_continue(self, ctx:YulParser.Yul_continueContext):
        pass


    # Enter a parse tree produced by YulParser#yul_leave.
    def enterYul_leave(self, ctx:YulParser.Yul_leaveContext):
        pass

    # Exit a parse tree produced by YulParser#yul_leave.
    def exitYul_leave(self, ctx:YulParser.Yul_leaveContext):
        pass


    # Enter a parse tree produced by YulParser#yul_function_definition.
    def enterYul_function_definition(self, ctx:YulParser.Yul_function_definitionContext):
        pass

    # Exit a parse tree produced by YulParser#yul_function_definition.
    def exitYul_function_definition(self, ctx:YulParser.Yul_function_definitionContext):
        pass


    # Enter a parse tree produced by YulParser#yul_variable_declaration.
    def enterYul_variable_declaration(self, ctx:YulParser.Yul_variable_declarationContext):
        pass

    # Exit a parse tree produced by YulParser#yul_variable_declaration.
    def exitYul_variable_declaration(self, ctx:YulParser.Yul_variable_declarationContext):
        pass


    # Enter a parse tree produced by YulParser#yul_function_arg_list.
    def enterYul_function_arg_list(self, ctx:YulParser.Yul_function_arg_listContext):
        pass

    # Exit a parse tree produced by YulParser#yul_function_arg_list.
    def exitYul_function_arg_list(self, ctx:YulParser.Yul_function_arg_listContext):
        pass


    # Enter a parse tree produced by YulParser#yul_function_ret_list.
    def enterYul_function_ret_list(self, ctx:YulParser.Yul_function_ret_listContext):
        pass

    # Exit a parse tree produced by YulParser#yul_function_ret_list.
    def exitYul_function_ret_list(self, ctx:YulParser.Yul_function_ret_listContext):
        pass


    # Enter a parse tree produced by YulParser#yul_typed_identifier_list.
    def enterYul_typed_identifier_list(self, ctx:YulParser.Yul_typed_identifier_listContext):
        pass

    # Exit a parse tree produced by YulParser#yul_typed_identifier_list.
    def exitYul_typed_identifier_list(self, ctx:YulParser.Yul_typed_identifier_listContext):
        pass


    # Enter a parse tree produced by YulParser#yul_identifier_list.
    def enterYul_identifier_list(self, ctx:YulParser.Yul_identifier_listContext):
        pass

    # Exit a parse tree produced by YulParser#yul_identifier_list.
    def exitYul_identifier_list(self, ctx:YulParser.Yul_identifier_listContext):
        pass


    # Enter a parse tree produced by YulParser#yul_block.
    def enterYul_block(self, ctx:YulParser.Yul_blockContext):
        pass

    # Exit a parse tree produced by YulParser#yul_block.
    def exitYul_block(self, ctx:YulParser.Yul_blockContext):
        pass


    # Enter a parse tree produced by YulParser#yul_statement.
    def enterYul_statement(self, ctx:YulParser.Yul_statementContext):
        pass

    # Exit a parse tree produced by YulParser#yul_statement.
    def exitYul_statement(self, ctx:YulParser.Yul_statementContext):
        pass


    # Enter a parse tree produced by YulParser#yul_assignment.
    def enterYul_assignment(self, ctx:YulParser.Yul_assignmentContext):
        pass

    # Exit a parse tree produced by YulParser#yul_assignment.
    def exitYul_assignment(self, ctx:YulParser.Yul_assignmentContext):
        pass


    # Enter a parse tree produced by YulParser#yul_expression.
    def enterYul_expression(self, ctx:YulParser.Yul_expressionContext):
        pass

    # Exit a parse tree produced by YulParser#yul_expression.
    def exitYul_expression(self, ctx:YulParser.Yul_expressionContext):
        pass


    # Enter a parse tree produced by YulParser#yul_function_call.
    def enterYul_function_call(self, ctx:YulParser.Yul_function_callContext):
        pass

    # Exit a parse tree produced by YulParser#yul_function_call.
    def exitYul_function_call(self, ctx:YulParser.Yul_function_callContext):
        pass


    # Enter a parse tree produced by YulParser#yul_literal.
    def enterYul_literal(self, ctx:YulParser.Yul_literalContext):
        pass

    # Exit a parse tree produced by YulParser#yul_literal.
    def exitYul_literal(self, ctx:YulParser.Yul_literalContext):
        pass


    # Enter a parse tree produced by YulParser#yul_number_literal.
    def enterYul_number_literal(self, ctx:YulParser.Yul_number_literalContext):
        pass

    # Exit a parse tree produced by YulParser#yul_number_literal.
    def exitYul_number_literal(self, ctx:YulParser.Yul_number_literalContext):
        pass


    # Enter a parse tree produced by YulParser#yul_true_literal.
    def enterYul_true_literal(self, ctx:YulParser.Yul_true_literalContext):
        pass

    # Exit a parse tree produced by YulParser#yul_true_literal.
    def exitYul_true_literal(self, ctx:YulParser.Yul_true_literalContext):
        pass


    # Enter a parse tree produced by YulParser#yul_false_literal.
    def enterYul_false_literal(self, ctx:YulParser.Yul_false_literalContext):
        pass

    # Exit a parse tree produced by YulParser#yul_false_literal.
    def exitYul_false_literal(self, ctx:YulParser.Yul_false_literalContext):
        pass


    # Enter a parse tree produced by YulParser#yul_hex_number.
    def enterYul_hex_number(self, ctx:YulParser.Yul_hex_numberContext):
        pass

    # Exit a parse tree produced by YulParser#yul_hex_number.
    def exitYul_hex_number(self, ctx:YulParser.Yul_hex_numberContext):
        pass


    # Enter a parse tree produced by YulParser#yul_dec_number.
    def enterYul_dec_number(self, ctx:YulParser.Yul_dec_numberContext):
        pass

    # Exit a parse tree produced by YulParser#yul_dec_number.
    def exitYul_dec_number(self, ctx:YulParser.Yul_dec_numberContext):
        pass


    # Enter a parse tree produced by YulParser#yul_type_name.
    def enterYul_type_name(self, ctx:YulParser.Yul_type_nameContext):
        pass

    # Exit a parse tree produced by YulParser#yul_type_name.
    def exitYul_type_name(self, ctx:YulParser.Yul_type_nameContext):
        pass


    # Enter a parse tree produced by YulParser#yul_identifier.
    def enterYul_identifier(self, ctx:YulParser.Yul_identifierContext):
        pass

    # Exit a parse tree produced by YulParser#yul_identifier.
    def exitYul_identifier(self, ctx:YulParser.Yul_identifierContext):
        pass


    # Enter a parse tree produced by YulParser#yul_string_literal.
    def enterYul_string_literal(self, ctx:YulParser.Yul_string_literalContext):
        pass

    # Exit a parse tree produced by YulParser#yul_string_literal.
    def exitYul_string_literal(self, ctx:YulParser.Yul_string_literalContext):
        pass



del YulParser