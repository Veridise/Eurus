import sys
import os
import json
import argparse
import re

from antlr4 import *
from YulAntlr.YulLexer import YulLexer
from YulAntlr.YulParser import YulParser
from YulAntlr.YulListener import YulListener

class YulPrintListener(YulListener):
    def __init__(self, *args, **kwargs):
        super(YulPrintListener, self).__init__(*args, **kwargs)
        self.built_string = ""

    def clear_built_string(self):
        self.built_string = ""

    # Enter a parse tree produced by YulParser#start.
    def enterStart(self, ctx:YulParser.StartContext):
        self.built_string += "[\"start\","

    # Exit a parse tree produced by YulParser#start.
    def exitStart(self, ctx:YulParser.StartContext):
        self.built_string += "],"

    # Enter a parse tree produced by YulParser#yul_object.
    def enterYul_object(self, ctx:YulParser.Yul_objectContext):
        self.built_string += "[\"yul_object\","

    # Exit a parse tree produced by YulParser#yul_object.
    def exitYul_object(self, ctx:YulParser.Yul_objectContext):
        self.built_string += "],"

    # Enter a parse tree produced by YulParser#yul_data.
    def enterYul_data(self, ctx:YulParser.Yul_dataContext):
        self.built_string += "[\"yul_data\","

    # Exit a parse tree produced by YulParser#yul_data.
    def exitYul_data(self, ctx:YulParser.Yul_dataContext):
        self.built_string += "],"

    # Enter a parse tree produced by YulParser#yul_code.
    def enterYul_code(self, ctx:YulParser.Yul_codeContext):
        self.built_string += "[\"yul_code\","

    # Exit a parse tree produced by YulParser#yul_code.
    def exitYul_code(self, ctx:YulParser.Yul_codeContext):
        self.built_string += "],"

    # Enter a parse tree produced by YulParser#yul_if.
    def enterYul_if(self, ctx:YulParser.Yul_ifContext):
        self.built_string += "[\"yul_if\","

    # Exit a parse tree produced by YulParser#yul_if.
    def exitYul_if(self, ctx:YulParser.Yul_ifContext):
        self.built_string += "],"

    # Enter a parse tree produced by YulParser#yul_switch.
    def enterYul_switch(self, ctx:YulParser.Yul_switchContext):
        self.built_string += "[\"yul_switch\","

    # Exit a parse tree produced by YulParser#yul_switch.
    def exitYul_switch(self, ctx:YulParser.Yul_switchContext):
        self.built_string += "],"

    # Enter a parse tree produced by YulParser#yul_case.
    def enterYul_case(self, ctx:YulParser.Yul_caseContext):
        self.built_string += "[\"yul_case\","

    # Exit a parse tree produced by YulParser#yul_case.
    def exitYul_case(self, ctx:YulParser.Yul_caseContext):
        self.built_string += "],"

    # Enter a parse tree produced by YulParser#yul_default.
    def enterYul_default(self, ctx:YulParser.Yul_defaultContext):
        self.built_string += "[\"yul_default\","

    # Exit a parse tree produced by YulParser#yul_default.
    def exitYul_default(self, ctx:YulParser.Yul_defaultContext):
        self.built_string += "],"

    # Enter a parse tree produced by YulParser#yul_for_loop.
    def enterYul_for_loop(self, ctx:YulParser.Yul_for_loopContext):
        self.built_string += "[\"yul_for_loop\","

    # Exit a parse tree produced by YulParser#yul_for_loop.
    def exitYul_for_loop(self, ctx:YulParser.Yul_for_loopContext):
        self.built_string += "],"

    # Enter a parse tree produced by YulParser#yul_break.
    def enterYul_break(self, ctx:YulParser.Yul_breakContext):
        self.built_string += "[\"yul_break\","

    # Exit a parse tree produced by YulParser#yul_break.
    def exitYul_break(self, ctx:YulParser.Yul_breakContext):
        self.built_string += "],"

    # Enter a parse tree produced by YulParser#yul_continue.
    def enterYul_continue(self, ctx:YulParser.Yul_continueContext):
        self.built_string += "[\"yul_continue\","

    # Exit a parse tree produced by YulParser#yul_continue.
    def exitYul_continue(self, ctx:YulParser.Yul_continueContext):
        self.built_string += "],"

    # Enter a parse tree produced by YulParser#yul_leave.
    def enterYul_leave(self, ctx:YulParser.Yul_leaveContext):
        self.built_string += "[\"yul_leave\","

    # Exit a parse tree produced by YulParser#yul_leave.
    def exitYul_leave(self, ctx:YulParser.Yul_leaveContext):
        self.built_string += "],"

    # Enter a parse tree produced by YulParser#yul_function_definition.
    def enterYul_function_definition(self, ctx:YulParser.Yul_function_definitionContext):
        self.built_string += "[\"yul_function_definition\","

    # Exit a parse tree produced by YulParser#yul_function_definition.
    def exitYul_function_definition(self, ctx:YulParser.Yul_function_definitionContext):
        self.built_string += "],"

    # Enter a parse tree produced by YulParser#yul_variable_declaration.
    def enterYul_variable_declaration(self, ctx:YulParser.Yul_variable_declarationContext):
        self.built_string += "[\"yul_variable_declaration\","

    # Exit a parse tree produced by YulParser#yul_variable_declaration.
    def exitYul_variable_declaration(self, ctx:YulParser.Yul_variable_declarationContext):
        self.built_string += "],"

    # Enter a parse tree produced by YulParser#yul_function_arg_list.
    def enterYul_function_arg_list(self, ctx:YulParser.Yul_function_arg_listContext):
        self.built_string += "[\"yul_function_arg_list\","

    # Exit a parse tree produced by YulParser#yul_function_arg_list.
    def exitYul_function_arg_list(self, ctx:YulParser.Yul_function_arg_listContext):
        self.built_string += "],"

    # Enter a parse tree produced by YulParser#yul_function_ret_list.
    def enterYul_function_ret_list(self, ctx:YulParser.Yul_function_ret_listContext):
        self.built_string += "[\"yul_function_ret_list\","

    # Exit a parse tree produced by YulParser#yul_function_ret_list.
    def exitYul_function_ret_list(self, ctx:YulParser.Yul_function_ret_listContext):
        self.built_string += "],"

    # Enter a parse tree produced by YulParser#yul_typed_identifier_list.
    def enterYul_typed_identifier_list(self, ctx:YulParser.Yul_typed_identifier_listContext):
        self.built_string += "[\"yul_typed_identifier_list\","

    # Exit a parse tree produced by YulParser#yul_typed_identifier_list.
    def exitYul_typed_identifier_list(self, ctx:YulParser.Yul_typed_identifier_listContext):
        self.built_string += "],"

    # Enter a parse tree produced by YulParser#yul_identifier_list.
    def enterYul_identifier_list(self, ctx:YulParser.Yul_identifier_listContext):
        self.built_string += "[\"yul_identifier_list\","

    # Exit a parse tree produced by YulParser#yul_identifier_list.
    def exitYul_identifier_list(self, ctx:YulParser.Yul_identifier_listContext):
        self.built_string += "],"

    # Enter a parse tree produced by YulParser#yul_block.
    def enterYul_block(self, ctx:YulParser.Yul_blockContext):
        self.built_string += "[\"yul_block\","

    # Exit a parse tree produced by YulParser#yul_block.
    def exitYul_block(self, ctx:YulParser.Yul_blockContext):
        self.built_string += "],"

    # Enter a parse tree produced by YulParser#yul_statement.
    def enterYul_statement(self, ctx:YulParser.Yul_statementContext):
        self.built_string += "[\"yul_statement\","

    # Exit a parse tree produced by YulParser#yul_statement.
    def exitYul_statement(self, ctx:YulParser.Yul_statementContext):
        self.built_string += "],"

    # Enter a parse tree produced by YulParser#yul_assignment.
    def enterYul_assignment(self, ctx:YulParser.Yul_assignmentContext):
        self.built_string += "[\"yul_assignment\","

    # Exit a parse tree produced by YulParser#yul_assignment.
    def exitYul_assignment(self, ctx:YulParser.Yul_assignmentContext):
        self.built_string += "],"

    # Enter a parse tree produced by YulParser#yul_expression.
    def enterYul_expression(self, ctx:YulParser.Yul_expressionContext):
        self.built_string += "[\"yul_expression\","

    # Exit a parse tree produced by YulParser#yul_expression.
    def exitYul_expression(self, ctx:YulParser.Yul_expressionContext):
        self.built_string += "],"

    # Enter a parse tree produced by YulParser#yul_function_call.
    def enterYul_function_call(self, ctx:YulParser.Yul_function_callContext):
        self.built_string += "[\"yul_function_call\","

    # Exit a parse tree produced by YulParser#yul_function_call.
    def exitYul_function_call(self, ctx:YulParser.Yul_function_callContext):
        self.built_string += "],"

    # Enter a parse tree produced by YulParser#yul_literal.
    def enterYul_literal(self, ctx:YulParser.Yul_literalContext):
        self.built_string += "[\"yul_literal\","

    # Exit a parse tree produced by YulParser#yul_literal.
    def exitYul_literal(self, ctx:YulParser.Yul_literalContext):
        self.built_string += "],"

    # Enter a parse tree produced by YulParser#yul_number_literal.
    def enterYul_number_literal(self, ctx:YulParser.Yul_number_literalContext):
        self.built_string += "[\"yul_number_literal\","

    # Exit a parse tree produced by YulParser#yul_number_literal.
    def exitYul_number_literal(self, ctx:YulParser.Yul_number_literalContext):
        self.built_string += "],"

    # Enter a parse tree produced by YulParser#yul_true_literal.
    def enterYul_true_literal(self, ctx:YulParser.Yul_true_literalContext):
        self.built_string += "[\"yul_true_literal\",\"{}\",],".format(ctx.TRUE_LITERAL())
    # Exit a parse tree produced by YulParser#yul_true_literal.
    def exitYul_true_literal(self, ctx:YulParser.Yul_true_literalContext):
        pass

    # Enter a parse tree produced by YulParser#yul_false_literal.
    def enterYul_false_literal(self, ctx:YulParser.Yul_false_literalContext):
        self.built_string += "[\"yul_false_literal\",\"{}\",],".format(ctx.FALSE_LITERAL())
    # Exit a parse tree produced by YulParser#yul_false_literal.
    def exitYul_false_literal(self, ctx:YulParser.Yul_false_literalContext):
        pass

    # Enter a parse tree produced by YulParser#yul_hex_number.
    def enterYul_hex_number(self, ctx:YulParser.Yul_hex_numberContext):
        self.built_string += "[\"yul_hex_number\",\"{}\",],".format(ctx.HEX_NUMBER())
    # Exit a parse tree produced by YulParser#yul_hex_number.
    def exitYul_hex_number(self, ctx:YulParser.Yul_hex_numberContext):
        pass

    # Enter a parse tree produced by YulParser#yul_dec_number.
    def enterYul_dec_number(self, ctx:YulParser.Yul_dec_numberContext):
        self.built_string += "[\"yul_dec_number\",\"{}\",],".format(ctx.DEC_NUMBER())
    # Exit a parse tree produced by YulParser#yul_dec_number.
    def exitYul_dec_number(self, ctx:YulParser.Yul_dec_numberContext):
        pass

    # Enter a parse tree produced by YulParser#yul_type_name.
    def enterYul_type_name(self, ctx:YulParser.Yul_type_nameContext):
        self.built_string += "[\"yul_type_name\",\"{}\",],".format(ctx.ID_LITERAL())
    # Exit a parse tree produced by YulParser#yul_type_name.
    def exitYul_type_name(self, ctx:YulParser.Yul_type_nameContext):
        pass

    # Enter a parse tree produced by YulParser#yul_identifier.
    def enterYul_identifier(self, ctx:YulParser.Yul_identifierContext):
        self.built_string += "[\"yul_identifier\",\"{}\",],".format(ctx.ID_LITERAL())
    # Exit a parse tree produced by YulParser#yul_identifier.
    def exitYul_identifier(self, ctx:YulParser.Yul_identifierContext):
        pass

    # Enter a parse tree produced by YulParser#yul_string_literal.
    def enterYul_string_literal(self, ctx:YulParser.Yul_string_literalContext):
        # note: get rid of quotes around string literal
        self.built_string += "[\"yul_string_literal\",{},],".format(ctx.STRING_LITERAL())
    # Exit a parse tree produced by YulParser#yul_string_literal.
    def exitYul_string_literal(self, ctx:YulParser.Yul_string_literalContext):
        pass

