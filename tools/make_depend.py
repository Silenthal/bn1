#!/usr/bin/python3
import argparse
import os
from pathlib import Path


def get_obj_name(inPath):
    base = os.path.basename(inPath)
    root, _ = os.path.splitext(base)
    return root + ".o"


def get_src_name(inPath):
    return os.path.basename(inPath)


def get_dep_name(inPath):
    base = os.path.basename(inPath)
    return base + ".d"


def get_out_path(inPath, outDir):
    return Path(os.path.join(os.path.dirname(outDir), os.path.basename(inPath) + ".d"))


def main():
    parser = argparse.ArgumentParser(description='Creates dependencies.')
    parser.add_argument('outdir', type=str, help='The output directory.')
    parser.add_argument('input', type=str, help='The input file.')
    args = parser.parse_args()
    inPath = Path(args.input)
    outDir = Path(args.outdir)
    srcName = get_src_name(inPath)
    objName = get_obj_name(inPath)
    depName = get_dep_name(inPath)
    if not inPath.exists():
        exit(f"Could not find file {inPath}")
    files = set()
    with open(inPath, "r") as inFile:
        for line in inFile:
            ls = line.strip()
            if ls.startswith(".incbin"):
                tok = ls.split()
                files.add(tok[1].strip('",'))
    op = get_out_path(inPath, outDir)
    with open(op, "w") as outFile:
        slist = list(files)
        slist.sort()
        fileList = " ".join(slist)
        outFile.write(f"{objName} {depName}: {srcName} {fileList}\n\n")
        outFile.write("\n")


if __name__ == "__main__":
    main()
