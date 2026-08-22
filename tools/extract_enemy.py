#!/usr/bin/python3
import argparse
from pathlib import Path
from typing import BinaryIO

import common
from common import auto_int, exit_error, get_byte, get_int, get_short


def bytelist(inFile: BinaryIO, count: int) -> str:
    if count > 0:
        b = inFile.read(count)
        return ".byte " + ", ".join([f"0x{x:X}" for x in b])
    else:
        return ""


def reward(val):
    return (
        f"zenny {val & 0x7FFF}"
        if val & 0x8000 != 0
        else f"battlechip {common.chip_id(val & 0xFF)} {common.chip_code(val >> 8)}"
    )


def element(inFile: BinaryIO) -> str:
    elem = get_byte(inFile)
    if elem == 0:
        return "noelement"
    else:
        return f"element {common.element(elem)}"


def main():
    parser = argparse.ArgumentParser(
        description="Extract enemy data from Mega Man Battle Network."
    )
    parser.add_argument(
        "-eo",
        "--enemy-offset",
        type=auto_int,
        default=0x9DD4,
        help="The offset to start reading from.",
    )
    parser.add_argument(
        "-n",
        "--count",
        type=auto_int,
        default=161,
        help="The amount of enemy data to extract.",
    )
    parser.add_argument(
        "-o", "--output", type=str, default="", help="The output file name."
    )
    parser.add_argument("path", type=str, help="The path to the game.")
    args = parser.parse_args()
    inPath = Path(args.path)
    if not inPath.exists():
        exit_error(f"Couldn't find file {args.path}")
    outPath = "enemy_data.txt" if args.output == "" else args.output
    with open(inPath, mode="rb") as inFile, open(outPath, mode="w", encoding="utf-8") as outFile:
        inFile.seek(args.enemy_offset)
        for i in range(args.count):
            outFile.write(f"    @ {i} | {common.enemy_id(i)}\n")
            outFile.write(f"    hp {get_short(inFile)}\n")
            outFile.write(f"    {element(inFile)}\n")
            outFile.write(f"    hp_pos {get_byte(inFile)}\n")
            outFile.write(f"    routine 0x{get_byte(inFile):X}\n")
            outFile.write(f"    lzSprite 0x{get_byte(inFile):X}\n")
            outFile.write(f"    .short 0x{get_short(inFile):X}\n")
            outFile.write(f"    .word 0x{get_int(inFile):X}\n")
            outFile.writelines(f"    {reward(get_short(inFile))}\n" for _ in range(10))


if __name__ == "__main__":
    main()
