import argparse
from pathlib import Path
from typing import BinaryIO, List

from common import auto_int, get_short, len_int


class GbaPal:
    def __init__(self, isHigh: bool = False, palette: List[List[int]] = []):
        self.hasHighBits = isHigh
        self.palette = palette

    def load(self, inFile: BinaryIO, count: int):
        self.palette = []
        self.isHigh = False
        for _ in range(count):
            col = get_short(inFile)
            colR = ((col >> 0) & 0x1F) * 8
            colG = ((col >> 5) & 0x1F) * 8
            colB = ((col >> 10) & 0x1F) * 8
            colX = (col >> 15) & 1
            self.isHigh |= colX != 0
            self.palette.append([colR, colG, colB, colX])

    def get_ext(self):
        return ".txt" if self.hasHighBits else ".pal"

    def as_text(self):
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
    inPath = Path(args.path)
    if not inPath.exists():
        exit(f"Couldn't find file {args.path}")
    palList: List[GbaPal] = []
    with open(inPath, mode="rb") as inFile:
        inFile.seek(args.offset)
        for _ in range(args.repeat):
            palList.append(get_pal(inFile, args.count))
    if args.repeat == 1:
        outPath = f"palette_{args.offset:07X}{palList[0].get_ext()}"
        with open(outPath, mode="w", encoding="utf-8") as outFile:
            outFile.write(palList[0].as_text())
    else:
        padLen = len_int(len(palList))
        outBase = f"palette_{args.offset:07X}"
        for i in range(args.repeat):
            suffix = f"{{0:0{padLen}}}".format(i)
            outPath = f"{outBase}_{suffix}{palList[i].get_ext()}"
            with open(outPath, mode="w", encoding="utf-8") as outFile:
                outFile.write(palList[i].as_text())


if __name__ == "__main__":
    main()
