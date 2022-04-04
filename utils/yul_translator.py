import sys
import os
import json
import argparse
import re
import copy

class YulTranslator:
    def __init__(self, *args, **kwargs):
        super(YulTranslator, self).__init__(*args, **kwargs)
        self.translation_sequence = ["rewrite_constructor_arguments", "remove_post_constructor_datacall"]

    def translate(self, original_yul, translation_sequence=None):
        if translation_sequence is None:
            translation_sequence = self.translation_sequence

        curr_yul = copy.deepcopy(original_yul)
        # apply the translations one by one
        for tname in translation_sequence:
            _m = getattr(self, "_t_{}".format(tname))
            curr_yul = _m(curr_yul)

        return curr_yul

    # see NOTES.md
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
            "// let " + r"\1" + " := allocate_unbounded()" + r"\2" +\
            "// codecopy(" + r"\3" + ", dataoffset(\"" + r"\4" + "\"), datasize(\"" + r"\5" + "\"))" + r"\2" +\
            "// setimmutable(" + r"\7" + ", \"" + r"\8" + "\", mload(" + r"\9" + "))" + r"\10" +\
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
            "// let " + r"\1" + " := allocate_unbounded()" + r"\2" +\
            "// codecopy(" + r"\3" + ", dataoffset(\"" + r"\4" + "\"), datasize(\"" + r"\5" + "\"))" + r"\2" +\
            "// setimmutable(" + r"\7" + ", \"" + r"\8" + "\", mload(" + r"\9" + "))" + r"\10" +\
            "// setimmutable(" + r"\11" + ", \"" + r"\12" + "\", mload(" + r"\13" + "))" + r"\14" +\
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

        # (fixme) I just removed the "mload" matching, but this could generalize to everywhere
        pattern4 = re.compile(
            r"codecopy\((.*), dataoffset\(\"(.*)\"\), datasize\(\"(.*)\"\)\)" + r"([ \n]*)" +\
            r"setimmutable\((.*), \"(.*)\", (.*)\)" + r"([ \n]*)" +\
            r"setimmutable\((.*), \"(.*)\", (.*)\)" + r"([ \n]*)" +\
            r"return\((.*), datasize\(\"(.*)\"\)\)" + r"([ \n]*)", re.MULTILINE)
        new_str4 = pattern4.sub(
            "// adapted by Eurus: remove_post_constructor_datacall" + r"\4" +\
            "// codecopy(" + r"\1" + ", dataoffset(\"" + r"\2" + "\"), datasize(\"" + r"\3" + "\"))" + r"\4" +\
            "// setimmutable(" + r"\5" + ", \"" + r"\6" + "\", " + r"\7" + ")" + r"\4" +\
            "// setimmutable(" + r"\9" + ", \"" + r"\10" + "\", " + r"\11" + ")" + r"\12" +\
            "// return(" + r"\13" + ", datasize(\"" + r"\14" + "\"))" + r"\15",
            new_str3
        )

        return new_str4


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
