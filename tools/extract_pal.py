import argparse
import io
import os
import struct
from pathlib import Path

from common import auto_int, get_short


def main():
    parser = argparse.ArgumentParser(description='Extract 16-bit palette data from a GBA game.')
    parser.add_argument('-n', '--count', type=auto_int, default=16, help='The amount of colors to extract.')
    parser.add_argument('path', type=str, help='The path to the game.')
    parser.add_argument('offset', type=auto_int, help='The offset into the game.')
    args = parser.parse_args()
    inPath = Path(args.path)
    if not inPath.exists():
        exit(f"Couldn't find file {args.path}")
    outPath = "data.pal"
    with open(inPath, mode='rb') as inFile:
        with open(outPath, mode='w', encoding='utf-8') as outFile:
            inFile.seek(args.offset)
            outFile.write(f"JASC-PAL\n0100\n{args.count}\n")
            for _ in range(args.count):
                col = get_short(inFile)
                colR = (col & 0x1F) * 8
                colG = ((col >> 5) & 0x1F) * 8
                colB = ((col >> 10) & 0x1F) * 8
                outFile.write(f"{colR} {colG} {colB}\n")


if __name__ == "__main__":
    main()
