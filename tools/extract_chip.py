import argparse
from pathlib import Path
from typing import BinaryIO

import common
from common import auto_int, get_byte, get_int, get_short


def bytelist(inFile: BinaryIO, count: int) -> str:
    if count > 0:
        b = inFile.read(count)
        return ".byte " + ", ".join([f"0x{x:X}" for x in b])
    else:
        return ""


def codes(inFile: BinaryIO) -> str:
    codeList = [common.chip_code(get_byte(inFile)) for _ in range(5)]
    while len(codeList) > 0 and codeList[-1] == "None":
        codeList.pop()
    if len(codeList) == 0:
        return "nocodes"
    else:
        return "codes " + ", ".join(codeList)


def element(inFile: BinaryIO) -> str:
    elem = get_byte(inFile)
    if elem == 0:
        return "noelement"
    else:
        return f"element {common.element(elem)}"


def family(inFile: BinaryIO) -> str:
    fam = get_byte(inFile)
    sub = get_byte(inFile)
    if fam == 255 and sub == 0:
        return "nofamily"
    else:
        return f"family {fam >> 2}, {sub}"


def rarity(inFile: BinaryIO) -> str:
    rarity = get_byte(inFile)
    if rarity == 255:
        return "norarity"
    else:
        return f"rarity {rarity}"


def library(inFile: BinaryIO) -> str:
    library = get_byte(inFile)
    if library == 255:
        return "nolibrary"
    else:
        return f"library {library}"


def main():
    parser = argparse.ArgumentParser(description='Extract chip data from Mega Man Battle Network.')
    parser.add_argument('-co', '--chip-offset', type=auto_int, default=0x7D70, help='The offset to start reading from.')
    parser.add_argument('-cao', '--chip-art-offset', type=auto_int, default=0x647AFC, help='The offset to the start of the chip art.')
    parser.add_argument('-n', '--count', type=auto_int, default=240, help='The amount of chip data to extract.')
    parser.add_argument('-o', '--output', type=str, default="", help='The output file name.')
    parser.add_argument('path', type=str, help='The path to the game.')
    args = parser.parse_args()
    inPath = Path(args.path)
    if not inPath.exists():
        exit(f"Couldn't find file {args.path}")
    outPath = f"chip_data.txt" if args.output == "" else args.output
    with open(inPath, mode='rb') as inFile:
        with open(outPath, mode='w', encoding='utf-8') as outFile:
            inFile.seek(args.chip_offset)
            for i in range(args.count):
                outFile.write(f"    _{i}: @ {common.chip_id(i)}\n")
                outFile.write(f"        {codes(inFile)}\n")
                outFile.write(f"        {element(inFile)}\n")
                outFile.write(f"        {family(inFile)}\n")
                outFile.write(f"        {rarity(inFile)}\n")
                outFile.write(f"        {library(inFile)}\n")
                outFile.write(f"        {bytelist(inFile, 2)}\n")
                outFile.write(f"        damage {get_short(inFile)}\n")
                outFile.write(f"        {bytelist(inFile, 2)}\n")
                _ = get_int(inFile)
                outFile.write(f"        chip_icon {i}\n")
                chip_off = get_int(inFile) - 0x8000000
                chip_index = (chip_off - args.chip_art_offset) // (8 *7 * 32)
                _ = get_int(inFile)
                outFile.write(f"        chip_art {chip_index}\n")


if __name__ == "__main__":
    main()
