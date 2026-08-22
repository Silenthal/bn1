#!/usr/bin/python3
import argparse
from pathlib import Path
from typing import BinaryIO

from common import auto_int, direction, exit_error, get_byte, get_int, get_short, map_id


def fix(num: int):
    flt = num / 0x10000
    if flt >= 0x8000:
        flt -= 0x10000
    return flt


def get_offset_list(inFile: BinaryIO) -> list[int]:
    offsetList = []
    while True:
        if inFile.tell() in offsetList:
            break
        off = get_int(inFile)
        if off != 0:
            off -= 0x8000000
        offsetList.append(off)
    return offsetList


def extract_exit_list(label: str, inFile: BinaryIO) -> str:
    offsetlist = []
    output = label + ":\n"
    offsetlist = get_offset_list(inFile)
    for off in offsetlist:
        if off == 0:
            output += "    .word 0\n"
        else:
            output += f"    .word MapExitList_{off + 0x8000000:08X}\n"
    while True:
        if inFile.tell() in offsetlist:
            output += f"MapExitList_{inFile.tell() + 0x8000000:08X}:\n"
            offsetlist.remove(inFile.tell())
        id = map_id(get_short(inFile))
        if id.startswith("0x"):
            break
        _ = get_byte(inFile)
        dir = get_byte(inFile)
        x = fix(get_int(inFile))
        y = fix(get_int(inFile))
        z = fix(get_int(inFile))
        output += f"    MapEntrance {id}, {direction(dir)}, f({x:g}, {y:g}, {z:g})\n"
    return output


def main():
    parser = argparse.ArgumentParser(description="Extract map exit data.")
    parser.add_argument(
        "-o", "--output", type=str, default="", help="The output file name."
    )
    parser.add_argument(
        "-l", "--label", type=str, default="", help="The label for the generated code."
    )
    parser.add_argument("path", type=str, help="The path to the binary.")
    parser.add_argument("offset", type=auto_int, help="The offset into the binary.")
    args = parser.parse_args()
    inPath = Path(args.path)
    if not inPath.exists():
        exit_error(f"Couldn't find file {args.path}")
    fileOffset = args.offset
    fileSize = inPath.stat().st_size
    if fileOffset >= fileSize:
        exit_error(f"File offset {fileOffset} is greater than the size of the file {inPath}")
    label = args.label if args.label else f"MapExitList_{fileOffset:08X}"
    outPath = Path(args.output if args.output else f"{fileOffset:08x}.txt")
    with open(inPath, mode="rb") as inFile:
        inFile.seek(fileOffset)
        result = extract_exit_list(label, inFile)
        with open(outPath, "w") as outFile:
            outFile.write(result)


if __name__ == "__main__":
    main()
