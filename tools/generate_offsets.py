#!/usr/bin/python3
import argparse
from pathlib import Path
from pycparser import parse_file
from pycparser.ast_transforms import c_ast

def main():
    parser = argparse.ArgumentParser(description='Creates a source file containing offsets for structs and enum values.')
    parser.add_argument('-o', '--output', type=str, help='The path to the output file.')
    parser.add_argument('header', type=str, help='The path to the header file.')
    args = parser.parse_args()
    outFile: Path = Path(args.output)
    headFile: Path = Path(args.header)
    if not Path.exists(headFile):
        exit(f"File {headFile} not found")
    ast = parse_file(headFile, True)
    declareList: list[str] = []
    for node in ast.ext:
        if isinstance(node, c_ast.Decl) and isinstance(node.type, c_ast.Struct):
            structNode: c_ast.Struct = node.type
            for member in structNode.decls:
                if not member.bitsize:
                    declareList.append(f'    DECLARE("{structNode.name}_{member.name}", offsetof({structNode.name}, {member.name}));')
        elif isinstance(node, c_ast.Typedef) and isinstance(node.type.type, c_ast.Enum):
            enumNode: c_ast.Enum = node.type.type
            for member in enumNode.values:
                declareList.append(f'    DECLARE("{member.name}", {member.value.value});')
    declares = "\n".join(declareList)
    template = f'''#include <stddef.h>
#include "mmbn.h"

#define DECLARE(SYM,VAL) __asm("__AS_DEFINE__ " SYM "\t%0" : : "n" ((unsigned long)(VAL)))

int main(void)
{{
{declares}
}}
'''
    with open(outFile, "w") as output:
        output.write(template)


if __name__ == "__main__":
    main()
