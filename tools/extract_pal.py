#!/usr/bin/python3
import argparse
from pathlib import Path
from typing import BinaryIO

from common import auto_int, exit_error, get_short, len_int


class GbaPal:
    def __init__(self, isHigh: bool = False, palette: list[list[int]] = []):
        self.hasHighBits: bool = isHigh
        self.palette: list[list[int]] = palette

    @classmethod
    def create_from_file(cls, inFile: BinaryIO, count: int):
        palette = []
        hasHighBits = False
        for _ in range(count):
            col = get_short(inFile)
            colR = ((col >> 0) & 0x1F) * 8
            colG = ((col >> 5) & 0x1F) * 8
            colB = ((col >> 10) & 0x1F) * 8
            colX = (col >> 15) & 1
            hasHighBits |= colX != 0
            palette.append([colR, colG, colB, colX])
        return cls(hasHighBits, palette)

    def get_ext(self) -> str:
        return ".txt" if self.hasHighBits else ".pal"

    def as_text(self) -> str:
        count = len(self.palette)
        ret = ""
        if self.hasHighBits:
            ret += f"RGBX {count}\n"
            for pal in self.palette:
                ret += f"{pal[0]} {pal[1]} {pal[2]} {pal[3]}\n"
        else:
            ret += f"JASC-PAL\n0100\n{count}\n"
            for pal in self.palette:
                ret += f"{pal[0]} {pal[1]} {pal[2]}\n"
        return ret


def get_pal(inFile: BinaryIO, count: int) -> GbaPal:
    palette = []
    isHigh = False
    for _ in range(count):
        col = get_short(inFile)
        colR = ((col >> 0) & 0x1F) * 8
        colG = ((col >> 5) & 0x1F) * 8
        colB = ((col >> 10) & 0x1F) * 8
        colX = (col >> 15) & 1
        isHigh |= colX != 0
        palette.append([colR, colG, colB, colX])
    return GbaPal(isHigh, palette)


def main():
    parser = argparse.ArgumentParser(
        description="Extract 16-bit palette data from a GBA game."
    )
    parser.add_argument(
        "-o", "--output", type=str, default="", help="The output file base name."
    )
    parser.add_argument(
        "-n",
        "--count",
        type=auto_int,
        default=16,
        help="The amount of colors to extract.",
    )
    parser.add_argument(
        "-r",
        "--repeat",
        type=auto_int,
        default=1,
        help="Controls how many palettes to extract",
    )
    parser.add_argument("path", type=str, help="The path to the game.")
    parser.add_argument("offset", type=auto_int, help="The offset into the game.")
    args = parser.parse_args()
    if args.count <= 0:
        exit_error("Error: palette color count should be greater than 0.")
    if args.repeat <= 0:
        exit_error("Error: palette count should be greater than 0.")
    inPath = Path(args.path)
    if not inPath.exists():
        exit_error(f"Couldn't find file {args.path}")
    fileSize = inPath.stat().st_size
    if args.offset >= fileSize:
        exit_error(f"The given offset {args.offset} is greater than the file size {fileSize}")
    palByteCount =  args.repeat * args.count * 2
    if args.offset + palByteCount > fileSize:
        exit_error(f"Unable to extract {palByteCount} byte(s) of palette data at offset {args.offset} - file not large enough.")
    outBaseName = Path(args.output if args.output else f"palette_{args.offset:07X}")
    palList: list[GbaPal] = []
    with open(inPath, mode="rb") as inFile:
        inFile.seek(args.offset)
        for _ in range(args.repeat):
            palList.append(get_pal(inFile, args.count))
    if len(palList) > 0:
        if args.repeat == 1:
            outPath = f"{outBaseName}{palList[0].get_ext()}"
            with open(outPath, mode="w", encoding="utf-8") as outFile:
                outFile.write(palList[0].as_text())
        else:
            Path(outBaseName).mkdir(parents=True, exist_ok=True)
            padLen = len_int(len(palList))
            for i in range(args.repeat):
                suffix = f"{i:0{padLen}}"
                outPath = f"{outBaseName}/{suffix}{palList[i].get_ext()}"
                with open(outPath, mode="w", encoding="utf-8") as outFile:
                    outFile.write(palList[i].as_text())


if __name__ == "__main__":
    main()
