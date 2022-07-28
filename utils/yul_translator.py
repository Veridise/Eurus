import sys
import os
import json
import argparse
import re
import copy

class YulTranslator:
    def __init__(self, *args, **kwargs):
        super(YulTranslator, self).__init__(*args, **kwargs)
        self.translation_sequence = [
            "remove_data_metadata", "rewrite_constructor_arguments", "remove_post_constructor_datacall",
            "hijack_dispatcher_revert", "hijack_dispatcher_miss",
            # eurus series
            "hijack_eurus_prank_once",
            "hijack_eurus_assume", "hijack_eurus_assert", "hijack_eurus_says", 
            "hijack_eurus_symbolic_uintX", "hijack_eurus_symbolic_intX", 
            "hijack_eurus_symbolic_address", "hijack_eurus_symbolic_bool",
            # rosette series
            "hijack_rosette_assume", "hijack_rosette_assert", "hijack_rosette_cex", "hijack_rosette_solve",
        ]

    def translate(self, original_yul, translation_sequence=None):
        if translation_sequence is None:
            translation_sequence = self.translation_sequence

        curr_yul = copy.deepcopy(original_yul)
        # apply the translations one by one
        for tname in translation_sequence:
            _m = getattr(self, "_t_{}".format(tname))
            curr_yul = _m(curr_yul)

        return curr_yul

    def _t_hijack_eurus_says(self, yul_str):
        pattern0 = re.compile(
            r"( *)function fun_eurus_says_(.*?)\((.*?)\) {\n" +\
            r"(.*?)\n" +\
            r"( *)revert\((.*?), sub\((.*?), (.*?)\)\)\n" +\
            r"(.*?)\n" +\
            r"\1}\n"
            , re.DOTALL)
        new_str = pattern0.sub(
            r"\1" + "function fun_eurus_says_" + r"\2" + "(" + r"\3" + ") {\n" +\
            r"\4" + "\n" +\
            r"\5" + "// adapted by Eurus: hijack_eurus_says\n" +\
            r"\5" + "eurus_says(" + r"\6" + ", sub(" + r"\7" + ", " + r"\8" + "))\n" +\
            r"\9" + "\n" +\
            r"\1" + "}\n"
            , yul_str
        )
        return new_str

    def _t_hijack_eurus_prank_once(self, yul_str):
        pattern0 = re.compile(
            r"( *)function fun_eurus_prank_once_(.*?)\((.*?)\) {\n" +\
            r"(.*?)\n" +\
            r"( *)revert\((.*?), sub\((.*?), (.*?)\)\)\n" +\
            r"(.*?)\n" +\
            r"\1}\n"
            , re.DOTALL)
        new_str = pattern0.sub(
            r"\1" + "function fun_eurus_prank_once_" + r"\2" + "(" + r"\3" + ") {\n" +\
            r"\5" + "// adapted by Eurus: hijack_eurus_prank_once\n" +\
            r"\5" + "eurus_prank_once(" + r"\3" + ")\n" +\
            r"\1" + "}\n"
            , yul_str
        )
        return new_str

    def _t_hijack_eurus_assume(self, yul_str):
        pattern0 = re.compile(
            r"( *)function fun_eurus_assume_(.*?)\((.*?), (.*?)\) {\n" +\
            r"(.*?)\n" +\
            r"( *)revert\((.*?), sub\((.*?), (.*?)\)\)\n" +\
            r"(.*?)\n" +\
            r"\1}\n"
            , re.DOTALL)
        new_str = pattern0.sub(
            r"\1" + "function fun_eurus_assume_" + r"\2" + "(" + r"\3" + ", " + r"\4" + ") {\n" +\
            r"\5" + "\n" +\
            r"\6" + "// adapted by Eurus: hijack_eurus_assume\n" +\
            r"\6" + "eurus_assume(" + r"\7" + ", sub(" + r"\8" + ", " + r"\9" + "), " + r"\4" + ")\n" +\
            r"\g<10>" + "\n" +\
            r"\1" + "}\n"
            , yul_str
        )
        return new_str

    def _t_hijack_eurus_assert(self, yul_str):
        pattern0 = re.compile(
            r"( *)function fun_eurus_assert_(.*?)\((.*?), (.*?)\) {\n" +\
            r"(.*?)\n" +\
            r"( *)revert\((.*?), sub\((.*?), (.*?)\)\)\n" +\
            r"(.*?)\n" +\
            r"\1}\n"
            , re.DOTALL)
        new_str = pattern0.sub(
            r"\1" + "function fun_eurus_assert_" + r"\2" + "(" + r"\3" + ", " + r"\4" + ") {\n" +\
            r"\5" + "\n" +\
            r"\6" + "// adapted by Eurus: hijack_eurus_assert\n" +\
            r"\6" + "eurus_assert(" + r"\7" + ", sub(" + r"\8" + ", " + r"\9" + "), " + r"\4" + ")\n" +\
            r"\g<10>" + "\n" +\
            r"\1" + "}\n"
            , yul_str
        )
        return new_str

    def _t_hijack_rosette_assume(self, yul_str):
        pattern0 = re.compile(
            r"( *)function fun_rosette_assume_(.*?)\((.*?), (.*?)\) {\n" +\
            r"(.*?)\n" +\
            r"( *)revert\((.*?), sub\((.*?), (.*?)\)\)\n" +\
            r"(.*?)\n" +\
            r"\1}\n"
            , re.DOTALL)
        new_str = pattern0.sub(
            r"\1" + "function fun_rosette_assume_" + r"\2" + "(" + r"\3" + ", " + r"\4" + ") {\n" +\
            r"\5" + "\n" +\
            r"\6" + "// adapted by Eurus: hijack_rosette_assume\n" +\
            r"\6" + "rosette_assume(" + r"\7" + ", sub(" + r"\8" + ", " + r"\9" + "), " + r"\4" + ")\n" +\
            r"\g<10>" + "\n" +\
            r"\1" + "}\n"
            , yul_str
        )
        return new_str

    def _t_hijack_rosette_assert(self, yul_str):
        pattern0 = re.compile(
            r"( *)function fun_rosette_assert_(.*?)\((.*?), (.*?)\) {\n" +\
            r"(.*?)\n" +\
            r"( *)revert\((.*?), sub\((.*?), (.*?)\)\)\n" +\
            r"(.*?)\n" +\
            r"\1}\n"
            , re.DOTALL)
        new_str = pattern0.sub(
            r"\1" + "function fun_rosette_assert_" + r"\2" + "(" + r"\3" + ", " + r"\4" + ") {\n" +\
            r"\5" + "\n" +\
            r"\6" + "// adapted by Eurus: hijack_rosette_assert\n" +\
            r"\6" + "rosette_assert(" + r"\7" + ", sub(" + r"\8" + ", " + r"\9" + "), " + r"\4" + ")\n" +\
            r"\g<10>" + "\n" +\
            r"\1" + "}\n"
            , yul_str
        )
        return new_str

    def _t_hijack_rosette_cex(self, yul_str):
        pattern0 = re.compile(
            r"( *)function fun_rosette_cex_(.*?)\((.*?), (.*?)\) {\n" +\
            r"(.*?)\n" +\
            r"( *)revert\((.*?), sub\((.*?), (.*?)\)\)\n" +\
            r"(.*?)\n" +\
            r"\1}\n"
            , re.DOTALL)
        new_str = pattern0.sub(
            r"\1" + "function fun_rosette_cex_" + r"\2" + "(" + r"\3" + ", " + r"\4" + ") {\n" +\
            r"\5" + "\n" +\
            r"\6" + "// adapted by Eurus: hijack_rosette_cex\n" +\
            r"\6" + "rosette_cex(" + r"\7" + ", sub(" + r"\8" + ", " + r"\9" + "), " + r"\4" + ")\n" +\
            r"\g<10>" + "\n" +\
            r"\1" + "}\n"
            , yul_str
        )
        return new_str

    def _t_hijack_rosette_solve(self, yul_str):
        pattern0 = re.compile(
            r"( *)function fun_rosette_solve_(.*?)\((.*?), (.*?)\) {\n" +\
            r"(.*?)\n" +\
            r"( *)revert\((.*?), sub\((.*?), (.*?)\)\)\n" +\
            r"(.*?)\n" +\
            r"\1}\n"
            , re.DOTALL)
        new_str = pattern0.sub(
            r"\1" + "function fun_rosette_solve_" + r"\2" + "(" + r"\3" + ", " + r"\4" + ") {\n" +\
            r"\5" + "\n" +\
            r"\6" + "// adapted by Eurus: hijack_rosette_solve\n" +\
            r"\6" + "rosette_solve(" + r"\7" + ", sub(" + r"\8" + ", " + r"\9" + "), " + r"\4" + ")\n" +\
            r"\g<10>" + "\n" +\
            r"\1" + "}\n"
            , yul_str
        )
        return new_str

    # (note) all uints are mapped to eurus_symbolic_uint256
    def _t_hijack_eurus_symbolic_uintX(self, yul_str):
        pattern0 = re.compile(
            r"( *)function fun_eurus_symbolic_uint(.*?)_(.*?)\((.*?)\) -> (.*?) {\n" +\
            r"(.*?)\n" +\
            r"( *)revert\((.*?), sub\((.*?), (.*?)\)\)\n" +\
            r"(.*?)\n" +\
            r"\1}\n"
            , re.DOTALL)
        new_str = pattern0.sub(
            r"\1" + "function fun_eurus_symbolic_uint" + r"\2" + "_" + r"\3" + "(" + r"\4" + ") -> " + r"\5" + " {\n" +\
            r"\6" + "\n" +\
            r"\7" + "// adapted by Eurus: hijack_eurus_symbolic_uintX\n" +\
            r"\7" + r"\5" " := eurus_symbolic_uint256(" + r"\8" + ", sub(" + r"\9" + ", " + r"\g<10>" + "))\n" +\
            r"\g<11>" + "\n" +\
            r"\1" + "}\n"
            , yul_str
        )
        return new_str

    # (note) all ints are mapped to eurus_symbolic_uint256
    def _t_hijack_eurus_symbolic_intX(self, yul_str):
        pattern0 = re.compile(
            r"( *)function fun_eurus_symbolic_int(.*?)_(.*?)\((.*?)\) -> (.*?) {\n" +\
            r"(.*?)\n" +\
            r"( *)revert\((.*?), sub\((.*?), (.*?)\)\)\n" +\
            r"(.*?)\n" +\
            r"\1}\n"
            , re.DOTALL)
        new_str = pattern0.sub(
            r"\1" + "function fun_eurus_symbolic_int" + r"\2" + "_" + r"\3" + "(" + r"\4" + ") -> " + r"\5" + " {\n" +\
            r"\6" + "\n" +\
            r"\7" + "// adapted by Eurus: hijack_eurus_symbolic_intX\n" +\
            r"\7" + r"\5" " := eurus_symbolic_uint256(" + r"\8" + ", sub(" + r"\9" + ", " + r"\g<10>" + "))\n" +\
            r"\g<11>" + "\n" +\
            r"\1" + "}\n"
            , yul_str
        )
        return new_str

    def _t_hijack_eurus_symbolic_address(self, yul_str):
        pattern0 = re.compile(
            r"( *)function fun_eurus_symbolic_address_(.*?)\((.*?)\) -> (.*?) {\n" +\
            r"(.*?)\n" +\
            r"( *)revert\((.*?), sub\((.*?), (.*?)\)\)\n" +\
            r"(.*?)\n" +\
            r"\1}\n"
            , re.DOTALL)
        new_str = pattern0.sub(
            r"\1" + "function fun_eurus_symbolic_address_" + r"\2" + "(" + r"\3" + ") -> " + r"\4" + " {\n" +\
            r"\5" + "\n" +\
            r"\6" + "// adapted by Eurus: hijack_eurus_symbolic_address\n" +\
            r"\6" + r"\4" + " := eurus_symbolic_address(" + r"\7" + ", sub(" + r"\8" + ", " + r"\9" + "))\n" +\
            r"\g<10>" + "\n" +\
            r"\1" + "}\n"
            , yul_str
        )
        return new_str

    def _t_hijack_eurus_symbolic_bool(self, yul_str):
        pattern0 = re.compile(
            r"( *)function fun_eurus_symbolic_bool_(.*?)\((.*?)\) -> (.*?) {\n" +\
            r"(.*?)\n" +\
            r"( *)revert\((.*?), sub\((.*?), (.*?)\)\)\n" +\
            r"(.*?)\n" +\
            r"\1}\n"
            , re.DOTALL)
        new_str = pattern0.sub(
            r"\1" + "function fun_eurus_symbolic_bool_" + r"\2" + "(" + r"\3" + ") -> " + r"\4" + " {\n" +\
            r"\5" + "\n" +\
            r"\6" + "// adapted by Eurus: hijack_eurus_symbolic_bool\n" +\
            r"\6" + r"\4" + " := eurus_symbolic_bool(" + r"\7" + ", sub(" + r"\8" + ", " + r"\9" + "))\n" +\
            r"\g<10>" + "\n" +\
            r"\1" + "}\n"
            , yul_str
        )
        return new_str

    # display more useful information or customize the behavior 
    # when dispatcher can't find a function 
    def _t_hijack_dispatcher_revert(self, yul_str):
        pattern0 = re.compile(
            r"( *)function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74\(\) {\n" +\
            r".*?\n" +\
            r"\1}\n"
            , re.DOTALL)
        new_str = pattern0.sub(
            r"\1" + "function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {\n" +\
            r"\1" + "    // adapted by Eurus: hijack_dispatcher_revert\n" +\
            r"\1" + "    eurus_dispatcher_revert()\n" +\
            r"\1}\n",
            yul_str
        )
        return new_str

    # display more useful information or customize the behavior 
    # when dispatcher can't find a function 
    def _t_hijack_dispatcher_miss(self, yul_str):
        pattern0 = re.compile(
            r"( *)let selector := (.*?)\n" +\
            r"(.*?)\n" +\
            r"\1" + r"default {}\n"
            , re.DOTALL)
        new_str = pattern0.sub(
            r"\1" + "let selector := " + r"\2" + "\n" +\
            r"\3" + "\n" +\
            r"\1" + "default {\n" +\
            r"\1" + "    // adapted by Eurus: hijack_dispatcher_miss\n" +\
            r"\1" + "    eurus_dispatcher_miss(selector)\n" +\
            r"\1" + "}\n",
            yul_str
        )
        return new_str

    # this removes the extra line of data - metadata from the dispatch node
    # since it's not useful in the current version and would conflict with the use of "data"
    # as local keyword in previous versions
    # observed in 0.8.11
    def _t_remove_data_metadata(self, yul_str):
        pattern0 = re.compile(r"data \".metadata\" hex.*")
        new_str = pattern0.sub("", yul_str)
        return new_str

    # see NOTES.md
    # Solidity uses only 4 bytes for hashing the function signature
    def _t_rewrite_constructor_arguments(self, yul_str): 
        pattern0 = re.compile(
            r"let programSize := datasize\(\"(.*)\"\)" + r"([ \n]*)" +\
            r"let argSize := sub\(codesize\(\), programSize\)" + r"([ \n]*)" +\
            r"let memoryDataOffset := allocate_memory\(argSize\)" + r"([ \n]*)" +\
            r"codecopy\(memoryDataOffset, programSize, argSize\)" + r"([ \n]*)", re.MULTILINE)
        new_str = pattern0.sub(
            "// let programSize := datasize(\"" + r"\1" + "\")" + r"\2" +\
            "// let argSize := sub(codesize(), programSize)" + r"\2" +\
            "// let memoryDataOffset := allocate_memory(argSize)" + r"\2" +\
            "// codecopy(memoryDataOffset, programSize, argSize)" + r"\2" +\
            "// adapted by Eurus: rewrite_constructor_arguments" + r"\2" +\
            "let argSize := sub(calldatasize(), 4)" + r"\2" +\
            "let memoryDataOffset := allocate_memory(argSize)" + r"\2" +\
            "calldatacopy(memoryDataOffset, 4, argSize)" + r"\3",
            yul_str
        )
        return new_str

    # usually at the end of the constructor Yul returns the location of the dispatcher,
    # which is not needed here since dispatcher call will be handled by the vm and manager,
    # and there's no need to track this
    def _t_remove_post_constructor_datacall(self, yul_str):
        pattern0 = re.compile(
            r"let (.*) := allocate_unbounded\(\)" + r"([ \n]*)" +\
            r"codecopy\((.*), dataoffset\(\"(.*)\"\), datasize\(\"(.*)\"\)\)" + r"([ \n]*)" +\
            r"return\((.*), datasize\(\"(.*)\"\)\)" + r"([ \n]*)", re.MULTILINE)
        new_str0 = pattern0.sub(
            "// adapted by Eurus: remove_post_constructor_datacall" + r"\2" +\
            "// let " + r"\1" + " := allocate_unbounded()" + r"\2" +\
            "// codecopy(" + r"\3" + ", dataoffset(\"" + r"\4" + "\"), datasize(\"" + r"\5" + "\"))" + r"\2" +\
            "// return(" + r"\7" + ", datasize(\"" + r"\8" + "\"))" + r"\9",
            yul_str
        )

        pattern1 = re.compile(
            r"let (.*) := allocate_unbounded\(\)" + r"([ \n]*)" +\
            r"codecopy\((.*), dataoffset\(\"(.*)\"\), datasize\(\"(.*)\"\)\)" + r"([ \n]*)" +\
            r"setimmutable\((.*), \"(.*)\", mload\((.*)\)\)" + r"([ \n]*)" +\
            r"return\((.*), datasize\(\"(.*)\"\)\)" + r"([ \n]*)", re.MULTILINE)
        new_str1 = pattern1.sub(
            "// adapted by Eurus: remove_post_constructor_datacall" + r"\2" +\
            "let " + r"\1" + " := allocate_unbounded()" + r"\2" +\
            "// codecopy(" + r"\3" + ", dataoffset(\"" + r"\4" + "\"), datasize(\"" + r"\5" + "\"))" + r"\2" +\
            "setimmutable(" + r"\7" + ", \"" + r"\8" + "\", mload(" + r"\9" + "))" + r"\10" +\
            "// return(" + r"\11" + ", datasize(\"" + r"\12" + "\"))" + r"\13",
            new_str0
        )

        pattern2 = re.compile(
            r"let (.*) := allocate_unbounded\(\)" + r"([ \n]*)" +\
            r"codecopy\((.*), dataoffset\(\"(.*)\"\), datasize\(\"(.*)\"\)\)" + r"([ \n]*)" +\
            r"setimmutable\((.*), \"(.*)\", mload\((.*)\)\)" + r"([ \n]*)" +\
            r"setimmutable\((.*), \"(.*)\", mload\((.*)\)\)" + r"([ \n]*)" +\
            r"return\((.*), datasize\(\"(.*)\"\)\)" + r"([ \n]*)", re.MULTILINE)
        new_str2 = pattern2.sub(
            "// adapted by Eurus: remove_post_constructor_datacall" + r"\2" +\
            "let " + r"\1" + " := allocate_unbounded()" + r"\2" +\
            "// codecopy(" + r"\3" + ", dataoffset(\"" + r"\4" + "\"), datasize(\"" + r"\5" + "\"))" + r"\2" +\
            "setimmutable(" + r"\7" + ", \"" + r"\8" + "\", mload(" + r"\9" + "))" + r"\10" +\
            "setimmutable(" + r"\11" + ", \"" + r"\12" + "\", mload(" + r"\13" + "))" + r"\14" +\
            "// return(" + r"\15" + ", datasize(\"" + r"\16" + "\"))" + r"\17",
            new_str1
        )

        pattern3 = re.compile(
            r"codecopy\((.*), dataoffset\(\"(.*)\"\), datasize\(\"(.*)\"\)\)" + r"([ \n]*)" +\
            r"return\((.*), datasize\(\"(.*)\"\)\)" + r"([ \n]*)", re.MULTILINE)
        new_str3 = pattern3.sub(
            "// adapted by Eurus: remove_post_constructor_datacall" + r"\4" +\
            "// codecopy(" + r"\1" + ", dataoffset(\"" + r"\2" + "\"), datasize(\"" + r"\3" + "\"))" + r"\4" +\
            "// return(" + r"\5" + ", datasize(\"" + r"\6" + "\"))" + r"\7",
            new_str2
        )

        pattern4 = re.compile(
            r"codecopy\((.*), dataoffset\(\"(.*)\"\), datasize\(\"(.*)\"\)\)" + r"([ \n]*)" +\
            r"setimmutable\((.*), \"(.*)\", (.*)\)" + r"([ \n]*)" +\
            r"setimmutable\((.*), \"(.*)\", (.*)\)" + r"([ \n]*)" +\
            r"return\((.*), datasize\(\"(.*)\"\)\)" + r"([ \n]*)", re.MULTILINE)
        new_str4 = pattern4.sub(
            "// adapted by Eurus: remove_post_constructor_datacall" + r"\4" +\
            "// codecopy(" + r"\1" + ", dataoffset(\"" + r"\2" + "\"), datasize(\"" + r"\3" + "\"))" + r"\4" +\
            "setimmutable(" + r"\5" + ", \"" + r"\6" + "\", " + r"\7" + ")" + r"\4" +\
            "setimmutable(" + r"\9" + ", \"" + r"\10" + "\", " + r"\11" + ")" + r"\12" +\
            "// return(" + r"\13" + ", datasize(\"" + r"\14" + "\"))" + r"\15",
            new_str3
        )

        pattern5 = re.compile(
            r"let (.*) := allocate_unbounded\(\)" + r"([ \n]*)" +\
            r"codecopy\((.*), dataoffset\(\"(.*)\"\), datasize\(\"(.*)\"\)\)" + r"([ \n]*)" +\
            r"setimmutable\((.*), \"(.*)\", address\((.*)\)\)" + r"([ \n]*)" +\
            r"return\((.*), datasize\(\"(.*)\"\)\)" + r"([ \n]*)", re.MULTILINE)
        new_str5 = pattern5.sub(
            "// adapted by Eurus: remove_post_constructor_datacall" + r"\2" +\
            "let " + r"\1" + " := allocate_unbounded()" + r"\2" +\
            "// codecopy(" + r"\3" + ", dataoffset(\"" + r"\4" + "\"), datasize(\"" + r"\5" + "\"))" + r"\2" +\
            "setimmutable(" + r"\7" + ", \"" + r"\8" + "\", address(" + r"\9" + "))" + r"\10" +\
            "// return(" + r"\11" + ", datasize(\"" + r"\12" + "\"))" + r"\13",
            new_str4
        )

        pattern6 = re.compile(
            r"let (.*) := allocate_unbounded\(\)" + r"([ \n]*)" +\
            r"codecopy\((.*), dataoffset\(\"(.*)\"\), datasize\(\"(.*)\"\)\)" + r"([ \n]*)" +\
            r"setimmutable\((.*), \"(.*)\", mload\((.*)\)\)" + r"([ \n]*)" +\
            r"setimmutable\((.*), \"(.*)\", mload\((.*)\)\)" + r"([ \n]*)" +\
            r"setimmutable\((.*), \"(.*)\", mload\((.*)\)\)" + r"([ \n]*)" +\
            r"return\((.*), datasize\(\"(.*)\"\)\)" + r"([ \n]*)", re.MULTILINE)
        new_str6 = pattern6.sub(
            "// adapted by Eurus: remove_post_constructor_datacall" + r"\2" +\
            "let " + r"\1" + " := allocate_unbounded()" + r"\2" +\
            "// codecopy(" + r"\3" + ", dataoffset(\"" + r"\4" + "\"), datasize(\"" + r"\5" + "\"))" + r"\2" +\
            "setimmutable(" + r"\7" + ", \"" + r"\8" + "\", mload(" + r"\9" + "))" + r"\10" +\
            "setimmutable(" + r"\11" + ", \"" + r"\12" + "\", mload(" + r"\13" + "))" + r"\14" +\
            "setimmutable(" + r"\15" + ", \"" + r"\16" + "\", mload(" + r"\17" + "))" + r"\18" +\
            "// return(" + r"\19" + ", datasize(\"" + r"\20" + "\"))" + r"\21",
            new_str5
        )

        pattern7 = re.compile(
            r"let (.*) := allocate_unbounded\(\)" + r"([ \n]*)" +\
            r"codecopy\((.*), dataoffset\(\"(.*)\"\), datasize\(\"(.*)\"\)\)" + r"([ \n]*)" +\
            r"setimmutable\((.*), \"(.*)\", mload\((.*)\)\)" + r"([ \n]*)" +\
            r"setimmutable\((.*), \"(.*)\", mload\((.*)\)\)" + r"([ \n]*)" +\
            r"setimmutable\((.*), \"(.*)\", mload\((.*)\)\)" + r"([ \n]*)" +\
            r"setimmutable\((.*), \"(.*)\", mload\((.*)\)\)" + r"([ \n]*)" +\
            r"setimmutable\((.*), \"(.*)\", mload\((.*)\)\)" + r"([ \n]*)" +\
            r"setimmutable\((.*), \"(.*)\", mload\((.*)\)\)" + r"([ \n]*)" +\
            r"setimmutable\((.*), \"(.*)\", mload\((.*)\)\)" + r"([ \n]*)" +\
            r"return\((.*), datasize\(\"(.*)\"\)\)" + r"([ \n]*)", re.MULTILINE)
        new_str7 = pattern7.sub(
            "// adapted by Eurus: remove_post_constructor_datacall" + r"\2" +\
            "let " + r"\1" + " := allocate_unbounded()" + r"\2" +\
            "// codecopy(" + r"\3" + ", dataoffset(\"" + r"\4" + "\"), datasize(\"" + r"\5" + "\"))" + r"\2" +\
            "setimmutable(" + r"\7" + ", \"" + r"\8" + "\", mload(" + r"\9" + "))" + r"\10" +\
            "setimmutable(" + r"\11" + ", \"" + r"\12" + "\", mload(" + r"\13" + "))" + r"\14" +\
            "setimmutable(" + r"\15" + ", \"" + r"\16" + "\", mload(" + r"\17" + "))" + r"\18" +\
            "setimmutable(" + r"\19" + ", \"" + r"\20" + "\", mload(" + r"\21" + "))" + r"\22" +\
            "setimmutable(" + r"\23" + ", \"" + r"\24" + "\", mload(" + r"\25" + "))" + r"\26" +\
            "setimmutable(" + r"\27" + ", \"" + r"\28" + "\", mload(" + r"\29" + "))" + r"\30" +\
            "setimmutable(" + r"\31" + ", \"" + r"\32" + "\", mload(" + r"\33" + "))" + r"\34" +\
            "// return(" + r"\35" + ", datasize(\"" + r"\36" + "\"))" + r"\37",
            new_str6
        )

        return new_str7


ap = argparse.ArgumentParser()
ap.add_argument("--yul", default=None, help="input yul file")
ap.add_argument("--verbose", default=False, help="show more info for debugging")

if __name__ == "__main__":
    args = ap.parse_args()
    if args.yul is None:
        sys.exit("# Incomplete arguments. Use -h to see options.")

    output_yul_file =args.yul.replace(".yul",".eurus.yul")

    if args.verbose: print("# loading yul...")
    with open(args.yul, "r") as f:
        yul_str = f.read()

    if args.verbose: print("# translating...")
    yul_translator = YulTranslator()
    # start translate
    ret_yul_str = yul_translator.translate(yul_str)

    if args.verbose: print("# writing to new yul...")
    with open(output_yul_file, "w") as f:
        f.write(ret_yul_str)

    if args.verbose: print("# done.")