ap = argparse.ArgumentParser()
ap.add_argument("--yul", default=None, help="input yul file")
ap.add_argument("--verbose", default=False, help="show more info for debugging")

if __name__ == "__main__":
    args = ap.parse_args()
    if args.yul is None:
        sys.exit("# Incomplete arguments. Use -h to see options.")

    output_json_file =args.yul.replace(".yul",".json")
    # output_config_file = args.yul.replace(".yul",".config.json")

    if args.verbose: print("# loading yul...")
    input_stream = FileStream(args.yul)

    # step 1: make sure there's only one contract in one file (this file)
    with open(args.yul, "r") as f:
        tmp_yul_str = f.read()
    nobj = re.findall(r"object \".*?\" \{", tmp_yul_str)
    if len(nobj) != 2:
        sys.exit("# Yul structure is not valid, object number should be 2, got: {}".format(len(nobj)))

    # # step 2: extract call code for dispatcher and pack into a mapping
    # output_config = {
    #     # call code is unique, but function name may not be unique due to polymorphism
    #     # but function signature is unique since Solidity is statically typed
    #     "call_code_to_function_name": {},

    #     # signature here is structured, e.g., ["function_name", "arg0_type", "arg1_type", ...]
    #     # (note) no return type is presented because it's missing in the yul comment notations
    #     "call_code_to_function_signature": {}, 
    # }
    # with open(args.yul, "r") as f:
    #     tmp_yul_lines = f.readlines()
    # switch_on = False
    # code_on = False
    # curr_code = None
    # for dline in tmp_yul_lines:
    #     if (not switch_on) and (not code_on) and dline.strip() == "switch selector":
    #         switch_on = True
    #         continue
    #     if switch_on and (not code_on) and dline.strip().startswith("case 0x"):
    #         code_on = True
    #         curr_code = dline.replace("case","").strip()
    #         continue
    #     if switch_on and code_on and dline.strip().startswith("//"):
    #         curr_sig = dline.replace("//","").strip()
    #         curr_name = curr_sig[:curr_sig.index("(")]
    #         curr_params = curr_sig[curr_sig.index("(")+1:-1].split(",") # fixme: could be wrong for array/mappings, check it out
    #         # remove empty string
    #         curr_params = [p for p in curr_params if len(p.strip())>0]
    #         output_config["call_code_to_function_name"][curr_code] = curr_name
    #         output_config["call_code_to_function_signature"][curr_code] = [curr_name]+curr_params
    #         code_on = False
    #         curr_code = None
    #     if switch_on and (not code_on) and dline.strip().startswith("default"):
    #         switch_on = False
    #         # done here, can exit now
    #         break

    # step 3: start parsing
    if args.verbose: print("# loading grammar...")
    lexer = YulLexer(input_stream)
    stream = CommonTokenStream(lexer)
    parser = YulParser(stream)

    if args.verbose: print("# parsing...")
    tree = parser.start()

    printer = YulPrintListener()
    printer.clear_built_string()
    walker = ParseTreeWalker()
    walker.walk(printer, tree)

    # print(printer.built_string)

    if args.verbose: print("# translating...")
    # note: should remove commas in postfix
    n = eval(printer.built_string.strip(","))

    if args.verbose: print("# writing to json...")
    # write parsed yul json
    with open(output_json_file, "w") as f:
        json.dump(n, f, indent="    ")
    # write config json
    # with open(output_config_file, "w") as f:
    #     json.dump(output_config, f, indent="    ")
    if args.verbose: print("# done.")
