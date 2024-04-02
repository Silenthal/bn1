#!/usr/bin/python3
import argparse
import io
from pathlib import Path
from typing import BinaryIO

from common import auto_int, get_int


def fix(num: int):
    flt = num / 0x10000
    if flt >= 0x8000:
        flt -= 0x10000
    return flt


def extract_entity(inFile: BinaryIO):
    etypeList = {0: "PlayerLocation", 1: "Actor", 2: "Attack", 3: "Effect", 4: "NPC"}
    out = f"EntityAllocParams_{inFile.tell() + 0x8000000:08X}:\n"
    while True:
        v0 = get_int(inFile)
        if v0 == 0xFF:
            out += "    .word 0xFF\n\n"
            break
        etype = v0 & 0xFF
        if etype not in etypeList:
            inFile.seek(-4, io.SEEK_CUR)
            break
        param0 = (v0 >> 8) & 0xFF
        x = fix(get_int(inFile))
        y = fix(get_int(inFile))
        z = fix(get_int(inFile))
        fm = get_int(inFile)
        out += f"    entity {etypeList[etype]}, 0x{param0:X}, f({x:g}, {y:g}, {z:g}), 0x{fm:X}\n"
    return out


def main():
    parser = argparse.ArgumentParser(
        description="Extract enemy data from Mega Man Battle Network."
    )
    parser.add_argument(
        "-o", "--output", type=str, default="", help="The output file name."
    )
    parser.add_argument("path", type=str, help="The path to the binary.")
    parser.add_argument("offset", type=auto_int, help="The offset into the binary.")
    args = parser.parse_args()
    inPath = Path(args.path)
    if not inPath.exists():
        exit(f"Couldn't find file {args.path}")
    fileOffset = args.offset
    fileSize = inPath.stat().st_size
    if fileOffset >= fileSize:
        exit(f"File offset {fileOffset} is greater than the size of the file {inPath}")
    outPath = Path(args.output if args.output else f"{fileOffset:08x}.txt")
    with open(inPath, mode="rb") as inFile:
        inFile.seek(fileOffset)
        with open(outPath, "w") as outFile:
            outFile.write(extract_entity(inFile))


if __name__ == "__main__":
    main()
