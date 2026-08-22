#!/usr/bin/python3
import argparse
from pathlib import Path

from common import exit_error
from pycparser import parse_file
from pycparser.ast_transforms import c_ast


def processStruct(
    parent: str,
    memberPrefix: str,
    structName: str,
    nameDict: dict[str, dict[str, str]],
    output: list[str],
):
    for memberName in nameDict[structName]:
        typeName = nameDict[structName][memberName]
        declMember = memberName
        if memberPrefix != "":
            declMember = memberPrefix + "." + memberName
        declStructName = structName
        if parent != "":
            declStructName = parent
        declMemberName = declStructName + "_" + declMember.replace(".", "_")
        if structName == "Main":
            output.append(
                f'    DECLARE("Main_{memberName}", offsetof({structName}, {memberName}));'
            )
            output.append(
                f'    DECLARE("{memberName}", offsetof({structName}, {memberName}));'
            )
        elif typeName != "":
            output.append(
                f'    DECLARE("{declMemberName}", offsetof({declStructName}, {declMember}));'
            )
            if typeName in nameDict:
                processStruct(declStructName, declMember, typeName, nameDict, output)
        else:
            output.append(
                f'    DECLARE("{declMemberName}", offsetof({declStructName}, {declMember}));'
            )


def main():
    parser = argparse.ArgumentParser(
        description="Creates a source file containing offsets for structs and enum values."
    )
    parser.add_argument("-o", "--output", type=str, help="The path to the output file.")
    parser.add_argument("header", type=str, help="The path to the header file.")
    args = parser.parse_args()
    outFile: Path = Path(args.output)
    headFile: Path = Path(args.header)
    if not Path.exists(headFile):
        exit_error(f"File {headFile} not found")
    ast = parse_file(headFile, True)
    declareList: list[str] = []
    structDict: dict[str, dict[str, str]] = {}
    enumList: list[tuple[str, int]] = []
    for node in ast.ext:
        if isinstance(node, c_ast.Decl) and isinstance(node.type, c_ast.Struct):
            structNode: c_ast.Struct = node.type
            for member in structNode.decls:
                if not member.bitsize:
                    if structNode.name not in structDict:
                        structDict[structNode.name] = {}
                    typeName = ""
                    if isinstance(member.type.type, c_ast.Struct):
                        typeName = member.type.type.name
                    structDict[structNode.name][member.name] = typeName
        elif isinstance(node, c_ast.Typedef) and isinstance(node.type.type, c_ast.Enum):
            enumNode: c_ast.Enum = node.type.type
            for member in enumNode.values:
                enumList.append((member.name, member.value.value))
    for name in structDict:
        processStruct("", "", name, structDict, declareList)
    for k, v in enumList:
        declareList.append(f'    DECLARE("{k}", {v});')
    declares = "\n".join(declareList)
    template = f"""#include <stddef.h>
#include "mmbn.h"

#define DECLARE(SYM,VAL) __asm("__AS_DEFINE__ " SYM "\t%0" : : "n" ((unsigned long)(VAL)))

int main(void)
{{
{declares}
}}
"""
    with open(outFile, "w") as output:
        output.write(template)


if __name__ == "__main__":
    main()
