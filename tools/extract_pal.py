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
    palette = []
    isHigh = False
    with open(inPath, mode='rb') as inFile:
        inFile.seek(args.offset)
        for _ in range(args.count):
            col = get_short(inFile)
            colR = ((col >>  0) & 0x1F) * 8
            colG = ((col >>  5) & 0x1F) * 8
            colB = ((col >> 10) & 0x1F) * 8
            colX = ((col >> 15) &    1)
            isHigh |= colX != 0
            palette.append([str(colR), str(colG), str(colB), str(colX)])
    outPath = f"palette_{args.offset:07X}." + ("txt" if isHigh else "pal")
    with open(outPath, mode='w', encoding='utf-8') as outFile:
        if isHigh:
            outFile.write(f"RGBX {args.count}\n")
        else:
            outFile.write(f"JASC-PAL\n0100\n{args.count}\n")
        for pal in palette:
            if isHigh:
                outFile.write(" ".join(pal) + "\n")
            else:
                outFile.write(f"{pal[0]} {pal[1]} {pal[2]}\n")


if __name__ == "__main__":
    main()
